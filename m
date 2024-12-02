Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED7E2205E32
	for <linux-sunxi@lists.linux.dev>; Mon,  2 Dec 2024 15:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733153512; cv=none; b=rf7ComTmfD+63++ZmEghEiNVKslcUhLIm6jk3HdSlLzH8A/BBa3VhblGoISYPy/3wddmFGd1hmxoOqv/quzpmwl5/FCW1GWapbR9kyHESzYQd5BvqQniU1Ms/q+E8lXXrUXChc7fcDhbUnCnyu5LhbOcWiBBn9//FpfWpsa5RNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733153512; c=relaxed/simple;
	bh=QJFQOhHvRWMfU0TK3Z+kwO6rmT9pNjzCjW1otfK4k08=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lbP095J93l0xkoku/GpPy2BvnwhxH4TzTzQsBKNCpYF81eI0kuUUlkCkkuAzgVVpYdSm3BpfvpcHP/BotxkEqEWuYpyFal1+jy+wgsqgxsWAzpJdsvQIZFoYtGY6oLPwfEMJYAn3+zPBQvmP/94mAHgUV8ltcmO3Z421Dr4RITM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=y9hkrIBp; arc=none smtp.client-ip=209.85.128.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="y9hkrIBp"
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-434aa222d96so55743175e9.0
        for <linux-sunxi@lists.linux.dev>; Mon, 02 Dec 2024 07:31:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1733153507; x=1733758307; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QJFQOhHvRWMfU0TK3Z+kwO6rmT9pNjzCjW1otfK4k08=;
        b=y9hkrIBpeaqmafYGbCgjr2qMAcFK1r+7Z4ul2Go5W2YT9nwBj2iOIVaUKwlB5zg98y
         y8vJyF5S8StrHItrXFfRY51mh2dHSzYWz5PvgWzFoImYNlK0E+ROcUhDcoEY5o6fq0Y1
         Womn2PPij8aHZLRUZLFZN1re7tzjmkzFYTYGOAozHGGnzOY3Q/0DWG+CgDSOztRD1riC
         5T3P+H6EH0KJ1J1Nh9/HJ59LSRz/AU4ciTUAFlPh+whW8Swm56rGUxPROjPMojcWDYtm
         39n1yU2rBJoMUH7/zrONEosSbh90QLd45+pbkDXCHCHyYPCLAuELuL2g9+V+8AaHe8mG
         7brg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733153507; x=1733758307;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QJFQOhHvRWMfU0TK3Z+kwO6rmT9pNjzCjW1otfK4k08=;
        b=lhGn6zbFIRiZTRJdq3HHxOF59mGGoxu7vDY4Rb9+zWIGFKhvem7TdSeLAZxxfQtjSp
         Kl4QyfG1RW7djSJ4vmNP7cssswZtdFeILkn/2smbrMRp9yDKiwwlHRj2Kj7Q3CRtmSF4
         haNKP0mlW2f4zUcNSAknXZ4vVcn0WS19mYhjEFWMUDVx/2K7nEKciN5onM5KKb4j1TIP
         VpR16XQVm2cQoqrOb3nvGzQThwI4u9vvRfhJTDTrzBxK899VwPuwi5aEvyQskcL/TWL5
         zwsfgcty3WbnoAzj+gelYNaiRZBpZX0FPtb7M/rzZfFyXyKF7X4kTIq71NzZ2XSwcyEn
         ggNQ==
X-Forwarded-Encrypted: i=1; AJvYcCUcXltNh8UQr0qPmxjr4Li0OkQcihwQZD3pEX9/t3AOp3qGVvF2rypttrgHQBhIgwaFMEGpPGE3DBz6Og==@lists.linux.dev
X-Gm-Message-State: AOJu0YwFhtXam8Kgf8TFZiX9EZygFHTo0vsuYPZKtDcmxAcsb/yaRN2c
	wUlM75sEVZMY4516AuMP9yncqFQ+mbgiD7SMNnpozQuhTcoyTIGQC8McfJ3jL1M=
X-Gm-Gg: ASbGncsiRIP9HsUPPH0JH389KpIhqBOiEWQJXd+KXiRVshgICoofhgAx2lT096OOFjj
	psRGpw5nSfEFZvKBmtPUDRQyA3y+LDwgC9YKdpHiRRmc69HaUIBD7Z/PT8HiK/3iq70KRfb77gP
	T9vsQg7jTpvgeehavgIrRMuZRupoIQwnTPI4vukOzLQKNhEFRbE0Da2WXhSAVbQ+fl3jFRgrFuC
	yxrPiNO3n7Th7z0lmKU0zcXQm4ayf0BEfmeWogAKI+plImpjaKtv3M=
X-Google-Smtp-Source: AGHT+IHMBE300Bcm54Mmq/v3tBkO0lxgfJUVqj14Z7wnWfcFOCNvI3wDAreuaFWCRfOaW1RTUGcZhg==
X-Received: by 2002:a05:600c:458b:b0:42f:8229:a09e with SMTP id 5b1f17b1804b1-434a9df7b85mr236310305e9.29.1733153507008;
        Mon, 02 Dec 2024 07:31:47 -0800 (PST)
Received: from localhost ([2a02:8071:b783:6940:ebc7:b34e:f4a6:7947])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434a5dfc03csm105063765e9.2.2024.12.02.07.31.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 07:31:46 -0800 (PST)
Date: Mon, 2 Dec 2024 16:31:44 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Chanwoo Choi <cw00.choi@samsung.com>, 
	MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, linux-pm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH] devfreq: Switch back to struct platform_driver::remove()
Message-ID: <ecae7326gzjpwpg4a3ba2dgddh4jg362ybsf64xla4lyff3mk4@x3q6bocz2car>
References: <20241130135813.895628-2-u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="peon3ci7jqimuqo3"
Content-Disposition: inline
In-Reply-To: <20241130135813.895628-2-u.kleine-koenig@baylibre.com>


--peon3ci7jqimuqo3
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] devfreq: Switch back to struct platform_driver::remove()
MIME-Version: 1.0

Hello,

On Sat, Nov 30, 2024 at 02:58:11PM +0100, Uwe Kleine-K=F6nig wrote:
> After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
> return void") .remove() is (again) the right callback to implement for
> platform drivers.
>=20
> Convert all platform drivers below drivers/devfreq to use .remove(),
> with the eventual goal to drop struct platform_driver::remove_new(). As
> .remove() and .remove_new() have the same prototypes, conversion is done
> by just changing the structure member name in the driver initializer.
>=20
> While touching these drivers, make the alignment of the touched
> initializers consistent.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>

Note this patch is obsoleted by
https://git.kernel.org/linus/e70140ba0d2b1a30467d4af6bcfe761327b9ec95
=2E

Best regards
Uwe

--peon3ci7jqimuqo3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmdN0t0ACgkQj4D7WH0S
/k6qNwgAiyaoRUBzt+ES/sXpbjU1ikMyNnk8Olj+yqwh6q3TT7T/cGK/mJZ+n8Jx
Kf/b7GtwcRk3RScaL6SOlRNRgJCTKyfH7s8Ko1mLum0vsaTXMeCq2v3LWmKvMqk8
IKYihoDhPxfvbFrY6VlUixTkGip8fHGONhs/PShKhoM0Q5UeBXRq0jtssisQqaDj
MD4pC+pZn9OtMP1OzIoYDm9txIY+TIQfYil1fC3HJLrS+i19CGizdK1R0gaJPl4t
YRrVt/aAZ09xtLiGt1FM8hS+DbwwIi4/t5eYPFEEzUMxFE1IAMuSkiwcr2GIQ2Wg
9eZ8IqZADcB+nKoGJhVo+lkPfeR5fQ==
=TKo+
-----END PGP SIGNATURE-----

--peon3ci7jqimuqo3--
