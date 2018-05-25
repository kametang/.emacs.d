.PHONY=all cmake

all: cmake
	$(MAKE) -C build

cmake:
	mkdir -p build
	-rm -rf build/*
	cd build && cmake ../
	cp -f build/compile_commands.json .
