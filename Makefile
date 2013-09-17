# AOJ 用 Makefile

CC = clang
CXX = clang++
CFLAGS += -Wall
CXXFLAGS += -Wall
CXXFLAGS += -std=c++11
LDLIBS += -lm
BINDIR = bin

.SUFFIXES: .cout .cppout

.c.cout:
	$(CC) $(CFLAGS) -o $(BINDIR)/$* $< $(LDLIBS)

.cpp.cppout:
	$(CXX) $(CXXFLAGS) -o $(BINDIR)/$* $< $(LDLIBS)
