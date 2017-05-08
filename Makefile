DESTDIR ?= /usr/local
RTS ?= ravenscar-full-stm32f105

all: build

build: adalib/libevb1000.a

.PHONY: adalib/libevb1000.a
adalib/libevb1000.a:
	mkdir -p obj adalib
	gprbuild --target=arm-eabi -d -Pbuild/evb1000_build.gpr

clean:
	gprclean -Pbuild/evb1000_build.gpr

install: build
	install -d -m 755 $(DESTDIR)/adalib $(DESTDIR)/adainclude
	install -p -m 644 $(CURDIR)/adalib/libevb1000.a $(CURDIR)/adalib/*.ali $(DESTDIR)/adalib/
	install -p -m 644 $(CURDIR)/src/*.ads $(DESTDIR)/adainclude/
	install -p -m 644 build/evb1000.gpr $(DESTDIR)/
	
install_local: DESTDIR=evb1000
install_local: install
    

