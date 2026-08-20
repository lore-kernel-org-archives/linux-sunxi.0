Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85EA43C197A
	for <linux-sunxi@lists.linux.dev>; Thu, 20 Aug 2026 07:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787211333; cv=none; b=Aviv4ulgg7NPo1TMAIcKIP+cW84faqotvZ7zkiR3yErK6QgwekI/yd4hMGldvN4McVx9XgEdUN2taA1o4eYKHtFCM3ANJvhyIcPQYMoB50+wAtNhonOZk6VCDOPFGRWZzPnpZmoLvHlH+AmpNluvkTHp/gOuUVWU/M0vRMUv0os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787211333; c=relaxed/simple;
	bh=zTNNfyn7RDM8XmL1MPjMPleWEei2kLV10T4IOp2mndE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nO16km3l6OK7tg5tttFZ8AHM7FvKXFVkvIpliZPTvZlBTCEwUdBkXrRVuoFXA+jH5osM8PlQze+OCABX4XRvx8Pa8VY3cEieQp6jkKbJJRTbWPpib/msiaLKnTRLJvVMNdNKIGrIIFyzb3+ZU6qwNMwwnD6WYR2SnqqHHIxTToU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hxAp2oEM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hxAp2oEM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF8C91F000E9;
	Thu, 20 Aug 2026 07:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787211331;
	bh=x13MiALXPkVhwio4ZmxqDji16aP8Vpuqf4N5zy0Rf/0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hxAp2oEMinyCAyBMWNED58YgDVM5THhfcKp6K1t40LdP1jmYeeM8b23vaOQmBeYPn
	 STKcyYEGSIlbFSUT9GER3WpcX6AiaGxy846SYXaSrVDSnA2kHR0HhFqS9t3zBngfKK
	 wTnKZMKIiCcuz8YaYNoPmTr1m8uKwpMragD8tU4J//ZcXDUM64RZubM8a0JNT/RYq5
	 6Atafd3HSz/KTazcoW8Gqnj+irwCO21ugJ69ogZk6R+YQWHiC05eLKNdj/HN3hK7h0
	 fmiomNshfNogYvxxS6BE26ojXc0ko1rGKlgQ/XmJhZyMV13SHJtRYgHpnH1TDAC8My
	 JWFbl84LWjQvQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] PM / devfreq: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Triet Hoang" <triet.hoang.dev@gmail.com>
Cc: linux-sunxi@lists.linux.dev
In-Reply-To: <20260820072636.2049617-1-triet.hoang.dev@gmail.com>
References: <20260820072636.2049617-1-triet.hoang.dev@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 20 Aug 2026 07:35:30 +0000
Message-Id: <20260820073530.BF8C91F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The drivers incorrectly use `pm_sleep_ptr()` instead of `pm_ptr()` =
for assigning the `dev_pm_ops` structure pointer to the driver's `.pm` fiel=
d.
--

--- Patch [1]: [PATCH] PM / devfreq: Convert to DEFINE_SIMPLE_DEV_PM_OPS() =
---
commit a6ee24f192dd2bca22b18dedee330c5384183db0
Author: Triet Hoang <triet.hoang.dev@gmail.com>

PM / devfreq: Convert to DEFINE_SIMPLE_DEV_PM_OPS()

This commit converts the deprecated SIMPLE_DEV_PM_OPS to
DEFINE_SIMPLE_DEV_PM_OPS and drops __maybe_unused annotations. It also
updates the pm assignments to reduce kernel size when PM configs are
disabled.

> diff --git a/drivers/devfreq/rk3399_dmc.c b/drivers/devfreq/rk3399_dmc.c
> index dbdce7636ca5b..3ebc817fa6084 100644
> --- a/drivers/devfreq/rk3399_dmc.c
> +++ b/drivers/devfreq/rk3399_dmc.c
[ ... ]
> @@ -477,7 +477,7 @@ static struct platform_driver rk3399_dmcfreq_driver =
=3D {
>  	.remove =3D rk3399_dmcfreq_remove,
>  	.driver =3D {
>  		.name	=3D "rk3399-dmc-freq",
> -		.pm	=3D &rk3399_dmcfreq_pm,
> +		.pm	=3D pm_sleep_ptr(&rk3399_dmcfreq_pm),

[Severity: Low]
Should this use pm_ptr() instead of pm_sleep_ptr() for the structure pointe=
r?
According to PM subsystem guidelines, pm_sleep_ptr() is intended for sleep
callbacks, while pm_ptr() should be used for the dev_pm_ops structure point=
er
itself.

>  		.of_match_table =3D rk3399dmc_devfreq_of_match,
>  	},
>  };
> diff --git a/drivers/devfreq/sun8i-a33-mbus.c b/drivers/devfreq/sun8i-a33=
-mbus.c
> index 4bd5657558d6b..1636501c753ee 100644
> --- a/drivers/devfreq/sun8i-a33-mbus.c
> +++ b/drivers/devfreq/sun8i-a33-mbus.c
[ ... ]
> @@ -479,7 +479,7 @@ static struct platform_driver sun8i_a33_mbus_driver =
=3D {
>  	.driver	=3D {
>  		.name		=3D "sun8i-a33-mbus",
>  		.of_match_table	=3D sun8i_a33_mbus_of_match,
> -		.pm		=3D pm_ptr(&sun8i_a33_mbus_pm_ops),
> +		.pm		=3D pm_sleep_ptr(&sun8i_a33_mbus_pm_ops),

[Severity: Low]
Similar to the rk3399_dmc driver above, should this remain pm_ptr() for the
structure pointer instead of being changed to pm_sleep_ptr()?

>  	},
>  };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260820072636.2049=
617-1-triet.hoang.dev@gmail.com?part=3D1
