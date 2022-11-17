obj-m += dht11-decimal.o

all: module overlay

module:
	make -C /lib/modules/$(shell uname -r)/build M=$(shell pwd) modules

overlay:
	dtc -I dts -O dtb -o dht11-decimal.dtbo -b 0 -@ dht11-decimal-overlay.dts

clean:
	make -C /lib/modules/$(shell uname -r)/build M=$(shell pwd) clean
	rm -f dht11-decimal.dtbo

install-module:
	install -m644 dht11-decimal.ko /lib/modules/$(shell uname -r)/kernel/drivers/iio/humidity
	depmod -a

install-overlay:
	install -m755 dht11-decimal.dtbo /boot/overlays

install: install-module install-overlay
