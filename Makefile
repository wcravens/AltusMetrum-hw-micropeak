PROJECT=micropeak

# intentionally want to rebuild drc and bom on every invocation
all:	drc pcb partslist partslist.csv partslist.dk

drc:	$(PROJECT).sch Makefile
	-gnetlist -g drc2 $(PROJECT).sch -o $(PROJECT).drc

partslist:	$(PROJECT).sch Makefile
	gnetlist -g bom -o $(PROJECT)-bom.unsorted $(PROJECT).sch
	(head -n1 $(PROJECT)-bom.unsorted && tail -n+2 $(PROJECT)-bom.unsorted | sort) | nickle ./retab > partslist
	rm -f $(PROJECT)-bom.unsorted

partslist.csv:	$(PROJECT).sch Makefile gnet-partslist-keithp.scm
	gnetlist -l gnet-partslist-keithp.scm -g partslist-keithp -o $(PROJECT)-list.unsorted $(PROJECT).sch
	nickle ./retab < $(PROJECT)-list.unsorted > $@

partslist.dk: 	$(PROJECT).sch Makefile gnet-partslist-bom.scm
	gnetlist -m ./gnet-partslist-bom.scm -g partslist-bom -Ovendor=digikey -o $@ $(PROJECT).sch

pcb:	$(PROJECT).sch project Makefile
	gsch2pcb project

# note that 'gschlas -e foo.sch' will embed all symbols in the schematic, this
# might be a really good idea for publishing designs to the web that others
# might review?  Like this example from DJ:
#
#web :
#        for i in channel.sch ethernet.sch power.sch mcu.sch; do \
#          cp $$i tmp.sch ; \
#          gschlas -e tmp.sch ; \
#          mv tmp.sch ${WEB}/$$i; \
#        done

# this shoves local work out to the git.gag.com repository
push:	
	git push --mirror

$(PROJECT).xy:	$(PROJECT).pcb
	pcb -x bom $(PROJECT).pcb

$(PROJECT).bottom.gbr:	$(PROJECT).pcb
	pcb -x gerber $(PROJECT).pcb

zip:	$(PROJECT).bottom.gbr $(PROJECT).bottommask.gbr $(PROJECT).fab.gbr $(PROJECT).top.gbr $(PROJECT).topmask.gbr $(PROJECT).toppaste.gbr $(PROJECT).topsilk.gbr $(PROJECT).plated-drill.cnc $(PROJECT).xy  Makefile # $(PROJECT).xls
	zip $(PROJECT).zip $(PROJECT).*.gbr $(PROJECT).*.cnc $(PROJECT).xy # $(PROJECT).xls

clean:
	rm -f *.bom *.drc *.log *~ $(PROJECT).ps *.gbr *.cnc *bak* *- *.zip 
	rm -f *.net *.xy *.cmd *.png partslist partslist.csv
	rm -f *.partslist *.new.pcb *.unsorted $(PROJECT).xls

