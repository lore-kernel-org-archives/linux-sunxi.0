Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D47462D46B4
	for <linux-sunxi@lists.linux.dev>; Sun, 21 Dec 2025 18:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766343175; cv=none; b=oDjCjxV3B/R55GIyccdn/uQa8adOhUfSp9uICEDdCUCzGgY25967CR3JypVx2dUmRfYfh+HwRRbSu7MUcilSZyEEOcGdB7yu4TvT2j4K7i6Cu194J7ZkQdFLAV1IlN6dZZYw1qNt2pBD+a77mzRznhlN68iyOHRBRdH76tISgFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766343175; c=relaxed/simple;
	bh=wTYyJ6KNs7lcO1LDw5mry706MHNd9SS12sadjX2FW+o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UPa6/4RwUr+VPXk41b0o86Q8/Z2rjtFlZ3OretNd0Atk+An4mmz9t0EC4YHo+ZwD7Ah8KmDqMt9cdpBb5kxJgkHuHe0JgMgjuhSjinhaJLtLZP2mzWd351GM7sjotTxxgx656/Pn61fxyys3M1gXhLBIKzl8AqKxGJq7BODVbtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MRYk5uub; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MRYk5uub"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-42fb6ce71c7so2598205f8f.1
        for <linux-sunxi@lists.linux.dev>; Sun, 21 Dec 2025 10:52:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766343172; x=1766947972; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EkFUuskD3aXQcMoKgf00kBQMcF6mPoLg5bi7MGfjH3A=;
        b=MRYk5uubKvruy3sQpgeVXnhsENuwbQjdGXcc8Zey4jc4O7jInOzbCQaXtLjyRZmTgV
         TQAc6G/MAcqmH0t7iKH0klc7frtKTQkcF41noQHOUFBDWdzOsclvdYZ8oP87Pgkvslqt
         HIL71+3p5e9u2E6HhMsUt6zhrnSGHSBH/x5dQle2zkTwuOBjA5gCl3oS3pU8fkm1u8R1
         4lgpbdHtyqUi0sg1XvFu0gH6qttQ7i6acmMLCFd2xTtsXW6Jz6LsK5GGAGxlzxQq/hTI
         FcOM63cL/gkUwuZ6pkCw8YvCh1MN4pxgiRxHk2C0ihdXBdrvsHoTT5tdsjKlFX+L2dIC
         ZMDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766343172; x=1766947972;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EkFUuskD3aXQcMoKgf00kBQMcF6mPoLg5bi7MGfjH3A=;
        b=HRTikJ9D5TynP1VQu2LV9qzqi6yUhKv7c2Q2vj3pD9AwIZj+UeKlFX6mS4fyjVkdnq
         kSTkb68c00/hLinxbRNkBH6S8JaQN/Te2NC37amYJ0e3YWPZYhj+xHFQB7kvWEbOuGyh
         DSdAvIyOx+HO8GAjEZ8cVI+MRx574wI8JYlzY1VvY3vEficddWnTt9pgfNhu+gHdF4JN
         C9lejP4PXsoWGosEC5rm2KtA1sJ+Etn1aBnypTAp39sXZ8fVL+Qz6vIufp+z/M9Mmyvn
         znPWIWx884A67tHkDkbXCXu81DD7qdURR6Mt8+7V2cP7axxfRFgk8eidjgKWe5ELHM0D
         SNHg==
X-Forwarded-Encrypted: i=1; AJvYcCW/w8MCei7sSN53ssWI/VLGO3J+Rp8wmufeOwkXahM91qaQHbTN7z+NkqUtTjzDcEdbqCQe5Pljlcg8Fw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw+x3BW64uaYRpb4uofa55NWstozClKv1w7lTeA/Ca0Uz4wc9td
	b22340fru6bUEY5YVP/yl8Dkinat9Oloif0I2O7gOebJ0IVhYCDb8POG
X-Gm-Gg: AY/fxX7ZxjFdMr1MqjR79ZoXCBtgThfj5EBvPP6cXQZlQGrW7DG8K0F+YBFE77vWHKh
	9ME5sXeE9/HWB69Jeda2oQwq1OapVotSizm6wF9E0G1LraCbjbCUFgaeJyxorFb6sAuMJYZCHd6
	dQWB8iYvCeDt4u9I3DQ8vHORMaWJe7un78r7HKEiefEjIv9JCQ6dT+wrdHGI1t9wDPPFXtWJl7L
	pC23n9WkoM4gFoWzkmPYT6ZlhvGI9PSUJ4EMFJA4PogmidqDL3ufCMQ8480vwJs7FSzwnBo/Q5l
	HzfXw2qxRw+xOGrH/+KcAe+DxJOtsW1ZZaNUuCNd5BO0xH5ZgtdKnohJRuIY07ngPl4Rd+NcmQK
	W1O8ppQ9bFQKg/WeRZ/8EYrLpBJjoQR0u0mrY8fjB7+sclYtRpr8MnDLlLIieiWuXPdRgfLylKl
	B+47J8ujtgEAegLi5Qh/OjfeGoBIkVaO1UUK2JXZvwsrsgTuItN61By/OONoi1CYZdI/eE
X-Google-Smtp-Source: AGHT+IEkkDr9J9+zdibSJ3aQ9iWL0xgIJ5GrJUheHH61EjSouzXE+O5/goeHQ+aazrE5IYrzxVO9HA==
X-Received: by 2002:a05:6000:4008:b0:430:f241:a11f with SMTP id ffacd0b85a97d-4324e4fa8a7mr8787306f8f.30.1766343171984;
        Sun, 21 Dec 2025 10:52:51 -0800 (PST)
Received: from jernej-laptop.localnet (82-192-45-213.dynamic.telemach.net. [82.192.45.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4325d10cc48sm7775667f8f.16.2025.12.21.10.52.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Dec 2025 10:52:51 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@baylibre.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Richard Genoud <richard.genoud@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Richard Genoud <richard.genoud@bootlin.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
Subject:
 Re: [PATCH v2 1/4] dt-bindings: pwm: allwinner: add h616 pwm compatible
Date: Sun, 21 Dec 2025 19:52:50 +0100
Message-ID: <10771871.nUPlyArG6x@jernej-laptop>
In-Reply-To: <20251217082504.80226-2-richard.genoud@bootlin.com>
References:
 <20251217082504.80226-1-richard.genoud@bootlin.com>
 <20251217082504.80226-2-richard.genoud@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne sreda, 17. december 2025 ob 09:25:01 Srednjeevropski standardni =C4=8Da=
s je Richard Genoud napisal(a):
> Allwinner H616 PWM block is quite different from the A10 or H6, but at
> the end, it uses the same clocks as the H6; so the sun4i pwm binding can
> be used.
> It has 6 channels than can generate PWM waveforms or clocks if bypass is
> enabled.
>=20
> Suggested-by: Krzysztof Kozlowski <krzk@kernel.org>
> Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
> ---
>  .../bindings/pwm/allwinner,sun4i-a10-pwm.yaml | 19 ++++++++++++++++++-
>  1 file changed, 18 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/pwm/allwinner,sun4i-a10-pw=
m.yaml b/Documentation/devicetree/bindings/pwm/allwinner,sun4i-a10-pwm.yaml
> index 1197858e431f..4f58110ec98f 100644
> --- a/Documentation/devicetree/bindings/pwm/allwinner,sun4i-a10-pwm.yaml
> +++ b/Documentation/devicetree/bindings/pwm/allwinner,sun4i-a10-pwm.yaml
> @@ -14,6 +14,9 @@ properties:
>    "#pwm-cells":
>      const: 3
> =20
> +  "#clock-cells":
> +    const: 1

Why #clock-cells? I don't see any reason to add it.

Other properties seem fine.

Best regards,
Jernej

> +
>    compatible:
>      oneOf:
>        - const: allwinner,sun4i-a10-pwm
> @@ -36,6 +39,7 @@ properties:
>            - const: allwinner,sun50i-h5-pwm
>            - const: allwinner,sun5i-a13-pwm
>        - const: allwinner,sun50i-h6-pwm
> +      - const: allwinner,sun50i-h616-pwm
> =20
>    reg:
>      maxItems: 1
> @@ -62,7 +66,9 @@ allOf:
>        properties:
>          compatible:
>            contains:
> -            const: allwinner,sun50i-h6-pwm
> +            enum:
> +              - allwinner,sun50i-h6-pwm
> +              - allwinner,sun50i-h616-pwm
> =20
>      then:
>        properties:
> @@ -83,6 +89,17 @@ allOf:
>          clocks:
>            maxItems: 1
> =20
> +  - if:
> +      not:
> +        properties:
> +          compatible:
> +            contains:
> +              const: allwinner,sun50i-h616-pwm
> +
> +    then:
> +      properties:
> +        "#clock-cells": false
> +
>  required:
>    - compatible
>    - reg
>=20




