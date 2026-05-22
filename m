Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C1923AD534
	for <linux-sunxi@lists.linux.dev>; Fri, 22 May 2026 10:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779445796; cv=none; b=b26nbhCqTlixAi12VlW/WGqM2t3EZIoHfPgKK65fTSqkJoAzoBf8LB6i5NQRRdPw+gjMIwQy+fkoTTLrHrTfOTHPNJnwQqsHQg7rT840B+EUKMm403jrlT05LTcJTVgykP7cQBRuJsZRtlo6ah3L4t07jV7JfDZ3CoshyGtLqlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779445796; c=relaxed/simple;
	bh=Pd2BSLWOMZPxHRzTygjj53qHXP9Bqp3b/SC8BDBlrSc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Gv+eFwEjg1JL0qPyUsZ1ewOqwzEnHDK8oYxxal8vwJ/kViLJqZB/upbJ6Z75dHbLYlYnQ1lJ3Dpn1lhEiLAdgn536SkOvFZqaTSgfG4A3+dTL+0HjtTo0/MJd+OVQAITsv9zLpqU4EaZ33kSzO9J6g3FmaV8+DnLOVPJ9pvAUeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l9WqsQct; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l9WqsQct"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABAF31F000E9;
	Fri, 22 May 2026 10:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779445793;
	bh=rH80JY932TltaFNRwRhf9Cdczq16wUcJT4xUwr7W3i8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=l9WqsQctfthmmgm03MsR4RK0spyJSC+hDjVIrwq2WZH92Ddu/AcAKJ6zLq+ZDoeVH
	 9GXJQqF0DKrwzbHi3ncVYucJ20k7qlhoN3CsuE9ied4MdFIYYEXLPx1XF12Vk4Xq7P
	 0yA0t/Hzip42HClmFUnTbWV8F8pTPj9kfrMLiNuL8rMIVctcWdn2m9o0jaeZsHtSPV
	 bLl/KYsVDCtMDwHK0I3DPbERgjJ7IHjKU0AgMFSQUbSttP8fHfDp12SAePe0MNpgVN
	 tQZ0iYpalvygM/718D9t/+xzXJ354pR7HiiVJWTSaeGQ/SAvjys0CaO7w1JVxypJLO
	 T9a0x2g8UWz0A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] ASoC: sunxi: sun50i-dmic: Reorder clock enable sequence
Reply-To: sashiko-reviews@lists.linux.dev
To: phucduc.bui@gmail.com
Cc: linux-sunxi@lists.linux.dev
In-Reply-To: <20260522095539.73025-1-phucduc.bui@gmail.com>
References: <20260522095539.73025-1-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 22 May 2026 10:29:52 +0000
Message-Id: <20260522102953.ABAF31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Accessing ALSA kcontrols while the device is runtime-suspended acc=
esses a clock-gated register, causing a kernel crash.
- [High] The device's clocks are forcibly disabled in `remove()` while the =
ALSA component and DMA engine are still registered via devm, leading to a f=
atal bus stall.
--

commit a2de4dccc46594516d45763773f941f5ded67db8
Author: bui duc phuc <phucduc.bui@gmail.com>

ASoC: sunxi: sun50i-dmic: Reorder clock enable sequence

Enable the bus clock before the DMIC module clock during runtime resume.
The bus clock provides the register access interface and should be enabled
before the module clock.

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
This isn't a bug introduced by this patch, but since we are modifying the
runtime resume clock sequence, does this driver allow userspace to access
clock-gated registers when the audio stream is idle?

The driver defines ALSA volume controls (like sun50i_dmic_controls) that
map directly to hardware registers. The regmap configuration uses
REGCACHE_NONE and does not set .pm_runtime =3D true.

Since regmap accesses go directly to the hardware without using
pm_runtime_get_sync() in the control .get/.put handlers, reading or writing
a volume control from userspace when the device is runtime suspended would
access the DMIC registers while bus_clk is disabled. Will this trigger an
asynchronous external abort or bus error and crash the kernel?

[Severity: High]
This is a pre-existing issue, but the device's clocks appear to be forcibly
disabled in remove() while the ALSA component and DMA engine are still
registered.

The ALSA component and DMA engine are registered using
devm_snd_soc_register_component() and devm_snd_dmaengine_pcm_register(), so
they are unregistered after the sun50i_dmic_remove() callback returns.

However, sun50i_dmic_remove() manually disables the clocks:

static void sun50i_dmic_remove(struct platform_device *pdev)
{
	pm_runtime_disable(&pdev->dev);
	if (!pm_runtime_status_suspended(&pdev->dev))
		sun50i_dmic_runtime_suspend(&pdev->dev);
}

If a PCM stream is active during unbind, will the running DMA controller or
subsequent stop triggers during component unregistration attempt to access
the now clock-gated DMIC registers and cause a system crash?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260522095539.7302=
5-1-phucduc.bui@gmail.com?part=3D1
