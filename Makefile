all: $(IBIS_COMPONENTS)

IBIS_COMPONENTS=\
	ibis_pkg.inc \
	ibis_input.inc \
	ibis_output.inc \
	ibis_tristate.inc \
	ibis_open_source.inc \
	ibis_open_sink.inc \
	ibis_buffer.inc \
	ibis_terminator.inc \
	ibis_dynamic_clamp.inc

# Drop off trailing '.end'
%.inc: %.sch
	gnetlist -g spice-sdb -o /dev/stderr $< 2>&1 >/dev/null | grep -v '^.end$$' > $@

%.net: %.sch
	gnetlist -g spice-sdb -o $@ $<

%.lib: %.ibs darter.py *.inc
	./darter.py $< $@

clean:
	-rm *.lib $(IBIS_COMPONENTS)
