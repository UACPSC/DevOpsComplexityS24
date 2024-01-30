# DevOps Complexity Build

.PHONY: all
all : srccomplexity srcMLXPathCountTest

srccomplexity : srcComplexity.o srcMLXPathCount.o
	g++ srcComplexity.o srcMLXPathCount.o -lxml2 -o $@

srcComplexity.o : srcComplexity.cpp srcMLXPathCount.hpp
	g++ -c srcComplexity.cpp

srcMLXPathCount.o : srcMLXPathCount.cpp srcMLXPathCount.hpp
	g++ -c -I/usr/include/libxml2 srcMLXPathCount.cpp

srcMLXPathCountTest : srcMLXPathCountTest.o srcMLXPathCount.o
	g++ srcMLXPathCountTest.o srcMLXPathCount.o -lxml2 -o $@

srcMLXPathCountTest.o : srcMLXPathCountTest.cpp srcMLXPathCount.hpp
	g++ -c srcMLXPathCountTest.cpp

.PHONY: clean
clean :
	rm -f srcComplexity.o srcMLXPathCount.o srccomplexity srcMLXPathCountTest.o srcMLXPathCountTest
