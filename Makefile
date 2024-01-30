# DevOps Complexity Build

OBJ := srcComplexity.o srcMLXPathCount.o srcMLXPathCountTest.o
EXE := srccomplexity srcMLXPathCountTest

.PHONY: all
all : $(EXE)

srccomplexity : srcComplexity.o srcMLXPathCount.o
	g++ $^ -lxml2 -o $@

srcComplexity.o : srcComplexity.cpp srcMLXPathCount.hpp
	g++ -c $<

srcMLXPathCount.o : srcMLXPathCount.cpp srcMLXPathCount.hpp
	g++ -c -I/usr/include/libxml2 $<

srcMLXPathCountTest : srcMLXPathCountTest.o srcMLXPathCount.o
	g++ $^ -lxml2 -o $@

srcMLXPathCountTest.o : srcMLXPathCountTest.cpp srcMLXPathCount.hpp
	g++ -c $<

.PHONY: clean
clean :
	rm -f $(OBJ) $(EXE)
