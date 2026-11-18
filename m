Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795026827;
	b=LuUhQylnAE5uM4OLIzbhEjy5kKNNqYs0lOgLwqwSxfszjQxF7cuQLRy1acFVr6uVxu8H
	 qBCVnxqSgWCT0pkrlMHC5uvhPlRPVoXfYiAmrXJ/IK3RaDeQcZACW7Ew8FaojB4BCaKy6
	 +qzIyu/YHrorZ2bVYgDdQyi6uTfHER83wvas2dw4CM/xOodC55vYvqAPkUA0xEN3Idv7L
	 579Mw+su4PoiRp+0/nq9/qcWl0IlCkw0Oqs3+t1Ds+iUk9o74IOlsV2rAySTW6gAzCqBc
	 VMSo7E2g35TG5EeKN3OnT2neM5v4jJI63QZVU+cLWNXMcgYoJC23CcHcEVlt1H+e54g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795026827;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=P/YCoMP/9FT1ykUcsd21vzGLwiDJBDzH9u2nYG1nU6w=;
	b=1tSLH290H1PueuVMPP5sBl1Z0pgPi/FwtENsGfaVEwerHmzKXZYnOtG+RRnCjYybeXA2
	 7Dmcx5LlHVIHByJiSl2rvty29VQY53NEBBnNedSRuwpyq8MMl3zXbQQSqM5yYZYEQIRMf
	 4QEzL2G3SA0ZDmVS0hLb+/92yVsgG5ocLV9gJjtul4na6UZ+ulQoarApHtqCYkjInjA9g
	 aBOOssB0qAPfn8JUQma6gbZ+GOKkyFG8LWr7oxw6LgUqRjqnvLhM052HP6+GJHvpjOAiD
	 49hQ/VJnOw3ZTxV4h1kH3Ib80uswABFXcWyMrKsTpFk5tmRB/Es5AHZ4zH0LN6fszQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LNHhiY4v;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FA21606A331;
	Wed, 18 Nov 2026 18:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LNHhiY4v
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC99D1F000CB;
	Wed, 18 Nov 2026 18:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795026826;
	bh=P/YCoMP/9FT1ykUcsd21vzGLwiDJBDzH9u2nYG1nU6w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LNHhiY4vwIsJI6fmpylX0eXCxvEuKKvvPaFvQODi7o0zakHtQMbheWJPlEfJ2MeQd
	 26JyAhCrZYr6agIm3RA06OEK7Fweq9rzySEVuHyPgD9fn43FZVAcS9the+5jd1Fvib
	 5dBJi2udP0osSq//doOsk0Ekge0G/T06LfmSmTTK5w51vcY102WXoiTZDG4diVGv9M
	 usA2fBPQtqvpG8JFjEyfaYluExZ+XSC8o51qcILMxvjxxANgOGUFsF4+sfM1xbd4S+
	 2opIP+uJM9VWW9PI2bYEbq7wJM7fHok4AOMuCia2TDoHh4nO0pwQkibUmzlL2rA65x
	 CNQuRIDAwmKjw==
Date: Wed, 18 Nov 2026 18:33:41 +0000
From: Lee Jones <lee@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Andre Przywara <andre.przywara@arm.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Hans de Goede <hansg@kernel.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	mfd@lists.linux.dev, linux-sunxi@lists.linux.dev,
	Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH v8 2/5] mfd: axp20x-i2c: Fix i2c instantiation
Message-ID: <20261118183341.GI98456@joneslee-macbookpro.roam.internal>
References: <20260910-axp318-regulator-v8-0-e906a61a7f3d@baylibre.com>
 <20260910-axp318-regulator-v8-2-e906a61a7f3d@baylibre.com>
 <20260924082705.GO3864833@google.com>
 <1jy0cq94na.fsf@starbuckisacylon.baylibre.com>
 <20261014104801.GI199624@google.com>
 <1ja4ogfp5l.fsf@starbuckisacylon.baylibre.com>
 <1jh5he2o9z.fsf@starbuckisacylon.baylibre.com>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1jh5he2o9z.fsf@starbuckisacylon.baylibre.com>

On Wed, 18 Nov 2026, Jerome Brunet wrote:

> On mer. 14 oct. 2026 at 14:21, Jerome Brunet <jbrunet@baylibre.com> wrote:
> 
> > On mer. 14 oct. 2026 at 11:48, Lee Jones <lee@kernel.org> wrote:
> >
> >> Note:
> >>
> >> --- checkpatch.pl (3 issues) ---
> >> Line 2: WARNING: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
> >> Line 3: ERROR: Invalid commit separator - some tools may have problems applying this
> >> ----------------------------------
> >
> > I've checked before sending and checked again now, I don't have those
> > warning. I don't see anything long on line 2 or a separator near line 3.
> >
> > Any specific way I should run the tool reproduce the problem if there is
> > one ?
> >
> >>
> >> On Thu, 24 Sep 2026, Jerome Brunet wrote:
> >>
> >>> On jeu. 24 sept. 2026 at 09:27, Lee Jones <lee@kernel.org> wrote:
> >>> 
> >>> > On Thu, 10 Sep 2026, Jerome Brunet wrote:
> >>> >
> >>> >> Apparently this device never really supported i2c instantiation via
> >>> >> sysfs, because the driver does not even look at the i2c device data,
> >>> >> which are not set. It would only probe if the device matched through DT.
> >>> >> 
> >>> >> Fix that for correctness, even-though it is probably useless.
> >>> >> Add the missing AXP323 while at it.
> >>> >> 
> >>> >> Reported-by: Sashiko <sashiko-bot@kernel.org>
> >>> >> Closes: https://lore.kernel.org/r/20260717090209.2A09B1F000E9@smtp.kernel.org
> >>> >> Fixes: 41751b033aaa ("mfd: axp20x-i2c: Add i2c-ids to fix module auto-loading")
> >>> >> Acked-by: Chen-Yu Tsai <wens@kernel.org>
> >>> >> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> >>> >> ---
> >>> >>  drivers/mfd/axp20x-i2c.c   | 24 +++++++++++++-----------
> >>> >>  drivers/mfd/axp20x-rsb.c   |  1 +
> >>> >>  drivers/mfd/axp20x.c       |  1 -
> >>> >>  include/linux/mfd/axp20x.h |  3 +--
> >>> >>  4 files changed, 15 insertions(+), 14 deletions(-)
> >>> >> 
> >>> >> diff --git a/drivers/mfd/axp20x-i2c.c b/drivers/mfd/axp20x-i2c.c
> >>> >> index 5c93136f977e..a76bec5604c4 100644
> >>> >> --- a/drivers/mfd/axp20x-i2c.c
> >>> >> +++ b/drivers/mfd/axp20x-i2c.c
> >>> >> @@ -35,6 +35,7 @@ static int axp20x_i2c_probe(struct i2c_client *i2c)
> >>> >>  	axp20x->irq = i2c->irq;
> >>> >>  	dev_set_drvdata(axp20x->dev, axp20x);
> >>> >>  
> >>> >> +	axp20x->variant = (kernel_ulong_t)i2c_get_match_data(i2c);
> >>> >
> >]>> > device_get_match_data() is bus agnostic and should still work from the
> >>> > core driver.  What's the purpose of splitting it out and adding
> >>> > additional call-sites?
> >>> 
> >>> device_get_match_data() works when the data comes through that path,
> >>> which is generally the case.
> >>> 
> >>> i2c_get_match_data() calls device_get_match_data() then fallback to the
> >>> i2c_device_ids. It covers the instanciation from sysfs mainly, not
> >>> something usual.
> >>> 
> >>> As explained in the description, this changes plugs a hole identified by
> >>> sashiko that technically exists but I highly doubt anyone will
> >>> instanciate the PMIC through that interface. Those things do not really
> >>> come as breakout boards ... That being said, it is cheap to fix.
> >>
> >> I'm confused.
> >>
> >> We already call device_get_match_data() in axp20x_match_device().
> >
> > Not anymore with this change. It is the point.
> >
> >>
> >> So if you populate .driver_data in axp20x_i2c_id[], you should be
> >> able to drop these changes altogether, no?
> >
> > device_get_match_data() only goes through the DT tables.
> > Not the i2c_driver.id_table which is purpose here.
> >
> > My understanding is that if you instanciate the device
> > through sysfs (which nobody does for these devices) and you only call
> > device_get_match_data(), you will get NULL because there is no fwnode
> > associated with the device, which in this case silently translate to
> > AXP152_ID.
> >
> > device_get_match_data() does not go through the i2c_driver.id_table.
> > Only the i2c code does, with i2c_get_match_data() and after trying with
> > device_get_match_data() internally, which is exactly what we want.
> >
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/i2c/i2c-core-base.c?h=v7.3-rc7#n121
> >
> > As noted earlier, this a problem reported by sashiko that is real but
> > extremely unlikely to show up in real world. I'd happy to drop
> > the change if you don't want it. It is not need to support the axp318.
> >
> 
> Hi Lee,
> 
> How could progress on this ? I genuinely do not understand the problem.
> This change is fixing a sashiko reported issue, in the appropriate
> manner I think. device_get_match_data() just does not care for i2c
> .id_table so i2c_get_match_data() is needed.
> 
> At the same time, what we really care for to progress on the Allwinner
> a733 HW support is the rest of the series. So if this bothers you,
> I'm happy to re-submit without this fix. Please let me know.

It's okay.  If you're convinced, then so am I.

Were there any more comments?  Is another revision coming?

-- 
Lee Jones
