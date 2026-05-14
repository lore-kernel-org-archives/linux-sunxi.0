Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 529EF2D7D2E
	for <linux-sunxi@lists.linux.dev>; Thu, 14 May 2026 02:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778726251; cv=none; b=jkNNGUPyF7fzOu1PXXKEh8qeP8gole0/C/VEqUOdsNEaRteE2Wp366Rckcx6CxIT6Vcwe9+4czD2/Vd0yVdl+RtBL2UCD7wCeYEu+w0F61f0ey7smAlnZMWv3eGCZWgn+QwxGooDmMe01fD2XFxwLVeNsjarHJEjMGb2Ft41ULs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778726251; c=relaxed/simple;
	bh=gkuwgivm7d8LdlWGpAqGXIq82hx4yvyLYF+MvUBjfOE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Hp9lcUOgLmS0JpV7lhR5R2xLHtzyEgOSAz4f0qKBw4Z5axZ+s05kP6fmow3Mfjyy0MiAVmq4xIn1fVFxrh6cXyYPJe4pHOWwrLCRQV7tqmDwEdqmiVbV18+HC9gVyJIC4NzRdVcY2SK1dpROwdJbohAsdleqHDUxirur0CynUrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZtEZPDjL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZtEZPDjL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1D14C19425;
	Thu, 14 May 2026 02:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778726250;
	bh=gkuwgivm7d8LdlWGpAqGXIq82hx4yvyLYF+MvUBjfOE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=ZtEZPDjLqUX3uOEUiRzGtqX6VFQMA5pVbOABIOJa2pyiVMMkRXKzH/0zbCqy1Jtj7
	 x8tfK32+f3hbxWpfG6hL0mNvrz5po3AC+MKZ/4cIZvJ9xlr8aOk8gyNvn0QotbnKWM
	 JvpcrwOAQ5uS+pAavwHAdXZd9McyA6VmXYo23NiWN5rPxitpdjmCsk3uRQYEkgWz5x
	 0o+r41I6sZl4ULzCdHAFdlx4XfcrC/JPVf5xegRzRYF3dXdgAwFyyeEBLA3Ns37zEx
	 bD6zuE7Sr48waDkwKpryEq4HFvs1FumzCvOJnFjT09xNO0y5/irwNbCcPaCihWAEwN
	 7ajOzeYebJY7g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] media: rc: sunxi-cir: unregister rc device on probe
 failure
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?67CV66qF7ZuI?= <mhun512@gmail.com>
Cc: linux-sunxi@lists.linux.dev
In-Reply-To: <20260424000000.558-1-mhun512@gmail.com>
References: <20260424000000.558-1-mhun512@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 02:37:28 +0000
Message-Id: <20260514023730.C1D14C19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] The newly added error path leaks the `rc_dev` structure.
- [High] Device registration and IRQ request occur before hardware clocks a=
re enabled, creating a race condition that can panic the kernel.
- [High] Mixing devm-managed IRQ with manual error path cleanup creates a U=
se-After-Free vulnerability.
- [High] Unvalidated `clock-frequency` device tree property allows a divide=
-by-zero kernel panic.
--

commit 230e9a371e882d2d3972a39ec6ca89c53afbeaf9
Author: Myeonghun Pak <mhun512@gmail.com>

media: rc: sunxi-cir: unregister rc device on probe failure

This commit updates the error handling in sunxi_ir_probe() to ensure the
RC device is unregistered if a failure occurs after rc_register_device()
succeeds.

While reviewing this commit, I noticed a few potential issues, including
some existing concerns in the probe function.

> diff --git a/drivers/media/rc/sunxi-cir.c b/drivers/media/rc/sunxi-cir.c
> index cb4c56bf0752a..f40f3ea0ac8e5 100644
> --- a/drivers/media/rc/sunxi-cir.c
> +++ b/drivers/media/rc/sunxi-cir.c
> @@ -344,22 +344,26 @@ static int sunxi_ir_probe(struct platform_device *p=
dev)
>  	ir->irq =3D platform_get_irq(pdev, 0);
>  	if (ir->irq < 0) {
>  		ret =3D ir->irq;
> -		goto exit_free_dev;
> +		goto exit_unregister_dev;
>  	}
> =20
>  	ret =3D devm_request_irq(dev, ir->irq, sunxi_ir_irq, 0, SUNXI_IR_DEV, i=
r);
>  	if (ret) {
>  		dev_err(dev, "failed request irq\n");
> -		goto exit_free_dev;
> +		goto exit_unregister_dev;
>  	}
> =20
>  	ret =3D sunxi_ir_hw_init(dev);

Is there a race condition since rc_register_device() and devm_request_irq()
are called before sunxi_ir_hw_init() enables the hardware clocks?

If an early interrupt fires, or if userspace interacts with the device via
sysfs or lirc (like setting the timeout), could the driver attempt to read
or write memory-mapped registers while the clocks are still disabled?

Also, if sunxi_ir_hw_init() fails, the code jumps to exit_unregister_dev.
Because the IRQ is managed by devm_request_irq(), it remains active until
the probe function completely returns. If the interrupt fires concurrently
while rc_unregister_device() is tearing down the device, could the handler
access freed resources?

>  	if (ret)
> -		goto exit_free_dev;
> +		goto exit_unregister_dev;
> =20
>  	dev_info(dev, "initialized sunXi IR driver\n");
>  	return 0;
> =20
> +exit_unregister_dev:
> +	rc_unregister_device(ir->rc);
> +	return ret;
> +

Does this error path leak the rc_dev structure?

rc_allocate_device() initializes the structure with a reference count of 1.
While rc_unregister_device() removes the device from the system, it does
not drop this initial reference count.

Would it be necessary to fall through or explicitly call rc_free_device()
here to fully free the memory?

>  exit_free_dev:
>  	rc_free_device(ir->rc);
> =20

Additionally, earlier in sunxi_ir_probe(), the driver reads the
clock-frequency property and calculates the rx_resolution:

drivers/media/rc/sunxi-cir.c:sunxi_ir_probe() {
        ...
        of_property_read_u32(dn, "clock-frequency", &b_clk_freq);
        ...
        ir->rc->rx_resolution =3D (USEC_PER_SEC / (b_clk_freq / 64));
        ...
}

Could this cause a divide-by-zero issue? If the device tree specifies a
clock frequency less than 64 (such as 0), b_clk_freq / 64 would evaluate
to 0.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260424000000.558-=
1-mhun512@gmail.com?part=3D1
