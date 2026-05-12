Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A65903DC87F
	for <linux-sunxi@lists.linux.dev>; Tue, 12 May 2026 17:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778607431; cv=none; b=YFpBxsw1HJEKoEdL/8ZrvUqCMh1a+yt8MnjzLwbzghbUjG7ZROX/3QC34RiRyh9+vIHG8VnzSbeeaQ7fMLcAoZMvRb3szTBagDJ+qr3XE/NgS4IE3Ya4g9dsBUNqBTy33dbJHVd1RwP9WiOh9X1kjJciaUZo4B88HZBFYm7tR1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778607431; c=relaxed/simple;
	bh=kuFEmEjpGUrLlsQBZh18bAqK/lRyvUYMMiJ3XbItuA8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Soa7kOSLyXEd+DGS5kQUYSRnG6dsl9Qc9H9lHtHVBdQdlL2Cn34McDot+kn34qSjk8dyP/Wjj3H1Mq1NAMKnMxbj4MB64m9akHAIetppzFtbMUU4/5dZsKBLJNok1MV34g63wJnPIT4s93JzfD6Y2pfgdh/cmJCX81lpN+B8M3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A4XOMZ0o; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A4XOMZ0o"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4890d945eb4so38970585e9.0
        for <linux-sunxi@lists.linux.dev>; Tue, 12 May 2026 10:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778607428; x=1779212228; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YUFfTVnu1jI7he9F6ikRzcaMbvnkj6ojyItrG0mbID8=;
        b=A4XOMZ0o/Y+2maDD7lT7ZOnbvfUr46k2BncUSMJcn4wWFJNnI0PNVNKu1vPKf9femX
         4Q87xAkl/I2T3WQzybJ8UJf9gAfMQap4+cBmjwy3+E2PBlph1DgTN6rRaA3xZSWkQdCI
         dVtM3PpN+HEZ39IZlz/1Isu/8Vqs/4uEgNX+4WG64RTkNRhnaGuoI1lZVLVuyaCBXtDZ
         TI5SSooUgwiI4EtazQTqX4C1IDE/pKT+kwOIq/yZupWMkrWNkThgIi3IUma+tHTDMxpr
         3t+BhWY5p191vPrPVLV6t9+MoEnlGrpuS0VZYm80ahrXqnYD+hxhQwXCYtNVEXyelOGl
         FjPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778607428; x=1779212228;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YUFfTVnu1jI7he9F6ikRzcaMbvnkj6ojyItrG0mbID8=;
        b=HkgiRvHPDFlzjm0mUYmeei9VB+cQ9/TVlgo5IHY9krXEteBqORZbusxY0LxKJAi32B
         xwTORksjZtZO1+b5TWhImtsknL5teuKo1Z/kW/UPAiFkgz1UtbnJEvkJigLotv5TfBrn
         gmhRlrjGNkBIYtoKrgJpT3U5HXACDNOomx3JckU4+2u9PuNE2v2twgdHK+b3OXmkAs3K
         Pkl03TU7Vt5J54qfPtEvb1jbwkRHtHeJosbVg09WRu3/u62zLYs80NEkvmJ6Ae14pU8V
         MKqU9cUziuG/OytCiLQFBpOboQ4I6huxpS8oi8kYZPR2u3rDmXUskto4iNjwxYFfubRC
         KQ0Q==
X-Forwarded-Encrypted: i=1; AFNElJ8hfoVuM+QdMsGkP8YwJEjg7wt8zevXZFDWZYhzLKW1OwuaIR3mVXpxsDDnIreUBuMcKJ3yCvPpQ9JXlQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YykG04ozkkgKXTVbziAJbG1QuE/nM8ll9gUwlsud2kxDMkDnbHL
	VbN6LzPyw0hYxrZcmGF9yaqqxSHLwRVRyzWzfZdrSOAmKvqH+wabwuk1
X-Gm-Gg: Acq92OF4VTy0AWF6jErB45jNiGqxg3LmJPDW9ynoDsHNtkubQ45PojP1RUr8/+LzLeQ
	cXAuEEaj61MWI4Sosfeg/x9ckgobGj2tpPIDqZ3BgF0hj06m05bA5wr7xBiWtGk6P8fBEMG5qWa
	4CXNIroZM1pODMWruj2iaOW/FEBmz+zNI2V0YTRzmwX8y0Bed+WvtkknftBIwXbktmNIFpGOwwk
	2B28C/oaNmPsKk2UnjZ+11Y5Co2NoFBHeK/tpPNiwjf0uAmWsJp5mc3IxiZby9fbBBvrU29kGDB
	bGDcVePFSHjFyyR/37skApSapy5odK3Fu+FseUWElcyUn58jLlM3xBjMFDCUNGRW8ne9pny2mT2
	HrPW6h+ondwjJkmyWnqJVeoGCCLibHS0GBQ1S9O030/h84qWYRmeqql69iaFfTh70ErTEA5Yf/3
	fuNOcTR9DmPA3RvqvEpLGZgJm5HOEjpnIhgqQa01vCmsuBpDQVZobmZ/K8yPtqjb17vddU5JCNR
	AX9qqwwkjCP+eWNpw==
X-Received: by 2002:a05:600c:3b99:b0:486:faa8:9e4 with SMTP id 5b1f17b1804b1-48e906c4525mr56038705e9.12.1778607427994;
        Tue, 12 May 2026 10:37:07 -0700 (PDT)
Received: from jernej-laptop.localnet (46-150-62-216.dynamic.telemach.net. [46.150.62.216])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fc8d16bbdsm10829585e9.1.2026.05.12.10.37.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 10:37:07 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: u-boot@lists.denx.de, Andre Przywara <andre.przywara@arm.com>
Cc: Tom Rini <trini@konsulko.com>, Chen-Yu Tsai <wens@kernel.org>,
 Paul Kocialkowski <contact@paulk.fr>, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 2/5] sunxi: spl: spi: Clean up SPI0 pinmux setting
Date: Tue, 12 May 2026 19:37:06 +0200
Message-ID: <hxKgmanzT_ibK5FkulnCYg@gmail.com>
In-Reply-To: <20260511213713.15943-3-andre.przywara@arm.com>
References:
 <20260511213713.15943-1-andre.przywara@arm.com>
 <20260511213713.15943-3-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne ponedeljek, 11. maj 2026 ob 23:37:10 Srednjeevropski poletni =C4=8Das j=
e Andre Przywara napisal(a):
> The function to set the pinmux for the Port C SPI0 pins was looking more
> like a logic puzzle from a magazine than something that readers could
> understand and extend.
>=20
> Replace the convoluted pinmux setup, grouped by pin, with a simple array
> of the four pins involved, and just initialise this array at build time,
> based on the selected SoC.
>=20
> This makes it easy to see which pins are needed, and even easier to exten=
d.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  arch/arm/mach-sunxi/spl_spi_sunxi.c | 43 ++++++++++++-----------------
>  1 file changed, 18 insertions(+), 25 deletions(-)
>=20
> diff --git a/arch/arm/mach-sunxi/spl_spi_sunxi.c b/arch/arm/mach-sunxi/sp=
l_spi_sunxi.c
> index 5f72e809952..905a7db2a77 100644
> --- a/arch/arm/mach-sunxi/spl_spi_sunxi.c
> +++ b/arch/arm/mach-sunxi/spl_spi_sunxi.c
> @@ -105,35 +105,28 @@
> =20
>  /*
>   * Allwinner A10/A20 SoCs were using pins PC0,PC1,PC2,PC23 for booting
> - * from SPI Flash, everything else is using pins PC0,PC1,PC2,PC3.
> - * The H6 uses PC0, PC2, PC3, PC5, the H616 PC0, PC2, PC3, PC4.
> + * from SPI Flash, later SoCs are using pins PC0,PC1,PC2,PC3.
> + * Newer SoCs are all over the place.
>   */
>  static void spi0_pinmux_setup(unsigned int pin_function)
>  {
> -	/* All chips use PC2. And all chips use PC0, except R528/T113 */
> -	if (!IS_ENABLED(CONFIG_MACH_SUN8I_R528))
> -		sunxi_gpio_set_cfgpin(SUNXI_GPC(0), pin_function);
> -
> -	sunxi_gpio_set_cfgpin(SUNXI_GPC(2), pin_function);
> +	const u16 spi0_pc_pins[4] =3D {
> +#if IS_ENABLED(CONFIG_MACH_SUN8I_R528)
> +		SUNXI_GPC(2), SUNXI_GPC(3), SUNXI_GPC(4), SUNXI_GPC(5)
> +#elif IS_ENABLED(CONFIG_MACH_SUN50I_H616)
> +		SUNXI_GPC(0), SUNXI_GPC(2), SUNXI_GPC(3), SUNXI_GPC(4)
> +#elif IS_ENABLED(CONFIG_MACH_SUN50I_H6)
> +		SUNXI_GPC(0), SUNXI_GPC(2), SUNXI_GPC(3), SUNXI_GPC(5)
> +#elif IS_ENABLED(CONFIG_MACH_SUN4I) || IS_ENABLED(CONFIG_MACH_SUN5I) || \

Are you sure about CONFIG_MACH_SUN5I? It seems to me that it should fall to=
 PC3 pin.
Also A13 datasheet confirms it.

Best regards,
Jernej

> +      IS_ENABLED(CONFIG_MACH_SUN7I) || IS_ENABLED(CONFIG_MACH_SUN8I_R40)
> +		SUNXI_GPC(0), SUNXI_GPC(1), SUNXI_GPC(2), SUNXI_GPC(23)
> +#else
> +		SUNXI_GPC(0), SUNXI_GPC(1), SUNXI_GPC(2), SUNXI_GPC(3)
> +#endif
> +	};
> =20
> -	/* All chips except H6/H616/R528/T113 use PC1. */
> -	if (!IS_ENABLED(CONFIG_SUN50I_GEN_H6) &&
> -	    !IS_ENABLED(CONFIG_MACH_SUN8I_R528))
> -		sunxi_gpio_set_cfgpin(SUNXI_GPC(1), pin_function);
> -
> -	if (IS_ENABLED(CONFIG_MACH_SUN50I_H6) ||
> -	    IS_ENABLED(CONFIG_MACH_SUN8I_R528))
> -		sunxi_gpio_set_cfgpin(SUNXI_GPC(5), pin_function);
> -	if (IS_ENABLED(CONFIG_MACH_SUN50I_H616) ||
> -	    IS_ENABLED(CONFIG_MACH_SUN8I_R528))
> -		sunxi_gpio_set_cfgpin(SUNXI_GPC(4), pin_function);
> -
> -	/* Older generations use PC23 for CS, newer ones use PC3. */
> -	if (IS_ENABLED(CONFIG_MACH_SUN4I) || IS_ENABLED(CONFIG_MACH_SUN7I) ||
> -	    IS_ENABLED(CONFIG_MACH_SUN8I_R40))
> -		sunxi_gpio_set_cfgpin(SUNXI_GPC(23), pin_function);
> -	else
> -		sunxi_gpio_set_cfgpin(SUNXI_GPC(3), pin_function);
> +	for (int i =3D 0; i < 4; i++)
> +		sunxi_gpio_set_cfgpin(spi0_pc_pins[i], pin_function);
>  }
> =20
>  static bool is_sun6i_gen_spi(void)
>=20




