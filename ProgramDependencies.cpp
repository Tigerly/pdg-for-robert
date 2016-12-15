
/** ---*- C++ -*--- ProgramDependencies.cpp
 *
 * Copyright (C) 2012 Marco Minutoli <mminutoli@gmail.com>
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License as
 * published by the Free Software Foundation, either version 3 of the
 * License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see http://www.gnu.org/licenses/.
 */

#define SENSITIVE 256

#define PDG_CONSTRUCTION 0

#include "llvm/Bitcode/ReaderWriter.h"

#include "ConnectFunctions.h"
#include "FunctionWrapper.h"
#include "ProgramDependencies.h"
#include "SystemDataDependencies.h"
#include "SystemControlDependenceGraph.h"

#include "AllPasses.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Type.h"
#include "llvm/IR/DerivedTypes.h"
#include "llvm/IR/Intrinsics.h"


#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/ValueSymbolTable.h"

#include "llvm/Support/raw_ostream.h"
#include "llvm/Support/FileSystem.h"
#include <map>
#include <vector>
#include <deque>
#include <list>
#include <iostream>

#include <string.h>
#include <time.h>


using namespace std;
using namespace cot;
using namespace llvm;


typedef struct S{
  int val; 
  struct S* next;
}tnameS;



static IRBuilder<> Builder(getGlobalContext());



char ProgramDependencyGraph::ID = 0;
//std::map<const llvm::BasicBlock *,BasicBlockWrapper *> BasicBlockWrapper::bbMap;
AliasAnalysis* ProgramDependencyGraph::Global_AA = nullptr;

std::map<const llvm::Function *,FunctionWrapper *> FunctionWrapper::funcMap;


std::vector<llvm::Value*> sensitive_values;
std::vector<InstructionWrapper*> sensitive_nodes;


void ProgramDependencyGraph::drawParameterTree(Function* call_func, TreeType treeTy)
{      
  for(list<ArgumentWrapper*>::iterator argI = FunctionWrapper::funcMap[call_func]->getArgWList().begin(),
	argE = FunctionWrapper::funcMap[call_func]->getArgWList().end(); argI != argE; ++argI){

    for(tree<InstructionWrapper*>::iterator TI = (*argI)->getTree(treeTy).begin(), 
	  TE = (*argI)->getTree(treeTy).end(); TI != TE; ++TI){
      // errs() << "treenode id = " << (*TI)->getFieldId() << "\n";
      //errs() << "number_of_children : " << TI.number_of_children() << "\n";
	      		      
      for(int i = 0; i < TI.number_of_children(); i++){
	InstructionWrapper *childW = *(*argI)->getTree(treeTy).child(TI, i);
	//	errs() << "child " << i << " : " << childW->getFieldId() << "\n";



	if(nullptr == *InstructionWrapper::nodes.find(*TI)) errs() << "DEBUG LINE 80 InstW NULL\n";
	if(nullptr == *InstructionWrapper::nodes.find(childW)) errs() << "DEBUG LINE 91 InstW NULL\n";

	PDG->addDependency(*InstructionWrapper::nodes.find(*TI), *InstructionWrapper::nodes.find(childW), PARAMETER);
      } 	      
    }//end for tree
  }//end for list
}

int ProgramDependencyGraph::connectCallerAndCallee(InstructionWrapper *callerInstW, llvm::Function *callee_func){

  if(callerInstW == nullptr || callee_func == nullptr){
    return 1;
  }
  //callInst in caller --> Entry Node in callee

  //  if(nullptr == callerInstW) errs() << "DEBUG LINE 106 InstW NULL\n";
  // if(nullptr == FunctionWrapper::funcMap[callee_func]->getEntry()) errs() << "DEBUG LINE 107 InstW NULL\n";



  PDG->addDependency(callerInstW, FunctionWrapper::funcMap[callee_func]->getEntry(), CONTROL);

  //ReturnInst in callee --> CallInst in caller
  for(list<Instruction*>::iterator RI = FunctionWrapper::funcMap[callee_func]->getReturnInstList().begin(), 
	RE = FunctionWrapper::funcMap[callee_func]->getReturnInstList().end(); RI != RE; ++RI){
  
    for(std::set<InstructionWrapper*>::iterator nodeIt = InstructionWrapper::nodes.begin();
	nodeIt != InstructionWrapper::nodes.end(); ++nodeIt){
	
      if((*nodeIt)->getInstruction() == *RI){
	if (nullptr != dyn_cast<ReturnInst>((*nodeIt)->getInstruction())->getReturnValue())
	  PDG->addDependency(*InstructionWrapper::nodes.find(*nodeIt), callerInstW, DATA_GENERAL);
	//TODO: indirect call, function name??
	else 
	  ;// errs() << "void ReturnInst: " << *(*nodeIt)->getInstruction() << " Function: " << callee_func->getName();
      }
    }
  }

  
  for(list<ArgumentWrapper*>::iterator argI = FunctionWrapper::funcMap[callee_func]->getArgWList().begin(),
	argE = FunctionWrapper::funcMap[callee_func]->getArgWList().end(); argI != argE; ++argI){

    InstructionWrapper *actual_inW = *(*argI)->getTree(ACTUAL_IN_TREE).begin();
    InstructionWrapper *actual_outW = *(*argI)->getTree(ACTUAL_OUT_TREE).begin();
    InstructionWrapper *formal_inW = *(*argI)->getTree(FORMAL_IN_TREE).begin();
    InstructionWrapper *formal_outW = *(*argI)->getTree(FORMAL_OUT_TREE).begin();

    //connect callInst(caller) with ACTUAL IN/OUT trees

    if(nullptr == *InstructionWrapper::nodes.find(actual_inW)) errs() << "DEBUG LINE 141 InstW NULL\n";
    if(nullptr == *InstructionWrapper::nodes.find(actual_outW)) errs() << "DEBUG LINE 142 InstW NULL\n";



    PDG->addDependency(callerInstW, *InstructionWrapper::nodes.find(actual_inW), PARAMETER);
    PDG->addDependency(callerInstW, *InstructionWrapper::nodes.find(actual_outW), PARAMETER);

    //connect call_func(callee) with FORMAL IN/OUT trees
    //    if(nullptr == FunctionWrapper::funcMap[callee_func]->getEntry()) errs() << "DEBUG LINE 151 InstW NULL\n";
    //    if(nullptr == *InstructionWrapper::nodes.find(formal_inW)) errs() << "DEBUG LINE 152 InstW NULL\n";

    PDG->addDependency(FunctionWrapper::funcMap[callee_func]->getEntry(), *InstructionWrapper::nodes.find(formal_inW), PARAMETER);
    PDG->addDependency(FunctionWrapper::funcMap[callee_func]->getEntry(), *InstructionWrapper::nodes.find(formal_outW), PARAMETER);

    //intra-connection between ACTUAL/FORMAL IN/OUT trees
    for(tree<InstructionWrapper*>::iterator TI= (*argI)->getTree(ACTUAL_IN_TREE).begin(),
	  TE = (*argI)->getTree(ACTUAL_IN_TREE).end(), 
	  TI2 = (*argI)->getTree(FORMAL_IN_TREE).begin(),
	  TI3 = (*argI)->getTree(FORMAL_OUT_TREE).begin(),
	  TI4 = (*argI)->getTree(ACTUAL_OUT_TREE).begin(); 
	TI != TE; ++TI, ++TI2, ++TI3, ++TI4){
      //connect trees: antual-in --> formal-in, formal-in --> formal-out, formal-out --> actual-out

      //      if(nullptr == *InstructionWrapper::nodes.find(*TI)) errs() << "DEBUG LINE 152 InstW NULL\n";

      PDG->addDependency(*InstructionWrapper::nodes.find(*TI), *InstructionWrapper::nodes.find(*TI2), PARAMETER);
      PDG->addDependency(*InstructionWrapper::nodes.find(*TI2), *InstructionWrapper::nodes.find(*TI3), PARAMETER);
      PDG->addDependency(*InstructionWrapper::nodes.find(*TI3), *InstructionWrapper::nodes.find(*TI4), PARAMETER);
       
      //      errs() << "call_func : " << call_func->getName() << "\n";
      //errs() <<"\n%%%%%%%%%%############ StoreVec size = " <<  StoreVec.size() <<"\n";

      //connect formal-in-tree type nodes with storeinst in call_func, approximation used here
      if(nullptr != (*TI2)->getFieldType()){

	std::list<StoreInst*>::iterator SI = FunctionWrapper::funcMap[callee_func]->getStoreInstList().begin();
	std::list<StoreInst*>::iterator SE = FunctionWrapper::funcMap[callee_func]->getStoreInstList().end();

	for(;SI != SE; ++SI){
	  if((*TI2)->getFieldType() == (*SI)->getValueOperand()->getType()){

	    for(std::set<InstructionWrapper*>::iterator nodeIt = InstructionWrapper::nodes.begin();
		nodeIt != InstructionWrapper::nodes.end(); ++nodeIt){
	
	      if((*nodeIt)->getInstruction() == dyn_cast<Instruction>(*SI))
		PDG->addDependency(*InstructionWrapper::nodes.find(*TI2), *InstructionWrapper::nodes.find(*nodeIt), DATA_GENERAL);	      
	    }
	  }
	}//end for(;SI != SE; ++SI)
      }//end if nullptr == (*TI2)->getFieldType()

    }//end for(tree...) intra-connection between actual/formal


    //2. loadInsts --> FORMAL_OUT in Callee function
    for(tree<InstructionWrapper*>::iterator TI = (*argI)->getTree(FORMAL_OUT_TREE).begin(),
	  TE = (*argI)->getTree(FORMAL_OUT_TREE).end(); TI != TE; ++TI){

      if(nullptr != (*TI)->getFieldType()){

	std::list<StoreInst*>::iterator SI = FunctionWrapper::funcMap[callee_func]->getStoreInstList().begin();
	std::list<StoreInst*>::iterator SE = FunctionWrapper::funcMap[callee_func]->getStoreInstList().end();
      
	for(;SI != SE; ++SI){
	  if((*TI)->getFieldType() == (*SI)->getValueOperand()->getType()){
	    for(std::set<InstructionWrapper*>::iterator nodeIt = InstructionWrapper::nodes.begin();
		nodeIt != InstructionWrapper::nodes.end(); ++nodeIt){
	
	      if((*nodeIt)->getInstruction() == dyn_cast<Instruction>(*SI)){
		
		PDG->addDependency(*InstructionWrapper::nodes.find(*nodeIt), *InstructionWrapper::nodes.find(*TI), DATA_GENERAL);
	      }
	    }
	  }
	}//end for(; LI != LE; ++LI)
      }//end if(nullptr != (*TI3)->...)
    }// end for(tree TI = getTree FORMAL_OUT_TREE)
 

    //3. ACTUAL_OUT --> LoadInsts in Caller function
    for(tree<InstructionWrapper*>::iterator TI = (*argI)->getTree(ACTUAL_OUT_TREE).begin(),
	  TE = (*argI)->getTree(ACTUAL_OUT_TREE).end(); TI != TE; ++TI){

      if(nullptr != (*TI)->getFieldType()){

	std::list<LoadInst*>::iterator LI = FunctionWrapper::funcMap[callerInstW->getFunction()]->getLoadInstList().begin();
	std::list<LoadInst*>::iterator LE = FunctionWrapper::funcMap[callerInstW->getFunction()]->getLoadInstList().end();
      
	for(;LI != LE; ++LI){
	  // errs() << "TI->getFieldType()" << *(*TI)->getFieldType() << "  LI->type = " << *(*LI)->getType()<<"\n";

	  if((*TI)->getFieldType() == (*LI)->getType()){
	    for(std::set<InstructionWrapper*>::iterator nodeIt = InstructionWrapper::nodes.begin();
		nodeIt != InstructionWrapper::nodes.end(); ++nodeIt){
	
	      if((*nodeIt)->getInstruction() == dyn_cast<Instruction>(*LI))
		PDG->addDependency(*InstructionWrapper::nodes.find(*TI), *InstructionWrapper::nodes.find(*nodeIt), DATA_GENERAL);
	    }
	  }
	}//end for(; LI != LE; ++LI)
      }//end if(nullptr != (*TI3)->...)
    }// end for(tree TI = getTree FORMAL_OUT_TREE)     
  }//end for argI iteration

  return 0;
}


bool ProgramDependencyGraph::runOnModule(Module &M)
{
  Global_AA = &getAnalysis<AliasAnalysis>();

  errs() << "ProgramDependencyGraph::runOnModule" << '\n';
  
  FunctionWrapper::constructFuncMap(M);

  errs() << "funcMap size = " << FunctionWrapper::funcMap.size() << '\n';

  //Get the Module's list of global variable and function identifiers
  
  errs()<<"======Global List: ======\n";

  //    M.getGlobalList().dump();
  for(llvm::Module::global_iterator globalIt = M.global_begin(); globalIt != M.global_end(); ++globalIt){
    //globalIt = M.getGlobalList().begin();      globalIt != M.getGlobalList().end(); ++globalIt){
    //    errs()<< "gloabal value: " << *globalIt << " alignment: " << (*globalIt).getAlignment() << "\n";

    InstructionWrapper *globalW = new InstructionWrapper(nullptr, nullptr, &(*globalIt), GLOBAL_VALUE);
    InstructionWrapper::nodes.insert(globalW);
    InstructionWrapper::globalList.insert(globalW);

    //    errs() << "global in InstW: " << globalW->getValue( ) << " " << *(globalW->getValue()) << "\n";
    
    //find all global pointer values and insert them into a list
    if(globalW->getValue()->getType()->getContainedType(0)->isPointerTy()){
      // errs() << " Pointer global value found! : " << *(globalW->getValue()) << "\n"; 
      gp_list.push_back(globalW);
      // errs() << "gp list [0] =  " << *gp_list[0]->getValue() << "\n";

      //  errs() << "Global AA info: location gp list[0] " << 
    }
  }
  


  int funcs = 0;
  int colored_funcs = 0;
  int uncolored_funcs = 0;

  //process a module function by function
  for(Module::iterator F = M.begin(), E = M.end(); F != E; ++F)
    {
      if((*F).isDeclaration()){
	errs() << (*F).getName() << " is defined outside!" << "\n";
	continue;
      }
      
      funcs++;//label this author-defined function

      errs() << "PDG " << 1.0*funcs/M.getFunctionList().size()*100 << "% completed\n";


      InstructionWrapper::constructInstMap(*F);
      
      //      errs() << "DEBUG 306 constructInstMap completed!\n";

      //find all Load/Store instructions for each F, insert to F's storeInstList and loadInstList
      for(inst_iterator I = inst_begin(F), IE = inst_end(F); I != IE; ++I){

	Instruction *pInstruction = dyn_cast<Instruction>(&*I);

	if(isa<StoreInst>(pInstruction)){

	  StoreInst* SI = dyn_cast<StoreInst>(pInstruction);
	  FunctionWrapper::funcMap[&*F]->getStoreInstList().push_back(SI);

	  FunctionWrapper::funcMap[&*F]->getPtrSet().insert(SI->getPointerOperand());

	  if(SI->getValueOperand()->getType()->isPointerTy()){
	    FunctionWrapper::funcMap[&*F]->getPtrSet().insert(SI->getValueOperand());
	  }

	} 
	if(isa<LoadInst>(pInstruction)){
	  LoadInst* LI = dyn_cast<LoadInst>(pInstruction);
	  FunctionWrapper::funcMap[&*F]->getLoadInstList().push_back(LI);

	  FunctionWrapper::funcMap[&*F]->getPtrSet().insert(LI->getPointerOperand());
	}

	if(isa<ReturnInst>(pInstruction))
	  FunctionWrapper::funcMap[&*F]->getReturnInstList().push_back(pInstruction);	

	if(isa<CallInst>(pInstruction))
	  FunctionWrapper::funcMap[&*F]->getCallInstList().push_back(dyn_cast<CallInst>(pInstruction));	
	  	      
      }

      // errs() << "FUCKING StoreInstList.size = " << FunctionWrapper::funcMap[&*F]->getStoreInstList().size() << "\n";  
      //errs() << "FUCKING LoadInstList.size  = " << FunctionWrapper::funcMap[&*F]->getLoadInstList().size() << "\n";  

      DataDependencyGraph &ddgGraph = getAnalysis<DataDependencyGraph>(*F);
     
      ControlDependencyGraph &cdgGraph = getAnalysis<ControlDependencyGraph>(*F);
  
      cdgGraph.computeDependencies(*F, cdgGraph.PDT);

      //set Entries for Function, set up links between dummy entry nodes and their func*
      for(std::set<InstructionWrapper*>::iterator nodeIt = InstructionWrapper::funcInstWList[&*F].begin();
	  nodeIt != InstructionWrapper::funcInstWList[&*F].end(); ++nodeIt){
	
	InstructionWrapper *InstW = *nodeIt;
	if(InstW->getType() == ENTRY){

	  std::map<const llvm::Function *,FunctionWrapper *>::const_iterator itF = 
	    FunctionWrapper::funcMap.find(InstW->getFunction()); 
 
	  if(itF != FunctionWrapper::funcMap.end()){
	    //   errs() << "find successful!" << "\n";
	    FunctionWrapper::funcMap[InstW->getFunction()]->setEntry(InstW);
	  }   
	}
      }//end for set Entries...

      clock_t begin2 = clock();

      //the iteration should be done for the instMap, not original F
      for(std::set<InstructionWrapper*>::iterator nodeIt = InstructionWrapper::funcInstWList[&*F].begin();
	  nodeIt != InstructionWrapper::funcInstWList[&*F].end(); ++nodeIt)
	{
	  InstructionWrapper *InstW = *nodeIt;
	  Instruction *pInstruction = InstW->getInstruction();

	  //process call nodes, one call node will only be touched once(!InstW->getAccess)
	  if(pInstruction != nullptr && InstW->getType() == INST && isa<CallInst>(pInstruction) && !InstW->getAccess())
	    {
	      InstructionWrapper *CallInstW = InstW;
	      CallInst *cInstruction = dyn_cast<CallInst>(pInstruction);
	      Function *call_func = cInstruction->getCalledFunction();

	      //if this is an indirect function invocation(function pointer, member function...)
	      // e.g.   %1 = load i32 (i32)** %p, align 8
	      //	%call = call i32 %1(i32 2))
	      if(call_func == nullptr){
		errs() << "call_func = null: " << *cInstruction << "\n";
		
		Type* t = cInstruction->getCalledValue()->getType();
		//errs() << "indirect call, called Type t = " << *t << "\n";

		FunctionType* ft = cast<FunctionType>(cast<PointerType>(t)->getElementType());
		//errs() << "afte cast<FunctionType>, ft = " << *ft <<"\n";
		continue;
	      }

	      //TODO: isIntrinsic or not? Consider intrinsics as common instructions for now, continue directly  
	      if(call_func->isIntrinsic() || call_func->isDeclaration()){

		//if it is a var_annotation, save the sensitive value by the way
		if(call_func->getIntrinsicID() == Intrinsic::var_annotation){
		  Value* v = cInstruction->getArgOperand(0);
		  errs() << "Intrinsic var_annotation: " << *v << "\n";

		  if(isa<BitCastInst>(v)){
		    Instruction *tempI = dyn_cast<Instruction>(v);
		    errs() << "******** BitInst opcode: " << *tempI << "BitCast \n";

		    for(llvm::Use &U : tempI->operands()){
		      Value *v_for_cast = U.get();
		      sensitive_values.push_back(v_for_cast);
		    }
		  }
		  else
		    sensitive_values.push_back(v);
		}		  

		continue;
	      }
	      //TODO: tail call processing
	      if(cInstruction->isTailCall()){
		//		errs() << "tail call: " << *cInstruction << "\n";
		continue;
	      }
	      
	      //if callee has no parameter trees yet, build trees first, and draw
	      if(true != FunctionWrapper::funcMap[call_func]->hasTrees()){

	       	errs() << "DEBUG 411 New call for tree construction: " << *InstW->getInstruction() << "\n";
	      	      
		//DEBUG 411 New call for tree construction:   call void @yy_init_buffer(%struct.yy_buffer_state* %10, %struct._IO_FILE* %11)

		buildParameterTrees(InstW, call_func);

		errs() << "DEBUG after buildParameterTrees\n";

		drawParameterTree(call_func,ACTUAL_IN_TREE);

		drawParameterTree(call_func,ACTUAL_OUT_TREE);

		drawParameterTree(call_func,FORMAL_IN_TREE);

		drawParameterTree(call_func,FORMAL_OUT_TREE);

	       	errs() << "DEBUG 425 drawParameterTree completed!\n";
	      }	     

	      //	      errs() << "before connectCallerAndCallee :" << *InstW->getInstruction() << " func :" << call_func->getName() << "\n";
	      //take recursive callInst as common callInst
	      if(0 == connectCallerAndCallee(InstW, call_func)){
		InstW->setAccess(true);
		//		errs () << "DEBUG 415 connectCallerAndCallee callInst: " << *InstW->getInstruction() << "\n";
		//		errs () << "callee_Func: " << call_func->getName() << "\n";
		//		errs() << "---------------------------------------------------\n";
	      }

	    }//end callnode


	  //second iteration on nodes to add both control and data Dependency
	  for(std::set<InstructionWrapper*>::iterator nodeIt2 = InstructionWrapper::funcInstWList[&*F].begin();
	      nodeIt2 != InstructionWrapper::funcInstWList[&*F].end(); ++nodeIt2){
	    InstructionWrapper *InstW2 = *nodeIt2;
  
	    //process all globals see whether dependency exists
	    if(InstW2->getType() == INST && isa<LoadInst>(InstW2->getInstruction())){

	      LoadInst* LI2 = dyn_cast<LoadInst>(InstW2->getInstruction());
	      
	      for(std::set<InstructionWrapper *>::const_iterator gi = InstructionWrapper::globalList.begin(); 
		  gi != InstructionWrapper::globalList.end(); ++gi){	   
		//		errs() << "global v = " << *(*gi)->getValue() << "\n";  
		if(LI2->getPointerOperand() == (*gi)->getValue()){
		  //	  errs() << *(*gi)->getValue() << " used in " << *LI2 << "\n";
		  PDG->addDependency(*gi, InstW2, GLOBAL_VALUE);
		}		
	      }// end searching globalList
	    }//end procesing load for global



	    if(InstW->getType() == INST){	       
	      if (ddgGraph.DDG->depends(InstW, InstW2)) {
		//only StoreInst->LoadInst edge can be annotated
		if(InstW2->getType() == INST 
		   && isa<StoreInst>(InstW->getInstruction())
		   && isa<LoadInst>(InstW2->getInstruction())){
		  PDG->addDependency(InstW, InstW2, DATA_RAW);
		}
		else
		  PDG->addDependency(InstW, InstW2, DATA_DEF_USE);
	      }
	    
	      if(nullptr != InstW2->getInstruction()){		  
		if (cdgGraph.CDG->depends(InstW, InstW2)) {
		  PDG->addDependency(InstW, InstW2, CONTROL);
		}
	      }
	    }//end if(InstW->getType()== INST)

	    if(InstW->getType() == ENTRY){
	      if (nullptr != InstW2->getInstruction() && cdgGraph.CDG->depends(InstW, InstW2))
		PDG->addDependency(InstW, InstW2, CONTROL);
	    }	    
	  }//end second iteration for PDG->addDependency...
	} //end the iteration for finding CallInst     	
      errs() << "------------------------DEBUG finding CallInst---------------------------\n";



      // connect globals and instructions

      clock_t end2 = clock();
      double time_spent2 = (double)(end2 - begin2) / CLOCKS_PER_SEC;

      errs() << "TIME per iteration in big for loop : " << time_spent2 << "\n";

    }//end for(Module...


  errs() << "\n\n PDG construction completed! ^_^\n\n";
  errs() << "funcs = " << funcs << "\n";
  errs() << "+++++++++++++++++++++++++++++++++++++++++++++\n";

  std::map<const llvm::Function *,FunctionWrapper *>::const_iterator itF = FunctionWrapper::funcMap.begin(); 

  std::set<llvm::GlobalValue*> senGlobalSet;
  std::set<llvm::Instruction*> senInstSet;
  
  std::set<InstructionWrapper *>::const_iterator gi = InstructionWrapper::globalList.begin();
  std::set<InstructionWrapper *>::const_iterator ge = InstructionWrapper::globalList.end();

  errs() << "globalList.size = " << InstructionWrapper::globalList.size() << "\n";
  
  //sensitive global values(with annotations) can be directly get through Module.getNamedGlobal(GetNameGlobal in 3.9)
  auto global_annos = M.getNamedGlobal("llvm.global.annotations");
  if (global_annos){
    auto casted_array = cast<ConstantArray>(global_annos->getOperand(0));
    for (int i = 0; i < casted_array->getNumOperands(); i++) {
      auto casted_struct = cast<ConstantStruct>(casted_array->getOperand(i));
      if (auto sen_gv = dyn_cast<GlobalValue>(casted_struct->getOperand(0)->getOperand(0))) {
	auto anno = cast<ConstantDataArray>(cast<GlobalVariable>(casted_struct->getOperand(1)->getOperand(0))->getOperand(0))->getAsCString();
	if (anno == "sensitive") { 
	  errs() << "sensitive global found! value = " << *sen_gv << "\n";
	  senGlobalSet.insert(sen_gv);
	}
      }
    }
  }//end if (global_annos)

  //process all sensitive instructions in functions and all global values, color their corresponding nodes in set "nodes"    
  for(std::set<InstructionWrapper*>::iterator nodeIt = InstructionWrapper::nodes.begin();
      nodeIt != InstructionWrapper::nodes.end(); ++nodeIt){

    InstructionWrapper *InstW = *nodeIt;
    Instruction *pInstruction = InstW->getInstruction();

    //process annoatated sensitive values(actually are instructionWrappers) in functions
    for(int i = 0; i < sensitive_values.size(); i++){
      if(sensitive_values[i] == pInstruction){
	errs() << "sensitive_values " << i << " == "<< *pInstruction << "\n";
	sensitive_nodes.push_back(InstW); 
      }
    }

    //based on senGloabalSet, find annotated global InstructionWrappers
    if(InstW->getType() == GLOBAL_VALUE){
      GlobalValue *gv = dyn_cast<GlobalValue>(InstW->getValue());
	
      //if gv is sensitive(inside senGlobalSet)
      if(senGlobalSet.end() != senGlobalSet.find(gv)){
	errs() << "sensitive_global: " << *gv <<"\n";
	sensitive_nodes.push_back(InstW);

      }//end judging gv's sensitivity
    }//end global value
  }

  errs() << "sensitive_nodes.size = " << sensitive_nodes.size() << "\n";
  
  std::deque<const InstructionWrapper*> queue;
  for(int i = 0; i < sensitive_nodes.size(); i++){
    queue.push_back(sensitive_nodes[i]);
  }

  errs() << "queue.size = " << queue.size() << "\n";

  /*
  for(int i = 0; i < queue.size(); i++){
    errs() << queue[i] << "\n";
    }*/

  /*
  //  std::string Str;
  //raw_fd_ostream os_InstFile("./test/sensitive_llvm_instructions.txt", true, sys::fs::F_None);
  llvm::LLVMContext& context = llvm::getGlobalContext();
  llvm::Module *mod_Bob = new llvm::Module("sensitive_llvm_instruction", context);
  llvm::IRBuilder<> builder(context); 
  mod_Bob->dump();*/


  std::set<InstructionWrapper* > coloredInstSet;
  

  //worklist algorithm for propagation
  while(!queue.empty()){
    
    InstructionWrapper *InstW = const_cast<InstructionWrapper*>(queue.front());
    if(InstW->getType() == INST)
      FunctionWrapper::funcMap[InstW->getFunction()]->setVisited(true);

    queue.pop_front();
    //TODO: getInstruction should be removed  later, only for testing here temporarily

    
    //    errs() << "DEBUG: queue.size = " << queue.size() << "\n";
    if(InstW->getValue() == nullptr){
      //      errs() << "*** DEBUG ***: queue.front = nullptr\n";
      ;
    }else {
      //  errs() << "SENSITIVE INSTRUCTION: " << *InstW->getValue() << "\n";
      coloredInstSet.insert(InstW);
    }
    

    DependencyNode<InstructionWrapper>* DNode = PDG->getNodeByData(InstW);
    //    errs() << "DEBUG, DNode->getDependencyList.size = " << DNode->getDependencyList().size() << "\n";

    for(int i = 0; i < DNode->getDependencyList().size(); i++){
      //skip CONTROL_DEPENDENCY
      if(DNode->getDependencyList()[i].second == CONTROL || DNode->getDependencyList()[i].second == CALL){
	continue;
      }
      
      if(nullptr != DNode->getDependencyList()[i].first->getData()){
	InstructionWrapper *adjacent_InstW = 
	  *InstructionWrapper::nodes.find(const_cast<InstructionWrapper*>(DNode->getDependencyList()[i].first->getData())); 
	if(true != adjacent_InstW->getFlag()){
	  //branchInst only generates control dependencies later, so no need to remove branch
	  queue.push_back(DNode->getDependencyList()[i].first->getData());
	  adjacent_InstW->setFlag(true); //label the adjacent node visited
	}
      }
      //      else errs() << "*DNode->getDependencyList()[" << i << "].first->getData = NULL << " << "\n";
    }//end for int i = 0; i < DNode...
    //    errs() << "DEBUG 525" << "\n";
  }//end while(!queue...)


  errs() << "\n\n++++++++++SENSITIVE INSTRUCTION List is as follows:++++++++++\n\n";
  int index = 0;
  for(std::set<InstructionWrapper*>::iterator senI = coloredInstSet.begin(); senI != coloredInstSet.end(); ++senI){
    if((*senI)->getType() == INST)
    errs() << "SENSITIVE INSTRUCTION [" << index++ << "] Mem Addr :" << (*senI)->getInstruction() << " Value : " << *(*senI)->getInstruction() << "\n";
  }
  



  return false;

}

void ProgramDependencyGraph::getAnalysisUsage(AnalysisUsage &AU) const
{
  AU.addRequiredTransitive<AliasAnalysis>();
  //AU.addRequired<FlowDependenceAnalysis>();
  AU.addRequired<ControlDependencyGraph>();
  AU.addRequired<DataDependencyGraph>();

  // AU.addRequired<SystemDataDependencyGraph>();
  //AU.addRequired<SystemControlDependenceGraph>();
  //AU.addPreserved<DataDependencyGraph>();
  AU.setPreservesAll();
}



void ProgramDependencyGraph::print(llvm::raw_ostream &OS, const llvm::Module*) const
{
  PDG->print(OS, getPassName());
}

ProgramDependencyGraph *CreateProgramDependencyGraphPass()
{
  return new ProgramDependencyGraph();
}

static RegisterPass<cot::ProgramDependencyGraph> PDG("pdg", "Program Dependency Graph Construction", false, true);







