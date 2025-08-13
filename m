Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E98B4235362
	for <linux-sunxi@lists.linux.dev>; Wed, 13 Aug 2025 15:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755098782; cv=none; b=JBarrtUuZDllOfLiuvMYHd5D706vsWKFf1/CvmBOLh0bsy3U53YLYS5WUcdRwwhTe51BcC0J7tfSJ3yZSdiCqs4KmuvtFsXMVZSCteTf9oFZFikigIoPt+K5HFvFnHCQBcBzr+qXtrC4zMWg/kY2er9cjsxU9WylKUh2mpAtU/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755098782; c=relaxed/simple;
	bh=T9ew6vV7It536VuL2qh0FYOmync27BJ+NqE+bgI6NO4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bxeJDHNU9yO85QB5yrw9AHUVqQehKCsG6Eoiynr1mS6or0wlI83KpvmwZDcRVekB/E2r9/UVRHwRm1dbuQh2yS6OnkG7O7I7n2+orVSCvl5+8CigYl0ZEB+Cl5uIRzDxacVJ98fYeVycFOTzYYqeAdGO3svWbY0RGeFgGADtJCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kGuq4iBX; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kGuq4iBX"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-459ddf8acf1so56971085e9.0
        for <linux-sunxi@lists.linux.dev>; Wed, 13 Aug 2025 08:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755098778; x=1755703578; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bHmzj/owjBnWQXccQqjtqoeZzUsvFVlqZRdyc+4n9B0=;
        b=kGuq4iBXJsK5/omKLtlwfcnUpEY9qV/vyU8Tx8RkjN5UxI3VDRuxBEynk4mP7H8hRG
         qJYbf3cowC35ne+ApdhAzY+Ffhb2hvDCLjGEmUp5mCMWu3YWqaC96IDpH4/erWNPHpHc
         HfZpHwGbbSq0XPNlhTxX1rBXVgHzr2BQuUIQ0mT+o/Wfp6EDeNqc1FiTQSkyX8Kbx+BH
         mADbmCMBwfOLhypuaYW9VtqyRKZpJ9KA/TUK/9dcrzAcneXLRWrsMDCzNjHZ6MjN5R4+
         iYCvyJlB62ghwxmp+KCsUqgIjO378Q6+l6H60A5gjBuW/w49FomhL4TU29lKFY18iG8/
         vApg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755098778; x=1755703578;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bHmzj/owjBnWQXccQqjtqoeZzUsvFVlqZRdyc+4n9B0=;
        b=cMtUm53OsjDxI1wG4izLI5CmDXME36Uu2HoZ/AbDI7mCbCP48121K3LKDvVZqEHjtS
         rHBx1gQXHpeQICfO4fg1GT4NO/jcUtJDJOo2pNrv1a+u3XaE+WRzOm9eLtfmO00T3z47
         A92PbTww6VpOHm6/iAD3y1qkkcvDgB4ZMVgVnSHO4j4zwEPPTj36ySnh6/5BCjrDcTIW
         ocdm/lJ1ZWuKSFFHfwNZ5LvsZDmDLSx2XDrHjfKSHotdOWfTCjAW1vDXpwPvAtVhLm2y
         mTA/EL5D3jwVKInIm5wOmvnkX9WHkM/gN6R+8EUnKlGjIJ+zR+DPmst/QuczkwxSMGl0
         2E0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUCf2GD9QGAUr9QdOyhMM9Vi2/3XlJFGrW8gRcGSfE0COzZIr/z/fXgZVL4zOBEzbY8fulw13pKQa9ZLQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YykIfJsH0orGUL8LYByMoF2LCBcFUbkBzfMqOdszf0UxtBXuFsd
	YB3Tq9kBYg/K3xI65hy5CVWB9b0salsu5lGDnYfD+C+t9J0GM/R4k6tp
X-Gm-Gg: ASbGncubl5GDFRIn2qiFAD/Qu0xqHCfa2RhioIThc76DYuxiFfKbFrPm4eH6bZqXK+q
	mTitQ4XUUHnLwu9WYVXOOJyHe4t9hoE9U9fyxTPXpAigR5g2WF4Cfl58BROqDre1/EsBtS9PlCS
	W/haznyZml75zMHrHCjem+kie/xkLhL19X7A5TA0d/2QHTNZcOZFHhYlbmjcAiPxejHDGrlEai5
	iFZCuHUZHnUm53XhPicZlJCVhhRyJY5i8Zv0tM1p2OmZBZelCKV/zc3Xeg6Heo+ziUtJ//+atqz
	+CLi4g3fAmoO4o3deNbh6Y2i/tBQV6f54n7GPCeSznHpSlj+KQanNLs8YyWgQkHkRquq1nCudOx
	dJIu8yj+02Fq01oH1J5wuvHdpWfvu+CUx6aMrkBsMrgm8ppdqrAN0JrcI9s1QI25mWbAOoxxFch
	Z0uQ8m1wFQ
X-Google-Smtp-Source: AGHT+IHUC2ftwzSvSylSdT06ajBela8u5SU+ijYkDLGHo9/q750n74l021ps+CiYV2OdEDDglYn8Pw==
X-Received: by 2002:a05:600c:19cf:b0:458:bfe1:4a91 with SMTP id 5b1f17b1804b1-45a166350a2mr28993085e9.20.1755098778076;
        Wed, 13 Aug 2025 08:26:18 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1a50b99bsm6611325e9.5.2025.08.13.08.26.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 08:26:17 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Chen-Yu Tsai <wens@kernel.org>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Andre Przywara <andre.przywara@arm.com>
Subject:
 Re: [PATCH net-next v2 05/10] arm64: dts: allwinner: a523: Add GMAC200
 ethernet controller
Date: Wed, 13 Aug 2025 17:26:15 +0200
Message-ID: <5030505.31r3eYUQgx@jernej-laptop>
In-Reply-To: <20250813145540.2577789-6-wens@kernel.org>
References:
 <20250813145540.2577789-1-wens@kernel.org>
 <20250813145540.2577789-6-wens@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne sreda, 13. avgust 2025 ob 16:55:35 Srednjeevropski poletni =C4=8Das je =
Chen-Yu Tsai napisal(a):
> From: Chen-Yu Tsai <wens@csie.org>
>=20
> The A523 SoC family has a second ethernet controller, called the
> GMAC200. It is not exposed on all the SoCs in the family.
>=20
> Add a device node for it. All the hardware specific settings are from
> the vendor BSP.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>=20
> Changes since v1:
> - Fixed typo in tx-queues-config
> ---
>  .../arm64/boot/dts/allwinner/sun55i-a523.dtsi | 55 +++++++++++++++++++
>  1 file changed, 55 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/=
boot/dts/allwinner/sun55i-a523.dtsi
> index 6b6f2296bdff..449bcafbddcd 100644
> --- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> @@ -180,6 +180,16 @@ rgmii0_pins: rgmii0-pins {
>  				bias-disable;
>  			};
> =20
> +			rgmii1_pins: rgmii1-pins {
> +				pins =3D "PJ0", "PJ1", "PJ2", "PJ3", "PJ4",
> +				       "PJ5", "PJ6", "PJ7", "PJ8", "PJ9",
> +				       "PJ11", "PJ12", "PJ13", "PJ14", "PJ15";
> +				allwinner,pinmux =3D <5>;
> +				function =3D "gmac1";
> +				drive-strength =3D <40>;
> +				bias-disable;
> +			};
> +
>  			uart0_pb_pins: uart0-pb-pins {
>  				pins =3D "PB9", "PB10";
>  				allwinner,pinmux =3D <2>;
> @@ -601,6 +611,51 @@ mdio0: mdio {
>  			};
>  		};
> =20
> +		gmac1: ethernet@4510000 {
> +			compatible =3D "allwinner,sun55i-a523-gmac200",
> +				     "snps,dwmac-4.20a";
> +			reg =3D <0x04510000 0x10000>;
> +			clocks =3D <&ccu CLK_BUS_EMAC1>, <&ccu CLK_MBUS_EMAC1>;
> +			clock-names =3D "stmmaceth", "mbus";
> +			resets =3D <&ccu RST_BUS_EMAC1>;
> +			reset-names =3D "stmmaceth";
> +			interrupts =3D <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names =3D "macirq";
> +			pinctrl-names =3D "default";
> +			pinctrl-0 =3D <&rgmii1_pins>;
> +			power-domains =3D <&pck600 PD_VO1>;
> +			syscon =3D <&syscon>;
> +			snps,fixed-burst;
> +			snps,axi-config =3D <&gmac1_stmmac_axi_setup>;
> +			snps,mtl-rx-config =3D <&gmac1_mtl_rx_setup>;
> +			snps,mtl-tx-config =3D <&gmac1_mtl_tx_setup>;
> +			status =3D "disabled";
> +
> +			mdio1: mdio {
> +				compatible =3D "snps,dwmac-mdio";
> +				#address-cells =3D <1>;
> +				#size-cells =3D <0>;
> +			};
> +
> +			gmac1_mtl_rx_setup: rx-queues-config {
> +				snps,rx-queues-to-use =3D <1>;
> +
> +				queue0 {};
> +			};
> +
> +			gmac1_stmmac_axi_setup: stmmac-axi-config {
> +				snps,wr_osr_lmt =3D <0xf>;
> +				snps,rd_osr_lmt =3D <0xf>;
> +				snps,blen =3D <256 128 64 32 16 8 4>;
> +			};
> +
> +			gmac1_mtl_tx_setup: tx-queues-config {
> +				snps,tx-queues-to-use =3D <1>;
> +
> +				queue0 {};
> +			};
> +		};
> +
>  		ppu: power-controller@7001400 {
>  			compatible =3D "allwinner,sun55i-a523-ppu";
>  			reg =3D <0x07001400 0x400>;
>=20




