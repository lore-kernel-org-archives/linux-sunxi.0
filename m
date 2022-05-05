Received: from m12-17.163.com (m12-17.163.com [220.181.12.17])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC338369
	for <linux-sunxi@lists.linux.dev>; Thu,  5 May 2022 00:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:From; bh=NbsR0
	RAUNPiFvBpQCud5q86qKhCofgOrlEd98ey2cRs=; b=FuQmqiI2vEpJD7ZgfbRhs
	wjsAgRf1pC00d/qlbapcHrGjSRgNFq/0rxG8iWKHeGp3SHUHS9n4edgViA9Bsygd
	RYx5a/l9VGS+XheomdyvjHpQCdEINggp/q5vpEoeJiWTrcXzS0WXkDxcXX1e+uIB
	oIPJOhVQUAqIPQQP4Hn06k=
Received: from [192.168.3.102] (unknown [218.201.129.19])
	by smtp13 (Coremail) with SMTP id EcCowAAXhqIVGXNiWbukAw--.36184S2;
	Thu, 05 May 2022 08:23:50 +0800 (CST)
Message-ID: <ee4fe3db-e45b-aa19-a708-1feda62e7e17@163.com>
Date: Thu, 5 May 2022 08:23:53 +0800
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: question: How to toggle gpio when init_early
Content-Language: en-US
To: Samuel Holland <samuel@sholland.org>
Cc: linux-sunxi@lists.linux.dev
References: <2ecb71b6-6df1-6728-3d30-a401e181b326@163.com>
 <1915b311-05f5-f650-262a-24cbb5ff69e0@sholland.org>
From: qianfan <qianfanguijin@163.com>
In-Reply-To: <1915b311-05f5-f650-262a-24cbb5ff69e0@sholland.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:EcCowAAXhqIVGXNiWbukAw--.36184S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7uw48Kr48tr4fArW3tF4ruFg_yoW8Xw1kpa
	97Wa4ftr4vqrWI9rsFyw17AFWUCa4UJ3Wj9ry5JwnIga45Cry3KrW8J3yYyFWDGr4kGw10
	vr1qy3y3Zw1DA3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UTGQgUUUUU=
X-Originating-IP: [218.201.129.19]
X-CM-SenderInfo: htld0w5dqj3xxmlqqiywtou0bp/xtbCqRv37V0DfM7f5AACs9



在 2022/5/3 7:36, Samuel Holland 写道:
> On 4/28/22 11:30 PM, qianfan wrote:
>> Hi everyone:
>>
>> I want toggle a gpio when machine_desc->init_early, but failed.
>>
>> The gpio is pd24, and I searched the datasheet of r40, the address of PD_DAT
>> register
>> is 0x01c20800 + 3 * 0x24 + 0x10. So I modify this register by __raw_readl and
>> __raw_writel.
>> The system can't startup when I adding those code.
>>
>> Seems the physical address can't touch due to mmu.
>> Can I get some advice?
> You need to call ioremap() to get a virtual address for the MMIO region. But you
I had searched the other mach, some of others has a map_io callback, which
create mmu rules by iotable_init. Copy that idea, I can toggle the gpio
pin.
> really should be using the GPIO API and not raw MMIO. And you really should be
> using devicetree and not touching the machine description. For example, if this
> is for a GPIO-connected watchdog or LED or regulator, Linux already has
> devicetree drivers for these.
Yes, I had enabled the gpio-wdt driver but the sunxi pinctrl/gpio driver
are registed to later. I had sniffer the hardware signals and found it
takes about 3 seconds when gpio-wdt driver ready after u-boot.

sunxi-pinctrl driver are deferred probe and ready when late_init.
Next is the console logs:

[    0.265181] init_late
[    0.293427] sun4i-pinctrl 1c20800.pinctrl: initialized sunXi PIO driver
[    1.760130] gpio_wdt start

So I want add something in machine_desc.

Seems there doesn't has a better way touching gpio watchdog before gpio-wdt
ready.
>
> Regards,
> Samuel

