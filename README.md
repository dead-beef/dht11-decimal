# dht11-decimal

[![license](https://img.shields.io/github/license/dead-beef/dht11-decimal.svg)](
    https://github.com/dead-beef/dht11-decimal/blob/master/LICENSE
)

## Overview

Linux kernel driver for DHT11 / DHT22 with decimal part support and raw value channels.

Based on the [dht11](https://github.com/torvalds/linux/blob/master/drivers/iio/humidity/dht11.c) driver in the kernel tree.

## Installation

```bash
make
sudo make install
```

## Usage

```bash
sudo dtoverlay -v dht11-decimal gpiopin=13
```

```bash
sudo sh -c "echo 'dtoverlay=dht11-decimal,gpiopin=13' >>/boot/config.txt"
sudo reboot
```

```bash
cat /sys/bus/iio/devices/iio\:device0/{in_temp_input,in_humidityrelative_input}
```

```bash
cat /sys/bus/iio/devices/iio\:device0/{in_temp_raw,in_humidityrelative_raw}
```
