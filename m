Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3AA139A06F
	for <linux-sunxi@lists.linux.dev>; Sun, 10 May 2026 14:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778423962; cv=none; b=K5/XQpsJMuyAkD9pxXnsjGwvhrLX0FxVoAAd/kZRs1txxVoeQktDDKaFoRc3uI+Kj9cv4nJbdX0VumqPdR6gIf997fAIdeOHKMuX6X8O8XhQkgmCt+oOGtiPYVDgsusC26amJ+gyOtYLe81gifD35MyvX3riEAEVcJOPOF8mTiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778423962; c=relaxed/simple;
	bh=DPz69dG2WKf8euz1EcuYAXv3m3RGGtTv0RTVAkcRGPY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=L7BgQUNCGxk57v/SjwF2hYM8UDpJ5gAA/Xbg20iPKpce/c1XRLQBeGJXz+XMnPq27MQP/aLPyhv3N6NbHzU4qhbrQ05rORBUlV0TablsfC4Ct431qNZ3FMjn5rJp7GeO3boBM+mxikxgrF8LNDJkOSt/GS84YNZs1Ev8zOpbu+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r9Ms9XEU; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r9Ms9XEU"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-488a8ca4aadso31154705e9.3
        for <linux-sunxi@lists.linux.dev>; Sun, 10 May 2026 07:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778423959; x=1779028759; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SWmgbjG7zGF24sa5WwQmGg6RVdKBUDJnnneFdOm7tsU=;
        b=r9Ms9XEU1ttRz2N1rvAwU69Y3WHKvMZZfUxahFtkBhSc4Ex7aezfn34f3wf5h8Lnnv
         KWqiZ/l5Jh4L+6eklSE9TDTeD4YqTSeWSKL46b6vrnxcdxAULJ+/9EPYSb7cTu4gWDWU
         z4zELJH218Pafa0+vK+2v+USoFENWLqAa+PQVDW01HKlhARn6vvX9TpPb1tSLNrDxyGN
         4sEo/t2hqMcRL6iqt/gpTy2CfcY+QOuamcO060Mm+6VguutOnKPCz0b7Bjw4HMXvndwe
         FLqkceNovNrO9MEwL+0E47p1UimWtJhjc0Wfdh3/kYIqihfvwKNeeivdTAncg3AtDjaK
         rB8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778423959; x=1779028759;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SWmgbjG7zGF24sa5WwQmGg6RVdKBUDJnnneFdOm7tsU=;
        b=K2cxLHfrm4av9nUdPEAoqbEgQG15xpHrsbA2f5SQ5F4HcrF3QGmMA7shfjTB/T8fos
         9oBuh1Rk/XG3ZJB38LMNDzfHi1/zfmsA70CEImeiXBEXfoQ/XA+sNgAvTahapMRslOlE
         BT/oZMmCRVNFJWFKmy3ZZOIVSXwIe/yapg7REcvNxJQrk7x2HTPMjRzEzOQrniclxlc/
         8b6ijIBLASRROjn223xgklwfC8j2SKMA+qbHDd55HicdYmPtGDX3WCQPOogMGcy7RKtH
         z+kpJJs0ZDSLTloa/6xWfKwJMIt5zBumfP6+7+aWlzl59xsC/leYPWmhT1srPbM3G5Qr
         476w==
X-Forwarded-Encrypted: i=1; AFNElJ9+KMk1HA1BytaFYAh25oZcz1YE5Ml7zb6aRHr0B0PUjEOYEfyNGKKYAyEd8wJPorsgU6KamvsJcAaNaA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz3+KUEF+oVphvxUqYTT16idHglRBddTBlxhemgefdkorB3ijDV
	j2d2NgfB3KRKcmnW1wdU/2pF+lv8nOMK6S3q0QK02SCT/QobshTyzPPj
X-Gm-Gg: Acq92OFOX10XwnTZfsG2uUWvndzOZgwc+mwhhg+1fK3FT/UR4kTDE6MOsROk2y14Qab
	wlbn457xerPp4wk0GsM/nPbI77JY4IpQfxd9jj0DFDPv/XqLAoc0pMjSwvPiaDgJhjvM5fsanh+
	1flYOqV24qTiFoFVKhIoBSTZoK5JHEHMcphncM9dejafjWTJVnjNO3b1/U+nzvPTJH01lZi+0Yl
	n411kHWxETlS+enyivX2V0ZsDUz4JpoZtewabmbiwAPzBETIOErSmcCNpma5W7vXgEuSF1UsYTZ
	FnoE1kkL48BRcFtoQhGWxMI6p4LiBRwQ9Dz6YpRXge+g8Md9pk+SXsCzMoYhAPUX5nvEAz5tTu4
	yGv9KxZkc21ieNcc5y2CnAqNW4bUIO/k66KLkQ4fosncvBYy9NmsLdsQAq299jPDfi9FOzROXB2
	BbkYYhQsp6DL2FK+vx24s6tl6zNXj3sks9Y/C3NMd7b5sO5dj45+RXkv+5cPI94reZK/ZUh9Xcc
	U+Q+RO75pGGnuaExA==
X-Received: by 2002:a05:600c:696:b0:489:1c1f:35df with SMTP id 5b1f17b1804b1-48e51e215a4mr187215675e9.10.1778423959237;
        Sun, 10 May 2026 07:39:19 -0700 (PDT)
Received: from jernej-laptop.localnet (46-150-62-216.dynamic.telemach.net. [46.150.62.216])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548ec6c79fsm20097047f8f.15.2026.05.10.07.39.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 07:39:18 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
 David Lechner <dlechner@baylibre.com>,
 Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Chen-Yu Tsai <wens@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Maksim Kiselev <bigunclemax@gmail.com>,
 Michal Piekos <michal.piekos@mmpsystems.pl>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Michal Piekos <michal.piekos@mmpsystems.pl>
Subject: Re: [PATCH 3/3] arm64: dts: allwinner: a523: add gpadc node
Date: Sun, 10 May 2026 16:39:17 +0200
Message-ID: <U0YLqOw4SGiAdV7UGlJ3wQ@gmail.com>
In-Reply-To: <20260510-sunxi-a523-gpadc-v1-3-4f6b0f4000fb@mmpsystems.pl>
References:
 <20260510-sunxi-a523-gpadc-v1-0-4f6b0f4000fb@mmpsystems.pl>
 <20260510-sunxi-a523-gpadc-v1-3-4f6b0f4000fb@mmpsystems.pl>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne nedelja, 10. maj 2026 ob 14:57:24 Srednjeevropski poletni =C4=8Das je M=
ichal Piekos napisal(a):
> Describe high speed timer block on Allwinner D1S-T113.

Above line doesn't make much sense.

Best regards,
Jernej

>=20
> Tested on Radxa Cubie A5E:
> - 2 connected channels are showing voltages in agreement with
>   schematics.
>         BOOT-SEL-ADC ~500mV
>         BOM-ADC ~1800mV
> - 3rd channel exposed on 40pin header is showing correct voltages when
>   connected to known voltage source.
>=20
> Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>
> ---
>  arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/=
boot/dts/allwinner/sun55i-a523.dtsi
> index 5afa8d92acbf..f6c5cae5b23a 100644
> --- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> @@ -340,6 +340,18 @@ ledc: led-controller@2008000 {
>  			status =3D "disabled";
>  		};
> =20
> +		gpadc: adc@2009000 {
> +			compatible =3D "allwinner,sun55i-a523-gpadc",
> +				     "allwinner,sun20i-d1-gpadc";
> +			reg =3D <0x2009000 0x400>;
> +			clocks =3D <&ccu CLK_BUS_GPADC0>, <&ccu CLK_GPADC0>;
> +			clock-names =3D "bus", "mod";
> +			resets =3D <&ccu RST_BUS_GPADC0>;
> +			interrupts =3D <GIC_SPI 61 IRQ_TYPE_LEVEL_HIGH>;
> +			status =3D "disabled";
> +			#io-channel-cells =3D <1>;
> +		};
> +
>  		wdt: watchdog@2050000 {
>  			compatible =3D "allwinner,sun55i-a523-wdt";
>  			reg =3D <0x2050000 0x20>;
>=20
>=20




