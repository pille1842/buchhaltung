PREFIX=/usr/local

help:
	@echo 'Run sudo make install to install this to $(PREFIX)/bin.'

install:
	install -m755 bh $(PREFIX)/bin
