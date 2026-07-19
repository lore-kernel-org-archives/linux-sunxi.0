Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8842DF6C
	for <linux-sunxi@lists.linux.dev>; Sun, 19 Jul 2026 08:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784448603; cv=none; b=blYl18qUaSDaBNo4v772/uNQTYF6OviUaDspsqs8kEIO6qnXa9hAr3lP6cjgM0zobVqK02ie4Brgx6R0ADMHJOwIcVChAIE1vhq2MkXDgHyu7JVW2hdiB1oBZLC1MQ4NoR5lW+9lcAngqOfLYVlGPj8tZlrDaMsjAQo0Y/+nc0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784448603; c=relaxed/simple;
	bh=2pKCCLOT5SnOAiSGAmcdQiBpr4afrO8Nac7VU7nM1pc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SR/ZP3MzaFhAJvuqun50hVBDYuutTljZ5LYQ2+/zSgyBOCgu7knHcTC4W5xV4VFcIJzqMGw2cxQKazXVkju4iZkSNa0U0J+h4g7mQx3FZF6Uj0FqbDtf3/0dEpt0m0xPXkamV1pGrRqT21g+dfna7QDl1JoFh/hedxmTDC6DcbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PIZM4+4x; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PIZM4+4x"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 292EF1F000E9;
	Sun, 19 Jul 2026 08:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784448602;
	bh=1Ti4xYopLO/StrnYzIyH2XW1yAGczRHqK2yYOpNzJww=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PIZM4+4xqf9Jxv7OVXdFftfaaF8OsemWJr3GC+X0b85eUz/IKtzfmBVd9gWIQUmg+
	 g49ZP6rxO72X3PGZRxX94b7h+82xqRqQ9bF2ojZM6wEUB6wAviqAVFlC2IjIphwyWh
	 puKaRjhpCiVZVT1ByUyoGwPdcz7yxPDYtbA0eLBg2W4qoxPNcNNP7B62Mb3SR8+PIe
	 nHV1kHx17hkqoZXSaIHnE79fFBrxMH5kduMDLVQPNaBFne9wc4ugGZJ/cfIhz+5WxK
	 XEBDFsSE5oA4RU1SgbnIF9XxMSfEJGxDngXoD37YRDJOZVak/ABYpOe6gPG1trEY4K
	 VwAqzEa5C0gDw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 1/2] media: sun6i-csi: bridge: Use V4L2 subdev active
 state
Reply-To: sashiko-reviews@lists.linux.dev
To: "Arash Golgol" <arash.golgol@gmail.com>
Cc: linux-sunxi@lists.linux.dev, media-ci@linuxtv.org
In-Reply-To: <20260719112714.72802-2-arash.golgol@gmail.com>
References: <20260719112714.72802-1-arash.golgol@gmail.com>
 <20260719112714.72802-2-arash.golgol@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 19 Jul 2026 08:10:01 +0000
Message-Id: <20260719081002.292EF1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The driver registers a shared IRQ but accesses hardware unconditio=
nally in the handler without checking if the device is active. Furthermore,=
 it powers down hardware in its runtime suspend callback without calling sy=
nchronize_irq().
- [High] Asymmetric unregistration in sun6i_csi_bridge_cleanup leaves the s=
ubdevice in the global async list, causing list corruption and use-after-fr=
ee.
--

--- Patch [1]: [PATCH v5 1/2] media: sun6i-csi: bridge: Use V4L2 subdev act=
ive state ---
commit 83bd3dbd77fc8cb9460cfb43960a67e0c7ee1c83
Author: Arash Golgol <arash.golgol@gmail.com>

media: sun6i-csi: bridge: Use V4L2 subdev active state

This commit updates the driver to use the V4L2 subdev active state API
for storing the active format. It simplifies the driver by removing the
bridge mbus_format field and replacing the bridge lock with the state
lock. It also enforces identical formats on the sink and source pads.

> diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c b/=
drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c
> --- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c
> +++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c

[ ... ]

> @@ -868,5 +847,7 @@ void sun6i_csi_bridge_cleanup(struct sun6i_csi_device=
 *csi_dev)
> =20
>  	v4l2_device_unregister_subdev(subdev);

[Severity: High]
This is a pre-existing issue, but does this unconditional call to
v4l2_device_unregister_subdev() leave a dangling pointer in the global
async list if the device was registered asynchronously?

During setup in sun6i_csi_bridge_setup(), the subdevice is registered
using v4l2_async_register_subdev() when csi_dev->isp_available is true.
This adds the subdevice's async_list entry to the global subdev_list.
If v4l2_device_unregister_subdev() is called here during cleanup instead
of v4l2_async_unregister_subdev(), the entry remains in the global list,
which can lead to a use-after-free when the list is traversed later.

> +	v4l2_subdev_cleanup(subdev);
> +
>  	media_entity_cleanup(&subdev->entity);
>  }

I also noticed a couple of pre-existing issues in the related sun6i_csi.c f=
ile.

[Severity: High]
This is a pre-existing issue, but does the shared IRQ handler access hardwa=
re
while the device might be suspended?

When devices use shared IRQs, another device on the same IRQ line can trigg=
er
an interrupt while this device is suspended.

In drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c:sun6i_csi_interrupt():

    regmap_read(regmap, SUN6I_CSI_CH_INT_STA_REG, &status);
    regmap_read(regmap, SUN6I_CSI_CH_INT_EN_REG, &enable);

The handler performs unconditional MMIO reads without checking the PM state
via pm_runtime_get_if_active(). Reading powered-off hardware can cause a
bus fault or external abort.

Additionally, in sun6i_csi_suspend():

    reset_control_assert(csi_dev->reset);
    clk_disable_unprepare(csi_dev->clock_ram);
    clk_disable_unprepare(csi_dev->clock_mod);

Is it safe to power down the hardware here without calling synchronize_irq()
first? Without waiting for any executing shared interrupt handlers to finis=
h,
the IRQ handler could execute mid-flight during power down.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260719112714.7280=
2-1-arash.golgol@gmail.com?part=3D1
