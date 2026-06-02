Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAD503D34A1
	for <linux-sunxi@lists.linux.dev>; Tue,  2 Jun 2026 11:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780400526; cv=none; b=db1suUKoV1fkuI/w/pJw4XzZH4y32io1Z3FT8VA3PiVq4XNZBnnmwEkoTDXLJNm8cQKBDGiDBVKnYkbUzVpMDPRw25DXS5UdB2QSvJA5vM4oizN3jiRVfyx2sBrF2w2GmasDi7DpsekhQRxzHrybomTt3idn8FfdeJ/oSLr4O1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780400526; c=relaxed/simple;
	bh=rd+HhsuYRLyd0Nnr4jOpYQbcnjR5veVCJY5nB6NT2cw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=h3CeMNt1odUoajU0CjAPieHOD0gwYvyYz225MoD+ubyLTX7N7g7mcx5NUGmye5Bi7IhdJxkn03ylGrmvotM4TYdyN5tT1bxSncqrmHbMsSZWV2O84UaPteq9ZVgw+nEbq0jGcnV2JcVslu8b94kP8Yo3TQMtNjhRUjUvTkaVpGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AtMq+oAj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AtMq+oAj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A4EF1F00893;
	Tue,  2 Jun 2026 11:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780400522;
	bh=B5/mwnhmtDBQcOZUQwO7FbGnSczws7jvD1zGg61DcEQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AtMq+oAjiy3tznCFnMiUIb74kzqnYDKqqxwFSqPeTtIvZoaVfX8h17P0PBLzSeIQw
	 unWZ2pXI30uFhRxRJyZltMxWw/sx9kxHRgZB6z6vWRFc1V6ILbsA2IjOAPfOiwHdGA
	 tiPLOZD1s8Nd3RA+TKLR21ODf/YO0OOu2fLgMNrm2JkuUppx9cl4/xI23LwaLdASDq
	 Gzs7XDs73l0Bct5b+zRR80SMaMbRYB/pixyd3+Lm8Tq6hSH5+xC7i1B/Fgjan7nB7P
	 wck1sZZ+xXpGDaP6Y56RaHlTadayk9ZZlBQr8yoODMOQkIo7oe3kACCKgdK6LrOOop
	 wLgiprvUH7Zaw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] ASoC: sunxi: sun50i-dmic: Reorder clock enable
 sequence
Reply-To: sashiko-reviews@lists.linux.dev
To: phucduc.bui@gmail.com
Cc: linux-sunxi@lists.linux.dev
In-Reply-To: <20260602113136.49494-1-phucduc.bui@gmail.com>
References: <20260602113136.49494-1-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 02 Jun 2026 11:42:02 +0000
Message-Id: <20260602114202.8A4EF1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] ALSA kcontrols can be accessed while the device is runtime suspend=
ed, leading to an external abort or system hang.
- [High] The driver manually disables runtime PM and suspends the hardware =
in remove() before devm unwinding unregisters the ASoC component, leading t=
o potential MMIO accesses to unclocked registers and a kernel panic.
- [High] Missing reset_control_assert() on probe error paths and in driver =
removal.
--

commit da5361e2c9ff102ecac5566a7b33923066b10fbd
Author: bui duc phuc <phucduc.bui@gmail.com>

ASoC: sunxi: sun50i-dmic: Reorder clock enable sequence

Reorder the runtime resume clock enable sequence to match the hardware
dependency and ensure symmetry with the suspend path.
The bus clock drives the register interface and must be enabled before
the DMIC module clock. This aligns the resume sequence to be the
exact reverse of the suspend sequence.

> diff --git a/sound/soc/sunxi/sun50i-dmic.c b/sound/soc/sunxi/sun50i-dmic.c
> index eddfebe166169..7aff1afdf265f 100644
> --- a/sound/soc/sunxi/sun50i-dmic.c
> +++ b/sound/soc/sunxi/sun50i-dmic.c
> @@ -323,16 +323,16 @@ static int sun50i_dmic_runtime_suspend(struct devic=
e *dev)
> =20
>  static int sun50i_dmic_runtime_resume(struct device *dev)
>  {
> -	struct sun50i_dmic_dev *host  =3D dev_get_drvdata(dev);
> +	struct sun50i_dmic_dev *host =3D dev_get_drvdata(dev);
>  	int ret;
> =20
> -	ret =3D clk_prepare_enable(host->dmic_clk);
> +	ret =3D clk_prepare_enable(host->bus_clk);
>  	if (ret)
>  		return ret;
> =20
> -	ret =3D clk_prepare_enable(host->bus_clk);
> +	ret =3D clk_prepare_enable(host->dmic_clk);
>  	if (ret) {
> -		clk_disable_unprepare(host->dmic_clk);
> +		clk_disable_unprepare(host->bus_clk);
>  		return ret;
>  	}
> =20

[Severity: High]
This is a pre-existing issue, but can the ALSA volume controls be accessed
while the device is runtime suspended?

The regmap configuration does not enable runtime PM:

static const struct regmap_config sun50i_dmic_regmap_config =3D {
	.reg_bits =3D 32,
	.reg_stride =3D 4,
	.val_bits =3D 32,
	.max_register =3D SUN50I_DMIC_VERSION,
	.cache_type =3D REGCACHE_NONE,
};

If a user application manipulates the exposed kcontrols in
sun50i_dmic_controls() while the audio stream is inactive, the device will =
be
in the RPM_SUSPENDED state with the bus clock disabled.

Since regmap will attempt an MMIO access on an unclocked peripheral without
waking it up, does this cause a synchronous external abort?

[Severity: High]
This is a pre-existing issue, but does sun50i_dmic_remove() create a race
condition with the devres teardown?

In sun50i_dmic_probe(), the ASoC component is registered using the devm API:

	ret =3D devm_snd_soc_register_component(&pdev->dev, &sun50i_dmic_component,
					      &sun50i_dmic_dai, 1);

However, sun50i_dmic_remove() manually suspends the hardware and turns off
the clocks before the component is unregistered:

static void sun50i_dmic_remove(struct platform_device *pdev)
{
	pm_runtime_disable(&pdev->dev);
	if (!pm_runtime_status_suspended(&pdev->dev))
		sun50i_dmic_runtime_suspend(&pdev->dev);
}

If the driver is unbound while an audio stream is actively running, the
clocks will be disabled first. Later, during devres unwinding, the ALSA
core tears down the stream and invokes sun50i_dmic_trigger() with
SNDRV_PCM_TRIGGER_STOP.

Will the regmap_update_bits() calls in the trigger callback attempt to
access unclocked hardware and cause a kernel panic?

[Severity: High]
This is a pre-existing issue, but is there a missing reset assertion during
driver removal or probe failure?

In sun50i_dmic_probe(), the reset line is deasserted:

	host->rst =3D devm_reset_control_get_optional_exclusive(&pdev->dev, NULL);
	if (IS_ERR(host->rst))
		return dev_err_probe(&pdev->dev, PTR_ERR(host->rst),
				     "Failed to get reset.\n");
	reset_control_deassert(host->rst);

However, I don't see a corresponding reset_control_assert() in the
error paths of probe, nor in sun50i_dmic_remove().

Does this leave the IP block actively running out of reset across driver
unbinds or re-probes, potentially causing logic errors or audio capture
failures on subsequent driver reloads?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260602113136.4949=
4-1-phucduc.bui@gmail.com?part=3D1
