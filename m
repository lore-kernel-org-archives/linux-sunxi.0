Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5977B19F475
	for <linux-sunxi@lists.linux.dev>; Thu,  5 Sep 2024 16:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725552659; cv=none; b=NC7L+Gqwp0sFqk3BdbgiaKc1akF9DoS1SOLKT3WjAPH92xD66+wMjDNqxrvGtIkl7kGPbxHifnczgBRczCiAXOUvMR+P1OU7AQxURB/YwzPO9hhyrCMEG8Suf92y1zpEDY1dCN/I4pPuYqx8cmwEKPf/lDlJuPJWVdJkhzzIK3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725552659; c=relaxed/simple;
	bh=UFsklKB4T8Uv2pYqKRY9mlsDLwYDpsExq9n42ZFvuME=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HKTqY8fXpjKyeQREsgirtoKEKNvdL5Um4nOJm1x4Cai1kb8/EbA3HyYQpuU+a627RV4USpt1F3wR8bWM9JqGLj+vWcD4UUjFw2U8RWnbqtdIhEGAx7MbtSbFLsjArkh4gb1u7qedomFv8PsteqfIGx/wcYTOcdKJE7YUfQ1QjEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=ySflrjln; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="ySflrjln"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5bef295a45bso406446a12.0
        for <linux-sunxi@lists.linux.dev>; Thu, 05 Sep 2024 09:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725552655; x=1726157455; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FmvSoHhDndKZ3y45tzXwCWQPSzV3qf2+rXDuMTj8IDg=;
        b=ySflrjlnzGQGCr88hNghoLQzHU1KEeKIUNOxKB+cavB/shkERMdxogAGv+sMRjbnvP
         Ak5WpzL6PZ+8oaqBtQ19ZCcuEa3Lq2c/AMy1wCXsL9N1z5lty0WGeIPr31LE8oswe2hL
         0Fez6rJFAZFiqQO9uhm4lPixBnV0hzdglHLsGPaXORVXgzZFEn2TLjErVDFxFZ0SSfAE
         AnGOdDDfwN9NzdcTJExnKn69MeJQOpd7jIna7YUAR/s6Ic43bLP80+LZcVqH5wYpHf5x
         uu04B+zwOQIZ4d1R6oud+TG3cusIBhLKQvt9rub+Z08T8XAIUMjymNYvX9AYUe0c1G3n
         7d8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725552655; x=1726157455;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FmvSoHhDndKZ3y45tzXwCWQPSzV3qf2+rXDuMTj8IDg=;
        b=igL1L2md4r5gApwEBAkhAGawTARrD06bWwPDOxaxteENnIz0OPnenblcaBi6Q76nbI
         FygBEKQsI2a2xdU11olY0Sh+C9/we1/sNgwFjKJPOMXGXTv8m1339xCrFLHgf5/FEWal
         3aNgBosM6DXJcOr3JyxtLSEbTTcIhdp+qOJN4e8Iw8/jhlOjAWjYUwwYeM6CkPnSC6te
         htVt5HQ/AxR7O1m9FT+sv7fS9M78HJg+djwAbkrXS86cNym9om3XrnE18XjidbJy7i7v
         w3RSyr8agwtD8xGYNCkBnxl4gQPwzZW97L+Cat4YyrAfA6qAS1PNY7JTj8p7cPTOUh3T
         OuRA==
X-Forwarded-Encrypted: i=1; AJvYcCXAt+4195EfssMNfTgWIFm70hqBoldIUnva1vawtcYwnVkIHsG9StRbKkJz4OtvZLgyUoRb9/mPOIsgtQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxZoaH/p+lwazGu26TYys4hvnCc6+h9Kh/o6pbKeBFhFwuvsOZc
	/m3dNBXO6OwSpJiDKko69eBJkIkfpG5xcaE/iRzLlskKzW4dLJVT0xMGbiQi8QY=
X-Google-Smtp-Source: AGHT+IG6IDbk7v/HFG6pbnzGX3PkDzdGXmhD8c2zfgnVU3b8YLZ5Kd+Mnq7+b3YgqhjohnggrqFULA==
X-Received: by 2002:a05:6402:159a:b0:5c2:1803:ac65 with SMTP id 4fb4d7f45d1cf-5c3cd78cefdmr3013012a12.21.1725552654495;
        Thu, 05 Sep 2024 09:10:54 -0700 (PDT)
Received: from localhost (p200300f65f01db004d6a46a6454a1385.dip0.t-ipconnect.de. [2003:f6:5f01:db00:4d6a:46a6:454a:1385])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c3cc54b287sm1378738a12.30.2024.09.05.09.10.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 09:10:53 -0700 (PDT)
Date: Thu, 5 Sep 2024 18:10:52 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Maxime Ripard <mripard@kernel.org>, linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: pwm: allwinner,sun4i-a10-pwm: add top-level
 constraints
Message-ID: <zh5vm65iuzxzr2i5arjpv2m4bfowrx6uyhdtaa5nzdb4hf3fqg@qsnfcyrw54dm>
References: <20240818172828.121728-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="clmudpfclrlqcx4o"
Content-Disposition: inline
In-Reply-To: <20240818172828.121728-1-krzysztof.kozlowski@linaro.org>


--clmudpfclrlqcx4o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Krzysztof,

On Sun, Aug 18, 2024 at 07:28:28PM +0200, Krzysztof Kozlowski wrote:
> Properties with variable number of items per each device are expected to
> have widest constraints in top-level "properties:" block and further
> customized (narrowed) in "if:then:".  Add missing top-level constraints
> for clock-names.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Applied with Rob's R-b to
https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git pwm/for-=
next
=2E

Best regards
Uwe

--clmudpfclrlqcx4o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmbZ2AkACgkQj4D7WH0S
/k4nLggAjg/D3fHm7uxQkqwzgFATNnkOhFJd5s1NiHmTxiUQ0OYSXEI4mv4hNxN6
4XtyF8SXGCLWt4T3GDxqM/c5zUTJIc9OxwUfBxud/iP0Ls/MNlCCMdtzJXvhwoMp
TAiu3vhb/cutSHbjPlGQ/A35zl/XDAvXlwxaGJfLIX/y1AkoAIE2nGaLLSQFTv72
ASAeWu6BYbdAs2mEZWVN0ixsqlNVkeHF15+7IQ0uXVs+ukBbVSIZlLkj6PnNcHA5
9MRO7cRENf2OaiO6yzWyeUQDxX0OOz28NNkPeqT6ucEPxNEBE96JJ5yJ4i2ch/F0
CEbdu8DoO/MF82GbO4j3cLV7EdiSsw==
=NPcN
-----END PGP SIGNATURE-----

--clmudpfclrlqcx4o--
