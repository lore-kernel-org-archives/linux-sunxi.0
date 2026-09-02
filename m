Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2DDA4A8408
	for <linux-sunxi@lists.linux.dev>; Wed,  2 Sep 2026 20:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788380282; cv=none; b=QK2oEWyGjfPTxNKxL76qtoLmHf9R6LCgoH+/zDugZPYjd+rs1ElEYDABtIV7dOCB8vb0776K9gqp9JjLRhRoBeVay3kHeN8/D0d9Pt2xXVkrkL8VcmhvsrA0Fw1mkcQoGC3FmQaNh5y4DUptvGO1ciMPBwO5RWLSQO3DIlC0k+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788380282; c=relaxed/simple;
	bh=l5uD49KdXzZ0Lb+1Am+HB4AIvl9T+ZcbWwDtgWv1kUA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UG/2TC+4bNd0chKo8pyttzhdt00UJ1lkT0GahJn2oZQplLFc1AwSBrPdbkcSoG5/VZwxfKJCPEu98BkL+NyPIh3ZblPM8h54KI6QgzbfC2VNVHKQNoFlWpH3lg7WdE6hTzSbGi9cIZROznfIv7i57UWc56pg/A3YT5dI3zIGGEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HDC8UaHG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HDC8UaHG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5822B1F00A3D;
	Wed,  2 Sep 2026 20:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788380280;
	bh=veYlhELHNjVnCA1U7UFEllpFNQDR/Xghxh5hJ/5z7B0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HDC8UaHGdsbJzrLjPnALyj5Z8/+vR/p9WTtAZDTl/pa8kHsiWXLUwwO7pIr52B5wV
	 4c0bwpVpkVMsXLtFV/9BEghroduCArTf+ZUKyOr7/e1IK7zjwHLJHmm/FTrllSZgXc
	 5madqtyPeO8/mlIG8qHiCmjsdgzgFMOsrzF8kVdrFErRmYnvsDFve3OqW/jUPrgiiT
	 1RXirRcjZB5F9vUvz+WKi9LSwgKYX8LorxkMU7ie1H3YVZfTHL/5xOpl9MOAdc/PPj
	 HlHbvpdYkB0opoOU9X6dRRUsCkmGyXCUVOhjWGua/EntvWRz8v6r0MRGnn1jPRHuVV
	 m+Ti94vE+tocw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 5/6] media: mediatek: vpu: Use
 devm_of_reserved_mem_device_init()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mukesh Ojha" <mukesh.ojha@oss.qualcomm.com>
Cc: media-ci@linuxtv.org, linux-sunxi@lists.linux.dev
In-Reply-To: <20260902200703.2016410-6-mukesh.ojha@oss.qualcomm.com>
References: <20260902200703.2016410-1-mukesh.ojha@oss.qualcomm.com>
 <20260902200703.2016410-6-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 20:17:59 +0000
Message-Id: <20260902201800.5822B1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Pre-existing race condition leading to a use-after-free. The drive=
r uses `devm_request_irq()` to manage its interrupt, but manually destroys =
the workqueue (`vpu->wdt.wq`) in `mtk_vpu_remove()`. Because devres cleans =
up the IRQ only after `remove()` completes, the interrupt remains active wh=
ile the workqueue is freed.
--

commit 246438dea9de2810275787060608206f1c3a4872
Author: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

media: mediatek: vpu: Use devm_of_reserved_mem_device_init()

This patch simplifies the driver by replacing manual
of_reserved_mem_device_init() and of_reserved_mem_device_release()
calls with the managed devm_of_reserved_mem_device_init() equivalent.

> diff --git a/drivers/media/platform/mediatek/vpu/mtk_vpu.c b/drivers/medi=
a/platform/mediatek/vpu/mtk_vpu.c
> --- a/drivers/media/platform/mediatek/vpu/mtk_vpu.c
> +++ b/drivers/media/platform/mediatek/vpu/mtk_vpu.c
[ ... ]
> @@ -930,7 +930,6 @@ static int mtk_vpu_probe(struct platform_device *pdev)
>  free_d_mem:
>  	vpu_free_ext_mem(vpu, D_FW);
>  remove_debugfs:
> -	of_reserved_mem_device_release(dev);

[Severity: High]
This is a pre-existing issue, but while reviewing this devres conversion, I
noticed a potential use-after-free race condition related to device teardow=
n.

In mtk_vpu_probe(), the interrupt is registered as managed using
devm_request_irq(), meaning it will remain active until devres cleanup runs
after mtk_vpu_remove() completes.

However, the workqueue is manually destroyed during mtk_vpu_remove():

drivers/media/platform/mediatek/vpu/mtk_vpu.c:mtk_vpu_remove() {
    ...
    if (vpu->wdt.wq)
        destroy_workqueue(vpu->wdt.wq);
    ...
}

If a hardware interrupt fires after destroy_workqueue() executes but before
the devres cleanup disables the IRQ, vpu_irq_handler() will attempt to
access the freed workqueue structure:

drivers/media/platform/mediatek/vpu/mtk_vpu.c:vpu_irq_handler() {
    ...
    queue_work(vpu->wdt.wq, &vpu->wdt.ws);
    ...
}

Can this sequence cause a use-after-free if the hardware triggers an
interrupt late during the unbind process?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260902200703.2016=
410-1-mukesh.ojha@oss.qualcomm.com?part=3D5
