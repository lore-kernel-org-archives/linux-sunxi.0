Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89BE8360EE1
	for <linux-sunxi@lists.linux.dev>; Wed, 22 Jul 2026 01:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784682567; cv=none; b=BHKWQAYAsHAj3GLsxgaNqV9lJVfvXeP7IRbC5X6z46UEeJkdO6hImtk3CMUSZwSJvTguOChStIaK3KOu4eWyk9SPsHOVOLGuJLre8FdhUpIIrVqqCsqWR1JlvXf3zQC8K/1r4wsteIDLvHK2lW1pZdGrvNU7ZDEssEXgAiEeXZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784682567; c=relaxed/simple;
	bh=oFOVGmnESRIEMQP5+n2FJnM5E+XyAavKAo4NDHBIgTE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Jolxj0Pg1wyprgzIofwournNqO92HZQsA1JpxLYVm/b5gYDSCQfGp0wPD9IroJL8zBsVDXiYBAzNoIeeiT7VQMDBfGnduTuqPo0H2XTSZ9PwA4o1jbfokVFG6kPQc6TPyV90VKtgE3Kp9VX7HxFv7rbtWOeTaraPHfCiZmXRvSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cRwGhQqq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cRwGhQqq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A8B01F000E9;
	Wed, 22 Jul 2026 01:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784682566;
	bh=k79X9ET906gzu5ec6z4AqIv0KnwMQOs7Px5vVSw7VlA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cRwGhQqq/+Rx+ct3wNoCjCyDeY2Q8POS+iWGYorgtp7NEMluwGPd/ryxit8hAA4l1
	 lKKHpSA9gt2BRZSnzIS78I+uRfSSxLSYlkW5c/jMdBIrI4audJ+OGTXc1ASoSDAA2w
	 Hdi+Um9Q2a6t5oY0qfJsFiVaHwFgQznP/a6msevwm6uMQvdzwCdY3MjDGOf16xzF4H
	 JrqC8zIU9+GUUCFceXmNHR+h0WvUxg/ccdBKVuj4BRCFXQfI92kMDPfucG8rIAQZD0
	 jLWRwrNtsKjPRIY4R0zOIZbAjnFKjh+6wuF8QU4bxsv+dEk7V79Fj1eCjo4XUkl9V8
	 lPqJtsXKWWaPg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] clk: sunxi-ng: ccu_mp: fix clocks without P dividers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Enzo Adriano" <enzo.adriano.code@gmail.com>
Cc: linux-sunxi@lists.linux.dev
In-Reply-To: <20260722005643.1208942-1-enzo.adriano.code@gmail.com>
References: <20260722005643.1208942-1-enzo.adriano.code@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 Jul 2026 01:09:25 +0000
Message-Id: <20260722010926.0A8B01F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The patch resolves an invalid GENMASK evaluation for 0-width P div=
iders but fails to apply the same check for 0-width M dividers, leaving a r=
egister corruption bug intact.
- [High] When an unreachable low clock rate is requested, `ccu_mp_find_best=
` fails to find a suitable divider and returns `m =3D 0` and `p =3D 0`, lea=
ding to integer underflows that severely corrupt the CCU hardware register.
--

--- Patch [1]: [PATCH] clk: sunxi-ng: ccu_mp: fix clocks without P dividers=
 ---
commit e8027d463bc82dfb3ec7ba4b45f1688fa59d1694
Author: Enzo Adriano <enzo.adriano.code@gmail.com>

clk: sunxi-ng: ccu_mp: fix clocks without P dividers

This commit modifies the sunxi-ng MP clock driver to conditionally apply the
P divider mask only when the P field is present. It also ensures the update
bit is set if required by the hardware. This prevents invalid GENMASK
evaluations and missing hardware updates.

Closes: https://lore.kernel.org/r/20260712081341.9D1431F00A3D@smtp.kernel.o=
rg

> diff --git a/drivers/clk/sunxi-ng/ccu_mp.c b/drivers/clk/sunxi-ng/ccu_mp.c
> index 7cdb0eedc69b5..aa6cb20447f19 100644
> --- a/drivers/clk/sunxi-ng/ccu_mp.c
> +++ b/drivers/clk/sunxi-ng/ccu_mp.c
> @@ -237,12 +237,17 @@ static int ccu_mp_set_rate(struct clk_hw *hw, unsig=
ned long rate,
> =20
>  	reg =3D readl(cmp->common.base + cmp->common.reg);
>  	reg &=3D ~GENMASK(cmp->m.width + cmp->m.shift - 1, cmp->m.shift);

[Severity: High]
This isn't a bug introduced by this patch, but since we are fixing the
invalid GENMASK for 0-width P dividers, should we apply the same check for
M dividers?

If an MP clock has no M divider (m.width =3D=3D 0), the GENMASK will underf=
low
and produce an all-ones mask. The ~GENMASK operation then zeroes out the
entire hardware register, clearing critical fields like the clock gate.

> -	reg &=3D ~GENMASK(cmp->p.width + cmp->p.shift - 1, cmp->p.shift);
> +	if (cmp->p.width)
> +		reg &=3D ~GENMASK(cmp->p.width + cmp->p.shift - 1, cmp->p.shift);
> +	if (cmp->common.features & CCU_FEATURE_UPDATE_BIT)
> +		reg |=3D CCU_SUNXI_UPDATE_BIT;
>  	reg |=3D (m - cmp->m.offset) << cmp->m.shift;

[Severity: High]
This is a pre-existing issue, but can this operation corrupt the hardware
register if an extremely low rate is requested?

If a driver or user requests a rate lower than the minimum achievable rate,
ccu_mp_find_best() will skip all rates:

drivers/clk/sunxi-ng/ccu_mp.c:ccu_mp_find_best() {
    ...
	if (tmp_rate > rate)
		continue;
    ...
}

This causes it to return the initial values for m and p as 0. Back in
ccu_mp_set_rate(), an m of 0 will cause m - cmp->m.offset to underflow
(for example, 0 - 1 =3D 0xFFFFFFFF). This value is then left-shifted and
OR'd into the register, overwriting adjacent hardware fields with 1s.

> -	if (shift)
> -		reg |=3D ilog2(p) << cmp->p.shift;
> -	else
> -		reg |=3D (p - cmp->p.offset) << cmp->p.shift;
> +	if (cmp->p.width) {
> +		if (shift)
> +			reg |=3D ilog2(p) << cmp->p.shift;
> +		else
> +			reg |=3D (p - cmp->p.offset) << cmp->p.shift;
> +	}
> =20
>  	writel(reg, cmp->common.base + cmp->common.reg);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260722005643.1208=
942-1-enzo.adriano.code@gmail.com?part=3D1
