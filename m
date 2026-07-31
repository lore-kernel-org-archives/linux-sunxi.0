Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 912F5352003
	for <linux-sunxi@lists.linux.dev>; Fri, 31 Jul 2026 23:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785539431; cv=none; b=NRR56VugLOcnefw8od+g+rWefhyEKr/7/ma12PVMskycdn0TTkxtlH11UwCVmDN82Q7lEqXwcB49b87rU41KgMm9/piVXSnxHviX4mrUb734mopLKqMxmPkal8r6kMuAKEk2Dvw5a5elWJQAE6CRfY1M5UqgrqwWZOtfXtmomS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785539431; c=relaxed/simple;
	bh=8wqm7kt4rUg2HPMk89qf4WYpzhL9KWrCinXLYPeWkZs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RI4uX1eXX9ySyvdnBRDV8fQsIjaQu/QMTbRxMDAOLBshYwJCxNFGKDcdYm0KV38WnQtNa9o61TNVs505LXMDS6aKdNGkhACkpgNDqe22DfwRPQSHDx7xCyyUT7ufJjufEj6zWQFCPYRKDOqY0m0/SRqy7fJUAk6EvgGIdAXFDCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TMPeKzxY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TMPeKzxY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D48D91F00AC4;
	Fri, 31 Jul 2026 23:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785539430;
	bh=oCfdB9hYafhgoEcwQoI2YHadEIE09pnI1XVWbUmBxGk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TMPeKzxYzaEoZn3J+AVCfdCRcwpCQwlB2PugXIgs0tj1zgfPTGNtelqiMxJLcalVe
	 +quTXXzh2aYrAOpLKdb+NCyGeuJ/idNZLH80o2fTPd8CJMj2qkSHjeSQT4SDfZuDDI
	 dYqBrlIDumsBh9eTb9i3s3FlpZuSEhSoE3qmb9Z7VLwmKD6bKOxOUYCR6rOkrUaHnT
	 uq/MLXdo7asr8U6jpIGVBD6PVwV+wv+AFttVrhbWBnixN3QeTWFXBIMlqa3+nReJVp
	 yJ/18ARo6k6AuyVqds2mDWWkMw7/5/XJ3ajpU3aDN0i2bN2eGdRBW7ARTqwseOBLh9
	 4D4IuHSGamFZg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 49/69] drm/bridge: inno-hdmi: Advertise HDMI 1.2
 capabilities
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-sunxi@lists.linux.dev
In-Reply-To: <20260731-dw-hdmi-qp-scramb-v10-49-294364b2cf15@collabora.com>
References: <20260731-dw-hdmi-qp-scramb-v10-0-294364b2cf15@collabora.com>
 <20260731-dw-hdmi-qp-scramb-v10-49-294364b2cf15@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 31 Jul 2026 23:10:29 +0000
Message-Id: <20260731231029.D48D91F00AC4@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The I2C adapter is registered and exposed before `hdmi->i2c` is as=
signed, creating a race window where an I2C transfer can trigger a NULL poi=
nter dereference.
- [High] The threaded IRQ is requested before the DRM bridge is fully initi=
alized and attached, causing a NULL pointer dereference if an early interru=
pt fires.
--

--- Patch [49]: [PATCH v10 49/69] drm/bridge: inno-hdmi: Advertise HDMI 1.2=
 capabilities ---
commit edc5142ea37d19616540dca30f30fcf265c228eb
Author: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

drm/bridge: inno-hdmi: Advertise HDMI 1.2 capabilities

Bridges using DRM_BRIDGE_OP_HDMI are now expected to also provide a
supported HDMI version.  This is not yet enforced, but will become
mandatory once the migration to the new caps-based HDMI connector
initialization API is completed.

Since inno_hdmi_phy_config.pixelclock does not exceed 165 MHz for any of
the chip variants handled by the driver, advertise HDMI 1.2 as the
supported version.

> diff --git a/drivers/gpu/drm/bridge/inno-hdmi.c b/drivers/gpu/drm/bridge/=
inno-hdmi.c
> index dd35f5a875d3d..ea3447d4f285b 100644
> --- a/drivers/gpu/drm/bridge/inno-hdmi.c
> +++ b/drivers/gpu/drm/bridge/inno-hdmi.c
> @@ -1119,6 +1119,7 @@ struct inno_hdmi *inno_hdmi_bind(struct device *dev,
>  	hdmi->bridge.type =3D DRM_MODE_CONNECTOR_HDMIA;
>  	hdmi->bridge.vendor =3D "Inno";
>  	hdmi->bridge.product =3D "Inno HDMI";

[Severity: High]
This is a pre-existing issue, but is it possible for an early interrupt to
cause a NULL pointer dereference here?

Earlier in inno_hdmi_bind(), devm_request_threaded_irq() is called, which
can enable the IRQ and trigger inno_hdmi_irq() before the bridge is fully
initialized. If that happens, inno_hdmi_irq() calls:
drm_helper_hpd_irq_event(hdmi->bridge.dev).

However, hdmi->bridge.dev is not initialized until drm_bridge_attach() is
called later in the inno_hdmi_bind() sequence. Will this lead to
drm_helper_hpd_irq_event() dereferencing a NULL pointer?

> +	hdmi->bridge.supported_hdmi_ver =3D HDMI_VERSION_1_2;
> =20
>  	hdmi->bridge.ddc =3D inno_hdmi_i2c_adapter(hdmi);

[Severity: High]
This isn't a bug introduced by this patch, but does registering the I2C
adapter before assigning the internal data structure pointer create a race
condition?

Inside inno_hdmi_i2c_adapter(), devm_i2c_add_adapter(hdmi->dev, adap) is
called before hdmi->i2c =3D i2c is set.

If a concurrent I2C transfer is initiated (for example, from userspace via
i2c-dev) immediately after registration, the transfer callback
inno_hdmi_i2c_xfer() will execute.

When inno_hdmi_i2c_xfer() runs, it does:

struct inno_hdmi_i2c *i2c =3D hdmi->i2c;
mutex_lock(&i2c->lock);

Could this dereference the uninitialized hdmi->i2c pointer, causing a crash?

>  	if (IS_ERR(hdmi->bridge.ddc))

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260731-dw-hdmi-qp=
-scramb-v10-0-294364b2cf15@collabora.com?part=3D49
