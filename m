Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FB8B31E845
	for <linux-sunxi@lists.linux.dev>; Wed, 24 Jun 2026 09:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782292244; cv=none; b=J6EcZq5xbe7Ze1F/ydDJ4DFAmqdoIUXTGeef1yIFAuAR/N76Ygdo2xUqcDz6KyIwhFRV7LN9VdrlnIBb2IATQVoFOZM7uquKwZ03jgLQf8wYSJJSUSwnC4DH2vSmnUBAu/XMRNSddzwzf27L16rygKabHhTePAW1ce1KwlOGnLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782292244; c=relaxed/simple;
	bh=An8wubXAYKaB02096hjwDIFg+oJSTjZ1O8atYO1W62Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qxjn9tvm/l/6y3qq5AYdEaqMN39vwR4y/J4tf1s469C3UIfVpU801+fxABEoPb6fYpMEI5UHUXxWL4LWlFphN2k0T49AvH06rAGs/XJBiO0GtTLOaBpXDMtUipherutZh+VT/SZ/oJo8JVasa4B/FB97cVvkvT/zi/xbrVKiXcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PTZgNhd1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PTZgNhd1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E85681F000E9;
	Wed, 24 Jun 2026 09:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782292243;
	bh=SFzyXwoJWXjDLZNhIuWG6BTr2TWrhq7nbsWAyQuAPHg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PTZgNhd1iPgIFwM6WcB3PcY0h/cli66jntqe3xy5N5k8N/s27+brE5w69XRxxQinY
	 DZT5v5j919USFOBevYs1lJwLqbxo7EzwOgrwof/PPEb843Kj6BpP5aeNpYXwpLtXpZ
	 7go6M1sjGhM1jun4XAt5HjL0tHM4xmX/opePNe1RA/AD75Mu8n9CAB57zOzFNK6EIK
	 /WWh2+z8yvlU1VHM/g3XP3985VjlwOsTltnp0QMwMnGBpg6L+77TlsILQSTvMEk/L+
	 d8sgFDcaXCrnY9isCEeLnwJkTZkGi2twbBdmAgn190ksKTeIY1AUHUe/KhvVpHGkyZ
	 eHeuazLQQWmeg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] media: cedrus: fix memory leak in cedrus_init_ctrls()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dawei Feng" <dawei.feng@seu.edu.cn>
Cc: linux-sunxi@lists.linux.dev
In-Reply-To: <20260624085920.578446-1-dawei.feng@seu.edu.cn>
References: <20260624085920.578446-1-dawei.feng@seu.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 24 Jun 2026 09:10:42 +0000
Message-Id: <20260624091042.E85681F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Incorrect array size calculation for `ctx->ctrls` allocates insuff=
icient space for the NULL terminator, leading to a KASAN slab-out-of-bounds=
 read and possible wild pointer dereference.
--

commit 6bc123052b636ba4d4950902c21d137fa64fd53c
Author: Dawei Feng <dawei.feng@seu.edu.cn>

media: cedrus: fix memory leak in cedrus_init_ctrls()

This commit fixes a memory leak in cedrus_init_ctrls() by freeing the V4L2
control handler resources if the memory allocation for the controls array
fails.

> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/stagin=
g/media/sunxi/cedrus/cedrus.c
> index bbd186b8035b2..96acd52e380c8 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
> @@ -285,8 +285,10 @@ static int cedrus_init_ctrls(struct cedrus_dev *dev,=
 struct cedrus_ctx *ctx)
>  	ctrl_size =3D sizeof(ctrl) * CEDRUS_CONTROLS_COUNT + 1;

[Severity: High]
This isn't a bug introduced by this patch, but does this correctly allocate
enough space for the NULL terminator?

It appears to add 1 byte instead of sizeof(ctrl), allocating insufficient
space. The remaining bytes of the terminator pointer could be left
uninitialized.

When checking the array bounds in cedrus_find_control_data():

	for (i =3D 0; ctx->ctrls[i]; i++)
		if (ctx->ctrls[i]->id =3D=3D id)

Could this read the improperly sized terminator, leading to a KASAN
slab-out-of-bounds read and a wild pointer dereference?

> =20
>  	ctx->ctrls =3D kzalloc(ctrl_size, GFP_KERNEL);
> -	if (!ctx->ctrls)
> +	if (!ctx->ctrls) {
> +		v4l2_ctrl_handler_free(hdl);
>  		return -ENOMEM;
> +	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260624085920.5784=
46-1-dawei.feng@seu.edu.cn?part=3D1
