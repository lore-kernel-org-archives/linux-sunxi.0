Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FCD6237707
	for <linux-sunxi@lists.linux.dev>; Wed, 13 Aug 2025 15:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755098884; cv=none; b=mEa20u7hHgEugnbovzp/Vo6MYQxhkgse4r4IuLDB+yrd0BPJhIPeA4PymMJ+sGd32VMMqtUS6CT5pKRhO5+oA7u1uUwEIXxpYLOl5pA+UvViwJ4IroSIrGhX0TcadjMkw7TXIeNjOUK8HmMb8FMne9i4Xy3dI/0V5YxQkF+zM7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755098884; c=relaxed/simple;
	bh=CP8upqvVtn9Z3m5+ff43o5AJYwx/FwOQd/acka/t9P4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=I2vPycotmAxSRxJ9e2Lhq5K2CG9Ts8ahBhu0yMqyY/CQa8xBQQ9XJyu8IN43bCIOGy3TsopzAjsnHaTJ0BbKtAsJxmjEX/N/5uftSNKI3GOyRYh2yR5UorJJDyrYTVFx9XugGbwS7GBt3BBawu8fmYc5yZhIFkL2kL/8AOlIOME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FBFUGeTl; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FBFUGeTl"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-458b885d6eeso43914045e9.3
        for <linux-sunxi@lists.linux.dev>; Wed, 13 Aug 2025 08:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755098881; x=1755703681; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9dCXGQ3wCen5hO/RhZ9y8kY2psIxwBZyCJWwI1Ahh5o=;
        b=FBFUGeTlorneS0Jf/xrSHa9WSOTSq3E3qXF9laWvDFVy7/E7qOGdvenb/ilo99Wk0l
         oAy/uBYjQRTWX8UVC6GBfWttVezVmuC512oNA/oqJzfSi2EpPPihtp1SxYsEVTgL38XK
         UCU12e+gudJOJGtsGkarhEy/TGXRyuhIpZLC5Rx3MinpPB77ZWAxWMrpO4uXVDsF6aR8
         RInc3XrmnIveIQyYdLKRfBWsxv3IVSNU7ZpL6yp9sWiK5pdlGnvSa7yCQrlToeeUKjXN
         8+0tNHzJNeHVGtF0jLYX4EpWA+Sty7G6r89O8YnDP8PkbTXlUn/mZVVXO4w/YpJD9Nc3
         i32Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755098881; x=1755703681;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9dCXGQ3wCen5hO/RhZ9y8kY2psIxwBZyCJWwI1Ahh5o=;
        b=NqDYEGr7O/oAEVFsLEmqhXfUs2LObzTSvUMj8bTLi8grChZGbe2ORH7LVh0P6+Stj5
         9YGJpW9sjrq1tTR7C6OERcGNiRvpEeXJXdlQSVCmc+22mw9wdDA/vv8ZJJ/drWxER93y
         kdWusWpPCQ9V4qOyV90a/9OcmMDLSR3UnAOmxC8HtVrQMEtrJp7GoUSGDKyw8woQRbCk
         IfE6ARMwlZNKQkbhCk9YHjOJHapjuxa4wCtpboU7MNsp8QTo+BfR5j+QeFipNRVZ4Equ
         C+8F97RabHu8CVnm301i3UNMG6q64ryD5oeaT/0IycOvyFwiLJGbKWat0ObKq+BLv360
         l76g==
X-Forwarded-Encrypted: i=1; AJvYcCUB2xPyI14XExj3L6PCDmhVwyE79Czzl1cKL6v7lzGWAA4SsdCVwz1NC3RVCCMD3yMyllPDogUxoOKWPQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywg5rGnEAxjLLML7++wN4qgot34mI1h5RCZVrpQLlWFa2xMOFKB
	T7TlKm4Y08f33Y9ao8nQBl6ZyNcjHORAVYTD0yTAMXOT60I2snGtEeC6
X-Gm-Gg: ASbGnctUqMD46310VVFQFPTPIEIUYq8CNbrleF6nyA7JabxHMl8jJO+AyApKHGWDyUL
	BPsRy2NyIPfUU43mT47IzANcA50O9c4hDcLpesU7y7d684sTewuF1lVvClW1qPpWiqiokAiWWvJ
	B1Ua56/5BWiZUcTHszpvjjE5O1vpxB/A6FBbVYhCV1kPFCWNA2IaZVvYsp/tOTaccWaKuXjGUt0
	cA0Gv/Vlf9XzLCtfM8C3YsOeKjb6o9rC7XdkLZxw4ZfOW6CUzxDdrQzDaNtgycMj7NBUQj8ENbS
	wmO5AQlHF6jkMy7Nu6id2ck35BwD0sUyVDlpERTaYSLLlA5y/B8makUaNmhkC6rP21msiPcQKT9
	EsdQ2BJcbhlxKNetsMBcQJuPRvcX4jCmFLRCvU4/5+8MWjroDC8VN6Tixe593fg5hNZgztKF0df
	D4j/f4lUvR
X-Google-Smtp-Source: AGHT+IGvCYpe77xXC4O8RNzirUxA7cMzbuFpGjarjyQuF4h4e0X7kLLiXN7Oa7TmkKyvCs586LY0fA==
X-Received: by 2002:a05:6000:2dc8:b0:3b8:d955:c598 with SMTP id ffacd0b85a97d-3b917e90664mr2385608f8f.30.1755098880683;
        Wed, 13 Aug 2025 08:28:00 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1a53905asm6336365e9.22.2025.08.13.08.27.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 08:28:00 -0700 (PDT)
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
 Re: [PATCH net-next v2 09/10] arm64: dts: allwinner: t527: avaota-a1: enable
 second Ethernet port
Date: Wed, 13 Aug 2025 17:27:58 +0200
Message-ID: <13821245.uLZWGnKmhe@jernej-laptop>
In-Reply-To: <20250813145540.2577789-10-wens@kernel.org>
References:
 <20250813145540.2577789-1-wens@kernel.org>
 <20250813145540.2577789-10-wens@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne sreda, 13. avgust 2025 ob 16:55:39 Srednjeevropski poletni =C4=8Das je =
Chen-Yu Tsai napisal(a):
> From: Chen-Yu Tsai <wens@csie.org>
>=20
> On the Avaota A1 board, the second Ethernet controller, aka the GMAC200,
> is connected to a second external RTL8211F-CG PHY. The PHY uses an
> external 25MHz crystal, and has the SoC's PJ16 pin connected to its
> reset pin.
>=20
> Enable the second Ethernet port. Also fix up the label for the existing
> external PHY connected to the first Ethernet port.
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
>  .../dts/allwinner/sun55i-t527-avaota-a1.dts   | 26 +++++++++++++++++--
>  1 file changed, 24 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts b/ar=
ch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
> index e7713678208d..f540965ffaa4 100644
> --- a/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
> @@ -13,6 +13,7 @@ / {
> =20
>  	aliases {
>  		ethernet0 =3D &gmac0;
> +		ethernet1 =3D &gmac1;
>  		serial0 =3D &uart0;
>  	};
> =20
> @@ -67,7 +68,7 @@ &ehci1 {
> =20
>  &gmac0 {
>  	phy-mode =3D "rgmii-id";
> -	phy-handle =3D <&ext_rgmii_phy>;
> +	phy-handle =3D <&ext_rgmii0_phy>;
>  	phy-supply =3D <&reg_dcdc4>;
> =20
>  	allwinner,tx-delay-ps =3D <100>;
> @@ -76,13 +77,24 @@ &gmac0 {
>  	status =3D "okay";
>  };
> =20
> +&gmac1 {
> +	phy-mode =3D "rgmii-id";
> +	phy-handle =3D <&ext_rgmii1_phy>;
> +	phy-supply =3D <&reg_dcdc4>;
> +
> +	tx-internal-delay-ps =3D <100>;
> +	rx-internal-delay-ps =3D <100>;
> +
> +	status =3D "okay";
> +};
> +
>  &gpu {
>  	mali-supply =3D <&reg_dcdc2>;
>  	status =3D "okay";
>  };
> =20
>  &mdio0 {
> -	ext_rgmii_phy: ethernet-phy@1 {
> +	ext_rgmii0_phy: ethernet-phy@1 {
>  		compatible =3D "ethernet-phy-ieee802.3-c22";
>  		reg =3D <1>;
>  		reset-gpios =3D <&pio 7 8 GPIO_ACTIVE_LOW>; /* PH8 */
> @@ -91,6 +103,16 @@ ext_rgmii_phy: ethernet-phy@1 {
>  	};
>  };
> =20
> +&mdio1 {
> +	ext_rgmii1_phy: ethernet-phy@1 {
> +		compatible =3D "ethernet-phy-ieee802.3-c22";
> +		reg =3D <1>;
> +		reset-gpios =3D <&pio 9 16 GPIO_ACTIVE_LOW>; /* PJ16 */
> +		reset-assert-us =3D <10000>;
> +		reset-deassert-us =3D <150000>;
> +	};
> +};
> +
>  &mmc0 {
>  	vmmc-supply =3D <&reg_cldo3>;
>  	cd-gpios =3D <&pio 5 6 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>; /* PF6 */
>=20




