Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A2C64D5988;
	Wed, 30 Sep 2026 16:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790784168; cv=none; b=ur8/r+Ks0FoPl5XIiYw0xfp3TovddYa6cJcPRWznzI27etFhUjMcDU2wxf9/WsljAtngQNA3KQOtiQqkQzVeloe3QIg0UUAZ5Pot7BUaRNJXPPO6hwfEAawOCjcyU/PUoVMrUTe3NJWlkhkDW1uOUjzTOZ5mfRXRcC7rJ/icV3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790784168; c=relaxed/simple;
	bh=oZ60RQ3RAUH9o028q27iCPYaxwoLzOK6qfTZayYkeKU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=i6LUjnJ0equ0W0UpEeb3IBgtc1dw7AmQk7PfkK90u0xTr4xAOFmfbUFitQYa/wsO1+3zBHVGj88rtWOLRGWlV+w+bHUm7TzB1XjArBgyvQyL4QFYBZcxd3vjZ5BDpzpqcChxLrhCoi8tSZLW3jY8TSEeL/+k90/7Dr3aKH+juSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gVt4I23Y; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gVt4I23Y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4708B1F000FF;
	Wed, 30 Sep 2026 16:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790784164;
	bh=FPvvlnYEt9JiyeQ6R+pFnMJQtrCnxbyPM+ONSmeT5vc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gVt4I23Y3ZQ+TkB1RylF9tarKijgBLMWYtwOVde09Mhfz19CBy7GhTfq24xhNJ9ry
	 pHP3qesJ02uk7wmc5NWvh7gcXsE5syZSUCV0NcqYg2zHC/F1qTHOEO4Z81r/riYD0e
	 f+Bj1Te5yzoyGA2N9qqZ8YPzv20EDFwmq+yp7V+/hqOrCushDXwbgb6nGRZxwogp0J
	 NMkVYieIbOYuOxlxj5tzhVh7/uZXknzxOAXF7a8gvuJpncH8Qfc6tAgGYTlQY8Un2y
	 TnQ23+hq2hFejf9ifgVBVoijLkBNuwrMu+AXhpX5dlfyIDU8l+QS1IHe836vVv64Sz
	 Q+bmw0NdUgVMg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] media: sunxi: Add support for the D1 CSIC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nguyen Minh Tien" <tien.nguyenminh@embeddedlinux.blog>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org, linux-sunxi@lists.linux.dev, robh@kernel.org
In-Reply-To: <20260930154835.402684-3-tien.nguyenminh@embeddedlinux.blog>
References: <20260930154835.402684-1-tien.nguyenminh@embeddedlinux.blog>
 <20260930154835.402684-3-tien.nguyenminh@embeddedlinux.blog>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 30 Sep 2026 16:02:43 +0000
Message-Id: <20260930160244.4708B1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] pm: crash in IRQ handler due to missing pm_runtime_get_if_active()
- [High] media: UAF of sun20i_csi structure on device unbind
- [High] media: UAF of csi->source when sensor is unbound while streaming
- [Medium] pm: hardware left powered on after driver removal due to async p=
m_runtime_put
- [Medium] media: potential NULL dereference in sun20i_csi_bridge_enum_mbus=
_code()
--

commit 48923ca6acd2a7bc065ae49a8c19a8a6d69a0531
Author: Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>

    media: sunxi: Add support for the D1 CSIC
   =20
    Add a driver for the parallel input of the D1 CSIC and its first DMA
    engine. The parser is a bridge subdev and the DMA engine a capture video
    device, set up through the media controller API.

> diff --git a/drivers/media/platform/sunxi/sun20i-csi/sun20i_csi.c b/drive=
rs/media/platform/sunxi/sun20i-csi/sun20i_csi.c
> new file mode 100644
> index 0000000000000..eed29bc61348b
> --- /dev/null
> +++ b/drivers/media/platform/sunxi/sun20i-csi/sun20i_csi.c
> @@ -0,0 +1,1357 @@

[ ... ]

> +static irqreturn_t sun20i_csi_irq(int irq, void *data)
> +{
> +	struct sun20i_csi *csi =3D data;
> +	u32 status;
> +
> +	status =3D sun20i_csi_read(csi, SUN20I_CSI_DMA_INT_STA_REG);
        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
[Severity: High]
Does this code crash the system if an interrupt arrives while the device is
suspended?

The IRQ handler accesses hardware registers unconditionally without verifyi=
ng
if the device is active. devm_request_irq() is called before
pm_runtime_enable() in sun20i_csi_probe(). If the bootloader left the
interrupt pending, the IRQ fires immediately before the device is powered o=
n.
Additionally, since the IRQ is not disabled during runtime suspend, any
spurious interrupt while suspended triggers a synchronous external abort wh=
en
reading hardware registers while clocks are disabled.

Should this use pm_runtime_get_if_active() to verify the device is active
before accessing registers?

[ ... ]

> +static int sun20i_csi_bridge_init_state(struct v4l2_subdev *sd,
> +					struct v4l2_subdev_state *state)
> +{
> +	*v4l2_subdev_state_get_format(state, SUN20I_CSI_PAD_SINK) =3D
> +		sun20i_csi_default_fmt;
        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
[Severity: Medium]
Can this cause a NULL pointer dereference?

The format pointer for the unvalidated sink pad is dereferenced directly in
an initialization callback without framework validation guarantees.
v4l2_subdev_state_get_format() can return NULL.

> +	*v4l2_subdev_state_get_format(state, SUN20I_CSI_PAD_SOURCE) =3D
> +		sun20i_csi_default_fmt;
> +
> +	return 0;
> +}
> +
> +static int
> +sun20i_csi_bridge_enum_mbus_code(struct v4l2_subdev *sd,
> +				 struct v4l2_subdev_state *state,
> +				 struct v4l2_subdev_mbus_code_enum *code)
> +{

[ ... ]

> +	/* The source pad passes on the sink pad format. */
> +	if (code->pad =3D=3D SUN20I_CSI_PAD_SOURCE) {
> +		const struct v4l2_mbus_framefmt *fmt;
> +
> +		if (code->index)
> +			return -EINVAL;
> +		fmt =3D v4l2_subdev_state_get_format(state, SUN20I_CSI_PAD_SINK);
> +		code->code =3D fmt->code;
                ^^^^^^^^^^^^^^^^^^^^^^^
[Severity: Medium]
Is it safe to assume fmt is non-NULL here?

In enum_mbus_code(), the core wrapper validates the state for the SOURCE pa=
d.
The driver then unconditionally dereferences the format returned for the
opposite SINK pad. A check for one pad does not validate another.

[ ... ]

> +static int sun20i_csi_bridge_disable_streams(struct v4l2_subdev *sd,
> +					     struct v4l2_subdev_state *state,
> +					     u32 pad, u64 streams_mask)
> +{
> +	struct sun20i_csi *csi =3D sd_to_csi(sd);
> +	int ret;
> +
> +	ret =3D v4l2_subdev_disable_streams(csi->source, csi->source_pad,
> +					  BIT_ULL(0));
        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
[Severity: High]
Does this code dereference a freed pointer if the sensor is unbound while
streaming?

If the sensor subdevice is unbound (e.g., via sysfs) while the CSIC is
streaming, the async notifier core unbinds the sensor, but the CSIC driver
lacks an .unbind callback to clear the csi->source pointer. When streaming =
is
subsequently stopped by userspace, sun20i_csi_bridge_disable_streams()
dereferences the freed csi->source pointer.

[ ... ]

> +static void sun20i_csi_stop_streaming(struct vb2_queue *queue)
> +{
> +	struct sun20i_csi *csi =3D vb2_get_drv_priv(queue);
> +
> +	v4l2_subdev_disable_streams(&csi->subdev, SUN20I_CSI_PAD_SOURCE,
> +				    BIT_ULL(0));
> +	sun20i_csi_dma_stop(csi);
> +	video_device_pipeline_stop(&csi->vdev);
> +	sun20i_csi_return_buffers(csi, VB2_BUF_STATE_ERROR);
> +	pm_runtime_put(csi->dev);
        ^^^^^^^^^^^^^^^^^^^^^^^^^
[Severity: Medium]
Will this leave hardware powered on if the driver is unbound?

This queues an asynchronous suspend which is vulnerable to being cancelled =
by
driver removal. If the driver is unbound while streaming,
vb2_video_unregister_device() stops streaming synchronously, queuing an asy=
nc
suspend via pm_runtime_put(). The remove function then finishes and devres
calls pm_runtime_disable(), which cancels the pending async suspend.

Should this use pm_runtime_put_sync() instead?

[ ... ]

> +static int sun20i_csi_probe(struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	struct sun20i_csi *csi;
> +	int ret;
> +
> +	csi =3D devm_kzalloc(dev, sizeof(*csi), GFP_KERNEL);
        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
[Severity: High]
Does this allocation tie the video device lifetime to the driver binding
rather than the V4L2 file descriptors?

The structure embedding the video device is managed by devres. If userspace
holds /dev/videoX open when the driver unbinds, the remove function
completes and devres frees the structure. When userspace later closes the
file descriptor, v4l2_release() accesses the video_device embedded in the
freed structure, causing a Use-After-Free.

> +	if (!csi)
> +		return -ENOMEM;

[ ... ]

> +static void sun20i_csi_remove(struct platform_device *pdev)
> +{
> +	struct sun20i_csi *csi =3D platform_get_drvdata(pdev);
> +
> +	/* This stops streaming, which needs the whole pipeline. */
> +	vb2_video_unregister_device(&csi->vdev);
        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
[Severity: High]
Does this code unregister the device without waiting for file descriptors to
close?

This synchronously stops streaming during driver unbind and unregisters the
device but does not wait for file descriptors to close. This allows the
devres cleanup to race with userspace closing the file, leading to the Use-
After-Free issue mentioned in sun20i_csi_probe().

Additionally, it immediately precedes the devres cleanup that cancels the
async put queued in sun20i_csi_stop_streaming().

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260930154835.4026=
84-1-tien.nguyenminh@embeddedlinux.blog?part=3D2
