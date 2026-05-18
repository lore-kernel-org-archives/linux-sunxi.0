Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D6C7324B1E
	for <linux-sunxi@lists.linux.dev>; Mon, 18 May 2026 11:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779102911; cv=none; b=ZrfChti2T+8H/w46kg05dm8LhKLpW0Iuso22vMc1Q5gtvIzVRQzJ4bVAP2N+ZlHL4OqAn5MxAXjdHii2apKe9IxiqtZlTlUoREZlpj5y52DBm95KTAgwKgDxlhlBphfg91+YIXP2hLG7IHzPvf0sj6MQNXEIgCj/yaFV3bY3T1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779102911; c=relaxed/simple;
	bh=T6TFAsL8BGBkYsuU3FJnK5/n8AaonDvgk4coJlatHyA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jUdHwt+IBn6E6yc4WKmle5Yf64vPJepTHOJHF/xO9AgS+IOn1arpaPw7BQt1vW/WQWHbZxbrNU5GCkzpmPGdRS59HVeTdGHRsKq5BZ/A16qFWMt1xffNdVi3rxHG0oq4ZfjSur9hu/XyKTFkUG83UJm/OqPqQUVXWxe5X9IuJMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ain13BbI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ain13BbI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8B1EC2BCB7;
	Mon, 18 May 2026 11:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779102910;
	bh=T6TFAsL8BGBkYsuU3FJnK5/n8AaonDvgk4coJlatHyA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=Ain13BbIecNxJ59we5aDEvkuSSzKsLVdln8cOpiATWaKNaTWAo4MUD9SwiqAnQHA+
	 MZVC7aIaMu4+gaV5OSYaJwCbGBHMObvBr4AFntJLTpFEMPJ0zpDOYeZGLsjvh5Lhqo
	 v4ZH+v1HUGm6FIfXUXEoSLtoeCwO8cKWYGHeK5rUp5wRgakns8GeqUpK+eXdPptPc8
	 6hMGgw4/FqSVtuc/PENeakedvO+lqWxiZZ2rI2vtBQ4MeKQuPndurhBDlfEyNdyHWh
	 uF0NHErvAJ5QdxH19irtRI5QfAwmbwtWhqqYNihfs2lfTND/zYIg21pHCN2YttEXVw
	 C0IafpI53tLIQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 01/16] media: sun6i-csi: bridge: Use V4L2 subdev active
 state
Reply-To: sashiko-reviews@lists.linux.dev
To: "Paul Kocialkowski" <paulk@sys-base.io>
Cc: linux-sunxi@lists.linux.dev
In-Reply-To: <20260518102451.417971-2-paulk@sys-base.io>
References: <20260518102451.417971-2-paulk@sys-base.io>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 18 May 2026 11:15:10 +0000
Message-Id: <20260518111510.C8B1EC2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Critical] Synchronously freeing the subdev active state during driver cl=
eanup causes a Use-After-Free race with concurrent ioctls.
- [High] Calling `get_fmt` with a NULL state in `link_validate` uncondition=
ally fails and breaks video capture.
- [Medium] The subdev active state lock is held across downstream `s_stream=
` and PM operations, causing severe lock contention.
--

commit 6f1b232ee1c8a3acebc183bf1908a712c21b084e
Author: Arash Golgol <arash.golgol@gmail.com>

media: sun6i-csi: bridge: Use V4L2 subdev active state
   =20
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

> @@ -433,6 +415,10 @@ static int sun6i_csi_bridge_s_stream(struct v4l2_sub=
dev *subdev, int on)
>  	else
>  		source =3D &bridge->source_mipi_csi2;
> =20
> +	/* Active State */
> +
> +	state =3D v4l2_subdev_lock_and_get_active_state(subdev);
> +
>  	if (!on) {
>  		v4l2_subdev_call(source_subdev, video, s_stream, 0);
>  		ret =3D 0;
> @@ -443,7 +429,7 @@ static int sun6i_csi_bridge_s_stream(struct v4l2_subd=
ev *subdev, int on)
> =20
>  	ret =3D pm_runtime_resume_and_get(dev);
>  	if (ret < 0)
> -		return ret;
> +		goto unlock;

[ ... ]

> @@ -472,7 +460,8 @@ static int sun6i_csi_bridge_s_stream(struct v4l2_subd=
ev *subdev, int on)
>  	if (ret && ret !=3D -ENOIOCTLCMD)
>  		goto disable;
> =20
> -	return 0;
> +	ret =3D 0;
> +	goto unlock;
> =20
>  disable:
>  	if (capture_streaming)
> @@ -482,6 +471,8 @@ static int sun6i_csi_bridge_s_stream(struct v4l2_subd=
ev *subdev, int on)
> =20
>  	pm_runtime_put(dev);
> =20
> +unlock:
> +	v4l2_subdev_unlock_state(state);
>  	return ret;
>  }

Does this hold the subdev active state lock for too long?

The lock is acquired via v4l2_subdev_lock_and_get_active_state() and held
across the pm_runtime_resume_and_get() call and the propagation of s_stream
to the source subdevice.

Downstream s_stream operations can involve lengthy I2C transactions, and
holding the state lock across them blocks concurrent userspace queries like
VIDIOC_SUBDEV_G_FMT.

Could the format be copied locally and the state lock released before
initiating hardware configuration?

[ ... ]

> @@ -868,5 +847,7 @@ void sun6i_csi_bridge_cleanup(struct sun6i_csi_device=
 *csi_dev)
> =20
>  	v4l2_device_unregister_subdev(subdev);
> =20
> +	v4l2_subdev_cleanup(subdev);
> +

Does synchronously freeing the subdev active state during driver cleanup
cause a use-after-free regression with concurrent ioctls?

v4l2_subdev_cleanup() is called synchronously during driver unbind, which
immediately frees sd->active_state. If a userspace process holds the devnode
open and executes an ioctl concurrently with the device unbind, the ioctl
handler will fetch the active state pointer.

Because video_unregister_device() does not wait for active ioctls to finish
when vdev->lock is not used, the ioctl thread might dereference the freed
state memory when calling v4l2_subdev_lock_state().

>  	media_entity_cleanup(&subdev->entity);
>  }

> diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c b=
/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
> index 65879f4802c00..d90abba213098 100644
> --- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
> +++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c

[ ... ]

> @@ -904,19 +909,22 @@ static int sun6i_csi_capture_link_validate(struct m=
edia_link *link)
>  	if (WARN_ON(!capture_format))
>  		return -EINVAL;
> =20
> -	sun6i_csi_bridge_dimensions(csi_dev, &bridge_width, &bridge_height);
> +	/* Resolve csi bridge format. */
> +	ret =3D v4l2_subdev_call(src_subdev, pad, get_fmt, NULL, &src_fmt);
> +	if (ret)
> +		return ret;

Will this unconditionally fail and break video capture?

Since this patch transitions the bridge to the V4L2 active state API and se=
ts
its .get_fmt callback to the generic v4l2_subdev_get_fmt(), passing a NULL
state routes to __v4l2_subdev_state_get_format().

That triggers a WARN_ON_ONCE(!state) and returns NULL, causing get_fmt
to return -EINVAL.

Should this be updated to use v4l2_subdev_call_state_active() instead?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260518102451.4179=
71-1-paulk@sys-base.io?part=3D1
