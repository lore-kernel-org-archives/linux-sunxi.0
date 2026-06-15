Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C42392E7631
	for <linux-sunxi@lists.linux.dev>; Mon, 15 Jun 2026 09:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781515431; cv=none; b=NZLmW5g8GhHDxJZ2NFs+sN/2voGu7pIxSaZtpicci6BqW1DERo6PS18BqDYArH2XL9FJ9gz+84sy5E4WWvJLxqbnXoROPo2N8Z131yGhaAuE18HntVS5nIut6kRHnrvgfVaZWaNw8B660jdkfpxJV3B+HM/Hrk/BTE1OvPaSzfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781515431; c=relaxed/simple;
	bh=ILFZX824OLhFy5EveAgE1PdYsvEFp31jvai0F+qRXeI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FnnNY/p429/KthUWjThouelFmxC96TFwjvzbiDlB9+Bh/CI6dfw4UtIhCDaoAgzVYgkq6ZOzKp1dgGE22Hy21AG4dOTO55e/ZPyMVYtMJBNxzrCw3YtURj2hdgAbTy9MZ140BW3fw/oG2epTU0rhjGzEuNG1YlSQEVJNcxLhb/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lhny4cNA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lhny4cNA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BFD31F000E9;
	Mon, 15 Jun 2026 09:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781515430;
	bh=+UwEJ+rUMXnhaCD/003k9UogpirX23aOomud7GYKgcc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Lhny4cNAI1sMqLi2aKla/G4DngLqfBcKJ6srZF+/lb/n1AubeugGmGIwB4ubQKip6
	 21OR40LZbPBUhbIyMgRfDjHAOisJV9hvEYLIn4tqjWi0LEkylkHbOtAj3kETGzL/2Z
	 gNYlsCmGErhn+3a6DdEOtiVn28PvXWuAmoX0ABSiyn7WqKMx+ZB+5dWEtjpw4+tJ3t
	 644Sbf5zx1iImGso6jVha/kV2fberu7iNfmKqUATZ0nRxB4VNVdEqM1ZcU7l2z/XAC
	 5bvOUrmJF/O4pqiTqUXWTF4FIqZRaopit4LyGvg0FQHoGMdXwLrrIQbLUUSzroprUb
	 yLkgBTfmRcVEQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] crypto: sun4i-ss: remove debugfs directory on teardown
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pengpeng Hou" <pengpeng@iscas.ac.cn>
Cc: linux-sunxi@lists.linux.dev
In-Reply-To: <20260615091114.97190-1-pengpeng@iscas.ac.cn>
References: <20260615091114.97190-1-pengpeng@iscas.ac.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 15 Jun 2026 09:23:49 +0000
Message-Id: <20260615092350.4BFD31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Device unbind frees the devm-managed driver context while active c=
rypto TFMs remain, leading to a Use-After-Free.
- [High] Global `ss_algs` array corruption upon multiple device probes or p=
robe failures leaves dangling pointers, leading to a Use-After-Free.
--

commit ca25dde45b1d1ec5234ada4c67bcfb9e055331e7
Author: Pengpeng Hou <pengpeng@iscas.ac.cn>

crypto: sun4i-ss: remove debugfs directory on teardown

This commit addresses a cleanup omission in the sun4i-ss driver where the
debugfs directory and stats file were left published after the driver
was unbound. It adds a recursive debugfs removal during driver teardown.

> diff --git a/drivers/crypto/allwinner/sun4i-ss/sun4i-ss-core.c b/drivers/=
crypto/allwinner/sun4i-ss/sun4i-ss-core.c
> index 35ef0930e77f1..eadc5449b6807 100644
> --- a/drivers/crypto/allwinner/sun4i-ss/sun4i-ss-core.c
> +++ b/drivers/crypto/allwinner/sun4i-ss/sun4i-ss-core.c
> @@ -479,6 +479,8 @@ static void sun4i_ss_remove(struct platform_device *p=
dev)
>  	int i;
>  	struct sun4i_ss_ctx *ss =3D platform_get_drvdata(pdev);
> =20
> +	debugfs_remove_recursive(ss->dbgfs_dir);
> +

[Severity: High]
This is a pre-existing issue, but does device unbind cause a use-after-free
here?

When the device is unbound via sysfs, sun4i_ss_remove() completes and devres
automatically frees the devm-managed ss context and unmaps ss->base.

However, unregistering the crypto algorithms only prevents new allocations.
It does not destroy existing active TFMs. If an active TFM continues to
operate, its context op->ss (which was copied from algt->ss during
sun4i_ss_cipher_init()) becomes a dangling pointer.

For example, a subsequent sun4i_ss_cipher_poll() call accessing the hardwar=
e:

drivers/crypto/allwinner/sun4i-ss/sun4i-ss-cipher.c:sun4i_ss_cipher_poll()
    ...
    writesl(ss->base + SS_RXFIFO, mi.addr + oi, todo);

will access unmapped memory and the freed ss context. Additionally, when the
TFM is eventually freed:

drivers/crypto/allwinner/sun4i-ss/sun4i-ss-cipher.c:sun4i_ss_cipher_exit()
    ...
    pm_runtime_put(op->ss->dev);

it dereferences the already-freed op->ss. Can this be addressed by tracking
active TFMs or ensuring they are quiesced before cleanup?

>  	for (i =3D 0; i < ARRAY_SIZE(ss_algs); i++) {
>  		switch (ss_algs[i].type) {
>  		case CRYPTO_ALG_TYPE_SKCIPHER:

[ ... ]

[Severity: High]
This is also a pre-existing issue, but is the driver context safely managed
if probe fails or if multiple devices are probed?

In sun4i_ss_probe(), the driver stores its per-device context pointer in the
statically allocated global array ss_algs:

drivers/crypto/allwinner/sun4i-ss/sun4i-ss-core.c:sun4i_ss_probe()
    for (i =3D 0; i < ARRAY_SIZE(ss_algs); i++) {
        ss_algs[i].ss =3D ss;

If a second device instance is probed, it overwrites ss_algs[0].ss with its
newly allocated ss context. The registration then fails with -EEXIST because
the first device already registered it, causing the second probe to abort
and devres to free its ss context.

However, ss_algs[0].ss remains pointing to this freed memory. When a new TFM
is created for the still-active first device:

drivers/crypto/allwinner/sun4i-ss/sun4i-ss-cipher.c:sun4i_ss_cipher_init()
    op->ss =3D algt->ss;

it copies the dangling pointer to op->ss, leading to a use-after-free when
accessing op->ss->dev. Could this global array be changed to avoid storing
per-device state?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260615091114.9719=
0-1-pengpeng@iscas.ac.cn?part=3D1
