Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 992533164C7
	for <linux-sunxi@lists.linux.dev>; Tue, 12 May 2026 23:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778629025; cv=none; b=MoCf08RKByk94uIe+CroHCH6nLZzhPk90/HIKTyiti1ruS+HogHJ1/5Km3H++BTwveS3zXl1HoAwj43nxP0NWdO4H928KFx5acw+bGZLs5mJdkrBNytlokimE5Jvp1cwB0Q/oLFgDGppWBMH7MEPg7lv68ZsV+Ubc4FBzJp9zHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778629025; c=relaxed/simple;
	bh=s/AhI8Ct5VnV7Flk+3HWm65cZR48OJ4/aMhTKwaGgrA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CJcTjETZr5ReSxvx7t7MAJBc8E6XqcF7vVqsuSfoCkJteyDF8+74YR0qJH1ZyyMwr0//KmS+12M74awAcRZDz85DdUcIN3dE+5IHn33343dWsPuHIKO3W+guYe0ACgEZ6JNvREOeUkN7Tc3wJSn0FG1rqTKzxP82X0+2+kH91l8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mty134Ay; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mty134Ay"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 689B1C2BCB0;
	Tue, 12 May 2026 23:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778629025;
	bh=s/AhI8Ct5VnV7Flk+3HWm65cZR48OJ4/aMhTKwaGgrA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=Mty134Ayj3cZy2wBytIh8iZVHTGxl1Ru1Cz4TvuawmXapWoS78RQ4AEfjHu7Tx3en
	 1McNm4sMcMvyfSUNz5YN6BoauACIgFlnzVsIr9BsK6V/jM87GFOUnMpjIT8yB2wBbZ
	 kMFkJWi+CyFiMAhZKaqKBgFVIsnj/XyC6IG6RBQZXasOdiDlezBczFy8SqExRVcNpm
	 ocKfD40ZYdlt6wDFi8MaNsGCrBnkP7M2gr3uxlCcFWD6E20O0NRaNaK4yIublxvXAD
	 qJxx1I0LcND7TDJ1VlWI03lxL6cDIoim45aQeRDqB9YaT9sRy1OkhKJjZ2Krd7Mt6q
	 Vi6OdKB75JfQw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/6] media: pwc: Return queued buffers on
 start_streaming() failure
Reply-To: sashiko-reviews@lists.linux.dev
To: "Valery Borovsky" <vebohr@gmail.com>
Cc: linux-sunxi@lists.linux.dev
In-Reply-To: <d0fdfb94b56871e757812bfb7aa58e83f7215903.1778518085.git.vebohr@gmail.com>
References: <d0fdfb94b56871e757812bfb7aa58e83f7215903.1778518085.git.vebohr@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 12 May 2026 23:37:05 +0000
Message-Id: <20260512233705.689B1C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Incomplete Buffer Cleanup on Error in `start_streaming()` causing =
a buffer leak
--

commit 39f02233e64ac5cb48aca4fd3aaf5db7ee99320b
Author: Valery Borovsky <vebohr@gmail.com>
Subject: media: pwc: Return queued buffers on start_streaming() failure

This commit addresses leaked buffers during start_streaming() failures
by ensuring queued buffers are returned to videobuf2 before returning an
error on the early exit paths.

Cc: stable@vger.kernel.org

> diff --git a/drivers/media/usb/pwc/pwc-if.c b/drivers/media/usb/pwc/pwc-i=
f.c
> --- a/drivers/media/usb/pwc/pwc-if.c
> +++ b/drivers/media/usb/pwc/pwc-if.c
> @@ -710,11 +710,15 @@ static int start_streaming(struct vb2_queue *vq, un=
signed int count)
>  	struct pwc_device *pdev =3D vb2_get_drv_priv(vq);
>  	int r;
> =20
> -	if (!pdev->udev)
> +	if (!pdev->udev) {
> +		pwc_cleanup_queued_bufs(pdev, VB2_BUF_STATE_QUEUED);

Does this cleanup catch buffers that might have been moved to pdev->fill_bu=
f?

While this isn't a new regression introduced by this specific patch, it
looks like a buffer leak could still happen if pwc_isoc_init() fails later
in this function.

During pwc_isoc_init(), usb_submit_urb() is called with GFP_KERNEL and
can sleep. If a previously submitted URB completes successfully before the
loop finishes, its completion handler pwc_isoc_handler() can execute and
move a buffer from pdev->queued_bufs into pdev->fill_buf.

If a subsequent usb_submit_urb() fails, pwc_isoc_init() aborts and kills
the URBs. The error path in start_streaming() then executes
pwc_cleanup_queued_bufs(). Since pdev->fill_buf is no longer in the list,
it would be ignored by the cleanup routine and leaked, triggering the
same WARN_ON(owned_by_drv_count) trap.

Should pdev->fill_buf be explicitly checked and returned to videobuf2 on
failure, similar to how it is handled in stop_streaming()?

>  		return -ENODEV;
> +	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1778518085.gi=
t.vebohr@gmail.com?part=3D3
