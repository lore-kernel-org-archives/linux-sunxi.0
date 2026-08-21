Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B4313FFFA5
	for <linux-sunxi@lists.linux.dev>; Fri, 21 Aug 2026 07:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787297046; cv=none; b=JHAQO6NlMxxaT7gN6R7H5mK5/k39DMHtDL/CNK/zpIkKvC6DzVMhbKOAWAqdVQOdhTxh5GJStW5IdOV3P9cTt/0oeXifk13ry+3FlBEAVzv46gHS7h3Oer1MRs3kMuZkgfulQBlJ9zOc3dD+6CbRh0MSBuMns8LV6qUxLo900dM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787297046; c=relaxed/simple;
	bh=ewQ6iyu7T9R3D1Lyms1mPFw5do7Qp8eUf1hh8ijWLtc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CTgw+uIDamki+MwXTgF2TEYYSjR4NIVP/L8dW4RYB7w2OTbfOWn+vDSspPJugepC/MhvTu5BBQJEyYq9fY02hJCiMGdbx5tbkZH6GB4XGFd2Wz8i9zpUk21EcOdSBcPaP9SVW6u+C39WIAeN8m6XRrrE1Zaf5OoJAwy/gXf+pCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MCS2d7ze; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MCS2d7ze"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5F001F000E9;
	Fri, 21 Aug 2026 07:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787297045;
	bh=+D+0qgBaAp4Lhw/H/2MaR9l6LVKXMe7xTX1Wu+7ofBQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MCS2d7zeLkq8f/BYkkLuOH7lsKtxZw0fVezKYEGaVikfwkseeE2HAhjjOob+4VFLX
	 VY6ggKMfA6grojdoFRXyTtqE06QzkTGglK/6SJflTYXGJgp60CTBMvACrruAtbolTM
	 ZcIMdxHqUsRJImIXxxIWawxfrNbDOSEwheQIOhoLvi/0b8gk/kqULXHmjrRnyeNMQu
	 IafgJU+SBO9IsbYKLqiCmUdvn0fMdn56K1FVrynRY47s4YGbbMsPo3bOZgqXZ9iHV4
	 cXpBdGl0ajez8eYvF43LLPxJh1pd9MpJ68P1t18XSZ+9m25ueS7aJYVlfHSthsNhcA
	 mdXfwuB/Jp0Og==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] media: rc: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Triet Hoang" <triet.hoang.dev@gmail.com>
Cc: linux-amlogic@lists.infradead.org, media-ci@linuxtv.org, linux-sunxi@lists.linux.dev, neil.armstrong@linaro.org
In-Reply-To: <20260821071533.215821-1-triet.hoang.dev@gmail.com>
References: <20260821071533.215821-1-triet.hoang.dev@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 21 Aug 2026 07:24:04 +0000
Message-Id: <20260821072404.D5F001F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Low] Incorrect PM wrapper macro used for the dev_pm_ops structure pointe=
r.

Pre-existing issues:
- [Critical] This problem wasn't introduced by this patch, but there is a u=
se-after-free of the RC device on driver removal and probe error paths due =
to an active devres-managed IRQ handler.
--

--- Patch [1]: [PATCH] media: rc: Convert to DEFINE_SIMPLE_DEV_PM_OPS() ---
commit 5ad013ce47b901f4bd8a53a1c02b222a8df6858a
Author: Triet Hoang <triet.hoang.dev@gmail.com>

media: rc: Convert to DEFINE_SIMPLE_DEV_PM_OPS()

Convert the deprecated SIMPLE_DEV_PM_OPS to DEFINE_SIMPLE_DEV_PM_OPS
and pm_sleep_ptr(). This lets us drop the __maybe_unused annotations
from its suspend and resume callbacks, also reduces kernel size in
case CONFIG_PM or CONFIG_PM_SLEEP is disabled.

> diff --git a/drivers/media/rc/sunxi-cir.c b/drivers/media/rc/sunxi-cir.c
> index 28e840a7e5b8c..7fd48c510143d 100644
> --- a/drivers/media/rc/sunxi-cir.c
> +++ b/drivers/media/rc/sunxi-cir.c

[ ... ]

> @@ -422,7 +422,7 @@ static struct platform_driver sunxi_ir_driver =3D {
>  	.driver =3D {
>  		.name =3D SUNXI_IR_DEV,
>  		.of_match_table =3D sunxi_ir_match,
> -		.pm =3D &sunxi_ir_pm_ops,
> +		.pm =3D pm_sleep_ptr(&sunxi_ir_pm_ops),

[Severity: Low]
Does this code use the correct wrapper macro for a dev_pm_ops structure
pointer? Since sunxi_ir_pm_ops is a structure pointer rather than a sleep
callback, should it use pm_ptr() instead of pm_sleep_ptr()?

>  	},
>  };

[Severity: Critical]
This is a pre-existing issue, but could there be a use-after-free of the RC
device on driver removal and probe error paths?

The driver initializes a devres-managed IRQ in sunxi_ir_probe():

	ret =3D devm_request_irq(dev, ir->irq, sunxi_ir_irq, 0, SUNXI_IR_DEV, ir);

On probe failure or during sunxi_ir_remove(), the driver manually calls
rc_unregister_device() and rc_free_device(), freeing the RC device memory:

exit_unregister_dev:
	rc_unregister_device(ir->rc);
exit_free_dev:
	rc_free_device(ir->rc);

Because devres cleanup has not yet run, the IRQ remains active. If an
interrupt fires or is already in-flight on another CPU during this window,
would sunxi_ir_irq() dereference the freed ir->rc?

	ir_raw_event_overflow(ir->rc);

Also, could this read from disabled hardware if an interrupt fires after
sunxi_ir_hw_exit() is called?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260821071533.2158=
21-1-triet.hoang.dev@gmail.com?part=3D1
