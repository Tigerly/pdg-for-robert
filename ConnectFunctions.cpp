/** ---*- C++ -*--- ConnectFunctions.cpp --------------------------
 * This cpp file implements some functions for connecting callers and callees, using parameter trees.
 *
 */

#include "ConnectFunctions.h"

#define SUCCEED 0
#define NULLPTR 1
#define RECURSIVE_TYPE 2

static int id = 0;
static int debug_id = 0;
//static int debug_id = 0


static std::set<Type*> recursive_types;
static std::set<Type*> unseparated_types;


ArgumentWrapper* getArgWrapperFromFunction(FunctionWrapper *funcW, Argument *arg){
  for(list<ArgumentWrapper*>::iterator argWI = funcW->getArgWList().begin(),
	argWE = funcW->getArgWList().end(); argWI != argWE; ++argWI){
    if( (*argWI)->getArg() == arg)
      return *argWI;
  }
  return nullptr;
}

ArgumentWrapper* getArgWrapperFromCallInst(CallWrapper *callW, Argument *arg){
  for(list<ArgumentWrapper*>::iterator argWI = callW->getArgWList().begin(),
	argWE = callW->getArgWList().end(); argWI != argWE; ++argWI){
    if( (*argWI)->getArg() == arg)
      return *argWI;
  }
  return nullptr;
}


int buildFormalTypeTree(Argument *arg, TypeWrapper *tyW, TreeType treeTy){

  if(arg == nullptr){
    errs() << "In buildTypeTree, incomming arg is a nullptr\n";
    return NULLPTR;
  }
  //kinds of complex processing happen when pointers come(recursion, FILE*, )...
  if(tyW->getType()->isPointerTy()){
    //find inserting loction
    tree<InstructionWrapper*>::iterator insert_loc;
    
    ArgumentWrapper *pArgW = getArgWrapperFromFunction(FunctionWrapper::funcMap[arg->getParent()], arg);

    if(pArgW == nullptr){
      errs() << "getArgWrapper returns a NULL pointer!" << "\n";
      return NULLPTR;
    }
    else{
      if(pArgW->getArg() == arg){	

	//TODO: find a better way to do optimization, this way sucks, check historic record of recursive types to avoid redundant processing tree node
	/*
	if(recursive_types.find(tyW->getType()) != recursive_types.end() ){
	  //	  errs() << *tyW->getType() << " is a recursive type found in historic record!\n ";
	  return RECURSIVE_TYPE;
	  }*/

	for(tree<InstructionWrapper*>::iterator treeIt = pArgW->getTree(treeTy).begin(), 
	      treeE = pArgW->getTree(treeTy).end(); treeIt != treeE; ++treeIt){
	  if((*treeIt)->getFieldId() == tyW->getId()){
	    insert_loc = treeIt;
	    break;
	  }
	}//end for tree iteration

	//if ty is a pointer, its containedType [ty->getContainedType(0)] means the type ty points to
	for(unsigned int i = 0; i < tyW->getType()->getContainedType(0)->getNumContainedTypes(); i++){

	  TypeWrapper *tempTyW = new TypeWrapper(tyW->getType()->getContainedType(0)->getContainedType(i),id);
	  InstructionWrapper *typeFieldW = new InstructionWrapper(arg->getParent(),arg,tempTyW->getType(),id++,PARAMETER_FIELD);
	  InstructionWrapper::nodes.insert(typeFieldW);

	  pArgW->getTree(treeTy).append_child(insert_loc,typeFieldW);

	  //recursion, e.g. linked list, do backtracking along the path until reaching the root, if we can find an type that appears before, 
	  //use 1-limit to break the tree construction when insert_loc is not the root, it means we need to do backtracking the check recursion

	  if(pArgW->getTree(treeTy).depth(insert_loc) != 0){
	    
	    bool recursion_flag = false;
	    tree<InstructionWrapper*>::iterator backTreeIt = pArgW->getTree(treeTy).parent(insert_loc);

	    while(pArgW->getTree(treeTy).depth(backTreeIt) != 0){

	      backTreeIt = pArgW->getTree(treeTy).parent(backTreeIt);

	      if((*insert_loc)->getFieldType() == (*backTreeIt)->getFieldType()){
		recursion_flag = true;
		//		recursive_types.insert((*insert_loc)->getFieldType());
		break;
	      }
	    }
	    if(recursion_flag == true){//process next contained type, because this type brings in a recursion
	      continue;
	    }
	  }

	  //function ptr, FILE*, complex composite struct...
	  if(tempTyW->getType()->isPointerTy()){
	    //if field is a function Ptr
	    if(tempTyW->getType()->getContainedType(0)->isFunctionTy()){
	      string Str;
	      raw_string_ostream OS(Str);
	      OS << *tempTyW->getType();

	      //if not in the unseparated_types yet, add this type into the record 
	      if(unseparated_types.find(tempTyW->getType()) == unseparated_types.end()){
		unseparated_types.insert(tempTyW->getType());
	      }

	      continue;
	    }

	    if(tempTyW->getType()->getContainedType(0)->isStructTy()){
	      string Str;
	      raw_string_ostream OS(Str);
	      OS << *tempTyW->getType();
	      //FILE*, bypass, no need to buildTypeTree
	      if("%struct._IO_FILE*" == OS.str() || "%struct._IO_marker*" == OS.str()){	
		if(unseparated_types.find(tempTyW->getType()) == unseparated_types.end()){
		  unseparated_types.insert(tempTyW->getType());
		}
		continue;
	      }
	    }
	  }//end function ptr, FILE*, complex composite struct...

	  buildFormalTypeTree(arg, tempTyW, treeTy);
	}//end for ty getContainedType
      }// end if pArgW->getArg() == arg
    }// end else (pArgW != nullptr)

  }//end if isPointerTy

  else{
    if(arg != nullptr)
      // errs() << *tyW->getType() << " is a Non-pointer type. arg = " << *arg << "\n";
      ;
    else
      errs() << "arg is nullptr!\n";
  }   
  return SUCCEED;
}



int buildActualTypeTree(Argument *arg, TypeWrapper *tyW, TreeType treeTy, CallInst *CI){

  if(arg == nullptr){
    errs() << "In buildActualTypeTree, incomming arg is a nullptr\n";
    return NULLPTR;
  }
  //kinds of complex processing happen when pointers come(recursion, FILE*, )...
  if(tyW->getType()->isPointerTy()){
    //find inserting loction
    tree<InstructionWrapper*>::iterator insert_loc;
    
    ArgumentWrapper *pArgW = getArgWrapperFromCallInst(CallWrapper::callMap[CI], arg);

    if(pArgW == nullptr){
      errs() << "getArgWrapper returns a NULL pointer!" << "\n";
      return NULLPTR;
    }
    else{
      if(pArgW->getArg() == arg){	

	//check historic record of recursive types to avoid redundant processing tree node
	/*	if(recursive_types.find(tyW->getType()) != recursive_types.end() ){
	  //	  errs() << *tyW->getType() << " is a recursive type found in historic record!\n ";
	  return RECURSIVE_TYPE;
	  }*/

	for(tree<InstructionWrapper*>::iterator treeIt = pArgW->getTree(treeTy).begin(), 
	      treeE = pArgW->getTree(treeTy).end(); treeIt != treeE; ++treeIt){
	  if((*treeIt)->getFieldId() == tyW->getId()){
	    insert_loc = treeIt;
	    break;
	  }
	}//end for tree iteration

	//if ty is a pointer, its containedType [ty->getContainedType(0)] means the type ty points to
	for(unsigned int i = 0; i < tyW->getType()->getContainedType(0)->getNumContainedTypes(); i++){

	  TypeWrapper *tempTyW = new TypeWrapper(tyW->getType()->getContainedType(0)->getContainedType(i),id);
	  InstructionWrapper *typeFieldW = new InstructionWrapper(arg->getParent(),arg,tempTyW->getType(),id++,PARAMETER_FIELD);
	  InstructionWrapper::nodes.insert(typeFieldW);

	  pArgW->getTree(treeTy).append_child(insert_loc,typeFieldW);

	  //recursion, e.g. linked list, do backtracking along the path until reaching the root, if we can find an type that appears before, 
	  //use 1-limit to break the tree construction when insert_loc is not the root, it means we need to do backtracking the check recursion

	  if(pArgW->getTree(treeTy).depth(insert_loc) != 0){
	    
	    bool recursion_flag = false;
	    tree<InstructionWrapper*>::iterator backTreeIt = pArgW->getTree(treeTy).parent(insert_loc);

	    while(pArgW->getTree(treeTy).depth(backTreeIt) != 0){

	      backTreeIt = pArgW->getTree(treeTy).parent(backTreeIt);

	      if((*insert_loc)->getFieldType() == (*backTreeIt)->getFieldType()){
		recursion_flag = true;
		//	recursive_types.insert((*insert_loc)->getFieldType());
		break;
	      }
	    }
	    if(recursion_flag == true){//process next contained type, because this type brings in a recursion
	      continue;
	    }
	  }

	  //function ptr, FILE*, complex composite struct...
	  if(tempTyW->getType()->isPointerTy()){
	    //if field is a function Ptr
	    if(tempTyW->getType()->getContainedType(0)->isFunctionTy()){
	      string Str;
	      raw_string_ostream OS(Str);
	      OS << *tempTyW->getType();
	      //  errs() << "DEBUG LINE 74 FunctionType : " << OS.str() << "\n";
	      continue;
	    }

	    if(tempTyW->getType()->getContainedType(0)->isStructTy()){
	      string Str;
	      raw_string_ostream OS(Str);
	      OS << *tempTyW->getType();
	      //FILE*, bypass, no need to buildTypeTree
	      if("%struct._IO_FILE*" == OS.str() || "%struct._IO_marker*" == OS.str()){
		continue;
	      }
	    }
	  }//end function ptr, FILE*, complex composite struct...

	  buildActualTypeTree(arg, tempTyW, treeTy, CI);
	}//end for ty getContainedType
      }// end if pArgW->getArg() == arg
    }// end else (pArgW != nullptr)

  }//end if isPointerTy

  else{
    if(arg != nullptr)
      // errs() << *tyW->getType() << " is a Non-pointer type. arg = " << *arg << "\n";
      ;
    else
      errs() << "arg is nullptr!\n";
  }   
  return SUCCEED;
}




//build formal in/out tree for each argument in function body(funcMap)
void buildFormalTree(Argument *arg, TreeType treeTy){

  InstructionWrapper *treeTyW = nullptr;

  switch(treeTy){

  case FORMAL_IN_TREE:{
    treeTyW = new InstructionWrapper(arg->getParent(), arg, arg->getType(), id, FORMAL_IN);
    break;
  }
  case FORMAL_OUT_TREE:{
    treeTyW = new InstructionWrapper(arg->getParent(), arg, arg->getType(), id, FORMAL_OUT);
    break;
  }  
  default:
    errs() << "Wrong TreeType input! \n";
    exit(1);
  }

  if(treeTyW != nullptr)
    InstructionWrapper::nodes.insert(treeTyW);
  else{
    errs() << "treeTyW is a null pointer!" <<"\n";
    exit(1);
  }

  //find the right arg, and set tree root
  list<ArgumentWrapper*>::iterator argWLoc;

  //find root node for formal trees(funcMap)
  for(list<ArgumentWrapper*>::iterator argWI = FunctionWrapper::funcMap[arg->getParent()]->getArgWList().begin(),
	argWE = FunctionWrapper::funcMap[arg->getParent()]->getArgWList().end(); argWI != argWE; ++argWI){
    if((*argWI)->getArg() == arg)
      argWLoc = argWI;
  }  

  tree<InstructionWrapper*>::iterator treeRoot = (*argWLoc)->getTree(treeTy).set_head(treeTyW);  

  TypeWrapper *tyW = new TypeWrapper(arg->getType(),id++);

  //TODO: function ptr case...
  //avoid FILE* 
  string Str;
  raw_string_ostream OS(Str);
  OS << *tyW->getType();
  //FILE*, bypass, no need to buildTypeTree
  if("%struct._IO_FILE*" == OS.str() || "%struct._IO_marker*" == OS.str()){
    errs() << "OS.str() = " << OS.str() << " FILE* appears, stop buildTypeTree\n";      
  }
  else if(tyW->getType()->isPointerTy() && tyW->getType()->getContainedType(0)->isFunctionTy()){
    errs() << "DEBUG 312: buildFormalTree: function pointer arg = " << *tyW->getType() << "\n";
  }
  else
    buildFormalTypeTree(arg, tyW, treeTy);

  id = 0;
}



void buildActualTree(CallInst* CI, Argument *arg, TreeType treeTy){

  InstructionWrapper *treeTyW = nullptr;

  switch(treeTy){
  case ACTUAL_IN_TREE:{
    treeTyW = new InstructionWrapper(arg->getParent(), arg, arg->getType(), id, ACTUAL_IN);
    break;
  }
  case ACTUAL_OUT_TREE:{
    treeTyW = new InstructionWrapper(arg->getParent(), arg, arg->getType(), id, ACTUAL_OUT);
    break;
  }
  default:
    errs() << "Wrong TreeType input! \n";
    exit(1);
  }

  if(treeTyW != nullptr)
    InstructionWrapper::nodes.insert(treeTyW);
  else{
    errs() << "treeTyW is a null pointer!" <<"\n";
    exit(1);
  }

  //find the right arg, and set tree root
  list<ArgumentWrapper*>::iterator argWLoc;

  //find root node for actual trees(callMap)
  for(list<ArgumentWrapper*>::iterator argWI = CallWrapper::callMap[CI]->getArgWList().begin(),
	argWE = CallWrapper::callMap[CI]->getArgWList().end(); argWI != argWE; ++argWI){
    if((*argWI)->getArg() == arg)
      argWLoc = argWI;
  }

  tree<InstructionWrapper*>::iterator treeRoot = (*argWLoc)->getTree(treeTy).set_head(treeTyW);  
  //  (*argWI)->getTree(treeTy).insert(treeRoot, treeTyW);

  TypeWrapper *tyW = new TypeWrapper(arg->getType(),id++);

  //TODO: function ptr case...
  //avoid FILE* 
  string Str;
  raw_string_ostream OS(Str);
  OS << *tyW->getType();
  //FILE*, bypass, no need to buildTypeTree
  if("%struct._IO_FILE*" == OS.str() || "%struct._IO_marker*" == OS.str()){
    errs() << "OS.str() = " << OS.str() << " FILE* appears, stop buildTypeTree\n";      
  }
  else if(tyW->getType()->isPointerTy() && tyW->getType()->getContainedType(0)->isFunctionTy()){
    errs() << "DEBUG 312: buildActualTree: function pointer arg = " << *tyW->getType() << "\n";
  }
  else
    buildActualTypeTree(arg, tyW, treeTy, CI);

  id = 0;
}


//build formal trees for each function
void buildFormalParameterTrees(Function* callee){

  // sequentially set up parameter trees for the each argument 		  
  std::list<ArgumentWrapper*>::iterator argI = 
    FunctionWrapper::funcMap[callee]->getArgWList().begin();
  std::list<ArgumentWrapper*>::iterator argE = 
    FunctionWrapper::funcMap[callee]->getArgWList().end();
    
  for(; argI != argE; ++argI){
    buildFormalTree((*argI)->getArg(), FORMAL_IN_TREE);
    buildFormalTree((*argI)->getArg(), FORMAL_OUT_TREE); 
  }

  FunctionWrapper::funcMap[callee]->setTreeFlag(true);
}


//build actual trees for each call instruction
void buildActualParameterTrees(CallInst *CI){

  Function *callee = CI->getCalledFunction();

  std::list<ArgumentWrapper*>::iterator argI = 
    CallWrapper::callMap[CI]->getArgWList().begin();
  std::list<ArgumentWrapper*>::iterator argE = 
    CallWrapper::callMap[CI]->getArgWList().end();
   
  for(; argI != argE; ++argI){
    buildActualTree(CI, (*argI)->getArg(), ACTUAL_IN_TREE);
    buildActualTree(CI, (*argI)->getArg(), ACTUAL_OUT_TREE); 
  }
}
