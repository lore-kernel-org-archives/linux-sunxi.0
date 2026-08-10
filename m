Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82892339875
	for <linux-sunxi@lists.linux.dev>; Mon, 10 Aug 2026 06:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786344133; cv=none; b=suEhcxRlrEXx0RMNDa8YW4Wya70IVsr8PMoarPtf3jHWi4xeTN+9MIFKcYqCbXeEKxCtAtnwn7Q+doifKGJROXr+S5oBJLb//oleRt7EabEOhBkt5ax8fJVMqoyzfTOlIgSGDgXZHfGmW4qJ/5QYtByc9jHhEV6nQFfzTHpPxBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786344133; c=relaxed/simple;
	bh=wPwrGyZGnVblWrhGoQBfcNJI1YhMg9A0j8rPrzJAI9U=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Gd7E+GN1HrGk4VHUtUlld/uyfxUAvRkJjXkA9H4eJVkgoFASt7JWpEfljVxytl/lJlP33SvMRPMT46HdkjT9YqSfUYbBwbY0Eu3rvPYMZMf+mTrtKtXBxdpPD2UXDt4YO9bXvO6igGcfrRpxfchzM+nXKhaSBWyxJQXt1XhIcOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NwRmyXll; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NwRmyXll"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D50DB1F000E9;
	Mon, 10 Aug 2026 06:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786344132;
	bh=P5JBPTzGLNXrweuKTxNu6e29ml6Uuxry5l2ngI9pnpk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NwRmyXllPnDUkPKgDMI+P/BnNRI1ovQzZV5HQn7/n3Do/7sCuQI0G/gvXcxLVnp+S
	 RMUY/Fha7IPYlwSW9E4LtjyLWOMXTP3XS2ECmRdJX1q/QNUM8802vOSnoy5Qu3VvaC
	 NztEbrIGUKcIC/jz1q2PJzqMh9sR4EdV+o1QsZ7USXyt/Q1yFCT6Wr/FhybTvjQfQR
	 YjGulYhNx3NLkeE1BGPq5chcGv9hSFrta6RW0qOhHP9fo/UZjdccwJGwBaOQUjYbI9
	 Oyk3S4sOk8lO0zqtbd+xwZFEEtxzG76rTTVmu+X+d0CPhbHNgZgcO1Een6g2bjAbt8
	 uy2LOvW8MO6Ww==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/3] media: sun4i-csi: fix video device and subdev
 leak in notify_complete()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cong Nguyen" <congnt264@gmail.com>
Cc: linux-sunxi@lists.linux.dev, media-ci@linuxtv.org
In-Reply-To: <20260810062521.1709379-2-congnt264@gmail.com>
References: <cover.1786184456.git.congnt264@gmail.com>
 <20260810062521.1709379-1-congnt264@gmail.com>
 <20260810062521.1709379-2-congnt264@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 Aug 2026 06:42:11 +0000
Message-Id: <20260810064211.D50DB1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Race Condition / Use-After-Free via TOCTOU during probe failure
--

--- Patch [1]: [PATCH v2 1/3] media: sun4i-csi: fix video device and subdev=
 leak in notify_complete() ---
commit 5302a06684e2be656ddb94e9e33fdbca0536135f
Author: Cong Nguyen <congnt264@gmail.com>
media: sun4i-csi: fix video device and subdev leak in notify_complete()

This commit fixes resource leaks in sun4i_csi_notify_complete() by unwinding
registrations in reverse order on error paths. It explicitly unregisters the
video device and bridge subdev if intermediate registration steps fail.

Cc: stable@vger.kernel.org

> diff --git a/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c b/drivers=
/media/platform/sunxi/sun4i-csi/sun4i_csi.c
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
This is a pre-existing issue, but does this error path leave a use-after-fr=
ee
vulnerability if userspace opens the device node before it gets unregistere=
d?

The video_device is embedded in struct sun4i_csi which is allocated with
devm_kzalloc() during sun4i_csi_probe(). In sun4i_csi_v4l2_register(), the
release callback is overridden:

vdev->release =3D video_device_release_empty;

If sun4i_csi_notify_complete() executes synchronously during probe and expo=
ses
the device node, userspace can open it immediately. If a subsequent setup s=
tep
fails, this error path unregisters the video device and returns the error b=
ack
up to probe().

When probe() fails, the devres core automatically frees the sun4i_csi memor=
y.
Because video_device_release_empty is used instead of a refcounted release,
any active file descriptors held by userspace will now point to freed memor=
y,
causing a use-after-free on subsequent access or close.

> +err_unregister_subdev:
> +	v4l2_device_unregister_subdev(subdev);
> =20
>  	return ret;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260810062521.1709=
379-1-congnt264@gmail.com?part=3D1
