Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F6C345C0B
	for <linux-sunxi@lists.linux.dev>; Thu, 25 Dec 2025 18:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766688576; cv=none; b=jCvJxjd24Wgw7epd0IAdhBSyE1eVw8mTjw3qjTvp2cfYf0UrdffRSHLEBfG0JclshOth9XlOWIEQ3r0sRTbVF7O7WmHmfVI4EtZhBkpH3tPzjDBoRKd8gpUWrOjxm/W8HTEn+IwR1Xquq1M6rJQWoCNm9ExhDN/a3edaAA8oj28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766688576; c=relaxed/simple;
	bh=/GLmmBp5IxXzJeH6mbbMRLZztQZUxgTxdEss9ySj2+4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aGc1ZbRx5Ln7LzkeEcrlPI0g1MRPkrf/FQQx/avLtjsA4elPpHaticou33eWxcCBuz1+kgWnVAL8ShS/72EWBrZeC27nzqH+xv/bIP1rxgDAyNjjGUXPtbtXYFU+XfCb34vHo0AsxNTyTk27waEINwOWaMBMc55OG/b0DoN608s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=girPad2s; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="girPad2s"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-64b81ec3701so10450759a12.1
        for <linux-sunxi@lists.linux.dev>; Thu, 25 Dec 2025 10:49:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766688573; x=1767293373; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lwi/wOL9435JfspVqwNHJS0rgXD9DXGNHXUGNZoo1YM=;
        b=girPad2slxUwZv9jT1ahowGsdV+B/p5lQq3wAQCXNPYmS9slTY2gvqCwXpPtS2ss/7
         +KyMo2m0cmbyk/qmNQRGuS9za1pE2XGg3wgkTUIq04eMjpTzfKho4ZvIlPKful5Vcib9
         PF9cSTVQIsKGeAU2glO/ABpFSNn0CDr1o3nioutHYwtW5k1q2RUCYIi3NpNP6RbzvzG8
         sTZNzFF29dleSZrIUs0Z+kQEft8Asrsq3lim+MvXevcoTBHZC/FfjUxuPjNgEJ1n50IZ
         hNROcCUV/OpWHkvRs2Q0H/ILAoLLGwwK8nTxdDWpcYQ90b4R6Hifjhz4ceaR+XwzgF0h
         ROCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766688573; x=1767293373;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Lwi/wOL9435JfspVqwNHJS0rgXD9DXGNHXUGNZoo1YM=;
        b=iS3APPORoKSalqZC+lQJ1VjDK3e6PJlfLzhn9cQU9VCBBSoOLiSTh8eqLI/x5a2Mnd
         nKzf1GF5EM/JartJlFl6cw+fNetvY7cxaQg45hDr3ThsA5ZSA1NCrq0sviXWVCPXmleT
         QRw/98QHrdC3dB9VnUb0KzUvVCUlH1gSYLq2dZTxh5PYsshT5Q9Vn5vlLLup9Ti/z0pL
         EpHFhb3REJIZ46nvwJBJRMqn31boEsvLlEOoLZhj1mh9IKgvP2hFAUOqBxjjfLxO69Qx
         qMpjwgGFupuuaSiOp9YlOYGWiO9TE9frDVCg8xf1m8w1yMzng99lAg4USGpNv6Uck6Q1
         ZQAQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmPpeCLXU8Ql6Iz2KRm3zG04RW5pzpJkra9CYpKAKprwlNSzJtbdAOs7oPpwCeNjsD7RNBGBrGwGftBg==@lists.linux.dev
X-Gm-Message-State: AOJu0YySy4TyWxSC6DpdaAGX0A81xXhtMHQxLkirNn+1VcEnZqNJ5XLM
	KjMImXBl0P+Eeh3sibIHFEp7uN+ZHPS8dLIdEjEblWdrMzombY6bDpUi
X-Gm-Gg: AY/fxX5lw0Lm+4uBxKWCp/tb84WFSUuEmy+vIxxMMiDjJOJ4IWI3Dz+Xmwyyu7q4IH8
	qvhsh4oux34Z+9B/FkDG1Ac8cykETUkJyOubJOMLh2fz1zbpYIQUHKQpoqON3B66PhKWRFizS1x
	qpPrJQQnzJ7HSCFNREv8WxJ9b0jZbSopSXsXvSvo0txqdL/uNDXbsKcIuocS8yGfTEAViNi2bMJ
	vV9EeJJUiQH/16qQHbvmwOt9P1oTToBldVIeqGySzYCxORbnK91aTlIu3yW7Y55tq/F0h8vSpc1
	mtI5dhtbzbwI1p7JAWQkkdgcbepaioNOgljDKQyj8eRB5Knerw7nyALJ7ejcreG4wlxOVwr3mZ0
	L8wo+kCEknx8vP8IoNB0UOWtwM8nfbcgmK4IoBbtd/YJPtsbchk6byWV1OTYB0oTztXGIk6IDwZ
	D8d89wKSt8US5oHJgdNVKV2AnlfDFKGxWkQIgQb18UTYU=
X-Google-Smtp-Source: AGHT+IHGj4ugPVsyxVEKdshMmhjzljqKZD5JHwjw22tMZO+csxcebOAuFJVgXAVvGwk2iqbs87W2hA==
X-Received: by 2002:a17:907:d8a:b0:b73:a2ce:540f with SMTP id a640c23a62f3a-b8036f55069mr2086910366b.17.1766688572432;
        Thu, 25 Dec 2025 10:49:32 -0800 (PST)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037a614b7sm2164305466b.1.2025.12.25.10.49.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Dec 2025 10:49:32 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Linus Walleij <linusw@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Chen-Yu Tsai <wens@kernel.org>
Cc: devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-gpio@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH 4/4] ARM: dts: allwinner: Replace status "failed" with "fail"
Date: Thu, 25 Dec 2025 19:49:30 +0100
Message-ID: <13929653.uLZWGnKmhe@jernej-laptop>
In-Reply-To: <20251225103616.3203473-5-wens@kernel.org>
References:
 <20251225103616.3203473-1-wens@kernel.org>
 <20251225103616.3203473-5-wens@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne =C4=8Detrtek, 25. december 2025 ob 11:36:15 Srednjeevropski standardni =
=C4=8Das je Chen-Yu Tsai napisal(a):
> The device tree bindings specify using "fail", not "failed".
>=20
> Fix up all the ones that are wrong.

While patch indeed fixes the issue, I wonder if "fail" is proper value?
According to specs, it means that device needs repair. What about just
keep "disabled"?

Best regards,
Jernej

>=20
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
> ---
>  arch/arm/boot/dts/allwinner/sun4i-a10-dserve-dsrv9703c.dts | 2 +-
>  arch/arm/boot/dts/allwinner/sun4i-a10-pov-protab2-ips9.dts | 2 +-
>  arch/arm/boot/dts/allwinner/sun6i-a31-hummingbird.dts      | 2 +-
>  arch/arm/boot/dts/allwinner/sun6i-a31s-primo81.dts         | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/arch/arm/boot/dts/allwinner/sun4i-a10-dserve-dsrv9703c.dts b=
/arch/arm/boot/dts/allwinner/sun4i-a10-dserve-dsrv9703c.dts
> index 63e77c05bfda..f2413ba6a858 100644
> --- a/arch/arm/boot/dts/allwinner/sun4i-a10-dserve-dsrv9703c.dts
> +++ b/arch/arm/boot/dts/allwinner/sun4i-a10-dserve-dsrv9703c.dts
> @@ -112,7 +112,7 @@ axp209: pmic@34 {
> =20
>  &i2c1 {
>  	/* pull-ups and devices require AXP209 LDO3 */
> -	status =3D "failed";
> +	status =3D "fail";
>  };
> =20
>  &i2c2 {
> diff --git a/arch/arm/boot/dts/allwinner/sun4i-a10-pov-protab2-ips9.dts b=
/arch/arm/boot/dts/allwinner/sun4i-a10-pov-protab2-ips9.dts
> index c32596947647..e0c7099015da 100644
> --- a/arch/arm/boot/dts/allwinner/sun4i-a10-pov-protab2-ips9.dts
> +++ b/arch/arm/boot/dts/allwinner/sun4i-a10-pov-protab2-ips9.dts
> @@ -96,7 +96,7 @@ axp209: pmic@34 {
> =20
>  &i2c1 {
>  	/* pull-ups and devices require AXP209 LDO3 */
> -	status =3D "failed";
> +	status =3D "fail";
>  };
> =20
>  &i2c2 {
> diff --git a/arch/arm/boot/dts/allwinner/sun6i-a31-hummingbird.dts b/arch=
/arm/boot/dts/allwinner/sun6i-a31-hummingbird.dts
> index 5bce7a32651e..5dfd36e3a49d 100644
> --- a/arch/arm/boot/dts/allwinner/sun6i-a31-hummingbird.dts
> +++ b/arch/arm/boot/dts/allwinner/sun6i-a31-hummingbird.dts
> @@ -170,7 +170,7 @@ hdmi_out_con: endpoint {
> =20
>  &i2c0 {
>  	/* pull-ups and devices require AXP221 DLDO3 */
> -	status =3D "failed";
> +	status =3D "fail";
>  };
> =20
>  &i2c1 {
> diff --git a/arch/arm/boot/dts/allwinner/sun6i-a31s-primo81.dts b/arch/ar=
m/boot/dts/allwinner/sun6i-a31s-primo81.dts
> index b32b70ada7fd..fefd887fbc39 100644
> --- a/arch/arm/boot/dts/allwinner/sun6i-a31s-primo81.dts
> +++ b/arch/arm/boot/dts/allwinner/sun6i-a31s-primo81.dts
> @@ -90,7 +90,7 @@ hdmi_out_con: endpoint {
> =20
>  &i2c0 {
>  	/* pull-ups and device VDDIO use AXP221 DLDO3 */
> -	status =3D "failed";
> +	status =3D "fail";
>  };
> =20
>  &i2c1 {
>=20




