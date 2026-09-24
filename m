Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4911627D786
	for <linux-sunxi@lists.linux.dev>; Thu, 24 Sep 2026 13:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790255425; cv=none; b=Zr/cABqMFbMtGgB+Q0Or2yoBHAxsktTW8Dvhsd7uj1rT7mtQJNVKb7GiLwE1lwGdDuqAQ6AQMUqI5CmuPNTKH3z1/G2RP5kiuqOo2je3QSGZSSWZ6iGN8ccrDP8rxGjUWUkpGfFu4gAXDeuWLxCq+X/ERqejnMuIfdFCl1fypOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790255425; c=relaxed/simple;
	bh=ssAl/+k4jPnOyZvFEczhhMivxC5cY0K7XEWGExEoAHg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=IrKY4mwWaMrXyl+4bSmDQbStUWtZcxrSWZhyL9s/NzCFQSsAM54lVaqVyOx5orT3vSP8iU7025LayHeLDcC+bNCtW2stfRpwGke1AEchkeBX7iIL5Z7kaEQvVhoG/8xITqvhhJ9KdTqz39BBVAEihJolyGwKVppp+ZLOEHNfwPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=dLNIXwe5; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="dLNIXwe5"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912e64ccso13432645e9.0
        for <linux-sunxi@lists.linux.dev>; Thu, 24 Sep 2026 06:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790255420; x=1790860220; darn=lists.linux.dev;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yqY+VYU5NXGX1DIhJ+QOGA70yG14D0itgxaOKESe4N8=;
        b=dLNIXwe5VKPoavVSqtztRK3s0Zj24t77qV0Kkj1Var9aiv/gDB1+Z/D0nu5wv5ZGEc
         DzxuQshEdbo++67L2bXYWOlnG5/vX22K+RJ5TJqoJksLIY5AT4TWZE9JleMuTYBZS4XR
         7nz83GFihFBhaFd/yPWH1M5z75Bucs4KO6p0O0Zyy9eqkp+ifGpttrAPJPDZtdK1Iz+v
         9iBVn5z3MfItFsRTLsMUKANILvyj6TD7qahLU/+r1jqAn1RtSDzuytJhrkSXAinpnRda
         7xf+tylVtxOa75sOVoI69+e7yyW8Fy3Aid4ew6xHWHO2HxpyPHTano1/8CLm6XOSm3Er
         PorA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790255420; x=1790860220;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yqY+VYU5NXGX1DIhJ+QOGA70yG14D0itgxaOKESe4N8=;
        b=ksosrXa90t3ZFTGLYqwUPOF6wIbNV9l2tvSCJz16jfR0JtIJ1tD1ALvSVPOE+7rbMH
         k2PWVrJcpPwfXJ/pXB5Yp5mvAAZ4OnAvudEX1yZk+JsuOkCeyzvAYnQ1JERvUPdd214X
         fqAbvweLZgsEf+/yyK5I5puNyoV4XymLdqz3awQ6DYs6RPnxFB18C3EjtYs5lu6Fwkyz
         Fslw3kgiVufSwTa3VUcoQw8HZfB8iGlpKEhidLQ887LvkVsixGz4LkPnsPC+as7gY7/m
         2P8jZ0D9Er4dL2gSHu1cshZH5C8f6ncnAJtHAlUFUqQOWvkjPgvVdtkbJBMQ7WwAaE5G
         frxg==
X-Forwarded-Encrypted: i=1; AKwUvBwAx29aOhqZyhIJLL2NkZRm6UgyezE0qQQldk1v7XfRRgjXBd0rqZzPgf5tsT6W1AUuCcav93Y/g2cbng==@lists.linux.dev
X-Gm-Message-State: AFuF++lM1gxlnPBm53KYvURIXFTOhmA8M94dtiWUPJSjrvssVRtzL3VY
	gMDFHCt569W6fbvNj5v0sC4IlHdKwT8fEP9Ize7xwbMyd4VNXYrc2CTN9LQ9FKZEXDY=
X-Gm-Gg: AYBFou26jGUV+7uVyjvhHocSruyMp28NOWb1DbrJjeMiPiib1+2no/H29Pa96dTYqZP
	mu895rftIS2LLdzxnObMLdBgnjCSzXTfF1Wk/YDBKrG7Y+4EnKd0Pf5D/btq60Z9RdL1bykOFkL
	p9mbjklj+18GfGYScSvsePS2Atyk/KqtDdwafbewXB5tyHkb8dTxslRiThgfF6KTR+DklVMkGzc
	Z1YfJk+6GglfTL6VA+66z2QweaME1bQ4KmkRDg5XbI5aPi2hL46l9Tm9aEMFSr1wg1Om+Uf2Vuo
	dbnwkCHk/nrajuI5YJh32ZmM4jpbvqdLuRhKEQEFVcyvzrMB/wKsjGGAqA/Hbfmj73VWBCALEnS
	U/5sGU0uUQ1jkbKgtuJVf5ClxAB31uH7zaWwDH33bFGgwbA1GyLwjp5snGn0b0/rZJFCcWphSeR
	4IhhMPG701p/ub2sFJpA1+Zesn/SILeFabRjopqvzUytf0CIxkY/Ze3Xdm4ZdzxVn2nTuJFqRY8
	bz7PFKKlTdbPmerFQ==
X-Received: by 2002:a05:600c:8b8b:b0:49c:f512:2361 with SMTP id 5b1f17b1804b1-49fe66d470emr42998155e9.14.1790255420471;
        Thu, 24 Sep 2026 06:10:20 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe0c77b8csm87532775e9.3.2026.09.24.06.10.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 06:10:18 -0700 (PDT)
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
In-Reply-To: <20260924082705.GO3864833@google.com>
References: <20260910-axp318-regulator-v8-0-e906a61a7f3d@baylibre.com>
 <20260910-axp318-regulator-v8-2-e906a61a7f3d@baylibre.com>
 <20260924082705.GO3864833@google.com>
Date: Thu, 24 Sep 2026 15:10:17 +0200
Message-ID: <1jy0cq94na.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On jeu. 24 sept. 2026 at 09:27, Lee Jones <lee@kernel.org> wrote:

> On Thu, 10 Sep 2026, Jerome Brunet wrote:
>
>> Apparently this device never really supported i2c instantiation via
>> sysfs, because the driver does not even look at the i2c device data,
>> which are not set. It would only probe if the device matched through DT.
>> 
>> Fix that for correctness, even-though it is probably useless.
>> Add the missing AXP323 while at it.
>> 
>> Reported-by: Sashiko <sashiko-bot@kernel.org>
>> Closes: https://lore.kernel.org/r/20260717090209.2A09B1F000E9@smtp.kernel.org
>> Fixes: 41751b033aaa ("mfd: axp20x-i2c: Add i2c-ids to fix module auto-loading")
>> Acked-by: Chen-Yu Tsai <wens@kernel.org>
>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>> ---
>>  drivers/mfd/axp20x-i2c.c   | 24 +++++++++++++-----------
>>  drivers/mfd/axp20x-rsb.c   |  1 +
>>  drivers/mfd/axp20x.c       |  1 -
>>  include/linux/mfd/axp20x.h |  3 +--
>>  4 files changed, 15 insertions(+), 14 deletions(-)
>> 
>> diff --git a/drivers/mfd/axp20x-i2c.c b/drivers/mfd/axp20x-i2c.c
>> index 5c93136f977e..a76bec5604c4 100644
>> --- a/drivers/mfd/axp20x-i2c.c
>> +++ b/drivers/mfd/axp20x-i2c.c
>> @@ -35,6 +35,7 @@ static int axp20x_i2c_probe(struct i2c_client *i2c)
>>  	axp20x->irq = i2c->irq;
>>  	dev_set_drvdata(axp20x->dev, axp20x);
>>  
>> +	axp20x->variant = (kernel_ulong_t)i2c_get_match_data(i2c);
>
> device_get_match_data() is bus agnostic and should still work from the
> core driver.  What's the purpose of splitting it out and adding
> additional call-sites?

Hi,

device_get_match_data() works when the data comes through that path,
which is generally the case.

i2c_get_match_data() calls device_get_match_data() then fallback to the
i2c_device_ids. It covers the instanciation from sysfs mainly, not
something usual.

As explained in the description, this changes plugs a hole identified by
sashiko that technically exists but I highly doubt anyone will
instanciate the PMIC through that interface. Those things do not really
come as breakout boards ... That being said, it is cheap to fix.

>
>>  	ret = axp20x_match_device(axp20x);
>>  	if (ret)
>>  		return ret;
>> @@ -76,17 +77,18 @@ MODULE_DEVICE_TABLE(of, axp20x_i2c_of_match);
>>  #endif
>>  
>>  static const struct i2c_device_id axp20x_i2c_id[] = {
>> -	{ "axp152" },
>> -	{ "axp192" },
>> -	{ "axp202" },
>> -	{ "axp209" },
>> -	{ "axp221" },
>> -	{ "axp223" },
>> -	{ "axp313a" },
>> -	{ "axp717" },
>> -	{ "axp803" },
>> -	{ "axp806" },
>> -	{ "axp15060" },
>> +	{ .name = "axp152",	.driver_data = AXP152_ID },
>> +	{ .name = "axp192",	.driver_data = AXP192_ID },
>> +	{ .name = "axp202",	.driver_data = AXP202_ID },
>> +	{ .name = "axp209",	.driver_data = AXP209_ID },
>> +	{ .name = "axp221",	.driver_data = AXP221_ID },
>> +	{ .name = "axp223",	.driver_data = AXP223_ID },
>> +	{ .name = "axp313a",	.driver_data = AXP313A_ID },
>> +	{ .name = "axp323",	.driver_data = AXP323_ID },
>> +	{ .name = "axp717",	.driver_data = AXP717_ID },
>> +	{ .name = "axp803",	.driver_data = AXP803_ID },
>> +	{ .name = "axp806",	.driver_data = AXP806_ID },
>> +	{ .name = "axp15060",	.driver_data = AXP15060_ID },
>>  	{ }
>>  };
>>  MODULE_DEVICE_TABLE(i2c, axp20x_i2c_id);
>> diff --git a/drivers/mfd/axp20x-rsb.c b/drivers/mfd/axp20x-rsb.c
>> index 059656f2a1bd..8fdc870c1fe4 100644
>> --- a/drivers/mfd/axp20x-rsb.c
>> +++ b/drivers/mfd/axp20x-rsb.c
>> @@ -35,6 +35,7 @@ static int axp20x_rsb_probe(struct sunxi_rsb_device *rdev)
>>  	axp20x->irq = rdev->irq;
>>  	dev_set_drvdata(&rdev->dev, axp20x);
>>  
>> +	axp20x->variant = (kernel_ulong_t)device_get_match_data(axp20x->dev);
>>  	ret = axp20x_match_device(axp20x);
>>  	if (ret)
>>  		return ret;
>> diff --git a/drivers/mfd/axp20x.c b/drivers/mfd/axp20x.c
>> index 4d770e718716..de6946d4bb13 100644
>> --- a/drivers/mfd/axp20x.c
>> +++ b/drivers/mfd/axp20x.c
>> @@ -1267,7 +1267,6 @@ int axp20x_match_device(struct axp20x_dev *axp20x)
>>  	const struct mfd_cell *cells_no_irq = NULL;
>>  	int nr_cells_no_irq = 0;
>>  
>> -	axp20x->variant = (long)device_get_match_data(dev);
>>  	switch (axp20x->variant) {
>>  	case AXP152_ID:
>>  		axp20x->nr_cells = ARRAY_SIZE(axp152_cells);
>> diff --git a/include/linux/mfd/axp20x.h b/include/linux/mfd/axp20x.h
>> index b352661d99a1..1badb4868d17 100644
>> --- a/include/linux/mfd/axp20x.h
>> +++ b/include/linux/mfd/axp20x.h
>> @@ -997,8 +997,7 @@ static inline int axp20x_read_variable_width(struct regmap *regmap,
>>  /**
>>   * axp20x_match_device(): Setup axp20x variant related fields
>>   *
>> - * @axp20x: axp20x device to setup (.dev field must be set)
>> - * @dev: device associated with this axp20x device
>> + * @axp20x: axp20x device to setup (.dev and variant fields must be set)
>>   *
>>   * This lets the axp20x core configure the mfd cells and register maps
>>   * for later use.
>> 
>> -- 
>> 2.53.0
>> 
>
> -- 
> Lee Jones

-- 
Jerome
