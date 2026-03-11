FPC = fpc
FPCFLAGS = -B -Sh -Mobjfpc -vnlw -O2 -Xs -XX 

TARGETS = $(patsubst %_unit.pas,%,$(wildcard *_unit.pas))

.PHONY: all clean run vrun 

all: $(TARGETS)

%: %.pas %_unit.pas
	$(FPC) $(FPCFLAGS) $<
	rm -f *.o *.ppu

clean:
	rm -f *.o *.ppu $(TARGETS)

run:
	./`zenity --title="Execute Program" --height 600 --list --text="Choose Executable" --column=Executable $(TARGETS)`

vrun:
	valgrind --leak-check=full --show-error-list=yes ./`zenity --title="Valgrind Program" --height 600 --list --text="Choose Executable" --column=Executable $(TARGETS)`
