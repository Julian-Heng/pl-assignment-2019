FC = f77
BUILD = ./build
SOURCES := $(shell printf "%s\n" ./*.f)
EXEC := $(SOURCES:%.f=%)

all: $(EXEC)

%: %.f
	@mkdir -p $(BUILD)
	$(FC) -o $(BUILD)/$@ $^

clean:
	$(RM) -rv $(BUILD)

test: all
	@bash test.sh
