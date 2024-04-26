Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6B9F13F434
	for <linux-sunxi@lists.linux.dev>; Fri, 26 Apr 2024 15:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714146928; cv=none; b=sk1Lyc4/ehjSapqAGu788/LjNIfzhlGArYFuthsVL3w4EgkrQCeuhhJpP5c37VWprOD9LesSUvpSMd4JchUnVFqvgqzieN1KXpv8EzHkVsnDxgOXZfrG6mZOcd/S5s7mZIUV2+ZCNvVJ5qab7b+UMu5aBqFeqa1PwzvEzIoAAh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714146928; c=relaxed/simple;
	bh=R552gqWNJHZn9L65Cyy8omEewrrApbUPGnkr7rZCQRg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aJKmtAIPxRREqb4mgQmpsdkHfkJkNiojpNYwhxXsfGenBUvGUiGsEQlUD8f/xJx4Y1NJB4jYGJgtpKDV2mEcOQRovmTLWuN6UAACorLfIky08N6z95zpwlSVT6VO5tjIB4PTe4nqGr9RsylfU93hUkON8hNmiU2NB9pR1jZIKEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T8MGNhCG; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T8MGNhCG"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5724f26b8c9so2251813a12.1
        for <linux-sunxi@lists.linux.dev>; Fri, 26 Apr 2024 08:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714146924; x=1714751724; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WuLZ5h4UDTyIGwOk9Qx6MEQfh9GVeoIO6Zvp7oy1X30=;
        b=T8MGNhCGJhOWHwB1CazM5tVKyyk82mBt/Yv5GS9EmnblYxqlXkwkDnN0CO1pLLQ/G8
         G1ltNb7DR5kwhVz1An6Hkmn+T6cKQNA3rowtYyonMLjHnains0RIdfCX/W2uj01NV/2J
         0t6AKo4cSzW6OlQRyr0af9zOavJ/gsBIJdT4g+KhSQtYoS/gvTGI+bhsk+q3nGJikZS9
         tQq//f/EsUvNEsgelKJFYsTdxbrNmq4T4VfV3fBZ5bj0xhHxaJPJLJ0UktQgMOrQdqR1
         YQz3gzvwyZC/ijj6eKMdySoshQDsL9NfMTo9w0l9uGwxHIxg+N3MG32p81sw6g/53LMx
         MboA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714146924; x=1714751724;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WuLZ5h4UDTyIGwOk9Qx6MEQfh9GVeoIO6Zvp7oy1X30=;
        b=iHN2WKvld2gICajDbVlQP3c1fmu5C+qc/a2itxdXVtloUfAulYJ5FTgm67u9hQ4CSN
         BB/DEkWFF/HjB8uE10n0BHoDzjZEqZuZQQplfndKlHt+uWNLT83YQOhT5+qr2zlKtdPm
         22JTaw+1ucJe8+VUSHmT4m84dvs3N452JPbqtyZn2nfYS6an9p4/wqICS1q8CIGQkpCE
         qXSZ/1a7ucyfLR1YOFjIbafz9kVJv7VkTz8yMSs/NfhhnCqOGZHKBT5ho04b1uq01EpX
         BJVrumBqJNZSP0NK22NbuJ6G4qQ0tQh0gz1nIr3x9uWX2+BDonqVmIuPaY88RE4vwmUV
         PKRg==
X-Forwarded-Encrypted: i=1; AJvYcCWf/jbfMkxNGUn8oIAuMi9aoh1Q9qAFqoBnR1LEZS8K9t1PzHAsX0vpLi1gV8sf/5kieLusypDgUHP7xt03luTDUR2O+hgm4xcuu+U=
X-Gm-Message-State: AOJu0YzXm2/Rz6J9cxasd1UpcwKyDqwK8U2FTRfIsOHIIHeP45SgHQOm
	qzGldKqCwsFdLEeDaf8xIvte2FWDd00+KETGqufCg5doA808lCCL
X-Google-Smtp-Source: AGHT+IFj8fUr2cSimby0ODgwi6aNH+15SSzp6GftKON0Zrzpl9KfbD23xqMHzKHbC/gJf0xZhOMNrQ==
X-Received: by 2002:a17:906:7181:b0:a58:a4d2:372d with SMTP id h1-20020a170906718100b00a58a4d2372dmr2463265ejk.10.1714146923980;
        Fri, 26 Apr 2024 08:55:23 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id c19-20020a170906155300b00a526a99ccecsm10655843ejd.42.2024.04.26.08.55.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Apr 2024 08:55:23 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Samuel Holland <samuel@sholland.org>, linux-leds@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
 Lee Jones <lee@kernel.org>, Chen-Yu Tsai <wens@csie.org>
Subject:
 Re: [PATCH v1 1/1] leds: sun50i-a100: Use match_string() helper to simplify
 the code
Date: Fri, 26 Apr 2024 17:55:22 +0200
Message-ID: <8403927.NyiUUSuA9g@jernej-laptop>
In-Reply-To: <ZivMCljzog7z_SgZ@smile.fi.intel.com>
References:
 <20240426152515.872917-1-andriy.shevchenko@linux.intel.com>
 <3557566.iIbC2pHGDl@jernej-laptop> <ZivMCljzog7z_SgZ@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne petek, 26. april 2024 ob 17:45:14 GMT +2 je Andy Shevchenko napisal(a):
> On Fri, Apr 26, 2024 at 05:37:42PM +0200, Jernej =C5=A0krabec wrote:
> > Dne petek, 26. april 2024 ob 17:25:15 GMT +2 je Andy Shevchenko napisal=
(a):
>=20
> ...
>=20
> > > +		return dev_err_probe(dev, i, "Bad pixel format '%s'\n", format);
> >=20
> > I know that old code used dev_err_probe() without reason, but could you=
 change
> > it to ordinary dev_err()?
>=20
> First of all, it's out of scope of _this_ patch.
>=20
> > dev_err_probe() is useful only when return code could be -EPROBE_DEFER.
>=20
> This is simply not true. We are trying to have a uniform output in ->prob=
e()
> and even documentation for dev_err_probe() was changed long time ago to
> encourage using it for non deferred probe cases.
>=20
> > This is clearly not the case here.
>=20
> Is it a problem?

Sorry, I missed added note for non -EPROBE_DEFER cases.

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


