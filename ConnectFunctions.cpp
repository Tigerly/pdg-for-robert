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


ArgumentWrapper* getArgWrapper(FunctionWrapper *funcW, Argument *arg){
  for(list<ArgumentWrapper*>::iterator argWI = funcW->getArgWList().begin(),
	argWE = funcW->getArgWList().end(); argWI != argWE; ++argWI){
    if( (*argWI)->getArg() == arg)
      return *argWI;
  }
  return nullptr;
}

int buildTypeTree(Argument *arg, TypeWrapper *tyW, TreeType treeTy){
  
  
  errs() << "\n" << "buildTypeTree in TIME: " << "\n";

  if(arg == nullptr){
    // errs() << "In buildTypeTree, incomming arg is a nullptr\n";
    return NULLPTR;
  }
  //kinds of complex processing happen when pointers come(recursion, FILE*, )...
  if(tyW->getType()->isPointerTy()){
    //   errs() << "IN buildTypeTree, ty = "<< *tyW->getType() << "is a pointer type. arg_addr = " << arg << " *arg = " << *arg << "\n";
    //errs() << "NumContainedTypes = " << tyW->getType()->getContainedType(0)->getNumContainedTypes() << "\n";

    //find inserting loction
    tree<InstructionWrapper*>::iterator insert_loc;

    ArgumentWrapper *pArgW = getArgWrapper(FunctionWrapper::funcMap[arg->getParent()], arg);

    if(pArgW == nullptr){
      errs() << "getArgWrapper returns a NULL pointer!" << "\n";
      return NULLPTR;
    }
    else{
      if(pArgW->getArg() == arg){
	
	//check historic record of recursive types to avoid redundant processing tree node
	if(recursive_types.find(tyW->getType()) != recursive_types.end() ){
	  //	  errs() << *tyW->getType() << " is a recursive type found in historic record!\n ";
	  return RECURSIVE_TYPE;
	}


	for(tree<InstructionWrapper*>::iterator treeIt = pArgW->getTree(treeTy).begin(), 
	      treeE = pArgW->getTree(treeTy).end(); treeIt != treeE; ++treeIt){
	  if((*treeIt)->getFieldId() == tyW->getId()){
	    insert_loc = treeIt;
	    break;
	  }
	}//end for tree iteration

	//if ty is a pointer, its containedType [ty->getContainedType(0)] means the type ty points to
	for(unsigned int i = 0; i < tyW->getType()->getContainedType(0)->getNumContainedTypes(); i++){
	  //	  errs() << "DEBUG tyW->getType : " << *tyW->getType() << "\n";
	  //  errs() << " DEBUG LINE 55 containedType " << i << " " << *tyW->getType()->getContainedType(0)->getContainedType(i) << "\n";

	  TypeWrapper *tempTyW = new TypeWrapper(tyW->getType()->getContainedType(0)->getContainedType(i),id);
	  InstructionWrapper *typeFieldW = new InstructionWrapper(arg->getParent(),arg,tempTyW->getType(),id++,PARAMETER_FIELD);
	  InstructionWrapper::nodes.insert(typeFieldW);

	  //	  errs() << "ConnectFunctions DEBUG 81 entree " << tempTyW->getType() << " " << *tempTyW->getType() << "\n";

	  pArgW->getTree(treeTy).append_child(insert_loc,typeFieldW);
	  
	  //recursion, e.g. linked list
	  //    	  if(tempTyW->getType() == tyW->getType())
	  //  continue;
	  
	  //do backtracking along the path until reaching the root, if we can find an type that appears before, 
	  //use 1-limit to break the tree construction
	  //	  errs() << "do backtracking along the path from current type to the root\n";
	  //	  errs() << "insert_loc depth = " << pArgW->getTree(treeTy).depth(insert_loc) << "\n";
	  //when insert_loc is not the root, it means we need to do backtracking the check recursion



	  if(pArgW->getTree(treeTy).depth(insert_loc) != 0){
	    
	    bool recursion_flag = false;
	    tree<InstructionWrapper*>::iterator backTreeIt = pArgW->getTree(treeTy).parent(insert_loc);
	    //	    errs() << "initial backTreeIt's type = " << *(*backTreeIt)->getFieldType() << "\n";

	    while(pArgW->getTree(treeTy).depth(backTreeIt) != 0){

	      backTreeIt = pArgW->getTree(treeTy).parent(backTreeIt);

	      if((*insert_loc)->getFieldType() == (*backTreeIt)->getFieldType()){
		//		errs() << "Tree Type = " << treeTy << " recursive type = " << *(*backTreeIt)->getFieldType() << "\n";
		recursion_flag = true;

		recursive_types.insert((*insert_loc)->getFieldType());
		//		errs() << "DEBUG 112 after pArgW insertion ,size = " << recursive_types.size() << "\n";
		break;
	      }
	    }
	    if(recursion_flag == true){//process next contained type, because this type brings in a recursion
	      //	      errs() << "In Function: " << arg->getParent()->getName() << " recursion found in parameter tree! Process next field\n";
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
		//	errs() << "DEBUG 84, in child fileds buildTypeTree: OS.str() = " << OS.str() << " FILE* appears, stop buildTypeTree\n";     
		continue;
	      }
	    }
	  }//end function ptr, FILE*, complex composite struct...

	  buildTypeTree(arg, tempTyW, treeTy);
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
  else
    buildTypeTree(arg, tyW, treeTy);

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
  else
    buildTypeTree(arg, tyW, treeTy);

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
