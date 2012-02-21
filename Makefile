IBIS_COMPONENTS=\
	ibis_pkg.inc \
	ibis_input.inc \
	ibis_input_diff.inc \
	ibis_output.inc \
	ibis_output_pulldown.inc \
	ibis_output_pullup.inc \
	ibis_buffer.inc \
	ibis_terminator.inc \
	ibis_dynamic_clamp.inc

all: ibis_components

ibis_components: $(IBIS_COMPONENTS)

# Drop off trailing '.end'
%.inc: %.sch
	gnetlist -g spice-sdb -o /dev/stderr $< 2>&1 >/dev/null | grep -v '^.end$$' > $@

%.net: %.sch
	gnetlist -g spice-sdb -o $@ $^

%.lib: %.ibs darter.py ibis_components
	./darter.py $< $@

%.lib: %.ebd darter.py
	./darter.py $< $@

%.dat: %.dat.in gen_dat.py
	./gen_dat.py $< $@

%.in: %.in.in gen_stream.py
	./gen_stream.py -t $< -o $@

clean:
	-rm -f *.lib $(IBIS_COMPONENTS)
