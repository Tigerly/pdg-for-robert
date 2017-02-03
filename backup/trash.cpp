
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



ArgumentWrapper* getArgWrapperFromCallInst(CallWrapper *callW, Argument *arg){
  for(list<ArgumentWrapper*>::iterator argWI = callW->getArgWList().begin(),
	argWE = callW->getArgWList().end(); argWI != argWE; ++argWI){
    if( (*argWI)->getArg() == arg)
      return *argWI;
  }
  return nullptr;
}
