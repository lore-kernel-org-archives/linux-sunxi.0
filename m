Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9A331DE8AD
	for <linux-sunxi@lists.linux.dev>; Thu, 16 Jul 2026 03:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784170943; cv=none; b=rtYrOKPsr3s69V+2goenU3RePw9xV89IjZ7RAeAqIkRzf0euJv5TpQL73ZFB/HDBp3GlO6YVPg+gIv4rN+RcyMHydstdgHHQhWpS3oWRcltwXiie4fheoHFECN6Q3ebNvpXF3Dne94msswupJxKQQXmy6VkGgWf835yy+Oj4c5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784170943; c=relaxed/simple;
	bh=YThyehaVj4Tq5Ku1n7Rx+M0eD/2BfWRN4/hUTIICItc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lv3dYyEkFWlpcUejgYgXpkovr77xje0o4QyiHuk8FWzzqo308XqhCZYSvKPrrXcDRL4w+cJqfUb2n8N8mnjW/sp62ucMPtXVgWEJLQpkRyPpyWfgWtH8NcAXNTJx3pz/6SqQDBm6411qHGZdPwsgp7dmkys0mfba7wLE+BWicPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NPJSwqSO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NPJSwqSO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2ADD51F000E9;
	Thu, 16 Jul 2026 03:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784170939;
	bh=1a2BY5FrNSNdyaOAVmSD8gq0RYwcmNZpTGMOxloPVNo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NPJSwqSOsHhbdSzlDWV+2G0b47ol0ypEaqhExF5/287OG0z7F/gMosF7Fh8VvqwDF
	 i2onqJRTTra+soX1RbtJk2flwIkfv+F2jJJDaWZrYCwQCeimfS17YVEwvq+XjrEUQY
	 7vxybmnjGXeQKkLyj8YMPNMQ5W53TCW+8jng8oqlq/yUKrx89gr092sZoOAYnr2nkT
	 PI1GHqjrcZ4sYRL1RqhufvnYSYqoYigWFnUHqXsdZ60LkcgacI3JKNCVVCL0GwWvgR
	 fseRooXifKjzDBIKDjfRcWpK9uUARCjlcZciBxWDWyXR0jtOXIYNrSgt2YX3xV306k
	 oK+DE/24PLpEw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] mailbox: Remove redundant dev_err()/dev_err_probe()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pan Chuang" <panchuang@vivo.com>
Cc: linux-sunxi@lists.linux.dev
In-Reply-To: <20260716025215.33592-1-panchuang@vivo.com>
References: <20260716025215.33592-1-panchuang@vivo.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 16 Jul 2026 03:02:18 +0000
Message-Id: <20260716030219.2ADD51F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Double unregister of the mailbox controller on the IRQ request err=
or path due to mixing devres with manual cleanup.
--

--- Patch [1]: [PATCH] mailbox: Remove redundant dev_err()/dev_err_probe() =
---
commit 4d3272d7b1e42964746554b2fa5d303d597704a7
Author: Pan Chuang <panchuang@vivo.com>

mailbox: Remove redundant dev_err()/dev_err_probe()

This commit removes redundant driver-specific dev_err() and dev_err_probe()
calls after devm_request_irq() and devm_request_threaded_irq(), since those
functions automatically log detailed error messages on failure now.

> diff --git a/drivers/mailbox/arm_mhu_db.c b/drivers/mailbox/arm_mhu_db.c
> index 9e937b09c5fbc..a39239e38a479 100644
> --- a/drivers/mailbox/arm_mhu_db.c
> +++ b/drivers/mailbox/arm_mhu_db.c
> @@ -318,7 +318,6 @@ static int mhu_db_probe(struct amba_device *adev, con=
st struct amba_id *id)
>  						mhu_db_mbox_rx_handler,
>  						IRQF_ONESHOT, "mhu_db_link", mhu);
>  		if (err) {
> -			dev_err(dev, "Can't claim IRQ %d\n", irq);
>  			mbox_controller_unregister(&mhu->mbox);

[Severity: High]
This is a pre-existing issue, but since this patch touches the error handli=
ng
path, does calling mbox_controller_unregister() manually on a devm-managed
controller cause list corruption?

Looking at mhu_db_probe(), the mailbox controller is registered using
devm_mbox_controller_register() earlier in the function. If
devm_request_threaded_irq() fails, this explicit unregister is called.=20
When the probe returns an error, the devres framework will automatically
unregister it a second time.

Since mbox_controller_unregister() calls list_del() on the mailbox node
without re-initializing it, would a second call dereference poisoned pointe=
rs
and cause a kernel panic?

>  			return err;
>  		}

[ ... ]

> diff --git a/drivers/mailbox/qcom-ipcc.c b/drivers/mailbox/qcom-ipcc.c
> index d957d989c0cee..e5ebb4a237ffd 100644
> --- a/drivers/mailbox/qcom-ipcc.c
> +++ b/drivers/mailbox/qcom-ipcc.c
> @@ -323,10 +323,8 @@ static int qcom_ipcc_probe(struct platform_device *p=
dev)
>  	ret =3D devm_request_irq(&pdev->dev, ipcc->irq, qcom_ipcc_irq_fn,
>  			       IRQF_TRIGGER_HIGH | IRQF_NO_SUSPEND |
>  			       IRQF_NO_THREAD, name, ipcc);
> -	if (ret < 0) {
> -		dev_err(&pdev->dev, "Failed to register the irq: %d\n", ret);
> +	if (ret < 0)
>  		goto err_req_irq;

[Severity: High]
This is also a pre-existing issue on the modified error path. When the
devm_request_irq() call fails, the code jumps to the err_req_irq label:

err_req_irq:
	if (ipcc->num_chans)
		mbox_controller_unregister(&ipcc->mbox);

Since the controller was also registered with devm_mbox_controller_register=
(),
will devres unregister it again during cleanup, leading to the same double
unregister list corruption mentioned above?

> -	}
> =20
>  	platform_set_drvdata(pdev, ipcc);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260716025215.3359=
2-1-panchuang@vivo.com?part=3D1
