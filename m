Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77FE71426B
	for <linux-sunxi@lists.linux.dev>; Mon, 31 Jul 2023 09:53:48 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 33235D75;
	Mon, 31 Jul 2023 02:54:31 -0700 (PDT)
Received: from [10.32.102.42] (e110479.arm.com [10.32.102.42])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 472D73F59C;
	Mon, 31 Jul 2023 02:53:45 -0700 (PDT)
Message-ID: <a137cb78-f687-e9c6-e6f3-27be92c19da3@arm.com>
Date: Mon, 31 Jul 2023 10:53:38 +0100
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/1] arm: dts: Enable device-tree overlay support for
 sun8i-h3 pi devices
To: "MOESSBAUER, Felix" <felix.moessbauer@siemens.com>,
 "jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>
Cc: "linux-sunxi@lists.linux.dev" <linux-sunxi@lists.linux.dev>,
 "wens@csie.org" <wens@csie.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "Matzinger, Manuel Josef" <manuel.matzinger@siemens.com>,
 "Bovensiepen, Daniel (bovi)" <daniel.bovensiepen@siemens.com>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "Gylstorff, Quirin" <quirin.gylstorff@siemens.com>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>
References: <20230627133703.355893-1-felix.moessbauer@siemens.com>
 <1830379.atdPhlSkOF@jernej-laptop>
 <17c7a0c952913e21d9a323f42a1cfad84ed8a51b.camel@siemens.com>
 <4818881.GXAFRqVoOG@jernej-laptop>
 <6fbb0e557a97555876f8de4a283162a9e7d290b8.camel@siemens.com>
Content-Language: en-US
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <6fbb0e557a97555876f8de4a283162a9e7d290b8.camel@siemens.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 31/07/2023 03:46, MOESSBAUER, Felix wrote:
> On Mon, 2023-07-31 at 00:12 +0200, Jernej Škrabec wrote:
>> Dne sreda, 19. julij 2023 ob 14:26:13 CEST je Moessbauer Felix
>> napisal(a):
>>> On Tue, 2023-07-11 at 21:42 +0200, Jernej Škrabec wrote:
>>>> Dne torek, 27. junij 2023 ob 15:37:03 CEST je Felix Moessbauer
>>>>
>>>> napisal(a):
>>>>> Add the '-@' DTC option for the sun8i-h3 pi-class devices. This
>>>>> option
>>>>> populates the '__symbols__' node that contains all the
>>>>> necessary
>>>>> symbols
>>>>> for supporting device-tree overlays (for instance from the
>>>>> firmware
>>>>> or
>>>>> the bootloader) on these devices.
>>>>>
>>>>> These devices allow various modules to be connected and this
>>>>> enables
>>>>> users to create out-of-tree device-tree overlays for these
>>>>> modules.
>>>>>
>>>>> Please note that this change does increase the size of the
>>>>> resulting DTB
>>>>> by ~30%. For example, with v6.4 increase in size is as follows:
>>>>>
>>>>> 22909 -> 29564 sun8i-h3-orangepi-lite.dtb
>>>>> 24214 -> 30935 sun8i-h3-bananapi-m2-plus.dtb
>>>>> 23915 -> 30664 sun8i-h3-nanopi-m1-plus.dtb
>>>>> 22969 -> 29537 sun8i-h3-nanopi-m1.dtb
>>>>> 24157 -> 30836 sun8i-h3-nanopi-duo2.dtb
>>>>> 24110 -> 30845 sun8i-h3-orangepi-plus2e.dtb
>>>>> 23472 -> 30037 sun8i-h3-orangepi-one.dtb
>>>>> 24600 -> 31410 sun8i-h3-orangepi-plus.dtb
>>>>> 23618 -> 30230 sun8i-h3-orangepi-2.dtb
>>>>> 22170 -> 28548 sun8i-h3-orangepi-zero-plus2.dtb
>>>>> 23258 -> 29795 sun8i-h3-nanopi-neo-air.dtb
>>>>> 23113 -> 29699 sun8i-h3-zeropi.dtb
>>>>> 22803 -> 29270 sun8i-h3-nanopi-neo.dtb
>>>>> 24674 -> 31318 sun8i-h3-nanopi-r1.dtb
>>>>> 23477 -> 30038 sun8i-h3-orangepi-pc.dtb
>>>>> 24622 -> 31380 sun8i-h3-bananapi-m2-plus-v1.2.dtb
>>>>> 23750 -> 30366 sun8i-h3-orangepi-pc-plus.dtb
>>>>>
>>>>> Signed-off-by: Felix Moessbauer <felix.moessbauer@siemens.com>
>>>>> ---
>>>>> Please note that I only tested the overlay on the sun8i-h3-
>>>>> nanopi-
>>>>> neo
>>>>> device. However, the devices are quite similar and in general
>>>>> the
>>>>> change to add symbols should be pretty safe. Similar patches
>>>>> have
>>>>> been
>>>>> applied to various other devices in the past without any
>>>>> negative
>>>>> effect (except for the increased size).
>>>>
>>>> I'm not a fan of this approach. What's wrong with letting kernel
>>>> builders
>>>> specify this flag on their own at compile time? That way size is
>>>> still
>>>> completely in domain of builder.
>>>
>>> That's easier said than done. These symbols are only needed for
>>> some
>>> targets (that are commonly used with overlays). But how should a
>>> general purpose kernel builder like Debian know which DT to build
>>> with
>>> symbols and which without? In Yocto the overlays are not really
>>> needed,
>>> as often the original dts is just patched directly.
>>
>> LibreELEC (distro I help with) has support for DT overlays for some
>> time and
>> it was easy to enable symbols for all DTs with simple "DTC_FLAGS=-@"
>> addition

So why don't you use the U-Boot provided copy of the DTB? We sync the 
DTs regularly from the kernel repo to the U-Boot repo, and the U-Boot 
build system builds all DTBs with overlay support already.
This also saves you from the hassle to actually find and load the right 
DTB, as it automatically comes as part of the U-Boot binary.
On the U-Boot prompt (or rather in a script) you would then do:
=> fdt move $fdtcontroladdr $fdt_addr_r
=> load <source> $fdtoverlay_addr_r <your_overlay>.dtbo
=> fdt apply $fdtoverlay_addr_r

You could also chime in on this U-Boot patch of mine, that loads and 
applies all .dtbo files found in a given directory:
https://lore.kernel.org/u-boot/20230210110213.2531190-1-andre.przywara@arm.com/

Cheers,
Andre

> 
> Thanks for the pointer. If this would be a kconfig option, I would
> agree. There's a patch to add this option, but this did not get
> accepted [3]. Just manually adding some "magic" options does not feel
> correct.
> 
>> to build command [1]. Do you see any downside except knowing you have
>> to
>> include it? On the upside, there is no need to patch each and every
>> file and
>> kernel builder has a choice if overlays should be supported or not.
> 
> There is a similar feature request for Debian, but without a decision
> yet [4]. I just cross-referenced it to this thread.
> 
>> Note that
>> in some cases overlays can be needed even in the case when board
>> doesn't have
>> expansion ports.
> 
> If that is the case, why can't we at least add the patch from [3] and
> provide the distros an easy option to enable overlays? Once integrated,
> we can eventually get rid of all the per-device patches in the kernel.
> 
> Best regards,
> Felix
> 
> [3] https://www.spinics.net/lists/kernel/msg4252361.html
> [4] https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=910727
> 
>>
>> Best regards,
>> Jernej
>>
>> [1]
>> https://github.com/LibreELEC/LibreELEC.tv/blob/master/packages/linux/
>> package.mk#L213
>>
>>>
>>> There has been a discussion in 2017 to improve the situation in
>>> general, but without any final decision or implementation [1]. By
>>> that,
>>> these patches got more and more common. I recently sent a very
>>> similar
>>> patch for a riscv board that got accepted [2].
>>>
>>> IMHO it is better to have these patches in the kernel instead of
>>> carrying different variants of this in each Linux distro. IMHO, the
>>> board vendors themselves should add this when they add a board.
>>>
>>> [1]
>>> https://lore.kernel.org/lkml/1502831736-28282-1-git-send-email-trini@konsulk
>>> o.com/ [2]
>>> https://lore.kernel.org/linux-devicetree/20230627080620.329873-1-felix.moess
>>> bauer@siemens.com/
>>>
>>> Best regards,
>>> Felix
>>>
>>>> Best regards,
>>>> Jernej
>>>>
>>>>> Felix Moessbauer
>>>>> Siemens AG
>>>>>
>>>>>   arch/arm/boot/dts/allwinner/Makefile | 19 +++++++++++++++++++
>>>>>   1 file changed, 19 insertions(+)
>>>>>
>>>>> diff --git a/arch/arm/boot/dts/allwinner/Makefile
>>>>> b/arch/arm/boot/dts/allwinner/Makefile index
>>>>> 589a1ce1120a..eebb5a0c873a
>>>>> 100644
>>>>> --- a/arch/arm/boot/dts/allwinner/Makefile
>>>>> +++ b/arch/arm/boot/dts/allwinner/Makefile
>>>>> @@ -179,6 +179,25 @@ dtb-$(CONFIG_MACH_SUN7I) += \
>>>>>          sun7i-a20-pcduino3-nano.dtb \
>>>>>          sun7i-a20-wexler-tab7200.dtb \
>>>>>          sun7i-a20-wits-pro-a20-dkt.dtb
>>>>> +
>>>>> +# Enables support for device-tree overlays for all pis
>>>>> +DTC_FLAGS_sun8i-h3-orangepi-lite := -@
>>>>> +DTC_FLAGS_sun8i-h3-bananapi-m2-plus := -@
>>>>> +DTC_FLAGS_sun8i-h3-nanopi-m1-plus := -@
>>>>> +DTC_FLAGS_sun8i-h3-nanopi-m1 := -@
>>>>> +DTC_FLAGS_sun8i-h3-nanopi-duo2 := -@
>>>>> +DTC_FLAGS_sun8i-h3-orangepi-plus2e := -@
>>>>> +DTC_FLAGS_sun8i-h3-orangepi-one := -@
>>>>> +DTC_FLAGS_sun8i-h3-orangepi-plus := -@
>>>>> +DTC_FLAGS_sun8i-h3-orangepi-2 := -@
>>>>> +DTC_FLAGS_sun8i-h3-orangepi-zero-plus2 := -@
>>>>> +DTC_FLAGS_sun8i-h3-nanopi-neo-air := -@
>>>>> +DTC_FLAGS_sun8i-h3-zeropi := -@
>>>>> +DTC_FLAGS_sun8i-h3-nanopi-neo := -@
>>>>> +DTC_FLAGS_sun8i-h3-nanopi-r1 := -@
>>>>> +DTC_FLAGS_sun8i-h3-orangepi-pc := -@
>>>>> +DTC_FLAGS_sun8i-h3-bananapi-m2-plus-v1.2 := -@
>>>>> +DTC_FLAGS_sun8i-h3-orangepi-pc-plus := -@
>>>>>   dtb-$(CONFIG_MACH_SUN8I) += \
>>>>>          sun8i-a23-evb.dtb \
>>>>>          sun8i-a23-gt90h-v4.dtb \
>>
>>
>>
>>
> 
