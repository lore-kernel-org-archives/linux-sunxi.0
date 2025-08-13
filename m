Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC216238142
	for <linux-sunxi@lists.linux.dev>; Wed, 13 Aug 2025 15:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755098832; cv=none; b=EcderNlvdb382lU+hlYKVIPXUdjuixnQJ65gyIrcw95taizlDBrLZsAU4AC9xczJ3g7j2Fi2JvqJZGcP0Fgi5QLltNu3AA6rEzSKlVwtjQffueGpY64XnTxa60avPZ6ZwnSLOGV+RWUiGPqYgG7gkflLTlRuWXXW+i9hyT6qs2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755098832; c=relaxed/simple;
	bh=alzjLEe2fEl8rrt5jUx+xc9uy3t9RY8ZhInQDMnJePA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KGefHnZhOOXQu2lMl73rgeciOxKBnOiV9h2iIPdDf/W0ct65UhkrP5nVGYrQZiwlXOQCVI5tFQBP2GtfsZhlVe7sLTxa9zuGYKuj+XYMgJ/cIU+5ykBK983UF5TraRGLYcVf5unugjzw2SP1JWejSnhoMPdoqahYTLDnX8yAzDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TNDChBc2; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TNDChBc2"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-458bf6d69e4so60658975e9.2
        for <linux-sunxi@lists.linux.dev>; Wed, 13 Aug 2025 08:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755098829; x=1755703629; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LZIyAAVxGkCRQr9BUYAZ8nPgNM4Ndhfq5a5jE1scOa0=;
        b=TNDChBc2R8z06laga27b27eFQExnUKFmyprQ5HDsK4xGLq5QeODzWWpP5BIjpy1kBi
         8F5524/eAvxHMacBtH8xsMyQj/L0JQFd6cwM+vH1dOV4oHf1GftWOzGhxeGYUs6OqC0m
         xGFU+p7pTrQYZMIEAuD2kVxqbtPwUaIb09MIG8FW0jsEdoKdaDlWdQXOLdIQIxgS9Pbm
         pV23qbmJNcs0Z5IXmyVZbX66fBm4BxUyAt9FJYGkzs5jUgtZCNfaAQQoHMshAs77AzsF
         SF6CmDlVJjTp8Tq4NrD/nJKK4kOh7uadBEIuqMmcGg/f0b7xj5D1b/at5RaEZJdKJKy8
         FK6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755098829; x=1755703629;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LZIyAAVxGkCRQr9BUYAZ8nPgNM4Ndhfq5a5jE1scOa0=;
        b=Lz6z3xzkkOm/nKkntmQ5olnHcgvFUfmKnfe2q/kl+NOp1CIpkJeU0d0ue0De/3N+fk
         idsICsm3XlyLIhINvbg7woycA7kdvkerF+PGu9rUj++YiAVO60wtKiyOSezw9j45u52L
         49R9l3HTm5BF4It+EBR7YJOOcidvoxcGVAHP23bngOyZ9iu62maSnR5gNkEOr20ocfQz
         9sHFGpEAISzQ4YMsF6yhDGrFmNUpjqOyM1c7/qL0Lp06cw17z4/lbHCpIH2LWbnpDYS1
         l2VSccbq0ss3IjD626rTu5hr4FJTE4ndzO9wbhTYDUHJHIdk8hIg7I9x1c7E4x4sgOmL
         PNcQ==
X-Forwarded-Encrypted: i=1; AJvYcCXBmEyfxbVh72WlC3w3ZyOWCyYgZXRgu+12D/a2c7mPsXv6UIhSB1qN3gFjzwcswtfOBbS5FQcL8dukKA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz620KeXyiSeZ2WvEQ6YnveYanoZhrWSrGa/HeUDMEP03+nBZ1w
	1Go/BB2TyPHHz2t9mfDpuYExaBxElNdTliz95OcX+sxHaB8gm8ivojlB
X-Gm-Gg: ASbGncsVMJq68VY8PecJy+RJOZQ48vnjqqUQN4HR6BUqkZivqEuQ6Li1S897277YYLr
	q6iX1ozM8kPuWpJ/alwnP1SZd5TSLpzWwgiKF0VDryjA+r+AuAC+/08pfu3M+WDGsvlIReieGTe
	K5VAPgLXQC2o9SFepf5jlcIKQARfFEuNjenO0q9Zv4J+GEqrF+VC77mL7KXiRXlvSm8RiVjnH5p
	Kb4qAoa62kg4pMxcf1UVZx2lTtUCZ7D1yopXP4SQeC+sOO1Rzj9wEx1brj6DtM1w7ZXpHNlVRw/
	MiUCLbj/0DX/ipzxmbWv7leuhyA2VkbNwgR3C6v/mw/cDjo8NvUrs1EDKxHujm8vDqAQoq/x2OH
	VzWQv+v975CDYQLqxdIrTupEZY/y/5jQ5Spe2wShTc+G0D9mw5iTKsfRyjLSotrufar6KlV+Dld
	mmJYF/WZHj
X-Google-Smtp-Source: AGHT+IEX4BDNa5mzqwSGmhUw6KuEqvUFZNcO+D5WjOPXTrwn2jJiUF7/1VKfEyNQ34hedf4mE52tig==
X-Received: by 2002:a05:600c:5254:b0:459:ddad:a3bd with SMTP id 5b1f17b1804b1-45a165d4d2emr30205835e9.15.1755098829053;
        Wed, 13 Aug 2025 08:27:09 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1a509b9bsm6560505e9.6.2025.08.13.08.27.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 08:27:08 -0700 (PDT)
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
 Re: [PATCH net-next v2 07/10] arm64: dts: allwinner: a527: cubie-a5e: Enable
 second Ethernet port
Date: Wed, 13 Aug 2025 17:27:06 +0200
Message-ID: <2376533.ElGaqSPkdT@jernej-laptop>
In-Reply-To: <20250813145540.2577789-8-wens@kernel.org>
References:
 <20250813145540.2577789-1-wens@kernel.org>
 <20250813145540.2577789-8-wens@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne sreda, 13. avgust 2025 ob 16:55:37 Srednjeevropski poletni =C4=8Das je =
Chen-Yu Tsai napisal(a):
> From: Chen-Yu Tsai <wens@csie.org>
>=20
> On the Radxa Cubie A5E board, the second Ethernet controller, aka the
> GMAC200, is connected to a second external Maxio MAE0621A PHY. The PHY
> uses an external 25MHz crystal, and has the SoC's PJ16 pin connected to
> its reset pin.
>=20
> Enable the second Ethernet port. Also fix up the label for the existing
> external PHY connected to the first Ethernet port. An enable delay for the
> PHY supply regulator is added to make sure the PHY's internal regulators
> are fully powered and the PHY is operational.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>=20
> Changes since v1:
> - Switch to generic (tx|rx)-internal-delay-ps properties
> - Add PHY regulator delay
> ---
>  .../dts/allwinner/sun55i-a527-cubie-a5e.dts   | 28 +++++++++++++++++--
>  1 file changed, 26 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts b/ar=
ch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts
> index d4cee2222104..e96a419faf21 100644
> --- a/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts
> @@ -14,6 +14,7 @@ / {
> =20
>  	aliases {
>  		ethernet0 =3D &gmac0;
> +		ethernet1 =3D &gmac1;
>  		serial0 =3D &uart0;
>  	};
> =20
> @@ -76,7 +77,7 @@ &ehci1 {
> =20
>  &gmac0 {
>  	phy-mode =3D "rgmii-id";
> -	phy-handle =3D <&ext_rgmii_phy>;
> +	phy-handle =3D <&ext_rgmii0_phy>;
>  	phy-supply =3D <&reg_cldo3>;
> =20
>  	allwinner,tx-delay-ps =3D <300>;
> @@ -85,13 +86,24 @@ &gmac0 {
>  	status =3D "okay";
>  };
> =20
> +&gmac1 {
> +	phy-mode =3D "rgmii-id";
> +	phy-handle =3D <&ext_rgmii1_phy>;
> +	phy-supply =3D <&reg_cldo4>;
> +
> +	tx-internal-delay-ps =3D <300>;
> +	rx-internal-delay-ps =3D <400>;
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
> @@ -100,6 +112,16 @@ ext_rgmii_phy: ethernet-phy@1 {
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
> @@ -240,6 +262,8 @@ reg_cldo4: cldo4 {
>  				regulator-min-microvolt =3D <3300000>;
>  				regulator-max-microvolt =3D <3300000>;
>  				regulator-name =3D "vcc-pj-phy";
> +				/* enough time for the PHY to fully power on */
> +				regulator-enable-ramp-delay =3D <150000>;
>  			};
> =20
>  			reg_cpusldo: cpusldo {
>=20




