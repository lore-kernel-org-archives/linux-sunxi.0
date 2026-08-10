Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20A0C39A04A
	for <linux-sunxi@lists.linux.dev>; Mon, 10 Aug 2026 06:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786344149; cv=none; b=PAzKUhB/X3oSsR8HrzBUQiEEBuTZIGOwklPkkguGHdYEx68L5rZPZaelQDV7c5cv99p/hgioDVtUmLNMQXL+50EIvQAZKeCqUXsyOiE99Ex2zXDgucRjEW9SJpLg+osgIB/EFo/I8pqUaj8ccONDnZLyP5KvCaNn2n+czqYKllQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786344149; c=relaxed/simple;
	bh=ZW7t0+SdaMRyPtVeguuG8oqUKxqicjY8l24+Kk/D6uQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SRDAC+dLDLT5XURSRxW8qNdltDhSPjG/JIOOOU53vML5YhxDIlQNxY34ZlsUoJRjK3RqnAze/3oQ6eMZ7Q573YXIK38be27AtLWAgClj7hesa6EuxhGZgrOzgpdppf4egGdmWq7Y48T68iLy2vI6Ll3DsStEovcwHGniQfTDFJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OOABPaWw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OOABPaWw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1FE31F000E9;
	Mon, 10 Aug 2026 06:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786344147;
	bh=3PcLzI2T7+M/yziCrPZjVDMU6J6gsOZnbSx0+Vsy4lM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OOABPaWw+JaVY86zAgbHuaBY7doc+9zWdCTuXo7DSXYDNcG0CVnT0uzn+2CDs0MyK
	 p4O1jOoc2fa8QLbK71I3y61LFV25NvK1YvTMiNcgmvKsc4pAXi0EnLetQnlLfLdHTV
	 mk4tKV/uLzsJcTzdSXxnmQWHwK33Jfxt8LAyYdkmLwcVMwB8/ZDOaDsDQ92gp4fNjH
	 ONCVV+TzeXm8GLHa0hK7mqtJXHxY/6gPp8DS3IM0CDczcSSzMU/dSwZpLk0CrB4VaQ
	 L7lFRX3+plIeplTWE1RcyOjs1NsaX/qMNV9bvHxWoHiij5E1Lea+b9UBXFEaCG4bdV
	 EFh5ME+aUs+Lg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] media: sun4i-csi: add notifier unbind callback
 to drop the source subdev
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cong Nguyen" <congnt264@gmail.com>
Cc: media-ci@linuxtv.org, linux-sunxi@lists.linux.dev
In-Reply-To: <20260810062521.1709379-4-congnt264@gmail.com>
References: <cover.1786184456.git.congnt264@gmail.com>
 <20260810062521.1709379-1-congnt264@gmail.com>
 <20260810062521.1709379-4-congnt264@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 Aug 2026 06:42:27 +0000
Message-Id: <20260810064227.A1FE31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] The newly added `.unbind` callback clears `csi->src_subdev` withou=
t holding `csi->lock`, creating a time-of-check to time-of-use (TOCTOU) rac=
e condition with streaming operations.

Pre-existing issues:
- [High] The `.unbind` callback fails to tear down video and media devices =
registered in `.complete`, leading to double-registration crashes and resou=
rce leaks upon dynamic rebind.
--

--- Patch [3]: [PATCH v2 3/3] media: sun4i-csi: add notifier unbind callbac=
k to drop the source subdev ---
commit 25c69500b21e1d763945dbe2dba9e12acab04857
Author: Cong Nguyen <congnt264@gmail.com>

    media: sun4i-csi: add notifier unbind callback to drop the source subdev
   =20
    sun4i_csi_notify_ops only implements .bound and .complete. The .bound
    callback caches the remote sensor's subdevice in csi->src_subdev. When
    that subdevice goes away (e.g. its module is unloaded), the V4L2 async
    core frees it, but without an .unbind callback the driver keeps the
    stale pointer.

> diff --git a/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c b/drivers=
/media/platform/sunxi/sun4i-csi/sun4i_csi.c
> index a8711336a7540..f19508f2c7ed4 100644
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

[Severity: High]
This is a pre-existing issue, but doesn't this callback need to clean up the
video and media devices that were registered in sun4i_csi_notify_complete()?

If the remote sensor module is unbound and then re-bound,
sun4i_csi_notify_complete() will execute again. Since the previous devices
were not unregistered, calling video_register_device() on an already-regist=
ered
device can perform a double list_add and corrupt video_device_list.

> +	struct sun4i_csi *csi =3D container_of(notifier, struct sun4i_csi,
> +					     notifier);
> +
> +	/*
> +	 * The remote subdev is being freed. Drop our cached pointer so that a
> +	 * subsequent sun4i_csi_start_streaming() does not issue a
> +	 * v4l2_subdev_call() on the now dangling source subdev. The call is
> +	 * NULL-guarded and returns -ENODEV, so streaming fails cleanly.
> +	 */
> +	csi->src_subdev =3D NULL;

[Severity: High]
Could this introduce a time-of-check to time-of-use race condition with
streaming operations?

This clears csi->src_subdev without holding csi->lock. Meanwhile, functions
like sun4i_csi_start_streaming() and sun4i_csi_stop_streaming() in sun4i_dm=
a.c
evaluate csi->src_subdev via v4l2_subdev_call() while holding csi->lock.

If the streamon ioctl enters sun4i_csi_start_streaming(), v4l2_subdev_call()
will cache the csi->src_subdev pointer into a local variable. If the remote
sensor module is concurrently unloaded, sun4i_csi_notify_unbind() will clear
csi->src_subdev without acquiring the lock and return, allowing the async c=
ore
to free the subdevice. The streaming thread could then resume and dereferen=
ce
the freed subdevice pointer.

> +}
> +
>  static const struct v4l2_async_notifier_operations sun4i_csi_notify_ops =
=3D {
>  	.bound		=3D sun4i_csi_notify_bound,
> +	.unbind		=3D sun4i_csi_notify_unbind,
>  	.complete	=3D sun4i_csi_notify_complete,
>  };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260810062521.1709=
379-1-congnt264@gmail.com?part=3D3
