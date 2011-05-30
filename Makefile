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

all: m62b_bd.lib u69a.lib $(IBIS_COMPONENTS)
 
test.net: pi.net

%.net: %.sch
	gnetlist -g spice-sdb -o $@ $<

%.lib: %.ibs ibis.py *.inc
	./ibis.py $< $@

%.inc: %.sch
	gnetlist -g spice-sdb -o /dev/stderr $< 2>&1 >/dev/null | grep -v '^.end$$' > $@

clean:
	-rm *.lib
