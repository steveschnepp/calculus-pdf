TARGETS=mul.pdf

all: $(TARGETS)

mul.txt:
        perl -le 'while(1) { print  int(rand()*10) . "x" . int(rand()*10) . "=" }' | head -n 500 > mul.txt

.PHONY: all clean

.INTERMEDIATE: mul.txt

clean:
        -rm -f $(TARGETS)

%.ps: %.txt
        enscript -8 -o $@ $<

%.pdf: %.ps
        ps2pdf $< $@
