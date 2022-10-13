Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFB7D7B
	for <linux-sunxi@lists.linux.dev>; Thu, 13 Oct 2022 09:54:03 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 09BF315A1;
	Thu, 13 Oct 2022 02:54:09 -0700 (PDT)
Received: from [192.168.42.194] (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8B5973F792;
	Thu, 13 Oct 2022 02:54:00 -0700 (PDT)
Message-ID: <1377fdd9-cec6-2d2e-3b06-7750a273acca@arm.com>
Date: Thu, 13 Oct 2022 10:53:43 +0100
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 6/6] sunxi: add CherryPi-F1C200s support
Content-Language: en-GB
To: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Cc: Jagan Teki <jagan@amarulasolutions.com>, Icenowy Zheng <uwu@icenowy.me>,
 Jesse Taube <mr.bossman075@gmail.com>, Yifan Gu <me@yifangu.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 George Hilliard <thirtythreeforty@gmail.com>,
 Samuel Holland <samuel@sholland.org>, u-boot@lists.denx.de,
 linux-sunxi@lists.linux.dev
References: <20221012163458.1968900-1-andre.przywara@arm.com>
 <20221012163458.1968900-7-andre.przywara@arm.com>
 <CAJiuCceW_pnDn=dhZKKUmxs1y=NOuT0m_XFea-SY7XFFA7pUGw@mail.gmail.com>
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <CAJiuCceW_pnDn=dhZKKUmxs1y=NOuT0m_XFea-SY7XFFA7pUGw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 13/10/2022 09:33, Clément Péron wrote:

Hi Clément,

> On Wed, 12 Oct 2022 at 18:35, Andre Przywara <andre.przywara@arm.com> wrote:
>>
>> The CherryPi F1C200s board is a small development board, featuring the
>> F1C200s with 64MB of co-packaged DRAM. It comes with two USB-C sockets,
>> of which one is connected to a USB-UART chip, that provides easy access
>> to UART1.
> 
> A similar board is trying to been upstreamed by Icenowy:
> 
> see : https://lore.kernel.org/lkml/20221012055602.1544944-11-uwu@icenowy.me/
> [PATCH v2 10/10] ARM: dts: suniv: add device tree for PopStick v1.1
> 
> Maybe we should take into account the remarks that Krzysztof Kozlowski
> made to follow the same device-tree rules on U-boot.

Yeah, thanks for the heads up, I saw that. I just wanted to post this to 
demonstrate what needs to be done. I will be sending a Linux DT patch 
anyway, since DTs need to go via Linux anyway.

Thanks,
Andre

> 
> Regards,
> Clement
> 
>> Beside the usual micro-SD card slot, the board comes with a SPI NAND
>> flash chip, which is not yet supported.
>>
>> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
>> ---
>>   .../dts/suniv-f1c100s-cherrypi-f1c200s.dts    | 45 +++++++++++++++++++
>>   configs/cherrypi_f1c200s_defconfig            | 11 +++++
>>   2 files changed, 56 insertions(+)
>>   create mode 100644 arch/arm/dts/suniv-f1c100s-cherrypi-f1c200s.dts
>>   create mode 100644 configs/cherrypi_f1c200s_defconfig
>>
>> diff --git a/arch/arm/dts/suniv-f1c100s-cherrypi-f1c200s.dts b/arch/arm/dts/suniv-f1c100s-cherrypi-f1c200s.dts
>> new file mode 100644
>> index 00000000000..f0ebcb6d893
>> --- /dev/null
>> +++ b/arch/arm/dts/suniv-f1c100s-cherrypi-f1c200s.dts
>> @@ -0,0 +1,45 @@
>> +// SPDX-License-Identifier: (GPL-2.0+ OR X11)
>> +/*
>> + * Copyright 2022 Arm Ltd.
>> + * based on another DT, which is:
>> + *   Copyright 2018 Icenowy Zheng <icenowy@aosc.io>
>> + */
>> +
>> +/dts-v1/;
>> +#include "suniv-f1c100s.dtsi"
>> +
>> +/ {
>> +       model = "Cherry Pi F1C200s";
>> +       compatible = "lctech,cherrypi-f1c200s", "allwinner,suniv-f1c100s";
>> +
>> +       aliases {
>> +               mmc0 = &mmc0;
>> +               serial0 = &uart1;
>> +               spi0 = &spi0;
>> +       };
>> +
>> +       chosen {
>> +               stdout-path = "serial0:115200n8";
>> +       };
>> +
>> +       reg_vcc3v3: vcc3v3 {
>> +               compatible = "regulator-fixed";
>> +               regulator-name = "vcc3v3";
>> +               regulator-min-microvolt = <3300000>;
>> +               regulator-max-microvolt = <3300000>;
>> +       };
>> +};
>> +
>> +&mmc0 {
>> +       broken-cd;
>> +       bus-width = <4>;
>> +       disable-wp;
>> +       status = "okay";
>> +       vmmc-supply = <&reg_vcc3v3>;
>> +};
>> +
>> +&uart1 {
>> +       pinctrl-names = "default";
>> +       pinctrl-0 = <&uart1_pa_pins>;
>> +       status = "okay";
>> +};
>> diff --git a/configs/cherrypi_f1c200s_defconfig b/configs/cherrypi_f1c200s_defconfig
>> new file mode 100644
>> index 00000000000..306d363f485
>> --- /dev/null
>> +++ b/configs/cherrypi_f1c200s_defconfig
>> @@ -0,0 +1,11 @@
>> +CONFIG_ARM=y
>> +CONFIG_SYS_DCACHE_OFF=y
>> +CONFIG_ARCH_SUNXI=y
>> +CONFIG_DEFAULT_DEVICE_TREE="suniv-f1c100s-cherrypi-f1c200s"
>> +CONFIG_SPL=y
>> +CONFIG_MACH_SUNIV=y
>> +CONFIG_DRAM_CLK=156
>> +CONFIG_DRAM_ZQ=0
>> +CONFIG_SUNXI_MINIMUM_DRAM_MB=64
>> +# CONFIG_VIDEO_SUNXI is not set
>> +CONFIG_CONS_INDEX=2
>> --
>> 2.25.1
>>
>>

