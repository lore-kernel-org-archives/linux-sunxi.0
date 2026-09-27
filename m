Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D968C3B19A3
	for <linux-sunxi@lists.linux.dev>; Sun, 27 Sep 2026 15:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790522818; cv=none; b=qvfRn58nVCWx8DuZCmyjFPMkCJVTsQv9SWc0tEIP5ssi4826Z5yrty7eCEkyQ0BKyoBzMbrIjVBcXIwWRcFuS0Vu3g2DGfp+Pq3E7bWN7KkIV9H+6qP3MVMqK/+ITdIFKscFO9sPRr5uW/QTYO3VIHBMQNpq6irDpBEq9aWXfs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790522818; c=relaxed/simple;
	bh=DKijqzzD9Xn3CsAq+tLXLIF0M1QkikDotJc/iwMNiQQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=I/jjWEyJ3G94G2IkxiattlgFdRIPOnk88oF0032TioTdD7WZB32zrBqPshXknfrQVq4ypqM1SxZmcmGYOFFUWDhmT0PP/t8WLeTQWIf+Wr5xY2LXNS94QPwI/WY10ebmWmd7WoZ2vS1FSGTWRnCGDrZBK3zrxH8fBbGVu9bBT6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NMkd90c7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NMkd90c7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76FE11F000FF;
	Sun, 27 Sep 2026 15:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790522814;
	bh=3HjpjYTamgXtx4mJNpnewX4u9gURINsVVj0kV95haAY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NMkd90c76h3nEPLKh2fgnYdf+8egPIy3GRjKJWXQFj5PKUdnJM1tG/gbHqH1ZshCn
	 tPojCUr091nHdci712nvtNFccXDVEYsHmae95/daDgSDJAgmUNaR/JVGgA3ffLeYgW
	 MipjtE7U33dBA7kR4k+Fvm16u3Xy4fIRmsWQGTeGxbBPWBB8m9HUY8K6OzJE6BBgwO
	 4VOjp3N/CiplI3RfoyNt95QqK50Rmd1NuWQwhtD6nmGHSO8kFjAcocd5XjcLBa+T0c
	 80PqJewlGuOCUmqypJy0KXwklBhNMq8s9oM1/XOWiIsww/MGelxi5JXEasb0n3szol
	 WlhUAJmhkATeg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 04/11] pinctrl: sunxi: add Allwinner B288 pin
 controller driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pablo Mazzini" <pmazzini@gmail.com>
Cc: linux-sunxi@lists.linux.dev
In-Reply-To: <20260927151016.186493-5-pmazzini@gmail.com>
References: <20260927151016.186493-1-pmazzini@gmail.com>
 <20260927151016.186493-5-pmazzini@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 27 Sep 2026 15:26:54 +0000
Message-Id: <20260927152654.76FE11F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] pinctrl: out-of-bounds access and corrupt IRQ mapping due to shift=
ed bank index
- [High] pinctrl: NULL pointer dereference on probe deferral due to global =
state leak
--

commit c211ae9972d97b1239a013dc4594d43764f7806c
Author: Pablo Mazzini <pmazzini@gmail.com>

    pinctrl: sunxi: add Allwinner B288 pin controller driver

This commit adds pin controller and GPIO support for the Allwinner B288
SoC. It defines 80 pins across ports B, C, D, F, and G, omitting port A
completely.

> diff --git a/drivers/pinctrl/sunxi/pinctrl-sun8i-b288.c b/drivers/pinctrl=
/sunxi/pinctrl-sun8i-b288.c
> new file mode 100644
> index 0000000000000..98dd4ead4c328
> --- /dev/null
> +++ b/drivers/pinctrl/sunxi/pinctrl-sun8i-b288.c
> @@ -0,0 +1,53 @@

[ ... ]

> +/* PH0 exists only on the BSP's FPGA platform and is omitted. */
> +static const u8 b288_nr_bank_pins[SUNXI_PINCTRL_MAX_BANKS] =3D
> +/*	  PA  PB  PC  PD  PE  PF  PG */
> +	{  0, 17, 15, 29,  0,  7, 12 };
> +
> +/* Port C has no external interrupts. */
> +static const unsigned int b288_irq_bank_map[] =3D { 1, 3, 5, 6 };
> +
> +static const u8 b288_irq_bank_muxes[SUNXI_PINCTRL_MAX_BANKS] =3D
> +/*	  PA  PB  PC  PD  PE  PF  PG */
> +	{  0,  6,  0,  6,  0,  6,  6 };

[Severity: High]
Does this pin layout trigger an out-of-bounds access and corrupt the IRQ
mapping?

Because bank PA has 0 pins, PB (bank 1) is the first bank processed. In
drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c:prepare_function_table(),
last_bank is initialized to 0. When PB is processed, bank > last_bank
(1 > 0) evaluates to true, which erroneously increments irq_bank to 1 for
the first bank instead of 0:

			if (bank > last_bank)
				irq_bank++;

This shifts all logical IRQ banks so PB gets irqbank=3D1, PD=3D2, PF=3D3, a=
nd
PG=3D4. Since b288_irq_bank_map only has 4 elements, processing PG (irqbank=
=3D4)
causes sunxi_irq_hw_bank_num() to read out of bounds.

Further, sunxi_pinctrl_build_state() will write out of bounds past the
end of pctl->irq_array:

	int irqnum =3D func->irqnum + func->irqbank * IRQ_PER_BANK;
	pctl->irq_array[irqnum] =3D pin->pin.number;

Since func->irqbank evaluates to 4 (which is >=3D desc->irq_banks), this
causes boot-time memory corruption and breaks IRQ routing for all pins.

> +static struct sunxi_pinctrl_desc b288_pinctrl_data =3D {
> +	.irq_banks	=3D ARRAY_SIZE(b288_irq_bank_map),
> +	.irq_bank_map	=3D b288_irq_bank_map,
> +};
> +
> +static int b288_pinctrl_probe(struct platform_device *pdev)
> +{
> +	return sunxi_pinctrl_dt_table_init(pdev, b288_nr_bank_pins,
> +					   b288_irq_bank_muxes,
> +					   &b288_pinctrl_data, 0);
> +}

[Severity: High]
Does passing this static global struct to the framework leak state on
probe deferral, leading to a NULL pointer dereference?

The b288_pinctrl_data struct is a static global passed to
sunxi_pinctrl_dt_table_init(). Inside init_pins_table(), desc->npins is
unconditionally incremented into the global state:

	desc->npins +=3D pins_per_bank[i];

If sunxi_pinctrl_init_with_flags() subsequently defers probe (e.g., waiting
for a clock or PMIC), desc->npins permanently retains the 80 count. On the
next probe attempt, desc->npins becomes 160.

This causes devm_kcalloc() to allocate 160 descriptors, but only the first =
80
are properly initialized with names. The trailing 80 elements retain NULL
pin.name pointers, which causes a crash during re-probe in
prepare_function_table() when iterating over the uninitialized elements:

				if (strcmp(pins[i].pin.name, name))
					continue;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260927151016.1864=
93-1-pmazzini@gmail.com?part=3D4
