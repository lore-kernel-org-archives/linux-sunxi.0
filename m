Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27C912063F0
	for <linux-sunxi@lists.linux.dev>; Sat, 22 Feb 2025 09:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740217584; cv=none; b=K0jqiDoUjP1AcnBrIb1PMk8j+csN6m/aoPAmdbiWIVqzScDIpof7FKEgVz/tF8NSd4EgQZe5mrBEU265NcqOFiGtiyBa8gVZlTn3mdhqdWx8o2Ve8cdh8eGY8e4DYgmoJIcLrNP608enj27PVUrV/XsR1zzkD9fctglhXattoUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740217584; c=relaxed/simple;
	bh=f3l/C08zZjB4lqhJuTu7gJoa99yZ3UX081PIPlxuiSs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Q0J40h3rHE8yQ1XLdMZwU05f1RwYdVzo0PnA+Y5pX+A//HB+nsqYt3lYBE7NZm/zUv6vIXabjdpe1n+sstzQYGDcQ94blOw4u4rjl/Hv0dOMucbnTzJcNVwXYD07XKr7YoRNaNjjcrWPY8e4C42kkOUB/ALz8/2dwAsd04sEznA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f6t4Oxzz; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f6t4Oxzz"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-439a1e8ba83so27744585e9.3
        for <linux-sunxi@lists.linux.dev>; Sat, 22 Feb 2025 01:46:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740217581; x=1740822381; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=41DdFtdJ+j4aD8vxL14dVna+R0FXEc06U5Wqw9eVGxY=;
        b=f6t4OxzzJYLr6+J7fX6UK/KQ67N/RuEL5a0VUfrWeZDnF2TQWPaZ96lDhCWPakPpGC
         tXuCklzMjwCgXNt63p44yNy8hDFrYxO+DAucKKaYES0r0pftX2wjl27E/iObqJIMf6wV
         5Uv5xsv/E8AcbyYbU197VXv/oJvk6Pb7WM7Z0vMfj56vAkqKXSBZWsEqQ5f8uW4Th6Ol
         H5uBdQR41C4imN5csYyzoo0RzymqSA6At2hMAF4yGLWZzuY+5FOM8OlAnc/dcVSwPoFs
         S8z2EtZAkWizZykaePIEHwgOmo1LBkbs0XuFo6a8jtwMR0mEp9DyRW6ZLCh8+XASHrDE
         ATsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740217581; x=1740822381;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=41DdFtdJ+j4aD8vxL14dVna+R0FXEc06U5Wqw9eVGxY=;
        b=lJcDIuQa7oDLWtpJMdCBYcYDEQPqx9Z1fUv7oAYGhUZ/uOLDyaDWu2z34T3OkObKCz
         yYZksoo//lG/nbhFo5uBbBRFKntuvzzTxh4jMXngBs792WJ/3vSIbPeU0Xz6ucUG9TYS
         uAswVdP5f7Xs72Pp57wy+GQYG0iB57Ta9KGBi9hVOyIoI4nw4sGbQ56jqLLHmgTIYGQ+
         bDQtp2oSqkFgcHizjPmZBY+W3UhD0WMtopPpwZOALlKkxCKd6wteQEOzY1eDbkZUajsA
         B2KvKH3TT2sP4Wrwr/kH9+ot6S+bWrtXJPHYfYse72JtDdyYL8uo+plKmT0V5jkuRhMV
         qNfg==
X-Forwarded-Encrypted: i=1; AJvYcCXX1lEaD3YMuVjNiHONN/DPob5QvH2hQBtB/Le/wV8C7sg/Gvz4Ny5tGXq+msZBJyjQGjN0Ssi0JkcHMw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz7NqDejJa/lm+s0uWcBk+Z2OSXkTjL3nZaOi/O3K0fHBHhvPrf
	9yyAr77MoYhYdxis+zDGm2Jpk+1Eg08rRzRxTSN5206aj/RGnV0X
X-Gm-Gg: ASbGncuTQp/zI54iLmIftpBiokHBRPFeRNgqIgB5E+6bxf0KftEa1mOmJPxyOYN0kg5
	m3u/FoluEbH07E8n3Cir0pVAxrOV3yP8R0gqgorwgEQxCiPB1ZyFDWuTL+Jw4MkKiTk1iYWMYFL
	lZfgVsJcslfOyEaKU9i4eEWJ8C+CvyB9aoue44SRQu+Zw0xgWHnJbG+3MMAk/lDZ5Gf77vK/a99
	rbi9WYT+uVnjmrWZZb41C8OprtCm/tpyhsvzgp1cVtnsld/0pfKuvME3cXBYdu9JtFbMkUx0T2Q
	PWt0ZC5CK3TO4BRZHXhw57TRJR14Vu/FU4vBpDzGhzQMeEUqA1WYUCeHr0he+UU90RIGIiTiCK1
	u4A==
X-Google-Smtp-Source: AGHT+IH9kK+RjWwIPLtZlicr8RC/6yrn6sA09olVzUzJHXrQ6iKk6NZGgzzk5oOay6MNB/ZXKzOgpA==
X-Received: by 2002:a5d:64c4:0:b0:38f:6697:af91 with SMTP id ffacd0b85a97d-38f70825fe0mr5475428f8f.39.1740217581325;
        Sat, 22 Feb 2025 01:46:21 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258f0597sm25364929f8f.42.2025.02.22.01.46.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Feb 2025 01:46:21 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, Ryan Walklin <ryan@testtoast.com>
Cc: Andre Przywara <andre.przywara@arm.com>,
 Chris Morgan <macroalpha82@gmail.com>,
 Hironori KIKUCHI <kikuchan98@gmail.com>,
 Philippe Simons <simons.philippe@gmail.com>, linux-sunxi@lists.linux.dev,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Ryan Walklin <ryan@testtoast.com>
Subject: Re: [PATCH 7/8] arm64: dts: allwinner: rg35xx: Enable LCD output
Date: Sat, 22 Feb 2025 10:46:19 +0100
Message-ID: <23840170.6Emhk5qWAg@jernej-laptop>
In-Reply-To: <20250216092827.15444-8-ryan@testtoast.com>
References:
 <20250216092827.15444-1-ryan@testtoast.com>
 <20250216092827.15444-8-ryan@testtoast.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne nedelja, 16. februar 2025 ob 10:27:14 Srednjeevropski standardni =C4=8D=
as je Ryan Walklin napisal(a):
> The RG35XX has a 640x480 RGB/SPI LCD panel, supported by the SoC display
> pipeline and an NV3052C controller. The H616 SOC's GPIO bank D contains
> the muxed display pins for RGB and LVDS output support.
>=20
> Enable the display engine and LCD timing controller, configure the
> panel, and add a fixed 3.3v GPIO-controlled regulator for the panel, and
> a VCC supply for the display pins as per the other GPIO banks.
>=20
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>
> ---
>  .../sun50i-h700-anbernic-rg35xx-2024.dts      | 58 +++++++++++++++++++
>  1 file changed, 58 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-20=
24.dts b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
> index a231abf1684ad..388487d4720e2 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
> @@ -175,6 +175,49 @@ reg_vcc5v: regulator-vcc5v { /* USB-C power input */
>  		regulator-min-microvolt =3D <5000000>;
>  		regulator-max-microvolt =3D <5000000>;
>  	};
> +
> +	reg_lcd: regulator-gpio-lcd-vdd {
> +		compatible =3D "regulator-fixed";
> +		regulator-min-microvolt =3D <3300000>;
> +		regulator-max-microvolt =3D <3300000>;
> +		regulator-name =3D "vdd-lcd";
> +		gpio =3D <&pio 8 15 GPIO_ACTIVE_HIGH>; // PI15
> +		enable-active-high;
> +	};
> +
> +	spi_lcd: spi {
> +		compatible =3D "spi-gpio";
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +
> +		sck-gpios =3D <&pio 8 9 GPIO_ACTIVE_HIGH>; // PI9
> +		mosi-gpios =3D <&pio 8 10 GPIO_ACTIVE_HIGH>; // PI10
> +		cs-gpios =3D <&pio 8 8 GPIO_ACTIVE_HIGH>; // PI8
> +		num-chipselects =3D <1>;
> +
> +		panel: panel@0 {
> +			compatible =3D "anbernic,rg35xx-plus-panel";
> +
> +			reg =3D <0>;
> +
> +			spi-max-frequency =3D <3125000>;
> +			spi-3wire;
> +
> +			reset-gpios =3D <&pio 8 14 GPIO_ACTIVE_LOW>; // PI14
> +
> +			backlight =3D <&backlight>;

There is no backlight node at this point. Reverse patches 7 and 8 or better=
 yet,
merge them and put patch 8 message into comment to backlight node.

Best regards,
Jernej

> +			power-supply =3D <&reg_lcd>;
> +
> +			pinctrl-0 =3D <&lcd0_rgb888_pins>;
> +			pinctrl-names =3D "default";
> +
> +			port {
> +				panel_in_rgb: endpoint {
> +					remote-endpoint =3D <&tcon_lcd0_out_lcd>;
> +				};
> +			};
> +		};
> +	};
>  };
> =20
>  &codec {
> @@ -187,6 +230,10 @@ &cpu0 {
>  	cpu-supply =3D <&reg_dcdc1>;
>  };
> =20
> +&de {
> +	status =3D "okay";
> +};
> +
>  &ehci0 {
>  	status =3D "okay";
>  };
> @@ -206,6 +253,7 @@ &ohci0 {
>  &pio {
>  	vcc-pa-supply =3D <&reg_cldo3>;
>  	vcc-pc-supply =3D <&reg_cldo3>;
> +	vcc-pd-supply =3D <&reg_cldo3>;
>  	vcc-pe-supply =3D <&reg_cldo3>;
>  	vcc-pf-supply =3D <&reg_cldo3>;
>  	vcc-pg-supply =3D <&reg_aldo4>;
> @@ -355,3 +403,13 @@ &usbotg {
>  &usbphy {
>  	status =3D "okay";
>  };
> +
> +&tcon_lcd0 {
> +	status =3D "okay";
> +};
> +
> +&tcon_lcd0_out {
> +	tcon_lcd0_out_lcd: endpoint@1 {
> +		remote-endpoint =3D <&panel_in_rgb>;
> +	};
> +};
>=20




