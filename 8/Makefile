all:
	@mkdir -p ./build
	gplc --no-top-level fizzbuzz.pro -o ./build/fizzbuzz

test: all
	@bash test.sh

clean:
	$(RM) -rv ./build
