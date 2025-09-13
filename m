Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA7961B5EB5
	for <linux-sunxi@lists.linux.dev>; Sat, 13 Sep 2025 09:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757754184; cv=none; b=VYW4kWJpeFjIiacZLsZnEfXEOBBC/54SCntL6xcsFFmdC01lYNH7+Rh1snm7Htwj268BSq6XVLkHYJyki9Fi3vzdNgeILY3aopEBRkIg5Kkgb78kwUkTdKd4sP1Z8CDm8qXdBVdVIyrfM4Y7lFzekFg7JEdSpyUDtTHjOCHaeSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757754184; c=relaxed/simple;
	bh=FtkU5WbYNwooptUFdXcibNW6kvMRzKs6zenXx6kEbT4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=noQtJXnfGS9DoxbLPuOxqCywFRA1YE3YpjJGvuhOLN7qzei1djMeRn+BIhdbyQ5bYhH+011Sjr8RnbzjR6X1LuDKN6RJG90sO3/qgssNvubLIpfh+M15iN0Dp9H257CR52m9U9nzh873jbEPGB4ujIUV9MLjtPnnB6R+ij2el1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-55ce508d4d6so2573364e87.0
        for <linux-sunxi@lists.linux.dev>; Sat, 13 Sep 2025 02:03:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757754179; x=1758358979;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+9yf8Ktp4HQCNlkhLraLZ3muqM4SOy6F+jw9y0V/VXs=;
        b=wrkhFIcO1LQYElXijjsbalBgdRF10JIQG6WVexF5H7vF2fCqfTZi5cwPFKHSQldDPE
         PWkNCt4eLzb6vYt1tL0vVkSIlWExGRpSlJxs5LMARqpTNxm2tr+gLRaXCBW8X3p5kUfK
         xcPBpeIdUtD15yiw/nY4MTS6noqZOnM41Md07E578KRl4I/C+JFHQr3NoaUNKUJgb02Y
         1ugTZoV7+IIAsiTqN6DJtjKHKFWCNBZjkXJ/DsvLpa2bT+NK5xi1sE44sYEKNrJSZq7y
         7cMU4BUTRr2wQW61oYYMMUaK5L/P7jr++8orOv7IbM1oEozDkOQyx3I+FFJ+3cp2dxsR
         WHmg==
X-Forwarded-Encrypted: i=1; AJvYcCWu4jmPy4SIas38i5MG42kOQvjkSe/0mnYOHQa8+dISRPtKaR5oyP4KCyM2wyWrkTnSjUsiwiTQtZmHJw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz+FGDBSVEhLlYv0FQOaYKDHz9sPfUvsACXCJ7yS3MCj3crj74A
	yLEGNwUHrWeqyrGs3gDZZYxQzF6qeWXw9nZOsIvFEQ67qPFGlOXpKnA+z7SIyeGg
X-Gm-Gg: ASbGncv/a6YyCjzOWfuaH5GvULHrxW997TxnL8VKlwq2x5s5GQatinmkVfowFa9qGFW
	UoOx/Bg7rxOEuwZYDgjgOWNlG38GqckQ/HKgZrRfi+OR7GjYom+WZ+OWlGAr8ngXoBJrDcuFGJB
	6IexUxPcZ1L619TkHJy8M/xW9Zx/XD/hxrI4U6PK0o5UAL7RDuVJDWNzGF/GKCm0uosY6ZPiD8f
	tkvP2DtfaZchP8UYeCMuygYKLkYT8pQkCCU7GYh0BVizDXy/URl/m/KB7RP2bAtCck6NqrtulhD
	oeMnfZsCWBZRQeyNxMLR3yMPuPpzuOkr+uxAYWTcqNeg8qEwKQ42Kq6CDdI097LAIt83eUyvekA
	QAsK0C9GKcrLukphBBVsAHF+LElMquok0GifVIYgwiUSfnT+4wDVwO6E=
X-Google-Smtp-Source: AGHT+IEwL5q+Wzsbo+EH5AuZf29104yQ62STMipDME/0+aKDVUNs+YD+Vrmn68oKrZBfLdLdkdTv7g==
X-Received: by 2002:a05:6512:4604:b0:570:eea6:74ea with SMTP id 2adb3069b0e04-570eea67840mr1493513e87.8.1757754178539;
        Sat, 13 Sep 2025 02:02:58 -0700 (PDT)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com. [209.85.208.175])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56e5c3b62besm1810525e87.1.2025.09.13.02.02.56
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Sep 2025 02:02:58 -0700 (PDT)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-336ce4a8bfcso20746481fa.0
        for <linux-sunxi@lists.linux.dev>; Sat, 13 Sep 2025 02:02:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWOQ8BPe0eh3cxsxFtkxToHAyQzcczt4ibN1g7l8Z8SmgwDwEEhpM1fjlD3wVKmsfr4OIWP7PpVUCuIJA==@lists.linux.dev
X-Received: by 2002:a05:651c:31da:b0:338:11e1:c7d9 with SMTP id
 38308e7fff4ca-351415650afmr16006951fa.43.1757754176539; Sat, 13 Sep 2025
 02:02:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250831162536.2380589-1-lukas.schmid@netcube.li> <20250831162536.2380589-4-lukas.schmid@netcube.li>
In-Reply-To: <20250831162536.2380589-4-lukas.schmid@netcube.li>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Sat, 13 Sep 2025 17:02:44 +0800
X-Gmail-Original-Message-ID: <CAGb2v66iD1BBwOeECrckmf_d-xQmmMzFhkj-SjO5ja7i1f0YDw@mail.gmail.com>
X-Gm-Features: Ac12FXxX2oqvFnH_76fKkzLJQXu3WsG74ENxnFjJOqn4Ha6355qDBEr_yZ7zdgg
Message-ID: <CAGb2v66iD1BBwOeECrckmf_d-xQmmMzFhkj-SjO5ja7i1f0YDw@mail.gmail.com>
Subject: Re: [PATCH v8 3/5] ARM: dts: sunxi: add support for NetCube Systems
 Nagami SoM
To: Lukas Schmid <lukas.schmid@netcube.li>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Sep 1, 2025 at 12:26=E2=80=AFAM Lukas Schmid <lukas.schmid@netcube.=
li> wrote:
>
> NetCube Systems Nagami SoM is a module based around the Allwinner T113s
> SoC. It includes the following features and interfaces:
>
> - 128MB DDR3 included in SoC
> - 10/100 Mbps Ethernet using LAN8720A phy
> - One USB-OTG interface
> - One USB-Host interface
> - One I2S interface with in and output support
> - Two CAN interfaces
> - ESP32 over SDIO
> - One SPI interface
> - I2C EEPROM for MAC address
> - One QWIIC I2C Interface with dedicated interrupt pin shared with EEPROM
> - One external I2C interface
> - SD interface for external SD-Card
>
> Signed-off-by: Lukas Schmid <lukas.schmid@netcube.li>
> ---
>  .../allwinner/sun8i-t113s-netcube-nagami.dtsi | 250 ++++++++++++++++++
>  1 file changed, 250 insertions(+)
>  create mode 100644 arch/arm/boot/dts/allwinner/sun8i-t113s-netcube-nagam=
i.dtsi
>
> diff --git a/arch/arm/boot/dts/allwinner/sun8i-t113s-netcube-nagami.dtsi =
b/arch/arm/boot/dts/allwinner/sun8i-t113s-netcube-nagami.dtsi
> new file mode 100644
> index 0000000000000..4d3627f6d58d2
> --- /dev/null
> +++ b/arch/arm/boot/dts/allwinner/sun8i-t113s-netcube-nagami.dtsi
> @@ -0,0 +1,250 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (C) 2025 Lukas Schmid <lukas.schmid@netcube.li>
> + */
> +
> +/dts-v1/;
> +#include "sun8i-t113s.dtsi"
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
> +
> +/ {
> +       model =3D "NetCube Systems Nagami SoM";
> +       compatible =3D "netcube,nagami", "allwinner,sun8i-t113s";
> +
> +       aliases {
> +               serial1 =3D &uart1; // ESP32 Bootloader UART
> +               serial3 =3D &uart3; // Console UART on Card Edge
> +               ethernet0 =3D &emac;
> +       };
> +
> +       chosen {
> +               stdout-path =3D "serial3:115200n8";
> +       };
> +
> +       /* module wide 3.3V supply directly from the card edge */
> +       reg_vcc3v3: regulator-3v3 {
> +               compatible =3D "regulator-fixed";
> +               regulator-name =3D "vcc-3v3";
> +               regulator-min-microvolt =3D <3300000>;
> +               regulator-max-microvolt =3D <3300000>;
> +               regulator-always-on;
> +       };
> +
> +       /* SY8008 DC/DC regulator on the board, also supplying VDD-SYS */
> +       reg_vcc_core: regulator-core {
> +               compatible =3D "regulator-fixed";
> +               regulator-name =3D "vcc-core";
> +               regulator-min-microvolt =3D <880000>;
> +               regulator-max-microvolt =3D <880000>;
> +               vin-supply =3D <&reg_vcc3v3>;
> +       };
> +
> +       /* USB0 MUX to switch connect to Card-Edge only after BootROM */
> +       usb0_sec_mux: mux-controller{
> +               compatible =3D "gpio-mux";
> +               #mux-control-cells =3D <0>;
> +               mux-gpios =3D <&pio 3 9 GPIO_ACTIVE_HIGH>; /* PD9 */
> +               idle-state =3D <1>; /* USB connected to Card-Edge by defa=
ult */
> +       };
> +
> +       /* Reset of ESP32 */
> +       wifi_pwrseq: wifi-pwrseq {
> +               compatible =3D "mmc-pwrseq-simple";
> +               reset-gpios =3D <&pio 6 9 GPIO_ACTIVE_LOW>; /* PG9 */
> +               post-power-on-delay-ms =3D <1500>;
> +               power-off-delay-us =3D <200>;
> +       };
> +};
> +
> +&cpu0 {
> +       cpu-supply =3D <&reg_vcc_core>;
> +};
> +
> +&cpu1 {
> +       cpu-supply =3D <&reg_vcc_core>;
> +};
> +
> +&dcxo {
> +       clock-frequency =3D <24000000>;
> +};
> +
> +&emac {
> +       nvmem-cells =3D <&eth0_macaddress>;
> +       nvmem-cell-names =3D "mac-address";
> +       phy-handle =3D <&lan8720a>;
> +       phy-mode =3D "rmii";
> +       pinctrl-0 =3D <&rmii_pe_pins>;
> +       pinctrl-names =3D "default";
> +       status =3D "okay";
> +};
> +
> +/* Default I2C Interface on Card-Edge */
> +&i2c2 {
> +       pinctrl-0 =3D <&i2c2_pins>;
> +       pinctrl-names =3D "default";
> +       status =3D "disabled";
> +};
> +
> +/* Exposed as the QWIIC connector and used by the internal EEPROM */
> +&i2c3 {
> +       pinctrl-0 =3D <&i2c3_pins>;
> +       pinctrl-names =3D "default";
> +       status =3D "okay";
> +
> +       eeprom0: eeprom@50 {
> +               compatible =3D "atmel,24c02";             /* actually it'=
s a 24AA02E48 */
> +               reg =3D <0x50>;
> +               pagesize =3D <16>;
> +               read-only;
> +               vcc-supply =3D <&reg_vcc3v3>;
> +
> +               #address-cells =3D <1>;
> +               #size-cells =3D <1>;
> +
> +               eth0_macaddress: macaddress@fa {
> +                       reg =3D <0xfa 0x06>;
> +               };
> +       };
> +};
> +
> +/* Default I2S Interface on Card-Edge */
> +&i2s1 {
> +       pinctrl-0 =3D <&i2s1_pins>, <&i2s1_din_pins>, <&i2s1_dout_pins>;
> +       pinctrl-names =3D "default";
> +       status =3D "disabled";
> +};
> +
> +/* Phy is on SoM. MDI signals pre-magentics are on the card edge */

                                 ^ pre-magnetics?

Will fix up when applying if nothing else in the series is wrong.

ChenYu

> +&mdio {
> +       lan8720a: ethernet-phy@0 {
> +               compatible =3D "ethernet-phy-ieee802.3-c22";
> +               reg =3D <0>;
> +       };
> +};
> +
> +/* Default SD Interface on Card-Edge */
> +&mmc0 {
> +       pinctrl-0 =3D <&mmc0_pins>;
> +       pinctrl-names =3D "default";
> +       status =3D "disabled";
> +};
> +
> +/* Connected to the on-board ESP32 */
> +&mmc1 {
> +       pinctrl-0 =3D <&mmc1_pins>;
> +       pinctrl-names =3D "default";
> +       vmmc-supply =3D <&reg_vcc3v3>;
> +       bus-width =3D <4>;
> +       non-removable;
> +       mmc-pwrseq =3D <&wifi_pwrseq>;
> +       status =3D "okay";
> +};
> +
> +/* Connected to the on-board eMMC */
> +&mmc2 {
> +       pinctrl-0 =3D <&mmc2_pins>;
> +       pinctrl-names =3D "default";
> +       vmmc-supply =3D <&reg_vcc3v3>;
> +       vqmmc-supply =3D <&reg_vcc3v3>;
> +       bus-width =3D <4>;
> +       non-removable;
> +       status =3D "okay";
> +};
> +
> +&pio {
> +       vcc-pb-supply =3D <&reg_vcc3v3>;
> +       vcc-pc-supply =3D <&reg_vcc3v3>;
> +       vcc-pd-supply =3D <&reg_vcc3v3>;
> +       vcc-pe-supply =3D <&reg_vcc3v3>;
> +       vcc-pf-supply =3D <&reg_vcc3v3>;
> +       vcc-pg-supply =3D <&reg_vcc3v3>;
> +
> +       gpio-line-names =3D "", "", "", "", // PA
> +                                         "", "", "", "",
> +                                         "", "", "", "",
> +                                         "", "", "", "",
> +                                         "", "", "", "",
> +                                         "", "", "", "",
> +                                         "", "", "", "",
> +                                         "", "", "", "",
> +                                         "", "", "CAN0_TX", "CAN0_RX", /=
/ PB
> +                                         "CAN1_TX", "CAN1_RX", "UART3_TX=
", "UART3_RX",
> +                                         "", "", "", "",
> +                                         "", "", "", "",
> +                                         "", "", "", "",
> +                                         "", "", "", "",
> +                                         "", "", "", "",
> +                                         "", "", "", "",
> +                                         "", "", "eMMC_CLK", "eMMC_CMD",=
 // PC
> +                                         "eMMC_D2", "eMMC_D1", "eMMC_D0"=
, "eMMC_D3",
> +                                         "", "", "", "",
> +                                         "", "", "", "",
> +                                         "", "", "", "",
> +                                         "", "", "", "",
> +                                         "", "", "", "",
> +                                         "", "", "", "",
> +                                         "", "", "", "", // PD
> +                                         "", "", "", "",
> +                                         "", "USB_SEC_EN", "SPI1_CS", "S=
PI1_CLK",
> +                                         "SPI1_MOSI", "SPI1_MISO", "SPI1=
_HOLD", "SPI1_WP",
> +                                         "PD16", "", "", "",
> +                                         "I2C2_SCL", "I2C2_SDA", "PD22",=
 "",
> +                                         "", "", "", "",
> +                                         "", "", "", "",
> +                                         "ETH_CRSDV", "ETH_RXD0", "ETH_R=
XD1", "ETH_TXCK", // PE
> +                                         "ETH_TXD0", "ETH_TXD1", "ETH_TX=
EN", "",
> +                                         "ETH_MDC", "ETH_MDIO", "QWIIC_n=
INT", "",
> +                                         "", "", "", "",
> +                                         "", "", "", "",
> +                                         "", "", "", "",
> +                                         "", "", "", "",
> +                                         "", "", "", "",
> +                                         "SD_D1", "SD_D0", "SD_CLK", "SD=
_CLK", // PF
> +                                         "SD_D3", "SD_D2", "PF6", "",
> +                                         "", "", "", "",
> +                                         "", "", "", "",
> +                                         "", "", "", "",
> +                                         "", "", "", "",
> +                                         "", "", "", "",
> +                                         "", "", "", "",
> +                                         "ESP_CLK", "ESP_CMD", "ESP_D0",=
 "ESP_D1", // PG
> +                                         "ESP_D2", "ESP_D3", "UART1_TXD"=
, "UART1_RXD",
> +                                         "ESP_nBOOT", "ESP_nRST", "I2C3_=
SCL", "I2C3_SDA",
> +                                         "I2S1_WS", "I2S1_CLK", "I2S1_DI=
N0", "I2S1_DOUT0",
> +                                         "", "", "", "",
> +                                         "", "", "", "",
> +                                         "", "", "", "",
> +                                         "", "", "", "";
> +};
> +
> +/* Remove the unused CK pin from the pinctl as it is unconnected */
> +&rmii_pe_pins {
> +       pins =3D "PE0", "PE1", "PE2", "PE3", "PE4",
> +                  "PE5", "PE6", "PE8", "PE9";
> +};
> +
> +/* Default SPI Interface on Card-Edge */
> +&spi1 {
> +       #address-cells =3D <1>;
> +       #size-cells =3D <0>;
> +       pinctrl-0 =3D <&spi1_pins>, <&spi1_hold_pin>, <&spi1_wp_pin>;
> +       pinctrl-names =3D "default";
> +       cs-gpios =3D <0>;
> +       status =3D "disabled";
> +};
> +
> +/* Connected to the Bootloader/Console of the ESP32 */
> +&uart1 {
> +       pinctrl-0 =3D <&uart1_pg6_pins>;
> +       pinctrl-names =3D "default";
> +       status =3D "okay";
> +};
> +
> +/* Console/Debug UART on Card-Edge */
> +&uart3 {
> +       pinctrl-0 =3D <&uart3_pb_pins>;
> +       pinctrl-names =3D "default";
> +       status =3D "okay";
> +};
> --
> 2.39.5
>
>
