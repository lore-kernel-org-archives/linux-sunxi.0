Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A66C372EC6;
	Sun, 12 Jul 2026 08:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783844022; cv=none; b=j2nK5dZBHpnkX9y7aJ46iZWCfQ7pGw3cDvd83wdsqBXWjh+TanFTrfBCJ8bjmR39aO5jyh+xgnFYuGxy+1BB4Rr1Vl0lhXCCNqm1JbufOoqfGcyXCXa1DQ59vmOPCouUC+pmgrHpEeBFnAg3LKkoB5zSsha1jTabmK89eBO4Lc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783844022; c=relaxed/simple;
	bh=xL8ZkLwpFbIHEq7rulMS/vxiDwhLRyKMsOA3CCgn8RY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uq+Pic8jJ0JhHwUd3GOcQn5CzdT4BFQpaXCgavYWkgBosv8UWP3BC7fQSsDMjw8TbJsav/zFNF+wSidBM/Ggs3+CIksVIIWQ8NLo1dWfR1t5FtXr1wajkcQNxgsnuySVbqPWIt8Cl0jxXIFj8/GRG9oDvPwhlGdBB9DHAaH8WIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NTqa4Wt9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NTqa4Wt9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 438D21F00A3A;
	Sun, 12 Jul 2026 08:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783844020;
	bh=50zwa1oeOXdgX6nEsMzdrWgkWtLpvFad32l4sMD3hTI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NTqa4Wt9LaBDGJLG8ZTX7Kq/Tm6GtTE17k4x7HR2dDYL+fapckiBHa2KE+/pRCzSR
	 C/j9qjS6oMRU0xV2wdTuTE6oTTe88le4TYl0dp9zFpZaFZXgwL7iltr+hiFsLp22w1
	 pqJcqLvZ15d5Hjfoe4E3Holajtn/y3MkVvmESKlQklmykIiEQmS/QBc4jTDzDb8cCi
	 JJdugggvi/coNilG/tMHpVxZtCtvl72sHWlJwSOSH9hJD4pd/VSPuPSHpZIA0V5X48
	 C0fUE5HvOeC9TU/s9+Kn++JZeplaFyizfQR1DPOBhvvh8EM46/K44s49SamzskH33U
	 9IojgmQ1/eXfw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/8] clk: sunxi-ng: a733: Add PRCM CCU
Reply-To: sashiko-reviews@lists.linux.dev
To: "Junhui Liu" <junhui.liu@pigmoral.tech>
Cc: linux-sunxi@lists.linux.dev, robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260711-a733-clk-v2-3-974d188cbe0c@pigmoral.tech>
References: <20260711-a733-clk-v2-0-974d188cbe0c@pigmoral.tech>
 <20260711-a733-clk-v2-3-974d188cbe0c@pigmoral.tech>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 12 Jul 2026 08:13:39 +0000
Message-Id: <20260712081340.438D21F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Missing reset controls for hardware modules R-TWD, R-PPU, R-TZMA=
, and R-CPU-BIST.
- [Medium] The mux shift for `r_cpu_timer0..3` is incorrectly set to 4, whi=
ch is anomalous for PRCM CCU clocks and likely a copy-paste error.
--

--- Patch [3]: [PATCH v2 3/8] clk: sunxi-ng: a733: Add PRCM CCU ---
commit 52650c9e3c767283edee5eb6338cdb409a63f50e
Author: Junhui Liu <junhui.liu@pigmoral.tech>

clk: sunxi-ng: a733: Add PRCM CCU

Add support for the Power Reset Clock Management (PRCM) module found in
the Allwinner A733 SoC. This clock controller manages the clock control
and reset functions for device modules within the CPUS domain.

> diff --git a/drivers/clk/sunxi-ng/ccu-sun60i-a733-r.c b/drivers/clk/sunxi=
-ng/ccu-sun60i-a733-r.c
> new file mode 100644
> index 0000000000000..a56cd3edff5fe
> --- /dev/null
> +++ b/drivers/clk/sunxi-ng/ccu-sun60i-a733-r.c
[ ... ]
> +static SUNXI_CCU_P_DATA_WITH_MUX_GATE(r_cpu_timer0, "r-timer0", r_apb_pa=
rents, 0x100,
> +				      1, 3,	/* P */
> +				      4, 3,	/* mux */
> +				      BIT(0),	/* gate */
> +				      0);
> +static SUNXI_CCU_P_DATA_WITH_MUX_GATE(r_cpu_timer1, "r-timer1", r_apb_pa=
rents, 0x104,
> +				      1, 3,	/* P */
> +				      4, 3,	/* mux */
> +				      BIT(0),	/* gate */
> +				      0);
> +static SUNXI_CCU_P_DATA_WITH_MUX_GATE(r_cpu_timer2, "r-timer2", r_apb_pa=
rents, 0x108,
> +				      1, 3,	/* P */
> +				      4, 3,	/* mux */
> +				      BIT(0),	/* gate */
> +				      0);
> +static SUNXI_CCU_P_DATA_WITH_MUX_GATE(r_cpu_timer3, "r-timer3", r_apb_pa=
rents, 0x10c,
> +				      1, 3,	/* P */
> +				      4, 3,	/* mux */
> +				      BIT(0),	/* gate */
> +				      0);

[Severity: Medium]
Are the mux shift values for r_cpu_timer0 through r_cpu_timer3 correct?

Most of the other PRCM clocks in this driver use bit 24 for the mux shift.
If the hardware actually expects the mux configuration at bit 24, writing
to bits 4-6 might fail to select the correct parent clock and could
accidentally overwrite other configuration bits, resulting in incorrect
timer frequencies.

[ ... ]
> +static struct ccu_reset_map sun60i_a733_r_ccu_resets[] =3D {
> +	[RST_BUS_R_TIMER]	=3D { 0x11c, BIT(16) },
> +	[RST_BUS_R_PWM]		=3D { 0x13c, BIT(16) },

[Severity: Medium]
Should there be reset controls for the R-TWD, R-PPU, R-TZMA, and
R-CPU-BIST modules mapped here?

These modules have clock gate offsets defined (0x12c, 0x1ac, 0x1b0, 0x1bc)
elsewhere in the driver, but are omitted from this reset list. If they do
have corresponding reset lines, missing them could prevent their drivers
from taking the hardware out of reset during initialization, potentially
causing uninitialized states or bus hangs upon access.

> +	[RST_BUS_R_SPI]		=3D { 0x15c, BIT(16) },
> +	[RST_BUS_R_MSGBOX]	=3D { 0x17c, BIT(16) },
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260711-a733-clk-v=
2-0-974d188cbe0c@pigmoral.tech?part=3D3
