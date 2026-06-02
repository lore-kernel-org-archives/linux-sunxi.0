Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF1813ED5D0
	for <linux-sunxi@lists.linux.dev>; Tue,  2 Jun 2026 12:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780402556; cv=none; b=qWCPvD5YXLsDgWjj7pNe8Ato9+eZIkYjLU98RCrJDVWj0ZCqlR4PD2eOmtcYBmnljNUUvBN7Ae0Fe2TFXOxWBKs3rmxeJPWznrGIFxAWIfVUyVicfNgEXe9QGh1Heg5fMpp0xbHmQs2mca7jQI+2JvR6xrt3a7UiooK3KOUgEMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780402556; c=relaxed/simple;
	bh=JPUE8prVLk2JCN92Zh3p4GDzNwryvvHr41x7BAHtDJM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NnHQGGqgGxoEX/0zooR+igFggORnzUx5SCcJ1gJHQaO126SmRYE+aJrhVAo7Q92cx2dCnEcAXRRr2PJxOWiZWn9QYxdKsrvPDn6YuGwLI98vZjXQeQI3syMpfx5tbShBupt+EoXtOFhhvjO5rdFibmZ4rqJz1WRyjGFLCEknuCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ABW7fhdo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ABW7fhdo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 861081F00893;
	Tue,  2 Jun 2026 12:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780402554;
	bh=/GE2E3HOm0I/clzJyu7ZEm3l2FhTfFNyl4pQ0JMSAFs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ABW7fhdon7Epgw37bt6QAbbsRZmR2Q9R6cAMHY28jNBqdTMiAd3Yt979M87hnB0FH
	 Yp1rRP7emRWqRle11n6MQvxB7JrEo+KIu0AXfAfRbVj1PbUGUgfiSe8cFwfp2C4uxx
	 8xmoPcP00ohYqtJ5DLaL2AS9gyWuAfWyp9mrtS1D6AZW/LeUUuovloRWlweI5XrFzE
	 RPFVwm/sTw6E6zTe6/AundGxGsyFjc2obFMUQbFBwsXNwE5Q/0DB9nBGV53FQgMjX/
	 4qvKbOFepMh2clOvTPO28G3mcHA0AZIb6KGB0jyX0kwunLEeYh57vnH8yynW36V133
	 hAyCxr6XX6BWQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/3] ASoC: sunxi: sun4i-spdif: Reorder clock enable
 sequence
Reply-To: sashiko-reviews@lists.linux.dev
To: phucduc.bui@gmail.com
Cc: linux-sunxi@lists.linux.dev
In-Reply-To: <20260602114437.50324-4-phucduc.bui@gmail.com>
References: <20260602114437.50324-4-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 02 Jun 2026 12:15:54 +0000
Message-Id: <20260602121554.861081F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Unbinding the driver while an audio stream is active will cause a =
fatal bus fault because hardware is suspended before the ASoC component is =
unregistered.
--

commit 811edbc583bdf36ef4938bd44bba42ed394e19bd
Author: bui duc phuc <phucduc.bui@gmail.com>

ASoC: sunxi: sun4i-spdif: Reorder clock enable sequence

Reorder the runtime resume clock enable sequence to match the hardware
dependency and ensure symmetry with the suspend path.
The APB bus clock drives the register interface and must be enabled before
the functional module clock. This aligns the resume sequence to be the
exact reverse of the suspend sequence.

> diff --git a/sound/soc/sunxi/sun4i-spdif.c b/sound/soc/sunxi/sun4i-spdif.c
> index f54eb14c9ed86..102db1a2afbb8 100644
> --- a/sound/soc/sunxi/sun4i-spdif.c
> +++ b/sound/soc/sunxi/sun4i-spdif.c
> @@ -643,15 +643,15 @@ static int sun4i_spdif_runtime_suspend(struct devic=
e *dev)
> =20
>  static int sun4i_spdif_runtime_resume(struct device *dev)
>  {
[ ... ]
> -	ret =3D clk_prepare_enable(host->spdif_clk);
> -	if (ret)
> -		return ret;
>  	ret =3D clk_prepare_enable(host->apb_clk);
>  	if (ret)
> -		clk_disable_unprepare(host->spdif_clk);
> +		return ret;
> +	ret =3D clk_prepare_enable(host->spdif_clk);
> +	if (ret)
> +		clk_disable_unprepare(host->apb_clk);
> =20
>  	return ret;
>  }

[Severity: High]
This isn't a bug introduced by this patch, but unbinding the driver while an
audio stream is active can cause a fatal bus fault.

Looking at sun4i_spdif_remove(), it manually disables PM and suspends the
hardware:

sun4i_spdif_remove() {
    pm_runtime_disable(&pdev->dev);
    if (!pm_runtime_status_suspended(&pdev->dev))
        sun4i_spdif_runtime_suspend(&pdev->dev);
}

Because devres unregisters the ASoC component after sun4i_spdif_remove()
returns, the ALSA core responds to the unregistration by tearing down the
active stream. This invokes callbacks like sun4i_spdif_trigger() with
SNDRV_PCM_TRIGGER_STOP:

sun4i_spdif_trigger() {
    case SNDRV_PCM_TRIGGER_STOP:
    ...
        sun4i_snd_txctrl_off(substream, host);
        break;
}

This tries to write to the device registers via regmap to disable
transmission. Since the APB bus clock was already disabled in
sun4i_spdif_remove(), accessing the registers causes a Data Abort and panics
the kernel.

Could the PM teardown be managed using devm_add_action_or_reset(), register=
ed
immediately after pm_runtime_enable() and before component registration, to
ensure the ASoC component is fully unregistered before the clocks are turned
off?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260602114437.5032=
4-1-phucduc.bui@gmail.com?part=3D3
