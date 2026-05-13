Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D5F2110E
	for <linux-sunxi@lists.linux.dev>; Wed, 13 May 2026 00:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778631012; cv=none; b=o615KmQUu5dJI8ezPVlFb9clD/Dj2xb+7zoJ5XI3jSyjREOpGyNruaO4xQBkx0jjKM3VjH/njfo1WGL2J8xocgHTR3yhYZo+HNbfEDNXcs+Y7YS6xi43HvJie2fUUYotzaHTdHFNwphJYBSMqw9jy3SLKcLIs2IGELSf53bVpu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778631012; c=relaxed/simple;
	bh=MRy0UqjLUyoCetuWmZEZkRRJcbJUUCLxH31+2dHiA3U=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=emsmOTPCGHlOOFnVG3Ul920cRE32cerWuvUdLo87TfvkJ0ZqG9AdmDytO7xwoMzvtwSSrqubEHwG0SCbarlZtmxorFuZXq1oyJgp9yBBEh02yY4Pr06VZfgxFKz+P2NitiEZk7gKb/VLC0EFKSO1EzyJP7opT5o/800pSWmpWJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LktCHPav; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LktCHPav"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53AD8C2BCB0;
	Wed, 13 May 2026 00:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778631012;
	bh=MRy0UqjLUyoCetuWmZEZkRRJcbJUUCLxH31+2dHiA3U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=LktCHPavSUTkhid+da6MDkDEzjZHAva7NVP8i1OjUNh1lur81dFL2+G91391Mf3Rh
	 tOIhrBNoIZ45SsYBpispKUdjXcvU0hPfTmFBbhLovOywK4MTXIJV9cE3fxJm619yMj
	 FMUFXVgEbA7l2ssV60CbDuX3SebzlHDbDFNwvgbHLsiLQxGiwI+NChS0iw1LOaZWsK
	 FbQZeUWLpxCpnS6lvDIQKzZG1krRbj9O5cZn8rCTJ+50bLfcHnt8OMcCy4b6oMHCYh
	 8CbLOuov70sCk3iZRYCIxdbp6FO0USo8FZ94Tj/Mg9T53H+KQJ00hFxP1PmssvUVEe
	 Vv1HNJ1Xxi8Vg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/6] media: rtl2832_sdr: Return queued buffers on
 start_streaming() failure
Reply-To: sashiko-reviews@lists.linux.dev
To: "Valery Borovsky" <vebohr@gmail.com>
Cc: linux-sunxi@lists.linux.dev
In-Reply-To: <d10ab7f1bb6b4ee1760967f1957191a341b08354.1778518085.git.vebohr@gmail.com>
References: <d10ab7f1bb6b4ee1760967f1957191a341b08354.1778518085.git.vebohr@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 13 May 2026 00:10:11 +0000
Message-Id: <20260513001012.53AD8C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Critical] Unbounded memory leak and Out-Of-Bounds read/crash due to unro=
lled allocations on start_streaming failure.
- [High] Silent DMA memory leak on device disconnect due to cleared `udev` =
pointer.
--

commit b46c390ec17dc3b72b2306b1cffbddd15df567b7
Author: Valery Borovsky <vebohr@gmail.com>

media: rtl2832_sdr: Return queued buffers on start_streaming() failure

This commit fixes a memory leak of queued vb2 buffers when
rtl2832_sdr_start_streaming() returns an error. It adds explicit buffer
cleanup using a new helper function on the error paths.

> diff --git a/drivers/media/dvb-frontends/rtl2832_sdr.c b/drivers/media/dv=
b-frontends/rtl2832_sdr.c
> index 422d1a7b5456e..c564485e3bbb5 100644
> --- a/drivers/media/dvb-frontends/rtl2832_sdr.c
> +++ b/drivers/media/dvb-frontends/rtl2832_sdr.c
> @@ -855,11 +856,15 @@ static int rtl2832_sdr_start_streaming(struct vb2_q=
ueue *vq, unsigned int count)
> =20
>  	dev_dbg(&pdev->dev, "\n");
> =20
> -	if (!dev->udev)
> +	if (!dev->udev) {
> +		rtl2832_sdr_cleanup_queued_bufs(dev, VB2_BUF_STATE_QUEUED);
>  		return -ENODEV;
> +	}

[ ... ]

> @@ -900,7 +905,11 @@ static int rtl2832_sdr_start_streaming(struct vb2_qu=
eue *vq, unsigned int count)
>  	if (ret)
>  		goto err;
> =20
> +	mutex_unlock(&dev->v4l2_lock);
> +	return 0;
> +
>  err:
> +	rtl2832_sdr_cleanup_queued_bufs(dev, VB2_BUF_STATE_QUEUED);
>  	mutex_unlock(&dev->v4l2_lock);
> =20
>  	return ret;

This isn't a bug introduced by this patch, but if rtl2832_sdr_submit_urbs()
fails and jumps to this error path, do we leak the newly allocated dma stre=
am
buffers and urbs?

If userspace repeatedly attempts to start the stream via the streamon ioctl,
rtl2832_sdr_alloc_stream_bufs() unconditionally resets dev->buf_num =3D 0 a=
nd
overwrites dev->buf_list[], permanently leaking the dma memory.

Furthermore, rtl2832_sdr_alloc_urbs() does not reset dev->urbs_initialized;
it blindly increments it on each successful urb allocation. On a second
attempt, dev->urbs_initialized could exceed the array bounds. Later, when
rtl2832_sdr_free_urbs() is called, could it iterate from
dev->urbs_initialized - 1 down to 0, reading out-of-bounds past the
dev->urb_list[] array and passing garbage pointers to usb_free_urb(),
potentially causing a panic?

[ ... ]

> @@ -920,7 +929,7 @@ static void rtl2832_sdr_stop_streaming(struct vb2_que=
ue *vq)
>  	rtl2832_sdr_kill_urbs(dev);
>  	rtl2832_sdr_free_urbs(dev);
>  	rtl2832_sdr_free_stream_bufs(dev);

This isn't a bug introduced by this patch, but if dev->udev is cleared to
null by the disconnect handler during device removal, does this cause a
silent dma memory leak?

When the user-space application eventually closes its file descriptor after=
 a
device unplug, it triggers the vb2 release paths and calls
rtl2832_sdr_stop_streaming() which calls rtl2832_sdr_free_stream_bufs().

Because dev->udev is already null, usb_free_coherent(dev->udev, ...) will
immediately abort without freeing or unmapping the memory. Does this
guarantee that all dma stream buffers are permanently leaked every time the
sdr dongle is unplugged while streaming?

> -	rtl2832_sdr_cleanup_queued_bufs(dev);
> +	rtl2832_sdr_cleanup_queued_bufs(dev, VB2_BUF_STATE_ERROR);
>  	rtl2832_sdr_unset_adc(dev);
> =20
>  	/* sleep tuner */

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1778518085.gi=
t.vebohr@gmail.com?part=3D4
