Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03C3E1EB5C3
	for <linux-sunxi@lists.linux.dev>; Thu, 15 May 2025 20:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747339233; cv=none; b=T03Q22XeAdsld+KAlRWA8SSOAlmladr2EP2YeA78D2sRur0xjnnZPFCy9O6Nc5ZsqwaZ3lNiM6OSHzUZyz1bjCpqQtkHzyVcX2cEc2fDUV71URFfrdCIFYyOE5R+kha7qBIRVUxw8EulIdvntvaaLdEY/IlMF2XKGUyvnwFSPhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747339233; c=relaxed/simple;
	bh=h1sXw35rTSS7pTuDFEY54HVj+OPPf2cg7Q7+jHB1Tok=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KZNXcIsmchgbxoPJylAoUO4l+O5skFSUjl1YWdFUcr+M+wzR+oERj4I3wcxVyTHYOSVb+4FTFDHF6fEkeCMfc26h/9r3DZsRhzDq3Q0UGKWm2JrZTO6yLgLtjmy3EfLvRAeVJjalDp4JWOo4A2Lm+4coV/7lnebBDYssKZOhCjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=ZpsbVuO1; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="ZpsbVuO1"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ad1a87d93f7so224145566b.0
        for <linux-sunxi@lists.linux.dev>; Thu, 15 May 2025 13:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1747339229; x=1747944029; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=h1sXw35rTSS7pTuDFEY54HVj+OPPf2cg7Q7+jHB1Tok=;
        b=ZpsbVuO1jWDogt36Oou2aH4F9pEXVl7LsuDbYsZRthLhyS3nNQ+0YxkBNAy/ivzbLz
         Jh79iQ7qLlhK9hcoa8relZ4JJ0+Zk4wwqHRhQe9618Y6IAo1kl7ZHSG7+oYl/SaOXE2H
         xrGoP4ZN0ApFwRFewF2zQ1/t+K7gbd1OINgAc1t9a8U6k4THkLfHTw6fzqvieGeYUOWI
         ig9hp1xE1SjvkB9xwV4C1WdQSJNkR3kPcOEug0AQ91mFqqJZcCsxSjouS2RamG6HXvqW
         PRyrnSYdEsdVKFsqsLI5q1BY0X7KFjfpGd8yecVfO9shRfFZbIsJa5f8971hmyYOadTN
         ia3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747339229; x=1747944029;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h1sXw35rTSS7pTuDFEY54HVj+OPPf2cg7Q7+jHB1Tok=;
        b=FMnJq23XmqiaNA7gLVj20DfpRQg7w+/QZvSVtr+S1wT3LLRQu6kw5yMnFk9PkkK7Tg
         iAGLjE53+ojCl4zBevLYR3BNemHlRafePTRYsc5/Y6jESAppYD9iB3154q6GKrZPIdJb
         FVXInVBDjI6a67tI00fWw+uIwe4yu+QetpWHJJppQ1qIQMqGPOumURtMGvOFHh3ZNeRo
         mqT0EnoMTBkRKTaOdHjqZtFGwT5VdjPQkDSosyK8WkCR/YKPU9cl7eu+hLHSkm2dRV57
         cvQCDMvtYof1qs/uCFwFsylEUBaViWz7u0z65erbQ9mpR6fc32d2olGCz7S9ElnQxSHk
         7kgg==
X-Forwarded-Encrypted: i=1; AJvYcCV2FyFbE8C7MHLVpQh+ua0PGBIUEyk4ezBTk/TT3Zs3xCQW2xk0oDD0Vi0nOwA8asnk8hBCLYO2Q9alQQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwlYPQaUnGfTI9CMOmgD2YlBseb4LZ4mkLRR+qqkXtMx9CzTMEe
	DGr3MJgmDr6nLvNN2j+2EP1zBl0YiD9lEmw+OGVWtnLpj9/G6CstRcBvJWT1Cdi3jXj4ZImuzUo
	gKynC
X-Gm-Gg: ASbGncvWDOo5sYUAROdVesc0wlgSOZM+VTTIVkB9DVQrUZ+iWMo9q+i+q3hHM7qzbug
	4AcL0fbLaH8dBHdpRmIpueiNKZMb5bljsSEKyRuDwVYwe1k6AiHMvFX+6mj97EZT0Lm8/fo33bu
	D579whBOa2QRv4PxrnF/+1IQ/nU+Nnxt1x6KCiOr1hza1x9mx2HGIw96MiieQAZIpthaKdROMUy
	qocUdqQGzxeNAIVAf5yrdoFRjqm3P1qmlDfpUfEpZeFrc4mfjuVmmriKcL+l4h1loF1zDa6XjhL
	hAkdf0HQ7pcWA7eLLz5w9vmCmY2NYVLK+Wk/GuFshhAdv7lzIb27KXVj
X-Google-Smtp-Source: AGHT+IGPOFtpI/vK8bB6QX01z/3mHJSuoT96bx2VZRxF7C4JeqX1CuZQvwl02jljZ2PZvA1htePF9A==
X-Received: by 2002:a17:907:1c0f:b0:ad2:2ef3:d487 with SMTP id a640c23a62f3a-ad52d5ff0f5mr99764766b.58.1747339229197;
        Thu, 15 May 2025 13:00:29 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ad52d06df95sm34035166b.56.2025.05.15.13.00.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 13:00:28 -0700 (PDT)
Date: Thu, 15 May 2025 22:00:26 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Chanwoo Choi <chanwoo@kernel.org>
Cc: MyungJoo Ham <myungjoo.ham@samsung.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, oe-kbuild-all@lists.linux.dev, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2] PM / devfreq: sun8i-a33-mbus: Simplify by using more
 devm functions
Message-ID: <tdqcadvrr4lfn2ipkbcu2n7zgv3e57q25tirvuo5ooh5zzf6my@u27v7wxswber>
References: <20250513203908.205060-2-u.kleine-koenig@baylibre.com>
 <CAGTfZH2jVrD_Bfu3NZJ+vNdQCjdxo4vygxWob+h0VasyxUa4gA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="h3k2tl2vtfjhrlpb"
Content-Disposition: inline
In-Reply-To: <CAGTfZH2jVrD_Bfu3NZJ+vNdQCjdxo4vygxWob+h0VasyxUa4gA@mail.gmail.com>


--h3k2tl2vtfjhrlpb
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2] PM / devfreq: sun8i-a33-mbus: Simplify by using more
 devm functions
MIME-Version: 1.0

Hello,

On Thu, May 15, 2025 at 11:38:11PM +0900, Chanwoo Choi wrote:
> On Wed, May 14, 2025 at 5:39=E2=80=AFAM Uwe Kleine-K=C3=B6nig
> <u.kleine-koenig@baylibre.com> wrote:
> >
> > MIME-Version: 1.0
> > Content-Type: text/plain; charset=3DUTF-8
> > Content-Transfer-Encoding: 8bit
>=20
> Applied it after removing the above unneeded information.

Oh indeed. That happend because I added a newline in the header part of
the patch mail. Thanks for fixing.

Uwe

--h3k2tl2vtfjhrlpb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmgmR9cACgkQj4D7WH0S
/k7qZgf/W9wz4qM8Tz2N3KVv0s0oVU6w1DHns83H0SunE+jquxj7/y0evxnc1Ilq
V7aafapnyBgz/U74H9Utvd9gMBwKk0+lnAQXnOnGeySRsr05q1toZq1bVilPn44z
c3HCsfln9Kb7m4ysM5O6U8p92h9Rg7uP0epQ02JXxknaQDHiY0Ac+EzsZZw1uRbe
mvlrfet/eYHmpaMPxlRM6ksBrxJQpSIKuJpIIf1VlkWNniiXY93fl4yor/7JCj0L
v/fgrnnDu+6Gk6c7cj1fvpL3Twh3AlRwx5lmMkJ7HoSvxhNcrIc2m7U4o9/pCEh6
jTzhBsJxpV9AAfOGA02x5qQdG3x9wg==
=60Q6
-----END PGP SIGNATURE-----

--h3k2tl2vtfjhrlpb--
