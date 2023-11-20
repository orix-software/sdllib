SOURCES8=$(wildcard src/8bits/*.s)
OBJECTS8=$(SOURCES8:.s=.o)

SOURCES16=$(wildcard src/16bits/*.s)
OBJECTS16=$(SOURCES16:.s=.o)


all: $(SOURCES8) $(OBJECTS8) $(SOURCES16) $(OBJECTS16) samples

$(OBJECTS8): $(SOURCES8)
	ca65 -ttelestrat $(@:.o=.s) -o $@
	ar65 r SDL8.lib  $@
	rm -f $@

$(OBJECTS16): $(SOURCES16)
	ca65 -ttelestrat $(@:.o=.s) -o $@
	ar65 r SDL16.lib  $@


samples:
	#cl65 -ttelestrat -I include samples/joy.c
	cl65 -ttelestrat -I include samples/displayHrs.c SDL8.lib


clean:
	rm src/8bits/*.o
	rm src/16bits/*.o
	rm samples/*.o
	rm SDL.lib


