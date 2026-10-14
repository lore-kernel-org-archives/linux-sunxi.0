Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D41EF4E8DF6
	for <linux-sunxi@lists.linux.dev>; Wed, 14 Oct 2026 12:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791980525; cv=none; b=PFyBtmMzuKTlH2lITaxjmOpLsRleUXnpuKUcdavM4b+4pNovs7yK+KMZrz0V5nhneY4jHKC/XLMQCOTYry/E4DqqxbyaLbz1yL+z9Rve9uTVda4H0H2mH8FZSI+6yHyIheJDcGOCMUsKja50GDJ7d2PDEwT30P7/XjbaM0BOoBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791980525; c=relaxed/simple;
	bh=zGnsfwoiH3l15pG9imgXWQ4RAKkTcq88CDHo3TNmbMs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=YO2c8yNRmoFr980ixAPIT4rtvSk6ycoxLMtU3YDqJ6yEEsDT33su8k31pavMkw4+dkEHEYCZekfhmrukq8rW3qFP7JbZJYLVa0SylOMuuedgjy3iBSJys1qWxQCSkpUdvU1KQ2Y4Jvi06zipwaBZIecFmJgyfq1kFjZq7KeuOc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=DLh0AAr9; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="DLh0AAr9"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48b001cd92bso232155f8f.2
        for <linux-sunxi@lists.linux.dev>; Wed, 14 Oct 2026 05:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791980521; x=1792585321; darn=lists.linux.dev;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Db25ZMHefpwrT2u9J0IfKgd8DwY0pARpKfgg+wYIUcg=;
        b=DLh0AAr9l4HGQzoGFM3AuXKCVmYCLAfQg+tCN1UfLbivJgpr+fDgqBwCWb+hb40CwT
         XV3TauRtgs1ORWSgfVOAZUu7GVvzjFjIGw3z356ySDhiKcGpj6noAdGRlyfs+gy9yj0D
         CHciumvbvRe40hyGLVDI9T1NyJp6YwsG2Cp90ElInUqw63+ztVD0hIzpIiuCNwX1pa2J
         kI4sGik6j93wmfPP+QjPY1+XjC4T8llRnfsKiavY8Q2reR31pEqCoPl+x2Z7gxLP8Ai1
         iFq2lcTmSnvh2cbGsVvj27CB7JXDHGSD8I9Feb47DI/yKs9J1FxTsoRTr2B5b88oJg+i
         JrUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791980521; x=1792585321;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Db25ZMHefpwrT2u9J0IfKgd8DwY0pARpKfgg+wYIUcg=;
        b=eDPxPFiLHbf4zaR84QlN2VqptJg8InyMepZY3+V+qO4aTiKM9u1HD20UKmek417H48
         cBy4gmsRnMl3AqNKi1by6Mh312FMSiiRtfdw/hku5VwgJQ5GPg1/drmSRJ7+aJcJvgYX
         XbHG+CobyrN7Bftqdw8bN1sPTlgSPU99nxN/goeGFTta17fw9kUbvU++lEludFMU+tip
         9dnmQwTBzT0EbzQnhf6GbMyMEWD3PhnNBWBqX31wW+Pa4h8kCX8/ktSLAl3EWgHpJCTz
         RdIJwTg8Z9LFPBxJW6HFIidSJdJBNA74KxwGgq3ln8M5I+vMNHCZ+28IltXzJKtoRjjs
         eDlQ==
X-Forwarded-Encrypted: i=1; AKwUvBwj1FJA11UTFcaXaDhiW0cTBw5/DNxLeo8hM1QNVxCtT9/XtGpZapew72vypVWsONG7UQoVQl6LGWpIyw==@lists.linux.dev
X-Gm-Message-State: AFq9FYLe0djID/n1A9c2+RxjaXsm4YgdunaQF/cB0xw7zWrPWcTND6+P
	uFKibAzoB+qBKBYlBfN6lmdbVP+p4VsHpnHywQrwIupdExSZJ+5r9eiJhdMvsGmOYILAB3mf5uT
	wESblqYc=
X-Gm-Gg: AYBFou1H+v6mX4OXMO0y0748tYayWZDjbGUA8A99W5eBiaO/u0ZYvU5jw/gwmPJ7+/h
	bfWDhvxQWkLylIMbXbOxe1jM/l60fQYzl/gb0li4LqSq/2dDWdkZjvOGXqyqEagd4TwxRZI7UVp
	BO99fIk7dFVDSBg3q3ldbc0JxlrwC66XCpInTx5ID2abrNCkC5DuBYIzvyk/MOPbjZFue1Lzsyb
	3jNbqVxbhk4VtUdUJtN8Nomt2sGPoI13MlGjCc6N+t4VdR1TCgPG1N23M4UmVuCEIpfLmZW7nk0
	NOb/r0wwT2ipSynNA7bgkzwissNS5DlpnmmDMFkJ+znGcm1pdk1Rn7ZAgV1FGFIF+UGxoHocN+k
	p6uqdtWSV2xKJiXuSN0kiogd9U4ps7CeLxFVtSTvc5bPujag1L0pI7Kz1D9BC1WUB6Wh/GKNlze
	c15cPx2CdKq0O+zhVwAbTlIC2J8ycJrkqwRzkmxw5mD4m7MLCv9zXQLojbVkUVLCiAJp5hOi//A
	B8edViL3P5+ZlCt6A==
X-Received: by 2002:a05:6000:46da:b0:48b:68:594a with SMTP id ffacd0b85a97d-48dbaadc11amr21368597f8f.12.1791980519540;
        Wed, 14 Oct 2026 05:21:59 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0ac5265sm12364641f8f.41.2026.10.14.05.21.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 05:21:58 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: Andre Przywara <andre.przywara@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Hans de Goede
 <hansg@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, mfd@lists.linux.dev,
 linux-sunxi@lists.linux.dev, Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH v8 2/5] mfd: axp20x-i2c: Fix i2c instantiation
In-Reply-To: <20261014104801.GI199624@google.com>
References: <20260910-axp318-regulator-v8-0-e906a61a7f3d@baylibre.com>
 <20260910-axp318-regulator-v8-2-e906a61a7f3d@baylibre.com>
 <20260924082705.GO3864833@google.com>
 <1jy0cq94na.fsf@starbuckisacylon.baylibre.com>
 <20261014104801.GI199624@google.com>
Date: Wed, 14 Oct 2026 14:21:58 +0200
Message-ID: <1ja4ogfp5l.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On mer. 14 oct. 2026 at 11:48, Lee Jones <lee@kernel.org> wrote:

> Note:
>
> --- checkpatch.pl (3 issues) ---
> Line 2: WARNING: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
> Line 3: ERROR: Invalid commit separator - some tools may have problems applying this
> ----------------------------------

I've checked before sending and checked again now, I don't have those
warning. I don't see anything long on line 2 or a separator near line 3.

Any specific way I should run the tool reproduce the problem if there is
one ?

>
> On Thu, 24 Sep 2026, Jerome Brunet wrote:
>
>> On jeu. 24 sept. 2026 at 09:27, Lee Jones <lee@kernel.org> wrote:
>> 
>> > On Thu, 10 Sep 2026, Jerome Brunet wrote:
>> >
>> >> Apparently this device never really supported i2c instantiation via
>> >> sysfs, because the driver does not even look at the i2c device data,
>> >> which are not set. It would only probe if the device matched through DT.
>> >> 
>> >> Fix that for correctness, even-though it is probably useless.
>> >> Add the missing AXP323 while at it.
>> >> 
>> >> Reported-by: Sashiko <sashiko-bot@kernel.org>
>> >> Closes: https://lore.kernel.org/r/20260717090209.2A09B1F000E9@smtp.kernel.org
>> >> Fixes: 41751b033aaa ("mfd: axp20x-i2c: Add i2c-ids to fix module auto-loading")
>> >> Acked-by: Chen-Yu Tsai <wens@kernel.org>
>> >> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>> >> ---
>> >>  drivers/mfd/axp20x-i2c.c   | 24 +++++++++++++-----------
>> >>  drivers/mfd/axp20x-rsb.c   |  1 +
>> >>  drivers/mfd/axp20x.c       |  1 -
>> >>  include/linux/mfd/axp20x.h |  3 +--
>> >>  4 files changed, 15 insertions(+), 14 deletions(-)
>> >> 
>> >> diff --git a/drivers/mfd/axp20x-i2c.c b/drivers/mfd/axp20x-i2c.c
>> >> index 5c93136f977e..a76bec5604c4 100644
>> >> --- a/drivers/mfd/axp20x-i2c.c
>> >> +++ b/drivers/mfd/axp20x-i2c.c
>> >> @@ -35,6 +35,7 @@ static int axp20x_i2c_probe(struct i2c_client *i2c)
>> >>  	axp20x->irq = i2c->irq;
>> >>  	dev_set_drvdata(axp20x->dev, axp20x);
>> >>  
>> >> +	axp20x->variant = (kernel_ulong_t)i2c_get_match_data(i2c);
>> >
>> > device_get_match_data() is bus agnostic and should still work from the
>> > core driver.  What's the purpose of splitting it out and adding
>> > additional call-sites?
>> 
>> device_get_match_data() works when the data comes through that path,
>> which is generally the case.
>> 
>> i2c_get_match_data() calls device_get_match_data() then fallback to the
>> i2c_device_ids. It covers the instanciation from sysfs mainly, not
>> something usual.
>> 
>> As explained in the description, this changes plugs a hole identified by
>> sashiko that technically exists but I highly doubt anyone will
>> instanciate the PMIC through that interface. Those things do not really
>> come as breakout boards ... That being said, it is cheap to fix.
>
> I'm confused.
>
> We already call device_get_match_data() in axp20x_match_device().

Not anymore with this change. It is the point.

>
> So if you populate .driver_data in axp20x_i2c_id[], you should be
> able to drop these changes altogether, no?

device_get_match_data() only goes through the DT tables.
Not the i2c_driver.id_table which is purpose here.

My understanding is that if you instanciate the device
through sysfs (which nobody does for these devices) and you only call
device_get_match_data(), you will get NULL because there is no fwnode
associated with the device, which in this case silently translate to
AXP152_ID.

device_get_match_data() does not go through the i2c_driver.id_table.
Only the i2c code does, with i2c_get_match_data() and after trying with
device_get_match_data() internally, which is exactly what we want.

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/i2c/i2c-core-base.c?h=v7.3-rc7#n121

As noted earlier, this a problem reported by sashiko that is real but
extremely unlikely to show up in real world. I'd happy to drop
the change if you don't want it. It is not need to support the axp318.

>
>> >>  	ret = axp20x_match_device(axp20x);
>> >>  	if (ret)
>> >>  		return ret;
>> >> @@ -76,17 +77,18 @@ MODULE_DEVICE_TABLE(of, axp20x_i2c_of_match);
>> >>  #endif
>> >>  
>> >>  static const struct i2c_device_id axp20x_i2c_id[] = {
>> >> -	{ "axp152" },
>> >> -	{ "axp192" },
>> >> -	{ "axp202" },
>> >> -	{ "axp209" },
>> >> -	{ "axp221" },
>> >> -	{ "axp223" },
>> >> -	{ "axp313a" },
>> >> -	{ "axp717" },
>> >> -	{ "axp803" },
>> >> -	{ "axp806" },
>> >> -	{ "axp15060" },
>> >> +	{ .name = "axp152",	.driver_data = AXP152_ID },
>> >> +	{ .name = "axp192",	.driver_data = AXP192_ID },
>> >> +	{ .name = "axp202",	.driver_data = AXP202_ID },
>> >> +	{ .name = "axp209",	.driver_data = AXP209_ID },
>> >> +	{ .name = "axp221",	.driver_data = AXP221_ID },
>> >> +	{ .name = "axp223",	.driver_data = AXP223_ID },
>> >> +	{ .name = "axp313a",	.driver_data = AXP313A_ID },
>> >> +	{ .name = "axp323",	.driver_data = AXP323_ID },
>> >> +	{ .name = "axp717",	.driver_data = AXP717_ID },
>> >> +	{ .name = "axp803",	.driver_data = AXP803_ID },
>> >> +	{ .name = "axp806",	.driver_data = AXP806_ID },
>> >> +	{ .name = "axp15060",	.driver_data = AXP15060_ID },
>> >>  	{ }
>> >>  };
>> >>  MODULE_DEVICE_TABLE(i2c, axp20x_i2c_id);
>> >> diff --git a/drivers/mfd/axp20x-rsb.c b/drivers/mfd/axp20x-rsb.c
>> >> index 059656f2a1bd..8fdc870c1fe4 100644
>> >> --- a/drivers/mfd/axp20x-rsb.c
>> >> +++ b/drivers/mfd/axp20x-rsb.c
>> >> @@ -35,6 +35,7 @@ static int axp20x_rsb_probe(struct sunxi_rsb_device *rdev)
>> >>  	axp20x->irq = rdev->irq;
>> >>  	dev_set_drvdata(&rdev->dev, axp20x);
>> >>  
>> >> +	axp20x->variant = (kernel_ulong_t)device_get_match_data(axp20x->dev);
>> >>  	ret = axp20x_match_device(axp20x);
>> >>  	if (ret)
>> >>  		return ret;
>> >> diff --git a/drivers/mfd/axp20x.c b/drivers/mfd/axp20x.c
>> >> index 4d770e718716..de6946d4bb13 100644
>> >> --- a/drivers/mfd/axp20x.c
>> >> +++ b/drivers/mfd/axp20x.c
>> >> @@ -1267,7 +1267,6 @@ int axp20x_match_device(struct axp20x_dev *axp20x)
>> >>  	const struct mfd_cell *cells_no_irq = NULL;
>> >>  	int nr_cells_no_irq = 0;
>> >>  
>> >> -	axp20x->variant = (long)device_get_match_data(dev);
>> >>  	switch (axp20x->variant) {
>> >>  	case AXP152_ID:
>> >>  		axp20x->nr_cells = ARRAY_SIZE(axp152_cells);
>> >> diff --git a/include/linux/mfd/axp20x.h b/include/linux/mfd/axp20x.h
>> >> index b352661d99a1..1badb4868d17 100644
>> >> --- a/include/linux/mfd/axp20x.h
>> >> +++ b/include/linux/mfd/axp20x.h
>> >> @@ -997,8 +997,7 @@ static inline int axp20x_read_variable_width(struct regmap *regmap,
>> >>  /**
>> >>   * axp20x_match_device(): Setup axp20x variant related fields
>> >>   *
>> >> - * @axp20x: axp20x device to setup (.dev field must be set)
>> >> - * @dev: device associated with this axp20x device
>> >> + * @axp20x: axp20x device to setup (.dev and variant fields must be set)
>> >>   *
>> >>   * This lets the axp20x core configure the mfd cells and register maps
>> >>   * for later use.
>> >> 
>> >> -- 
>> >> 2.53.0
>> >> 
>> >
>> > -- 
>> > Lee Jones
>> 
>> -- 
>> Jerome
>
> -- 
> Lee Jones

-- 
Jerome
