Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3946125A32E
	for <linux-sunxi@lists.linux.dev>; Sat, 11 Oct 2025 10:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760178848; cv=none; b=ZOeXyPXj76Xi6oQ1lTuXzpGBdPo5wpxgsE/6wGUKd8pJ7RpfG38NOXtSKIjJelzdmuxQh7vRfxG2pFOeg4WEW+ceS6YNiNLg8LgGGaag+2QW3+4rU87kR6g8BRsrkldQZDznJhV6tCDtz4D2/OkFIIxwNy+7lMLKRFpCPWZNOrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760178848; c=relaxed/simple;
	bh=/RHuJN8mBmn1rPV1anCMzCvuwIBWUCVFFlaXjDz3/8Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HvF98hdvTkdMfI5FdInx8HiuG7l/UGfhZpeOLkW/rhqGM+8j93X2CTwZhl+nRpc0GB5Ne2gQ3AcLmGDbOJ6cjTvKmbItDV0Rin8BQWZO1wo+3gpVHYWCdZpl4PGFSBxIp0/BGxmTaZnL+uariZSfmF99QVgGpUevlwpBKHx9Q2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IPbBlTTP; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IPbBlTTP"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b54f55a290cso349509266b.2
        for <linux-sunxi@lists.linux.dev>; Sat, 11 Oct 2025 03:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760178840; x=1760783640; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HYAPdYV4D3yX5RzlvX7A+6gcHuPHfoEYTyIdk9OJfZs=;
        b=IPbBlTTPF1TZ+RAKY/7utJV0xjKpT+4OFuLG4CHf8vbsX+/JF8MvBvxPuwUwefSaHc
         U1ioxCrjOZWltYwCKhrz27WmOcgCGmuahrPjADcL1uzT13wBHNe5ztkmt3QkKlgcHuBG
         oN3QYIuMov6kxpjqvhsak7wWy5RUjc9NQIVYW9ETPKEjCraBWc8Rtvthdi3DQtYrch4O
         8HZCrLp+SJSYU7nbaiXgEYV9ze6tT4oqVoBWxsQ077DAIrRjlK5lxzoisXt+jDiEkXck
         y+GW1JR8pNp/8a6wt5BMzmS4O/+dnKgyQUCOvH6r4W4ffbn+WlshBqHn2hdZ0OSP7Tt0
         IJbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760178840; x=1760783640;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HYAPdYV4D3yX5RzlvX7A+6gcHuPHfoEYTyIdk9OJfZs=;
        b=klqHrieBxSxZNe+E3uGlS3xn+t1O3tro+xA34j9OtBnmP4cvNTBoWPw/fGQSAdun9W
         MC7beICh+aCH8X6j9hQJIvxTc7bN+jsnESw4khg+FDbalpdYyjAKaFyjvxtiUyZu2SPy
         oBBH7j0xpVlhRV82ciYrLPJnQeZ/Ylevbnju7HSR1cvS/69QQ6IEDWj0u0UmkfgUjMPT
         hzryalMgQ3TCvVy+ILJrk2TNao4mb+4FxBVySI13VZEAsMFxeDXL1hBqxoqaldYHymk/
         PoRNF5UC1x3HMbA+DsDhTPt4K0cQtG8eif02Pz7ycfiZ2QDvlnTfQPchPJyxtmrrTyyr
         ULhg==
X-Forwarded-Encrypted: i=1; AJvYcCXV5OCpVY8591PsAbpO0zK9q5gjubCDuN9/Bn/D+ThgPyVuGU/+jukq6ykUNDBgWyIz7IGhj++zVFCFYA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwLeW+pdSRUeyZtGe0iMrzHNULBjeE27traGo9bos230k1qTZiM
	fkY7rkJ7SCINeXMBEqAgO3et6P1z1Isu4muR517pkqn141VH4WIvDszn
X-Gm-Gg: ASbGncsgJjQ5ZK/ZgoGADb0TGPChqb0wfIEgv7ESxmjmAaaRXHqAJtJCc2GVuuOoApZ
	+Y/40CLHJ144iV+Eoj7VMFgXAtFcLVnXPeWu1MshBMK1zrzYAIjEa0I45rIiDMwKQaRl7KzPJ38
	GXbapR9pUIYVF5K+dc09UT9LJHZO7sg7ltYOGCWaypqeCdjWzcjhZPB+hqkniF9+EooEV2OS+6w
	mw6EZZnML+DiobJGi/pNSt0h2H6WwysZprHu2kEqKaEY+rOybYV6uC8ZfM9PESf+9g6PrUxtaXk
	wkMsslV6EJJ7rH/5lfh+AjTgJBcWFLDktvE5IBNiXyh8osot1/TZNtHXFYRSSoYE5wTJDHF46hu
	ZmZy1mGvPeW4Xu6vVvfICA37n953iiTvmNLUMfHzQXTiO71VOFbJvXWJet83Hc3kUqGROO9i72A
	==
X-Google-Smtp-Source: AGHT+IFFycSQY4Q0kx0MQ3fB8e1/4xrhlffbTRZSX2gxi2804bwlqcuj20iB5WX1bDTyi44c3l+bjA==
X-Received: by 2002:a17:907:6d07:b0:b41:79ff:250c with SMTP id a640c23a62f3a-b50aaa96ba5mr1457625766b.23.1760178840185;
        Sat, 11 Oct 2025 03:34:00 -0700 (PDT)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d8c124a8sm454690166b.51.2025.10.11.03.33.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Oct 2025 03:33:59 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Richard Genoud <richard.genoud@bootlin.com>
Cc: Wentao Liang <vulab@iscas.ac.cn>,
 Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@baylibre.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Richard Genoud <richard.genoud@bootlin.com>
Subject: Re: [PATCH 03/15] arm64: dts: allwinner: h616: add NAND controller
Date: Sat, 11 Oct 2025 12:33:58 +0200
Message-ID: <4682810.LvFx2qVVIh@jernej-laptop>
In-Reply-To: <20251010084042.341224-4-richard.genoud@bootlin.com>
References:
 <20251010084042.341224-1-richard.genoud@bootlin.com>
 <20251010084042.341224-4-richard.genoud@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne petek, 10. oktober 2025 ob 10:40:30 Srednjeevropski poletni =C4=8Das je=
 Richard Genoud napisal(a):
> The H616 has a NAND controller quite similar to the A10/A23 ones, but
> with some register differences, more clocks (for ECC and MBUS), more ECC
> strengths, so this requires a new compatible string.
>=20
> This patch adds the NAND controller node and pins in the device tree.
>=20
> Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
> ---
>  .../arm64/boot/dts/allwinner/sun50i-h616.dtsi | 50 +++++++++++++++++++
>  1 file changed, 50 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi b/arch/arm64/=
boot/dts/allwinner/sun50i-h616.dtsi
> index ceedae9e399b..60626eba7f7c 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
> @@ -278,6 +278,37 @@ ir_rx_pin: ir-rx-pin {
>  				function =3D "ir_rx";
>  			};
> =20
> +			nand_pins: nand-pins {
> +				pins =3D "PC0", "PC1", "PC2", "PC5", "PC8", "PC9",
> +				       "PC10", "PC11", "PC12", "PC13", "PC14",
> +				       "PC15", "PC16";
> +				function =3D "nand0";
> +			};
> +
> +			nand_cs0_pin: nand-cs0-pin {
> +				pins =3D "PC4";
> +				function =3D "nand0";
> +				bias-pull-up;
> +			};
> +
> +			nand_cs1_pin: nand-cs1-pin {
> +				pins =3D "PC3";
> +				function =3D "nand0";
> +				bias-pull-up;
> +			};
> +
> +			nand_rb0_pin: nand-rb0-pin {
> +				pins =3D "PC6";
> +				function =3D "nand0";
> +				bias-pull-up;
> +			};
> +
> +			nand_rb1_pin: nand-rb1-pin {
> +				pins =3D "PC7";
> +				function =3D "nand0";
> +				bias-pull-up;
> +			};
> +
>  			mmc0_pins: mmc0-pins {
>  				pins =3D "PF0", "PF1", "PF2", "PF3",
>  				       "PF4", "PF5";
> @@ -440,6 +471,25 @@ mmc2: mmc@4022000 {
>  			#size-cells =3D <0>;
>  		};
> =20
> +		nfc: nand-controller@4011000 {

Nodes are sorted by memory address. So this one should be moved before
mmc2 and possibly others.

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
> +			pinctrl-names =3D "default";
> +			pinctrl-0 =3D <&nand_pins>, <&nand_cs0_pin>,
> +				<&nand_cs1_pin>, <&nand_rb0_pin>,
> +				<&nand_rb1_pin>;

Are you sure that each nand device will use exactly this pin configuration?
IIUC, not all chips will have two CS and two RB pins. If so, pinctrl nodes
should be moved to device DT and pins subnodes should be marked with
/omit-if-no-ref/.

Best regards,
Jernej

> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +		};
> +
>  		uart0: serial@5000000 {
>  			compatible =3D "snps,dw-apb-uart";
>  			reg =3D <0x05000000 0x400>;
>=20




