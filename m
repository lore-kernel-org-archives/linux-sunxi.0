Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DF383C5823
	for <linux-sunxi@lists.linux.dev>; Fri, 10 Jul 2026 09:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783674202; cv=none; b=Kr93WX97H/ECRYVPBB+FZweexhIdSQKyykQPypOUssVcl83Em13TaJ+KMb1hU4cEblS8mTiG4QWwRbEC18xiyQHzV7glIJ7MSFUxe9aIXtAOMEyt+VHo1ku+Xrk3wydWC8ztAQK7PD5c6JkayAvTFyoGZg28nWh+0Ihj1aX4/OA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783674202; c=relaxed/simple;
	bh=+NDha8slwu2mjQ+/5M4gz1q042LiXM2u77fFPHSbszM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=pOk0h2cTsP9JlodmzpVyIsV9QkPq8s+DpkhUN5ppmHeQGvVy4q6soUC0qcS5cSOFNaZCy+yzj8Rn/PLAH3hJVSOHzeKcl/ENOhy+OyZ1SGM34ie4b2t89LeGOmBM640QmcEGRDPbxOWuZULUhEInThGARrXMhOm88GZAFXR0A9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PBYa5qOD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PBYa5qOD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B85C1F000E9;
	Fri, 10 Jul 2026 09:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783674199;
	bh=tL8X/iE7ZQf1bvybRUg/7B3mKPU/c2No4kcG4X6gb3c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PBYa5qOD+VLlrXqy5NDYyfeP18VKmTRB4P5d0S2nCpKnEyVd1betwaZHhz9g3mfcK
	 LKACI9TRo66HaQmDdCihsktQgs5+6w+UwJ5ZFKwlRRxpo7JGclwqndAdqYkkE5MFhE
	 OYFyK/iSvhiK/gQh30a+7JfOj/UTzQxSt+89ZEsMelEXQ30G7XwnlbCkkRBMwUn18J
	 mHayPjsrvqehNYtB4RwnW9HPm674Grp4ApWyaxqZU4iDyy652mMBL9QyF6ilrRNz6s
	 U+KwRQqJgDusoUu17HE41jXy+iGywZeBiSpI7RRkrVfIsWkhfdIn21P8Uv28xjim7m
	 HVc3DgS9GbJLA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/7] media: sunxi-cir: Ensure no more interrupts can
 occur before free
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sean Young" <sean@mess.org>
Cc: linux-sunxi@lists.linux.dev
In-Reply-To: <e74a0caf91aaefaf98476a191e6489c606632bf1.1783673420.git.sean@mess.org>
References: <cover.1783673420.git.sean@mess.org>
 <e74a0caf91aaefaf98476a191e6489c606632bf1.1783673420.git.sean@mess.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 10 Jul 2026 09:03:19 +0000
Message-Id: <20260710090319.8B85C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The patch fails to fix the IRQ Use-After-Free race condition and e=
xacerbates a bus fault vulnerability by disabling hardware clocks without s=
ynchronizing the devm-managed interrupt.
- [High] The interrupt is requested before the hardware is initialized in t=
he probe function, leading to a possible bus fault on spurious interrupts a=
nd a Use-After-Free in the error path.
--

--- Patch [4]: [PATCH 4/7] media: sunxi-cir: Ensure no more interrupts can =
occur before free ---
commit 8ac4bdb72847c70ea6f26a6012ec7552bc70de07
Author: Sean Young <sean@mess.org>

media: sunxi-cir: Ensure no more interrupts can occur before free

This commit reorders the device removal sequence to call rc_free_device()
only after the hardware has been stopped via sunxi_ir_hw_exit(). The stated
intent is to prevent interrupts from occurring after the device is freed.

> diff --git a/drivers/media/rc/sunxi-cir.c b/drivers/media/rc/sunxi-cir.c
> index 28e840a7e5b8c..af1ee08ffdbec 100644
> --- a/drivers/media/rc/sunxi-cir.c
> +++ b/drivers/media/rc/sunxi-cir.c
> @@ -374,8 +374,8 @@ static void sunxi_ir_remove(struct platform_device *p=
dev)
>  	struct sunxi_ir *ir =3D platform_get_drvdata(pdev);
> =20
>  	rc_unregister_device(ir->rc);
> -	rc_free_device(ir->rc);
>  	sunxi_ir_hw_exit(&pdev->dev);
> +	rc_free_device(ir->rc);

[Severity: High]
This is a pre-existing issue, but does this sequence completely prevent
interrupts from occurring before the free?

Because the interrupt is managed by devm_request_irq(), it remains active
until devres cleanup runs after sunxi_ir_remove() completes. Since
sunxi_ir_hw_exit() only disables clocks, if a pending or spurious interrupt
fires afterward, sunxi_ir_irq() will access unclocked memory-mapped registe=
rs
and trigger a bus fault.

Additionally, if the interrupt handler runs concurrently on another process=
or:

sunxi_ir_irq()
    ir_raw_event_overflow(ir->rc);

could it access ir->rc after it is freed by rc_free_device() here, since
there is no synchronize_irq() or disable_irq() in sunxi_ir_remove()?

[Severity: High]
This is also a pre-existing issue, but does sunxi_ir_probe() suffer from a
similar race condition?

In sunxi_ir_probe(), devm_request_irq() is called to unmask the interrupt
before sunxi_ir_hw_init() enables the clock. If a pending interrupt from
a previous boot or a spurious interrupt fires during this window,
sunxi_ir_irq() will execute before the clock is enabled, potentially causing
a bus fault.

Also, if sunxi_ir_hw_init() fails, the error path eventually calls
rc_free_device() without explicitly disabling the active interrupt, which
leaves a window for a use-after-free on ir->rc.

>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1783673420.gi=
t.sean@mess.org?part=3D4
