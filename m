Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48ECC3C063F
	for <linux-sunxi@lists.linux.dev>; Sun,  2 Aug 2026 15:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785684277; cv=none; b=Ehm4Y8SFAzdRhmM8p1IRQMGuzN1KXOeSWh67H1g7x9ZA8+xGkr6bHGy0nf/TqxTQUBvixeYvwebzRVn62s5X9+1e+c6C4qUad1/G9FD2NQ5gZw2kaedo7rhZhTqSOVJur7KkI1cBzK2PmGWHJnZ0bEcrYLNPmidcF8uOee/n5dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785684277; c=relaxed/simple;
	bh=I3UgxVcwvhGVd0HTYTSEfKEsUIGC5xDKAhalzAq0A+A=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Chw4rpztepdQ0Uus0mjeheL3Lksro3VI47r+4JLNF9/3k7F/UJk3p5jXIqnFDVKOZ4UW8BpnM65ipHI2SL7vGWUTOrnbMZ8Hshqt2SjMUeZSag6k59j/vEsMYsZ4xoekfTrZViP+o3MzeUzfmMl/01qRFZX2mnZSGAPfHWxkLDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=TGbftCV1; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="TGbftCV1"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-47f59f25ec4so1027128f8f.2
        for <linux-sunxi@lists.linux.dev>; Sun, 02 Aug 2026 08:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1785684270; x=1786289070; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :user-agent:references:in-reply-to:subject:cc:to:from:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZIAs7BonL5OHtmcJK5pQoVXNAcT4bPKRZJcULhZO5Is=;
        b=TGbftCV15yxWzxjWaYXxA1hfG7kFELrVkUfVQUuY3wIacJn1GBEk5ASW2E+nSvk+UH
         7MqeMuGy7kTdJsx/h7i13BAB/1zfUAe8g/e7G1CV4+ux+2zq7GJvj+Fd4f9wh8s86XWo
         Rt0k79SmANQgyjeb/GSoCojxvJDn8u2N5YiEEO2wbIIyfrYdpz+PrLuVvf8LxXmB0xHn
         ggUBNW1T+d5EoBtq6YomsO3Z0fbHSkgyy/56/d+Rcuv8RcdPfVMvoWy/lesLD1c3h0Iu
         ajO79d4f4fFhBm5BQZPvkutS2t7u4sGvzbKqw99eAhspV025xa088SsWuxbTpAShyWxv
         vYLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785684270; x=1786289070;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :user-agent:references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZIAs7BonL5OHtmcJK5pQoVXNAcT4bPKRZJcULhZO5Is=;
        b=tV6l7gTV/fRZgzEY6aCEVDrTqKR5z/AwY2Ep4ZxXXG9xf/B8K+yXTfSAsLuq9IZtt7
         yTamlb4wTN4khpnw36krewpexPjRGVxZKmsWouyKrOobWvkrogTxW6MYTR86KBw/0X47
         JpQ3VsT9rEh2GDXHYVX8/RQHTybMJdk6zl3HsNmOvyEYg3YTUxusF3Xoefh7mNOuRp8Z
         phr3PcyUiXn04J4pL6C/hnhw/aQDnUViY01qXb/5N12dVs113oMHGuSPGXAnH2d0Raau
         6ryl/abPsGo8creNDjtevuM0Ui23vJyKt5LUEGmDCNSbaMm1zQlRX47SB3PRPWWLlWY3
         E5sA==
X-Forwarded-Encrypted: i=1; AHgh+RqOShUdjvaopMIq+/5/NQcpwpMr6ZBpaLGXTsTl3dSFL04yx3arZIqAlrAbxXD/QEN9gF2esWCU2qK88A==@lists.linux.dev
X-Gm-Message-State: AOJu0YyHuBx6ti03WBxiHXxim4XkJWDCrN4fUfbfv1uhySTcBpr6zO+N
	D8+OyS+Njm10rSbt5cSR4Xkb3Ix00u6CmBdaji3YYEZhW/z8Kcl2NeofRvDpeY229Ac=
X-Gm-Gg: AR+sD11cKOOTUzDZFaGveemhWgnLT4nCABlEPA6C27qNCmDWlffju+yuc6gTDq1KR0a
	dIUdh1OSfl22j6wenqpCtIaoMAAGugEliGGAaJTu3fywpEUMc3sMXAV5v7d9s/aQsI61o/bGWke
	Rno6O6Bg0c4mcCZ6MStbMZYbvZyzeFo8qPJkonklerPqp/QTXtSkrsoBTQFyY9KNZV4A0+TLTg6
	xdY2iXjzdGFZp22kOe6jPkJDQXcakELOPLVWheQx8LR+bd77f/M5AUtwgHLP/PXuoedgZbCs8SN
	qUIiVvuO0aaEmfQjGrxzq2eo0uqI7icgnKuqoxT11+48eH/2cL/8LLRERGaM+a/hh3bvR67mFsP
	kE9zZltDzEn5KToq0/790ATqZ/72tLjdpr0YcZ9JHRQRRjBGRCp31196aVxpsYGfRrUBM9UCzZ5
	ZPNhualBTb3nFdCmZAVyvEHN4R3OS14hROxP/wCtVaMnTb7NpaCw4xisRdw/4=
X-Received: by 2002:a05:6000:29d7:b0:47f:c3a0:eeb9 with SMTP id ffacd0b85a97d-47fd72a8e96mr11079018f8f.3.1785684269987;
        Sun, 02 Aug 2026 08:24:29 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:8f07:a4d0:36de:3713])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47fd45a1abfsm24042016f8f.37.2026.08.02.08.24.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 08:24:29 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: sashiko-bot@kernel.org
Cc: sashiko-reviews@lists.linux.dev,  conor+dt@kernel.org,
  devicetree@vger.kernel.org,  robh@kernel.org,
  linux-sunxi@lists.linux.dev
Subject: Re: [PATCH RFC/RFT 2/2] net: stmmac: Add support for Allwinner A733
 GMAC210
In-Reply-To: <20260801163100.639F21F00AC4@smtp.kernel.org>
	(sashiko-bot@kernel.org's message of "Sat, 01 Aug 2026 16:30:59
	+0000")
References: <20260731-allwinner-a733-gmac-support-v1-0-d0a8732bfa82@baylibre.com>
	<20260731-allwinner-a733-gmac-support-v1-2-d0a8732bfa82@baylibre.com>
	<20260801163100.639F21F00AC4@smtp.kernel.org>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Sun, 02 Aug 2026 17:24:27 +0200
Message-ID: <1jv79slf4k.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On sam. 01 ao=C3=BBt 2026 at 16:30, sashiko-bot@kernel.org wrote:
>
>> +	if (!plat->stmmac_rst || !plat->stmmac_ahb_rst) {
>> +		dev_err(dev, "missing required reset controls\n");
>> +		return ERR_PTR(-EINVAL);
>> +	}
>> +
>> +	/*
>> +	 * The configuration registers are inside the controller
>> +	 * reset domain, so the reset must happen before any write to them
>> +	 * and should not be done again by stmmac or the configuration will
>> +	 * be lost.
>> +	 */
>> +	ret =3D reset_control_assert(plat->stmmac_rst);
>> +	if (!ret)
>> +		ret =3D reset_control_deassert(plat->stmmac_rst);
>
> [Severity: High]
> Will this cause a bus hang when writing to the MMIO registers?
>

No it does not. I've checked.
Actually touching the ahb reset here has negative effect. stmmac does
not properly detect the link type then (GMII instead of RGMII)

> The code checks that plat->stmmac_ahb_rst is present earlier in this
> function, but only toggles the main mac reset here.=20
>
> When sun55i_gmac200_setup() later calls regmap_write(), accessing an IP
> block over the AHB bus while its AHB interface is still held in reset
> typically causes a synchronous external abort or bus hang.
>
>> +
>> +	if (ret) {
>> +		dev_err_probe(dev, ret, "device reset failed\n");
>
> [ ... ]
>
>>  static int sun55i_gmac200_setup(struct platform_device *pdev,
>>  				struct plat_stmmacenet_data *plat,
>>  				const struct sun55i_gmac_data *data)
>>  {
>
> [ ... ]
>
>> -	ret =3D regmap_write(regmap, SYSCON_REG, reg);
>> +	ret =3D regmap_write(regmap, data->offset, reg);
>>  	if (ret < 0)
>>  		return dev_err_probe(dev, ret, "Failed to write to syscon\n");
>>=20=20
>> +	plat->flags |=3D data->flags;
>> +	plat->host_dma_width =3D 32;
>> +
>>  	return 0;
>>  }
>
> [Severity: High]
> Are these custom hardware settings lost after a system suspend?
>
> The driver configures critical hardware properties like TX/RX delays and
> PHY interface modes in the MAC's internal glue configuration registers
> here, but does not appear to assign a plat->resume callback to the
> plat_stmmacenet_data structure.
>
> If the MAC loses power during suspend, won't these registers revert to
> their default states on resume, leaving the network broken because the
> generic stmmac_resume() has no way to invoke this glue logic?

Assuming there is an issue here, it would be a pre-existing one for this
driver, same as the sun55i-a523.

Let's not get ahead of ourselves. Support for this chip is still in the
very early phase. I don't think we have the means to test suspend
yet.

--=20
Jerome
