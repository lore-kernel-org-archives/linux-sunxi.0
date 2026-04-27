Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D932125AA
	for <linux-sunxi@lists.linux.dev>; Mon, 27 Apr 2026 13:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777295270; cv=none; b=UYfWTyiX6ps/L9uSWxpIlexmhvdl13OxKVbHRgGfaUh4a3ks+p99vdQmTIj9wsoDtvchCFnJgOqU8ymG5qDy/xoUahbODd0OaD2ZRSVj7c+H6R1JqxPfuf495ucmb/3uMacQnj23t+t6rnF+mLefjC3cELrTgmw5zCz5Gg+Gf10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777295270; c=relaxed/simple;
	bh=TbbJClKZ7O8x+ALvFdyCTvzEsisPs5K1clpCs3pzoOM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nooz3aHZ1D2kTqIkvOGGUzA14gYVjSubWuYTx5Zx91H6zMZgQjeBOq6ZxDxx5uXijEYqsgIuS6s9oBCLvOkPpqpz9G4v+vHr2PQUg1jDdLFaE+MdbJkP0pHXt0O4cp4ulgoiQeXYKrm2zZx8cGWMZANCB3ZAhPq00WE059pi6es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=JKJlViyE; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="JKJlViyE"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AAA2A1684;
	Mon, 27 Apr 2026 06:07:41 -0700 (PDT)
Received: from [10.41.150.145] (e142021.arm.com [10.41.150.145])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ED9793F763;
	Mon, 27 Apr 2026 06:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777295267; bh=TbbJClKZ7O8x+ALvFdyCTvzEsisPs5K1clpCs3pzoOM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JKJlViyE4PMS5qTzV8giUSkfEue6IDhIuc40x5r0TrJmRJhCElN8CVjOXhVhZWJ2f
	 0EfsSm8hdVRSrWLQrv9+ATEQXQLZifg22KlaGJbTcSMm37Ex40rpo9xr9BFdTKW7pB
	 ZLiO134a5HWsFTtTMdoQlUlw7jL43CDiqpmL7wR4=
Message-ID: <33493bbd-2364-4015-a3ab-858992800da9@arm.com>
Date: Mon, 27 Apr 2026 15:07:43 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] sunxi: spl: fix SPL_SUNXI_LED active low
 configuration
To: Quentin Schulz <quentin.schulz@cherry.de>,
 Paul Kocialkowski <paulk@sys-base.io>
Cc: u-boot@lists.denx.de, Tom Rini <trini@konsulko.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-sunxi@lists.linux.dev
References: <20260407223447.4956-1-andre.przywara@arm.com>
 <20260407223447.4956-2-andre.przywara@arm.com> <adfMQBPdntWy1KIq@shepard>
 <cf689aa6-4852-41c1-9c49-3c208e40d76b@cherry.de>
Content-Language: en-US
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <cf689aa6-4852-41c1-9c49-3c208e40d76b@cherry.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Quentin, Paul,

ah, it seems like LEDs are the "embedded bike shed", let me add my shade 
of blue ;-)

On 4/21/26 19:12, Quentin Schulz wrote:
> Hi Paul,
> 
> On 4/9/26 5:56 PM, Paul Kocialkowski wrote:
>> Hi,
>>
>> On Wed 08 Apr 26, 00:34, Andre Przywara wrote:
>>> The newly introduced Allwinner SPL LED "framework" defined a
>>> SPL_SUNXI_LED_STATUS_STATE Kconfig symbol, that was supposed to denote
>>> the active-low vs. active-high polarity of the LED. However this is
>>> a bool symbol, so it will simply vanish if not defined, and we cannot 
>>> use
>>> it directly inside a C statement.
>>>
>>> Filter the symbol through the IS_ENABLED() macro, which will return 0 if
>>> the symbol is not defined, which is the intended value here.
>>>
>>> This fixes configuring LEDs with active-low polarity.
>>>
>>> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
>>> ---
>>>   board/sunxi/board.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/board/sunxi/board.c b/board/sunxi/board.c
>>> index d7722d1858a..80dcae9c1a4 100644
>>> --- a/board/sunxi/board.c
>>> +++ b/board/sunxi/board.c
>>> @@ -563,7 +563,7 @@ static void sunxi_spl_store_dram_size(phys_addr_t 
>>> dram_size)
>>>   static void status_led_init(void)
>>>   {
>>>   #if CONFIG_IS_ENABLED(SUNXI_LED_STATUS)
>>> -    unsigned int state = CONFIG_SPL_SUNXI_LED_STATUS_STATE;
>>> +    unsigned int state = IS_ENABLED(CONFIG_SPL_SUNXI_LED_STATUS_STATE);
>>
>> Sorry I didn't react to the initial submission, but it feels like the
>> CONFIG_SPL_SUNXI_LED_STATUS_STATE symbol really means active-high if 
>> enabled
>> and active-low if disabled. The name would suggest that it's an int 
>> with a value
>> of either 0 or 1 instead.
>>
> 
> Yeah, I lazily renamed the old CONFIG_LED_STATUS_STATE which used to be 
> an int range (0..2) and made it both specific for Allwinner as well as 
> changing it into a bool.
> 
>> I think it would be less confusing to call the symbol
>> CONFIG_SPL_SUNXI_LED_STATUS_ACTIVE_LOW and reverse its meaning, so 
>> that we can
>> spare defining it in most configs (that will be active-high).
> 
> You can also have
> default y
> in your symbol to not have to reverse the meaning.

So what about:
config CONFIG_SPL_SUNXI_LED_STATUS_ACTIVE_HIGH
	default y
then?

> 
>> Also the description currently mentions "initial state" which may be 
>> confusing
>> as it could refer to the state inherited after reset (e.g. due to some 
>> pull
>> resistor) or the state we do set in the SPL.
>>
> 
> It was the prompt for the now removed LED_STATUS_STATE. What are you 
> suggesting instead?

I came up with:
Whether the GPIO of the status LED must be set high or low to turn the 
LED on.
Thoughts?

> 
>>>       unsigned int gpio = CONFIG_SPL_SUNXI_LED_STATUS_BIT;
>>
>> And while at it I would rename this to something like:
>> CONFIG_SPL_SUNXI_LED_STATUS_GPIO since it indicates the GPIO number, 
>> not a
>> specific bit in a sunxi-specific kind of register.
>>
> 
> Also a remnant of LED_STATUS_BIT* symbols. Either work for me.

Yes, indeed CONFIG_LED_STATUS_GPIO makes much more sense.

Let me know what you think.

Cheers,
Andre


> 
> Cheers,
> Quentin

