.PHONY: all bootloader clean check

bootloader:
	/usr/local/opt/llvm/bin/clang --target=i386-elf -m16 -c boot.s -o boot.o
	/usr/local/opt/llvm/bin/ld.lld --oformat binary -T boot.ld boot.o -o a.out

clean:
	rm -f *.o
	rm -f a.out
