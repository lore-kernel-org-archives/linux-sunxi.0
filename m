Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA97B2264B0
	for <linux-sunxi@lists.linux.dev>; Tue, 19 May 2026 00:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779152004; cv=none; b=RIt4JtzInRESST56cOXKg4anOSew15L/3+3ihPmqqC6V1WZFOgLUkFHeZihymGBl6RTi2IPJQSxxhO4dUfPcwG1sls1M5tL9aRBtPZMB4pA8e31+aEuljalQ3Qi2nWTsiJRY8d0Rf+Xsbg/I4U2B5CBgyJr+hTdI5hv6PlqT/tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779152004; c=relaxed/simple;
	bh=SDmTQp0sZbffEHIOY63KMAF/FCFOCH4ItRBWXAdiJ+0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JS+kSIjX1ORyP1NlalY0si7FUGnfQa9cLOoy2dhSeVPqhbWxPvabLIZWIXp0nXTAkhYcsAoo9BKgI+Lh/UzSy0K8MoBS4NWnKu1vlJwj2N7Rr0Pfk/jRurwbrgAMYYiQpwhIXUHi/N6U2/pHYxR3rmlIaZX2yf40x1yZ2a/WpFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OG/ZAdPN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OG/ZAdPN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14A52C2BCB7;
	Tue, 19 May 2026 00:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779152004;
	bh=SDmTQp0sZbffEHIOY63KMAF/FCFOCH4ItRBWXAdiJ+0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=OG/ZAdPN2t/YaWhyf8ZLxVgceZUY6usWm42gbv2A5BpdP7io4L/E6iPB6uIRlGiMP
	 q2LeoKFHU8JCLdtTL1JFkfGCHnhexxiA7MsRZwuKXH0b4Rt0QT+yCvUVcz39XXn5wB
	 iuW78vpqkd8suIIw/5S5YJDiyExgg7A54kRXuuwuZXCVahLM4b2F0zql7L86+JWVd4
	 UARJh7F6GHCJYcB9SNFbd4PjFfmSDauXcFQhjKzwOm4z3WQHHDQ0S98P131yScES1O
	 M+8cqWZ7+Lp330fwItF+GASIzNphwASPM6j8gtrPHbosF+srSml247huGwgQLi1Egw
	 x4kqRP/czEr/w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] clk: sunxi-ng: Use of_device_get_match_data()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rosen Penev" <rosenp@gmail.com>
Cc: linux-sunxi@lists.linux.dev
In-Reply-To: <20260519003950.626727-1-rosenp@gmail.com>
References: <20260519003950.626727-1-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 May 2026 00:53:23 +0000
Message-Id: <20260519005324.14A52C2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Critical] Replacing of_match_device() with of_device_get_match_data() fe=
tches match data from the parent RTC driver, leading to an invalid pointer =
dereference and a kernel panic.
- [High] Bypassing the local CCU match table breaks device-specific configu=
ration and introduces dead code.
--

commit 64f27933b5ce1d6dc6bf932d297fcbf5ea1680b5
Author: Rosen Penev <rosenp@gmail.com>

clk: sunxi-ng: Use of_device_get_match_data()

This commit changes sun6i_rtc_ccu_probe() to use of_device_get_match_data()
instead of explicitly calling of_match_device() with sun6i_rtc_ccu_match.
This allows dropping the linux/of_device.h include.

> diff --git a/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c b/drivers/clk/sunxi-ng/=
ccu-sun6i-rtc.c
> index f6bfeba009e8e..a3cf0dde05bed 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
> +++ b/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c

[ ... ]

> @@ -353,14 +352,12 @@ int sun6i_rtc_ccu_probe(struct device *dev, void __=
iomem *reg)
>  {
>  	const struct sun6i_rtc_match_data *data;
>  	struct clk *ext_osc32k_clk =3D NULL;
> -	const struct of_device_id *match;
> =20
>  	/* This driver is only used for newer variants of the hardware. */
> -	match =3D of_match_device(sun6i_rtc_ccu_match, dev);
> -	if (!match)
> +	data =3D of_device_get_match_data(dev);

Does this cause an invalid pointer dereference?

Since sun6i_rtc_ccu_probe() is called by the main RTC driver in
drivers/rtc/rtc-sun6i.c, the dev passed here is bound to that driver. Calli=
ng
of_device_get_match_data(dev) retrieves the match data from the main RTC
driver's match table (sun6i_rtc_dt_ids), not the local sun6i_rtc_ccu_match
table.

The main RTC driver stores integer flags in its match data:

    .data =3D (void *)RTC_LINEAR_DAY

Will this result in the data pointer evaluating to an integer like 0x1?

Additionally, does bypassing the local CCU match table break device-specific
configurations?

The sun6i_rtc_ccu_match array contains specialized CCU parameters for devic=
es
like allwinner,sun55i-a523-rtc. Relying on the main RTC driver's match table
means the lookup will fall back to generic settings, such as those for the
r329, instead of applying the specific settings required for the a523.

Does removing the reference to sun6i_rtc_ccu_match also leave the array
entirely unused, turning it into dead code?

> +	if (!data)
>  		return 0;
> =20
> -	data =3D match->data;
>  	have_iosc_calibration =3D data->have_iosc_calibration;

If data points to an invalid address like 0x1, won't dereferencing it here
cause a kernel panic on newer SoCs?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260519003950.6267=
27-1-rosenp@gmail.com?part=3D1
