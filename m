Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 765F317D2
	for <linux-sunxi@lists.linux.dev>; Wed, 13 Aug 2025 15:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755098899; cv=none; b=ZQyO2xUuuJTNC+ALOE1l7QvUzl5DxMuB9RFth1aPYX3jvosvsmjRvNnkbOeqbmGW6vac9ppEe293MigHgm0UG3bqveWUDsUp/UT4KxPNudbiCt/WVvJX8YjJCd+yN+7ANKdJek1Ib4ejRYOkvSbv34jdkUybaIl2preeR20Oamg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755098899; c=relaxed/simple;
	bh=bjUfZArd1dIc7xzYB2XLMMwVGzBdfmOFwXw1/SOljyM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=P+ASyL2/BCOhUI42TmOtI4OHnNEsVYL2ZxLYkOgUM+zgFrPKpl1A/T1hR0jkDrdF8Sw3UI9EV97RJzPupKYQMIOuDpffW9vspBgNFfsq18CdUutsszfj2+GjUz/h5Ql2UY0QVvz6JbAlFSsPvFTFQxztcg+U777TxjNiZkqDi9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O/xDqjm0; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O/xDqjm0"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3b7886bee77so4819427f8f.0
        for <linux-sunxi@lists.linux.dev>; Wed, 13 Aug 2025 08:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755098896; x=1755703696; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KR4hoVadqu8aUTOVreHxSaRU8mKdTHXFpDokGXEFHMw=;
        b=O/xDqjm0CxbB9CiMNrNLZlrI22+JA0i2Y4UcG2TE4HanSCV9Wkbam7/pCKMuNm3O1L
         Db2TVbh68xvBLAqo7mC8bI9n35FhBtQ9ne08mshDXy1jg8NyKPfFcP2YH2JbrENBfeQg
         b6gZG2FpcnzfkWBqf4/ifEOtQ93t3xvDSq9mknnJQkug+LZXW/2JeDBybW6dtkaT0Nnq
         8OhVndpSm1v4clfEeygnRX7tbXPMb7JjuJSKKw1y18Z+OWvXfjHDmvioKpUxgGpXuuy8
         6sQtGxBLg8SCUpkoiQ6Dd4OgqFXmqbSEtWtGryAucVYmZu+GKPQ0iIMkzBumQTojTCXe
         5qjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755098896; x=1755703696;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KR4hoVadqu8aUTOVreHxSaRU8mKdTHXFpDokGXEFHMw=;
        b=iOP4QOsCnJCX99ZQ8e/Zk+LMcGfI62Rmt75jd9tbrXH4q68MLdsLWsww+fxyVb7w4d
         QcCgWB0zDC7mgujY4msrupmdxRbfkWMwDQaZaWyJT+Czh951ianhMESORaXDcDkfYDkP
         7P5ELTUoMLKZL8cpWzCiump54JiYc/7gkO/7DRuNrvac9cKTUuPQBTwzeqqcoJpvTuMo
         YKZb+3tKiGmwSrFJCEhqCOHgWYa4JaQzvtChue8L3IVEgCNKHZ3/R9f7mrFIgonQdiRR
         o6yHXbEk62cYxJXx4Ztk9XnHvd7mnLKIxAg/LUiMpWkzKv4SZqWxyCES82bbKAF2aFA3
         WlQg==
X-Forwarded-Encrypted: i=1; AJvYcCVSeT1qjx202PON6XCpQIAYA9m8fhyQHN8+z4Sf7Yfd26siLguhcCt4Ud9EB17rCxidlkJ615hSuDjMoA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwmG+Rn2/cWN4ZBycI2gMmNqTCj4vTB4VnAgxLST+ukUnoZPPWk
	Sn9jhsa/oY0hS/TuuL/M4mIl1e+TtKuS5i3l5xAclB9tD77CQrYKJDnf
X-Gm-Gg: ASbGncs8l0adbEcMkCbTIUGW9C2CotT6+3NKcemzcyMJRvjIzZb42XamBUviminPbLd
	D0BKRn1Bdjlo+S3UwsAQpUAVf+Ob0hRr6dhX4Sb0w7B1EDG3i3J7fISp4DVKLY7QHkiyEqaj3Yj
	snzLTqx5Af7ig18m29EAnr89WK/jzJgKG94dKnWcGyc5jt0O30vJutq3OaLLSOH1c7im5XrHB9W
	FnXkVpl6AQETCBdo6SOLaLwa7GUgT9IAfPSZJUGxqpmqzCbwrYHVmvwxz6aXZEVJbXb07orOOYK
	qjJ7hBgDcMHStXpGhyE4Q1aofnUAMx1W/H5r/KKwdC6uD47th8xEPHy2RJaNNHWuTy3N6iRahQ7
	0S9GSgf/723lxODmOScO12YLSW48M8ISwIUx7EL4SCqVHYMFL83+flMQ89FGfT1FoMOeQEj8bEt
	Q02HmpTGk=
X-Google-Smtp-Source: AGHT+IHE0fucbXsrHkFdPEfs8yK736j25+deb3oJqHtDVR3z1PaujgH3AAxRRrD0UXP0szDCxxOwTw==
X-Received: by 2002:a05:6000:22ca:b0:3b8:893f:a184 with SMTP id ffacd0b85a97d-3b917ecd302mr2496485f8f.52.1755098895560;
        Wed, 13 Aug 2025 08:28:15 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c466838sm50661600f8f.49.2025.08.13.08.28.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 08:28:15 -0700 (PDT)
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
 Re: [PATCH net-next v2 10/10] arm64: dts: allwinner: t527: orangepi-4a:
 Enable Ethernet port
Date: Wed, 13 Aug 2025 17:28:13 +0200
Message-ID: <3363827.aeNJFYEL58@jernej-laptop>
In-Reply-To: <20250813145540.2577789-11-wens@kernel.org>
References:
 <20250813145540.2577789-1-wens@kernel.org>
 <20250813145540.2577789-11-wens@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne sreda, 13. avgust 2025 ob 16:55:40 Srednjeevropski poletni =C4=8Das je =
Chen-Yu Tsai napisal(a):
> From: Chen-Yu Tsai <wens@csie.org>
>=20
> On the Orangepi 4A board, the second Ethernet controller, aka the GMAC200,
> is connected to an external Motorcomm YT8531 PHY. The PHY uses an external
> 25MHz crystal, has the SoC's PI15 pin connected to its reset pin, and
> the PI16 pin for its interrupt pin.
>=20
> Enable it.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>=20
> Changes since v1:
> - Switch to generic (tx|rx)-internal-delay-ps properties
> ---
>  .../dts/allwinner/sun55i-t527-orangepi-4a.dts | 23 +++++++++++++++++++
>  1 file changed, 23 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts b/=
arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts
> index d07bb9193b43..b604d961c4fd 100644
> --- a/arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts
> @@ -15,6 +15,7 @@ / {
>  	compatible =3D "xunlong,orangepi-4a", "allwinner,sun55i-t527";
> =20
>  	aliases {
> +		ethernet0 =3D &gmac1;
>  		serial0 =3D &uart0;
>  	};
> =20
> @@ -95,11 +96,33 @@ &ehci1 {
>  	status =3D "okay";
>  };
> =20
> +&gmac1 {
> +	phy-mode =3D "rgmii-id";
> +	phy-handle =3D <&ext_rgmii_phy>;
> +	phy-supply =3D <&reg_cldo4>;
> +
> +	tx-internal-delay-ps =3D <0>;
> +	rx-internal-delay-ps =3D <300>;
> +
> +	status =3D "okay";
> +};
> +
>  &gpu {
>  	mali-supply =3D <&reg_dcdc2>;
>  	status =3D "okay";
>  };
> =20
> +&mdio1 {
> +	ext_rgmii_phy: ethernet-phy@1 {
> +		compatible =3D "ethernet-phy-ieee802.3-c22";
> +		reg =3D <1>;
> +		interrupts-extended =3D <&pio 8 16 IRQ_TYPE_LEVEL_LOW>; /* PI16 */
> +		reset-gpios =3D <&pio 8 15 GPIO_ACTIVE_LOW>; /* PI15 */
> +		reset-assert-us =3D <10000>;
> +		reset-deassert-us =3D <150000>;
> +	};
> +};
> +
>  &mmc0 {
>  	vmmc-supply =3D <&reg_cldo3>;
>  	cd-gpios =3D <&pio 5 6 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>; /* PF6 */
>=20




