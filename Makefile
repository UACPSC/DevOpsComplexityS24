# DevOps Complexity Build

OBJ := srcComplexity.o srcMLXPathCount.o srcMLXPathCountTest.o
EXE := srccomplexity srcMLXPathCountTest
LDFLAGS := -lxml2
CXXINCLUDES := -I/usr/include/libxml2
CC := g++

.PHONY: all
all : $(EXE)

srccomplexity : srcComplexity.o srcMLXPathCount.o
	$(CC) $^ $(LDFLAGS) -o $@

srcComplexity.o : srcComplexity.cpp srcMLXPathCount.hpp
	$(CC) -c $<

srcMLXPathCount.o : srcMLXPathCount.cpp srcMLXPathCount.hpp
	$(CC) -c $(CXXINCLUDES) $<

srcMLXPathCountTest : srcMLXPathCountTest.o srcMLXPathCount.o
	$(CC) $^ $(LDFLAGS) -o $@

srcMLXPathCountTest.o : srcMLXPathCountTest.cpp srcMLXPathCount.hpp
	$(CC) -c $<

.PHONY: clean
clean :
	rm -f $(OBJ) $(EXE)
