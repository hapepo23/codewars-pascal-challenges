FPC = fpc
FPCFLAGS = -B -Sh -Mobjfpc -vnlw -O2 -Xs -XX 

TARGETS = \
	even_or_odd

.PHONY: all clean reformat run vrun rebuild

all: $(TARGETS)

%_unit.o: %_unit.pas
	$(FPC) $(FPCFLAGS) $^

%: %.pas
	$(FPC) $(FPCFLAGS) $^
	rm -f *.o *.ppu

clean:
	rm -f *.o *.ppu $(TARGETS)

run:
	./`zenity --title="Execute Program" --height 600 --list --text="Choose Executable" --column=Executable $(TARGETS)`

vrun:
	valgrind --leak-check=full --show-error-list=yes ./`zenity --title="Valgrind Program" --height 600 --list --text="Choose Executable" --column=Executable $(TARGETS)`
