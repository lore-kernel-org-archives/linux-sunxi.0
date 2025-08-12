Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B06332ECE9F
	for <linux-sunxi@lists.linux.dev>; Tue, 12 Aug 2025 18:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755022193; cv=none; b=X3BjXA4xu4GxWXOew1PQn1CThbnM25D8LvQnD5P5IUQ7DrurE71gEGM8HrCTf0n+g1zEDCI8OAIxrB8IHZXkbK1IBab6BopE5a10Lq/WVXSjczSjuiEepcxqhBibEg1bpBhdotuPS2Rgp0FrkwYEH/LfMaK0oxwDYkNElKx5PaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755022193; c=relaxed/simple;
	bh=8SVlR0ZGn4tYykI2NDJKhd3NEzE3rYSmxO7D47ZcTGk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HAhHEtqkjT4ozKEsvvlKMvpYVIGvxsabi6KdgE/7vlIja3zGHWzwu18pS0UYDHqSB7QVpAHCuYgVQ71pdjgSf8vCBE+JfCPy1vr/Jcc4dBezgB2H/UCueHLNrg++4/UHQiXjP50gXtrvu1QxLpl5spyWACdl1V8uC5R4Its4KtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E9po+0bB; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E9po+0bB"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-458aee6e86aso38624465e9.3
        for <linux-sunxi@lists.linux.dev>; Tue, 12 Aug 2025 11:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755022190; x=1755626990; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=np+mETWK/wBLF8wyDZBrdyhOUjfjYt6Q61iq3OWGzGI=;
        b=E9po+0bBtGuiMOjiGESdz47RSAJwoBF8Wv1SeHSUpub74AcWE2oNwc8c9o1uwaTDlv
         Klqw5lmCzPo00xc0fL9MR+bN+GY5DIeDxIWRWmjSXl5gQZa63ZcCu0kGJGIvfMHCyo40
         q60SAHswROjg3d/UPYJmh5Z7KUjEFk/03jZ5BovQn4h1j+UU/vPwB4P/ru0Fq6rxHN6B
         empG/fcp1p3dJ61Z8zecOtobs+frFDVhFUdbm7HFqwunavvE4t/FPQDzX5BS721eZbOJ
         FxxjEd8ta6qqHLvdoFtjnIMdIQU2t5SeaMPmfAHMy6fnxjnTpQPC+y3zMHjHFL2eBSsY
         p7HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755022190; x=1755626990;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=np+mETWK/wBLF8wyDZBrdyhOUjfjYt6Q61iq3OWGzGI=;
        b=qRdRkon+sLQxH19uP39HbsjdQUVJ7+dFBZUnTFFB1I3PwIqYJ1twTE0vDXEfldptJt
         EIwY46zsGrKrEUBjRsaO0BQNYkNlcqn4FDvRl/917II0qyzp04rueyTgseL8R35IkLEJ
         ABEa5xoEjmRcqnkFmufUNmJYHl4lSzPiMcpxfgwmxxaDEM4vKX4gcA6a1d8gGC5jlEWH
         PlOvldERfs5c+IHytJXomlKHPXPOO5wfXqUGsBuxLQAhzJPjzEXc74xzEgiZ+Z3zTFhe
         usrnviMqACyYN/f3pFsaqo6CbYb1AVjdT5XRKJADRNaX4+QdDZ1A/p9ewFzm2D1G9FZr
         4ZbA==
X-Gm-Message-State: AOJu0Yyp27wz4qxYUQeJyVgA2rayHXZ8gbUAZigOuRNdRby8AzYilAQw
	SmU1zujTkRZR+R++/KtKI4RBdVgogUeE+FRbOuJ2r6DqLjzQIPxS1TY5
X-Gm-Gg: ASbGnctBRAraizNldjr08INCzVpEZv5+hn38YX3maVznKwcbaQVEk0gZMSA1Xt+8ql4
	cfy12nASPofRbyvHpRn0nzhi1TMkMBd8JiDHT0ZWd/wq7IbZGUctKsVsIDSIAVkv870L2CvjKeF
	1JTBEOZ3GQ6GeuR4HnsyD1Kh9nPp/WEWpnR/u/B99iAaD0/1h94pOXrzQDdzCAwvEbe69Qh3tDG
	twE2C6aYZFCo3ZzxrBRcIq8ZUgh9SJ0UAa1uOO3aLymFwepv70zo+eHuje4rZ9pyotFbevNJjJ6
	nNtzRflHHnnHSpqlZ7rxqsjipTxeXSZqp15AlY6q+X1BxjvXKtwN+vFt25KnEBP5K/oxdOUtlmd
	Xs8j8Fh/tcIYpU5qZma8JT8XFBjNN6amjHyvvfqWCdhbF8cQhuGF2k2eEyRkm9cCt+wtF9B2O3C
	5AS29fk3XMoQth+DXy6g==
X-Google-Smtp-Source: AGHT+IHWtgRWErWP2CSUOwz7QQsptjEQby/FRSJDH+fOmtg9bVEzwZN4gkoyiwE022Ft/1p1KtLEdw==
X-Received: by 2002:a05:600c:4fca:b0:456:191b:9e8d with SMTP id 5b1f17b1804b1-45a165a62d6mr1107935e9.11.1755022189674;
        Tue, 12 Aug 2025 11:09:49 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459db3048bdsm411212805e9.29.2025.08.12.11.09.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 11:09:49 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@kernel.org>
Cc: linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 Andre Przywara <andre.przywara@arm.com>, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: allwinner: a527: cubie-a5e: Add LEDs
Date: Tue, 12 Aug 2025 20:09:47 +0200
Message-ID: <2242978.Icojqenx9y@jernej-laptop>
In-Reply-To: <20250812175927.2199219-1-wens@kernel.org>
References: <20250812175927.2199219-1-wens@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne torek, 12. avgust 2025 ob 19:59:27 Srednjeevropski poletni =C4=8Das je =
Chen-Yu Tsai napisal(a):
> From: Chen-Yu Tsai <wens@csie.org>
>=20
> The Radxa Cubie A5E has a 3-color LED. The green and blue LEDs are wired
> to GPIO pins on the SoC, and the green one is lit by default to serve as
> a power indicator. The red LED is wired to the M.2 slot.
>=20
> Add device nodes for the green and blue LEDs.
>=20
> A default "heartbeat" trigger is set for the green power LED, though in
> practice it might be better if it were inverted, i.e. lit most of the
> time.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  .../dts/allwinner/sun55i-a527-cubie-a5e.dts   | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts b/ar=
ch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts
> index fce2b7d1ba3d..cb2a2b62a2b2 100644
> --- a/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts
> @@ -6,6 +6,7 @@
>  #include "sun55i-a523.dtsi"
> =20
>  #include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/leds/common.h>
> =20
>  / {
>  	model =3D "Radxa Cubie A5E";
> @@ -28,6 +29,24 @@ ext_osc32k: ext-osc32k-clk {
>  		clock-output-names =3D "ext_osc32k";
>  	};
> =20
> +	leds {
> +		compatible =3D "gpio-leds";
> +
> +		power-led {
> +			function =3D LED_FUNCTION_POWER;
> +			color =3D <LED_COLOR_ID_GREEN>;
> +			gpios =3D <&r_pio 0 4 GPIO_ACTIVE_LOW>; /* PL4 */
> +			default-state =3D "on";
> +			linux,default-trigger =3D "heartbeat";
> +		};
> +
> +		use-led {
> +			function =3D LED_FUNCTION_ACTIVITY;
> +			color =3D <LED_COLOR_ID_BLUE>;
> +			gpios =3D <&r_pio 0 5 GPIO_ACTIVE_LOW>; /* PL5 */
> +		};
> +	};
> +
>  	reg_vcc5v: vcc5v {
>  		/* board wide 5V supply from the USB-C connector */
>  		compatible =3D "regulator-fixed";
>=20




