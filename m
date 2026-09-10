Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B98C837DE84;
	Thu, 10 Sep 2026 14:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789049761; cv=none; b=KRvNjBx4ufS98GfOjLy5wXniziVnug/2BOR9sjQc1zEZJKRwFXmCkNCgdfDPVs2A2agsaxwQf2br5ymPnvOhkwrT5675RZKPd9fbxJSKucx6Cfx3WCidIqi9aYQPGH2nNqpAnDA6UCJdQSQPkdLsHvfHqm1rMeUFhgujtygKl24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789049761; c=relaxed/simple;
	bh=NGknmsiTUNy76NnNSY6/J4LMDSoVi5VvWa9Y19mr2XU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=iZNt7o0XXq/sNmsHToSdJ6e3wIFMVgsq/rbnZZqHH6pKgCe0GPA5GmjwCIiR7MTsCtgzVspxST7J3eiTEYXj1r5uVvc+qcAFugqaMREIA7Ra2iIrTiRi6NIZr6IA9mOPm1pZ/V0f8F0t+AuQQ/4gQ/VnVjOjljjvEyAha35NRP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gESt60ah; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gESt60ah"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53BB91F000FF;
	Thu, 10 Sep 2026 14:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789049759;
	bh=8e1wqp4LmaFk8k9rzuJpCvedtwf/1AvJl5p0APNi+3U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gESt60ah5/yXZxyjepZF0pmpnJpoIlFYFkvp8yrXMCzIMaaicvtmvQXx8DnyyV5Vq
	 wdUaTwVcaNKrwvSv7qpMu6TI2qXGg/3LxO4H5gPmw0Z+iCqxI+NWKGbnx0SfM/xePA
	 6eswJr0ViH1FT1HYnlbClJYwF2rvp3lqSNe8fawbp+cPcr3F7bHJcAnJqoeN7SjxaY
	 EWGd/YP+NWpWXBisSVzwnyY4gCMBgUNKvW1Z2O2cweAPV4jqp3DWi4wmUl4v+0At85
	 NR86PQrYen13vWvArOTKRvO80xVy9K//fb6dHB/RDM5Oe39XiyFXrLnaMlASR4ik/W
	 3jJDprAHxsWBA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 6/7] pinctrl: sunxi: a523-r: add a733-r compatible
 string
Reply-To: sashiko-reviews@lists.linux.dev
To: "Andre Przywara" <andre.przywara@arm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, linux-sunxi@lists.linux.dev
In-Reply-To: <20260910133519.459011-7-andre.przywara@arm.com>
References: <20260910133519.459011-1-andre.przywara@arm.com>
 <20260910133519.459011-7-andre.przywara@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 14:15:58 +0000
Message-Id: <20260910141559.53BB91F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but the static `desc=
->npins` counter accumulates on probe deferral, causing out-of-bounds array=
 reads with negative indices.
--

commit 0f0363ee56222ed4bd5f82e32e391a15a8e11f99
Author: Andre Przywara <andre.przywara@arm.com>

pinctrl: sunxi: a523-r: add a733-r compatible string

Adds the allwinner,sun60i-a733-r-pinctrl compatible string to the A523-r
pinctrl driver. The driver is reused for the A733-r IP since it shares a
similar two-bank layout, with specific pinmux values provided by the DT.

> diff --git a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c b/drivers/pinc=
trl/sunxi/pinctrl-sun55i-a523-r.c
> index 9e07fbb5be7cb..dfdcfa740ecc9 100644
> --- a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c
> +++ b/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c
> @@ -40,6 +40,7 @@ static int a523_r_pinctrl_probe(struct platform_device =
*pdev)
> =20
>  static const struct of_device_id a523_r_pinctrl_match[] =3D {
>  	{ .compatible =3D "allwinner,sun55i-a523-r-pinctrl", },
> +	{ .compatible =3D "allwinner,sun60i-a733-r-pinctrl", },

[Severity: High]
This isn't a bug introduced by this patch, but does the static desc->npins
counter accumulate on probe deferral, causing out-of-bounds array reads with
negative indices?

When the driver is probed, it passes the statically allocated
a523_r_pinctrl_data to sunxi_pinctrl_dt_table_init().

In drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c:init_pins_table():

	for (i =3D 0; i < SUNXI_PINCTRL_MAX_BANKS; i++) {
		desc->npins +=3D pins_per_bank[i];

If the probe fails later (e.g., -EPROBE_DEFER), desc->npins is not reset.
On the next probe, it increments again, allocating a larger array but only
initializing the first valid elements.

Then prepare_function_table() iterates up to the accumulated desc->npins:

	for (i =3D 0; i < npins; i++) {
		struct sunxi_desc_pin *pin =3D &pins[i];
		int bank =3D (pin->pin.number - pin_base) / PINS_PER_BANK;

		if (irq_bank_muxes[bank]) {

For uninitialized pins, pin->pin.number is 0. With a pin_base like 352
(PL_BASE), the bank index becomes (0 - 352) / 32 =3D -11. This results
in an out-of-bounds access irq_bank_muxes[-11].

Furthermore, searching for a non-existent DT pin name will scan into the
uninitialized elements, calling strcmp(NULL, name) and potentially panicking
the kernel.

>  	{}
>  };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260910133519.4590=
11-1-andre.przywara@arm.com?part=3D6
