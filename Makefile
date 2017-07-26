UTID_VERSION=1.8.1

CFLAGS=-g -O2 -Wall \
			 -isysroot $(shell xcrun --show-sdk-path) \
			 -mmacosx-version-min=10.9 \
			 -DUTID_VERSION='"${UTID_VERSION}"'
FRAMEWORKS=-framework ApplicationServices -framework CoreFoundation

PB_ARGS=--ownership preserve --quiet

BINDIR=/usr/local/bin
MANDIR=/usr/local/share/man/man1

all: utid utid.1

utid: utid.o handler.o plist.o util.o
	@echo "[LD] ${@}"
	@${CC} ${CFLAGS} ${FRAMEWORKS} -o $@ $^

%.o: %.c
	@echo "[CC] ${@}"
	@${CC} ${CFLAGS} -c ${<}

install: all
	@-mkdir -p ${BINDIR}
	@-mkdir -p ${MANDIR}
	install -m 0755 -c utid ${BINDIR}
	install -m 0644 -c utid.1 ${MANDIR}
	@sed -i '' -e 's@_UTID_BUILD_DATE@$(shell date '+%B %d, %Y')@g' ${MANDIR}/utid.1

pkg: package
package: all
	@mkdir -p -m 0755 pkg/${BINDIR} pkg/${MANDIR}
	@install -m 0755 -c utid pkg/${BINDIR}
	@install -m 0644 -c utid.1 pkg/${MANDIR}
	@sed -i '' -e 's@_UTID_BUILD_DATE@$(shell date '+%B %d, %Y')@g' pkg/${MANDIR}/utid.1
	@sudo chown -R root:wheel pkg
	/usr/bin/pkgbuild \
		${PB_ARGS} \
		--root pkg \
		--identifier public-domain.mortensen.utid-installer \
		--version ${UTID_VERSION} \
		utid-${UTID_VERSION}.pkg
	@sudo rm -rf pkg

clean:
	rm -f *.o
	rm -f utid
	rm -f utid-*.pkg
