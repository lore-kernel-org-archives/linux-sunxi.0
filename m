Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 743B122D788
	for <linux-sunxi@lists.linux.dev>; Sun, 11 May 2025 16:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746980013; cv=none; b=KzUvqLfjFXrYQoriVxomfqUvc9TyvWNDvMXgpxVA/qg3rglwUZ14U/rNUtBNddpmP7cvM2U6vcXu5VFYLaln1RSUZz8xNda4A2gXKqjp7e86f0+hIIOaVc8+qSd7uy7h2AfSZEMY6OLFEe4jiqMkic2bhs1bd5uDRbaZ9PmaGcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746980013; c=relaxed/simple;
	bh=SHmLkd7sQJiu2Mufd0cQ2iLgnOytU9zZh+hQC2pegbA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jJB1CLXNCkjgU1d42oHRYuc+P4RGINKAGvkKAUj/0quAvIa4yvfZpZyyjGiL54f6P0D0350FriwzKYKJXwD5jvQq1uqbaEFaxdnJuM8RftvIEKJa2ZTwd0S3Cg6Pq0aXaloxipjCUhu5m4faGucqxEi0IoBBmhi0j9p6WaP3A6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=3CmP0yfN; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="3CmP0yfN"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ac34257295dso624919066b.2
        for <linux-sunxi@lists.linux.dev>; Sun, 11 May 2025 09:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1746980009; x=1747584809; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+HqZjTSS7S3eJwQA/m3U9yuAxHSWy2oxr0SFmWzaxHw=;
        b=3CmP0yfNBqDZnlIhl9crbBWDQ4wOpMW+lLLiLRllJRVP1qNYXrX9WEcAG9DIxxlE61
         cHAqJoFz3E+dLGk8WvFGkV99+mswwEnrm8JsebXqINCytcYZe/a32PFoHj+03AnMCjgz
         SEtJhmfc1PzRcnYavNPBu4ApbxvxI/aIsoWGkxi0jyXqDuACmQ6OlbhHldq4IBR765vU
         wQSfkT+/MfVBvRHlMkrb4W5L1frvrwC0FlwVH7DxVH6Dx6ssv/MJLoEPTx4PG1TSyyiX
         X3i9wYxHHDfV8woWnavlj6jf6RSPQBB5a954FS4XzGhzUVYxQRTfnGCXlLvKCI1VwwgN
         rC1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746980009; x=1747584809;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+HqZjTSS7S3eJwQA/m3U9yuAxHSWy2oxr0SFmWzaxHw=;
        b=sZJ/pmROwsOYzZnw7JjbaqFiG7fLPMrYte6/0jAWVIwDuQFAQ0MyPYSjTUPxmBcimd
         5Am33LMVU++hjzxF5Fzj896YWHvqPd+2ta3k5ftKuMt+oQbBLC8SJrk/czFU/lF8XWbQ
         KSjCrCmmEEkWfjlB2RUieLT6lr7xQ8CmDYgcyvYLs0CYPpBsXcc8YGcjspHGt0EaB5wp
         PE1somIfKdxMFy8lf8vf3zg5FGclAK7HLqFX8XBVEZJfEacL90D4RFJjfsXsjRZfjJZO
         rZFVZpXPQ44xqEN/LjO0CxdhWNnYNxgLJR0tGwLHgoX/ZuufWUPqIuGO9gPxjcK+1gkn
         wohw==
X-Forwarded-Encrypted: i=1; AJvYcCVMxV2BF+amIvmnsvhckI50MWnYkhK7XFQtf6CaUDoOsgMO3XkZTdWoDoa2Sze2FvOiwJQHEBZWuEAwhA==@lists.linux.dev
X-Gm-Message-State: AOJu0YydJhWzpTjbQoTmtud8EUfiKs/fo1ylbAJS3l/YRBTKvodxzKAW
	gm2PCtCnwmap36AJRS5/T/wNdETcGYhK9Fi/gIgmF4vsCu70fRVnVQGzCNsR1eY=
X-Gm-Gg: ASbGncvmnpshMfXzwf61vcpl+DbohqiYZkWs0TKK2OyICNlHNnEvf96/5z+v2XVDycy
	JQi43i1i+f+XTJbQ5aosB+qT909vYEJWsVt3Qm9vdJrJUHJMj5Q1darChu2Xrl6ICfZyVC+d69+
	ffk/qtxaNXY1Yqnddp+snscsTrUds1yBgW52KEstAD1tcfPDMnLLP7z0Q1hVw0dsMaA4qJF4+8j
	qAcnZ/y3EVj+G04pvMxxzRZfkW0g9tV2TCl/a+i9mLbNxO9hJtcPedAcFogAxU9qaksP4GOhM1o
	jCbKsAGygR/Yz4pV6bQflQtjGBiG8+z4TLFDpQQ/jqU/6vUyRUXe911q
X-Google-Smtp-Source: AGHT+IESpcxI/t5gHS0xU/NroD6WTODIzNlVuTkb58fYBGUQEG0LdYHtrtsB21us5W9WMInSh9G3rQ==
X-Received: by 2002:a17:906:c14a:b0:ad2:3b29:4cd7 with SMTP id a640c23a62f3a-ad23b295c6emr525907466b.45.1746980009324;
        Sun, 11 May 2025 09:13:29 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ad24121e992sm217138166b.14.2025.05.11.09.13.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 May 2025 09:13:28 -0700 (PDT)
Date: Sun, 11 May 2025 18:13:27 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Chanwoo Choi <chanwoo@kernel.org>
Cc: MyungJoo Ham <myungjoo.ham@samsung.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev
Subject: Re: [PATCH] PM / devfreq: sun8i-a33-mbus: Simplify by using more
 devm functions
Message-ID: <zszg23vtaztszlkrgs3acatiu7rmgypsqdzlpojimg22yaeaya@xfv3a7fsd2sa>
References: <20241111112237.336310-2-u.kleine-koenig@baylibre.com>
 <CAGTfZH1qMMO3ou4cxwaUoah7jS18nu7Y9kgYyraZ9e7jfjrp_A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zyq67cjig5hvwfze"
Content-Disposition: inline
In-Reply-To: <CAGTfZH1qMMO3ou4cxwaUoah7jS18nu7Y9kgYyraZ9e7jfjrp_A@mail.gmail.com>


--zyq67cjig5hvwfze
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] PM / devfreq: sun8i-a33-mbus: Simplify by using more
 devm functions
MIME-Version: 1.0

Hello,

On Sun, May 11, 2025 at 09:38:36PM +0900, Chanwoo Choi wrote:
> On Mon, Nov 11, 2024 at 8:25=E2=80=AFPM Uwe Kleine-K=C3=B6nig
> <u.kleine-koenig@baylibre.com> wrote:
> > +       ret =3D devm_clk_rate_exclusive_get(priv->clk_mbus);
> > +       if (ret)
> > +               return dev_err_probe(dev, ret, "failed to lock mbus clo=
ck rate\n");

As the build bot noticed, I missed to add dev as first argument to
devm_clk_rate_exclusive_get(). Can you fix that up, or should I send a
proper patch to make the compiler happy.

Sorry
Uwe

--zyq67cjig5hvwfze
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmggzKQACgkQj4D7WH0S
/k7s5wgArggczCoL6efrWWMp6Ly0RZN7W/gX6tbjYjbxoY+uesH9jQGYcisDYF3y
6NO63q1frIIYM6sAjsLy0WBi31x3OKEo72nv2EXoOr89KEuAY1a3+Bl6BVurOyy4
wyPtLkpscy7zO42tX8jpdLdvhMgbXRIFFIMx+UC+7FPJR4FhhiCYozBLPqTvU6kI
PXc2NXmqi0uPF8X091vDWBgFHVghg1XIujiv8pssses+com+4y/bz1YWl5N87ItE
VoXZJ2TBPV4TJE4roo8I5pjUAEHnEZ1XzoipmpVZN4QT3VRT9xhrp9awUFT2qzi8
UtTmSw4MI8f/hFjGgksaVG0k27ax4w==
=3sfY
-----END PGP SIGNATURE-----

--zyq67cjig5hvwfze--
