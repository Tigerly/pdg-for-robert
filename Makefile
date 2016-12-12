
LLVM_CONFIG=/usr/local/bin/llvm-config

#LLVM_CONFIG=/usr/llvm-3.4.2/bin/llvm-config

#LLVM_CONFIG=/usr/llvm-3.3/bin/llvm-config


CXX=`$(LLVM_CONFIG) --bindir`/clang++
CXXFLAGS=`$(LLVM_CONFIG) --cppflags` -fPIC -fno-rtti -g -O3 -Wno-deprecated -std=c++11
LDFLAGS=`$(LLVM_CONFIG) --ldflags`



all: pdg.so

pdg.so: ConnectFunctions.o ProgramDependencies.o ControlDependencies.o DataDependencies.o DepPrinter.o FlowDependenceAnalysis.o
	$(CXX) -shared ConnectFunctions.o ProgramDependencies.o ControlDependencies.o DataDependencies.o DepPrinter.o FlowDependenceAnalysis.o  ./DS-AA/lib/AssistDS/DSNodeEquivs.o ./DS-AA/lib/smack/SmackDSAAA.o ./DS-AA/lib/DSA/LLVMDataStructure.a ./DS-AA/lib/sos/DSAA.a -o pdg.so $(LDFLAGS) -fPIC




#pdg.so: SystemDataDependencies.o DataDependencies.o ControlDependencies.o
#	$(CXX) -shared SystemDataDependencies.o DataDependencies.o ControlDependencies.o -o pdg.so $(LDFLAGS) -fPIC

#cdg.so: ControlDependencies.o DepPrinter.o 
#	$(CXX) -shared ControlDependencies.o DepPrinter.o -o cdg.so $(LDFLAGS) -fPIC


#ForceLinking.o: ForceLinking.cpp
#	$(CXX) -c ForceLinking.cpp -o ForceLinking.o $(CXXFLAGS)

#SystemDataDependencies.o: SystemDataDependencies.cpp SystemDataDependencies.h
#	$(CXX) -c SystemDataDependencies.cpp -o SystemDataDependencies.o $(CXXFLAGS)

#SystemControlDependencies.o: SystemControlDependenceGraph.cpp SystemControlDependenceGraph.h
#	$(CXX) -c SystemControlDependenceGraph.cpp -o SystemControlDependencies.o $(CXXFLAGS)


ConnectFunctions.o: ConnectFunctions.cpp ConnectFunctions.h
	$(CXX) -c ConnectFunctions.cpp -o ConnectFunctions.o $(CXXFLAGS)

ProgramDependencies.o: ProgramDependencies.cpp ProgramDependencies.h
	$(CXX) -c ProgramDependencies.cpp -o ProgramDependencies.o $(CXXFLAGS)

ControlDependencies.o: ControlDependencies.cpp ControlDependencies.h
	$(CXX) -c ControlDependencies.cpp -o ControlDependencies.o $(CXXFLAGS)

DataDependencies.o: DataDependencies.cpp DataDependencies.h
	$(CXX) -c DataDependencies.cpp -o DataDependencies.o $(CXXFLAGS)

FlowDependenceAnalysis.o: FlowDependenceAnalysis.cpp FlowDependenceAnalysis.h  
	$(CXX) -c FlowDependenceAnalysis.cpp -o FlowDependenceAnalysis.o $(CXXFLAGS)

DepPrinter.o: DepPrinter.cpp
	$(CXX) -c DepPrinter.cpp -o DepPrinter.o $(CXXFLAGS)

clean:
	rm -f *.o pdg.so
