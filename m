Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D32883B100A
	for <linux-sunxi@lists.linux.dev>; Sat,  8 Aug 2026 11:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786188552; cv=none; b=AWKxPAY3ejyWXEm+3INKqXozh6PN3+WEKfIFVpyBt8hB497uEk7+X3NRuGGOs7qpAPdK3EcItDPgdgbgXj7At7zcGuWGKsjV37I/RbNKlNR5FjdCwfTiBQXCeNs7gwbY3q+1k4kpWoUDSyoPgKj79p8hviFgh5LjAeIvzug2gME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786188552; c=relaxed/simple;
	bh=QgNkY5pk97dz4zCVWBoEcAQV3t6CeP7Swk0xlE7AVFE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=L75OTSxJLHc4vkz5aP7Borbfw8q2nNmuoI+CE8NLmXxtqmH7WKSeid8M+7GVPpSO8mZLFNud8hQ+hGMRCgUeORvQr4f3ZkbPpClwpTKLDS1gSflXo2wU1Sh9hdPn9hrq7Oo56JAEFo3lIjHb9fPHtIk8sluUJeCVyoe3E7ZF57k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H4Vg7obA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H4Vg7obA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EDB61F000E9;
	Sat,  8 Aug 2026 11:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786188550;
	bh=qizrzvz/Yw+tTi+xck3RlglCAUw6/OSn80W51wbweqQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=H4Vg7obA+sKfIE9IM1CCp/kQn+8lFQx9mQoGYVSacofG3llX6/tMcileE+EG3z30u
	 2uqVa++UG+sEkfNej3nnth+pbIgwNFcuPHxJb/V+/AgqtrIYC5ivvyfijsrg8nOc8B
	 k2ZOohZBXCy+L/Qr3vOceAwLqfGalEDiBdigcJMLz2oNVlaj6NgMB7vANWRao2Q2jN
	 W05keq71vFDtYYgs1jwPxQmuL9VXbsICwKm9v5oz1G2YXfNbKSJsK9U1KN7BWkGLZA
	 hGE35Tsc7GfH984i8YQFcfOcywu0oYATOtX6XCTOUaEanXjhA7y+l17HNZZSwI+SDb
	 BmIB7bNtkltKQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 3/3] media: sun4i-csi: add notifier unbind callback
 to drop the source subdev
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cong Nguyen" <congnt264@gmail.com>
Cc: linux-sunxi@lists.linux.dev, media-ci@linuxtv.org
In-Reply-To: <61d4901af20a4d2d0f9484328c173bbdfc52ec05.1786184456.git.congnt264@gmail.com>
References: <cover.1786184456.git.congnt264@gmail.com>
 <61d4901af20a4d2d0f9484328c173bbdfc52ec05.1786184456.git.congnt264@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 08 Aug 2026 11:29:09 +0000
Message-Id: <20260808112910.4EDB61F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] The driver attempts to re-register an embedded `video_device` afte=
r it has been unregistered, which violates kobject lifecycle rules.

Pre-existing issues:
- [High] The `.unbind` callback performs incomplete resource teardown, lead=
ing to list corruption on re-bind.
- [High] The `sun4i_csi` structure is allocated using `devm_kzalloc`, but i=
ts embedded `video_device` relies on `video_device_release_empty`, creating=
 a Use-After-Free.
--

--- Patch [3]: [PATCH v1 3/3] media: sun4i-csi: add notifier unbind callbac=
k to drop the source subdev ---
commit 682f5e1386d2733cf9627a62093a8bdd3a593a37
Author: Cong Nguyen <congnt264@gmail.com>

media: sun4i-csi: add notifier unbind callback to drop the source subdev

This commit adds an .unbind callback to the V4L2 async notifier for the
sun4i-csi driver. It unregisters the video device and drops the source
subdev pointer. This is intended to prevent a use-after-free when the
remote sensor module is unloaded.

> diff --git a/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c b/drivers=
/media/platform/sunxi/sun4i-csi/sun4i_csi.c
> index a8711336a7540..6610ada1c06d1 100644
> --- a/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
> +++ b/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
> @@ -122,8 +122,25 @@ static int sun4i_csi_notify_complete(struct v4l2_asy=
nc_notifier *notifier)
>  	return ret;
>  }
> =20
> +static void sun4i_csi_notify_unbind(struct v4l2_async_notifier *notifier,
> +				    struct v4l2_subdev *subdev,
> +				    struct v4l2_async_connection *asd)
> +{
> +	struct sun4i_csi *csi =3D container_of(notifier, struct sun4i_csi,
> +					     notifier);
> +
> +	/*
> +	 * The remote subdev is being freed. Tear down the video node so
> +	 * userspace can no longer reach sun4i_csi_start_streaming() and
> +	 * dereference the now dangling source subdev, and drop the pointer.
> +	 */
> +	vb2_video_unregister_device(&csi->vdev);

[Severity: High]
This is a pre-existing issue, but the new .unbind callback performs an=20
asymmetric teardown.

If the remote sensor module is unloaded, the .unbind callback is triggered=
=20
but fails to undo the local subdev and media device registrations. When the=
=20
sensor is reloaded, sun4i_csi_notify_complete() runs again and calls=20
v4l2_device_register_subdev() on the already-registered subdev.

Can this lead to list corruption and a potential kernel panic?


[Severity: High]
When this unbind callback unregisters the embedded video device (csi->vdev),
it ends the lifecycle of its kobject.

When the sensor is re-bound, sun4i_csi_notify_complete() invokes=20
sun4i_csi_v4l2_register(), which calls video_register_device() on the=20
same unregistered, embedded video_device. Re-initializing a released=20
kobject is forbidden and can lead to kernel warnings and potential panics.

Can the driver be restructured to avoid re-registering an embedded video
device that has already been unregistered?


[Severity: High]
This is a pre-existing issue, but the sun4i_csi structure is allocated usin=
g=20
devm_kzalloc() in sun4i_csi_probe(), while its embedded video_device=20
relies on video_device_release_empty.

If an unprivileged user opens /dev/videoX and the driver is unbound,=20
the video device is unregistered. This eventually causes devres to free the=
=20
sun4i_csi structure. When the user later closes the file descriptor,=20
sun4i_csi_release() accesses the freed csi pointer to lock csi->lock.

Does this create a Use-After-Free condition when the file descriptor is=20
closed after the driver is unbound?

> +	csi->src_subdev =3D NULL;
> +}
> +
>  static const struct v4l2_async_notifier_operations sun4i_csi_notify_ops =
=3D {
>  	.bound		=3D sun4i_csi_notify_bound,
> +	.unbind		=3D sun4i_csi_notify_unbind,
>  	.complete	=3D sun4i_csi_notify_complete,
>  };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1786184456.gi=
t.congnt264@gmail.com?part=3D3
