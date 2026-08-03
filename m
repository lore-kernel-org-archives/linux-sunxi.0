Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A17C9424D47;
	Mon,  3 Aug 2026 18:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785781525; cv=none; b=mKJBTqV+GP/BlMiTREWatOLAV+epvRdKUB0UyG8Euthe7PBTaq6SDll2gL4Wx5CoK9lPxhMafbTMJLRjD5Ok+sUt2uESslpRFXjmrAjxKHhNXNw8wRgbdBxz1JIJRvqpirH2tC3Lk5Bsas9fFeGTpDEm4detAo/3MNgtJbM2NKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785781525; c=relaxed/simple;
	bh=G+HC2nacxJ4lkfBjb3CnHFIyYmAtdL2bozWSNt/crl4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=oDSPaeAaQmU5GC8oDy994Thg6Fz5fTw1OVz4NflNyfCqPt+AZTtfNjN/stIOG8zLxQ5SGxqj4KcOaNnnw3MW+VtluVAHoHIZBT78/ZJz1JtWDJ8vOxXlMOoeDQtHSxFF84x6HXwkLuQVTn++VX5nTGdXhAU8tGo+oerJEfQ8Hkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jKg/Vb2g; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jKg/Vb2g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A344A1F00A3D;
	Mon,  3 Aug 2026 18:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785781522;
	bh=VFH2M+sDIdx5VpvmChPymOMUcFm95RQsW5QajwIXc+U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jKg/Vb2gEUrpKpadY++J4ALo25OQ6KaWRkopILxsWqd4i4yJSONCsHUFDv20ydNq1
	 rKIfPR/Y9AQ/491W3DeXywJtFBj6+heXsObDNqzXC8itMxUrAeeiRJzNHUmxkP7l2N
	 R7yEqmiwulkb4Op7wNEDzCjLOiDOfMOrmTifkQ6HdeBRkvNbIrP9PqF7U74YvAQp2p
	 W4hYHpP9i2N06YcKO7Id5ApssZvMOjBWvqakegTfpV3tZLIFMF+/UAIrRyMDSvMNLO
	 ZfGXr/KOd0vmBt2pco3kyUjFOJuOi4xxVjChuIJsf31ZUqmCSN/qG4NpVO1HQ7thsu
	 Xj1dWXaaZdHHA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/3] clk: sunxi-ng: sun55i-a523: GPU clock divider is
 fractional, not linear
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?SnVhbiBNYW51ZWwgTMOzcGV6IENhcnJpbGxv?= <juanmanuellopezcarrillo@gmail.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, linux-sunxi@lists.linux.dev
In-Reply-To: <20260803180755.288793-3-juanmanuellopezcarrillo@gmail.com>
References: <20260803180755.288793-1-juanmanuellopezcarrillo@gmail.com>
 <20260803180755.288793-3-juanmanuellopezcarrillo@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 03 Aug 2026 18:25:22 +0000
Message-Id: <20260803182522.A344A1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] Integer truncation in `ccu_maskdiv_find_m()` causes the hardware t=
o drift lower than the framework's requested rate when the parent rate is n=
ot a perfect multiple of the cycle width (16). When `determine_rate` comput=
es a new rate using `new_rate =3D (parent_rate * (16 - m)) / 16`, integer d=
ivision truncates the remainder. When `set_rate` subsequently attempts to r=
ecover `m` by computing `kept =3D (new_rate * 16) / parent_rate`, the loss =
of the remainder strictly reduces `kept` by 1. This causes `set_rate` to pr=
ogram `m_found =3D m + 1` into the hardware, masking an additional cycle an=
d driving the clock at a lower rate than what was reported and committed by=
 `determine_rate`.

Pre-existing issues:
- [High] The newly introduced sparse `gpu_mux_table` triggers a pre-existin=
g flaw in `ccu_mux_helper_get_parent()`. If the vendor bootloader leaves th=
e GPU mux at hardware index 1 (`pll-periph0-800M`), `ccu_mux_helper_get_par=
ent()` fails to find `1` in the sparse table (`{ 0, 2, 3, 4, 5 }`) and fall=
s back to returning the raw hardware index `1`. The clock framework interpr=
ets this `1` as a software array index and incorrectly maps it to `gpu_pare=
nts[1]` (`pll_periph0_600M_clk`). If the kernel subsequently requests a 600=
MHz GPU rate, the framework falsely assumes the mux is already on the corre=
ct parent, skipping the mux switch and only setting the divider. This cause=
s the hardware to remain at the undivided 800MHz parent, triggering the exa=
ct GPU job faults this patch intends to fix.
- [High] `pll_gpu_clk` is defined with the `CLK_SET_RATE_GATE` flag, which =
requires the clock to be unprepared (gated) before its rate can be changed.=
 However, as noted in the commit message, reprogramming this PLL while its =
gate is off causes a 70ms lock timeout because the lock bit never asserts w=
hen the clock is disabled. This means any rate change on `pll_gpu` while it=
 is gated will stall the kernel for 70ms. The patch works around this for t=
he `gpu` downstream consumer by dropping `CLK_SET_RATE_PARENT`, but `pll_gp=
u_clk` itself remains incorrectly modeled. It should use `CLK_SET_RATE_UNGA=
TE` to inform the framework that the clock must be powered on to change its=
 rate.
--

--- Patch [2]: [PATCH v2 2/3] clk: sunxi-ng: sun55i-a523: GPU clock divider=
 is fractional, not linear ---
commit 5635b9edbbd86c7ae0bef62dc457d0e280dc656a
Author: Juan Manuel L=C3=B3pez Carrillo <juanmanuellopezcarrillo@gmail.com>

clk: sunxi-ng: sun55i-a523: GPU clock divider is fractional, not linear

This patch changes the GPU clock modeling on sun55i-a523 from a linear divi=
der
to a fractional cycle-masking divider. It updates the parent list, removes
the 800M parent due to hardware faults, and drops CLK_SET_RATE_PARENT to
prevent reprogramming the GPU PLL while it is gated.

> Also drop CLK_SET_RATE_PARENT: every OPP is reachable from the fixed
> pll-periph0 outputs, and pll-gpu must never be reprogrammed through this
> mux.  Once the GPU moves off pll-gpu the PLL is no longer prepared, so
> it loses the rate protection of CLK_SET_RATE_GATE; a propagated rate
> request would then reprogram the PLL while its gate is off (the lock
> bit never asserts, 70 ms poll timeout per transition) and switch the
> running GPU onto it before it locks.

[Severity: High]
This is a pre-existing issue, but does pll_gpu_clk use the wrong rate flag?

The commit message notes that the lock bit never asserts when the gate is
off, causing a 70ms timeout when reprogrammed. However, pll_gpu_clk is
declared in this file with CLK_SET_RATE_GATE:

drivers/clk/sunxi-ng/ccu-sun55i-a523.c:
    ...
                               CLK_SET_RATE_GATE),
    ...

Using CLK_SET_RATE_GATE enforces that the clock must be gated (unprepared)
before its rate can be changed. Since the hardware requires the PLL to be
ungated to lock, this contradicts the hardware's requirements.

Should pll_gpu_clk be updated to use CLK_SET_RATE_UNGATE instead, to inform
the framework that the clock must be powered on to change its rate?

> diff --git a/drivers/clk/sunxi-ng/ccu-sun55i-a523.c b/drivers/clk/sunxi-n=
g/ccu-sun55i-a523.c
> index 20dad06b37ca3..979e53e635228 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun55i-a523.c
> +++ b/drivers/clk/sunxi-ng/ccu-sun55i-a523.c

[ ... ]

> @@ -442,18 +443,37 @@ static SUNXI_CCU_GATE_HWS(bus_g2d_clk, "bus-g2d", a=
hb_hws, 0x63c, BIT(0), 0);
> =20
>  static const struct clk_hw *gpu_parents[] =3D {
>  	&pll_gpu_clk.common.hw,
> -	&pll_periph0_800M_clk.common.hw,
>  	&pll_periph0_600M_clk.hw,
>  	&pll_periph0_400M_clk.hw,
>  	&pll_periph0_300M_clk.hw,
>  	&pll_periph0_200M_clk.hw,
>  };
> =20
> -static SUNXI_CCU_M_HW_WITH_MUX_GATE(gpu_clk, "gpu", gpu_parents, 0x670,
> -				    0, 4,	/* M */
> -				    24, 3,	/* mux */
> -				    BIT(31),	/* gate */
> -				    CLK_SET_RATE_PARENT);
> +/*
> + * Mux index 1 (pll-periph0-800M) is skipped: the vendor BSP removed it
> + * from the parent list ("If GPU use pll-peri0-800m, gpu will occur job
> + * fault"), and with the masking divider every OPP would match exactly
> + * from it first.
> + */
> +static const u8 gpu_mux_table[] =3D { 0, 2, 3, 4, 5 };

[Severity: High]
This is a pre-existing issue, but does skipping index 1 here expose a flaw
in ccu_mux_helper_get_parent()?

If the bootloader leaves the GPU mux at hardware index 1, the helper fails
to find it in this sparse table and falls back to returning the raw index:

drivers/clk/sunxi-ng/ccu_mux.c:ccu_mux_helper_get_parent() {
    ...
        for (i =3D 0; i < num_parents; i++)
            if (cm->table[i] =3D=3D parent)
                return i;
    }

    return parent;
}

The clock framework then interprets this returned 1 as a software array
index and incorrectly maps it to gpu_parents[1] (which is now
pll_periph0_600M_clk).

If the kernel subsequently requests a 600MHz GPU rate, the framework
might falsely assume the mux is already on the correct parent and skip the
switch. This would leave the hardware at the undivided 800MHz parent,
triggering the exact GPU job faults this patch intends to fix.

> +
> +/*
> + * The M factor is a cycle-masking (fractional) divider, not a linear
> + * one: rate =3D source * (16 - M) / 16 (T527 manual, GPU_CLK_REG).
> + *
> + * No CLK_SET_RATE_PARENT: every GPU OPP is reachable from the fixed
> + * pll-periph0 outputs, and pll-gpu must never be reprogrammed through t=
his mux.
> + * Once the GPU moves off pll-gpu the PLL is no longer prepared, so it l=
oses
> + * the rate protection of CLK_SET_RATE_GATE; a propagated rate request w=
ould
> + * then reprogram the PLL while its gate is off (the lock bit never asse=
rts,
> + * 70 ms timeout) and switch the running GPU onto it before it locks.
> + */
> +static SUNXI_CCU_MASKDIV_HW_WITH_MUX_TABLE_GATE(gpu_clk, "gpu", gpu_pare=
nts,
> +						gpu_mux_table, 0x670,
> +						0, 4,	/* M */
> +						24, 3,	/* mux */
> +						BIT(31),	/* gate */
> +						0);

[Severity: High]
Does using the maskdiv implementation here cause the hardware to drift
lower than the requested rate when the parent rate is not evenly divisible
by 16?

In ccu_maskdiv_find_m(), integer truncation occurs when recovering the
multiplier:

drivers/clk/sunxi-ng/ccu_maskdiv.c:ccu_maskdiv_find_m() {
    ...
    kept =3D div64_ul((u64)rate * n, parent_rate);
    ...
}

When determine_rate computes new_rate =3D (parent_rate * (16 - m)) / 16,
the remainder is truncated. When set_rate subsequently attempts to recover
m using the truncated rate:

drivers/clk/sunxi-ng/ccu_maskdiv.c:ccu_maskdiv_set_rate() {
    ...
    m =3D ccu_maskdiv_find_m(parent_rate, rate, cmd->width);
    ...
}

The loss of the remainder strictly reduces kept by 1. This causes set_rate
to program m + 1 into the hardware, masking an additional cycle and driving
the clock at a lower rate than what was reported by determine_rate.

Could DIV_ROUND_UP_ULL be used to prevent this truncation?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260803180755.2887=
93-1-juanmanuellopezcarrillo@gmail.com?part=3D2
