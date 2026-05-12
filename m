Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4642539BFF1
	for <linux-sunxi@lists.linux.dev>; Tue, 12 May 2026 22:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778624229; cv=none; b=X6QVe9iS2YDWlPv2iCQ5NjWBuY811LlIKOFCRQP+UnBBu3pTXE5na6ZduyEjDKWaeX8L6ESzy/yRtgRgPFRvF6dXgwVDATu0xVyDIlJ87xJY2YE+MJxtNTBWIR6shGpj2XVx5hXQ6XflWrSyJua85Ie5tZ4nn9pKjyQ/KE7DgBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778624229; c=relaxed/simple;
	bh=bUFpPLF2qWBni97doLZ26iJFMp1ja2xg4l5bussOn7U=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=IzQp8wgD32mlj9HM39KQRnfyJkBe3UKt5vHxUDTT598BfS1guUW0Z+9ZporHQF8A9xMjnIthKRQDUT1kxjhh9ZeGrriDnuf8I++8ODSmnaO3OpwSO6oV81yt46hrdZmhmSj8vKDDytfsLUNxwk3+ehexxFNo60CE8+awHCj203s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mvJhY51V; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mvJhY51V"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB82BC2BCB0;
	Tue, 12 May 2026 22:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778624228;
	bh=bUFpPLF2qWBni97doLZ26iJFMp1ja2xg4l5bussOn7U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=mvJhY51Vu5kkiw9eXd4S+aFCJ2HPBLdBOLOeRPxTAXBhMQaWuZV90EbbAl4VAT61V
	 8BZAgkCRzAxtvCaDeaDtuEWol4+lyex9dU1PGM9+y1C4w3ZIL83tlsQM8RhLpz5nae
	 ZfKeStmcMWlkkLFztGw+hsZW5qYVKGVCt8KK9nF1V4drypN1sEv9JeQQ0gOOf+gPh0
	 YZYsx605ogAPb2DpIyK1X5oEXYXw4HpG0ksCt+CXgJMfEzkw1QjkOzFNKndLusV3L4
	 6VnXNFPw/7YYl7IhDXrxITgpCWKlG+0ZJdo5BjHjRLAzy3LMd12AwzMtoUWRmZ8nn2
	 HAyNdLuVFMN3A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/6] media: airspy: Return queued buffers on
 start_streaming() failure
Reply-To: sashiko@lists.linux.dev
To: "Valery Borovsky" <vebohr@gmail.com>
Cc: linux-sunxi@lists.linux.dev
In-Reply-To: <649601988189f031670215cb35add5e80439559d.1778518085.git.vebohr@gmail.com>
References: <649601988189f031670215cb35add5e80439559d.1778518085.git.vebohr@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 12 May 2026 22:17:08 +0000
Message-Id: <20260512221708.BB82BC2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Disconnect during active streaming will inevitably cause a NULL po=
inter dereference in stop_streaming().
--

commit aad07499864faeab3c34f7bb9874675e7d87bb17
Author: Valery Borovsky <vebohr@gmail.com>
Subject: media: airspy: Return queued buffers on start_streaming() failure

The vb2 framework hands buffers to the driver via buf_queue() before
calling start_streaming(). If start_streaming() returns an error without
first returning those buffers via vb2_buffer_done(), the queued buffers
leak. This patch returns them on failure, including the device disconnect
case where start_streaming() previously exited early.

> diff --git a/drivers/media/usb/airspy/airspy.c b/drivers/media/usb/airspy=
/airspy.c
> index 8f6b721ba107c..57edb42463e81 100644
> --- a/drivers/media/usb/airspy/airspy.c
> +++ b/drivers/media/usb/airspy/airspy.c
> @@ -522,11 +522,13 @@ static int airspy_start_streaming(struct vb2_queue =
*vq, unsigned int count)
> =20
>  	dev_dbg(s->dev, "\n");
> =20
> -	if (!s->udev)
> -		return -ENODEV;
> -
>  	mutex_lock(&s->v4l2_lock);
> =20
> +	if (!s->udev) {
> +		ret =3D -ENODEV;
> +		goto err_clear_bit;
> +	}
> +

This isn't a regression introduced by this patch, but since we are handling
the disconnected state here, what happens if the physical USB device is
unplugged while streaming is already active?

If airspy_disconnect() runs and sets s->udev =3D NULL, and later the user
process closes the file descriptor triggering stream cleanup:

vb2_core_streamoff()
  airspy_stop_streaming()
    airspy_ctrl_msg(s, CMD_RECEIVER_MODE, 0, 0, NULL, 0)
      usb_sndctrlpipe(s->udev, 0)
        __create_pipe(dev, endpoint)

Could this unconditionally dereference the NULL s->udev pointer (accessing
dev->devnum) and cause a kernel oops?

Additionally, airspy_free_stream_bufs() is called immediately after:

airspy_stop_streaming()
  ...
  airspy_free_stream_bufs(s)
    usb_free_coherent(s->udev, ...)

Would passing the NULL s->udev pointer here also be problematic during
unplug?

Should there be a similar check for !s->udev in airspy_stop_streaming()
before attempting hardware communication and resource cleanup?

>  	s->sequence =3D 0;
> =20
>  	set_bit(POWER_ON, &s->flags);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1778518085.gi=
t.vebohr@gmail.com?part=3D1
