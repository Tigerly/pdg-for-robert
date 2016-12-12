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

  ArgumentWrapper(Argument* arg){
    this->arg = arg;
  }

  Argument* getArg(){
    return arg;
  }
  /*
    tree<InstructionWrapper*> getActualInTree(){
    return actualInTree;
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
