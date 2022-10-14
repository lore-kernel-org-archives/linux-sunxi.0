Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E0B136D
	for <linux-sunxi@lists.linux.dev>; Fri, 14 Oct 2022 05:04:20 +0000 (UTC)
Received: by mail-qk1-f174.google.com with SMTP id o22so1806899qkl.8
        for <linux-sunxi@lists.linux.dev>; Thu, 13 Oct 2022 22:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q/wmFvV+43R0dHjMTCQrgpLsTiLrwqLz5jp6EZeXBIY=;
        b=VEhyeEnyMRy52alw+5nGaMSNAggKQkoXsldUxdw2VWm0WdPFepYFKpagf3h7kXUcBZ
         83mRgIOOuiqug9Nv4YpV1jHSs4PRzcrmxNkBDkl6mBzo8HNNKDISz1361Ts/WeOaP6Ms
         TQkCdZhsSSt9M6hXhp6+wkc6uEiZXD+s/a6GBvOyUdoPkIPCfeb+V7TTd0H1n9UMy3G3
         T8z16EuUwNVzZ/I9qjscUCYZL5ONBZpZ6oVpwhLty86yPOCwJahATCvpkF3fB47AKUg0
         tEWRJ1O0lL8B7YdzifJqfzwKnc2M3/6dF439a1m624P8qTvBV6GUGfz5+2w/xxj5hTJL
         QP5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q/wmFvV+43R0dHjMTCQrgpLsTiLrwqLz5jp6EZeXBIY=;
        b=L963Lpa44kdw2oBHtRqVewhFzVOYby9VfFPqBy/TW1uo8pVbbNOfroD/OR5PUyGC77
         b0e8HJyYOV1jclWYXge45qIpn3mN7WCdyRe0O/cVsKzaH3fXyER7lF1HEcExVOnRVED9
         yiDBpbKtUJeVfmZqhXDn3Og6okbOWXnWo0+JKoaLpGGKfKRpbWGHQDDU/ncQnCCSFfoU
         aS61qNNlcNibkAO7LZ3WybCEX/4663b5ULf8wl+ir283gOF+YkAXTW+0MMNG74BfDQHk
         efK9ro+qONQFlbGGm2sk6ZjYzUWwf7PsxHmJnrlVQId+6sAjpP0P/PjxBgx+39xg6IJw
         d/vQ==
X-Gm-Message-State: ACrzQf2VGd9zvAhEXgq+qjdRtcCnUq1F05Ii+zUFuwv3FKwch81ZJwBm
	VSyCmHJystKg4PxGmQdbiVw=
X-Google-Smtp-Source: AMsMyM7+zV07B99QGQRuoZTe8JpO86qcVSlal6HXsABv6qE3m/Mk4kPiAkLI0ZzzLHF1LKHlbi4QvA==
X-Received: by 2002:a05:620a:28cf:b0:6df:9a0a:c5d8 with SMTP id l15-20020a05620a28cf00b006df9a0ac5d8mr2514693qkp.12.1665723859211;
        Thu, 13 Oct 2022 22:04:19 -0700 (PDT)
Received: from [10.4.10.38] (pool-108-26-185-122.bstnma.fios.verizon.net. [108.26.185.122])
        by smtp.gmail.com with ESMTPSA id h3-20020a05620a400300b006cea2984c9bsm1606095qko.100.2022.10.13.22.04.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Oct 2022 22:04:18 -0700 (PDT)
Message-ID: <142d084b-2950-515c-85ea-0f9c82748580@gmail.com>
Date: Fri, 14 Oct 2022 01:04:18 -0400
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH 6/6] sunxi: add CherryPi-F1C200s support
To: Andre Przywara <andre.przywara@arm.com>,
 =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Cc: Jagan Teki <jagan@amarulasolutions.com>, Icenowy Zheng <uwu@icenowy.me>,
 Yifan Gu <me@yifangu.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 George Hilliard <thirtythreeforty@gmail.com>,
 Samuel Holland <samuel@sholland.org>, u-boot@lists.denx.de,
 linux-sunxi@lists.linux.dev
References: <20221012163458.1968900-1-andre.przywara@arm.com>
 <20221012163458.1968900-7-andre.przywara@arm.com>
 <CAJiuCceW_pnDn=dhZKKUmxs1y=NOuT0m_XFea-SY7XFFA7pUGw@mail.gmail.com>
 <1377fdd9-cec6-2d2e-3b06-7750a273acca@arm.com>
Content-Language: en-US
From: Jesse Taube <mr.bossman075@gmail.com>
In-Reply-To: <1377fdd9-cec6-2d2e-3b06-7750a273acca@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 10/13/22 05:53, Andre Przywara wrote:
> On 13/10/2022 09:33, Clément Péron wrote:
> 
> Hi Clément,
> 
>> On Wed, 12 Oct 2022 at 18:35, Andre Przywara <andre.przywara@arm.com> wrote:
>>>
>>> The CherryPi F1C200s board is a small development board, featuring the
>>> F1C200s with 64MB of co-packaged DRAM. It comes with two USB-C sockets,
>>> of which one is connected to a USB-UART chip, that provides easy access
>>> to UART1.
>>
>> A similar board is trying to been upstreamed by Icenowy:
>>
>> see : https://lore.kernel.org/lkml/20221012055602.1544944-11-uwu@icenowy.me/
>> [PATCH v2 10/10] ARM: dts: suniv: add device tree for PopStick v1.1
>>
>> Maybe we should take into account the remarks that Krzysztof Kozlowski
>> made to follow the same device-tree rules on U-boot.
> 
> Yeah, thanks for the heads up, I saw that. I just wanted to post this to
> demonstrate what needs to be done. I will be sending a Linux DT patch
> anyway, since DTs need to go via Linux anyway.
> 
> Thanks,
> Andre
> 
>>
>> Regards,
>> Clement
>>
>>> Beside the usual micro-SD card slot, the board comes with a SPI NAND
>>> flash chip, which is not yet supported.
>>>
>>> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
>>> ---
>>>    .../dts/suniv-f1c100s-cherrypi-f1c200s.dts    | 45 +++++++++++++++++++
>>>    configs/cherrypi_f1c200s_defconfig            | 11 +++++
>>>    2 files changed, 56 insertions(+)
>>>    create mode 100644 arch/arm/dts/suniv-f1c100s-cherrypi-f1c200s.dts
>>>    create mode 100644 configs/cherrypi_f1c200s_defconfig
>>>
>>> diff --git a/arch/arm/dts/suniv-f1c100s-cherrypi-f1c200s.dts b/arch/arm/dts/suniv-f1c100s-cherrypi-f1c200s.dts
>>> new file mode 100644
>>> index 00000000000..f0ebcb6d893
>>> --- /dev/null
>>> +++ b/arch/arm/dts/suniv-f1c100s-cherrypi-f1c200s.dts
>>> @@ -0,0 +1,45 @@
>>> +// SPDX-License-Identifier: (GPL-2.0+ OR X11)
>>> +/*
>>> + * Copyright 2022 Arm Ltd.
>>> + * based on another DT, which is:
>>> + *   Copyright 2018 Icenowy Zheng <icenowy@aosc.io>
Her email changed IDK if it is proper to change here.
>>> + */
>>> +
>>> +/dts-v1/;
>>> +#include "suniv-f1c100s.dtsi"
>>> +
>>> +/ {
>>> +       model = "Cherry Pi F1C200s";
>>> +       compatible = "lctech,cherrypi-f1c200s", "allwinner,suniv-f1c100s";
>>> +
>>> +       aliases {
>>> +               mmc0 = &mmc0;
>>> +               serial0 = &uart1;
>>> +               spi0 = &spi0;
no need for spi.
>>> +       };
>>> +
>>> +       chosen {
>>> +               stdout-path = "serial0:115200n8";
>>> +       };
>>> +
>>> +       reg_vcc3v3: vcc3v3 {
>>> +               compatible = "regulator-fixed";
>>> +               regulator-name = "vcc3v3";
>>> +               regulator-min-microvolt = <3300000>;
>>> +               regulator-max-microvolt = <3300000>;
>>> +       };
>>> +};
>>> +
>>> +&mmc0 {
>>> +       broken-cd;
>>> +       bus-width = <4>;
>>> +       disable-wp;
>>> +       status = "okay";
>>> +       vmmc-supply = <&reg_vcc3v3>;
>>> +};
>>> +
>>> +&uart1 {
>>> +       pinctrl-names = "default";
>>> +       pinctrl-0 = <&uart1_pa_pins>;
>>> +       status = "okay";
>>> +};
>>> diff --git a/configs/cherrypi_f1c200s_defconfig b/configs/cherrypi_f1c200s_defconfig
>>> new file mode 100644
>>> index 00000000000..306d363f485
>>> --- /dev/null
>>> +++ b/configs/cherrypi_f1c200s_defconfig
>>> @@ -0,0 +1,11 @@
>>> +CONFIG_ARM=y
>>> +CONFIG_SYS_DCACHE_OFF=y
>>> +CONFIG_ARCH_SUNXI=y
>>> +CONFIG_DEFAULT_DEVICE_TREE="suniv-f1c100s-cherrypi-f1c200s"
>>> +CONFIG_SPL=y
>>> +CONFIG_MACH_SUNIV=y
>>> +CONFIG_DRAM_CLK=156
>>> +CONFIG_DRAM_ZQ=0
You need
+CONFIG_SPL_STACK=0x8000

I will test this on both 100s and 200s.
Thanks,
Jesse Taube
>>> +CONFIG_SUNXI_MINIMUM_DRAM_MB=64
>>> +# CONFIG_VIDEO_SUNXI is not set
>>> +CONFIG_CONS_INDEX=2
>>> --
>>> 2.25.1
>>>
>>>
> 
