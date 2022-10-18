Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E30227B
	for <linux-sunxi@lists.linux.dev>; Tue, 18 Oct 2022 09:24:01 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BD61D113E;
	Tue, 18 Oct 2022 02:24:01 -0700 (PDT)
Received: from [10.1.26.48] (unknown [10.1.26.48])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D88263F7D8;
	Tue, 18 Oct 2022 02:23:53 -0700 (PDT)
Message-ID: <905be4d0-74c3-c563-00e8-fcd039694cb7@arm.com>
Date: Tue, 18 Oct 2022 10:23:41 +0100
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 4/6] sunxi: f1c100: add UART1 support
Content-Language: en-GB
To: =?UTF-8?Q?Jernej_=c5=a0krabec?= <jernej.skrabec@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Cc: Icenowy Zheng <uwu@icenowy.me>, Jesse Taube <mr.bossman075@gmail.com>,
 Yifan Gu <me@yifangu.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 George Hilliard <thirtythreeforty@gmail.com>,
 Samuel Holland <samuel@sholland.org>, u-boot@lists.denx.de,
 linux-sunxi@lists.linux.dev
References: <20221012163458.1968900-1-andre.przywara@arm.com>
 <20221012163458.1968900-5-andre.przywara@arm.com> <1917971.yKVeVyVuyW@kista>
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <1917971.yKVeVyVuyW@kista>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12/10/2022 22:42, Jernej Škrabec wrote:

Hi Jernej,

many thanks for the review of this series, that's much appreciated!

> Dne sreda, 12. oktober 2022 ob 18:34:56 CEST je Andre Przywara napisal(a):
>> Some boards use UART1 for its debug UART, so define the pins for the SPL
>> and the pinmux name and mux value for U-Boot proper.
>>
>> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
>> ---
>>   arch/arm/mach-sunxi/board.c           | 4 ++++
>>   drivers/pinctrl/sunxi/pinctrl-sunxi.c | 1 +
>>   2 files changed, 5 insertions(+)
>>
>> diff --git a/arch/arm/mach-sunxi/board.c b/arch/arm/mach-sunxi/board.c
>> index 62bb40b8c89..77216157908 100644
>> --- a/arch/arm/mach-sunxi/board.c
>> +++ b/arch/arm/mach-sunxi/board.c
>> @@ -147,6 +147,10 @@ static int gpio_init(void)
>>   	sunxi_gpio_set_cfgpin(SUNXI_GPH(12), SUN9I_GPH_UART0);
>>   	sunxi_gpio_set_cfgpin(SUNXI_GPH(13), SUN9I_GPH_UART0);
>>   	sunxi_gpio_set_pull(SUNXI_GPH(13), SUNXI_GPIO_PULL_UP);
>> +#elif CONFIG_CONS_INDEX == 2 && defined(CONFIG_MACH_SUNIV)
>> +	sunxi_gpio_set_cfgpin(SUNXI_GPA(2), SUNIV_GPE_UART0);
>> +	sunxi_gpio_set_cfgpin(SUNXI_GPA(3), SUNIV_GPE_UART0);
>> +	sunxi_gpio_set_pull(SUNXI_GPA(3), SUNXI_GPIO_PULL_UP);
>>   #elif CONFIG_CONS_INDEX == 2 && defined(CONFIG_MACH_SUN5I)
>>   	sunxi_gpio_set_cfgpin(SUNXI_GPG(3), SUN5I_GPG_UART1);
>>   	sunxi_gpio_set_cfgpin(SUNXI_GPG(4), SUN5I_GPG_UART1);
>> diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
>> b/drivers/pinctrl/sunxi/pinctrl-sunxi.c index 9ce2bc1b3af..061104be056
>> 100644
>> --- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
>> +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
>> @@ -245,6 +245,7 @@ static const struct sunxi_pinctrl_function
>> suniv_f1c100s_pinctrl_functions[] = { #else
>>   	{ "uart0",	5 },	/* PE0-PE1 */
>>   #endif
>> +	{ "uart1",	5 },	/* PA0-PA3 */
> 
> Comment should be PA2-PA3. With that fixed:

Well, PA0 and PA1 are RTS and CTS for UART1, so if you don't mind, I 
will keep it like this. Not that the comment really matters anyway ;-)

Cheers,
Andre

> Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> 
> Best regards,
> Jernej
> 
>>   };
>>
>>   static const struct sunxi_pinctrl_desc __maybe_unused
>> suniv_f1c100s_pinctrl_desc = { --
>> 2.25.1
> 
> 
> 

