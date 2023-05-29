# elazyupg

include config.mk

all:

install: all
	@echo Installing scripts to ${DESTDIR}${PREFIX}/bin
	@mkdir -p ${DESTDIR}${PREFIX}/bin
	@cd bin ; \
	for i in *; \
	do \
		cp $$i ${DESTDIR}${PREFIX}/bin; \
		chmod 755 ${DESTDIR}${PREFIX}/bin/$$i ; \
	done ; true
	@echo Installing manual page to ${DESTDIR}${MANPREFIX}/man1
	@mkdir -p ${DESTDIR}${MANPREFIX}/man1
	@sed "s/VERSION/${VERSION}/g" < elazyupg.1 > ${DESTDIR}${MANPREFIX}/man1/elazyupg.1
	@chmod 644 ${DESTDIR}${MANPREFIX}/man1/elazyupg.1


uninstall:
	@echo Removing scripts from ${DESTDIR}${PREFIX}/bin/
	@echo Removing man-pages from ${DESTDIR}${MANPREFIX}/man1/
	@cd bin; \
	for i in *; \
	do \
		rm -f ${DESTDIR}${PREFIX}/bin/$$i ; \
		rm -f ${DESTDIR}${MANPREFIX}/man1/elazyupg.1 ; \
	done; true
.PHONY: all install uinstall
