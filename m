Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795111395;
	b=svJEWe2/tlhRf+OALdAklW1qYuP1yr8yNwwGnASCDHPysbwVrrmCp5NXYac29yspKywA
	 hLxmv9XjFxBBx0VzK1nxlb8flX1XMoe9xsF/GoL0vsm65Rfa/SUYmWpgwIEIa3Vzng8qJ
	 lueKBz9UHes3xjXff5H/k0n1sWZUHbFlcSWUuhuZESluIYvsoc0ozqMVmGovInyoxQ+JM
	 BYMQypdeTH2zkOKccjWN+uggkFDut2Q/fWdrpBhe909YyzPHYa6s/MaQEeu9LZXj6XfIO
	 i5IH8CkvxpNpogSxmAXhVxLVa7PJF5JWMvjSh4MlrRbq6zSM6ACIjgkYJtZl8J/2+Ug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795111395;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=WfNp269qSRTYdyFZb33AO8G57nZw5BQB8j9hQphUqtM=;
	b=xnq5a2wz453nBA+tumZzoEkaAIYBEf3sXLr1e/uZ/lx6HiHSeOzACqevRsqMol3bZmma
	 aSYIdLR1eVX7NFNMS1IamMTliIrxJmu/9PO4Cqir7MBUly7UyQtgGksXq+IyviROQTpT3
	 QjmiRg33AaYRqLc96JaDxPyimv0sd89kwsC5miYWlfQS4qATXVSZ/iyk7VMyu8dUh1cwO
	 rMx89nOp2mtxbGRwkHLPkNjNEVIvkk8jLXg1dwBtsi/8M6Jqq66IOMtGqlC7W4TzOsgRl
	 ljLITNxpvADVbXSdBfBCSyQpF+0N6V40mkuRzMN8+KfAWmVVZ8yW3U83ZCKOXwAwKSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D86EFEVr;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57A9E606A326;
	Thu, 19 Nov 2026 18:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D86EFEVr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA9A51F000CD;
	Thu, 19 Nov 2026 18:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795111395;
	bh=WfNp269qSRTYdyFZb33AO8G57nZw5BQB8j9hQphUqtM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=D86EFEVrT1VAwdCOlILnTcVczjgTtwFNifeDeAD0zwKHjnL0N7VTcNn7IvmKHK6d5
	 lVawEZkSufwJR+FN15FDKx2hDu3kahh5ooYiEVt0/3zC8RODfuWu0EmB1VtOu0QTZu
	 qT4IAXuGlBKySCSaKYWD/AhrTJV2t2DchupgI6Uis6TxySaU3tqh0FzOjk4fD8CCGZ
	 AedGbIzCD6SkadCZ+qz/CASCtgjQm+EklVtor3mz/hiFmLIS0Q2C1aLj0MRv5Ka041
	 zjwc8E4qoZiapD4ZOgZp7hpSSOl4XoV4K1jxTBJmp4eLYMXflf2BhKtk7q2SUEhTxK
	 YID3LuVl+IYYQ==
Message-ID: <sashiko-outbox-223750@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/5] drm/sun4i: Reject fractional source coordinates
 without scaler
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jernej Skrabec" <jernej.skrabec@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261119175437.2520400-2-jernej.skrabec@gmail.com>
References: <20261119175437.2520400-1-jernej.skrabec@gmail.com>
 <20261119175437.2520400-2-jernej.skrabec@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 18:03:14 +0000
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
- [Low] drm/sun4i: missing Fixes trailer for fractional source
  coordinate check
--

commit 6372f45de588428ede3ebc1410bcfe779db4f206
Author: Jernej Skrabec <jernej.skrabec@gmail.com>

> drm/sun4i: Reject fractional source coordinates without scaler
>
> The layer code programs the scaler whenever the source rectangle has a
> fractional offset, since only the scaler can apply a sub-pixel phase.
> drm_atomic_helper_check_plane_state() with DRM_PLANE_NO_SCALING doesn't
> catch that: it only compares the scaling factor, which may still be
> exactly 1.0 with fractional source coordinates.
>
> Channels without a scaler would thus have the non-existent scaler
> programmed instead of an error being returned. Reject fractional source
> coordinates on such channels.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

[Severity: Low]
This fixes the scaling check introduced when hardware scaling support was
added to DE2.  Should this include:

  Fixes: b862a648de3b ("drm/sun4i: Add support for HW scaling to DE2")

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119175437.2520=
400-1-jernej.skrabec@gmail.com?part=3D1
