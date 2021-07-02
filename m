Received: from m12-11.163.com (m12-11.163.com [220.181.12.11])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEEF470
	for <linux-sunxi@lists.linux.dev>; Fri,  2 Jul 2021 02:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Subject:From:Message-ID:Date:MIME-Version; bh=AT4o0
	0i987fkPSZVk2wb26mvCELrtY9IYaJmekrdZM8=; b=iTt4xQi+W2oHn2jECg4MJ
	/7kG5MyLbh7ndwh6NZgse2T6RhbrjFcP5jGgqyPHxmt+jsEUj5T8MOM52uS4Qdqg
	AWpZzNURTv2tuE/C9FFvJ7IbAl0XkFlRN6xt69zVMJDpZTpEPOHaGSloVpcDKqs4
	z/ml92ATq38sA+D37dyqn0=
Received: from [192.168.3.109] (unknown [218.201.129.20])
	by smtp7 (Coremail) with SMTP id C8CowAAnKJgCft5gVsRjkw--.10083S2;
	Fri, 02 Jul 2021 10:46:26 +0800 (CST)
Subject: Re: [PATCH 3/3] ARM: dts: sun8i: r40: bananapi-m2-ultra: Enable
 usb_otg
To: wens@csie.org, Andre Przywara <andre.przywara@arm.com>
Cc: linux-sunxi@lists.linux.dev, Maxime Ripard <mripard@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>
References: <20210701015009.13985-1-qianfanguijin@163.com>
 <20210701015009.13985-3-qianfanguijin@163.com>
 <20210701153720.42c1f512@slackpad.fritz.box>
 <CAGb2v67-BAn=OMid-=MoJ15QUdt0NQ2RVfLTN-bkgUstyXNj2A@mail.gmail.com>
From: qianfan <qianfanguijin@163.com>
Message-ID: <55b9f018-95da-fe3f-24a4-c499babb9ef3@163.com>
Date: Fri, 2 Jul 2021 10:46:20 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAGb2v67-BAn=OMid-=MoJ15QUdt0NQ2RVfLTN-bkgUstyXNj2A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:C8CowAAnKJgCft5gVsRjkw--.10083S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxCw1rXrykGr48JF1DAr4ktFb_yoW5GFyrpr
	yqkF4kGr18Gr45JwnIvFy8Ca4Fkwn5Kr1IqFn7Ga48G3ZI93s7JrW8Kwn8uFZ8XryxCw4F
	vrZFvFs7Wrs0v3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07juE__UUUUU=
X-Originating-IP: [218.201.129.20]
X-CM-SenderInfo: htld0w5dqj3xxmlqqiywtou0bp/1tbiXAPD7VXl0JqSCQAAsQ


在 2021/7/1 22:47, Chen-Yu Tsai 写道:
> On Thu, Jul 1, 2021 at 10:37 PM Andre Przywara <andre.przywara@arm.com> wrote:
>> On Thu,  1 Jul 2021 09:50:09 +0800
>> qianfanguijin@163.com wrote:
>>
>> Hi,
>>
>>> From: qianfan Zhao <qianfanguijin@163.com>
>>>
>>> Enable it.
>>>
>>> Signed-off-by: qianfan Zhao <qianfanguijin@163.com>
>>> ---
>>>   arch/arm/boot/dts/sun8i-r40-bananapi-m2-ultra.dts | 14 ++++++++++++++
>>>   1 file changed, 14 insertions(+)
>>>
>>> diff --git a/arch/arm/boot/dts/sun8i-r40-bananapi-m2-ultra.dts b/arch/arm/boot/dts/sun8i-r40-bananapi-m2-ultra.dts
>>> index a6a1087a0c9b..072535b383b5 100644
>>> --- a/arch/arm/boot/dts/sun8i-r40-bananapi-m2-ultra.dts
>>> +++ b/arch/arm/boot/dts/sun8i-r40-bananapi-m2-ultra.dts
>>> @@ -43,6 +43,7 @@
>>>
>>>   /dts-v1/;
>>>   #include "sun8i-r40.dtsi"
>>> +#include "sunxi-common-regulators.dtsi"
>>>
>>>   #include <dt-bindings/gpio/gpio.h>
>>>
>>> @@ -299,6 +300,11 @@
>>>        regulator-name = "vdd1v2-sata";
>>>   };
>>>
>>> +&reg_usb0_vbus {
>>> +     gpio = <&pio 8 13 GPIO_ACTIVE_HIGH>; /* PI13 */
>>> +     status = "okay";
>>> +};
>> So there is the same USB0-DRVVBUS signal connected to this GPIO, but
>> also to the AXP's N_VBUSEN line.
>>
>> Not sure if that means either of them can control the voltage?
> It's better to use N_VBUSEN if that is connected. Since the PMIC
> may have that pin already enabled, it can cause issues with VBUS
> input not being correctly used.
>
> ChenYu

I had checked some boards in linux such as 
sun7i-a20-olinuxino-lime2.dts, they has the same design

that enable VBUS by using a gpio and then connect this gpio to PMIC.

there is a example:

./sun7i-a20-olinuxino-lime2.dts:&reg_usb0_vbus {
./sun7i-a20-olinuxino-lime2.dts-        gpio = <&pio 2 17 GPIO_ACTIVE_HIGH>;
./sun7i-a20-olinuxino-lime2.dts-        status = "okay";
./sun7i-a20-olinuxino-lime2.dts-};

>>> +
>>>   &tcon_tv0 {
>>>        status = "okay";
>>>   };
>>> @@ -328,7 +334,15 @@
>>>        };
>>>   };
>>>
>>> +&usb_otg {
>>> +     dr_mode = "peripheral";
>> That should be "otg", since we have a working ID pin and can control
>> VBUS.
>>
>>> +     status = "okay";
>>> +};
>>> +
>>>   &usbphy {
>>> +     usb0_id_det-gpios = <&pio 8 4 GPIO_ACTIVE_HIGH>; /* PI4 */
>>> +     usb0_vbus_det-gpios = <&pio 8 8 GPIO_ACTIVE_HIGH>; /* PH8 */
>> The comment should say PI8.
>>
>> I don't have the board, but can at least confirm that the GPIO pins
>> (PI4, PI8 and PI13) match the schematic.
>>
>> Cheers,
>> Andre
>>
>>> +     usb0_vbus-supply = <&reg_usb0_vbus>;
>>>        usb1_vbus-supply = <&reg_vcc5v0>;
>>>        usb2_vbus-supply = <&reg_vcc5v0>;
>>>        status = "okay";

