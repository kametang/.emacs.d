.PHONY=all clean

all: build
	$(MAKE) -C build

clean:
	$(MAKE) -C build clean

build: CMakeLists.txt
	mkdir -p build
	-rm -rf build/*
	cd build && cmake ../
	cp -f build/compile_commands.json .
