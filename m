Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A70FB429033
	for <linux-sunxi@lists.linux.dev>; Tue,  4 Aug 2026 07:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785829502; cv=none; b=LxiTqIsIGR+9fFu85VFvPR7wZIbWR79vHXdJ1UW3y7Dj+JQG+nrNnv/MAD/6QyM5XmSmrFMa+5i8kh4mdfJY884LF0Fgjc9wr6QEq6C4HsDf0bLczS3WMg7rUGbSDn69/56mamBRBDjgQsM3HX4V6fggZ1x27UD83FDtt2tI7Kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785829502; c=relaxed/simple;
	bh=zmV0ykfT7vkoE9kStJ1MTbW6LpYUYuPiQvqJMIDYvzY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lxVJTsWtBcJau7kpiD/tCYakf1Ujm5UqYPHwVYP5fS5fdmnUk9Pm7e3G2xRjpc05+Lrl8ZmJnWeg3obC1eXcsKtIIOvkl0lB5z8dIa3N45PIk9cZz90yZm73/STVPZ/HeMELm/Aq81VHvPorCZBCNs3uzA11nyClmtOkDKZ5yPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VG3+REe9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VG3+REe9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16FA41F000E9;
	Tue,  4 Aug 2026 07:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785829501;
	bh=9I/Psd5KhWaiS7b/cApI57dhy9o29ZeHi05foLHCc4c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VG3+REe94dlkdm6v8qKeN0L1JhWBO+rw62qQuDJj64Ucu/jBz8E/L/y4FcrDmaH/o
	 i/eHj3u02/p7Ht56mZelD+Co4sDGC0CFl0HNWEwgm2pEL9FnnBEqBBt7+5KjVGUBLb
	 yg8mOIc2PYnSzJiCCSvyI4MqwiP1aIwr+9J29JIDgvYaJ6vjv5un5Cq2n92LQqJgxW
	 rWSmlnDnUC3aRVSMXKr5vEd79ZtRlStdnBRbIFnr70K64H8hA57qhSsxHp1ZcrI0R8
	 SJhIfPxdSeY9U4BwZr8wodItrCVfnSKNYtur6Hr2rso9BxlXYFH/1nuB5Hoo9sR6fl
	 6xFqhH3l+Jr+A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 3/3] media: sun6i-csi: bridge: Use V4L2 subdev active
 state
Reply-To: sashiko-reviews@lists.linux.dev
To: "Arash Golgol" <arash.golgol@gmail.com>
Cc: linux-sunxi@lists.linux.dev, media-ci@linuxtv.org
In-Reply-To: <20260804072630.28745-4-arash.golgol@gmail.com>
References: <20260804072630.28745-1-arash.golgol@gmail.com>
 <20260804072630.28745-4-arash.golgol@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 Aug 2026 07:45:00 +0000
Message-Id: <20260804074501.16FA41F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Incomplete unregistration of the bridge V4L2 subdevice leaves dang=
ling pointers in the global V4L2 async lists when `isp_available` is true.
- [High] The shared IRQ handler accesses hardware registers without checkin=
g if the device is active, which can cause bus errors when the device is ru=
ntime suspended.
- [High] The runtime suspend callback does not call `synchronize_irq()` bef=
ore disabling clocks, risking mid-flight IRQ handler execution on powered-d=
own hardware.
--

--- Patch [3]: [PATCH v5 3/3] media: sun6i-csi: bridge: Use V4L2 subdev act=
ive state ---
commit 6cd90e8e72a0cec4746b7a5b2e01f5104228f654
Author: Arash Golgol <arash.golgol@gmail.com>

media: sun6i-csi: bridge: Use V4L2 subdev active state

Use the V4L2 subdev active state API to store the active format.
This simplifies the driver not only by dropping the bridge mbus_format
field, but it also allows dropping the bridge lock, replaced with
the state lock.

> diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c b/=
drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c
> index d006d9dd01708..43a85bcc2ba28 100644
> --- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c
> +++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c
[ ... ]
> @@ -868,5 +847,7 @@ void sun6i_csi_bridge_cleanup(struct sun6i_csi_device=
 *csi_dev)
> =20
>  	v4l2_device_unregister_subdev(subdev);
> =20
> +	v4l2_subdev_cleanup(subdev);
> +
>  	media_entity_cleanup(&subdev->entity);
>  }

[Severity: High]
This isn't a regression introduced by this patch, but since isp_available
allows the bridge subdevice to be registered asynchronously via
v4l2_async_register_subdev() in sun6i_csi_bridge_setup(), should
sun6i_csi_bridge_cleanup() conditionally call v4l2_async_unregister_subdev()
instead?

Using v4l2_device_unregister_subdev() unconditionally skips removing the
subdevice from the global async list when isp_available is true. Might this
leave a dangling pointer that leads to list corruption upon module unload?

I also noticed a couple of pre-existing regressions in sun6i_csi.c that mig=
ht
be worth looking into while working in this subsystem.

In sun6i_csi_interrupt():

	struct sun6i_csi_device *csi_dev =3D private;
	bool capture_streaming =3D csi_dev->capture.state.streaming;
	struct regmap *regmap =3D csi_dev->regmap;
	u32 status =3D 0, enable =3D 0;

	regmap_read(regmap, SUN6I_CSI_CH_INT_STA_REG, &status);

[Severity: High]
This is a pre-existing regression, but the shared IRQ handler accesses hard=
ware
registers without checking if the device is active.

If another device sharing this IRQ line fires an interrupt while the sun6i-=
csi
device is runtime suspended, can this MMIO read cause a bus error?

Should pm_runtime_get_if_active() be used to verify the device is powered
before reading SUN6I_CSI_CH_INT_STA_REG?

In sun6i_csi_suspend():

	struct sun6i_csi_device *csi_dev =3D dev_get_drvdata(dev);

	reset_control_assert(csi_dev->reset);
	clk_disable_unprepare(csi_dev->clock_ram);
	clk_disable_unprepare(csi_dev->clock_mod);

[Severity: High]
This is a pre-existing regression, but since the device uses a shared IRQ, =
the
suspend routine disables clocks before ensuring no IRQ handler is currently
running.

If the interrupt handler is mid-flight on another CPU when the clocks are
disabled, could it attempt to access MMIO registers on powered-down hardwar=
e?

Is it necessary to call synchronize_irq() before turning off the clocks her=
e?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260804072630.2874=
5-1-arash.golgol@gmail.com?part=3D3
