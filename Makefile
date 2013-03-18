PROJECT=micropeak
AM=../altusmetrum
SCHEME=$(AM)/scheme
NICKLE=$(AM)/nickle
RETAB=nickle $(NICKLE)/retab

# intentionally want to rebuild drc and bom on every invocation
all:	drc pcb partslist partslist.csv partslist.dk muffin-5267.pdf stencil

drc: $(PROJECT).sch
	gnetlist -L $(SCHEME) -g drc2 $(PROJECT).sch -o $(PROJECT).drc

partslist: $(PROJECT).sch
	gnetlist -L $(SCHEME) -g bom -o $(PROJECT).tabtmp $(PROJECT).sch
	(head -n1 $(PROJECT).tabtmp; tail -n+2 $(PROJECT).tabtmp | sort) | $(RETAB) > $@ && rm -f $(PROJECT).tabtmp

partslist.csv: $(PROJECT).sch Makefile
	gnetlist -L $(SCHEME) -g partslistgag -o $(PROJECT).csvtmp $(PROJECT).sch
	(head -n1 $(PROJECT).csvtmp; tail -n+2 $(PROJECT).csvtmp | sort -t \, -k 8) > $@ && rm -f $(PROJECT).csvtmp

partslist.dk: $(PROJECT).sch Makefile $(SCHEME)/gnet-partslist-bom.scm
	gnetlist -L $(SCHEME) -g partslist-bom -Ovendor=digikey -o $@ $(PROJECT).sch

partslist.mouser: $(PROJECT).sch Makefile $(SCHEME)/gnet-partslist-bom.scm
	gnetlist -L $(SCHEME) -g partslist-bom -Ovendor=mouser -o $@ $(PROJECT).sch

muffin-5267.pdf: partslist.csv $(AM)/glabels/muffin-5267.glabels
	glabels-3-batch $(AM)/glabels/muffin-5267.glabels -i partslist.csv -o muffin-5267.ps && ps2pdf muffin-5267.ps && rm muffin-5267.ps

$(PROJECT).pcb: pcb

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

$(PROJECT).gerb: $(PROJECT).pcb
	rm -f *.gbr *.cnc
	pcb -x gerber $(PROJECT).pcb
	touch $@

zip: $(PROJECT).zip

$(PROJECT).zip: $(PROJECT).gerb $(PROJECT).xy
	rm -f $(PROJECT).zip
	zip $(PROJECT).zip *.gbr *.cnc *.xy

stencil:	$(PROJECT).gerb
	zip $(PROJECT)-stencil.zip $(PROJECT).toppaste.gbr $(PROJECT).outline.gbr

clean:
	rm -f *.bom *.drc *.log *~ $(PROJECT).ps *.gbr $(PROJECT).gerb *.cnc *bak* *- *.zip 
	rm -f *.net *.xy *.cmd *.png partslist partslist.csv partslist.dk partslist.mouser muffin-5267.pdf
	rm -f *.partslist *.new.pcb *.unsorted $(PROJECT).xls
	rm -f $(PROJECT)-stencil.zip
