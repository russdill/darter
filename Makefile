all: ibis.lib m62b_bd.lib

%.net: %.sch
	gnetlist -g spice-sdb -o $@ $<

*.lib: ibis.py
%.lib: %.ibs
	./ibis.py $< $@

ibis.lib: ibis_input.sch ibis_output.sch ibis_buffer.sch ibis_terminator.sch ibis_dynamic_clamp.sch
	-rm -f $@
	for n in $<; do \
		echo ".lib $${n%%.net}" >> $@; \
		gnetlist -g spice-sdb -q -o /dev/stdout $$n | grep -v '^.end$$' $$n >> $@; \
		echo ".endl" >> $@; \
	done

clean:
	-rm *.lib
