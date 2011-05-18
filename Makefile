all: ibis.lib m62b_bd.lib u69a.lib

%.net: %.sch
	gnetlist -g spice-sdb -o $@ $<

%.lib: %.ibs ibis.py
	./ibis.py $< $@

ibis.lib: ibis_input.sch ibis_output.sch ibis_buffer.sch ibis_terminator.sch ibis_dynamic_clamp.sch
	@-rm -f $@
	@echo Generating $@...
	@set -e; for n in $^; do \
		echo Adding $$n; \
		echo ".lib $${n%%.sch}" >> $@; \
		gnetlist -g spice-sdb -o /dev/stderr $$n 2>&1 >/dev/null | grep -v '^.end$$' >> $@; \
		echo ".endl" >> $@; \
	done
	@echo Done

clean:
	-rm *.lib
