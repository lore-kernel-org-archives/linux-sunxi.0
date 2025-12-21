Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED0672FC86C
	for <linux-sunxi@lists.linux.dev>; Sun, 21 Dec 2025 19:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766344343; cv=none; b=P+G4TQGHG1lxCS3rfp2M1UmZq8lEYoi0XX4WSax5troG05+1J0c1b6CYRXCGxfIz68BwPPxXPl9omLnCP5CoAIyb3msuriH4gbbsZ9b0HxawFSMIiDRiKzHmEiLq15QwJxIqf3qfaFOyxLVqq78N8pknXZOQk82K1EXTu6217TU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766344343; c=relaxed/simple;
	bh=61HhO1rGWC0xdRhfIYNnGC1qPmp8H6TKtqhPcyyRmVg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZrsLbCnIYK+z7uJTr2AGHvROQcAn7QQC+OOXIfXdjtCH2baJVM1Hd6Tx8mYbkAouP2RFpK+mfZcjtVrauxboSfeEXuu52GiN1Yd57hJbwv+hwR69p5ACXxhNYJ8vA7E1nCbHDns3UZZZB0Gx1RgjHz1v/UOgLTOGOSdLKuW7r5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i6SOMVpu; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i6SOMVpu"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-47a95efd2ceso28661235e9.2
        for <linux-sunxi@lists.linux.dev>; Sun, 21 Dec 2025 11:12:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766344340; x=1766949140; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vo6ksOhalhjiSBBXqxns23kvqzKoakfn5G4J5zm8oM8=;
        b=i6SOMVpuCGWY2wflL2UCxTc1rXBrJpYK7kzPhKHJzMJpFID5dPbO1mYJrtI6abQilf
         KTLoa7/ch8mOaIPnz2jOQ4H4jsTQLhZpmc98oaHlu2mxuoZRAqLhtn8qutVu980qxMS0
         2Z8h0JOs/dJrEDZRKb1lCAS1eLv5WRBzPQyTxqjJQhSEzziQ4ZRcm9vLY0pq58q1CoKh
         Dun7xUKM7K/00/i/r/rVhm90vXHXUDrRcKmwZyUB0y7JGaABq8RKWQNrSnEhdfDrleZR
         k/tLyS/ZOSBMT36PegO3kri9/RDpjUK+2NY2/v2YBQenVNQb3c+tlWkSop2YCP9+Tk44
         ER0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766344340; x=1766949140;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Vo6ksOhalhjiSBBXqxns23kvqzKoakfn5G4J5zm8oM8=;
        b=O7rdn+Ejyeanz+0lRtEDxUdKPu+EZBefVDeUYhXtm2GkhvFBlnaGgzRrnINdxAUPsr
         9+YyCaevI1TIKyO+KnySD9EfCmLi14CooC5NwTnFv0cGwVbBup9JU9WbnbjUqWnnWLAM
         MwVYHoVmwRIbaJBx+DhO5Waq1WyMd66rZ4YOjZBKcVlM4rH7oi42g0esC/47bX06nfMx
         r2/vvlt72ks5chzSwRYqeX0CV1HD9R/VFGFYmLBH8pT+loiDaewqLz4h97DK4h69vgFc
         KN58X9MfExyL9i1vm2wB9yL5/zkLAQY7r6t2MwnjyJemn/Y8qDBIC/RCZ4z+dTbFvOsY
         yvdQ==
X-Forwarded-Encrypted: i=1; AJvYcCVea3h968mWW1k3zg4+YPZ7wRtTv8pgqm0jWDSls8cllT0dixEgKs4a3GOE7bsRsPZAWzeh3RyNiri8gw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyGQbB/w7YE4ZOSfT5OsSREft2oNv4JN0ALWAZx9IUI3TEpBywK
	B5nrJmV/+2vJShM+BqNSskHxn89UkAsgBBqwQ+YIb+LMr8hSciu7QxZ3
X-Gm-Gg: AY/fxX56FVQ76ss4+0hMmwLUY3ovzgON9MXYJ8EY78MUb+Gx3sE3CsDytFXsM3I9g75
	YHytHKPBCNRmIgjySP2PxL8De02ZoHlJOxt5ytG13RpNSiedJEE85iD1Pvp6M+JBLYTiuFgXkLM
	quOCKqjESJ32diNt8OOS4KgPF9tygZS441ZRGm0Th2m+/xtfR09y4bJ/wA2YdShuMn+PNeb1Xj2
	nTjbJk8INxp0kROJ8oZM42Wfq4OsNWs+X8FMi2HU0FE4/nhK6mpuc3FA2YqlcjiP5BdErNGYkG1
	LqwSSC8ZihOKf71xY6TIILljeO/wXjaeUETPgPdSA7uchaE2Z/Q7QpawBIjrToROCLpeMH3UV+0
	7M0iF0nHeBg7GxY6R6Aldh+EQop3troAepG3g0aMc73fOpMRyXpuUOWpczhno2qd0ya8DOK5aGE
	DrLCX8g5fB/eYGFvjW72YHkX1ZGzVOc5HWgwPrLCC0LNLVd7jMA3a3aETyh9yr/nidyi/bJ9VPq
	DSa5Nhyp+Kjo7NM
X-Google-Smtp-Source: AGHT+IGanVGOppu4xZNimZa5u6ycQ+U+0KT1IHmbaejU3vQuyODZEc9RAHzK2FkTud+87U5PHJUskQ==
X-Received: by 2002:a05:600c:858e:b0:46f:c55a:5a8d with SMTP id 5b1f17b1804b1-47d1c629902mr68687605e9.4.1766344340080;
        Sun, 21 Dec 2025 11:12:20 -0800 (PST)
Received: from jernej-laptop.localnet (82-192-45-213.dynamic.telemach.net. [82.192.45.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be27b749esm205928155e9.14.2025.12.21.11.12.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Dec 2025 11:12:19 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@baylibre.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Richard Genoud <richard.genoud@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Richard Genoud <richard.genoud@bootlin.com>
Subject: Re: [PATCH v2 0/4] Introduce Allwinner H616 PWM controller
Date: Sun, 21 Dec 2025 20:12:18 +0100
Message-ID: <6113404.MhkbZ0Pkbq@jernej-laptop>
In-Reply-To: <20251217082504.80226-1-richard.genoud@bootlin.com>
References: <20251217082504.80226-1-richard.genoud@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne sreda, 17. december 2025 ob 09:25:00 Srednjeevropski standardni =C4=8Da=
s je Richard Genoud napisal(a):
> Allwinner H616 PWM controller is quite different from the A10 one.
>=20
> It can drive 6 PWM channels, and like for the A10, each channel has a
> bypass that permits to output a clock, bypassing the PWM logic, when
> enabled.
>=20
> But, the channels are paired 2 by 2, sharing a first set of
> MUX/prescaler/gate.
> Then, for each channel, there's another prescaler (that will be bypassed
> if the bypass is enabled for this channel).
>=20
> It looks like that:
>             _____      ______      ________
> OSC24M --->|     |    |      |    |        |
> APB1 ----->| Mux |--->| Gate |--->| /div_m |-----> PWM_clock_src_xy
>            |_____|    |______|    |________|
>                           ________
>                          |        |
>                       +->| /div_k |---> PWM_clock_x
>                       |  |________|
>                       |    ______
>                       |   |      |
>                       +-->| Gate |----> PWM_bypass_clock_x
>                       |   |______|
> PWM_clock_src_xy -----+   ________
>                       |  |        |
>                       +->| /div_k |---> PWM_clock_y
>                       |  |________|
>                       |    ______
>                       |   |      |
>                       +-->| Gate |----> PWM_bypass_clock_y
>                           |______|
>=20
> Where xy can be 0/1, 2/3, 4/5
>=20
> PWM_clock_x/y serve for the PWM purpose.
> PWM_bypass_clock_x/y serve for the clock-provider purpose.
> The common clock framework has been used to manage those clocks.
>=20
> This PWM driver serves as a clock-provider for PWM_bypass_clocks.
> This is needed for example by the embedded AC300 PHY which clock comes
> from PMW5 pin (PB12).

No. Drop all clocks related code and make this pure PWM driver, like pwm-su=
n4i
is. For AC300, AC200 or whatever other device may need clock produced by PW=
M,
pwm-clock can be used like this:

ac300_pwm_clk: ac300-clk {
	compatible =3D "pwm-clock";
	#clock-cells =3D <0>;
	clock-frequency =3D <24000000>;
	pinctrl-names =3D "default";
	pinctrl-0 =3D <&pwm1_pin>;
	pwms =3D <&pwm 1 42 0>;
};

ac300 {
	...
	clocks =3D <&ac300_pwm_clk>;
	...
};

Best regards,
Jernej

>=20
> This series is based onto v6.19-rc1
>=20
> Changes since v1:
> - rebase onto v6.19-rc1
> - add missing headers
> - remove MODULE_ALIAS (suggested by Krzysztof)
> - use sun4i-pwm binding instead of creating a new one (suggested by Krzys=
ztof)
> - retrieve the parent clocks from the devicetree
> - switch num_parents to unsigned int
>=20
> Richard Genoud (4):
>   dt-bindings: pwm: allwinner: add h616 pwm compatible
>   pwm: sun50i: Add H616 PWM support
>   arm64: dts: allwinner: h616: add PWM controller
>   MAINTAINERS: Add entry on Allwinner H616 PWM driver
>=20
>  .../bindings/pwm/allwinner,sun4i-a10-pwm.yaml |  19 +-
>  MAINTAINERS                                   |   5 +
>  .../arm64/boot/dts/allwinner/sun50i-h616.dtsi |  47 +
>  drivers/pwm/Kconfig                           |  12 +
>  drivers/pwm/Makefile                          |   1 +
>  drivers/pwm/pwm-sun50i-h616.c                 | 892 ++++++++++++++++++
>  6 files changed, 975 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/pwm/pwm-sun50i-h616.c
>=20
>=20
> base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
>=20




