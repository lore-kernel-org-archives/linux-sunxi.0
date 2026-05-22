Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F5C1343899
	for <linux-sunxi@lists.linux.dev>; Fri, 22 May 2026 10:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779447579; cv=none; b=MIWirXU9Bz7J6q+xL7ss0dHrVMzMoNM0stwnvLE3yXGQoAkVJZwQDgYOHiKGwDWJoEnmPRLXDDzhQUGA4TdIYhqrbddaLtpT9Dikq2URVU69FaayDg/Yo44oWUPjnDk+k9Gc0N6AIVKsumejUq80jqDOfE1GArCIPifNgM2cY+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779447579; c=relaxed/simple;
	bh=czenvjLDpniuP32/NCKrDYcIoPBZvubiSP9JaxL2LZI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Gc1s97VHSD1K59tMWRn6exqJURKGMZWJVKpVVsZQi2jY6ouXuNm3D/MvmdZOm82Dd+Fmw0f38BWvcuIUcup5IB8UBVPnB7DoJpVDblKawkr2RvV61Fuvpouy4/+OXLKdkBl5GDmr3ZcZXrUM4/BXymeOJeVuSelsUtFY1CPpKIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=az/Nc8lf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="az/Nc8lf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3C2B1F000E9;
	Fri, 22 May 2026 10:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779447577;
	bh=n8qgEIDcSbUHJv7sPjBQji2qCf9VGKCwUHfNn6goOak=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=az/Nc8lfGL69qHo7scqlbu7PgsSYVvZp328IDN+JJwo1qay260tF8yjXEtqlIDps5
	 zsqB7G1e+VN6s6Lk+RwTZcm78k1jxMEYRYxVNT1Vs0JFYg4K4vlB9xS0F1eKGe17tM
	 NZrsIcQa1aaXCOrOic3IK5w7ZXJq+F238cUl+XL3O1qIoCbPF9SRSfRRqR1s77MsWL
	 EmE2vocxfprwMjYwaAjvC5C/6eGqNTLWcN0bGcAz3rQPF1O7ICpkxiIZgA85WFcza6
	 3HLRESH0M/GW+yadOjnoiA1Q/STMAmbhIWWRvwpzgxFWonruf6otL7iQ6eNc4Rq5L7
	 qJjP6Nbp3GmKA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/3] ASoC: sunxi: sun4i-spdif: Resume device before
 kcontrol register access
Reply-To: sashiko-reviews@lists.linux.dev
To: phucduc.bui@gmail.com
Cc: linux-sunxi@lists.linux.dev
In-Reply-To: <20260522095401.72915-3-phucduc.bui@gmail.com>
References: <20260522095401.72915-3-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 22 May 2026 10:59:36 +0000
Message-Id: <20260522105936.B3C2B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Uninitialized stack memory is copied to userspace when regmap_read=
() fails in sun4i_spdif_get_status().
- [High] IEC958 status bits configured via ALSA kcontrols are unconditional=
ly overwritten by hw_params.
--

commit 564921e7b2898d3b9cb384871d5d927721ed7c42
Author: bui duc phuc <phucduc.bui@gmail.com>

ASoC: sunxi: sun4i-spdif: Resume device before kcontrol register access

Accessing registers while the device is runtime-suspended may lead to inval=
id
hardware accesses. Ensure the device is resumed before accessing registers.

> diff --git a/sound/soc/sunxi/sun4i-spdif.c b/sound/soc/sunxi/sun4i-spdif.c
> index 89eccc83a1301..f54eb14c9ed86 100644
> --- a/sound/soc/sunxi/sun4i-spdif.c
> +++ b/sound/soc/sunxi/sun4i-spdif.c
> @@ -428,6 +428,11 @@ static int sun4i_spdif_get_status(struct snd_kcontro=
l *kcontrol,
>  	struct sun4i_spdif_dev *host =3D snd_soc_dai_get_drvdata(cpu_dai);
>  	u8 *status =3D ucontrol->value.iec958.status;
>  	unsigned int reg;
> +	int ret;
> +
> +	ret =3D pm_runtime_resume_and_get(cpu_dai->dev);
> +	if (ret)
> +		return ret;
> =20
>  	scoped_guard(spinlock_irqsave, &host->lock) {
>  		regmap_read(host->regmap, SUN4I_SPDIF_TXCHSTA0, &reg);

[Severity: High]
This isn't a bug introduced by this patch, but does this code copy uninitia=
lized
stack memory to userspace if regmap_read() fails?

The return value of regmap_read() isn't checked here. If it fails, reg rema=
ins
unmodified, containing whatever was on the kernel stack. The code then copi=
es it
directly into status, which is part of the snd_ctl_elem_value structure
returned to userspace.

>  		status[0] =3D reg & 0xff;
>  		status[1] =3D (reg >> 8) & 0xff;
>  		status[2] =3D (reg >> 16) & 0xff;
>  		status[3] =3D (reg >> 24) & 0xff;

[ ... ]

> @@ -453,8 +460,13 @@ static int sun4i_spdif_set_status(struct snd_kcontro=
l *kcontrol,
>  	struct sun4i_spdif_dev *host =3D snd_soc_dai_get_drvdata(cpu_dai);
>  	u8 *status =3D ucontrol->value.iec958.status;
>  	unsigned int reg;
> +	int ret;
>  	bool chg0, chg1;

[ ... ]

>  		reg =3D SUN4I_SPDIF_TXCFG_CHSTMODE;
>  		if (status[0] & IEC958_AES0_NONAUDIO)
>  			reg |=3D SUN4I_SPDIF_TXCFG_NONAUDIO;
> =20
>  		regmap_update_bits(host->regmap, SUN4I_SPDIF_TXCFG,
>  				   SUN4I_SPDIF_TXCFG_CHSTMODE |
>  				   SUN4I_SPDIF_TXCFG_NONAUDIO, reg);
>  	}

[Severity: High]
This is a pre-existing issue, but is the NONAUDIO bit set here unconditiona=
lly
overwritten later by sun4i_spdif_hw_params()?

It looks like sun4i_spdif_hw_params() builds a new register configuration f=
rom
scratch and uses regmap_write(host->regmap, SUN4I_SPDIF_TXCFG, reg_val). Th=
is
would destroy the NONAUDIO bit previously configured here by the user via
kcontrols, unless the stream has exactly 4 channels.

Can this break standard IEC958 passthrough (AC3/DTS) which uses 2 channels =
and
relies on the kcontrol to set the non-audio bit?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260522095401.7291=
5-1-phucduc.bui@gmail.com?part=3D2
