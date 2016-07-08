DESTDIR ?= /usr/local
RTS ?= ravenscar-full-stm32f105

all: build

build: adalib/libevb1000.a

.PHONY: adalib/libevb1000.a
adalib/libevb1000.a:
	mkdir -p obj adalib
	arm-eabi-gnatmake -Pbuild/evb1000_build.gpr --RTS=$(RTS)

clean:
	gprclean -Pbuild/evb1000_build.gpr

install: build
	echo $(INST)
	install -d -m 755 $(DESTDIR)/adalib $(DESTDIR)/adainclude
	install -p -m 644 $(CURDIR)/adalib/libevb1000.a $(CURDIR)/adalib/*.ali $(DESTDIR)/adalib/
	install -p -m 644 $(CURDIR)/src/*.ads $(DESTDIR)/adainclude/
	install -p -m 644 build/evb1000.gpr $(DESTDIR)/
