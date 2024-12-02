Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 902E71D86C4
	for <linux-sunxi@lists.linux.dev>; Mon,  2 Dec 2024 12:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733142033; cv=none; b=sxd2g2D8HvjbSP2j9mq8E/nxy0qQ2QQAMiEmUiSrJkBc5tnu09ms4jOOGwR0GSDsD16URD+p9MbhMH62PyQxjmt1KCL1PwvZO0sUi9EXjKg1qPEh9C1zIWDZfUV6p3IYO0rq2zXTHrg53+KJefy6WgPeH4QGNm3plBlTEOM+ICk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733142033; c=relaxed/simple;
	bh=u378XDx4WG4IL/2dCVgpOQRG8DFhsOKnAQ0gTpFbO7I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lkaM5mTZPXiyg7+oGyLC8uKPfiRp/2orYtxG9WgK5G6GPECGsoBa1IGQxPIvTD4vkkUuWGfydrMC2yzCTzInwJTymdj2giWYGqPrtvjBb9wyi9KJLcfwi0n1sELdHBDZpHqS0M7AZZVEjm9mQl08O1RTlqx24J+KIUdXQGpqUCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=FIwAkOBs; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="FIwAkOBs"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-385d6e36de7so3658378f8f.0
        for <linux-sunxi@lists.linux.dev>; Mon, 02 Dec 2024 04:20:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1733142029; x=1733746829; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=u378XDx4WG4IL/2dCVgpOQRG8DFhsOKnAQ0gTpFbO7I=;
        b=FIwAkOBs3FGXsKeSBWTn4qwJ7Yd7HZtG3byCYPHDWUZTvTZiny4r1GMOgHnZWvMDAD
         eW99L/t/8zEfSA0Ut0TwxbL6tf07jvcdML5nnfPe0cIHGqd1B8JoNLNHO2m+oDqKm8aO
         gdeBHeF5eu3w38p/3z+frAxF/Wcodi5XflqtNjoHP/t+pyipiT+7x+6xnSyvcNEyj8KP
         UBBa32LRdOJAuPyrmdTdXkmLLTj844q+brbaz7SZK1ZFPqgsl6hlLRFHJrS2U5u3ReCa
         JjAr9TeFNC4kjOXrARaQH/fOlhcPsgqouPjurgcYdOeNf6iUyR2Rm/0R+P+vr0SN+4EU
         Va1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733142029; x=1733746829;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u378XDx4WG4IL/2dCVgpOQRG8DFhsOKnAQ0gTpFbO7I=;
        b=dE3TX66GMTiII0gTprlj7JzzNZWfkhUf1+eXVS2La5pVXru+T5pzpQ0YC1XRsp5q8O
         fx/5tLdD9LxIbOINQFI/kmm9A79+/j42a21Y9kS1tDFTWwXGs0LQTcNmuS7OKO4YsJ2g
         6h1Y78Ymug/o8SqeB1qoLx+pPdtQv7dyq0drFwUxuhYGaU2Tyg8Q2Q5bJxvdEFr+yB7s
         f3SlAJ8k6/ky/qFP7NOrk1XklxjjzKRwV1rjvdTbuU2DOrLTyvk9mvhw9qpnjNOteQ1b
         gK7VrpWnQDwsIZLTDB4Bjff5vlKsf8CCDs4NP6B6M9ViHdpITldnyj/z3Bar9vML2CPm
         JzjQ==
X-Forwarded-Encrypted: i=1; AJvYcCWpz+4rUPWHMaFp+8zD9qiE2jj+LqEkbCdk/gMKmHet4GNkkruH0mzFDPv01dBB9UkZ6cOBZH7VqMoaeg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwAqYl/HfqO4suvd316BW+pbu3FQK/IGP0Jfn3mqvFX2u/HN+td
	Rwi0fc77qGNIr72bet1PmkW4mmhePhN+PNiWu/MyM3k/CSVpUHzv7wjSgFumwrw=
X-Gm-Gg: ASbGncuMKqmux7EgYdXPC0YxrE1PPj1iLoqmgUxC4fk0rYoomIcxbMKVo5tnmX+qMWk
	HO83+PL2iFboYL41U+s3M41Zbb4Ve38nojoEVSIuM6R4MuBHWSurMdsITU+u+Hptsz84CP1rSBt
	7ZWbTquZmSHPu0zmY5IpBm81h90ZQVDQBBNYLuVt39U2nc5lVOM0xt2qTCdo2i5W9Kx+IhdoOSn
	QIoLohGuq/JslXETxC4ReDqgfxFalc9ZR0Epc35nNOJIpXdxPYVj7e2akvIvve0l2+oiPmmaBrt
	zwHu
X-Google-Smtp-Source: AGHT+IGf+OvmTZwKTtzXYs9qne71qztg+HmqmaDV8f4rBxZC85P7ds5jnT+F6OPKkt5tMs8EWORR8A==
X-Received: by 2002:a5d:64cc:0:b0:385:ebaf:3824 with SMTP id ffacd0b85a97d-385ebaf3c1bmr6637399f8f.27.1733142028900;
        Mon, 02 Dec 2024 04:20:28 -0800 (PST)
Received: from localhost (p5dc6838f.dip0.t-ipconnect.de. [93.198.131.143])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385ccd368easm12329689f8f.25.2024.12.02.04.20.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 04:20:28 -0800 (PST)
Date: Mon, 2 Dec 2024 13:20:27 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: MyungJoo Ham <myungjoo.ham@samsung.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>
Cc: linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev
Subject: Re: [PATCH] PM / devfreq: sun8i-a33-mbus: Simplify by using more
 devm functions
Message-ID: <7taeakaeqyfu4x5h3r6z6lkdorxav4ox2sgjikw7zqkmnfmffs@2n2lpk4uqe4l>
References: <20241111112237.336310-2-u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="npsbh5lctdjw63a2"
Content-Disposition: inline
In-Reply-To: <20241111112237.336310-2-u.kleine-koenig@baylibre.com>


--npsbh5lctdjw63a2
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] PM / devfreq: sun8i-a33-mbus: Simplify by using more
 devm functions
MIME-Version: 1.0

Hello,

On Mon, Nov 11, 2024 at 12:22:36PM +0100, Uwe Kleine-K=F6nig wrote:
> Use devm allocators for enabling the bus clock and
> clk_rate_exclusive_get(). This simplifies error handling and the remove
> callback.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>

Is this patch still on someones radar for review (or application even)?

Best regards
Uwe

--npsbh5lctdjw63a2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmdNpggACgkQj4D7WH0S
/k67GAf+P1XZfxK/FMwYqAbTJVZUiZwlfGN74ndrhxFPbHPThdAPRaVOh0IRAYua
nNRvgUgKYgvOKLADNuGv/G8+SbN6Znh9b+kW0BXye3Xb93OIMPJgSzoURb3DyXp9
LsFA4cuWBBUg6dUv6WT67/7HV08jK46kQ0xaUIsadtoZpqCTlSsZulNGmI1FUFd6
wsrbhwPKyO3c4s9lLNmKpfskNaEJcbiwf15UxBwtylwYS9ZujFbRyc0781JIWef5
NCNISsYYWdjX81tLApo3S7HWo7qLQLjMZnkhY8wuAE+TfYKB8usuz/d8gHJWrX+s
l3pwP9dao9owYBPAIPPnfTgv6L3Diw==
=0LW+
-----END PGP SIGNATURE-----

--npsbh5lctdjw63a2--
