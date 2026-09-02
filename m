Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F1F543F4C3
	for <linux-sunxi@lists.linux.dev>; Wed,  2 Sep 2026 20:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788380261; cv=none; b=aHZA9KXuM9Fc5vSTCwSCSY1monixnbktZS25yafk35kc7dk2g7lFYFnx/cR6QmE7pXsrtnloCVjWqYgNxo6LW5/1ifYEgJ46rnxJA1MRS9zh/h6zfdavCUP8rnZalTwWsqEkPGErrU8Tsc4RIlKST2MY69J408HySDfGSpuPMd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788380261; c=relaxed/simple;
	bh=dVUajAAPWQARU7rUIXxFPzMA0W0sIhdqTnJvlFPzq/k=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tzuW+2THoVwO1VHm7O1m4vg0/o+hYEYak9GNl3dNUQBUOorsnDljj6CpG0YXPSio6wQ8qmXZ7ZUlupxRrenxvp/loYp8ZICAioughhqnx4s6OqIeLRiLoAX/BJ5q0n4jswANStylZFryP0li96qgc9CVbk05T6Vd7jRDKRiLJ4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gpL4C83z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gpL4C83z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 867A81F000E9;
	Wed,  2 Sep 2026 20:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788380259;
	bh=OBO54VvWjFsoY0Dt4P8LEm+uzljcbCD0oXFNQeuswVQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gpL4C83zZw1WvTv8kH2bPiUN11X2BbZ0h/xs8VkoQfzkpQF5snjbnNkI6OEBKY1r6
	 0gnRysyRTD9h2XVQF2d32irzwVLgREUUnhDgEooMQWD8PC/blKlKfodArVtsD89dSe
	 P/XDHYkVSgkUW/Qh6MD6H7X9QnvQZm5dE0U8WRriJ7iJDwRtIqtXh0lftk2hWzc8AX
	 Jhkn9VFElQOS4PWmvyNVmRa2iEsTdpOHXyjjuI6SGv2/N3Tcxfn4Y143NycXjwVRn7
	 4BRTVGzT01Xqjfq1P/LRglzONmgyFjpLPJ0vvJ0IHF4CUVGZvEBPwyk7v4YhINd7Jg
	 /xm7U2aLUL2UQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/6] media: nuvoton: npcm-video: Use
 devm_of_reserved_mem_device_init()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mukesh Ojha" <mukesh.ojha@oss.qualcomm.com>
Cc: media-ci@linuxtv.org, linux-sunxi@lists.linux.dev
In-Reply-To: <20260902200703.2016410-4-mukesh.ojha@oss.qualcomm.com>
References: <20260902200703.2016410-1-mukesh.ojha@oss.qualcomm.com>
 <20260902200703.2016410-4-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 20:17:39 +0000
Message-Id: <20260902201739.867A81F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Potential use-after-free of the driver's private `video` structure=
 in the interrupt handler due to devres lifecycle mismatch.
- [High] V4L2 lifecycle mismatch causes a use-after-free of the embedded `v=
ideo_device` structure.
- [High] Device-managed allocations are incorrectly attached to an external=
 child device, causing memory leaks and preventing reprobing.
--

commit 5d2eb460720d228622a94970ff2802d5f5591843
Author: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

media: nuvoton: npcm-video: Use devm_of_reserved_mem_device_init()

Switch to devm_of_reserved_mem_device_init() so the reserved memory
region is released automatically on probe failure or device removal.
Remove the four explicit of_reserved_mem_device_release() calls and
collapse the now-empty err_release_mem label into err_free.

> diff --git a/drivers/media/platform/nuvoton/npcm-video.c b/drivers/media/=
platform/nuvoton/npcm-video.c
> index 52505af35c087..6786736c8f07c 100644
> --- a/drivers/media/platform/nuvoton/npcm-video.c
> +++ b/drivers/media/platform/nuvoton/npcm-video.c
> @@ -1715,17 +1715,15 @@ static int npcm_video_init(struct npcm_video *vid=
eo)
>  		return rc;
>  	}
> =20
> -	of_reserved_mem_device_init(dev);
> +	devm_of_reserved_mem_device_init(dev);
>  	rc =3D dma_set_mask_and_coherent(dev, DMA_BIT_MASK(32));
>  	if (rc) {
>  		dev_err(dev, "Failed to set DMA mask\n");
> -		of_reserved_mem_device_release(dev);
>  		return rc;
>  	}
> =20
>  	rc =3D npcm_video_ece_init(video);

[Severity: High]
This is a pre-existing issue, but could this leak resources when the
npcm-video driver is unloaded?

In npcm_video_ece_init() in drivers/media/platform/nuvoton/npcm-video.c,
the driver fetches the external device node ece_pdev and uses its device
pointer for devres allocations:

	regs =3D devm_platform_ioremap_resource(ece_pdev, 0);
	...
	video->ece.reset =3D devm_reset_control_get(ece_dev, NULL);

Since these allocations are tied to the external nuvoton,ece device's
lifecycle rather than the driver's device, the resources won't be released
when the npcm-video driver unbinds. If the driver is re-probed, could the
ioremap request fail with -EBUSY and permanently break the driver?

>  	if (rc) {
> -		of_reserved_mem_device_release(dev);
>  		dev_err(dev, "Failed to initialize ECE\n");
>  		return rc;
>  	}

[ ... ]

> @@ -1789,13 +1787,11 @@ static int npcm_video_probe(struct platform_devic=
e *pdev)
> =20
>  	rc =3D npcm_video_setup_video(video);
>  	if (rc)
> -		goto err_release_mem;
> +		goto err_free;
> =20
>  	dev_info(video->dev, "NPCM video driver probed\n");
>  	return 0;
> =20
> -err_release_mem:
> -	of_reserved_mem_device_release(&pdev->dev);
>  err_free:
>  	kfree(video);

[Severity: High]
This is a pre-existing issue, but can this cause a use-after-free of the
driver's private video structure in the interrupt handler?

If npcm_video_probe() in drivers/media/platform/nuvoton/npcm-video.c fails
here, the driver manually calls kfree(video). However, earlier in
npcm_video_init(), the interrupt was registered using
devm_request_threaded_irq().

Because devres cleanup happens after the probe function returns, the IRQ
remains registered and capable of firing while the video structure has alre=
ady
been freed. If an interrupt fires during this window, won't the handler
execute and access the freed structure?

>  	return rc;
> @@ -1814,7 +1810,6 @@ static void npcm_video_remove(struct platform_devic=
e *pdev)
>  	if (video->ece.enable)
>  		npcm_video_ece_stop(video);
>  	kfree(video);

[Severity: High]
This is a pre-existing issue, but can this kfree() also trigger a
use-after-free due to the devm-managed IRQ lifecycle, similar to the probe
error path?

In npcm_video_remove() in drivers/media/platform/nuvoton/npcm-video.c, the
devres cleanup won't disable the interrupt until after the remove function
finishes. This leaves a window where the IRQ can fire and access the freed
video structure.

[Severity: High]
This isn't a bug introduced by this patch, but can this cause a
use-after-free if userspace still has the V4L2 device open?

In npcm_video_setup_video() in drivers/media/platform/nuvoton/npcm-video.c,
the driver embeds struct video_device inside its dynamically allocated
struct npcm_video and sets its .release callback to
video_device_release_empty.

Since video_unregister_device() in npcm_video_remove() does not wait for fi=
le
descriptors to be closed, could subsequent userspace operations access the
embedded vdev after this kfree() has freed the enclosing structure?

> -	of_reserved_mem_device_release(dev);
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260902200703.2016=
410-1-mukesh.ojha@oss.qualcomm.com?part=3D3
