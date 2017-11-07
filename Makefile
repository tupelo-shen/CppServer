SIM_OBJS = main.o
SRC_OBJS = src/tcp_server.o

SIMULATOR = tcp_server

# -----<< Tool chaine >>-----
CMNINC	= -I inc/ -I src/
GCC		= gcc
GPP		= g++

GPPFLAGS =  -std=c++0x -g -Wall $(CMNINC)


all: sim
	@bash --norc -c "date '+%Y%m%d %H:%M %S'"
	@echo finished of making Extutable file.
	
sim: $(SIMULATOR) Makefile-gcc.dep
	@echo $(SIMULATOR) build finished.

Makefile-gcc.dep: src/*.cpp Makefile
	@g++ -MM $(CMNINC) src/*.cpp    | sed -e 's/^\([^ ]\)/src\/\1/' > $@
	
$(SIMULATOR): main.cpp src/*.h $(SRC_OBJS)
	@echo testing...
	$(GPP) -o $(SIMULATOR) main.cpp $(SRC_OBJS) $(GPPFLAGS) $(LIBS)

src/%.o : src/%.c
	$(GPP) -c           $(GPPFLAGS) -o $@ $<

depend: Makefile-gcc.dep
	ls -l *.dep
clean:
	rm -f $(SRC_OBJS) *.o *.exe