Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B376D28D83E
	for <linux-sunxi@lists.linux.dev>; Mon, 13 Oct 2025 15:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760370226; cv=none; b=gsb8rY7Bjbl8+3pUHquidwFQtTKO6oKPIQy+i57sMGlhpeCZ4xUi1CWWhrIIdG0dJpR3RrVXy1Bz18knH4Bd4YH69Qw5d+x/uStHlvZlFwPNV1BQCUyeZIKinlWRdc4JXfZBtAQ6KQNAcPDjYvwGJ1j+bDxEvmpr9jknH6aXvN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760370226; c=relaxed/simple;
	bh=yN4I19Z/Zxa0OAvQeCoXidtC7w6Fi4uf1d42DNqijxI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hTSK/g5UC2cjKOJ0OhA9FLv6rBUio7slNaY2S40Ewa14cfj3ztcRQdfjmBr+1yE7DIXK50ppS46Ey90mdvNFwjv6aFMnyxwXWXPDfg5QVNB9VuvMaEU1d4KNiZ1zA4ad/tapvrCK3BayX9qOLF+sqVRBAZU05hVEJfXzIexBkrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b6e/W9bJ; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b6e/W9bJ"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6394938e0ecso7130617a12.1
        for <linux-sunxi@lists.linux.dev>; Mon, 13 Oct 2025 08:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760370223; x=1760975023; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YJ71KTvKAMUC1AACHaaj8OA3SEI5NusmyGpJc9+nnWQ=;
        b=b6e/W9bJZ6ZwCXhyCjTPnuHyrowLE081RoAzQH1ydq5Q5At7QmUq8xBHsS6nmmipRL
         KRnpn8RXBQkN6OhblIiSqLWCshY6JSzDs9YHxMWv6WcaKFpDleN6v1MRx6j6OISxW3VI
         S6sYARE+R0DX+IZGwmIBmPCMF8PwV9H7vziw+m9yyaTZiXZ+4UKC9uGHYnpyQsO1GXkl
         iub+ruFxeLVylHcqoCo2k2OgcOfJuSoTr3cpw1UnKvZ+bLWdpsges9AoGEnEl2rg9Oef
         VfKEDQ8Q7DoTi5z6w6nCY42oZzsgKAOWRiFd6xyyheZ5rOlFMCAogfmPSyRag2sDEb0N
         Shqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760370223; x=1760975023;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YJ71KTvKAMUC1AACHaaj8OA3SEI5NusmyGpJc9+nnWQ=;
        b=HtXtO4guWcOSb2XBtn8xKjaEWhLOXVFrFWwJrdeNw9HugseOAkxtSpL7PYwHMCGFwq
         76ZLWgrcuYIflZBAqLNsKjpixhtesZKHVnP2tSK5Lgq2wCUBQoNMcb1w7/HfcDpsRAj6
         BTrjEIZontISLW7LOwbTJl8xVt8uf1dI8JguNJJiUkTzDqUuPQFHiKSNatNn78jf0oXc
         DfQbW9GQ9X+bUw3Srras/iGBl3brWXqpTBBc6I7DCuMTVh6dfqNMxvSRnD6pusV29rMs
         Udid9FatDSz8QACl3b0E+cyCB1KO+YchLuFOy6PF7+IQaEXsxS0rKl5SUV81jtNSgfUO
         P+sg==
X-Forwarded-Encrypted: i=1; AJvYcCUNnEtgjR33i0ubqFSV9R2dSzb3KT33MCxiIV5C+LekpAnUh3BKNGLMNMIsCSzyH4oYwoJ6/qMo2OifIQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwepBdoJtYu/UdI/nxI6h47OrwkZqJ89kGau0ZSCREymo/XS2hU
	oJCpwzHRYADmlGGEbLJ+PLXT87ACW4/iVk8ZoEAskJ2f+u8Gj21P3eC6
X-Gm-Gg: ASbGncv0YW542725kSn5brLfY3csu86FZHKejRUJLjhsjhnz2GpT+QwvvEddjGxe2O/
	2Lzxf9ZYtyERfW9doZvNzJSk915ytGC036psy8mFFRNauErrUMtjj0iL4wBCn+uoDLWCwWijn4r
	yAS/e7j/DcEKnoivkgeImucxyQ5aE4F0s58OvzJYbu7koDsQ+RYK2DmIDfk7Au1ww1g5SEeDi0V
	2XGVqp2qeCf+CqJ7k+eoC5KIHGTs2hf5+Wx8l7x6Dn6ALyd5FVPqsjeYyCh/yLejUtsqkjd5KlT
	BTfMlC+tqS/xyJ+RW5iwBobhdD1HJ5QzhOzNFUDt/j3X93Jb2X1qaF7nci/9TlkIrEggBDg6OWT
	dYkhedbHP+O+M63leEhnw7lKtKZX+CdZHSWIwzXSgbhA8iIK+ZMcKBD1+5gk826x673tmdsXiJr
	CyXET08WSdZu/JixA7oCwDmak=
X-Google-Smtp-Source: AGHT+IG3FRsw4wCBnmi9CngEI7WoVxEvQAt2WNJU3I/XEDcpUDTwP0J77KuXRMbbHoTA+pSwJQSXNw==
X-Received: by 2002:a05:6402:b28:b0:634:6d87:1d28 with SMTP id 4fb4d7f45d1cf-639d5c74a9fmr13775050a12.35.1760370222659;
        Mon, 13 Oct 2025 08:43:42 -0700 (PDT)
Received: from jernej-laptop.localnet (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63a5c133f58sm9091983a12.30.2025.10.13.08.43.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 08:43:42 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Richard Genoud <richard.genoud@bootlin.com>
Cc: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@baylibre.com>,
 Wentao Liang <vulab@iscas.ac.cn>, Johan Hovold <johan@kernel.org>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Richard Genoud <richard.genoud@bootlin.com>
Subject: Re: [PATCH v2 15/15] arm64: dts: allwinner: h616: add NAND controller
Date: Mon, 13 Oct 2025 17:43:39 +0200
Message-ID: <2800174.mvXUDI8C0e@jernej-laptop>
In-Reply-To: <20251013152645.1119308-16-richard.genoud@bootlin.com>
References:
 <20251013152645.1119308-1-richard.genoud@bootlin.com>
 <20251013152645.1119308-16-richard.genoud@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne ponedeljek, 13. oktober 2025 ob 17:26:45 Srednjeevropski poletni =C4=8D=
as je Richard Genoud napisal(a):
> The H616 has a NAND controller quite similar to the A10/A23 ones, but
> with some register differences, more clocks (for ECC and MBUS), more ECC
> strengths, so this requires a new compatible string.
>=20
> Add the NAND controller node and pins in the device tree.
>=20
> Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
> ---
>  .../arm64/boot/dts/allwinner/sun50i-h616.dtsi | 51 +++++++++++++++++++
>  1 file changed, 51 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi b/arch/arm64/=
boot/dts/allwinner/sun50i-h616.dtsi
> index ceedae9e399b..bb53c6c63836 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
> @@ -304,6 +304,42 @@ mmc2_pins: mmc2-pins {
>  				bias-pull-up;
>  			};
> =20
> +			/omit-if-no-ref/
> +			nand_pins: nand-pins {
> +				pins =3D "PC0", "PC1", "PC2", "PC5", "PC8", "PC9",
> +				       "PC10", "PC11", "PC12", "PC13", "PC14",
> +				       "PC15", "PC16";
> +				function =3D "nand0";
> +			};
> +
> +			/omit-if-no-ref/
> +			nand_cs0_pin: nand-cs0-pin {
> +				pins =3D "PC4";
> +				function =3D "nand0";
> +				bias-pull-up;
> +			};
> +
> +			/omit-if-no-ref/
> +			nand_cs1_pin: nand-cs1-pin {
> +				pins =3D "PC3";
> +				function =3D "nand0";
> +				bias-pull-up;
> +			};
> +
> +			/omit-if-no-ref/
> +			nand_rb0_pin: nand-rb0-pin {
> +				pins =3D "PC6";
> +				function =3D "nand0";
> +				bias-pull-up;
> +			};
> +
> +			/omit-if-no-ref/
> +			nand_rb1_pin: nand-rb1-pin {
> +				pins =3D "PC7";
> +				function =3D "nand0";
> +				bias-pull-up;
> +			};
> +
>  			/omit-if-no-ref/
>  			spi0_pins: spi0-pins {
>  				pins =3D "PC0", "PC2", "PC4";
> @@ -377,6 +413,21 @@ iommu: iommu@30f0000 {
>  			#iommu-cells =3D <1>;
>  		};
> =20
> +		nfc: nand-controller@4011000 {
> +			compatible =3D "allwinner,sun50i-h616-nand-controller";
> +			reg =3D <0x04011000 0x1000>;
> +			interrupts =3D <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&ccu CLK_BUS_NAND>, <&ccu CLK_NAND0>,
> +				<&ccu CLK_NAND1>, <&ccu CLK_MBUS_NAND>;
> +			clock-names =3D "ahb", "mod", "ecc", "mbus";
> +			resets =3D <&ccu RST_BUS_NAND>;
> +			reset-names =3D "ahb";
> +			dmas =3D <&dma 10>;
> +			dma-names =3D "rxtx";
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +		};

Sorry, forgot to mention. This should be marked as disabled, as most of
the boards don't have NAND connected.

Best regards,
Jernej

> +
>  		mmc0: mmc@4020000 {
>  			compatible =3D "allwinner,sun50i-h616-mmc",
>  				     "allwinner,sun50i-a100-mmc";
>=20




