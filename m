Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794932250;
	b=tFSPkspnvuNCSquW/tdxCRc7djOhXgmC02c1i8dtg5DfAH3mTelmXwU1cIIz/M73N9Mb
	 dv8bs62b1njzY3uXeauh8WyHFn3CTnLRorDI2vINvnkU/UcN1v6O7GILiX/I2oEfSCzEi
	 o3bL1VUXeUp2gXiAhNRYRbLPdi6JZJPOR/JSC5YbjDeZZyTTFG1wDRvrdvxAJOP/AxECo
	 N7f8kAy7z+eeXw0whsnmc5CL+/50aXHtOfwnrkq2rbFz/XCmnyDO+l/eRNpvOsYtgkklo
	 DAJ4xQUTQo14BWL6nAprybhHT8kAaLCSVGL1K5058SYK0mhBklxI83lEgJwpinIDvfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794932250;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=CtUGM4qs3NyrmXicigtcW+0ZUHZL+8lLEGt7ogClzmk=;
	b=sK2ciFHOpk5mIEvZqVgUkisyabPEG9JDYAEyTLagogtfpCusCzIp+gQPzQc6dpZn2hOv
	 0S9tYS2jtW9PKAaUux3xalwD9PbHxXUjBlxlgagZgxWgwPWPdCEg1DOtM94d+CIsFkwAh
	 ArO4mPs1Xj76Y04ulK0pe13T1e7UhYizRTX6rKa2wecqN+iS0UDlk+B8eTY+mVmDMOhDL
	 3TZWM0INrCYlN8RSA7vSWaq6atrQA+n9QEccq3BfKxgU8E7PPzO9B8bXw/ZNO+67Gedxs
	 IBucdwPDplpR/lZbc1XrqKQngJxbyV6jIU1UVBvssqfI0/y62OW5th/RFwXpBjlXGkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Tc6M3jjS;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 484EC606A8B6
	for <linux-sunxi@lists.linux.dev>; Tue, 17 Nov 2026 16:17:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 484EC606A8B6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Tc6M3jjS
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so283005e9.3
        for <linux-sunxi@lists.linux.dev>; Tue, 17 Nov 2026 08:17:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794932247; x=1795537047; darn=lists.linux.dev;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CtUGM4qs3NyrmXicigtcW+0ZUHZL+8lLEGt7ogClzmk=;
        b=Tc6M3jjSXKtYeU6rVDakHpNn72RSy3j8wqQ48DofJOgFOQup5kDas23puqGPOtznW/
         GWeMnutMgnErZnFSolkppJZI7Ofv3ikQCJne47/9+1n9yhnP8WwYPsdQWD/CMcRZsZul
         3sfFv3kAzrUR5HSs96p5oqhPWJGmtc9RXSddIi0At+iL7hUaMxdbYAGZeZbT8vFjzzK4
         L0RaA22hBiP/H0FsgjrDze/UzLkTT2/kXFc4liB3VOkta2resrHldXQjOXOkDUWOGOxW
         kw15+9c/QC5oXI57lMR/gKtZX2L2PaBzT0xhYAdTQE5oz8yLC8B6BqoVNVCCttVjOr6Z
         gIIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794932248; x=1795537048;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CtUGM4qs3NyrmXicigtcW+0ZUHZL+8lLEGt7ogClzmk=;
        b=zhXW8UGoUViOv9aSEqF5o+pdw2cyxDsD/KGDxRG+SCCfAN3A4NbKs8IrwwKrNm1QrP
         xD7cs4ajUusFBpxa0qsscamaEKZmEAVSdmk5KSC9ZJPKSP2f3ZAfPy9b50nmMbuLQq4l
         S9FX6TolY+9RyYBPPyf7wIzT/bWpRBhDATRBv5BTOpILrpaFlLDcTxsSOUie08VtMzBA
         rIlRarpAAagogD0hbYlIAjruqmuR31rIPFhej8ADOMQINgQv4prEYxhzu+gzaWgeaekl
         ZiVSZFY/x2J+3nHm0dwboazSd47ZVqVyBpj6rBynSAVNeaa5F09CHW/5668IBmTZXK6e
         DSmA==
X-Forwarded-Encrypted: i=1; AL+hErFGqRDhBWgMtRDmcIchZjRpu2pRE6YN9LiiCCmOh7krB8BboaVSNFI9efQUtgSDGb6pNQZGa8v7+UPekA==@lists.linux.dev
X-Gm-Message-State: APuU4Z/Gvy7XePCW4e8a0tc666honZMPThyh+0lOqboGxkyalYrPtVZd
	BaIy3I6dNOnzoCbMa+dW3JaEfpKBOM9KNQoWWlFn/dNaagkvz568bMDF
X-Gm-Gg: AYBFou0J43+fOT2Gn3RAa3vqfO4V0RDY2it7yUEIlMaQexjkLA/h9gQgh5TrKqiNFsT
	mkVMujwGO2efIe3N9ylz7bwBM6dzwpFKxs+qzxWBc8kWojfqPQqkgZ8SDZmf+VeurVHu3WG7l7x
	M3rEKR3z3IXJs7kpDWgbPj5b6ge2ylWRciwOkK/R1W2LgXtdxHWgU23Z/QArL7es/+gxxAzZF+L
	qX5f2taZqBy4SX2gBnjqT/UxIrqsb++rbW45xEJlZahe2a501c3ZDeXAJPB86kZ70W8+80coZ42
	0tTq/adkKIrZea/N6zc/6gmmI0yBlg6fRzbyFXPqdnIjxMMhbC0O3IeXwGtvhDF/9f0pSEdwvip
	gtIBXyZ2ijTRz5RIexQKKHxrg6mCvGJZWPrFX6x3UG1vYo11LoDnf8zix6vgOJqLlk65w+vwARk
	Yu7EW7UumVD1UV4JK/MFo/LNde9cu0DQPziojMofguRXbUws7Ya7yczAuDKXqlujdCgL40p5EXl
	8daRQMlXzT4GW6fUGT7u8i8UeX6ZYf7y0m3Prgq2dqzTycybNASb7Oznm26lnashZ+Mi3eQ7kOn
	EA7bMMggMBIqdGZZh3qKlEOhQBBlPi3bZ1VlriHPns9tWex+cwQaTYWVngekJ4lIc4bcXQuaKQ9
	rNu8aFeMWx+fXNjUiB/NAXU4GM5hroBnLbwJqtcwmW8hOYODq/bJvYFXJIj8o31i6DzpW5UdAUD
	BfOvMpLRYGPwuleFTyapmR3zRKUXjS0WHj4tlCMwf8OPiSvmCWjOKwJMyoQYai3F1T9iDfAfWxv
	ZiqKCH1dg+WR7tVtG3pprpTZz3t/mOqXYEL7iYgWgdrXjUQh+oz5kBG4m/x
X-Received: by 2002:a05:600c:b50:b0:4bb:5c5c:8130 with SMTP id 5b1f17b1804b1-4bb5c5c8255mr198447365e9.5.1794932247376;
        Tue, 17 Nov 2026 08:17:27 -0800 (PST)
Received: from jernej-laptop.localnet (95-143-148-21.dynamic.telemach.net. [95.143.148.21])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb78344ddbsm82097905e9.0.2026.11.17.08.17.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 08:17:26 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Linus Walleij <linusw@kernel.org>, linux-sunxi@lists.linux.dev
Cc: Chen-Yu Tsai <wens@kernel.org>, Samuel Holland <samuel@sholland.org>,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 Yang Siyuan <hsyysy@163.com>
Subject:
 Re: [PATCH v3 RESEND] pinctrl: sunxi: request the per-bank supply optionally
Date: Tue, 17 Nov 2026 17:17:25 +0100
Message-ID: <uNcaWoiORlCb9uOBOQgmvw@gmail.com>
In-Reply-To: <20261117091944.12082-1-hsyysy@163.com>
References: <20261117091944.12082-1-hsyysy@163.com>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne torek, 17. november 2026 ob 10:19:44 Srednjeevropski standardni =C4=8Da=
s je Yang Siyuan napisal(a):
> The per-bank "vcc-pX" supplies are optional in the device tree: the
> binding documents them, but notes that many boards do not describe them.
> sunxi_pmx_request() uses regulator_get() anyway, so the regulator core
> falls back to a dummy regulator and warns for every bank that has no
> supply:
>=20
>   sun50i-h616-r-pinctrl 7022000.pinctrl: supply vcc-pl not found, using
>   dummy regulator
>=20
> The H616 R_PIO is such a controller, and its PL0/PL1 pins drive the
> R_I2C bus, so every H616 board hits the warning during boot.
>=20
> Use of_regulator_get_optional() instead.  A bank supply that is described
> in the device tree is still acquired and enabled, as it powers the
> physical VCC-Px rail, but one that is absent is skipped without a
> warning.
>=20
> The OF-only lookup matters here: regulator_get_optional() also falls back
> to a global regulator-name lookup.  If a regulator with the same name as
> an absent bank supply is registered later, a subsequent pin request in
> that bank could acquire it and start the per-bank refcount at one, after
> earlier pins in the bank had already been requested without a regulator.
> Freeing any of those pins would then disable the supply while other pins
> in the bank are still active.  Restricting the lookup to the pinctrl node
> makes an absent supply permanent; record that state so later pin requests
> do not retry the lookup.  The refcount therefore stays balanced.
>=20
> Signed-off-by: Yang Siyuan <hsyysy@163.com>
> ---
>=20
> Changes in v3:
> - Use of_regulator_get_optional() instead of regulator_get_optional().
>   The latter still performs a global regulator-name lookup, which can
>   bind an unrelated regulator that appears after some pins were already
>   requested and unbalance the per-bank refcount.
> - Remember that a bank has no supply so later pin requests skip the
>   lookup, and keep the existing no-regulator check in sunxi_pmx_free().

Remembering IMO isn't worth it. It complicates the code which runs only
at probe time.

Best regards,
Jernej

> - Link to v2: https://lore.kernel.org/linux-gpio/20261026152027.1417178-1=
=2Dhsyysy@163.com/
> - Link to v1: https://lore.kernel.org/linux-gpio/20261026144751.1392715-1=
=2Dhsyysy@163.com/
> ---
> ---
>  drivers/pinctrl/sunxi/pinctrl-sunxi.c | 29 +++++++++++++++++++++++++--
>  drivers/pinctrl/sunxi/pinctrl-sunxi.h |  1 +
>  2 files changed, 28 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunx=
i/pinctrl-sunxi.c
> index 70099052d..d2345a85a 100644
> --- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> @@ -913,23 +913,44 @@ static int sunxi_pmx_request(struct pinctrl_dev *pc=
tldev, unsigned offset)
>  					    PINS_PER_BANK;
>  	struct sunxi_pinctrl_regulator *s_reg =3D &pctl->regulators[bank_offset=
];
>  	struct regulator *reg =3D s_reg->regulator;
> +	struct device_node *np =3D dev_of_node(pctl->dev);
>  	char supply[16];
>  	int ret;
> =20
>  	if (WARN_ON_ONCE(bank_offset >=3D ARRAY_SIZE(pctl->regulators)))
>  		return -EINVAL;
> =20
> +	if (s_reg->supply_absent)
> +		return 0;
> +
>  	if (reg) {
>  		refcount_inc(&s_reg->refcount);
>  		return 0;
>  	}
> =20
> +	if (!np) {
> +		s_reg->supply_absent =3D true;
> +		return 0;
> +	}
> +
>  	snprintf(supply, sizeof(supply), "vcc-p%c", 'a' + bank);
> -	reg =3D regulator_get(pctl->dev, supply);
> -	if (IS_ERR(reg))
> +	/*
> +	 * Use the OF-only lookup: regulator_get_optional() would also match
> +	 * a same-named regulator from another device.  Such a regulator can
> +	 * appear after some pins in this bank have already been requested,
> +	 * which would unbalance the per-bank refcount.
> +	 */
> +	reg =3D of_regulator_get_optional(pctl->dev, np, supply);
> +	if (IS_ERR(reg)) {
> +		if (PTR_ERR(reg) =3D=3D -ENODEV) {
> +			s_reg->supply_absent =3D true;
> +			return 0;
> +		}
> +
>  		return dev_err_probe(pctl->dev, PTR_ERR(reg),
>  				     "Couldn't get bank P%c regulator\n",
>  				     'A' + bank);
> +	}
> =20
>  	ret =3D regulator_enable(reg);
>  	if (ret) {
> @@ -959,6 +980,10 @@ static int sunxi_pmx_free(struct pinctrl_dev *pctlde=
v, unsigned offset)
>  					    PINS_PER_BANK;
>  	struct sunxi_pinctrl_regulator *s_reg =3D &pctl->regulators[bank_offset=
];
> =20
> +	/* The per-bank supply is optional, so this bank may not have one. */
> +	if (!s_reg->regulator)
> +		return 0;
> +
>  	if (!refcount_dec_and_test(&s_reg->refcount))
>  		return 0;
> =20
> diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.h b/drivers/pinctrl/sunx=
i/pinctrl-sunxi.h
> index 8bd00c6ff..651249b23 100644
> --- a/drivers/pinctrl/sunxi/pinctrl-sunxi.h
> +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
> @@ -162,6 +162,7 @@ struct sunxi_pinctrl_group {
>  struct sunxi_pinctrl_regulator {
>  	struct regulator	*regulator;
>  	refcount_t		refcount;
> +	bool			supply_absent;
>  };
> =20
>  struct sunxi_pinctrl {
> base-commit: 091b06388b117fefdcb63336ac09956a4914b961
>=20




