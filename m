Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 115A11FF7BB
	for <linux-sunxi@lists.linux.dev>; Thu, 20 Feb 2025 18:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740075171; cv=none; b=QKfiEJT7kR1pr8A0RJNLggk7LriRJboRJFJ89eM18ggf4Qe6Px1jvKePBE765Hcka8wKNLKl1OeXuDz7cVK8GUg0NRzcDyJYkUZQrClPIdomzU2tyZ36gRaqywvcHPRTfX036Q+7G0Uuwp6V+A727gdb5BTHYQkiK2ZOnyhIWj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740075171; c=relaxed/simple;
	bh=RVJ0Ui+e4wiQwjjazPtlbUqFxh8TiHfnG0fw+upHVBE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=H71L3Gp/JsU5ejVW0S7YGMk+mbcGHlZ8BONaBa0mHLIa7pThVNz23eXcN5veWwnSiNYuUXnI9Bk0yECD/3go9FTOyCL7HEcuRgmIiUphfmfiHc/qejJp5329we7Xtq/g93Ryq60kI0SsrVU8uSGNBWgCcUUU74m+CE87mSRUn1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EiV3eDqi; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EiV3eDqi"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4394345e4d5so8758705e9.0
        for <linux-sunxi@lists.linux.dev>; Thu, 20 Feb 2025 10:12:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740075166; x=1740679966; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hf9BmegiktNtcY6HS4qZYakNRxia/v7+na1LdoL1VGI=;
        b=EiV3eDqi3O5CxSCBNOurbsvrqpxdLu2jdN41wMr04bCsB4coNTkZ2c1peSa756WXjK
         g/xGbgeOsTSl9h6AriYfcKYU1H/gQy1KVDJwz8Iw9WBWhuqybMLUW+/C7gtbcfaUHJ90
         vJyKTkmY8IiTQ1aDw8VHj3dWv68t9TkK7gAGBECWs7+vfdSHu7N1bOjnFAGiuoXSNxpN
         fMiFLZVVzj/l8+hwUbISCjG+w1beuQAPBQaEASuNBqLxEurB6ZOsob3FeiiwdjWle+t/
         CuxftegFW7eDfAgTECqP7IEBYIuYhfWJg2sWAsjAaH4zhkkLxtQx0dXNFN7YyKqKUpQo
         w6kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740075166; x=1740679966;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hf9BmegiktNtcY6HS4qZYakNRxia/v7+na1LdoL1VGI=;
        b=hqhpbMrgHwSgXNM+ub99ci1qLI/wIe09PCvg3M5LA/BcKiKqCvwV9VMinWUcI4yiVN
         mfpw4epCIoISYtEDCilQe+ze5KJsaduksWsSD9yKlC4emAfFCnIqrLmQZluhdcmRToCF
         h37AvD+nm8iypTjZbNndM8cRioAOl3qWMmeBCsy893/9T03Vmen1n1QlN+jeW4o7BKEh
         adSNrQAa/lgBhf2zrAjQZoErTct2YV/H/g2k75uFzfdvSuhQw/xncZUqDJjb9W/sO29N
         HgdVvprqElmHssXoLHZvLc00cqRGXzoYJr+HtWMrfvJCIWyn2Yh2vhLHfHCG/idwhjMz
         6ECw==
X-Forwarded-Encrypted: i=1; AJvYcCXBcyO14G3pdHj22MGqbmtqUTSzdDxIycrDiXLlVQIgMeh3G+Rh2kLhJdaatAtHaAggxxU4mZC27P/cYQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzNEx6iuBGD4VipoF1qrMne14eCvfiMgutLeBD+KyZcETGqFMTZ
	kpKVYRaH60FWTj3Y5UDkJ0Rb3jMPjORVEsc172GQubkU+8A2oThT
X-Gm-Gg: ASbGncvBwfMIQakvjtD7hCEkXupukvxUQUW3izQQVjE2LyS8blpa696u+iB0WkXDN03
	GSHleB5+IQp/FxjluzDhQ96lrpmn/q2BzL+XvbQD+WErUD3f99UQIfvJxdG6dHiNDjEGmxG3AOq
	+S44a2qMVr1+hAZij4ymUZ2CYh5nj/I1RBBrBkwMIWWMYlW+p64/vW1uO3X9CcotqLt+2BrHXP8
	SV1blzIWYobrxv7kt23zZgRaUKQ/ZeoANjxJSI/LquopISbhH6lC7ugwgAY30rWUj42BcadhIxE
	hg4QADRnzCxaWQot2ymKCsRHZZCu5OsnZIPhwjheK/gD3rvjqzZY2fBk0VV4MM1QviI=
X-Google-Smtp-Source: AGHT+IG8SxlEpGzhrbOAaMiZSLB6w/8BQXRpKpsCxpcNHWG6kyfbSzJtzHPfDd1frA7kH4B1Z2SqFw==
X-Received: by 2002:a5d:6dd1:0:b0:38f:4f25:14a3 with SMTP id ffacd0b85a97d-38f6e979d1amr195111f8f.30.1740075166029;
        Thu, 20 Feb 2025 10:12:46 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258f5efdsm21016778f8f.43.2025.02.20.10.12.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 10:12:45 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Emilio =?UTF-8?B?TMOzcGV6?= <emilio@elopez.com.ar>,
 David Laight <david.laight.linux@gmail.com>,
 Anastasia Belova <abelova@astralinux.ru>
Cc: Anastasia Belova <abelova@astralinux.ru>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Maxime Ripard <mripard@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 lvc-project@linuxtesting.org
Subject: Re: [PATCH] clk: sunxi: clean up rate counting
Date: Thu, 20 Feb 2025 19:12:43 +0100
Message-ID: <2385242.n0HT0TaD9V@jernej-laptop>
In-Reply-To: <20250203112930.650813-1-abelova@astralinux.ru>
References: <20250203112930.650813-1-abelova@astralinux.ru>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne ponedeljek, 3. februar 2025 ob 12:29:28 Srednjeevropski standardni =C4=
=8Das je Anastasia Belova napisal(a):
> If n =3D 255, the result of multiplication of n and 24000000
> may not fit int type. Swap division and shift with multiplication.
>=20
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
>=20
> Fixes: 6424e0aeebc4 ("clk: sunxi: rewrite sun9i_a80_get_pll4_factors()")
> Signed-off-by: Anastasia Belova <abelova@astralinux.ru>

While this should work, should we try to remove (old) sunxi clock drivers
instead? Drivers we converted 8 years ago, except A20 GMAC and A80 PRCM clo=
cks.
Even if we convert them now, we need some transition time for them.

Best regards,
Jernej

> ---
>  drivers/clk/sunxi/clk-sun9i-core.c | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/clk/sunxi/clk-sun9i-core.c b/drivers/clk/sunxi/clk-s=
un9i-core.c
> index d93c7a53c6c0..639c83ed63b8 100644
> --- a/drivers/clk/sunxi/clk-sun9i-core.c
> +++ b/drivers/clk/sunxi/clk-sun9i-core.c
> @@ -25,12 +25,12 @@
> =20
>  static void sun9i_a80_get_pll4_factors(struct factors_request *req)
>  {
> -	int n;
> -	int m =3D 1;
> -	int p =3D 1;
> +	unsigned int n;
> +	unsigned int m =3D 1;
> +	unsigned int p =3D 1;
> =20
>  	/* Normalize value to a 6 MHz multiple (24 MHz / 4) */
> -	n =3D DIV_ROUND_UP(req->rate, 6000000);
> +	n =3D DIV_ROUND_UP(req->rate, 6000000ul);
> =20
>  	/* If n is too large switch to steps of 12 MHz */
>  	if (n > 255) {
> @@ -50,7 +50,11 @@ static void sun9i_a80_get_pll4_factors(struct factors_=
request *req)
>  	else if (n < 12)
>  		n =3D 12;
> =20
> -	req->rate =3D ((24000000 * n) >> p) / (m + 1);
> +	/* Division and shift should be done before multiplication to
> +	 * avoid overflow. The result will be correct because '>> p' and
> +	 * '/ (m + 1)' are both just conditional 'divide by 2'
> +	 */
> +	req->rate =3D ((24000000ul >> p) / (m + 1)) * n;
>  	req->n =3D n;
>  	req->m =3D m;
>  	req->p =3D p;
>=20




