OBJS = src/ACV_main.o \
       src/ACV_match.o \
       src/ACV_ref.o \
       src/ACV_render.o \
       src/intset.o \
       src/strutil.o \
       data/ACV_data.o
CFLAGS += -Wall -Isrc/
LDLIBS += -lreadline

ACV: $(OBJS)
	$(CC) -o $@ $(LDFLAGS) $(OBJS) $(LDLIBS)

src/ACV_main.o: src/ACV_main.c src/ACV_config.h src/ACV_data.h src/ACV_match.h src/ACV_ref.h src/ACV_render.h src/strutil.h

src/ACV_match.o: src/ACV_match.h src/ACV_match.c src/ACV_config.h src/ACV_data.h src/ACV_ref.h

src/ACV_ref.o: src/ACV_ref.h src/ACV_ref.c src/intset.h src/ACV_data.h

src/ACV_render.o: src/ACV_render.h src/ACV_render.c src/ACV_config.h src/ACV_data.h src/ACV_match.h src/ACV_ref.h

src/insetset.o: src/intset.h src/insetset.c

src/strutil.o: src/strutil.h src/strutil.c

data/ACV_data.o: src/ACV_data.h data/ACV_data.c

data/ACV_data.c: data/ACV.tsv data/generate.awk src/ACV_data.h
	awk -f data/generate.awk $< > $@

.PHONY: clean
clean:
	rm -rf $(OBJS) ACV
