Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC6DC368
	for <linux-sunxi@lists.linux.dev>; Tue, 28 Jun 2022 03:43:29 +0000 (UTC)
Received: by mail-qv1-f43.google.com with SMTP id c1so18275772qvi.11
        for <linux-sunxi@lists.linux.dev>; Mon, 27 Jun 2022 20:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=QEHEyacbqWJnh5I8neexkZXvqdcsmMlunRIyL22Odso=;
        b=OakumQzeL67o42RRZZfhOeVcGi1SU5WocvhHxS+cpx7sBgE6KY871mRIqbxfFrOBfD
         KHvUY34tXREkenS6pjHL0nYoPyCHFAIcHesS1qQ2XdJ3BEiJQS/MsI0uqmGM5tfRPMQS
         M951aJ7FE9YUBxlxO6pG346TOFdpb6UcqhyZ+rJi+a/qzOhfb//qzMl6JTyQXrqwIXBF
         ZGkK2RSCaNd3HgxRv6Rvt6zWypMFkW50vIpVSPxXaK0n98XexyTeQM/xmNtG2w+vUQWO
         yW2a1jQIXFWDXFdX/aVd4uaLFMR/tf3mYynClC0jiECQlUpScZ6DfZUjpwQYOv16Cxlx
         dyDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=QEHEyacbqWJnh5I8neexkZXvqdcsmMlunRIyL22Odso=;
        b=yDevpBcztN3yN0H+S/WUnRLh4Axf0omS/Deq34ZjWPB/SUIPvzpPdt65sdEfnqI1rA
         FGZKSqm8MF+k7CW2ecd/ST7tAIbaxWMNZlY30aiVymrGYDoMQeG4OgQMETgVhkv4/DfF
         lQy3KNKKpsv7YB9riPDlMtzT6NVaHmvKwZqRLUSWzJjKqJYMv03vBeds6Z0Q4v0aIyix
         bBelizQvdxz9FY0+53KIICYk9wbyxKl1UZIbsjCt9gFLchMhk6huG1PZz4jRkZ/CF/bh
         pmQo0ZlvpO7FVSY82fL/sBZbuG5w+bY5YmYl16bs7F4vGxIRJCb/pVvvm8ViPN9Y+gTC
         jBgQ==
X-Gm-Message-State: AJIora+y/MELjaptWO0nLCq2STrEC+1DpIwR2x7ALLEdam784zCz93LN
	ES3Pzf36mL6jej4yf3wnb0k=
X-Google-Smtp-Source: AGRyM1vFIQzP3PPHmaOKiiW5Qi/QUwHyc8BLoYjaCexmI3FC/ehNW573qf1B9DqpzRrPfQgMUcLgcw==
X-Received: by 2002:ac8:5904:0:b0:317:76f4:9efb with SMTP id 4-20020ac85904000000b0031776f49efbmr12070399qty.303.1656387808674;
        Mon, 27 Jun 2022 20:43:28 -0700 (PDT)
Received: from [10.4.10.38] (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com. [146.115.144.188])
        by smtp.gmail.com with ESMTPSA id de43-20020a05620a372b00b006a2f5ea4a29sm10186214qkb.46.2022.06.27.20.43.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jun 2022 20:43:27 -0700 (PDT)
Message-ID: <69d93bce-f28e-aff8-fc52-03bf93d26bf2@gmail.com>
Date: Mon, 27 Jun 2022 23:43:25 -0400
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 2/7] spi: sunxi: refactor SPI speed/mode programming
Content-Language: en-US
To: Andre Przywara <andre.przywara@arm.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 George Hilliard <thirtythreeforty@gmail.com>,
 qianfan Zhao <qianfanguijin@163.com>
Cc: Icenowy Zheng <icenowy@aosc.io>, Yifan Gu <me@yifangu.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-sunxi@lists.linux.dev,
 u-boot@lists.denx.de
References: <20220503212040.27884-1-andre.przywara@arm.com>
 <20220503212040.27884-3-andre.przywara@arm.com>
 <20220628013157.129f4d64@slackpad.lan>
From: Jesse Taube <mr.bossman075@gmail.com>
In-Reply-To: <20220628013157.129f4d64@slackpad.lan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 6/27/22 20:31, Andre Przywara wrote:
> On Tue,  3 May 2022 22:20:35 +0100
> Andre Przywara <andre.przywara@arm.com> wrote:
> 
> Hi,
> 
>> As George rightfully pointed out [1], the spi-sunxi driver programs the
>> speed and mode settings only when the respective functions are called,
>> but this gets lost over a call to release_bus(). That asserts the
>> reset line, thus forces each SPI register back to its default value.
>> Adding to that, trying to program SPI_CCR and SPI_TCR might be pointless
>> in the first place, when the reset line is still asserted (before
>> claim_bus()), so those setting won't apply most of the time. In reality
>> I see two nested claim_bus() calls for the first use, so settings between
>> the two would work (for instance for the initial "sf probe"). However
>> later on the speed setting is not programmed into the hardware anymore.
> 
> So this issue was addressed with patches by both George (earlier, in a
> different way) and Qianfan (later, in a very similar way).
> 
> Can someone (Jagan?) please have a look at this change from the U-Boot
> SPI perspective? And also the other changes in this series?
> I pushed them to the sunxi/next branch:
> https://source.denx.de/u-boot/custodians/u-boot-sunxi/-/commits/next/
> 
> So can people please test this and report whether this now works as
> expected?

I'm very confused I have forgotten much about this patch set.
I'm going to test it, but why has it only been merged now?

Thanks,
Jesse
> Thanks,
> Andre
>   
>> So far we get away with that default frequency, because that is a rather
>> tame 24 MHz, which most SPI flash chips can handle just fine.
>>
>> Move the actual register programming into a separate function, and use
>> .set_speed and .set_mode just to set the variables in our priv structure.
>> Then we only call this new function in claim_bus(), when we are sure
>> that register accesses actually work and are preserved.
>>
>> [1] https://lore.kernel.org/u-boot/20210725231636.879913-17-me@yifangu.com/
>>
>> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
>> Reported-by: George Hilliard <thirtythreeforty@gmail.com>
>> ---
>>   drivers/spi/spi-sunxi.c | 95 ++++++++++++++++++++++-------------------
>>   1 file changed, 52 insertions(+), 43 deletions(-)
>>
>> diff --git a/drivers/spi/spi-sunxi.c b/drivers/spi/spi-sunxi.c
>> index b6cd7ddafad..d6b2dd09514 100644
>> --- a/drivers/spi/spi-sunxi.c
>> +++ b/drivers/spi/spi-sunxi.c
>> @@ -221,6 +221,56 @@ err_ahb:
>>   	return ret;
>>   }
>>   
>> +static void sun4i_spi_set_speed_mode(struct udevice *dev)
>> +{
>> +	struct sun4i_spi_priv *priv = dev_get_priv(dev);
>> +	unsigned int div;
>> +	u32 reg;
>> +
>> +	/*
>> +	 * Setup clock divider.
>> +	 *
>> +	 * We have two choices there. Either we can use the clock
>> +	 * divide rate 1, which is calculated thanks to this formula:
>> +	 * SPI_CLK = MOD_CLK / (2 ^ (cdr + 1))
>> +	 * Or we can use CDR2, which is calculated with the formula:
>> +	 * SPI_CLK = MOD_CLK / (2 * (cdr + 1))
>> +	 * Whether we use the former or the latter is set through the
>> +	 * DRS bit.
>> +	 *
>> +	 * First try CDR2, and if we can't reach the expected
>> +	 * frequency, fall back to CDR1.
>> +	 */
>> +
>> +	div = SUN4I_SPI_MAX_RATE / (2 * priv->freq);
>> +	reg = readl(SPI_REG(priv, SPI_CCR));
>> +
>> +	if (div <= (SUN4I_CLK_CTL_CDR2_MASK + 1)) {
>> +		if (div > 0)
>> +			div--;
>> +
>> +		reg &= ~(SUN4I_CLK_CTL_CDR2_MASK | SUN4I_CLK_CTL_DRS);
>> +		reg |= SUN4I_CLK_CTL_CDR2(div) | SUN4I_CLK_CTL_DRS;
>> +	} else {
>> +		div = __ilog2(SUN4I_SPI_MAX_RATE) - __ilog2(priv->freq);
>> +		reg &= ~((SUN4I_CLK_CTL_CDR1_MASK << 8) | SUN4I_CLK_CTL_DRS);
>> +		reg |= SUN4I_CLK_CTL_CDR1(div);
>> +	}
>> +
>> +	writel(reg, SPI_REG(priv, SPI_CCR));
>> +
>> +	reg = readl(SPI_REG(priv, SPI_TCR));
>> +	reg &= ~(SPI_BIT(priv, SPI_TCR_CPOL) | SPI_BIT(priv, SPI_TCR_CPHA));
>> +
>> +	if (priv->mode & SPI_CPOL)
>> +		reg |= SPI_BIT(priv, SPI_TCR_CPOL);
>> +
>> +	if (priv->mode & SPI_CPHA)
>> +		reg |= SPI_BIT(priv, SPI_TCR_CPHA);
>> +
>> +	writel(reg, SPI_REG(priv, SPI_TCR));
>> +}
>> +
>>   static int sun4i_spi_claim_bus(struct udevice *dev)
>>   {
>>   	struct sun4i_spi_priv *priv = dev_get_priv(dev->parent);
>> @@ -240,6 +290,8 @@ static int sun4i_spi_claim_bus(struct udevice *dev)
>>   	setbits_le32(SPI_REG(priv, SPI_TCR), SPI_BIT(priv, SPI_TCR_CS_MANUAL) |
>>   		     SPI_BIT(priv, SPI_TCR_CS_ACTIVE_LOW));
>>   
>> +	sun4i_spi_set_speed_mode(dev->parent);
>> +
>>   	return 0;
>>   }
>>   
>> @@ -329,46 +381,14 @@ static int sun4i_spi_set_speed(struct udevice *dev, uint speed)
>>   {
>>   	struct sun4i_spi_plat *plat = dev_get_plat(dev);
>>   	struct sun4i_spi_priv *priv = dev_get_priv(dev);
>> -	unsigned int div;
>> -	u32 reg;
>>   
>>   	if (speed > plat->max_hz)
>>   		speed = plat->max_hz;
>>   
>>   	if (speed < SUN4I_SPI_MIN_RATE)
>>   		speed = SUN4I_SPI_MIN_RATE;
>> -	/*
>> -	 * Setup clock divider.
>> -	 *
>> -	 * We have two choices there. Either we can use the clock
>> -	 * divide rate 1, which is calculated thanks to this formula:
>> -	 * SPI_CLK = MOD_CLK / (2 ^ (cdr + 1))
>> -	 * Or we can use CDR2, which is calculated with the formula:
>> -	 * SPI_CLK = MOD_CLK / (2 * (cdr + 1))
>> -	 * Whether we use the former or the latter is set through the
>> -	 * DRS bit.
>> -	 *
>> -	 * First try CDR2, and if we can't reach the expected
>> -	 * frequency, fall back to CDR1.
>> -	 */
>> -
>> -	div = SUN4I_SPI_MAX_RATE / (2 * speed);
>> -	reg = readl(SPI_REG(priv, SPI_CCR));
>> -
>> -	if (div <= (SUN4I_CLK_CTL_CDR2_MASK + 1)) {
>> -		if (div > 0)
>> -			div--;
>> -
>> -		reg &= ~(SUN4I_CLK_CTL_CDR2_MASK | SUN4I_CLK_CTL_DRS);
>> -		reg |= SUN4I_CLK_CTL_CDR2(div) | SUN4I_CLK_CTL_DRS;
>> -	} else {
>> -		div = __ilog2(SUN4I_SPI_MAX_RATE) - __ilog2(speed);
>> -		reg &= ~((SUN4I_CLK_CTL_CDR1_MASK << 8) | SUN4I_CLK_CTL_DRS);
>> -		reg |= SUN4I_CLK_CTL_CDR1(div);
>> -	}
>>   
>>   	priv->freq = speed;
>> -	writel(reg, SPI_REG(priv, SPI_CCR));
>>   
>>   	return 0;
>>   }
>> @@ -376,19 +396,8 @@ static int sun4i_spi_set_speed(struct udevice *dev, uint speed)
>>   static int sun4i_spi_set_mode(struct udevice *dev, uint mode)
>>   {
>>   	struct sun4i_spi_priv *priv = dev_get_priv(dev);
>> -	u32 reg;
>> -
>> -	reg = readl(SPI_REG(priv, SPI_TCR));
>> -	reg &= ~(SPI_BIT(priv, SPI_TCR_CPOL) | SPI_BIT(priv, SPI_TCR_CPHA));
>> -
>> -	if (mode & SPI_CPOL)
>> -		reg |= SPI_BIT(priv, SPI_TCR_CPOL);
>> -
>> -	if (mode & SPI_CPHA)
>> -		reg |= SPI_BIT(priv, SPI_TCR_CPHA);
>>   
>>   	priv->mode = mode;
>> -	writel(reg, SPI_REG(priv, SPI_TCR));
>>   
>>   	return 0;
>>   }
> 
