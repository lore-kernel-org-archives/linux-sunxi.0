Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 174D32E737E
	for <linux-sunxi@lists.linux.dev>; Sat,  8 Aug 2026 11:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786189039; cv=none; b=cKEbr6iE7FTKcYsgBhDvF6X52RP+fUvujJauESbdbh/NX/iv0Xdo/rR02I5a7S2D3flK9E2rjVUoV/t7weyIW2MMYXlPoPodt604CU84W9drjxZe54Twzl9M5eQMJBOfK6AqmtGATvzpx7zw/f6zUSMUXtoh7iEDWNUqrPYQFGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786189039; c=relaxed/simple;
	bh=WqXBSPUxGd0qLmsjrnoA4ccDcqdUdR72jWmp10yG1R8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mq+WMtTCJ9EKZlE1eWKwwVXUETE5srIUunDcM/n2C4NvhzZn/4WRaDrUUloBlhhQzcpqIArFKF38gtJVZKlTPCYADrFmCacXVt70sPnykx3QiM//tuE1rSO/MyYnmfvUU0r0iOJaubqPMnp/CsIu1sCgKLQ41tNtODhJiCtYYzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BVKzfdTv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BVKzfdTv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F8CA1F000E9;
	Sat,  8 Aug 2026 11:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786189037;
	bh=EfUDqw8xOSqJtJiZbwEVAhGcCClyQNt6BFSdU9Dts1s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BVKzfdTvHZWRBlm3fxgbcg8jZaxsZTG5ySEkLgGCtj+5yRMWzbBla2CEwK8XZwzuG
	 SDEUsONvzSEM0Bo5T/NLV/qEg4Vvg2wJNC7qy049lW8bWqLQi5q87z7y37CvLaU+zP
	 j0Ofotqt1B1SzAaNmpD6VU6R2mU9vsIi0V/FXb6lkx77qt+JYQNLpmIYomZ4B1tUz6
	 Mn3MnA0Ij9H7iC1IkQsZCLvH3GWN61P+bzX+RGZQteuPTGN/chzzZzIh/sxDVktx0e
	 mP7CxR44k9wOhmDzVwkhnHijgvbPAD9GyVlAfatO5FFrd9RSMRQ8GIjfxaZ2r80jIr
	 ltF9nBREQOGQA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 1/3] media: sun4i-csi: fix video device and subdev
 leak in notify_complete()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cong Nguyen" <congnt264@gmail.com>
Cc: linux-sunxi@lists.linux.dev, media-ci@linuxtv.org
In-Reply-To: <7804a3c87beefde14e0358fa2a11e63005525890.1786184456.git.congnt264@gmail.com>
References: <cover.1786184456.git.congnt264@gmail.com>
 <7804a3c87beefde14e0358fa2a11e63005525890.1786184456.git.congnt264@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 08 Aug 2026 11:37:16 +0000
Message-Id: <20260808113717.3F8CA1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The driver embeds `struct video_device` inside a `devm`-managed st=
ructure and uses `video_device_release_empty`, causing a Use-After-Free (UA=
F) vulnerability. This problem wasn't introduced by this patch, but the pat=
ch fails to resolve the underlying race condition when unwinding registrati=
ons.
- [Medium] Missing `v4l2_async_nf_cleanup()` in the `sun4i_csi_probe()` err=
or path causes a memory and fwnode reference leak of async connections. Thi=
s problem wasn't introduced by this patch.
--

--- Patch [1]: [PATCH v1 1/3] media: sun4i-csi: fix video device and subdev=
 leak in notify_complete() ---
commit 1bfbebedd93671de734cc0e7671a5f4e99b9ff15
Author: Cong Nguyen <congnt264@gmail.com>

media: sun4i-csi: fix video device and subdev leak in notify_complete()

This patch fixes an issue in sun4i_csi_notify_complete() where the video
device and bridge subdev were left registered if later initialization steps
failed. It unwinds the registrations in reverse order to avoid leaving the
driver in a half-registered state.

> diff --git a/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c b/drivers=
/media/platform/sunxi/sun4i-csi/sun4i_csi.c
> index e53a07b770b7e..a8711336a7540 100644
> --- a/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
> +++ b/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c

[ ... ]

> @@ -114,6 +114,10 @@ static int sun4i_csi_notify_complete(struct v4l2_asy=
nc_notifier *notifier)
> =20
>  err_clean_media:
>  	media_device_unregister(&csi->mdev);
> +err_unregister_video:
> +	vb2_video_unregister_device(&csi->vdev);

[Severity: High]
This is a pre-existing issue, but could this error handling path lead to a
use-after-free regression if userspace races to open the device?

Because the csi structure is allocated with devm_kzalloc() in
sun4i_csi_probe(), it will be automatically freed when probe fails.
Meanwhile, sun4i_csi_v4l2_register() sets vdev->release to
video_device_release_empty.

If media_device_register() fails, this new error path calls
vb2_video_unregister_device(), which unregisters the sysfs node but cannot
revoke file descriptors if userspace has already opened /dev/videoX.

When the file descriptor is eventually closed, could this lead to a
dereference of the freed csi structure in sun4i_csi_release() and when
the V4L2 core attempts to put the device?

> +err_unregister_subdev:
> +	v4l2_device_unregister_subdev(subdev);
> =20
>  	return ret;
>  }

[Severity: Medium]
This isn't a bug introduced by this patch, but does the error path in
sun4i_csi_probe() cause a memory leak regression for async connection
structures and fwnode references?

When sun4i_csi_notifier_init() succeeds, it allocates an async connection
and grabs a fwnode reference. If the subsequent v4l2_async_nf_register()
call fails, the error path exits without calling v4l2_async_nf_cleanup():

drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c:sun4i_csi_probe() {
    ...
err_unregister_media:
	media_device_unregister(&csi->mdev);
    ...
}

Could this result in abandoning those allocations and leaking fwnode
references since the cleanup isn't performed?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1786184456.gi=
t.congnt264@gmail.com?part=3D1
