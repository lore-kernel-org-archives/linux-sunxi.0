Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AB5B13B2A9
	for <linux-sunxi@lists.linux.dev>; Sat, 18 Jan 2025 11:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737200832; cv=none; b=V01kDfjqok7zry+lvOf7sqeuynDoeejRyvp/zCPylL5pTlr3F2077KiPGTjQ0SQZ9HRDoNUcFEqQJf/84xFjYGsoSQhnyCKo8ittRNAZ++BbkZTIWwUlwHYDqqf4fMzj4WboXGTS423t1C2CvPChT+ir1iDmTC1rpM+iPH4YEdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737200832; c=relaxed/simple;
	bh=tQS9mwd/H1zn81rX8U4yBTj/dA+Zv8W0IY5ZRLr3fps=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SOAa6u2vg3x6a2hwNdjwFI7SKVmJnnACBQXxSV6293hRKDFhqLAIW5U3QYTsy/GcNZ35aPkJ+PORjnpZK28R32D8fmuNachdkenREpdFBSm73fr6wpBhnEhsQ/2+FlSG1CS7Qmwk3gMoAuE3wO4x+7GuhkTsTQDTzHGpMQtpm9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GIFvHvtf; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GIFvHvtf"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5d3bbb0f09dso5027231a12.2
        for <linux-sunxi@lists.linux.dev>; Sat, 18 Jan 2025 03:47:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737200828; x=1737805628; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dEETbdnKlsxmZe5oB6rAoR/Y3VNUS2QT7unKpMA9HfA=;
        b=GIFvHvtfWt9GMubCgqlMeJUeDBR4DcNm9pD6l+heuTsu5Zups8SvNHblhocLUw3bNd
         1Uf9fwy1XI6veNGg132BSyY+WS/J2uAbwMiw2phYtU+GgaA0Mx3C4ZPS+B31S/F32glc
         a23RHBqQk7mWNnFGZhT8kPsjnTCSdiYGeXHaYMbzxIZDaua8iOAvG+KPIaE55RzD9uJT
         3ORklqSa0u2l0ojaQURvzy2lhYWEbfFPji0n4WY+OURTlE3KrHVD/Ij0yBLNNkgHx15r
         6TChlh57fx7ni3UZugRZLbrxlIPyoMrJ0sZiLolTYztV095pnkTUG2BJoInMVbwNI0bz
         Im7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737200828; x=1737805628;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dEETbdnKlsxmZe5oB6rAoR/Y3VNUS2QT7unKpMA9HfA=;
        b=AqOo7eVRYKzA9nxAHNIgQGifaOTgYArjlLpm2eA4+90QMQy9LueKDmaosx4D8cHdDO
         jb+tpBeGGkm+itwvxMz6HH/YAysLIaJlcyygIVqd6MTCxlmucGZVR9PoFepfOUB3VuSD
         xaAXgH9+TvLbqzK7lhqU5pYXbi0p+z0Xbzvdkuo93ePNd8q/6wpPfcu6fEJZgmxHqrDo
         qXhNRom7wpXDyBkJ4POOWeMtSOHsGZnYpL4PNx4gJxkYt38Z12GSWwsUcZ60+1/+uMpi
         W5tPozp6BV7zrKdc6wgoMgMEBfGqHaQFNj0ZzqYRsJuvbS2uZB4RsntBSBhQtdjxawHD
         YNZA==
X-Forwarded-Encrypted: i=1; AJvYcCU05A+Dy0Ybp6nNbMoIJ5REjqtlF3G4qWEOCIyNi7yV5+3MPhdZ+AtqB5mgKb/9E5jgQkH3ldfgrlVKAQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzKK0vZ3lIYbToNZjuLMzG9Oksmfs+Ale2xhwafQKRiKbGl6mmp
	EQCCGgZ2Y/s+SjyprE8AQ2b7G/YLe507FBSqcHlTWS00sUr+B44X
X-Gm-Gg: ASbGncu1LZZi8StByTEk3hFgnjbItQ1mUzgM7bf5MWXnhef3XBY/ztv7TicGGS+wZEi
	UOFxMOKTL/1BUQor4sprEV2cn7jc9cHq2jGvyeHgX+rgnS5pfI8axcrsxDwDXLoLTmvCSvwmvkt
	4x9s67q3igYs17z3b0q2OyQ5NnlwZLnb/Pkpw9lZmQWIMNLYv1L4H1BLEFXPZGEfteR4zh0tmFM
	sBDOJDUvU0heLzZfRYR4gZa1cVQCoCysmrXsz8hzBU3vQNCQNoxYzw6cuxvebsSlBje2+PXbA5y
	QXgR/oZ31pEjjJg=
X-Google-Smtp-Source: AGHT+IE/jKdo/VLXGSTwqZLRban4tKHtpH41BP/bx4E15bq4lS0FrHpTEehBdX2Yz4BsnqkbLRGFRA==
X-Received: by 2002:a17:907:7faa:b0:ab3:30c5:f6d3 with SMTP id a640c23a62f3a-ab38b0b7f5amr554823466b.9.1737200827845;
        Sat, 18 Jan 2025 03:47:07 -0800 (PST)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab384ce17f7sm323829966b.40.2025.01.18.03.47.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jan 2025 03:47:07 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>, Andre Przywara <andre.przywara@arm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-watchdog@vger.kernel.org
Subject:
 Re: [PATCH 03/14] dt-bindings: watchdog: sunxi: add Allwinner A523 compatible
 string
Date: Sat, 18 Jan 2025 12:47:06 +0100
Message-ID: <5534097.Sb9uPGUboI@jernej-laptop>
In-Reply-To: <20241111013033.22793-4-andre.przywara@arm.com>
References:
 <20241111013033.22793-1-andre.przywara@arm.com>
 <20241111013033.22793-4-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne ponedeljek, 11. november 2024 ob 02:30:22 Srednjeevropski standardni =
=C4=8Das je Andre Przywara napisal(a):
> The Allwinner A523 SoC features a watchdog similar to the one used in
> previous SoCs, but moves some registers around (by just one word), making
> it incompatible to existing IPs.
>=20
> Add the new name to the list of compatible string, and also to the list
> of IP requiring two clock inputs.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>


Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  .../devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml   | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a=
10-wdt.yaml b/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a1=
0-wdt.yaml
> index 64c8f73938099..b35ac03d51727 100644
> --- a/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.=
yaml
> +++ b/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.=
yaml
> @@ -32,6 +32,7 @@ properties:
>        - items:
>            - const: allwinner,sun20i-d1-wdt-reset
>            - const: allwinner,sun20i-d1-wdt
> +      - const: allwinner,sun55i-a523-wdt
> =20
>    reg:
>      maxItems: 1
> @@ -60,6 +61,7 @@ if:
>            - allwinner,sun20i-d1-wdt-reset
>            - allwinner,sun50i-r329-wdt
>            - allwinner,sun50i-r329-wdt-reset
> +          - allwinner,sun55i-a523-wdt
> =20
>  then:
>    properties:
>=20




