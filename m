Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E615371CF1;
	Sun, 12 Jul 2026 08:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783844023; cv=none; b=VGZIl1/2kp4AqsVr4xlYHe0PHJ9gMSayBksN9sBBpl8B7Va5GuzrwtiLrK6ic/FTrWWI0VKnpsRtaNAdxbf8BTSHf6lkXAIz40q+sSXGdv0BhbEQz1oBrQfo2obi36bnLzzy/Ha35qTAXgePWxx+DlUGrcYSx6Ilw0lZLp4tbhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783844023; c=relaxed/simple;
	bh=gZWb52QPZWxYQTbNzsQUr1vVVChCeHo9WsttryOoIVI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=T8sDzlJoToBZWDV9y1eZjpOdoeA9CYIxgej8eOf78kR+GZuGWZryRmc3V8DVotwaV/jnxJyhMwUW5zncGSiFIgFIeTzbgzFODYeR1Q3YX9qDXd/quP/sDsgAWxR2ceAadC0aJmyEv/CSUy3KoTzbASDSHXSjQ+mu0MsVc9fGchA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ju3xlUyq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ju3xlUyq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D1431F00A3D;
	Sun, 12 Jul 2026 08:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783844021;
	bh=uApPunQJFafcL1qpS82F6SOpISP09oAP+/QsYr6Eohs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ju3xlUyqqWiplxO+MiATXo39NEHlShvAorYAwex11UMUtC0dH2U5j6lHWmCV6bnhp
	 7b08z7aEFD71D5SPVb8uo6oyaQZuGRysxLaIMggRnLPVYOuTgSnu8qfs3QDCjHsgbx
	 JtcoLnAvmjdJgZYS9lFqS3ySS7XYtz5jjrr2CmgBVNWRNBKY9yeIlD/+LBrO2tRHMh
	 8txrWO/NI0dpEY+WqN8Ra9+4l8rK/WwkBaPdL9TmJcI7EUrkBPUmJPjwIZht7Xfw6i
	 DrMFaD4bezZ3ixIBtMbio8FFyB1xH9ZRMAch5gylnAJGLdjko2qUJXYzahzQXo4kiG
	 XC03iHBwXXAig==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 5/8] clk: sunxi-ng: a733: Add bus clocks support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Junhui Liu" <junhui.liu@pigmoral.tech>
Cc: robh@kernel.org, conor+dt@kernel.org, linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org
In-Reply-To: <20260711-a733-clk-v2-5-974d188cbe0c@pigmoral.tech>
References: <20260711-a733-clk-v2-0-974d188cbe0c@pigmoral.tech>
 <20260711-a733-clk-v2-5-974d188cbe0c@pigmoral.tech>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 12 Jul 2026 08:13:41 +0000
Message-Id: <20260712081341.9D1431F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] Defining `mbus_clk` with a 0-width `P` prescaler causes undefi=
ned behavior in `ccu_mp_set_rate()`, leading to the critical memory bus clo=
ck register being completely cleared.
- [High] The MBUS clock requires an update bit to commit rate changes, but =
it is defined using `ccu_mp` operations which completely ignore the `CCU_FE=
ATURE_UPDATE_BIT` flag.
--

--- Patch [5]: [PATCH v2 5/8] clk: sunxi-ng: a733: Add bus clocks support -=
--
commit 40f96b18647c7ab7dc42f9a7456046beab510ac6
Author: Junhui Liu <junhui.liu@pigmoral.tech>

clk: sunxi-ng: a733: Add bus clocks support

This commit adds the essential bus clocks in the Allwinner A733 CCU,
including AHB, APB0, APB1, APB_UART, and MBUS. It also marks the MBUS
clock as critical to ensure the memory bus remains operational.

> diff --git a/drivers/clk/sunxi-ng/ccu-sun60i-a733.c b/drivers/clk/sunxi-n=
g/ccu-sun60i-a733.c
> --- a/drivers/clk/sunxi-ng/ccu-sun60i-a733.c
> +++ b/drivers/clk/sunxi-ng/ccu-sun60i-a733.c

[ ... ]

> +static const struct clk_parent_data mbus_parents[] =3D {
> +	{ .hw =3D &sys_24M_clk.hw },
> +	{ .hw =3D &pll_periph1_600M_clk.hw },
> +	{ .hw =3D &pll_ddr_clk.common.hw },
> +	{ .hw =3D &pll_periph1_480M_clk.common.hw },
> +	{ .hw =3D &pll_periph1_400M_clk.hw },
> +	{ .hw =3D &pll_npu_clk.common.hw },
> +};
> +static SUNXI_CCU_MP_DATA_WITH_MUX_GATE_FEAT(mbus_clk, "mbus", mbus_paren=
ts, 0x588,
> +					    0, 5,	/* M */
> +					    0, 0,	/* no P */

[Severity: Critical]
This is a pre-existing issue in the framework, but does defining mbus_clk
with a 0-width P prescaler cause undefined behavior when the rate is set?

When ccu_mp_set_rate() is called in drivers/clk/sunxi-ng/ccu_mp.c, it
evaluates the mask for the P prescaler:

drivers/clk/sunxi-ng/ccu_mp.c:ccu_mp_set_rate() {
    ...
    reg &=3D ~GENMASK(cmp->p.width + cmp->p.shift - 1, cmp->p.shift);
    ...
}

Since p.width is 0, this expands to GENMASK(-1, 0). On 64-bit architectures,
the shift by 64 is masked to 0, which makes ~GENMASK evaluate to 0 and clea=
rs
the entire mbus_clk register, including the critical clock gate bit.

Could this lead to a system crash during boot or runtime frequency scaling?

> +					    24, 3,	/* mux */
> +					    BIT(31),	/* gate */
> +					    CLK_IS_CRITICAL,
> +					    CCU_FEATURE_UPDATE_BIT);

[Severity: High]
This is also a pre-existing issue in the framework, but will the hardware
actually commit rate changes for this clock?

The commit message notes that the hardware requires bit 27 to be set for
the configuration to take effect. However, ccu_mp_set_rate() does not
process the CCU_FEATURE_UPDATE_BIT flag before writing the register:

drivers/clk/sunxi-ng/ccu_mp.c:ccu_mp_set_rate() {
    ...
    writel(reg, cmp->common.base + cmp->common.reg);

    spin_unlock_irqrestore(cmp->common.lock, flags);
    ...
}

Since the update bit is never toggled by the ccu_mp operations, does this
leave the software state permanently out of sync with the hardware state
when the mbus_clk rate is configured?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260711-a733-clk-v=
2-0-974d188cbe0c@pigmoral.tech?part=3D5
