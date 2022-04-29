TARGETS=add.pdf sub.pdf mul.pdf

all: $(TARGETS)

add.txt:
	perl -le 'while(1) { print  int(rand()*1000) . "+" . int(rand()*1000) . "=" }' | head -n 500 > $@
sub.txt:
	perl -le 'while(1) { print  int(rand()*1000) . "-" . int(rand()*1000) . "=" }' | head -n 500 > $@
mul.txt:
	perl -le 'while(1) { print  int(rand()*10) . "x" . int(rand()*10) . "=" }' | head -n 500 > $@

.PHONY: all clean

.INTERMEDIATE: $(TARGETS:.pdf=.txt)

clean:
	-rm -f $(TARGETS)

%.ps: %.txt
	enscript -8 -o $@ $<

%.pdf: %.ps
	ps2pdf $< $@
