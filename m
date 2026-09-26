Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDD92222565;
	Sat, 26 Sep 2026 23:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790466143; cv=none; b=ajuahZmbdCkNvjDFao0oHVBZYiVY+AcyiVDYspRNCtNBarIttvUtLx7hJOHuE/LEqArOxOIlDgOa8ks3fxxTyZMO2waWiV99XdOApDiB8i8wHBDuv3gfxvro3TMGcziSuO4secRYQquf1ALxGSY0JeRiS0rAE6GmTaGYjAv42nQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790466143; c=relaxed/simple;
	bh=87c4I/qWAZLLu3t5dVCs5UN9q/1ox/bcY8Mt1j0+JrI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=OysRpI8pX/skJe3XMk13nZkrcKiKpXo0LNFQS4HsBSYlCKZgOhtHhy+lU2cia5mzgNQT1N6B9S/AuPRoZA/kWL9LfZZ7h38vGIQ4reoMBwqiz/cjzcOl7g3iB1KstIQhGjBsfxrxqX97HSFJ01vsrZFihJfiI0zia/01nFTNKek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RFt74nSz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RFt74nSz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A1E11F000FF;
	Sat, 26 Sep 2026 23:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790466138;
	bh=aIujLp2NhG0hRSOgj2OKjpSjAuPUhYALi0uIUybfA+A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RFt74nSz2xHPyJJS00XTCeJ2Q6ImsQz6mqYEbb/ii98ew5dJsx5dxD+RS/p42Mlx2
	 EJBjpMWG04QQFE6+y+6G1j5fYIRzgfHOuPihEHzlrJXBTyleyUU7W9z6cgrPEMOXBX
	 iFp/VIkR9WPr1rgWT8mlvtZimzx1fT6xxn4yQbFDzW2YQdMA6T8tZDq2YFOZ3x7NLw
	 l0GPwXd1CtJiViu2oiMBl7VpmIQBC8jjA1F9aaD/j9i+Ve7fTjpODnB+AZWcRs6A9r
	 HoQ74OTcsW/D5nIkHn4D6dxQA07qswqSF9Qokm5qTzP/9WYm+YsCA4icU8+vgCCzxD
	 Oynyn4DJa85yA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: allwinner: a523: x96qpro+: enable
 Ethernet support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Andre Przywara" <andre.przywara@arm.com>
Cc: robh@kernel.org, linux-sunxi@lists.linux.dev, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260926232142.5244-3-andre.przywara@arm.com>
References: <20260926232142.5244-1-andre.przywara@arm.com>
 <20260926232142.5244-3-andre.przywara@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 26 Sep 2026 23:42:18 +0000
Message-Id: <20260926234218.8A1E11F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] arm64: dts: misplaced PHY clock and pinctrl prevents PHY initializ=
ation
- [Medium] arm64: dts: incorrect regulator assigned to phy-supply
- [Low] arm64: dts: redundant clocks property in gmac1 node
--

commit 96eb11f77a00f58bb3ba2189cfd9ad8f4d670b8d
Author: Andre Przywara <andre.przywara@arm.com>

arm64: dts: allwinner: a523: x96qpro+: enable Ethernet support

The X96QPro+ TV Box features a Gigabit Ethernet capable port, which is
driven by the secondary EMAC, and supported by a Maxio MAE0621A PHY.
This commit adds the required devicetree nodes to enable that port.

> diff --git a/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts b/arc=
h/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts
> index eb9fd0a65b41c..8015473ecb7ae 100644
> --- a/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts
[ ... ]
> @@ -72,11 +73,38 @@ &ehci1 {
>  	status =3D "okay";
>  };
> =20
> +&gmac1 {
> +	clocks =3D <&ccu CLK_BUS_EMAC1>, <&ccu CLK_MBUS_EMAC1>;

[Severity: Low]
Are these clock definitions needed here? It looks like they exactly
duplicate the clocks property already defined for gmac1 in the base
sun55i-a523.dtsi without changing the values.

> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&rgmii1_pins>;
> +	phy-mode =3D "rgmii-id";
> +	phy-handle =3D <&ext_rgmii_phy>;
> +	phy-supply =3D <&reg_cldo3>;

[Severity: Medium]
Should this use reg_cldo4 instead of reg_cldo3?

Other sibling A523 boards use reg_cldo4 for gmac1, and reg_cldo4 is
explicitly named vcc-eth-phy in the PMIC definitions. If reg_cldo4 is
the actual PHY power rail, it will be disabled late in the boot process
by the regulator core since it is unreferenced, which would cause the PHY
to lose power.

> +
> +	tx-internal-delay-ps =3D <200>;
> +	rx-internal-delay-ps =3D <500>;
> +
> +	status =3D "okay";
> +};
> +
[ ... ]
> +&mdio1 {
> +	ext_rgmii_phy: ethernet-phy@1 {
> +		compatible =3D "ethernet-phy-id7b74.4411";
> +		reg =3D <1>;
> +		clocks =3D <&ccu CLK_EMAC1_25M>;

[Severity: High]
Since there is no specific Maxio MAE0621A PHY driver, won't this PHY
bind to the generic PHY driver (genphy) which does not parse or enable
clocks?

If so, the 25MHz reference clock will never be enabled by the kernel,
which would prevent the Ethernet PHY from initializing.

> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&ephy1_25m_pin>;
> +		reset-gpios =3D <&pio 9 16 GPIO_ACTIVE_LOW>;

[Severity: High]
Does placing the pinctrl here alongside the reset-gpios cause the hardware
reset to execute before the clock pin is muxed?

The MDIO bus core (mdiobus_register_device()) pulses reset-gpios before
device_add() and driver binding. Because pinctrl is applied during driver
probe, the reset is pulsed before the clock pin is muxed and active, meaning
the PHY undergoes hardware reset without its clock running.

Could this leave the PHY in an undefined state?

> +		reset-assert-us =3D <10000>;
> +		reset-deassert-us =3D <150000>;
> +	};
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260926232142.5244=
-1-andre.przywara@arm.com?part=3D2
