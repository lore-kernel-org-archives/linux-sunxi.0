Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794377028;
	b=LC7Y0jYsNSwHpgtq0ZLBHrEzrM6cvHG7+rYO4P7gpnu2ozT/RlNWEtYRy60q+OC/P+ro
	 NYZvC2qkF2owZbRY10S7WidnD9ufJ6XGcRbdT1KBGwW04xvmadqYoFOGsaYBy4R0ieas0
	 MuAHIU47lbdef8saDpo2twx7aywLt7MCVd9i589Kz61R/uHA5Qci4Fj0slm5QMRDrwyQG
	 e1FUlUR73AoIYQtIsd4mrXYQEs7Oktjsh33Z8td2ZNAYCw24e4C8/EwsD3s9VxN9Kvldj
	 c1cTc2YyZftCS4LHd3hUkijwPFPw15C2XyN7/hSXFRqaZJHw/Dy8ws8hjVHEVOmuFIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794377028;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=1njBDvRrZjLhgMl2ZtksU701CRCVLfuBARYtooKWoAQ=;
	b=KDpfAkAO2tjGzS8z5lo+0migB0GlFC8onTo0u/fqXZifS3P8h7+aCfcPLcKaqM4lhWYk
	 yAzhLONw02CxISfdDoXmOvTmiZBBAbUYNhOexR6a57q3MxMYoz3Mw/rZ92xYxnPC2BL2N
	 q4+9FCNyUtLd8cuvXFwCyt8Yb5FzgXBfnITbt/4XqELSBfX2YDGig4+WsyubjYztF/Pds
	 F4N/Gy4hO/VxIJcydgpRtYLuleoWF7Vid9VHgP8gLio5vIptUJCpCt4iTt+gojN6Fp6y9
	 uKi3nICpBwHoLuDPSIjbFYJiBcFGtypM0Sfuv7N3a72WG0z8wvOx5A1IashV/NeVReA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gK+fq2iC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 956A2606A320
	for <linux-sunxi@lists.linux.dev>; Wed, 11 Nov 2026 06:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gK+fq2iC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 075BB1F00A05;
	Wed, 11 Nov 2026 06:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794377028;
	bh=1njBDvRrZjLhgMl2ZtksU701CRCVLfuBARYtooKWoAQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gK+fq2iC71hHS14g0re+i5SfjbnUSejWSl/9v65Ldxj9Aesy4VQSgxVsKHGQq73hE
	 dYlxerQGB7yXaCJMNeOFf8b98yg8QhhEPlP2b4y6qOKeNqi3/WdXe7oVXOqo+8kvWI
	 I+IYK2oyvJYCrgh1jJAUsntT7q5z2HhE5KGNdP19SL758rN7089r+CrXCn5P1EXtk6
	 h3NGhxKrhOkJRQOuW6c1tyM/jO3m8RKJhVIo+lRLOahGSHaefwBsVjrpNmkh0MJO8q
	 5/r06um7jUwX406zDh/xQIhBIkIkus0bk7E8UvEw9S1TckwWFf93jVb7MjKH0xkTuZ
	 Ax6cjyvbuBF6Q==
Message-ID: <sashiko-outbox-208379@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next 1/2] net: stmmac: dwmac-sun8i: Fix the RX_TH
 threshold encoding
Reply-To: sashiko-reviews@lists.linux.dev
To: "Arun Iyengar" <aiyengar1990@gmail.com>
Cc: linux-sunxi@lists.linux.dev
In-Reply-To: <20261110-sun8i-emac-jumbo-v1-1-84bf00e9ffa3@gmail.com>
References: <20261110-sun8i-emac-jumbo-v1-0-84bf00e9ffa3@gmail.com>
 <20261110-sun8i-emac-jumbo-v1-1-84bf00e9ffa3@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 06:03:47 +0000
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] net: stmmac: dwmac-sun8i: missing Fixes tag and inaccurate
  commit msg
--

commit bc43819b000accd77627647d6f7f32c68d0bcbe3
Author: Arun Iyengar <aiyengar1990@gmail.com>

> net: stmmac: dwmac-sun8i: Fix the RX_TH threshold encoding
>
> The EMAC RX_CTL1 RX_TH field (bits 5:4) encodes 00 =3D 64 bytes and
> 01 =3D 32 bytes (H616 user manual v1.0, 6.5.10; 10 =3D 96 and 11 =3D 128 =
bytes
> as in the driver). The driver has the first two swapped.
>
> The values are only used in RX threshold mode, which dwmac-sun8i never
> selects while RX checksum offload is on, so no current configuration is
> affected.
>
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>

[Severity: Low]
Since this fixes the swapped EMAC_RX_TH_32 and EMAC_RX_TH_64 definitions fr=
om
the initial driver commit, should it include:

  Fixes: 9f93ac8d4085 ("net-next: stmmac: Add dwmac-sun8i")

Also, is the explanation about RX checksum offload accurate?
stmmac_dma_operation_mode() and stmmac_bump_dma_threshold() only select RX
threshold mode when priv->plat->force_thresh_dma_mode is set and use
SF_DMA_MODE otherwise, independent of priv->plat->rx_coe.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110-sun8i-emac=
-jumbo-v1-0-84bf00e9ffa3@gmail.com?part=3D1
