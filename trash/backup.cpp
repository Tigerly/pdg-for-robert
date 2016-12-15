      /* LINE 628
	if(true != DNode->getDependencyList()[i].first->getData()->getFlag()){

	//	if(DNode->getDependencyList()[i] == nullptr) errs() << "DNode null!\n";

	queue.push_back(DNode->getDependencyList()[i].first->getData());
	}*/


  /*
    	DependencyNode<InstructionWrapper>* DNode = PDG->getNodeByData(InstW);
	errs() << "global sensitive adjacent list size = " << DNode->getDependencyList().size() << "\n";
	for(int i = 0; i < DNode->getDependencyList().size(); i++){
	  if(true != DNode->getDependencyList()[i].first->getData()->getFlag()){
	    //enqueue
	    queue.push_back(DNode->getDependencyList()[i].first->getData());

	    InstructionWrapper *adjacent_InstW = 
	      *InstructionWrapper::nodes.find(const_cast<InstructionWrapper*>(DNode->getDependencyList()[i].first->getData())); 
	    adjacent_InstW->setFlag(true);
	  }		
	}//end for i = 0; DNode...
  */


#if 0
  //worklist algorithm
  std::deque<const InstructionWrapper*> queue;

  for(std::set<InstructionWrapper*>::iterator nodeIt = InstructionWrapper::nodes.begin();
      nodeIt != InstructionWrapper::nodes.end(); ++nodeIt){
    InstructionWrapper *InstW = *nodeIt;
    Instruction *pInstruction = InstW->getInstruction();

    //global value
    if(InstW->getType() == GLOBAL_VALUE){
      GlobalValue *gv = dyn_cast<GlobalValue>(InstW->getValue());
	
      //if gv is sensitive(inside senGlobalSet)
      if(senGlobalSet.end() != senGlobalSet.find(gv)){
	errs() << *gv << "is in sensitive!\n";
	DependencyNode<InstructionWrapper>* DNode = PDG->getNodeByData(InstW);

	errs() << "global sensitive adjacent list size = " << DNode->getDependencyList().size() << "\n";

	for(int i = 0; i < DNode->getDependencyList().size(); i++){
	  if(true != DNode->getDependencyList()[i].first->getData()->getFlag()){
	    //enqueue
	    queue.push_back(DNode->getDependencyList()[i].first->getData());

	    InstructionWrapper *adjacent_InstW = 
	      *InstructionWrapper::nodes.find(const_cast<InstructionWrapper*>(DNode->getDependencyList()[i].first->getData())); 
	    adjacent_InstW->setFlag(true);
	  }		
	}//end for i = 0; DNode...
      }//end judging gv's sensitivity
    }//end global value
  }

#endif



#if PDG_CONSTRUCTION


  //coloring the PDG in instMap

  errs() << "\n\n PDG construction completed! ^_^\n\n";
  errs() << "funcs = " << funcs << "\n";
  errs() << "+++++++++++++++++++++++++++++++++++++++++++++\n";

  errs() << "########### Iteration, searching labeled instruction nodes...\n";

  std::deque<const InstructionWrapper*> queue;

  for(std::set<InstructionWrapper*>::iterator nodeIt = InstructionWrapper::nodes.begin();
      nodeIt != InstructionWrapper::nodes.end(); ++nodeIt){
    InstructionWrapper *InstW = *nodeIt;
    Instruction *pInstruction = InstW->getInstruction();

    //global value
    if(InstW->getType() == GLOBAL_VALUE){
      GlobalValue *gv = dyn_cast<GlobalValue>(InstW->getValue());
	
      if(globalV->getAlignment() == SENSITIVE){
	errs() << "sensitive global val :" << *InstW->getValue() << "\n";
	DependencyNode<InstructionWrapper>* DNode = PDG->getNodeByData(InstW);

	errs() << "global sensitive adjacent list size = " << DNode->getDependencyList().size() << "\n";

	for(int i = 0; i < DNode->getDependencyList().size(); i++){
	  if(true != DNode->getDependencyList()[i].first->getData()->getFlag()){
	    queue.push_back(DNode->getDependencyList()[i].first->getData());
	    InstructionWrapper *adjacent_InstW = 
	      *InstructionWrapper::nodes.find(const_cast<InstructionWrapper*>(DNode->getDependencyList()[i].first->getData())); 
	    adjacent_InstW->setFlag(true);
	  }		
	}//end for i = 0; DNode...
      }
	
    }//end global value



    //process call nodes to find the labeled sensitive instruction, now it must be an allocaInst;
    if(pInstruction != nullptr && InstW->getType() == INST && isa<AllocaInst>(pInstruction))
      {
	AllocaInst *allocaInst =  dyn_cast<AllocaInst>(pInstruction);
	if(allocaInst->getAlignment() == SENSITIVE){
	  errs() << "Starting Node, Labeled AllocaInst = " << *pInstruction << "\n";
	      
	  DependencyNode<InstructionWrapper>* DNode = PDG->getNodeByData(InstW);
	  // errs() << DNode->getDependencyList().size();
	  for(int i = 0; i < DNode->getDependencyList().size(); i++){
	    //.first -- DependencyNode<NodeT>*
	    //->getData -- const NodeT* (InstructionWrapper*)
	    // errs() << *DNode->getDependencyList()[i].first->getData()->getInstruction() << "\n";
	    //if this node has not been visited yet
	    if(true != DNode->getDependencyList()[i].first->getData()->getFlag()){

	      queue.push_back(DNode->getDependencyList()[i].first->getData());

	      InstructionWrapper *adjacent_InstW = 
		*InstructionWrapper::nodes.find(const_cast<InstructionWrapper*>(DNode->getDependencyList()[i].first->getData())); 

	      adjacent_InstW->setFlag(true);

	      if(isa<StoreInst>(adjacent_InstW->getInstruction()) || isa<LoadInst>(adjacent_InstW->getInstruction()) ){
		errs() << "adjacent Inst is store/load inst := " << *adjacent_InstW->getInstruction() << "\n";
	      }
		  
	      //		errs() << "after updated flag = : " << 
	      //  (*InstructionWrapper::nodes.find(const_cast<InstructionWrapper*>(DNode->getDependencyList()[i].first->getData())))->getFlag()<<"\n";
	    }
		
	  }//see class DependencyNode
	  errs() << "queue size = " << queue.size() << "\n";
	}// end if == SENSITIVE
      }// end if (pInstruction != nullptr && isa<ALLocaInst>(p...)      	

    if(pInstruction != nullptr && InstW->getType() == INST && isa<StoreInst>(pInstruction))
      {
	StoreInst *storeInst =  dyn_cast<StoreInst>(pInstruction);
	if(storeInst->getAlignment() == SENSITIVE){
	  errs() << "Starting Node, Labeled StoreInst = " << *pInstruction << "\n";
	  //	    errs() << "flag == " << InstW->getFlag();
	      
	  DependencyNode<InstructionWrapper>* DNode = PDG->getNodeByData(InstW);
	  // errs() << DNode->getDependencyList().size();
	  for(int i = 0; i < DNode->getDependencyList().size(); i++){
	    //.first -- DependencyNode<NodeT>*
	    //->getData -- const NodeT* (InstructionWrapper*)
	    // errs() << *DNode->getDependencyList()[i].first->getData()->getInstruction() << "\n";
	    //if this node has not been visited yet
	    if(true != DNode->getDependencyList()[i].first->getData()->getFlag()){

	      queue.push_back(DNode->getDependencyList()[i].first->getData());

	      InstructionWrapper *adjacent_InstW = 
		*InstructionWrapper::nodes.find(const_cast<InstructionWrapper*>(DNode->getDependencyList()[i].first->getData())); 

	      adjacent_InstW->setFlag(true);

	      if(isa<StoreInst>(adjacent_InstW->getInstruction()) || isa<LoadInst>(adjacent_InstW->getInstruction()) ){
		errs() << "adjacent Inst is store/load inst := " << *adjacent_InstW->getInstruction() << "\n";
	      }
	    }
	  }//end for i DNode
	  errs() << "queue size = " << queue.size() << "\n";
	}// end if storeAlignment == SENSITIVE
      }// end if (pInstruction != nullptr && isa<StoreInst>(p...)      	

  }// end for set<...> iteration


  errs() << "before working on queue, queue.size = " << queue.size() << "\n";



  while(!queue.empty()){

    if((*queue.front()).getInstruction() != nullptr){
      //show all non-empty insts
      //     errs() << " front : " << *(*queue.front()).getInstruction() << "\n";
      Instruction* pInstruction = (*queue.front()).getInstruction();
      if(isa<LoadInst>(pInstruction)){
	//errs() << *pInstruction << "\n";
	;
      }
    }
    
    InstructionWrapper *InstW = const_cast<InstructionWrapper*>(queue.front());
    FunctionWrapper::funcMap[InstW->getFunction()]->setVisited(true);
    queue.pop_front();
    errs() << "DEBUG, queue.size = " << queue.size() << "\n";

    DependencyNode<InstructionWrapper>* DNode = PDG->getNodeByData(InstW);
    errs() << "DEBUG, DNode->getDependencyList.size = " << DNode->getDependencyList().size() << "\n";


    for(int i = 0; i < DNode->getDependencyList().size(); i++){

      //skip CONTROL_DEPENDENCY


      if(DNode->getDependencyList()[i].second == CONTROL || DNode->getDependencyList()[i].second == CALL){
	continue;
      }


      if(nullptr != DNode->getDependencyList()[i].first->getData()){
	InstructionWrapper *adjacent_InstW = *InstructionWrapper::nodes.find(const_cast<InstructionWrapper*>(DNode->getDependencyList()[i].first->getData())); 
	if(true != adjacent_InstW->getFlag()){
	  queue.push_back(DNode->getDependencyList()[i].first->getData());
	  adjacent_InstW->setFlag(true); //label the adjacent node visited
	}
      }
      else
	errs() << "*DNode->getDependencyList()[" << i << "].first->getData = NULL << " << "\n";


      /*
	if(true != DNode->getDependencyList()[i].first->getData()->getFlag()){

	//	if(DNode->getDependencyList()[i] == nullptr) errs() << "DNode null!\n";

	queue.push_back(DNode->getDependencyList()[i].first->getData());
	}*/

    }//end for int i = 0; i < DNode...
    //    errs() << "DEBUG 525" << "\n";

  }//end while(!queue...)


  //print all colored(visited) functions in funcMap

  std::map<const llvm::Function *,FunctionWrapper *>::const_iterator itF = FunctionWrapper::funcMap.begin(); 
	
  for(; itF != FunctionWrapper::funcMap.end(); ++itF){

    if((*itF).first->isDeclaration())
      continue;
   
    if((*itF).second->isVisited()){
      colored_funcs++;
      errs () << (*itF).first->getName() << " colored!\n";
    }
  }
  errs() << "***********************************************\n";


  itF = FunctionWrapper::funcMap.begin(); 
  for(; itF != FunctionWrapper::funcMap.end(); ++itF){

    if((*itF).first->isDeclaration())
      continue;
   

    if(!(*itF).second->isVisited()){
      uncolored_funcs++;
      errs () << (*itF).first->getName() << " not colored!\n";
    }
  }

  errs() << "***********************************************\n";

  errs() << "FunctionWrapper::funcMap.size = " << FunctionWrapper::funcMap.size() << "\n";
  errs() << "colored_funcs = " << colored_funcs <<"\n";
  errs() << "uncolored_funcs = " << uncolored_funcs <<"\n";



  //For some large testing programs, we stop writing .dot files to save time
  errs() << "stop writing .dot ...  \n";
  //  exit(0);
  
  //  errs() << "DEBUG 7" << "\n";


#endif
  //end #if PDG_CONSTRUCTION


    if((*queue.front()).getInstruction() != nullptr){
      //show all non-empty insts
      //     errs() << " front : " << *(*queue.front()).getInstruction() << "\n";
      Instruction* pInstruction = (*queue.front()).getInstruction();
      if(isa<LoadInst>(pInstruction)){
	//errs() << *pInstruction << "\n";
	;
      }
    }





#if 0
for(; itF != FunctionWrapper::funcMap.end(); ++itF){

  if((*itF).first->isDeclaration())
    continue;

  errs () << (*itF).first->getName() << " accessed \n";

  std::list<llvm::StoreInst*>::iterator si = (*itF).second->getStoreInstList().begin();
  std::list<llvm::StoreInst*>::iterator se = (*itF).second->getStoreInstList().end();
  std::list<llvm::LoadInst*>::iterator li = (*itF).second->getLoadInstList().begin();
  std::list<llvm::LoadInst*>::iterator le = (*itF).second->getLoadInstList().end();
  for(; si != se; ++si){
    errs() << *(*si) << "\n";
  }
  for(; li != le; ++li){
    errs() << *(*li) << "\n";
  }

  std::set<llvm::Value*>::iterator vi = (*itF).second->getPtrSet().begin();
  std::set<llvm::Value*>::iterator ve = (*itF).second->getPtrSet().end();

  for(; vi != ve; ++vi){
    errs() << "ptr: " << *(*vi) << "\n";
    allPtrSet.insert(*vi);
  }

 }//end for(; itF !=...)

unsigned int ptr_id = 0;
std::set<llvm::Value*>::iterator vi = allPtrSet.begin();
std::set<llvm::Value*>::iterator ve = allPtrSet.end();
for(; vi != ve; ++vi, ++ptr_id){
  errs() << ptr_id << " ptr in allPtrSet: " << *(*vi) << "\n";
 }


#endif
