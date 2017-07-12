.PHONY: all bootloader clean check

bootloader:
	/usr/local/opt/llvm/bin/clang --target=i386-elf -m16 -c stage_1.s -o stage_1.o
	/usr/local/opt/llvm/bin/ld.lld --oformat binary -T stage_1.ld stage_1.o -o a.out

clean:
	rm -f *.o
	rm -f a.out
