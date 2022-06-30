Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E89C17FC
	for <linux-sunxi@lists.linux.dev>; Thu, 30 Jun 2022 03:25:58 +0000 (UTC)
Received: by mail-qv1-f45.google.com with SMTP id cu16so27909751qvb.7
        for <linux-sunxi@lists.linux.dev>; Wed, 29 Jun 2022 20:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=/Rxk4EUgPmOA9fJSh4NM4h9kHk9GB6z7utyUOqPltuE=;
        b=CesBg/IvjOr1tv4G1aZhrZWRDS7xkuzA+mGAQTZHurD4dCnBonHjQZm7ClZ1FmW2Ov
         E82ascksrvvhzbaHpV4e4TxvHfsdwzk61wkX7ftThDCQUz8g97zkL7seUKoHGlujUzXm
         pZeflDN7XKkt5dEr0q3E/59PRvS1wsZ+4v5lZHaBwMB2fvyVCN6vSROLYWHYXjFGt3on
         Fo29ujRqRrQLAWEqbmtC8PPXqv98ey7o0t2jl1v4u1MqPPAR+QFAvG8XpGhACnWWZLmH
         djz7h23/9fXSjyPIA3NN6vgeFYWPUMuITDHMBWfPqCWQCBh+2OFHLgLtTZA0m9UjEmku
         sWvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=/Rxk4EUgPmOA9fJSh4NM4h9kHk9GB6z7utyUOqPltuE=;
        b=Yiphwjmi5gvt+AawYku/BpVrfDeWos9hfF18WKkJTohhMpRGbHcoKoiO0ccG7+AvT2
         tLtjBKUiTcPN6HiKe0yngglFaJjnLlLRR+1lSPm0E0UeoajvX6ME24FTpDsGgm30XVre
         mq5Pyfw9vEjbq3zr2ZgMXSfvKDpf0DgZqOoQQrCJ5lNFvDItpsqZ1HbIhSftLTY1ZNd9
         7PgfKaU6VkLvqKk3fNGv7GxUTvZbSPmhahONKmugk9GpxB3qMOdzfALBG56pKfX01k28
         jhS6GgAep+LcC6MprHKY2oA2pYT+SF40WZXuNt1ZiroiOgBfEKsIlLOf51Wi9GUBeoEO
         PhiQ==
X-Gm-Message-State: AJIora9b/CoKeVi8mL1eetA8C11sPsjWu9H6GftZyopMcWXz5hzCy8k0
	8TpA9FSg6Rn2su94XzGwPgI=
X-Google-Smtp-Source: AGRyM1sK7EE5sKbw4s0s+h0Byv3EnLV4wWFL7YXtcOareBZ0GPMBwkc++LRwRdOWTGr6c1I+suWDEA==
X-Received: by 2002:a05:622a:11c4:b0:31a:e88d:9a22 with SMTP id n4-20020a05622a11c400b0031ae88d9a22mr5719143qtk.306.1656559557705;
        Wed, 29 Jun 2022 20:25:57 -0700 (PDT)
Received: from [10.4.10.38] (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com. [146.115.144.188])
        by smtp.gmail.com with ESMTPSA id v26-20020ac873da000000b00304dec6452csm11826376qtp.78.2022.06.29.20.25.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jun 2022 20:25:56 -0700 (PDT)
Message-ID: <9d7a7ba7-13d7-6f7f-19ea-5fc2a08e67a5@gmail.com>
Date: Wed, 29 Jun 2022 23:25:55 -0400
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
Tested-by: Jesse Taube <Mr.Bossman075@gmail.com>

I talked to Icenowy who also tested and said it worked with spi-nand.

There is one issue but not related to this set, the SPI max clock is 1Mhz.

Another note disabling the clock gates in `sun4i_spi_set_clock` will 
stop you from dumping the memory of the peripheral.

It would also be nice if i was kept in CC for other SUNIV patches.

Thanks,
Jesse
> So can people please test this and report whether this now works as
> expected?
> 
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
