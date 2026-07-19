Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80E8343F0BE;
	Sun, 19 Jul 2026 21:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784496292; cv=none; b=QKhFrHhaB9PUX04r6RRnNZEYNK2eZrIHH+RRPC4mJBZoDGZibfzCzb5jvgRE1Wgs85kTVfFmUOCLK7RLie5eFr6TR1Qw2uwhygkPTPV8razFGp3X5IqfTi+eBBgJaUFC3ZmKnX0+dwFakylE6zg47xZrJ/h6jduquV4bnoE1aQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784496292; c=relaxed/simple;
	bh=SroTm4qpWcRBKHmJ7r5PXwb+eOHxI6t+GZ/nBqHsjME=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Sh9yeefs6AXWJ3aFPC1Roer9HWmtARRROdELwnulpY/aJmB1h0j5qxCXwJt4JvxB5/lPYnCRBcnJEcTam3gxr73TqsF2t6GpTegbv3F9YDT8u4lFKhhlZbFchoXXT+dXQ53DziVE68YXNPmMxk/LvIoVJWeQ6IYTA2ynRQmbN+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nGELbAJE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nGELbAJE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1B7F1F000E9;
	Sun, 19 Jul 2026 21:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784496291;
	bh=XyLPM2cunSI1SY8qFdpOOQaBWYiUSp+VgnhJXH4pe4w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nGELbAJE94MPbDMYqP0Q0gc9DjN52m0Iv+npLvogjpgGJrhnOebZ5aIEUdiSSwF9K
	 06Js7+8lq7+dpLpuSSnTi4grTv/0a5g/ux543eguZ4Jhs1njexOEdLUaLehkeqrwa8
	 yMtU/i5Uc83iums02yi3Myxp6uuU8c02fVxttI1LtddBMqdDRFFmreMdtEAASzcwsA
	 Q3a3GWnzZ4H/VcvhX48B7bf1kdHKG84QXBwzdZiCm8LjfFqcrf+Fmp64WKO4NuFEod
	 ueXl5iW5xtAKxjyPgQhvtPky+FEyU3J+8lJxflBNnTQWn0pQ/yTEXnRcmyuZRFFkM8
	 Q4up8uSkIl3LA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 1/4] clk: sunxi-ng: add cycle-masking divider
 (maskdiv) clock type
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?SnVhbiBNYW51ZWwgTMOzcGV6IENhcnJpbGxv?= <juanmanuellopezcarrillo@gmail.com>
Cc: linux-sunxi@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260719211319.982285-2-juanmanuellopezcarrillo@gmail.com>
References: <20260719211319.982285-1-juanmanuellopezcarrillo@gmail.com>
 <20260719211319.982285-2-juanmanuellopezcarrillo@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 19 Jul 2026 21:24:50 +0000
Message-Id: <20260719212450.D1B7F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] ccu_maskdiv_determine_rate ignores the CLK_SET_RATE_PARENT flag, b=
reaking rate propagation.
- [Medium] ccu_maskdiv_set_rate fails to apply CCU_FEATURE_UPDATE_BIT and C=
CU_FEATURE_KEY_FIELD, causing inconsistent state latching.
--

--- Patch [1]: [PATCH v1 1/4] clk: sunxi-ng: add cycle-masking divider (mas=
kdiv) clock type ---
commit 07eec9d5dafd1fbf248e0e56bb3c42f8da46589d
Author: Juan Manuel L=C3=B3pez Carrillo <juanmanuellopezcarrillo@gmail.com>

clk: sunxi-ng: add cycle-masking divider (maskdiv) clock type

This commit introduces a cycle-masking divider clock type for sunxi-ng.
Instead of a linear divider, it masks M pulses out of every 2^width parent
cycles, which is used for hardware like the A523/T527 GPU clock.

> diff --git a/drivers/clk/sunxi-ng/ccu_maskdiv.c b/drivers/clk/sunxi-ng/cc=
u_maskdiv.c
> new file mode 100644
> index 0000000000000..2d3cccf081493
> --- /dev/null
> +++ b/drivers/clk/sunxi-ng/ccu_maskdiv.c
> @@ -0,0 +1,199 @@

[ ... ]

> +static int ccu_maskdiv_determine_rate(struct clk_hw *hw,
> +				      struct clk_rate_request *req)
> +{
> +	struct ccu_maskdiv *cmd =3D hw_to_ccu_maskdiv(hw);
> +	unsigned long best_rate =3D 0, best_parent_rate =3D 0;
> +	struct clk_hw *best_parent =3D NULL;
> +	unsigned int best_m =3D UINT_MAX;
> +	unsigned int i;
> +
> +	for (i =3D 0; i < clk_hw_get_num_parents(hw); i++) {
> +		struct clk_hw *parent =3D clk_hw_get_parent_by_index(hw, i);
> +		unsigned long parent_rate, new_rate;
> +		unsigned int m;
> +
> +		if (!parent)
> +			continue;
> +
> +		parent_rate =3D clk_hw_get_rate(parent);
> +		m =3D ccu_maskdiv_find_m(parent_rate, req->rate, cmd->width);
> +		new_rate =3D ccu_maskdiv_calc_rate(parent_rate, m, cmd->width);

[Severity: High]
Does this implementation ignore the CLK_SET_RATE_PARENT flag?

By using clk_hw_get_rate(parent) instead of clk_hw_round_rate(), this loop
only evaluates parents at their currently locked rates. It appears this
prevents the framework from adjusting the parent's rate (such as the
underlying pll-gpu).

Could this silently break Dynamic Voltage and Frequency Scaling (DVFS) by
locking the GPU to a masked fraction of the PLL's fixed boot rate?

> +
> +		if (new_rate > req->rate)
> +			continue;

[ ... ]

> +static int ccu_maskdiv_set_rate(struct clk_hw *hw, unsigned long rate,
> +				unsigned long parent_rate)
> +{
> +	struct ccu_maskdiv *cmd =3D hw_to_ccu_maskdiv(hw);
> +	unsigned int m;
> +	unsigned long flags;
> +	u32 reg;
> +
> +	m =3D ccu_maskdiv_find_m(parent_rate, rate, cmd->width);
> +
> +	spin_lock_irqsave(cmd->common.lock, flags);
> +
> +	reg =3D readl(cmd->common.base + cmd->common.reg);
> +	reg &=3D ~GENMASK(cmd->shift + cmd->width - 1, cmd->shift);
> +	writel(reg | (m << cmd->shift), cmd->common.base + cmd->common.reg);

[Severity: Medium]
Will hardware register updates fail to latch here if the clock requires the
CCU_SUNXI_UPDATE_BIT or CCU_FEATURE_KEY_FIELD?

The standard ccu_common framework relies on these feature bits to
synchronize hardware changes, which ccu_mux_helper_set_parent() applies
automatically.

Since this direct write ignores cmd->common.features, could rate changes
silently fail to apply for clocks that require the update bit?

> +
> +	spin_unlock_irqrestore(cmd->common.lock, flags);
> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260719211319.9822=
85-1-juanmanuellopezcarrillo@gmail.com?part=3D1
