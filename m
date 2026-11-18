Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795013020;
	b=WW6KVBuWWYYC5kxfuwwgR0AW6gvL2Tld+ye3Ntf6aisKUtLSdIA4frzxJ4WfxrQNlPE3
	 qHUUuHfGDb9My2zKwGVqUqRxlEPgilpFNoaTtQ+ijUnlEt2BFWPA1x0hBOAyEOmOopTfO
	 d5SrYOLzFxCjcFd95zEQpqwx4qgYbJl1MhVRnIiAi8FSQX0ONn732KCunw+9ou1F5JwPs
	 tG5cP5qx42GT+hTZX7PsCUTddIRbyTk+55yyKFCgn/Mm9CLObapo6yOlFB7YAMXiP82sn
	 yhxyji1gTYksiUwWoC5ZrVYZtenU7uexsMphKPdFhz6lHNzGej3PKpLkncJhqjIVmwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795013020;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type;
	bh=lofE1i0lcl9nIDZVdZhTFR9XGUpRnG24017uwCNl4OI=;
	b=LoNQjoVOfs8zqGBv5rjFBpey+nRDzJDvTw223RABohOydTXJKAKexVd8BIdPQeqtpoIL
	 J9b7WIhRv3cDDtpSc/YVzA7AHcxEtXE+DOmzl3ntoOTgSoeTIqGrqfnBkSafv/8bk2ThM
	 HQT8caWnPKpG1u0zS6Le+lYzKXO7pBZHXgU94e1BQ1FJZvxAAKt+7hlDgbrm2K1pONW7M
	 mU86LghiFsb71qSk7po6O+F8UjHetr24OR6UWLvRcGA3IaHgvR/T064Q7OTHR/dMXMPV+
	 4CeCCeHUhinrqy7cEkWHsudHRGbZXA9iezTt3q3l9DQzmeyDEndvumWYxODaYxSykkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=mPieSCZ5;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D203606A32C
	for <linux-sunxi@lists.linux.dev>; Wed, 18 Nov 2026 14:43:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D203606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=mPieSCZ5
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4ba013938d7so10015805e9.2
        for <linux-sunxi@lists.linux.dev>; Wed, 18 Nov 2026 06:43:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795013017; x=1795617817; darn=lists.linux.dev;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lofE1i0lcl9nIDZVdZhTFR9XGUpRnG24017uwCNl4OI=;
        b=mPieSCZ5R2FY+D9y17c5MMtObeNPB87aoroerDZtwQCIg2lfALm0j6W18RyIiHhxr9
         zgCrd8VF28ukZxXEcot678aOHq7fKx4xt+HeWSTP2GbOeVNzXIQRPOaKkQdN62vzOdvZ
         PJvM5b7rqYkY9veGH9Lj8hkxu1iIICnWUxnvh5oqN4NsB0U1BSFn2ZZn3UO0S1g/8KRz
         xWw0nZQgJn+2jRqhb4KzQf8NfhrSt201Fl5qQm3Zgg6WYI1TmIaLcc6FiuCtPkpPzCLQ
         dMQFOaPPdUugsFOS37g9vH3OOfaxFKy5EocGfy3sfLihxKxP0GPTqShLHoTJC3N2/4FQ
         FW9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795013017; x=1795617817;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lofE1i0lcl9nIDZVdZhTFR9XGUpRnG24017uwCNl4OI=;
        b=sTIR24XagsECDu4+18rrckZnDKVSWfHQbYsJQCknHAWk+N4QM6erTLGcjfUfvW0ytx
         ZVSsufmzwsCYkUcTyZBt7tpt2SwJy9BR1khEdr/ldl7aITJdA77VJYLrqqZ7qkqKGjCJ
         CJk92gQRDmxjHCNC8HtHwYjETAHPgkjXVT+8iK4DN6YituluR9G8N+ofNrllg37X13U+
         TO4v/7y5QAcS6cnAUPOURyGwfFP9EHw7IDudIhu9Po4oGVp4mbYojZnD+BFNSB6VvAhK
         3C4xd+e7MDwLdxqVHJAOV6b1m6+lWpKb9IPgL3fvm4jmasOzcxSxHcKPIz7g5QPnhFF9
         WYYQ==
X-Forwarded-Encrypted: i=1; AL+hErGVViXdhb5Gx/R1Z9xwRrM5kdWrdp5HgwQy3ecEyUEX5ILop5tiACcOs8z4ANbuM/IFKKVa5Iut404zYg==@lists.linux.dev
X-Gm-Message-State: APuU4Z9cbbHQ80o2GMDhgpp8M5wmu+LQLS+Y/0BJvkZ5Ip1qptDwQ0/W
	Y+WD+f6ol+6o35JjLAlyHPdmQaeprs//CtNRXdrn6Lb0QVo5A8p950dcOsVdagEb7jI=
X-Gm-Gg: AYBFou2HBc4q/3VIHpYxEp+cEXPJcdram50gt99wjXQFq819WBUSJDicV/9kNiScWu1
	CIIJfAR2YyWmSBhVfWtbf3/7DZL9u2WQdelbLf71XWAf+JyXktpxcyS9KcDdBmuyilxK3k8qe5n
	AHS8yvHdMetkrFwnil3xDbC6+FoVgVvH9d4nvf1ArmTR+zWbgR5z7YkrNgtVEfluYdCUwJm0iHr
	uy24xDntmcpO+E9nB696mY3HBAz29nQ9GFleYRhUlB/yFbG/YVDnBjSzQ9Bp5KRx2oKvq9ZUL9h
	/NrLobn//wJnJFJGKcgWTl6SdhjuFcHXR3OwZ09fU/nf+gN8x38DScILpRCsco7WR6EMui4Chu6
	iTwIoYWDHdpV7U7cfj8ZJClrEXNbXuAM2QOgaAxIkljCCyjVRa1GIY1+u58teVbn40ZOyVtwHJc
	qif/g/FhaHBQPt3ca3dk5RxuSiqY6pxF4RkehtLKIu63Rd55S8iC4KZZTjqWLTsRdSPjppeHrQu
	zo6Iwt6sd240vkdiAr8WGE932VySBWyxwyRh+kdcuhoTTHwveuZJScos6G1kapnxwnCInUBv26k
	TXNICSjuq3heJuI3WKyeSFLtx/4HXcRBle32A2jN+XJ9yO24AwUIZZ2HCuL0H0lgdRov9A==
X-Received: by 2002:a05:600c:81c5:b0:4a1:f720:74cd with SMTP id 5b1f17b1804b1-4bb7da38bd0mr52621935e9.24.1795013017611;
        Wed, 18 Nov 2026 06:43:37 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7e5919c5sm29710375e9.3.2026.11.18.06.43.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 06:43:37 -0800 (PST)
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
In-Reply-To: <1ja4ogfp5l.fsf@starbuckisacylon.baylibre.com>
References: <20260910-axp318-regulator-v8-0-e906a61a7f3d@baylibre.com>
 <20260910-axp318-regulator-v8-2-e906a61a7f3d@baylibre.com>
 <20260924082705.GO3864833@google.com>
 <1jy0cq94na.fsf@starbuckisacylon.baylibre.com>
 <20261014104801.GI199624@google.com>
 <1ja4ogfp5l.fsf@starbuckisacylon.baylibre.com>
Date: Wed, 18 Nov 2026 15:43:36 +0100
Message-ID: <1jh5he2o9z.fsf@starbuckisacylon.baylibre.com>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

On mer. 14 oct. 2026 at 14:21, Jerome Brunet <jbrunet@baylibre.com> wrote:

> On mer. 14 oct. 2026 at 11:48, Lee Jones <lee@kernel.org> wrote:
>
>> Note:
>>
>> --- checkpatch.pl (3 issues) ---
>> Line 2: WARNING: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
>> Line 3: ERROR: Invalid commit separator - some tools may have problems applying this
>> ----------------------------------
>
> I've checked before sending and checked again now, I don't have those
> warning. I don't see anything long on line 2 or a separator near line 3.
>
> Any specific way I should run the tool reproduce the problem if there is
> one ?
>
>>
>> On Thu, 24 Sep 2026, Jerome Brunet wrote:
>>
>>> On jeu. 24 sept. 2026 at 09:27, Lee Jones <lee@kernel.org> wrote:
>>> 
>>> > On Thu, 10 Sep 2026, Jerome Brunet wrote:
>>> >
>>> >> Apparently this device never really supported i2c instantiation via
>>> >> sysfs, because the driver does not even look at the i2c device data,
>>> >> which are not set. It would only probe if the device matched through DT.
>>> >> 
>>> >> Fix that for correctness, even-though it is probably useless.
>>> >> Add the missing AXP323 while at it.
>>> >> 
>>> >> Reported-by: Sashiko <sashiko-bot@kernel.org>
>>> >> Closes: https://lore.kernel.org/r/20260717090209.2A09B1F000E9@smtp.kernel.org
>>> >> Fixes: 41751b033aaa ("mfd: axp20x-i2c: Add i2c-ids to fix module auto-loading")
>>> >> Acked-by: Chen-Yu Tsai <wens@kernel.org>
>>> >> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>>> >> ---
>>> >>  drivers/mfd/axp20x-i2c.c   | 24 +++++++++++++-----------
>>> >>  drivers/mfd/axp20x-rsb.c   |  1 +
>>> >>  drivers/mfd/axp20x.c       |  1 -
>>> >>  include/linux/mfd/axp20x.h |  3 +--
>>> >>  4 files changed, 15 insertions(+), 14 deletions(-)
>>> >> 
>>> >> diff --git a/drivers/mfd/axp20x-i2c.c b/drivers/mfd/axp20x-i2c.c
>>> >> index 5c93136f977e..a76bec5604c4 100644
>>> >> --- a/drivers/mfd/axp20x-i2c.c
>>> >> +++ b/drivers/mfd/axp20x-i2c.c
>>> >> @@ -35,6 +35,7 @@ static int axp20x_i2c_probe(struct i2c_client *i2c)
>>> >>  	axp20x->irq = i2c->irq;
>>> >>  	dev_set_drvdata(axp20x->dev, axp20x);
>>> >>  
>>> >> +	axp20x->variant = (kernel_ulong_t)i2c_get_match_data(i2c);
>>> >
>]>> > device_get_match_data() is bus agnostic and should still work from the
>>> > core driver.  What's the purpose of splitting it out and adding
>>> > additional call-sites?
>>> 
>>> device_get_match_data() works when the data comes through that path,
>>> which is generally the case.
>>> 
>>> i2c_get_match_data() calls device_get_match_data() then fallback to the
>>> i2c_device_ids. It covers the instanciation from sysfs mainly, not
>>> something usual.
>>> 
>>> As explained in the description, this changes plugs a hole identified by
>>> sashiko that technically exists but I highly doubt anyone will
>>> instanciate the PMIC through that interface. Those things do not really
>>> come as breakout boards ... That being said, it is cheap to fix.
>>
>> I'm confused.
>>
>> We already call device_get_match_data() in axp20x_match_device().
>
> Not anymore with this change. It is the point.
>
>>
>> So if you populate .driver_data in axp20x_i2c_id[], you should be
>> able to drop these changes altogether, no?
>
> device_get_match_data() only goes through the DT tables.
> Not the i2c_driver.id_table which is purpose here.
>
> My understanding is that if you instanciate the device
> through sysfs (which nobody does for these devices) and you only call
> device_get_match_data(), you will get NULL because there is no fwnode
> associated with the device, which in this case silently translate to
> AXP152_ID.
>
> device_get_match_data() does not go through the i2c_driver.id_table.
> Only the i2c code does, with i2c_get_match_data() and after trying with
> device_get_match_data() internally, which is exactly what we want.
>
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/i2c/i2c-core-base.c?h=v7.3-rc7#n121
>
> As noted earlier, this a problem reported by sashiko that is real but
> extremely unlikely to show up in real world. I'd happy to drop
> the change if you don't want it. It is not need to support the axp318.
>

Hi Lee,

How could progress on this ? I genuinely do not understand the problem.
This change is fixing a sashiko reported issue, in the appropriate
manner I think. device_get_match_data() just does not care for i2c
.id_table so i2c_get_match_data() is needed.

At the same time, what we really care for to progress on the Allwinner
a733 HW support is the rest of the series. So if this bothers you,
I'm happy to re-submit without this fix. Please let me know.

Cheers
Jerome
