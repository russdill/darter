IBIS_COMPONENTS=\
	ibis_pkg.inc \
	ibis_input.inc \
	ibis_input_diff.inc \
	ibis_model_spec.inc \
	ibis_model_spec_s.inc \
	ibis_model_spec_d.inc \
	ibis_model_spec_ampl.inc \
	ibis_model_spec_area.inc \
	ibis_output.inc \
	ibis_output_pulldown.inc \
	ibis_output_pullup.inc \
	ibis_buffer.inc \
	ibis_buffer_diff.inc \
	ibis_terminator.inc \
	ibis_dynamic_clamp.inc \
	ibis_vmeas.inc \
	ibis_diff_vmeas.inc

GNETLIST=gnetlist-legacy

all: ibis_components

ibis_components: $(IBIS_COMPONENTS)

# Drop off trailing '.end'
%.inc: %.sch
	$(GNETLIST) -g spice-sdb -o /dev/stderr $< 2>&1 >/dev/null | grep -v '^.end$$' > $@

%.net: %.sch
	$(GNETLIST) -g spice-sdb -o $@ $^

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
