# DevOps Complexity Build

.PHONY: all
all : srccomplexity

srccomplexity : srcComplexity.o srcMLXPathCount.o
	g++ srcComplexity.o srcMLXPathCount.o -lxml2 -o srccomplexity

srcComplexity.o : srcComplexity.cpp srcMLXPathCount.hpp
	g++ -c srcComplexity.cpp

srcMLXPathCount.o : srcMLXPathCount.cpp srcMLXPathCount.hpp
	g++ -c -I/usr/include/libxml2 srcMLXPathCount.cpp

.PHONY: clean
clean :
	rm -f srcComplexity.o srcMLXPathCount.o srccomplexity
