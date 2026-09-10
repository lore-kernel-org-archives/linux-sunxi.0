Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AD4733D503;
	Thu, 10 Sep 2026 14:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789050653; cv=none; b=HL0KqahasHfLnd3m6VgyTDqW300OZE4MjFxiIdYpEBYsJLoxl5r+3VyGFAzhUTjJwg9S5nmhp+ZGPLtOsWjHRVsYxXT3CcQXwqekgrYnEDBC+eXyqFKVTNR8IYNbOJ3VpgX8tk3QOeIbFiI0X6OdiC0EoeD2M9PTBuE6Zf98Xj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789050653; c=relaxed/simple;
	bh=qGJjhW2tiqQ505Mcqfr/h4UQhciVjoCrFy8wVz1FUrw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Fscj80lRMUSibpruDyFTldZQoEajWnM4eNS/glO9bR8kWr1qBk4DB5cvalR35U4GDVwmpuhZFWalA3jF60cn9lMsy7lyOdWKlM8EluHUWb45T/WlbPmILomPq+47zeFuu+Vzc8Zy+6iiHbBjrYjl9ChJrDDz+NcN154s3P68Cpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LK6ynGKA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LK6ynGKA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAD6C1F00893;
	Thu, 10 Sep 2026 14:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789050651;
	bh=l8ybbom8pXjdltuZTVtaDU6ogFdQ7EbuCMLVvuB+9XM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LK6ynGKAR6qTxZ2iHXMQWD+/bui82jQRzhqLiv0sfhtWrJ5CCk+ibCnR2fH7Cspts
	 GwHFkCuqUJacnLPptX7MSTaa52BESQfQM+q9VbR65MCMpmL4OQPdIMsC1wYx+bt/8V
	 BuZ+Wg9Z3tqqROmOHIe3EtAvxPqWlw0KGMnQO+jR3GbCO7TcAZwx0EgfMa4I/9e7nL
	 WLoZmrm3nIsq4OkxiDEyc1wz2GfQMyLWUbOk7wxQX/FYu/ADVOQFctonj7jZvdoHGO
	 XcyOujTKfS/3oIrW59uYScBCwqMS32A0Kgx+g6v62f8iWhVFNUXTy4QXPvZPvuAVqs
	 Wxv4pSBUbmVcw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 7/7] pinctrl: sunxi: add support for the Allwinner A733
Reply-To: sashiko-reviews@lists.linux.dev
To: "Andre Przywara" <andre.przywara@arm.com>
Cc: conor+dt@kernel.org, linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260910133519.459011-8-andre.przywara@arm.com>
References: <20260910133519.459011-1-andre.przywara@arm.com>
 <20260910133519.459011-8-andre.przywara@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 14:30:50 +0000
Message-Id: <20260910143050.DAD6C1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [High] Incorrect mapping of logical to physical IRQ banks for NCAT3 layou=
t breaks all A733 GPIO interrupts.
- [Medium] Commit message contradicts code regarding pin counts per port.

Pre-existing issues:
- [High] Off-by-one logic in `irq_bank` assignment causes out-of-bounds arr=
ay writes and reads when a SoC's first bank has no pins.
- [High] Global static struct mutation across probe deferrals causes NULL p=
ointer dereference and kernel panic.
--

commit 8c3148d94675fca6724f59ce7243638c15e54f3b
Author: Andre Przywara <andre.przywara@arm.com>

pinctrl: sunxi: add support for the Allwinner A733

The Allwinner A733 changes the layout of the pinctrl MMIO register frame, b=
ut
stays otherwise rather close to the previous IP. The main PIO looks similar=
 to
the one in the A523, with ports B-K being implemented, each also with the s=
ame
number of pins per port as on the A523.

> The Allwinner A733 changes the layout of the pinctrl MMIO register
> frame, but stays otherwise rather close to the previous IP.
> The main PIO looks similar to the one in the A523, with ports B-K being
> implemented, each also with the same number of pins per port as on the
> A523.

[Severity: Medium]
Are these pin counts actually identical? The commit message explicitly stat=
es
ports B-K are implemented with the same number of pins per port as the A523,
but in the patch PB has 11 pins and PK has 26 pins. In contrast,=20
a523_nr_bank_pins defines PB with 15 pins and PK with 24 pins.

> diff --git a/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c b/drivers/pinctr=
l/sunxi/pinctrl-sun60i-a733.c
> new file mode 100644
> index 0000000000000..ca82f08a3a65b
> --- /dev/null
> +++ b/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c
[ ... ]
> +static const u8 a733_nr_bank_pins[SUNXI_PINCTRL_MAX_BANKS] =3D
> +/*	  PA  PB  PC  PD  PE  PF  PG  PH  PI  PJ  PK */
> +	{  0, 11, 17, 24, 16,  7, 15, 20, 17, 28, 26 };

[Severity: High]
This is a pre-existing issue, but will setting PA to 0 pins cause an
out-of-bounds array write later during initialization?

When a SoC's first bank has 0 pins, prepare_function_table() processes PB
(bank =3D 1) first. The initialization logic for irq_bank does this:

drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c:prepare_function_table() {
    ...
    if (bank > last_bank)
        irq_bank++;
    func[lastfunc].muxval =3D irq_mux;
    func[lastfunc].irqbank =3D irq_bank;
    ...
}

Because bank (1) > last_bank (0), irq_bank increments from 0 to 1 before its
first use. This shifts all subsequent banks by one, giving PK an irqbank of=
 10.

Later in sunxi_pinctrl_build_state():

drivers/pinctrl/sunxi/pinctrl-sunxi.c:sunxi_pinctrl_build_state() {
    ...
    int irqnum =3D func->irqnum + func->irqbank * IRQ_PER_BANK;
    pctl->irq_array[irqnum] =3D pin->pin.number;
    ...
}

For PK, this calculates an irqnum up to 351. Since pctl->irq_array is
allocated with exactly 320 elements (10 * 32), does this write past the end
of the array? This can also cause an out-of-bounds read on desc->irq_bank_m=
ap
when handling PK interrupts.

> +
> +static const u8 a733_irq_bank_muxes[SUNXI_PINCTRL_MAX_BANKS] =3D
> +/*	  PA  PB  PC  PD  PE  PF  PG  PH  PI  PJ  PK */
> +	{  0, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14};
> +
> +static struct sunxi_pinctrl_desc a733_pinctrl_data =3D {
> +	.irq_banks =3D 10,
> +	.irq_read_needs_mux =3D true,
> +	.io_bias_cfg_variant =3D BIAS_VOLTAGE_PIO_POW_MODE_SEL,
> +};
> +
> +static int a733_pinctrl_probe(struct platform_device *pdev)
> +{
> +	return sunxi_pinctrl_dt_table_init(pdev, a733_nr_bank_pins,
> +					   a733_irq_bank_muxes,
> +					   &a733_pinctrl_data,

[Severity: High]
This isn't a bug introduced by this patch, but is it safe to pass a statica=
lly
allocated structure to sunxi_pinctrl_dt_table_init() where its npins state =
is
mutated?

In init_pins_table(), the pin counts are accumulated indefinitely:

drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c:init_pins_table() {
    ...
    for (i =3D 0; i < SUNXI_PINCTRL_MAX_BANKS; i++) {
        desc->npins +=3D pins_per_bank[i];
    ...
}

If the probe function defers, npins retains the accumulated value and doubl=
es
on the next probe attempt. While devm_kcalloc allocates an array for the
doubled size, only the first elements are initialized.

When fill_pin_function() iterates up to the doubled npins, will it call
strcmp(pins[i].pin.name, name) on zero-initialized elements, triggering a
NULL pointer dereference and kernel panic?

> +					   SUNXI_PINCTRL_NCAT3_REG_LAYOUT);
> +}

[Severity: High]
Does the SUNXI_PINCTRL_NCAT3_REG_LAYOUT incorrectly map logical to physical=
 IRQ
banks, breaking all A733 GPIO interrupts?

When an interrupt fires on A733, sunxi_pinctrl_irq_handler() loops over the
logical IRQ bank indices (0 to 9) and calls sunxi_irq_status_reg_from_bank(=
pctl, bank).

However, the layout logic directly multiplies by the logical bank index:

drivers/pinctrl/sunxi/pinctrl-sunxi.h:sunxi_irq_base_reg() {
    ...
    if (pctl->flags & SUNXI_PINCTRL_NCAT3_REG_LAYOUT)
        return pctl->bank_offset + bank * pctl->bank_mem_size +
               A733_IRQ_REGS_OFFSET;
    ...
}

For the first IRQ bank (PB, logical index 0), this calculates the offset for
physical bank 0 (PA). PA has no pins and no interrupts. The physical regist=
ers
for PB are at physical bank index 1. Because the mapping is bypassed, doesn=
't
this cause the handler to read from the non-existent PA IRQ registers inste=
ad
of PB?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260910133519.4590=
11-1-andre.przywara@arm.com?part=3D7
