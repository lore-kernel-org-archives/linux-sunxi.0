Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A41C6373C04;
	Sun, 12 Jul 2026 08:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783844024; cv=none; b=XZRzPvhle6F67sWj4FWWsWTdI0yJUGQkz6Wxfu5HGeiaUpmeHi2W2kQyxVh7wL56zLwLC4xwbtcDVuoV6r+uftRzxnj0t++kfPJWOOVqIZ8VtZge/XI89HmtFU4PNqSfwNq0lpse0EdAQ70XOB1mjcL2Cv1SbW9GYOwtNTmtddY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783844024; c=relaxed/simple;
	bh=t4SMFRSKdev+HmqIKiFS+bCRef17Y6dE94cicaMl8h0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JqgzJAlSnZhocDZBmtVYnXfcGNsv2c7zLvZJf+GEk86aLZ2baExHbICK9MndYbr7jrtO6f/jBzGen3QEZoyMOa7m7Iy+Z/Jn1IelfIY49RcgziWN1cHiXtKZB7lXhK9B30LgS/YxdSKhp8jCPMoWjyO1jts2+WJGb7QxylIV4DQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dklxL/7q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dklxL/7q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D52F1F000E9;
	Sun, 12 Jul 2026 08:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783844023;
	bh=KAMLB8idJldxO4UfkNuZP+DXYoxEzVS/SUI1n7dxka4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dklxL/7qSb8hO9HkM9kTyvzC8y2+s+zcB5PJPz/LGdf1XODDLUkDpuFTxzJ6wa6IZ
	 8q40C7cZzgwzaf4RRWjvhRFtLihUl5KdZyf/QroYiDSTHxE3IyyXOxDi4Hw9Cwsm+a
	 /Qn1kZM7qiXmZNfZjTTMf4vBOPrBgijp7a4CQbiQvcIrJGwwyiSziyDisyMPuNPmAw
	 SpjNVizJ/IL8sKUJEwEuNwWkBcTWQj4oy46Wx1S1digtOvMGdBtZY+ClZtkEjwO6PB
	 v6t/ZK0X4F1HmtsEvWxmUCidxp93P6lbnKlOABvnLp3zuspkzCA26ubSwYgf0l2gtK
	 Cf/6kOdHO6KLw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 6/8] clk: sunxi-ng: a733: Add mod clocks support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Junhui Liu" <junhui.liu@pigmoral.tech>
Cc: linux-sunxi@lists.linux.dev, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260711-a733-clk-v2-6-974d188cbe0c@pigmoral.tech>
References: <20260711-a733-clk-v2-0-974d188cbe0c@pigmoral.tech>
 <20260711-a733-clk-v2-6-974d188cbe0c@pigmoral.tech>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 12 Jul 2026 08:13:42 +0000
Message-Id: <20260712081343.1D52F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] Undefined Behavior in ccu_mp_set_rate() due to GENMASK(-1, 0) =
silently clears clock registers.
--

--- Patch [6]: [PATCH v2 6/8] clk: sunxi-ng: a733: Add mod clocks support -=
--
commit 9fae602071158ab4bb78bf12e40f53a7e4b2f550
Author: Junhui Liu <junhui.liu@pigmoral.tech>

clk: sunxi-ng: a733: Add mod clocks support
   =20
Add the module clocks found in the Allwinner A733 SoC, including video,
storage, interfaces and others. This implementation accounts for changes
in register offsets and introduces support for new modules.

> diff --git a/drivers/clk/sunxi-ng/ccu-sun60i-a733.c b/drivers/clk/sunxi-n=
g/ccu-sun60i-a733.c
> index c42619afb52e3..bf26e310f08a9 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun60i-a733.c
> +++ b/drivers/clk/sunxi-ng/ccu-sun60i-a733.c
[ ... ]
> +static SUNXI_CCU_MP_DATA_WITH_MUX_GATE(timer0_clk, "timer0", timer_paren=
ts, 0x800,
> +				       0, 0,		/* no M */
> +				       0, 3,		/* P */
> +				       24, 3,		/* mux */
> +				       BIT(31),		/* gate */
> +				       0);

[Severity: Critical]
This is a pre-existing issue, but won't specifying a width of 0 for the
M divider cause undefined behavior in the CCU framework?

When a driver or the clock framework calls clk_set_rate() on these newly
introduced clocks (e.g., timer0_clk through timer9_clk, mbus_clk),
ccu_mp_set_rate() clears the M and P divider fields:

drivers/clk/sunxi-ng/ccu_mp.c:ccu_mp_set_rate() {
	...
	reg &=3D ~GENMASK(cmp->m.width + cmp->m.shift - 1, cmp->m.shift);
	reg &=3D ~GENMASK(cmp->p.width + cmp->p.shift - 1, cmp->p.shift);
	...
}

Because these clocks are instantiated with width =3D 0, this evaluates to
~GENMASK(-1, 0) at runtime. GENMASK(-1, 0) computes ~0UL >> 64. On ARM64
hardware, the dynamic shift amount is read from the bottom 6 bits of the
register (64 & 63 =3D=3D 0), resulting in a shift of 0, leaving the value as
~0UL (all ones).

The ~GENMASK thus evaluates to 0, which completely zeroes the hardware
register, including the clock gate bit (BIT(31)).

[ ... ]
> +static SUNXI_CCU_MP_DATA_WITH_MUX_GATE_FEAT(dram0_clk, "dram0", dram_par=
ents, 0xc00,
> +					    0, 4,	/* M */
> +					    0, 0,	/* no P */
> +					    24, 3,	/* mux */
> +					    BIT(31),	/* gate */
> +					    CLK_IS_CRITICAL,
> +					    CCU_FEATURE_UPDATE_BIT);

[Severity: Critical]
This isn't a bug introduced by this patch, but dram0_clk is instantiated
with a P width of 0. Calling set_rate on it will trigger ~GENMASK(-1, 0)
and wipe its register. Since this is the DRAM clock, won't disabling it
instantly hang the system?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260711-a733-clk-v=
2-0-974d188cbe0c@pigmoral.tech?part=3D6
