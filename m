Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 162663D8121
	for <linux-sunxi@lists.linux.dev>; Mon, 27 Jul 2026 19:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785181725; cv=none; b=hIGljbRRxopgEnwhhZIXU6e3+2+RfUCwFGNGmvVy/Z0VduHBvDHSAKqpzICgcPNmHn3/M2KRlzazY6NrbvHz3Gdgzs51UAbLcYGzBIS3afedNU/LmCe55r2HdqzFUhpUECFFAdaXlIPVXrTBMNp90z9Dpn3XtzIps90y8QwIZ0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785181725; c=relaxed/simple;
	bh=Fy5ajV+2NNaQlt2aYO+7wjNAR7cQss3RsTwAA5apSL0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gnwLGKeqWCZwSgYOmb+zeLAEMfU4DW2Npn/+YezM+1cnlsG4P6VHttTsTJqtwSppFCUip29uqFRKrYKAf99hiGbfFUnl3Q9nzlcwN/s8lEhA0pS7S0lDUd2oR72cn1Fe4Rq8Mbo57TGICVrTwWD42cYK1D/IlQRa2QK/q7Tfzd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aCaFV7Xq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aCaFV7Xq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63A921F000E9;
	Mon, 27 Jul 2026 19:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785181723;
	bh=SfpKZS2Xbbu6xScu9XW4ZSMVUwMNFrh3B/G5cl9oetw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aCaFV7XqDLI2jSoo6uTW+a+vW3VDzgiOmPbXvmwiwMtmMUlhaf6PR4JLmlAAMHfs3
	 EE2rUdYyc4E2UWSJYO6Xs9VxVrgZXLyWMVwj3W0iXQwCawoQXTO1swc9nspODr0Wic
	 DhSd/vKxT6LtbPuN59oWInbXh29UKIN8Hy3qGg+6KR3AXOy4aIwH2uvIlIfG/tfFnl
	 CnCFManqUttVP5CCelxpnl7w18mY6Y2UmDfoWNaMe54cRRIlReKPd6MJ92DVygQIsh
	 U7kxGtzd5kK3WhBnIwgVgwDxig9AzF6122PPjchVhdm1IuErW1+IQ1v371rJ6xjLkb
	 KpIe0ZRxA9VXw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] mailbox: sun6i: modernize probe and convert to fully
 managed
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rosen Penev" <rosenp@gmail.com>
Cc: linux-sunxi@lists.linux.dev
In-Reply-To: <20260727194208.10082-1-rosenp@gmail.com>
References: <20260727194208.10082-1-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 19:48:42 +0000
Message-Id: <20260727194843.63A921F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The function `devm_mbox_controller_register()` is called with one a=
rgument, but it requires two, causing a build failure.
--

--- Patch [1]: [PATCH] mailbox: sun6i: modernize probe and convert to fully=
 managed ---
commit 6febca9f53cbed2f1affb7635d88de86beffdca8
Author: Rosen Penev <rosenp@gmail.com>

mailbox: sun6i: modernize probe and convert to fully managed

This patch replaces manual resource cleanup with devres-managed variants in
the sun6i mailbox driver. It converts IRQ, MMIO, clock, and mailbox
controller registration to use their devm_* equivalents and removes the
manual error paths and remove callback.

> diff --git a/drivers/mailbox/sun6i-msgbox.c b/drivers/mailbox/sun6i-msgbo=
x.c
> index 6ba6920f4645e..28d8636afad26 100644
> --- a/drivers/mailbox/sun6i-msgbox.c
> +++ b/drivers/mailbox/sun6i-msgbox.c
[ ... ]
> @@ -271,29 +267,8 @@ static int sun6i_msgbox_probe(struct platform_device=
 *pdev)
>  	mbox->controller.txpoll_period =3D 5;
> =20
>  	spin_lock_init(&mbox->lock);
> -	platform_set_drvdata(pdev, mbox);
> -
> -	ret =3D mbox_controller_register(&mbox->controller);
> -	if (ret) {
> -		dev_err(dev, "Failed to register controller: %d\n", ret);
> -		goto err_disable_unprepare;
> -	}
> -
> -	return 0;
> -
> -err_disable_unprepare:
> -	clk_disable_unprepare(mbox->clk);
> -
> -	return ret;
> -}
> -
> -static void sun6i_msgbox_remove(struct platform_device *pdev)
> -{
> -	struct sun6i_msgbox *mbox =3D platform_get_drvdata(pdev);
> =20
> -	mbox_controller_unregister(&mbox->controller);
> -	/* See the comment in sun6i_msgbox_probe about the reset line. */
> -	clk_disable_unprepare(mbox->clk);
> +	return devm_mbox_controller_register(&mbox->controller);

[Severity: Low]
Will this compile successfully?

Looking at the function signature in drivers/mailbox/mailbox.c,
devm_mbox_controller_register() requires two arguments:

int devm_mbox_controller_register(struct device *dev,
                                  struct mbox_controller *mbox)

The call here only provides the mbox_controller pointer and is missing the
struct device pointer as the first argument, which is likely to result in
a build failure.

>  }
> =20
>  static const struct of_device_id sun6i_msgbox_of_match[] =3D {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727194208.1008=
2-1-rosenp@gmail.com?part=3D1
