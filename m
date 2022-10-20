Received: from smtpdh18-1.aruba.it (smtpdh18-1.aruba.it [62.149.155.132])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55BD63D60
	for <linux-sunxi@lists.linux.dev>; Thu, 20 Oct 2022 15:55:40 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.87.206])
	by Aruba Outgoing Smtp  with ESMTPSA
	id lXqRodV5kIAT1lXqRowiLa; Thu, 20 Oct 2022 17:52:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
	t=1666281153; bh=XPCNadGdnG1VGKtKbiV+ozvQqDlEYdAxBxcJo4JgZPI=;
	h=Date:MIME-Version:Subject:To:From:Content-Type;
	b=QS7DpuJqQwRuLnLhPg7s708djtbdmzQIRDzEVIUWKRgfy0X2jSWHq5GeShd9bxd29
	 rXA7kuTzdckGyPG6Wc7/ngRVgXgULVYLJzkxDMOaGt4Vx1xS8Ijjl6nRy+/vJ8Xuko
	 jo8/wtigqMnU0kyHk13PD9UJkncnmXWJfNsWvqcIG1uvSO7zSt5coMeBwcDygC9CjF
	 Fl98m7EkhMPER5gyEktXoJqoz6yuUCXq1zWoFVL1FxrjLKnxrU/ctMN6bF2jncgMBf
	 kpyPPZEm1edQdczCa6pALQ1N9ndrWKhT43j2+XkVefV7pnX49WOfG1rkbFzYOft/3c
	 XePPniQozC1VQ==
Message-ID: <783ea75e-7d68-8cd6-55b2-27bd0c8d37ea@benettiengineering.com>
Date: Thu, 20 Oct 2022 17:52:31 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH 6/6] sunxi: add CherryPi-F1C200s support
Content-Language: en-US
To: Andre Przywara <andre.przywara@arm.com>,
 Jesse Taube <mr.bossman075@gmail.com>
Cc: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Icenowy Zheng <uwu@icenowy.me>,
 Yifan Gu <me@yifangu.com>, George Hilliard <thirtythreeforty@gmail.com>,
 Samuel Holland <samuel@sholland.org>, u-boot@lists.denx.de,
 linux-sunxi@lists.linux.dev
References: <20221012163458.1968900-1-andre.przywara@arm.com>
 <20221012163458.1968900-7-andre.przywara@arm.com>
 <CAJiuCceW_pnDn=dhZKKUmxs1y=NOuT0m_XFea-SY7XFFA7pUGw@mail.gmail.com>
 <1377fdd9-cec6-2d2e-3b06-7750a273acca@arm.com>
 <142d084b-2950-515c-85ea-0f9c82748580@gmail.com>
 <20221018150115.506e449a@donnerap.cambridge.arm.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20221018150115.506e449a@donnerap.cambridge.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfLNpKN6TAK/qUyegxpvEoB3Fjk/lYq/wrJDXy2p+3MCSga4FJQezGnH6DZ7I09/XoujR1hx2uFrjGp8lx9ALu38X80NkIc+gpwjnBU7SVQqXa0TsfO6h
 jIDA3fVBV1yIJGdkdKjEPdGOazyNz6TUtH28W5oEqh7ImVxohTKLQzVwlMPWHdzezJsQg0ypo0i9U6Vd5j8wlpFved2BtP//fVEPSfWbt9GmAk+/YFCB2rLR
 CN0ajSXVBRsMffuA9VOVFRIvDRUz2Jf4jXqZqs2Mn0jFdzUv/+ot1X/cKdr6NnQB9UpjbvELI2Is7XKkI5g8jK7pXwtqr5QyR74o6VYMpCkC/WeRi3kUHl6u
 H7CREteHm48xC+ePl4ghjovSc4RP/++kEHfn1YTIHiN8w00H322aUTlJsYYlreJrRXDZ2zMLNS1xoO8T8DA8FrEj1xG2fFwZPI+sCIrYMaSEIQgZh+6BL8+6
 YUy3rm2dadJLm2pWfyR6DxKnUEd+Yy6d2lqnOKgfyhTMjVY6rDZCW5szspc=

Hi Andre,

On 18/10/22 16:01, Andre Przywara wrote:
> On Fri, 14 Oct 2022 01:04:18 -0400
> Jesse Taube <mr.bossman075@gmail.com> wrote:
> 
> Hi Jesse, Giulio,
> 
> thanks for having a look and for the testing!

You're welcome:
Tested-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Best regards
-- 
Giulio Benetti
CEO/CTO@Benetti Engineering sas

>> On 10/13/22 05:53, Andre Przywara wrote:
>>> On 13/10/2022 09:33, Clément Péron wrote:
>>>
>>> Hi Clément,
>>>    
>>>> On Wed, 12 Oct 2022 at 18:35, Andre Przywara <andre.przywara@arm.com> wrote:
>>>>>
>>>>> The CherryPi F1C200s board is a small development board, featuring the
>>>>> F1C200s with 64MB of co-packaged DRAM. It comes with two USB-C sockets,
>>>>> of which one is connected to a USB-UART chip, that provides easy access
>>>>> to UART1.
>>>>
>>>> A similar board is trying to been upstreamed by Icenowy:
>>>>
>>>> see : https://lore.kernel.org/lkml/20221012055602.1544944-11-uwu@icenowy.me/
>>>> [PATCH v2 10/10] ARM: dts: suniv: add device tree for PopStick v1.1
>>>>
>>>> Maybe we should take into account the remarks that Krzysztof Kozlowski
>>>> made to follow the same device-tree rules on U-boot.
>>>
>>> Yeah, thanks for the heads up, I saw that. I just wanted to post this to
>>> demonstrate what needs to be done. I will be sending a Linux DT patch
>>> anyway, since DTs need to go via Linux anyway.
>>>
>>> Thanks,
>>> Andre
>>>    
>>>>
>>>> Regards,
>>>> Clement
>>>>   
>>>>> Beside the usual micro-SD card slot, the board comes with a SPI NAND
>>>>> flash chip, which is not yet supported.
>>>>>
>>>>> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
>>>>> ---
>>>>>     .../dts/suniv-f1c100s-cherrypi-f1c200s.dts    | 45 +++++++++++++++++++
>>>>>     configs/cherrypi_f1c200s_defconfig            | 11 +++++
>>>>>     2 files changed, 56 insertions(+)
>>>>>     create mode 100644 arch/arm/dts/suniv-f1c100s-cherrypi-f1c200s.dts
>>>>>     create mode 100644 configs/cherrypi_f1c200s_defconfig
>>>>>
>>>>> diff --git a/arch/arm/dts/suniv-f1c100s-cherrypi-f1c200s.dts b/arch/arm/dts/suniv-f1c100s-cherrypi-f1c200s.dts
>>>>> new file mode 100644
>>>>> index 00000000000..f0ebcb6d893
>>>>> --- /dev/null
>>>>> +++ b/arch/arm/dts/suniv-f1c100s-cherrypi-f1c200s.dts
>>>>> @@ -0,0 +1,45 @@
>>>>> +// SPDX-License-Identifier: (GPL-2.0+ OR X11)
>>>>> +/*
>>>>> + * Copyright 2022 Arm Ltd.
>>>>> + * based on another DT, which is:
>>>>> + *   Copyright 2018 Icenowy Zheng <icenowy@aosc.io>
>> Her email changed IDK if it is proper to change here.
>>>>> + */
>>>>> +
>>>>> +/dts-v1/;
>>>>> +#include "suniv-f1c100s.dtsi"
>>>>> +
>>>>> +/ {
>>>>> +       model = "Cherry Pi F1C200s";
>>>>> +       compatible = "lctech,cherrypi-f1c200s", "allwinner,suniv-f1c100s";
>>>>> +
>>>>> +       aliases {
>>>>> +               mmc0 = &mmc0;
>>>>> +               serial0 = &uart1;
>>>>> +               spi0 = &spi0;
>> no need for spi.
>>>>> +       };
>>>>> +
>>>>> +       chosen {
>>>>> +               stdout-path = "serial0:115200n8";
>>>>> +       };
>>>>> +
>>>>> +       reg_vcc3v3: vcc3v3 {
>>>>> +               compatible = "regulator-fixed";
>>>>> +               regulator-name = "vcc3v3";
>>>>> +               regulator-min-microvolt = <3300000>;
>>>>> +               regulator-max-microvolt = <3300000>;
>>>>> +       };
>>>>> +};
>>>>> +
>>>>> +&mmc0 {
>>>>> +       broken-cd;
>>>>> +       bus-width = <4>;
>>>>> +       disable-wp;
>>>>> +       status = "okay";
>>>>> +       vmmc-supply = <&reg_vcc3v3>;
>>>>> +};
>>>>> +
>>>>> +&uart1 {
>>>>> +       pinctrl-names = "default";
>>>>> +       pinctrl-0 = <&uart1_pa_pins>;
>>>>> +       status = "okay";
>>>>> +};
>>>>> diff --git a/configs/cherrypi_f1c200s_defconfig b/configs/cherrypi_f1c200s_defconfig
>>>>> new file mode 100644
>>>>> index 00000000000..306d363f485
>>>>> --- /dev/null
>>>>> +++ b/configs/cherrypi_f1c200s_defconfig
>>>>> @@ -0,0 +1,11 @@
>>>>> +CONFIG_ARM=y
>>>>> +CONFIG_SYS_DCACHE_OFF=y
>>>>> +CONFIG_ARCH_SUNXI=y
>>>>> +CONFIG_DEFAULT_DEVICE_TREE="suniv-f1c100s-cherrypi-f1c200s"
>>>>> +CONFIG_SPL=y
>>>>> +CONFIG_MACH_SUNIV=y
>>>>> +CONFIG_DRAM_CLK=156
>>>>> +CONFIG_DRAM_ZQ=0
>> You need
>> +CONFIG_SPL_STACK=0x8000
> 
> I posted "[PATCH 1/2] sunxi: Kconfig: use SoC-wide values for some symbols"
> (https://lore.kernel.org/u-boot/20220913234335.24902-2-andre.przywara@arm.com/)
> that solves that issue.
> That patch is applied before this series in the tree, so no change should
> be needed.
> 
> Thanks for the report!
> 
> Cheers,
> Andre
> 
> 
>>
>> I will test this on both 100s and 200s.
>> Thanks,
>> Jesse Taube
>>>>> +CONFIG_SUNXI_MINIMUM_DRAM_MB=64
>>>>> +# CONFIG_VIDEO_SUNXI is not set
>>>>> +CONFIG_CONS_INDEX=2
>>>>> --
>>>>> 2.25.1
>>>>>
>>>>>   
>>>    
> 

