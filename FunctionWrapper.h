#ifndef FUNCTIONWRAPPER_H
#define FUNCTIONWRAPPER_H

#include "llvm/Pass.h"
#include "DependencyGraph.h"

#include <map>
#include <set>
#include <list>
#include <vector>
#include "tree.hh"
 
using namespace cot;
using namespace std;
using namespace llvm;


enum TreeType{
  ACTUAL_IN_TREE = 0,
  ACTUAL_OUT_TREE,
  FORMAL_IN_TREE,
  FORMAL_OUT_TREE
};


class TypeWrapper{
 private:
  llvm::Type *ty;
  int id;

 public:
  TypeWrapper(llvm::Type* ty, int id){
    this->ty = ty;
    this->id = id;
  }

  llvm::Type* getType(){ return ty;}
  int getId(){return id;}
};

class ArgumentWrapper{

 private:
  Argument *arg;
  tree<InstructionWrapper*> actualInTree;
  tree<InstructionWrapper*> actualOutTree;
  tree<InstructionWrapper*> formalInTree;
  tree<InstructionWrapper*> formalOutTree;


 public:

  //  std::set<Type*> recursive_types;


  ArgumentWrapper(Argument* arg){
    this->arg = arg;
    //    this->recursive_types = {};
  }

  Argument* getArg(){
    return arg;
  }
  /*
    tree<InstructionWrapper*> getActualInTree(){
    return actualInTree;
    }*/

  /*
  std::set<Type*>& get_recursive_types(){
    return recursive_types;
  }

  int get_recursive_types_size(){
    return recursive_types.size();
    }*/



  //TreeType: 0-ACTUAL_IN 1-ACTUAL_OUT 2-FORMAL_IN 3-FORMAL_OUT
  tree<InstructionWrapper*>& getTree(TreeType treeTy){
    switch(treeTy){
    case ACTUAL_IN_TREE:
      return actualInTree;
    case ACTUAL_OUT_TREE:
      return actualOutTree;
    case FORMAL_IN_TREE:
      return formalInTree;
    case FORMAL_OUT_TREE:
      return formalOutTree;
      
      break;
    }
  }

};

//FunctionWrapper
class FunctionWrapper {

 private:
  Function *Func;    
  InstructionWrapper * entryW;
  //  std::set<llvm::Value*> args;
  std::list<llvm::StoreInst*> storeInstList;
  std::list<llvm::LoadInst*> loadInstList;
  std::list<llvm::Instruction*> returnInstList;
  std::list<llvm::CallInst*> callInstList;

  std::list<ArgumentWrapper*> argWList;

  std::set<llvm::Value*> ptrSet;

  bool treeFlag = false;
  bool visited = false;


 public:

  FunctionWrapper(Function *Func) {
    
    this->Func = Func;
    //  Function::ArgumentListType& callee_args = Func->getArgumentList();
    for(Function::arg_iterator argIt = Func->getArgumentList().begin(), 
	  argE = Func->getArgumentList().end(); argIt != argE; ++argIt){

      ArgumentWrapper *argW = new ArgumentWrapper(&*argIt);
      argWList.push_back(argW);
    }
  }
  
  bool hasTrees(){
    return treeFlag;
  }
  
  void setTreeFlag(bool flag){
    this->treeFlag = flag;
  }

  bool isVisited(){
    return visited;
  }

  void setVisited(bool flag){
    this->visited = flag;
  }


  Function* getFunction(){
    return Func;
  }

    
  void setEntry(InstructionWrapper* entry){
    this->entryW = entry;
  }
    
  InstructionWrapper* getEntry(){
    return entryW;
  }

  std::list<ArgumentWrapper*>& getArgWList(){
    return argWList;
  }
 
  std::list<llvm::StoreInst*>& getStoreInstList(){
    return storeInstList;
  }

  std::list<llvm::LoadInst*>& getLoadInstList(){
    return loadInstList;
  }

  std::list<llvm::Instruction*>& getReturnInstList(){
    return returnInstList;
  }

  std::list<llvm::CallInst*>& getCallInstList(){
    return callInstList;
  }

  std::set<llvm::Value*>& getPtrSet(){
    return ptrSet;
  }

  bool hasFuncOrFilePtr(){
    //check whether a function has a function_ptr or FILE parameter
    for(Function::arg_iterator argi = Func->arg_begin(), arge = Func->arg_end(); argi != arge; ++argi) {
      // params.push_back(argi->getType());
      //function ptr, put func into insensitive_set, not sensitive
      if(argi->getType()->isPointerTy()){

	if(argi->getType()->getContainedType(0)->isFunctionTy()){
	  string Str;
	  raw_string_ostream OS(Str);
	  OS << *argi->getType();
	  errs() << "DEBUG LINE 700 FunctionPointerType : " << OS.str() << "\n";
	  return true;
	}

	if(argi->getType()->getContainedType(0)->isStructTy()){
	  string Str;
	  raw_string_ostream OS(Str);
	  OS << *argi->getType();

	  //FILE*, bypass, no need to buildTypeTree
	  if("%struct._IO_FILE*" == OS.str() || "%struct._IO_marker*" == OS.str()){
		
	    errs() << "DEBUG LINE 711 struct._IO_marker*/struct._IO_FILE* \n";
	    return true;
	    //continue; 
	  }
	}
      }
    }// end for Function::arg_iterator argi...

    return false;
  }








  static void constructFuncMap(Module &M) {
    for (Module::iterator F = M.begin(), E = M.end(); F != E; ++F){
      if (funcMap.find(F) == funcMap.end()) //if not in funcMap yet, insert 
	{
	  FunctionWrapper *fw = new FunctionWrapper(F);
	  funcMap[F] = fw;
	}
    }
  }

  static std::map<const Function *,FunctionWrapper *> funcMap;

};


#endif //FUNCTIONWRAPPER_H

/*
  void addArg(Value *val){
  this->args.insert(val);
  }

  std::set<Value*> getArgs(){
  return args;
  }
  
  //get the intermediate(dummy) pointerRW node by arg (Value*)    
  Value* getArg(Value *val){
  for(std::set<Value*>::iterator si = args.begin(), se = args.end(); si != se; ++si ){
  if(*si == val)
  return val;
  }
  return nullptr;
  }*/
