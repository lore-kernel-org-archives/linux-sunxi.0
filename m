Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20DBB2727E0
	for <linux-sunxi@lists.linux.dev>; Sat, 13 Sep 2025 11:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757763016; cv=none; b=gprWeobSB8st7+8SdZyfLSDRxd1ZsJdlbK/QIrSiDc0qFsQQYsqU9/r1rVe8x0p4aGx5wdpau0OJMWKxRzcXpZlv+Qi/p62UlfUEG8mZgl+6dPIteGIYlEOqXTS2AU547kTarYbCnIwrgu9kdsMom3uIDMmpGrwHpAWMj9EEOWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757763016; c=relaxed/simple;
	bh=x7djyqcnacv1DN7MFD9deVtmkZvxAh8dRtXGYaZoXno=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ON8upZbej6a6fzeYYdF/O/iSKcwSWFf6eM6ABtSBRPOXf87z+57Sh+swJEx7q6vDMrbnHLbjecbePu5L4gRpQk2MrfCivmkQtGg2edaak1HGCvTUWqWRA9q8B3m7j7qcrJzuQm2FVixuUH66f8e0qjCNunfi7VhuigOLctQzpU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XaEPjrvw; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XaEPjrvw"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b0aaa7ea90fso33007366b.1
        for <linux-sunxi@lists.linux.dev>; Sat, 13 Sep 2025 04:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757763013; x=1758367813; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vM/wOHbGgB/+niDKSnNnlcAAPUzV0FZzOUIFNQXZ5cc=;
        b=XaEPjrvwgpnfyceXwBMt6wZ45+qEV7dBQmjSgD3Z7dVQTfiTuB6lNO5Gu/a3VtPEcf
         XR81OxumwwhKbMeMa8R0rLRC2G7Z4qpk+M/iKPGEWO+XVa7gNASxVcO6Mn61r8bika3N
         xOgQ1AdV1toDbHJR79UdgTtQ0+Lg11x6IU4v5L68C3YB2TRoqgiaoyj40UqskGsxULzs
         dO9UvyPX1DXdQopA+oCEjbiJmNOmmiftWgoQ0ap9Ld/fc418ZkaV3Q2n/4+qPOoe6aDr
         D+teqY+OU/wFkeC16M0SEdNSo4r2uQzGBnNoE0Qo3r0YGhJ0nxbg5qXMzt3+h3Pchbn8
         6j8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757763013; x=1758367813;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vM/wOHbGgB/+niDKSnNnlcAAPUzV0FZzOUIFNQXZ5cc=;
        b=P9BMLjxP3w38kjOjSzm2INhriFIE/7AHrDk1Av12rBJhO3DbHfvoJ727SlXzEVFvP4
         wtAUZtbpuD+jWUAwGx7J03+rh5ddydTSwPfAmMq8iFOlf0rCwe0raprRv54a21guawhN
         z1pyXTH3jVedGMLznhTTom4hp45qtGQFjZo5v3zFeI72B4d+oH4hu6YChMWzs+f5/+Wr
         h/+k27vlZeMR2O1q3clbC0UlhD3lndk9kErjUWSXBy4x3PDolN/NrELUa67dK5kCVJ6r
         grTBjmBMDoZ+ytnF0KYCsTAw5sCr7rJYE8UOctv7rCfftmiqJ5GZxZolhzQeu4i9U2m6
         tkzQ==
X-Gm-Message-State: AOJu0YzkSqSm2f3NzhGemnnPuS2uaaA8XHAE5QdOXMcW3DgevwfGVveB
	C/YO7U/stEp7dzRgIrZx+I00vVnTze1aKfH4wdYNDDtTtanq5sOS4tNM
X-Gm-Gg: ASbGncvfJz3llx6zLCEY74Tzqomm/D0Oww8PgzXmuu9ME1evV/9VTBgSIPTIsxk0Jpl
	FWoPR/OonaqLXDFCRWrIMHaPAYxorSQLAbfcggkhfjWn6LGKZ2RdKabFAkkMJDpdj8tmjPotMZ1
	1H7zxSXHN74x9/u9YMSQbQFQkzNG4iehyeQgnIRvWxhdPGzoNN2SBpDQNbsI0QXUAoTvQ4DS8Wq
	tCkQmdA8Yw7BVbmE3PCznThICGPLdNUz2nSgap7nzMDuhDGJJp2GNeuKSOaILZ/gPk8tpCyN/wQ
	fpu/TO8B4HK8FtltH6KMwZLOnmn5Bd6RiTOHasJ/NWFAzXLmbgFba0znZDgNbQktbPYx1PNDn9W
	4cCqsQQmQENj7ZOG4cj0+emkIo0tsCMazyRq17LOSfagTuOG9fX9QePw=
X-Google-Smtp-Source: AGHT+IHGrkQn7+NmuVgBdc10MUVOT+vd1j8NXgn0gL8ncYy9IeCu/BFaE0KTAPOvNiL0g93r6GOAgw==
X-Received: by 2002:a17:907:3f16:b0:b04:5a74:b674 with SMTP id a640c23a62f3a-b07c3a88730mr640143666b.58.1757763013249;
        Sat, 13 Sep 2025 04:30:13 -0700 (PDT)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07b334e720sm551560166b.104.2025.09.13.04.30.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Sep 2025 04:30:12 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej@kernel.org>,
 Samuel Holland <samuel@sholland.org>,
 Andre Przywara <andre.przywara@arm.com>, Chen-Yu Tsai <wens@kernel.org>
Cc: linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH 1/3] arm64: dts: allwinner: a527: cubie-a5e: Drop external 32.768
 KHz crystal
Date: Sat, 13 Sep 2025 13:30:10 +0200
Message-ID: <6190895.lOV4Wx5bFT@jernej-laptop>
In-Reply-To: <20250913102450.3935943-1-wens@kernel.org>
References: <20250913102450.3935943-1-wens@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne sobota, 13. september 2025 ob 12:24:48 Srednjeevropski poletni =C4=8Das=
 je Chen-Yu Tsai napisal(a):
> From: Chen-Yu Tsai <wens@csie.org>
>=20
> The Radxa Cubie A5E has empty pads for a 32.768 KHz crystal, but it is
> left unpopulated, as per the schematics and seen on board images. A dead
> give away is the RTC's LOSC auto switch register showing the external
> OSC to be abnormal.
>=20
> Drop the external crystal from the device tree. It was not referenced
> anyway.
>=20
> Fixes: c2520cd032ae ("arm64: dts: allwinner: a523: add Radxa A5E support")
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts | 7 -------
>  1 file changed, 7 deletions(-)
>=20
> diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts b/ar=
ch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts
> index 71074b072184..e333bbaf01d3 100644
> --- a/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts
> @@ -24,13 +24,6 @@ chosen {
>  		stdout-path =3D "serial0:115200n8";
>  	};
> =20
> -	ext_osc32k: ext-osc32k-clk {
> -		#clock-cells =3D <0>;
> -		compatible =3D "fixed-clock";
> -		clock-frequency =3D <32768>;
> -		clock-output-names =3D "ext_osc32k";
> -	};
> -
>  	leds {
>  		compatible =3D "gpio-leds";
> =20
>=20




