Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94C9F225415
	for <linux-sunxi@lists.linux.dev>; Mon,  8 Sep 2025 14:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757342714; cv=none; b=bmm4Tc+eTgwGBFzwv/f7aHALLnQhm8xBDlG6AcbABOwIuM8LCOCGJlsFYYMAWUN9zSxZZBOoDvUg2O6l/rgJOxxPJUcSvuGuPcltddyd/4RTk1jzjojDOgzSOoc6uxRHPfJUX3GjIcB7KxEuBv1Zi06Wa/ww8/lKmYcLscxPajA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757342714; c=relaxed/simple;
	bh=wI6SpAffNdI2VJI2r6W6mIMJ6ctpCyKFmqkR9gg+2vE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ybq1MK+AsjY3ErLGGMolZ4gzzBF1tSO4JHepDyplw4FIJeP95lofrCcHG3a/wmpZR8SLWQsQP+YWjRZnYYS6QPfs11v8Z7qBMFKC40i15xEpZV3/oDuCnzau1AkqT31FB5rNWj41xDCU7E2lIoIPt39qlYkUQ/Cy/YH+wHCil8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KOSa+d6E; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KOSa+d6E"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-45de56a042dso8369985e9.3
        for <linux-sunxi@lists.linux.dev>; Mon, 08 Sep 2025 07:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757342710; x=1757947510; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NBXXUhb2BmggesthHwWGiC3WVEvKONX11k5/N5kirYY=;
        b=KOSa+d6EBpgFOs5A/5ak41SsnFbAVQ6prD6FuMAz1J9zJ3hoNzcZfBQ+Z3rMz4RK6p
         cq0s8GRSA+TAZU16QAsBaXCbwMdqPG+2YfphZ9wNPYr5CnraUaVE8Bg/YcMpvk8RDxsl
         SYYuFvVjO33JsW8cWNotcKl08mPt9p4hmgD3c0LO4atlHzY5jZAboJdEF6nl751GiXGP
         nKrCETS1N+zIkORzb1zjbFshnFomUgN7UCEeD1PSB2EwkfkCcfPKy7iy7Agn9WktkvIi
         +331TsUItcF5YF4kR5MxB3efqOOSHkzRB/xZt9qr+3ZUxQJgOLxXxNhyngnAs2g7vxeM
         2hTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757342710; x=1757947510;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NBXXUhb2BmggesthHwWGiC3WVEvKONX11k5/N5kirYY=;
        b=VpS9i5nagO5zWrS26y0TMyH0KdWpooMsD6ot+T/AYNA3T2Ex7nNL8S1bnN2Rweagl6
         Fqw4P8zBxEEvT1X1Rqk6sRG4C0kdXpK8atvZ7cx9WCn+QH21Y6ban+ubPLYD/2VXycCl
         ljvglYlx1pwe1qSTg1RYc5cZhoDQQes5q8en53JdmDIeFJSFI9A/Sz75qJsyDv593Syw
         XUVEHSx3wuBw3WVPHCvY5jWuDFiAZ5+kI1kysXigtPcBd6lYFWbmJj8luVjVX3NQcwaS
         NYmwmiCljo3uWVgn8qAQf9Qonh8LdKUhD1Sm91fiEvfxX2MJSaNl6StSpo1R8fUFsjfV
         FlGw==
X-Forwarded-Encrypted: i=1; AJvYcCUqVLHO0qxacECA8gFAbW+Sq+oP2DkiTAkJySHvVynDL2y8dPWKIuyjix7QbRuHt1tQ6F+D2CaxgrbrfQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzeJkvORi8UURU76eqq2PXn8cuMxntyC4pRx0dfUiW6J+A/ay+C
	WzekRasqJaqPWU2oh9wONHs9QsJHWbjnT6kc1ikH60nuerajd/jdHEPE
X-Gm-Gg: ASbGncsdwEM9sqPL8xH+gDsd1pHbwzjbPQyPD1ARjOtq5VBalNYPZlCA76Yg5nhy1jN
	ZEr4idK6yBt6Fiz0ebNwc2UWv+7aPV4B1M9cIRbK5TNU+w14ej3T4k/gRrCY5kgH9zb+JsWTUIq
	Y67o/3Newwn1bVpV0BGMyHh5tiLvHl0oAOn3bdAVYsEtdQUR90RlGTuK1D3+6VhgLkPDhKtZ3zh
	5areAPAuNoPL+zRNgIk/eiwwnVBMjyTeFQ2vr5YClSLX4duv/SsVpC3c11a8ARW0Pv+Hw+j4Bya
	e7/AMk0fafdlFaDd9ROPOTxfK5ouheRhkLU0RArSHrxRK4a+JzrDHAPlZd5DHPYnPo39TKLCi6F
	DK3zP9X5t7GykgBY0PHv6HCXOX5YXEEPbzg6Dg6glBBXLW1II+v0QCDV8t6LC8NQ3PrP/rOcYp9
	g=
X-Google-Smtp-Source: AGHT+IHoH/kzU+cENxZgae4niFxHNIBgU2yBvIXmO8kprk/rkDniF9PtdgAaS1TlIlleNmcUNrw0ug==
X-Received: by 2002:a05:600c:5249:b0:45d:d68c:2a43 with SMTP id 5b1f17b1804b1-45de3c66dd3mr52823045e9.33.1757342709588;
        Mon, 08 Sep 2025 07:45:09 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45ddb779eb6sm130993655e9.8.2025.09.08.07.45.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 07:45:09 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, wens@csie.org,
 samuel@sholland.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Aleksander Jan Bajkowski <olek2@wp.pl>
Cc: Aleksander Jan Bajkowski <olek2@wp.pl>
Subject: Re: [PATCH] arm64: dts: allwiner: h5: OrangePi PC2: add ethernet LEDs
Date: Mon, 08 Sep 2025 16:45:07 +0200
Message-ID: <2012341.PYKUYFuaPT@jernej-laptop>
In-Reply-To: <20250818163520.1004528-1-olek2@wp.pl>
References: <20250818163520.1004528-1-olek2@wp.pl>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne ponedeljek, 18. avgust 2025 ob 18:35:13 Srednjeevropski poletni =C4=8Da=
s je Aleksander Jan Bajkowski napisal(a):
> This patch adds support for Ethernet LEDs.

How did you tested this? According to linux-sunxi wiki, this board has
RTL8211E, while LED control is supported only with RTL8211F driver.

>=20
> Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
> ---
>  .../dts/allwinner/sun50i-h5-orangepi-pc2.dts  | 20 +++++++++++++++++++
>  1 file changed, 20 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-pc2.dts b/a=
rch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-pc2.dts
> index 0f29da7d51e6..7688f565ec9b 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-pc2.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-pc2.dts
> @@ -7,6 +7,7 @@
> =20
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/input/input.h>
> +#include <dt-bindings/leds/common.h>
>  #include <dt-bindings/pinctrl/sun4i-a10.h>
> =20
>  / {
> @@ -132,6 +133,25 @@ &external_mdio {
>  	ext_rgmii_phy: ethernet-phy@1 {
>  		compatible =3D "ethernet-phy-ieee802.3-c22";
>  		reg =3D <1>;
> +
> +		leds {
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +
> +			led@0 {
> +				reg =3D <0>;
> +				color =3D <LED_COLOR_ID_GREEN>;
> +				function =3D LED_FUNCTION_LAN;
> +				linux,default-trigger =3D "netdev";
> +			};
> +
> +			led@1 {
> +				reg =3D <1>;
> +				color =3D <LED_COLOR_ID_AMBER>;
> +				function =3D LED_FUNCTION_LAN;
> +				linux,default-trigger =3D "netdev";
> +			};

Schematic says LED0 is "Yellow" or Amber in this DT. So LED1 should be gree=
n.

Also, I'm not sure if trigger really needs to be added, since PHY network
will set it as such.

Best regards,
Jernej

> +		};
>  	};
>  };
> =20
>=20




