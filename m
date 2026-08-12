Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6BF42F8E8F
	for <linux-sunxi@lists.linux.dev>; Wed, 12 Aug 2026 12:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786538093; cv=none; b=Mg1SgSAe4a+WTErtIr0y9FZ2howAgJnZZee0EcOjAmUZpUVvJf91AMG5bxGKIgBLLR2QtXJ8PwA2Sn3L9c66Qh2tgX46NtsHc1k5nSIDOkg98cwzbOUm+hDC+eLxkrUj/O2vN2x3uoR9NOI9tpNwOI2WBfaoD6JNLgCEa64/wHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786538093; c=relaxed/simple;
	bh=GvqjPuOatX1n7HIDjqumEwldU4flOfQ+KYt3zlvSrWg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=H0nZQMRaAMEq1ckDTb48Jn94Qa3A2/mUiyWw9FmfGNpfBr2JCjijhijfXaPQzxGBq4Cu2U5yXLHM6YDhoi2JiPheiF544Fw+Lpgo8efQ+WSvuOaqkoztg7E4HX7NXGqnYSGbK8GcJJCikZ/KHlw0LH2X31cQptvtzE+kf0iRAeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W7HhLUCX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W7HhLUCX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EEEA1F000E9;
	Wed, 12 Aug 2026 12:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786538092;
	bh=m8T0wYgib3bSnmodII2RPl+KkqZtQUYV/6Z7JBPmC5k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=W7HhLUCXETwGYLmdN1yMdyXgd10iZpT7RAemhyb+2tcbUxpcBeJvDy5jslAWyMLm3
	 2Ed5IcdCO+qVcukA9juwiEEyVm4RnVdGn5+uayGY4KB/ecH+KW6Ssqgf8bl2FrWNNt
	 uaYOKTI0Sj47DiQRRm4JgNDj5LgM5il2qK6EurKOFN+T+ZkYzvPN3qfxSF8n4psfut
	 Z+QyRcb6w6JnTuU1G7fNsUSAbEUG2goodHorXDC0+oT8+Glpj34rQoSYTgAglego1Z
	 bb1Ka5gpHsZuqHNHHsSVcVmyMN3z6YE8baGm22y+OtGxcqBAn6xqDuZcF6r71SB7in
	 D7G8Iw7vJDkjw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] pinctrl: sunxi: keep a shadow copy of the data register
 output latches
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ilya Titov" <ilya.titov@wirenboard.com>
Cc: linux-sunxi@lists.linux.dev
In-Reply-To: <20260812120114.32501-1-ilya.titov@wirenboard.com>
References: <20260812120114.32501-1-ilya.titov@wirenboard.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 12 Aug 2026 12:34:51 +0000
Message-Id: <20260812123452.1EEEA1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Incorrect calculation of `nbanks` leads to an undersized `dat_shad=
ow` array if `last_pin` is an exact multiple of 32 (or 0 relative to `pin_b=
ase`), causing heap out-of-bounds accesses.
--

--- Patch [1]: [PATCH] pinctrl: sunxi: keep a shadow copy of the data regis=
ter output latches ---
commit 54fd1ee0b54b09d32ab5cbe77eb38c0f817f60a0
Author: Ilya Titov <ilya.titov@wirenboard.com>

pinctrl: sunxi: keep a shadow copy of the data register output latches

This patch introduces a shadow copy of the data registers to avoid corrupti=
ng
output latches on input-muxed pins during read-modify-write operations. The
shadow copy is allocated and seeded at probe time.

> diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunx=
i/pinctrl-sunxi.c
> index 25489beeb3125..3cf5cd8ed9914 100644
> --- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
[ ... ]
> @@ -1610,6 +1633,37 @@ int sunxi_pinctrl_init_with_flags(struct platform_=
device *pdev,
>  	if (!pctl->irq_array)
>  		return -ENOMEM;
> =20
> +	/*
> +	 * The bus clock has to be enabled before the pinctrl device
> +	 * registers, as the pin hogs claimed from there access registers.
> +	 */
> +	ret =3D of_clk_get_parent_count(node);
> +	clk =3D devm_clk_get_enabled(&pdev->dev, ret =3D=3D 1 ? NULL : "apb");
> +	if (IS_ERR(clk))
> +		return PTR_ERR(clk);
> +
> +	/*
> +	 * Seed the output latch shadow from the hardware so pins the
> +	 * bootloader left in output mode keep their state; see
> +	 * sunxi_pinctrl_gpio_set() for why a shadow is needed.  This must
> +	 * happen before the pinctrl device registers, as pin hogs can mux
> +	 * pins to gpio_out and thereby update the shadow.
> +	 */
> +	last_pin =3D pctl->desc->pins[pctl->desc->npins - 1].pin.number;
> +	nbanks =3D (round_up(last_pin, PINS_PER_BANK) - pctl->desc->pin_base) /
> +		 PINS_PER_BANK;
> +	pctl->dat_shadow =3D devm_kcalloc(&pdev->dev, nbanks,
> +					sizeof(*pctl->dat_shadow), GFP_KERNEL);

[Severity: High]
Will this nbanks calculation result in an undersized dat_shadow array if
last_pin is an exact multiple of PINS_PER_BANK?

Because last_pin is a 0-indexed maximum pin number, if an SoC's highest pin
number is an exact multiple of 32 (for instance, 32), round_up(32, 32)
evaluates to 32. This would calculate nbanks as 1 instead of 2.

Later in sunxi_pmx_set() or sunxi_pinctrl_gpio_set(), accessing
pctl->dat_shadow[pin / PINS_PER_BANK] could lead to an out-of-bounds heap
access when the pin number evaluates to an index equal to or greater than
nbanks.

> +	if (!pctl->dat_shadow)
> +		return -ENOMEM;
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260812120114.3250=
1-1-ilya.titov@wirenboard.com?part=3D1
