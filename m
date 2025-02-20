Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 440062B9AA
	for <linux-sunxi@lists.linux.dev>; Thu, 20 Feb 2025 20:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740083930; cv=none; b=Q6380JRB2RVxrqBd6JDLXUUiRaboTL+JWv4iSkIpMhyOM8EDnQp/oqbB39dMz33B88NUPJV5XKF4o7JzWBW8SFRZ/xpk3VUVRZQxMHXscE9GkyDRtm34cnyvv5WaL2rHH+AyHTFMUHuv/xvx5OH+T4qHELD7nYXUDe3MifebbsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740083930; c=relaxed/simple;
	bh=QwsMW6iVNU91lHWFEwdgOCeBu4Y7rQxQ6qUYUGztHYc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rk0av+woIlPstyc3XGde8rkKGtMlMZ08hHB7Ol2K22y3YvYX6OmUkuo8KhnViYiG5LNYrE+YU9rOtQFASuoF+45wxDQ/1Iyc8pDOMbzkC5ByyiIhbMwDCy0WScVuU9n9N8XsfGGD3/MSac37CY37K+DyWSYUkLk2pDbrm44CfFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wa8CqYIk; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wa8CqYIk"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-439a4fc2d65so11811755e9.3
        for <linux-sunxi@lists.linux.dev>; Thu, 20 Feb 2025 12:38:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740083926; x=1740688726; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L/oPr+uhiMwVLonfT4r87s8BLvEv5cJUIRCGxgmU+Z4=;
        b=Wa8CqYIkXT2NON3icjS7eMkTGscW4jpsc5yxL4cRhhYPJVIGwFnVXWyZXcXBZpW93N
         KeoE0cfEXYPP7ckt8Ao1tiXHT/L6GwQ7JKX3YuEBJDD6/Kadn0MuzBPCIGuktlNVKBeu
         vB0uYW6B5YcT8bzadXvQmFfZrITYLmRdMuU1X+3DKn+3Af/l9xlv/vaDn6oSlxBRzdO/
         SL5zxFSEcp9PujUdHEK0TeWC2myuZ4BL5eBPe9DZ5oUKL8ohjwAMq8z886AsfO3Dkw1R
         +1xEoFVLMpPqf0N1fbZswzQb3Uh7nXEOfmlAP1KAZdrvBVMqUHdsdMSgbUC3yaMDQeeo
         mgCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740083926; x=1740688726;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L/oPr+uhiMwVLonfT4r87s8BLvEv5cJUIRCGxgmU+Z4=;
        b=RTZ8kGtGLG1Or4o/ch186ZshTh8URdT8LPzRO68jwp7ElGVX89rZex1m4wF8fN8o+P
         uK5Jj3G40rKTAmf5Qp8whf1xt4twALCF3vu63ED1SThgthg0yyzy1gTjDe6+Ax7WSqOE
         H6dZNBg7hdAvR8XaTyBezDHCiv3UReRhM/6C0A1UWVs39K45PLrQFIDIXI2TtHw5b71Q
         HAhtBbJejrWFrnIzWMiuwVr/pudBArI0/Z24nb0CpIl5a1M3nCS4eBRvgoYKKxwMHr/K
         uF2He6cjyyHiIfMeQjH/qJWVwRD6TKoccuohL77EjDR/mQ6dhqEw8YIpV83u7DTUuOWm
         s5Tw==
X-Forwarded-Encrypted: i=1; AJvYcCX1zvMaK7jOD1j3Av7igUPK+PdHWGg08v+33EoCIbsfsUrjaLI9H8KNJkPz3G5nIN2HEeJ4LAnz7/1YNw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzam5M1dtOYwIjamDfYhwJPC6CZ7hWm/1SSoDSrjGPIf2zabFE5
	iAu4Rg3iMmsEiaPjfEFP110pDC4SYCHS5AV3Otoc/rjTNCM7PfFc7t3rwRaE/HI=
X-Gm-Gg: ASbGncvn2eRYBBHbI0Y5PpLNcRq5ZuTQP1LqT4k7A5brNk961U43o9ZI0qLj6BEPdBa
	oNWFZ4lSI+9PsFl+shO80XYWIDnVDTY2N8i0zXENdenWfy88Tcd8hpbG855B0hq4+2t4MqyK22y
	bwMuCPfgpB5ihfqTLVnz+48cVen6T+G8hHYUGKyryQfW80rAR/4sRmDeZd/5dh7a9Ctu+E2sRhw
	72eeB+DWd3oJZ3fxcx1faVg+nnkZIcXv09hGQXJlyW/EmUohg2kSe3uJcHEK/oySbBpYvxsHXU3
	BEDZl1r++h2tkyS2BX4UdU7WeJukguOHpX6cR3toqT2SvTavqRbYf9QjHZZVaEuDidM=
X-Google-Smtp-Source: AGHT+IH9AWEvVPP40afiEyTpAqrp+DWpZtEd4U6ccKRCJ9igZQuFw9ymkzn2FjL3McLqq0mzFVmoPw==
X-Received: by 2002:a05:600c:524a:b0:439:86c4:a8ec with SMTP id 5b1f17b1804b1-439ae1f1147mr6622885e9.15.1740083926326;
        Thu, 20 Feb 2025 12:38:46 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439a3cc9551sm31663025e9.39.2025.02.20.12.38.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 12:38:46 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "moderated list:ARM/Allwinner sunXi SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>,
 open list <linux-kernel@vger.kernel.org>,
 Philippe Simons <simons.philippe@gmail.com>
Cc: Philippe Simons <simons.philippe@gmail.com>
Subject: Re: [RFC PATCH 3/3] arm64: dts: allwinner: h700: Enable USB OTG
Date: Thu, 20 Feb 2025 21:38:44 +0100
Message-ID: <3229934.fEcJ0Lxnt5@jernej-laptop>
In-Reply-To: <20250118102207.9339-3-simons.philippe@gmail.com>
References:
 <20250118102207.9339-1-simons.philippe@gmail.com>
 <20250118102207.9339-3-simons.philippe@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne sobota, 18. januar 2025 ob 11:22:06 Srednjeevropski standardni =C4=8Das=
 je Philippe Simons napisal(a):
> RG35XX have a GPIO controlled regulator for phy0 vbus, add it.
> Enable HCI0s controllers and otg for dr_mode.
> Add phy0 properties to descrive id_det, external vbus, and internal vbus
>=20
> Signed-off-by: Philippe Simons <simons.philippe@gmail.com>

This could work without previous two patches, right?

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  .../sun50i-h700-anbernic-rg35xx-2024.dts      | 25 +++++++++++++++++--
>  1 file changed, 23 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-20=
24.dts b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
> index 80ccab7b5..5a6ae42de 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
> @@ -175,6 +175,16 @@ reg_vcc5v: regulator-vcc5v { /* USB-C power input */
>  		regulator-min-microvolt =3D <5000000>;
>  		regulator-max-microvolt =3D <5000000>;
>  	};
> +
> +	reg_usb0_vbus: regulator-usb0-vbus {
> +		compatible =3D "regulator-fixed";
> +		enable-active-high;
> +		gpio =3D <&pio 8 16 GPIO_ACTIVE_HIGH>; /* PI16 */
> +		regulator-min-microvolt =3D <5000000>;
> +		regulator-max-microvolt =3D <5000000>;
> +		regulator-name =3D "usb0-vbus";
> +		vin-supply =3D <&reg_boost>;
> +	};
>  };
> =20
>  &cpu0 {
> @@ -337,12 +347,23 @@ &uart0 {
>  	status =3D "okay";
>  };
> =20
> -/* the AXP717 has USB type-C role switch functionality, not yet describe=
d by the binding */
> +/* the AXP717 has USB type-C role switch functionality */
>  &usbotg {
> -	dr_mode =3D "peripheral";   /* USB type-C receptable */
> +	dr_mode =3D "otg";   /* USB type-C receptable */
> +	status =3D "okay";
> +};
> +
> +&ehci0 {
> +	status =3D "okay";
> +};
> +
> +&ohci0 {
>  	status =3D "okay";
>  };
> =20
>  &usbphy {
> +	usb0_id_det-gpios =3D <&pio 8 4 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>; /* P=
I4 */
> +	usb0_vbus_power-supply =3D <&usb_power>;
> +	usb0_vbus-supply =3D <&reg_usb0_vbus>;
>  	status =3D "okay";
>  };
>=20




