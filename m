Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9935F180032
	for <linux-sunxi@lists.linux.dev>; Tue, 10 Sep 2024 07:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725954937; cv=none; b=h6amz2i6134TaJW71GJ8AI4HI2qAEzNtwRaWGVZv/E0+VN5plI3cyOLDfSMSzK3UfBwqYUajnqrkTprjgrthRMgzXPxwZkZ5Mu0UO0bfnZW3LOcYMbqOA8S5Zpl0+JIBUcbuVGFQtI70Aa88K1dDRKT8wekyDdjg8LBo9ToJnew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725954937; c=relaxed/simple;
	bh=JIthjp3j8aL4qbNpjiZWv+xdaSgTUf5vb8G929qi4/Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Re41LP+fA2ljoCYpfPNn0D5UmBXJRoVARwKIR91SD4Dle5VGKSwhL5Ss2ZWAIi73t1r3n7PYWLlo07l+dNcJSVmPBA0r8sF8PSkBhhaJ7GNTalN9gb7ecgU9+Nl5Y6ZL9tJlnSawSKzjKMUK4bhnyTPgRYTia/x8PlhM5IrphdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=jxXDknrk; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="jxXDknrk"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5356ab89665so6107477e87.1
        for <linux-sunxi@lists.linux.dev>; Tue, 10 Sep 2024 00:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725954934; x=1726559734; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JIthjp3j8aL4qbNpjiZWv+xdaSgTUf5vb8G929qi4/Q=;
        b=jxXDknrk+gUi+14lBNM5tngEEg22f6xb1LlZ4I2hakoif74hKQixAHunIZT9M6lvet
         fEEYKOuI4i9sfzmmuQkJKOZRdUsFh7D3kBmkkW3N/UnW/zP7HLeCGF3W02hUdKECCYsq
         vEb5DL6LOjz+BuxHg3xWEzuKfaNnNxGt1UZ6ga+2+LxGp3c0/yrDPdakEQVJeuFQ/HqZ
         5q5FJVLfCSjL61sA5hfBWJXTENjXRgpTmlynzn1ixk0HOGCY5L+1bcLyecjTSCvg6yNg
         3QeyAvDrVHi94hYTRbCCLQXxbsX8W9JIFJ2NphGTLt0PrZomxFbIlqA4ejqUX1ku+/py
         4mQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725954934; x=1726559734;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JIthjp3j8aL4qbNpjiZWv+xdaSgTUf5vb8G929qi4/Q=;
        b=mpunvZc6PXZD5vg1sXnexqzhUGxKwWEQOCDlZGRGVs5B8/0kIM6qwIV5QGAgrbYGNM
         XqoO1dGgm3IjmkxZ3QbaC6hUDllMRs6rxSYvpAFUoLczl4BPQ2fgWJyLgQ11CZt2hHRQ
         JcrW2DY9pS2zoHgaTa1+i2BSpqENN6d/A24jGP2aZ2HerqTZ7LsYlWLPYRs5xlVNTX4i
         urz8MqGXmeqS4/5VPjDdpZad7chmiZ00zoyK0r7vSQ3bbDy9k081DaGhUm9BSFtv/7Uv
         sY0U7HLRLFf+Hyc4EOAn0e288h/Xp32vShVNHkUjtJT3VXnHp3gWDQeTLpccgPelkufX
         lDPg==
X-Forwarded-Encrypted: i=1; AJvYcCWimPgI0rAi8fSsLvZ3/PkNcBi6oAle/qZrd1OPg/7elJWT31ZTKxZBBT5odxqh9xgevMuDbvCAAUoQhw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwfZ8jpEXtMt+MJioVdUqRME4wAe6RlwXCPZIYToSzu7zAu49Cq
	7YXe2E6h+raDaoRVD0ew0FTvE7YzRQ/Z2SRNST9211deWFVlRJwoM8n1GEF1mgo=
X-Google-Smtp-Source: AGHT+IFEyg4hXTd/aMf8FnzJ2ovzAAepl6pWeFTEgYUTvGhRmQzbeiS72GwyVksONhwMqkvhRJ5WJw==
X-Received: by 2002:a05:6512:3d8d:b0:533:4c73:a244 with SMTP id 2adb3069b0e04-5365881d8e5mr6676905e87.61.1725954933207;
        Tue, 10 Sep 2024 00:55:33 -0700 (PDT)
Received: from localhost (p5dc68d3d.dip0.t-ipconnect.de. [93.198.141.61])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42cb0642f99sm99016625e9.40.2024.09.10.00.55.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 00:55:32 -0700 (PDT)
Date: Tue, 10 Sep 2024 09:55:31 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: linux-pwm@vger.kernel.org
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Vladimir Zapolskiy <vz@mleia.com>, Heiko Stuebner <heiko@sntech.de>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org
Subject: Re: [PATCH] pwm: Switch back to struct platform_driver::remove()
Message-ID: <4cvlp3ydsxmnvyzuwxq2vwtzhnlfhviyktm7rwfrmrrpto4xxo@ee6rmxesaddf>
References: <20240909073125.382040-2-u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rjxyuiyf5fjudrxc"
Content-Disposition: inline
In-Reply-To: <20240909073125.382040-2-u.kleine-koenig@baylibre.com>


--rjxyuiyf5fjudrxc
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Mon, Sep 09, 2024 at 09:31:24AM +0200, Uwe Kleine-K=F6nig wrote:
> After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
> return void") .remove() is (again) the right callback to implement for
> platform drivers.
>=20
> Convert all pwm drivers to use .remove(), with the eventual goal to drop
> struct platform_driver::remove_new(). As .remove() and .remove_new() have
> the same prototypes, conversion is done by just changing the structure
> member name in the driver initializer.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>

Applied to
https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git pwm/for-=
next

Best regards
Uwe

--rjxyuiyf5fjudrxc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmbf+3EACgkQj4D7WH0S
/k69rwf/eoehxH7n/R3kxTqadGHMf79sSoI+s8s50Gw2F49MzfvPn3prVQIDv9IR
KmKAxc0jNZ5bGFuloHmdDQG1JwP2jXRAJIQAMV3PWzikTXuRlOuK0pc8Vf6fk2Jg
qwv6XKabbMx4QKKFNiW0SRxy5UTji0L8eBO8TimT4VwhN7QC9DzaIxiNDpLQAdk1
u1dOmRds3mADzC8szfufbRIk+he3qlr1plmbkkhgpc4Z66NmGrlsopKJgYY+bdtG
GIXLrWs1lJzEI4OefiXreWufNz+800nWmYyAQKjmRd5+gQDuJJeZE3lCT+w0jtfV
cIKJ0Pv6kDk4oCEpgvBcGOh7M9F2iQ==
=JYKt
-----END PGP SIGNATURE-----

--rjxyuiyf5fjudrxc--
