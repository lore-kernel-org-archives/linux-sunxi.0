Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C48C9476045
	for <linux-sunxi@lists.linux.dev>; Fri, 25 Sep 2026 08:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790325005; cv=none; b=gmeWqiBn90uX9qguh8UVygwr4MmMCQBEWvwX7A1tlkk5uo0HyqGylQuFfEZop5PGFfjolm9KwXIjDBpX2EyloUOH7Us2V1tJkJJ6l6ApdvuS51Kqcl6Cwr52tjOxi9RjrB6cxz7/a9WS0RXsKptIlavZWoaKbdK0D0Qr1Gvi50Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790325005; c=relaxed/simple;
	bh=7Yqn/9QKc0RPp7Ok8AjVITceRGKTpb605+kGQ1X0p+Y=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=hEv3m7enW11F86yh2ZHq0AeiGd+dk4ZbWD61+0mivfImYHpNTIkB0u/d4tugsnWcfOqyMfuxyIRVWXVE7jXdsGenthqYFnrpdUD/RkKLKZUTSZxdNS4qs1IFdzzeShHoAJznSHmp7dsdXg6lZeEmQHIVfEDiFbEwWhpdw0griqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Z0XXAegO; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="Z0XXAegO"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e7bcb94d3so4566155e9.2
        for <linux-sunxi@lists.linux.dev>; Fri, 25 Sep 2026 01:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790325002; x=1790929802; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vIupO2OT5b7vAUPs104S95g1bWYJYDx/3eWoPMfexsw=;
        b=Z0XXAegOe+92F4YoBECZAkxYL+OFYR7i4dzn2fsygmaROmYC7p228OxFXrebJ6INOn
         MCj0xvpqvdvSZdxxbqEDCQREdbk+eQ9Q0I+jjD/teGlQH+QUMLYn7+cWVq9+FZrHbW7l
         Nu5ubmqAyxrshojn1XwzDNrXI+XkF+weU6qEosK8hzAurFVdZLgpok1nHp+srsz/gw0w
         Y+xZP+u/XaAwf3otWGpO/soDxg7B3KHxjSv+DFDIssM7ziPGLHUqIPHOGJv2ypiRzvGs
         ZFkyCvcN5xY/BCjCVm8UPcBF5Id0ouG5pZMwFaY94qjL2NYRfC7TXAo09rkH4av98+V/
         q7Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790325002; x=1790929802;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vIupO2OT5b7vAUPs104S95g1bWYJYDx/3eWoPMfexsw=;
        b=up8e8BbYG7wpTXttn8bkQVgJutfYTGigp2J7ZlUhSpgcSNKutcMGfY1LDjAi08XhLg
         1BDX7FZayAmI9zj0fOP2w0dHH7a+l2JjfhK+q+vTXb/SwQHX1uKch5xQvbXGBLpzGI+Z
         xH9eVCJJZcJlW4779zfVQrwXm/5xE449kev88rK3KgK7EpBs1usarXQ1St3l2IuUpqzw
         5VgqMlXnEmRmQSpIvTwR8LpAaQf2Hbw2gOwVLeKgxBjlCd5vrtwh6SDBfj4m+21QcuEB
         TQDB4J5flHAgcV6f3Gz2yz+D+azmMT+HYmdiwgJChFArGKBeRHGgW2wjs0pGooJb9UWW
         DrVQ==
X-Forwarded-Encrypted: i=1; AKwUvBwnA/XVbrpeCQzfMqEqW1x5OIVi0b5BcCdDAuJq1F4N6tMAuqZY2o4mv2qpRiP9u8ug25ClSPEV3s3s/g==@lists.linux.dev
X-Gm-Message-State: AFuF++mVFf9RETr5cog47eXUHurE67UMcUZxUvSNEqQRcieEp7AV0AIu
	PThCn91jsiS7i17cFZydbXFMvgygbzBYgxvgjyxb97QP9Agr521lmuRD6eFogO0Ylh4=
X-Gm-Gg: AYBFou3eAxqbyfxtnPDlDq9pHH5e6zwGMnNFNZvxB4xw2O8uA8Q9w0NPvnfZLuCYNTV
	ulxzgLD1sO6m3V7luKqauQdvG0C+UhSzM5lwzXpTY5HC3MpGGpH9/9ANmPzqUx2NMD9j1b0/jpH
	IeQ3D3pj7XSBj+qO18Z2Zkzx9Ht/3eYISSj2566KtEdQkaBfwpNE89qd3WZgTVRx3cQgbpX0cGN
	6r3OGdsvUEOjmTK4X5AsdcCw5vPTQTbUbtjol47cTFs8FPUoHc/fMYk8ZLF9+05mcJTjWyidyXr
	YoJAC1pj6re8Iwf1ZwVI0ctyjTpJ+uWCqWRz8UXNmYBlZ1x4xTz8diQa0x79OqxjVxrS/pzNGFX
	EIkNsATW5l+dRbSR0lbLHIElxV7hVoDTUJ8QzkT6WWeK/mNpKDBt2tiPXe9rwd6SG83yMUH84sR
	/x8J3QtxDPY2aWDqtuT8g/Xv4KPPSxouwmOsIZ36KwLf8oeZLVqvwld/bcKF8r5tpPckSiDzmN0
	Kr5mGkkVrmMOkcwEE4=
X-Received: by 2002:a05:600c:3b02:b0:49e:73d3:78ab with SMTP id 5b1f17b1804b1-49fe647dd30mr94864315e9.0.1790325001475;
        Fri, 25 Sep 2026 01:30:01 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ff069d071sm50123615e9.5.2026.09.25.01.30.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 01:30:00 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, linux-sunxi@lists.linux.dev,
 devicetree@vger.kernel.org
Subject: Re: [PATCH net-next v3 2/5] net: stmmac: sun55i: Add per-compatible
 match data
In-Reply-To: <20260924204842.9457B1F00893@smtp.kernel.org>
References: <20260923-allwinner-a733-gmac-support-v3-0-15735155a789@baylibre.com>
 <20260923-allwinner-a733-gmac-support-v3-2-15735155a789@baylibre.com>
 <20260924204842.9457B1F00893@smtp.kernel.org>
Date: Fri, 25 Sep 2026 10:30:00 +0200
Message-ID: <1jpky191iv.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On jeu. 24 sept. 2026 at 20:48, sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Low] net: stmmac: sun55i: sun55i_gmac pointer is lost after probe
> --
>
> commit 96a080b2a3499368db013319e188847cee61183d
> Author: Jerome Brunet <jbrunet@baylibre.com>
>
> net: stmmac: sun55i: Add per-compatible match data
>
> The A733 GMAC210 glue registers are in a dedicated MMIO region of the
> controller rather than in a syscon. This commit adds per-compatible match
> data holding the glue resource init callback, the stmmac flags, and the
> glue register offset.
>
>> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun55i.c b/driver=
s/net/ethernet/stmicro/stmmac/dwmac-sun55i.c
>> index 862df173d963f..c4df532850074 100644
>> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun55i.c
>> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun55i.c
>
> [ ... ]
>
>> @@ -107,22 +128,34 @@ static int sun55i_gmac200_probe(struct platform_de=
vice *pdev)
>>  	struct plat_stmmacenet_data *plat_dat;
>>  	struct stmmac_resources stmmac_res;
>>  	struct device *dev =3D &pdev->dev;
>> +	struct sun55i_gmac *gmac;
>>  	struct clk *clk;
>>  	int ret;
>>=20=20
>> +	gmac =3D devm_kzalloc(dev, sizeof(*gmac), GFP_KERNEL);
>> +	if (!gmac)
>> +		return -ENOMEM;
>> +
>
> [ ... ]
>
>> @@ -138,8 +171,15 @@ static int sun55i_gmac200_probe(struct platform_dev=
ice *pdev)
>>  	if (ret)
>>  		return dev_err_probe(dev, ret, "Failed to get or enable PHY supply\n"=
);
>>=20=20
>>  	return devm_stmmac_pltfr_probe(pdev, plat_dat, &stmmac_res);
>>  }
>
> [Severity: Low]
> Does this code intentionally discard the gmac pointer after probe?
>
> The sun55i_gmac structure is dynamically allocated via devm_kzalloc(), but
> it does not appear to be saved (for example, to plat_dat->bsp_priv) before
> sun55i_gmac200_probe() returns.
>
> If the structure is only intended for use during initialization, could it=
 be
> allocated on the stack to prevent an unnecessary heap allocation that
> persists for the lifetime of the device? Alternatively, if it is meant to
> hold state (like the regmap) for future callbacks, does the pointer need =
to
> be saved here?

Yeah, At one point I was thinking of setting stmmac bsp_priv to prepare
for a possible suspend/resume support later on. Eventually it will be neces=
sary.

I could do the stack option or keep it that way and set bsp_priv.
I don't mind one way or they other. If someone as a preference, please
let me know.

>
> --=20
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923-allwinne=
r-a733-gmac-support-v3-0-15735155a789@baylibre.com?part=3D2

--=20
Jerome
