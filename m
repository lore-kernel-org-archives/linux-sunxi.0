Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795371021;
	b=3IfW6vEkpBDqZ3JLGjhJXzZNhks6CoLp8wFk2OJQ/hwlAlOdT4CzrWYoeeRmh1aNpuxU
	 aPCt2wGnTVOGk3IRWrHAu8HEdhGGryCEuvE7IMAKlH1STRC4/XC132svaddmefRxjWiSv
	 dj6B9HEgfhU1YzLe5DYtK7HcMjMjQcEsAXcGixOIkEZYnSqBLkYmFBZYhkyQ5WyazvCQd
	 tXSSwLzLxHD2zYhmGIf8irmIjzdNzSzO0dkCYBcHcz28KMmSQ8e1bOQexv1r7DRe9Eb6A
	 4JnB6URQtk55mwayw/VZYhUkLRQSEYlo0v3BFuMcL4rABKrSd4ehe3eYMnjxONE3bVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795371021;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=57AAn+2X+JfN1t49EdhGIIeqroEnSzaXZ3Fam/Be9EQ=;
	b=rUjpA6S7P6udk8EH0nvKQflx6p/KNkMdcpy7s/yaysV46AdLtkpa/Ywt6ZWwW/fs/qOU
	 ejgjAzDIw/gqkXgI8H1T/GrCzE4/vCdmcjpmJnK8krK+G+spuKWRo3mBH8X3M62TchvhU
	 EJaMk6J7AN/EcaOeeAmQOm0fTY/yyWDxNk0L+gQ34atwTORXN6SF7dvJijqZJylLCPbxw
	 h1Ug+7FCuMR5EjwN/1+IXzt10LiWRhxOcKVq9ILGzSvyeaVKGBJpALQyeHJB41rok14Gz
	 ydoPEIvj1BKJAd6W2C10MrTRjHQNltNX83peqRAj2q9KXreol2jc9eslqIewyZ+fpyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=A5S28U6t;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7F74606A32C;
	Sun, 22 Nov 2026 18:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=A5S28U6t
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C3891F000C0;
	Sun, 22 Nov 2026 18:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795371021;
	bh=57AAn+2X+JfN1t49EdhGIIeqroEnSzaXZ3Fam/Be9EQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=A5S28U6tJKZD5nGStMrBsjXrxhdVSKR8fMlNmLmN7wtO8gUtHbqvoWDxA8amshQB5
	 Gld/duw2gMyBUK8TAu1/N/XjBq9TkHs6wox7Claz7Xf+WZA8EBTdhBh+2z8Ie61ncm
	 NUECE1L5STVwOM+uRE5AFeVyZPlIJFqUZGaF+AJK94vhe+PO1KVPOEgSsp57M5+/Np
	 Dtoy8U/7/M4/uTNmqKHGxBn/OIXAKFQ/yZO2ZXyEjNakGm8RyfBED07d1NZjHv6hZ8
	 AnkdUt8UXglVCjIa/1/iLskVpmP+gpO37IlVtv6eFwAbD5jN4ReQ+jc6Agpb32POeQ
	 RMS256mquwcbg==
From: Chen-Yu Tsai <wens@kernel.org>
To: Samuel Holland <samuel@sholland.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: mripard@kernel.org, maarten.lankhorst@linux.intel.com, 
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, 
 Andre Przywara <andre.przywara@arm.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
In-Reply-To: <20261119175437.2520400-1-jernej.skrabec@gmail.com>
References: <20261119175437.2520400-1-jernej.skrabec@gmail.com>
Subject: Re: [PATCH v4 0/5] drm/sun4i: update DE33 support
Message-Id: <179537101807.635199.7504313693116992864.b4-ty@kernel.org>
Date: Mon, 23 Nov 2026 02:10:18 +0800
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

On Thu, 19 Nov 2026 18:54:32 +0100, Jernej Skrabec wrote:
> This is second series out of three which aims at properly introducing
> support for H616 Display Engine 3.3. Previous series [1] reorganized
> driver so proper DE33 support can be easily implemented.
> 
> H616 DE33 support was actually introduced a while back, but it was done
> without fully understanding hardware design. Issue with existing binding
> is that it considers planes as resource which is hardwired to each mixer
> as it was done on older Display Engine generations (DE3 and lower). That
> is not the case anymore. This series introduces new driver for planes
> management, which allows doing proper plane assignments.
> 
> [...]

Applied to drm-misc-next in drm-misc, thanks!

[1/5] drm/sun4i: Reject fractional source coordinates without scaler
      commit: f240bdee7ea178fe96d6d8510b9a9fac4d50ed88
[2/5] dt-bindings: display: allwinner: Add DE33 planes
      commit: 6fad6c7a66e9584ac60863cb54b9c6c637219d74
[3/5] drm/sun4i: Add DE33 shared plane driver
      commit: a1d012f31f6fb0563d122caec24be4f33359083e
[4/5] dt-bindings: display: allwinner: Split H616 DE33 layer reg space
      commit: daefcb60c18cc4e9651c6699077304ed4f2744bf
[5/5] drm/sun4i: Switch DE33 to split plane bindings
      commit: edb16093db0f7262c07155d1bc3467921616a1df

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>

