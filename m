Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86E793D649C
	for <linux-sunxi@lists.linux.dev>; Fri, 22 May 2026 11:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779448959; cv=none; b=Ew4blN/F9pzuvVrJYGlWLgnhA04V+nfUheqp0TIi8bEu9EfMiuHF5JBMPmcsuaLUcJC7IV58IDgr84rCntjVkfPLqDCFI0FmxD4DdixNrnmpu35lHQ9mNqjbpvaY2a6hyxx6goT0FTGoTV4RHzCMWJ3O7QhPvMO/F33/Pu09AkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779448959; c=relaxed/simple;
	bh=w1Npedg62T/NxaQX2aQEYx7H/3c4rlsc6/ygY0yXbu4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Ip9t5IQDKLfkirSS3mzGWvxTCNmAX4kVTDeLOqwOdGwZuSGkeUv4e/08C8Agp8VJ58ZZ+Q665IZy1dyyta5ChXYpxM7OAOww6pqPl8KkkF5kN6WeXuAsGMLNHbjsafHxQ8utT749yFb6gkJg6eXxrIcPFI+TyMfXc9f5vzumBqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KjL53GIb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KjL53GIb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB4F31F000E9;
	Fri, 22 May 2026 11:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779448958;
	bh=LKAq/AK+gLoSElyAhqV6wSDMzf2HZJqT7m+RKPLkRrs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KjL53GIb8DbYfWfgW9/hWzW9KT+PQplJ5Qn8kEURVCVkUx10TYBeqtOCoTpjb/ORO
	 rRl3DU8c2qQzq9osDcOqtwx8TgCd8tA3jevhTywAdOCUPctGo1ti0vxeZ0nQIajEOD
	 XyOH+pm+0gqmB1Jd6LxweaDo811cX4jKeE1p1eHHUvbrM3qzUM0p9NXcgo7C+DB33v
	 znMnFyac53ZscLZlUjO2CMU+UUdZmSPkf2SAu7d1nGYsrBIZkTmbYRBAs/rPRH1ZT8
	 BJzENGgOwYvQMIB/oRzUNYs1ZtqtxfOABwue7EXsqfqX52DN5D7BKSfy5M8NnqSu8Z
	 K05PPJvnsXIcw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] ASoC: sunxi: sun4i-spdif: Reorder clock enable
 sequence
Reply-To: sashiko-reviews@lists.linux.dev
To: phucduc.bui@gmail.com
Cc: linux-sunxi@lists.linux.dev
In-Reply-To: <20260522095401.72915-4-phucduc.bui@gmail.com>
References: <20260522095401.72915-4-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 22 May 2026 11:22:37 +0000
Message-Id: <20260522112237.AB4F31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but the devres clean=
up order for ALSA components triggers a kernel crash during module unload o=
r driver unbind.
- [High] This problem wasn't introduced by this patch, but the driver incor=
rectly handles the 3-byte audio format `SNDRV_PCM_FORMAT_S20_3LE`, causing =
severe audio corruption.
--

commit 1f13dc88fc812744e12c7e297ac44bb8e304a727
Author: bui duc phuc <phucduc.bui@gmail.com>

ASoC: sunxi: sun4i-spdif: Reorder clock enable sequence

This commit reorders the clock enable sequence during runtime resume.
It enables the APB bus clock before the SPDIF module clock to ensure
register accesses do not fail.

> diff --git a/sound/soc/sunxi/sun4i-spdif.c b/sound/soc/sunxi/sun4i-spdif.c
> index f54eb14c9ed86..102db1a2afbb8 100644
> --- a/sound/soc/sunxi/sun4i-spdif.c
> +++ b/sound/soc/sunxi/sun4i-spdif.c
> @@ -643,15 +643,15 @@ static int sun4i_spdif_runtime_suspend(struct devic=
e *dev)
[ ... ]
>  static int sun4i_spdif_runtime_resume(struct device *dev)
>  {
> -	struct sun4i_spdif_dev *host  =3D dev_get_drvdata(dev);
> +	struct sun4i_spdif_dev *host =3D dev_get_drvdata(dev);
>  	int ret;
> =20
> -	ret =3D clk_prepare_enable(host->spdif_clk);
> +	ret =3D clk_prepare_enable(host->apb_clk);
>  	if (ret)
>  		return ret;
> -	ret =3D clk_prepare_enable(host->apb_clk);
> +	ret =3D clk_prepare_enable(host->spdif_clk);
>  	if (ret)
> -		clk_disable_unprepare(host->spdif_clk);
> +		clk_disable_unprepare(host->apb_clk);

[Severity: High]
This isn't a bug introduced by this patch, but the devres cleanup order for
ALSA components appears to trigger a kernel crash during module unload or
driver unbind.

In sun4i_spdif_probe(), the ALSA component and DMA engine are registered via
devm_snd_soc_register_component() and devm_snd_dmaengine_pcm_register().
The devres teardown runs after the driver's sun4i_spdif_remove() function
returns.

However, sun4i_spdif_remove() explicitly calls pm_runtime_disable() and
sun4i_spdif_runtime_suspend(), which disable the apb_clk bus clock.

When the devres teardown later unregisters the ASoC component, it forces any
active PCM streams to stop, invoking sun4i_spdif_trigger() with
SNDRV_PCM_TRIGGER_STOP. This calls sun4i_snd_txctrl_off(), which writes to
hardware registers via regmap.

Because the APB clock has already been disabled by the remove function, do
these regmap accesses hit unclocked hardware and result in a synchronous
external abort (kernel panic) on sunxi platforms?

[Severity: High]
This is a pre-existing issue, but does the driver incorrectly handle the
3-byte audio format SNDRV_PCM_FORMAT_S20_3LE, causing severe audio
corruption?

The driver advertises support for SNDRV_PCM_FMTBIT_S20_3LE in SUN4I_FORMATS,
which means 20-bit audio samples are tightly packed into exactly 3 bytes in
memory.

However, in sun4i_spdif_hw_params(), the DMA slave bus width
(dma_params_tx.addr_width) is left at DMA_SLAVE_BUSWIDTH_4_BYTES for this
format. This configures the dst_addr_width of the DMA controller to 4 bytes.

In the ALSA generic DMA engine code and sunxi-dma driver, the undefined
src_addr_width defaults to match the 4-byte destination width.

Because the memory buffer contains tightly packed 3-byte samples, does
commanding the DMA controller to perform 4-byte memory reads misalign the
stream immediately (reading part of the next sample on every fetch), leading
to complete data corruption and unusable audio output?

> =20
>  	return ret;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260522095401.7291=
5-1-phucduc.bui@gmail.com?part=3D3
