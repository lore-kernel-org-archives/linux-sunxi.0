Received: from mail.netcube.li (mail.netcube.li [173.249.15.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B2CB182B4
	for <linux-sunxi@lists.linux.dev>; Sat, 25 Jan 2025 15:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.249.15.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737817858; cv=none; b=LCdq7hZ33aZsuw6l0o0K4E+iBR5pcTH/UYsYK+FUsYtgms3uiVrICRFAvfdeK64wjcYV3BhviqJuoKErPWPS/2RX1bRXNO4ni7lxu8+H/AMcZvc0tEXEk7/BCfudv0RJso7jr3GiZtIEyJhf0s3ljIYLmfdOJVMvoUkh1JH6zwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737817858; c=relaxed/simple;
	bh=9hj/+1NWR/F+C4rqYxlAw6ubqBEWD5X0Bb8ne7hMjkE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bhZ0LJ7u64kPPR7uzsdCPdDGA9uOQfmCdLunIdCOEDDBXxTnPXIJPU9IpMqSmWCSTR1Y+v78WnVmOlvM8G0jNmIT41E/bYKxtdMMzPmmVh2eFS6gk/eSHhWFPyQb7aKuP0bnfDPEhYjYe7Pt0NuHPHO1Od4RPfMSqBxMavMMtRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=netcube.li; spf=pass smtp.mailfrom=netcube.li; dkim=pass (1024-bit key) header.d=netcube.li header.i=@netcube.li header.b=tut0xjKE; arc=none smtp.client-ip=173.249.15.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=netcube.li
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netcube.li
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=netcube.li header.i=@netcube.li header.b="tut0xjKE"
dkim-signature: v=1; a=rsa-sha256; d=netcube.li; s=s1;
	c=relaxed/relaxed; q=dns/txt; h=From:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Type:In-Reply-To:References;
	bh=w7kUXAnWCQo24F9L8mIHDy0BlmBvYr1D6V8e17tFdCI=;
	b=tut0xjKEEUNUcSLDs67VYYhJcu9Gy0+kltsnmMIm+/y+errK4sed6TBct6U3M+ZeAR443JQDJE1aLY9AqpOgK6pXfXZNYGRPB8/HsLrJjYd0aoG3Re8WWJUddc7nfzAcANhY741bUTPlDu3rdCZOLyf/8/RWcpN0JXrMr3XjDUU=
Received: from lukas-hpz440workstation.localnet (cm70-231.liwest.at [212.241.70.231])
	by mail.netcube.li with ESMTPSA
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256)
	; Sat, 25 Jan 2025 15:10:41 +0100
From: Lukas Schmid <lukas.schmid@netcube.li>
To: Andre Przywara <andre.przywara@arm.com>
Cc: linux-sunxi@lists.linux.dev
Subject:
 Re: [PATCH 1/1] ARM: dts: sunxi: add support for NetCube Systems Kumquat
Date: Sat, 25 Jan 2025 15:10:40 +0100
Message-ID: <2851364.mvXUDI8C0e@lukas-hpz440workstation>
In-Reply-To: <20250102143116.1495cb77@donnerap.manchester.arm.com>
References:
 <20250102121859.3547-1-lukas.schmid@netcube.li>
 <20250102143116.1495cb77@donnerap.manchester.arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart12681400.O9o76ZdvQC";
 micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart12681400.O9o76ZdvQC
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Lukas Schmid <lukas.schmid@netcube.li>
To: Andre Przywara <andre.przywara@arm.com>
Cc: linux-sunxi@lists.linux.dev
Date: Sat, 25 Jan 2025 15:10:40 +0100
Message-ID: <2851364.mvXUDI8C0e@lukas-hpz440workstation>
In-Reply-To: <20250102143116.1495cb77@donnerap.manchester.arm.com>
MIME-Version: 1.0

On Thursday, January 2, 2025 3:31:16 PM CET Andre Przywara wrote:
> On Thu,  2 Jan 2025 12:18:59 +0000
> Lukas Schmid <lukas.schmid@netcube.li> wrote:
> 
> Hi Lukas,
> 
> thanks for taking care and sending a patch!
> 
> I guess you want the DT merged into the official repositories? Then you
> would need to send the patch to the Linux kernel mailing lists, having the
> sunxi maintainers in To:, and the lists in Cc:.
> $ scripts/get_maintainer.pl 0001-name.patch
> would give you the exact list.
> 
> Also you would need to add the vendor name and the board name to the
> bindings, see patches 12 and 13 for an example here:
> https://lore.kernel.org/linux-sunxi/20241111013033.22793-13-andre.przywara@a
> rm.com/T/#u
> 
> So this would make this patch a 3-patch series (vendor prefix, board name,
> dts file).
> 
> > NetCube Systems Kumquat is a board based on the Allwinner V3s SoC,
> > including:
> > 
> > - 64MB DDR2 included in SoC
> > - 10/100 Mbps Ethernet
> > - USB-C DRD
> > - Audio Codec
> > - Isolated CAN-FD
> > - ESP32 over SDIO
> > - 8MB SPI-NOR Flash for bootloader
> > - I2C EEPROM for MAC addresses
> > - SDIO Connector for eMMC or SD-Card
> > - 8x 12/24V IOs, 4x normally open relays
> > - DS3232 RTC
> > - QWIIC connectors for external I2C devices
> > 
> > Signed-off-by: Lukas Schmid <lukas.schmid@netcube.li>
> > ---
> > 
> >  arch/arm/boot/dts/allwinner/Makefile          |   2 +
> >  .../allwinner/sun8i-v3s-netcube-kumquat.dts   | 269 ++++++++++++++++++
> >  2 files changed, 271 insertions(+)
> >  create mode 100644
> >  arch/arm/boot/dts/allwinner/sun8i-v3s-netcube-kumquat.dts> 
> > diff --git a/arch/arm/boot/dts/allwinner/Makefile
> > b/arch/arm/boot/dts/allwinner/Makefile index 48666f73e638..d799ad153b37
> > 100644
> > --- a/arch/arm/boot/dts/allwinner/Makefile
> > +++ b/arch/arm/boot/dts/allwinner/Makefile
> > @@ -199,6 +199,7 @@ DTC_FLAGS_sun8i-h3-nanopi-r1 := -@
> > 
> >  DTC_FLAGS_sun8i-h3-orangepi-pc := -@
> >  DTC_FLAGS_sun8i-h3-bananapi-m2-plus-v1.2 := -@
> >  DTC_FLAGS_sun8i-h3-orangepi-pc-plus := -@
> > 
> > +DTC_FLAGS_sun8i-v3s-netcube-kumquat := -@
> > 
> >  dtb-$(CONFIG_MACH_SUN8I) += \
> >  
> >       sun8i-a23-evb.dtb \
> >       sun8i-a23-gt90h-v4.dtb \
> > 
> > @@ -261,6 +262,7 @@ dtb-$(CONFIG_MACH_SUN8I) += \
> > 
> >       sun8i-v3s-anbernic-rg-nano.dtb \
> >       sun8i-v3s-licheepi-zero.dtb \
> >       sun8i-v3s-licheepi-zero-dock.dtb \
> > 
> > +     sun8i-v3s-netcube-kumquat.dtb \
> > 
> >       sun8i-v40-bananapi-m2-berry.dtb
> >  
> >  dtb-$(CONFIG_MACH_SUN9I) += \
> >  
> >       sun9i-a80-optimus.dtb \
> > 
> > diff --git a/arch/arm/boot/dts/allwinner/sun8i-v3s-netcube-kumquat.dts
> > b/arch/arm/boot/dts/allwinner/sun8i-v3s-netcube-kumquat.dts new file mode
> > 100644
> > index 000000000000..1793a9b7f796
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/allwinner/sun8i-v3s-netcube-kumquat.dts
> > @@ -0,0 +1,269 @@
> > +// SPDX-License-Identifier: GPL-2.0
> 
> DT files should have a dual license header:
>         SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> 
> > +/*
> > + * Copyright (C) 2025 Lukas Schmid <lukas.schmid@netcube.li>
> > + */
> > +
> > +/dts-v1/;
> > +#include "sun8i-v3s.dtsi"
> > +
> > +#include <dt-bindings/input/input.h>
> > +#include <dt-bindings/leds/common.h>
> > +#include <dt-bindings/gpio/gpio.h>
> > +
> > +/{
> > +     model = "NetCube Systems Kumquat";
> > +     compatible = "netcube,kumquat", "allwinner,sun8i-v3s";
> > +
> > +     aliases {
> > +             serial0 = &uart0;
> > +             ethernet0 = &emac;
> > +             rtc0 = &ds3232;
> > +     };
> > +
> > +     chosen {
> > +             stdout-path = "serial0:115200n8";
> > +     };
> > +
> > +     cpus {
> > +             cpu0: cpu@0 {
> > +                     clock-frequency = <1200000000>;
> > +             };
> > +     };
> 
> Please remove this node. I do understand that the kernel complains about
> the missing property, but this warning is severely outdated (in the age of
> DVFS) and should be removed instead.
> 
> > +
> > +     leds {
> > +             compatible = "gpio-leds";
> > +
> > +             heartbeat_led {
> > +                     gpios = <&pio 4 4 GPIO_ACTIVE_HIGH>; /* PE4 */
> > +                     linux,default-trigger = "heartbeat";
> > +                     function = LED_FUNCTION_HEARTBEAT;
> > +                     color = <LED_COLOR_ID_GREEN>;
> > +             };
> > +
> > +             mmc0_act_led {
> > +                     gpios = <&pio 5 6 GPIO_ACTIVE_HIGH>; /* PF6 */
> > +                     linux,default-trigger = "mmc0";
> > +                     function = LED_FUNCTION_DISK;
> > +                     color = <LED_COLOR_ID_GREEN>;
> > +             };
> > +     };
> > +
> > +     gpio-keys {
> > +             compatible = "gpio-keys";
> > +             autorepeat;
> > +
> > +             key-user {
> > +                     label = "GPIO Key User";
> > +                     linux,code = <KEY_PROG1>;
> > +                     gpios = <&pio 1 2 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
> > /* PB2 */ +             };
> > +     };
> > +
> > +     reg_vcc5v0: vcc5v0 {
> 
> Can you add a comment here where this voltage comes from? I guess it's the
> primary board power supply, via some USB or barrel plug? Just add a
> one-liner comment here to make it clear this is the root of the power tree.
> 
> > +             compatible = "regulator-fixed";
> > +             regulator-name = "vcc5v0";
> > +             regulator-min-microvolt = <5000000>;
> > +             regulator-max-microvolt = <5000000>;
> > +     };
> > +
> > +     reg_vcc3v3: vcc3v3 {
> 
> What kind of regulator is this? Some discrete linear or buck regulator?
> Can you add a one-line comment stating the type, and maybe the model?
> 
> Those always-on fixed regulators are sometimes sketchy, so we would like
> to know why they cannot be controlled.
> 
> > +             compatible = "regulator-fixed";
> > +             regulator-name = "vcc3v3";
> > +             regulator-min-microvolt = <3300000>;
> > +             regulator-max-microvolt = <3300000>;
> > +             vin-supply = <&reg_vcc5v0>;
> > +     };
> > +
> > +     reg_vcc3v0: vcc3v0 {
> 
> Same here, please give people an idea what kind of regulator this is.
> 
> > +             compatible = "regulator-fixed";
> > +             regulator-name = "vcc3v0";
> > +             regulator-min-microvolt = <3000000>;
> > +             regulator-max-microvolt = <3000000>;
> > +             vin-supply = <&reg_vcc3v3>;
> > +     };
> > +
> > +     can0_osc: can0_osc {
> 
> Is that a crystal oscillator on the board? Can you state that in a brief
> comment, please?
> 
> > +             compatible = "fixed-clock";
> > +             #clock-cells = <0>;
> > +             clock-frequency  = <40000000>;
> > +     };
> > +};
> > +
> > +&mmc0 {
> > +     pinctrl-names = "default";
> > +     pinctrl-0 = <&mmc0_pins>;
> > +     vmmc-supply = <&reg_vcc3v3>;
> > +     bus-width = <4>;
> > +     broken-cd;
> > +     status = "okay";
> > +};
> > +
> > +&mmc1 {
> > +     pinctrl-names = "default";
> > +     pinctrl-0 = <&mmc1_pins>;
> > +     vmmc-supply = <&reg_vcc3v3>;
> > +     bus-width = <4>;
> > +     broken-cd;
> > +     status = "okay";
> > +};
> > +
> > +&usb_otg {
> > +     extcon = <&tusb320 0>;
> > +     dr_mode = "otg";
> > +     status = "okay";
> > +};
> > +
> > +&usbphy {
> > +     usb0_id_det-gpios = <&pio 1 4 GPIO_ACTIVE_HIGH>; /* PB4 */
> > +     status = "okay";
> > +};
> > +
> > +&ehci {
> > +     /delete-property/ phys;
> > +     /delete-property/ phy-names;
> 
> Why is this?
> 
> > +     status = "okay";
> > +};
> > +
> > +&ohci {
> > +     /delete-property/ phys;
> > +     /delete-property/ phy-names;
> > +     status = "okay";
> > +};
> > +
> > +&lradc {
> > +     vref-supply = <&reg_vcc3v0>;
> > +     status = "disabled";
> 
> Why would you specify the supply voltage, but then keep it disabled?
> Either it's not working or not usable, then you wouldn't need to do
> anything (since the status is already "disabled", so that's definitely
> redundant), or it's good, then you should say 'status = "okay";'
> 
> > +};
> > +
> > +&codec {
> > +     allwinner,audio-routing =
> > +             "Headphone", "HP",
> > +             "Headphone", "HPCOM",
> > +             "MIC1", "Mic",
> > +             "Mic", "HBIAS";
> > +     status = "okay";
> > +};
> > +
> > +&uart0 {
> > +     pinctrl-0 = <&uart0_pb_pins>;
> > +     pinctrl-names = "default";
> > +     status = "okay";
> > +};
> > +
> > +&uart1 {
> > +     pinctrl-0 = <&uart1_pins>;
> > +     pinctrl-names = "default";
> > +     status = "okay";
> > +};
> > +
> > +&i2c0 {
> > +     pinctrl-0 = <&i2c0_pins>;
> > +     pinctrl-names = "default";
> > +     status = "okay";
> > +
> > +     eeprom0: eeprom@50 {
> > +             compatible = "atmel,24c02";             /* actually it's a
> > 24AA02E48 */ +             pagesize = <16>;
> > +             read-only;
> > +             reg = <0x50>;
> > +             vcc-supply = <&reg_vcc3v3>;
> > +
> > +             #address-cells = <1>;
> > +             #size-cells = <1>;
> > +
> > +             eth0_macaddress: eth0_macaddress@FA {
> > +                     reg = <0xFA 0x06>;
> > +             };
> > +     };
> > +
> > +     tusb320: tusb320@60 {
> > +             compatible = "ti,tusb320";
> > +             reg = <0x60>;
> > +             interrupt-parent = <&pio>;
> > +             interrupts = <1 5 IRQ_TYPE_EDGE_FALLING>;
> > +     };
> > +
> > +     ds3232: rtc@68 {
> > +             compatible = "dallas,ds3232";
> > +             reg = <0x68>;
> > +     };
> > +};
> > +
> > +&emac {
> > +     allwinner,leds-active-low;
> > +     nvmem-cells = <&eth0_macaddress>;               /* custom nvmem
> > reference */ +     nvmem-cell-names = "mac-address";               /* see
> > ethernet-controller.yaml */ +     status = "okay";
> > +};
> > +
> > +&spi0 {
> > +     #address-cells = <1>;
> > +     #size-cells = <0>;
> > +     pinctrl-names = "default";
> > +     pinctrl-0 = <&spi0_pins>;
> > +     cs-gpios = <0>, <&pio 1 0 GPIO_ACTIVE_LOW>; /* PB0 */
> > +     status = "okay";
> > +
> > +     flash@0 {
> > +             #address-cells = <1>;
> > +             #size-cells = <1>;
> > +             reg = <0>;
> > +             compatible = "jedec,spi-nor";
> > +             label = "firmware";
> > +             spi-max-frequency = <40000000>;
> > +     };
> > +
> > +     can@1 {
> > +        compatible = "microchip,mcp2518fd";
> > +        reg = <1>;
> 
> The indentation is not right for the two lines above.
> 
> > +             clocks = <&can0_osc>;
> > +             pinctrl-names = "default";
> > +             pinctrl-0 = <&can0_pins>;
> 
> What is this pin for? If I get this correctly, this is a SPI to CAN
> bridge, right? Why would it require a GPIO on the host SoC?
> (see below)
> 
> > +             spi-max-frequency = <20000000>;
> > +             interrupt-parent = <&pio>;
> > +             interrupts = <1 1 IRQ_TYPE_LEVEL_LOW>;
> 
> Ah, I guess it's for the interrupt? In this case I think you do not
> declare this via pinctrl, as the PIO interrupt controller should reserve
> this pin, configuring it with the EINT pinmux.
> 
> And please add a comment with the pin name in it (PB1).
> 
> > +             vdd-supply = <&reg_vcc3v3>;
> > +             xceiver-supply = <&reg_vcc3v3>;
> > +     };
> > +};
> > +
> > +&rtc {
> > +     status = "disabled";
> 
> I don't think you can do that, since we rely on some clocks provided by
> the RTC device. I guess you want to say that the kernel should use the I2C
> RTC instead of the built-in one, but this should already be covered by the
> rtc0 alias above?
> 
> > +};
> > +
> > +&pio {
> > +     vcc-pb-supply = <&reg_vcc3v3>;
> > +     vcc-pc-supply = <&reg_vcc3v3>;
> > +     vcc-pe-supply = <&reg_vcc3v3>;
> > +     vcc-pf-supply = <&reg_vcc3v3>;
> > +     vcc-pg-supply = <&reg_vcc3v3>;
> > +
> > +     gpio-reserved-ranges = <0 32>, <42 22>, <68 28>, <96 32>, <153 7>,
> > <167 25>, <198 26>; +     gpio-line-names = "", "", "", "", "", "", "",
> > "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "",
> > "", "", "", "", "", "", "", //PA +                                       
> >      "CAN_nCS", "CAN_nINT", "USER_SW", "PB3", "USB_ID", "USBC_nINT",
> > "I2C0_SCL", "I2C0_SDA", "UART0_TX", "UART0_RX", "", "", "", "", "", "",
> > "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", //PB +   
> >                                          "SPI_MISO", "SPI_SCK",
> > "FLASH_nCS", "SPI_MOSI", "", "", "", "", "", "", "", "", "", "", "", "",
> > "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", //PC +   
> >                                          "", "", "", "", "", "", "", "",
> > "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "",
> > "", "", "", "", "", "", //PD +                                           
> >  "Q12", "Q11", "Q10", "Q9", "LED_SYS0", "I1", "Q1", "Q2", "I2", "I3",
> > "Q3", "Q4", "I4", "I5", "Q5", "Q6", "I6", "I7", "Q7", "Q8", "I8",
> > "UART1_TXD", "UART1_RXD", "ESP_nRST", "ESP_nBOOT", "", "", "", "", "",
> > "", "", //PE +                                             "SD_D1",
> > "SD_D0", "SD_CLK", "SD_CMD", "SD_D3", "SD_D2", "LED_SYS1", "", "", "",
> > "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "",
> > "", "", "", "", //PF +                                            
> > "ESP_CLK", "ESP_CMD", "ESP_D0", "ESP_D1", "ESP_D2", "ESP_D3", "", "", "",
> > "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "",
> > "", "", "", "", ""; //PG +
> > +     uart0_pins: uart0-pins {
> > +             pins = "PB8", "PB9";
> > +             function = "uart0";
> > +     };
> 
> Why would you need that node? There is already uart0_pb_pins in the .dtsi.
> 
> > +
> > +     uart1_pins: uart1-pins {
> > +             pins = "PE21", "PE22";
> > +             function = "uart1";
> > +     };
> 
> Please specify those pinmux in the .dtsi file, as they can be shared
> across boards. It's typically the first user adding them to the .dtsi. For
> rare pins, we add a /omit-if-no-ref/ tag.
> 
> > +
> > +     spi0_pins: spi0-pins {
> > +             pins = "PC0", "PC1", "PC2", "PC3";
> > +             function = "spi0";
> > +     };
> 
> Same redundancy again, it's already in the .dtsi.
> 
> > +
> > +     can0_pins: can0-pins {
> > +             pins = "PB1";
> > +             function = "gpio_in";
> > +     };
> 
> As mentioned above, this wouldn't be needed, and in particular gpio_in
> looks wrong. It would need to be the EINT pinmux (0x6), but the PIO IRQ
> controller code takes care of that already.

Hi,

I had just tried the can-bus on my board again. It is not getting any messages 
with this removed. I do not get any interrupts according to /proc/interrupts 
now.

Is this an issue with the pio or do I just add the pinctrl back?

> 
> Cheers,
> Andre
> 
> > +};
> 
> IMPORTANT NOTICE: The contents of this email and any attachments are
> confidential and may also be privileged. If you are not the intended
> recipient, please notify the sender immediately and do not disclose the
> contents to any other person, use it for any purpose, or store or copy the
> information in any medium. Thank you.


--nextPart12681400.O9o76ZdvQC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEPv6dcBmn59ssZMkSJnN+drMVRtgFAmeU8OAACgkQJnN+drMV
RtjmKAf/fHd9cm1BwsAEje2M1BS5yzE3zL/njlAJPucIa/f/cmbJcsDGNThVPv4K
gLDzGa9Ozbr781TPQ/dsR8sLhCDacauIWRz/IAlAapsqrt17+V8RitGX7g6dgzRF
Oel3I+IGx05G4xmha3UQnkKHBpPJF2o/YGU5moLW5Reo1V/o07apWT9qKgxuvDcY
JWum6qwQs15XQOwhMcwoqz9BqLLp34OBEatwfZk+IxGn9u3LMijyUIMSlSeJZ2RF
pqgoYBzkVMHNeJyLSGT5W1QbPwaoaO/1PY1LmtmZz3G+S24mmn8jVveIbX8fNg3m
RNyIdrRELQg8gxLr7SjIoMUYd60trA==
=H8gT
-----END PGP SIGNATURE-----

--nextPart12681400.O9o76ZdvQC--




