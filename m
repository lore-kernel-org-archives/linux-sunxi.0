Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0887D1624DF
	for <linux-sunxi@lists.linux.dev>; Fri, 17 Jul 2026 17:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784307751; cv=none; b=GzfbiOrw84tKrLU6Co0jkOsfIAEt2P1OPXDH4AC5bDqZuIH7NVtO/jVzrAoDnt0PgT1yloO2BsrhsrHqZpb5SBZXTf61v9FXGAFw1KqNhCiaMhdNleYEmKky7IX2B00vVeY2WGn7eXDbCOX6GTHMztobTWbQ1N+3IgHIFdl961o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784307751; c=relaxed/simple;
	bh=kEVC3I88qKn1r+xgvVnOyy0GcHqA1zx/ikbwItv43oE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JCKmLP975VjH7ypaOqhJ2OwltMKtVpmN2eCv0VkoHbWdN47EZxwNUpdcIuOITclBYZOewtw9KsOuTnQUeTKVjH1RF/dhIoPzxjk/r3pADM3AF9vuPX7SWrMeTnIYEjeIaBcsXc9pTZsMBFruTgHHXLJov9J9xSXyrv+U6YTMTYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m93dWsm/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m93dWsm/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6916A1F00A3A;
	Fri, 17 Jul 2026 17:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784307749;
	bh=jq/7LXjEjU1UWVawHBxpaeVQnsRhM9xPQBkvPHkUUrc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=m93dWsm/Q1lDOfjAf22LAL2VvyLQPb7celB5UIf0FY/COvrgO5XZn8RlucR4Y1bG5
	 njrq295i1jQ+q3/Z+QcsKDqxFA7ujiYBp7sxq0HqPj0Jg2J32AGxCrhA6zsfNxZ7v1
	 sVMtfLSb7ACRUg9I/od6UrtilFPZ7gF0LKMBJEFRQ/+5VsegxTnQYcjdPag8OOToY3
	 J7eB6ly89mPrdNSp0kdXHn9u1cbrg/elGB4ftTgO4ikcZrw6Qt3wp3SQOl8E6UgQ2C
	 WUfWYjE+gwPxLJrChKvxmld5wqDVKMjTcfmBECl7coruxhKCVPztErgkDU686NFzfB
	 4tLKUwZWlvuzg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/2] media: sun6i-csi: bridge: Use V4L2 subdev active
 state
Reply-To: sashiko-reviews@lists.linux.dev
To: "Arash Golgol" <arash.golgol@gmail.com>
Cc: linux-sunxi@lists.linux.dev, media-ci@linuxtv.org
In-Reply-To: <20260717160547.44460-2-arash.golgol@gmail.com>
References: <20260717160547.44460-1-arash.golgol@gmail.com>
 <20260717160547.44460-2-arash.golgol@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 17 Jul 2026 17:02:28 +0000
Message-Id: <20260717170229.6916A1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing synchronize_irq() in runtime PM suspend callback.
- [High] Spurious IRQ hardware access in shared interrupt handler without a=
ctive PM check.
- [High] Missing v4l2_async_unregister_subdev() in cleanup leads to UAF in =
global V4L2 async list.
--

--- Patch [1]: [PATCH v4 1/2] media: sun6i-csi: bridge: Use V4L2 subdev act=
ive state ---
commit 1d64b20b941162e1616fdc42a52770e51b6cdb58
Author: Arash Golgol <arash.golgol@gmail.com>

media: sun6i-csi: bridge: Use V4L2 subdev active state

Use the V4L2 subdev active state API to store the active format.
This simplifies the driver not only by dropping the bridge mbus_format
field, but it also allows dropping the bridge lock, replaced with
the state lock.

Signed-off-by: Arash Golgol <arash.golgol@gmail.com>

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
This is a pre-existing issue, but is it possible we're missing a call to
v4l2_async_unregister_subdev() here?

During probe, if isp_available is true, v4l2_async_register_subdev() is
called. However, this cleanup function unconditionally calls
v4l2_device_unregister_subdev().

Since the subdev remains linked in the global subdev_list within the V4L2
core, could this lead to a use-after-free when the driver unbinds and the
memory backing csi_dev is freed?


While reviewing this subsystem, I also noticed two other pre-existing issues
in drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c:

In sun6i_csi_suspend():

static int sun6i_csi_suspend(struct device *dev)
{
        struct sun6i_csi_device *csi_dev =3D dev_get_drvdata(dev);

        reset_control_assert(csi_dev->reset);
        clk_disable_unprepare(csi_dev->clock_ram);
        clk_disable_unprepare(csi_dev->clock_mod);

        return 0;
}

[Severity: High]
This isn't a bug introduced by this patch, but shouldn't we call
synchronize_irq() before asserting resets and disabling clocks?

Since the IRQ line is registered as shared (IRQF_SHARED), if another device
on the same line triggers an interrupt just as the PM core invokes
sun6i_csi_suspend(), the suspend callback might complete and power off the
hardware before the concurrent IRQ handler finishes executing.

Could this cause a bus fault or external abort when the processor accesses
unclocked MMIO registers?


Also in sun6i_csi_interrupt():

        regmap_read(regmap, SUN6I_CSI_CH_INT_STA_REG, &status);
        regmap_read(regmap, SUN6I_CSI_CH_INT_EN_REG, &enable);

[Severity: High]
This is another pre-existing issue, but does this IRQ handler need to
check if the device is active before accessing hardware registers?

Because this is a shared interrupt, the kernel might invoke
sun6i_csi_interrupt() when the device is suspended and its clocks are
disabled.

Without calling pm_runtime_get_if_active() before reading these MMIO
registers, could this result in an external abort or return 0xffffffff,
leading the handler to incorrectly assume all interrupts are pending?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260717160547.4446=
0-1-arash.golgol@gmail.com?part=3D1
