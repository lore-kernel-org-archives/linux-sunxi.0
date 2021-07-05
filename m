Received: from m12-15.163.com (m12-15.163.com [220.181.12.15])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11ED470
	for <linux-sunxi@lists.linux.dev>; Mon,  5 Jul 2021 06:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Subject:From:Message-ID:Date:MIME-Version; bh=4B9fY
	OU6k5Y5Wbk6u0iFVY3p/dGAL6FwKN4ZvL9A5os=; b=lMlOHWQbR6syOLcuuLBMU
	yrzpz0ZN6y0nzoC8NOjdvPj7iJV3Dq0MiG8CwiwEsMu8pHJ6K/LyB94b7xUJRTDZ
	DktIPQGWXMd1WJrnNjnKc7jgtLcvD479bp4Y02eYe3gas9cXTle/i8dRD4vjCC35
	gck+AZyF0fWOCfvXkulS1U=
Received: from [192.168.3.109] (unknown [218.201.129.20])
	by smtp10 (Coremail) with SMTP id DsCowAA3f2PXpuJgfkROSQ--.45866S2;
	Mon, 05 Jul 2021 14:29:44 +0800 (CST)
Subject: Re: [PATCH 3/3] ARM: dts: sun8i: r40: bananapi-m2-ultra: Enable
 usb_otg
To: wens@csie.org
Cc: Andre Przywara <andre.przywara@arm.com>, Maxime Ripard
 <maxime@cerno.tech>, linux-sunxi@lists.linux.dev,
 Jernej Skrabec <jernej.skrabec@gmail.com>
References: <20210701015009.13985-1-qianfanguijin@163.com>
 <20210701015009.13985-3-qianfanguijin@163.com>
 <20210701153720.42c1f512@slackpad.fritz.box>
 <CAGb2v67-BAn=OMid-=MoJ15QUdt0NQ2RVfLTN-bkgUstyXNj2A@mail.gmail.com>
 <55b9f018-95da-fe3f-24a4-c499babb9ef3@163.com>
 <20210702120601.22k44u6cdlag57ku@gilmour>
 <20210702132409.6c2e7bd4@slackpad.fritz.box>
 <CAGb2v66c7ZM+8QW6X0uJ5OzBqDdBxmrwi8OLr3MdC-rMTsiACA@mail.gmail.com>
 <213baae6-a2f8-10de-1c9a-aa8f8683ddc6@163.com>
 <CAGb2v66m=8OY2j=QgU5E+gNA-xeEhNk90BK0-PB5B19+WK2UGw@mail.gmail.com>
From: qianfan <qianfanguijin@163.com>
Message-ID: <9e9fe3d1-0ccf-0ecf-53d0-3e15b0c6ddff@163.com>
Date: Mon, 5 Jul 2021 14:29:43 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAGb2v66m=8OY2j=QgU5E+gNA-xeEhNk90BK0-PB5B19+WK2UGw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:DsCowAA3f2PXpuJgfkROSQ--.45866S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxCw4rAryxCr4UZr4DuF4fGrg_yoWrXryDpr
	yUtF4DKr1kGr15JrnFvry8JFyjyr1kJr1UXr1Dt3W8trn8Kw17Xr48tr15uF98Jr18Cw1Y
	vrWjvrW7Wrn8Z3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07juMKtUUUUU=
X-Originating-IP: [218.201.129.20]
X-CM-SenderInfo: htld0w5dqj3xxmlqqiywtou0bp/xtbBdgPG7VUMRe07GgABsP


在 2021/7/5 14:20, Chen-Yu Tsai 写道:
> On Mon, Jul 5, 2021 at 11:51 AM qianfan <qianfanguijin@163.com> wrote:
>> 在 2021/7/2 20:30, Chen-Yu Tsai 写道:
>>> On Fri, Jul 2, 2021 at 8:24 PM Andre Przywara <andre.przywara@arm.com> wrote:
>>>> On Fri, 2 Jul 2021 14:06:01 +0200
>>>> Maxime Ripard <maxime@cerno.tech> wrote:
>>>>
>>>> Hi,
>>>>
>>>>> On Fri, Jul 02, 2021 at 10:46:20AM +0800, qianfan wrote:
>>>>>> 在 2021/7/1 22:47, Chen-Yu Tsai 写道:
>>>>>>> On Thu, Jul 1, 2021 at 10:37 PM Andre Przywara <andre.przywara@arm.com> wrote:
>>>>>>>> On Thu,  1 Jul 2021 09:50:09 +0800
>>>>>>>> qianfanguijin@163.com wrote:
>>>>>>>>
>>>>>>>> Hi,
>>>>>>>>
>>>>>>>>> From: qianfan Zhao <qianfanguijin@163.com>
>>>>>>>>>
>>>>>>>>> Enable it.
>>>>>>>>>
>>>>>>>>> Signed-off-by: qianfan Zhao <qianfanguijin@163.com>
>>>>>>>>> ---
>>>>>>>>>     arch/arm/boot/dts/sun8i-r40-bananapi-m2-ultra.dts | 14 ++++++++++++++
>>>>>>>>>     1 file changed, 14 insertions(+)
>>>>>>>>>
>>>>>>>>> diff --git a/arch/arm/boot/dts/sun8i-r40-bananapi-m2-ultra.dts b/arch/arm/boot/dts/sun8i-r40-bananapi-m2-ultra.dts
>>>>>>>>> index a6a1087a0c9b..072535b383b5 100644
>>>>>>>>> --- a/arch/arm/boot/dts/sun8i-r40-bananapi-m2-ultra.dts
>>>>>>>>> +++ b/arch/arm/boot/dts/sun8i-r40-bananapi-m2-ultra.dts
>>>>>>>>> @@ -43,6 +43,7 @@
>>>>>>>>>
>>>>>>>>>     /dts-v1/;
>>>>>>>>>     #include "sun8i-r40.dtsi"
>>>>>>>>> +#include "sunxi-common-regulators.dtsi"
>>>>>>>>>
>>>>>>>>>     #include <dt-bindings/gpio/gpio.h>
>>>>>>>>>
>>>>>>>>> @@ -299,6 +300,11 @@
>>>>>>>>>          regulator-name = "vdd1v2-sata";
>>>>>>>>>     };
>>>>>>>>>
>>>>>>>>> +&reg_usb0_vbus {
>>>>>>>>> +     gpio = <&pio 8 13 GPIO_ACTIVE_HIGH>; /* PI13 */
>>>>>>>>> +     status = "okay";
>>>>>>>>> +};
>>>>>>>> So there is the same USB0-DRVVBUS signal connected to this GPIO, but
>>>>>>>> also to the AXP's N_VBUSEN line.
>>>>>>>>
>>>>>>>> Not sure if that means either of them can control the voltage?
>>>>>>> It's better to use N_VBUSEN if that is connected. Since the PMIC
>>>>>>> may have that pin already enabled, it can cause issues with VBUS
>>>>>>> input not being correctly used.
>>>>>> I had checked some boards in linux such as sun7i-a20-olinuxino-lime2.dts,
>>>>>> they has the same design
>>>>>>
>>>>>> that enable VBUS by using a gpio and then connect this gpio to PMIC.
>>>>>>
>>>>>> there is a example:
>>>>>>
>>>>>> ./sun7i-a20-olinuxino-lime2.dts:&reg_usb0_vbus {
>>>>>> ./sun7i-a20-olinuxino-lime2.dts-        gpio = <&pio 2 17 GPIO_ACTIVE_HIGH>;
>>>>>> ./sun7i-a20-olinuxino-lime2.dts-        status = "okay";
>>>>>> ./sun7i-a20-olinuxino-lime2.dts-};
>>>>> IIRC, the AXP209 typically used with these boards doesn't have a
>>>>> N_VBUSEN line
>>>> According to the Lime2 schematic and the AXP209 data sheet from the Wiki
>>>> it does have N_VBUSEN, from a quick glance with the usual
>>>> functionality. And the connection on the Lime2 looks indeed the same,
>>>> USB0_DRVVBUS connected to both the PMIC and a GPIO.
>>>> (Also the BPi-M2 Ultra has an AXP221 anyway.)
>>> The difference is that the N_VBUSEN pin on the AXP221 can be used as an
>>> output, while on the AXP209 it is strictly an input. And U-Boot tends
>>> to leave pins it has used in whatever state last used so ideally we
>>> need to coordinate both to use the same method. Otherwise you might
>>> end up with N_VBUSEN always driving DRVVBUS high or low, and the GPIO
>>> on the SoC not having any effect. Ideally we need some way to reset
>>> the state of the pins to high-Z.
>>>
>>> ChenYu
>> I had changed the dts to control VBUS by using PMIC, but I had a
>> question: what's the perpose of
>>
>> the gpio?
> Which GPIO? You mean the one on the SoC wired to N_VBUSEN and DRVVBUS?
> Or N_VBUSEN itself?
I means USB0-DRVVBUS(PI13) on bpi m2u. We can control VBUS by PMIC, and 
PI13 seems is a redundant design.
>
> ChenYu

