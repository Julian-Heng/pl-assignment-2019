AC = gcc
AFLAGS = -c
BUILD = ./build
SOURCES := $(shell printf "%s\n" ./*.adb)
EXEC := $(SOURCES:%.adb=%)

all: $(EXEC)

%: %.adb
	@mkdir -p $(BUILD)
	$(AC) -o $(BUILD)/$(^:%.adb=%).o $(AFLAGS) $^
	gnatbind $(BUILD)/$(^:%.adb=%) && \
		gnatlink $(BUILD)/$(^:%.adb=%) -o $(BUILD)/$(^:%.adb=%)


clean:
	$(RM) -rv $(BUILD)


test: all
	@bash test.sh
