AC = a68g
BUILD = ./build
SOURCES := $(shell printf "%s\n" ./*.a68)
EXEC := $(SOURCES:%.a68=%)

all: $(EXEC)

%: %.a68
	@mkdir -p $(BUILD)
	( \
		cp $^ $(BUILD) && \
		cd $(BUILD) && \
		$(AC) --compile $^ && \
		$(RM) $^; \
	)

clean:
	$(RM) -rv $(BUILD)

test: all
	@bash test.sh
