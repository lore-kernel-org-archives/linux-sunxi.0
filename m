Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792650080;
	b=XIa4rXcZIYYfDifE+Wn3KhBTgNpvKSSJYF+JTfKGIBiuYouaYg16KhXKnmhLOA1lL4Ew
	 J0xo7SNXqdWC/c6tTgQPd1twUSE+qvD/Zh8BNFTxSKPqSEmLkUKB7hsl5S5zngVZAKjlf
	 T2Ypg3pjiVPhv7yxp4fYfd895XWYLJondROK9kxiTKpSIQG3XhkhG63YUdd5dQJ+LN2pK
	 zoXh9FRm9QTslpgAjSHtAaHQbLxxQHnJAy7mGHT/e7QvtP0j6Gz8NIe8GfQ9sFO9uD1Cu
	 L6G28Zlcsmqu7a00jk0wwTzsz/i9/2xIXhsdsCrcXdkuN3EArAleyYGb7vXvmzbz15Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792650080;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=kLoT6phYi/A+cLNwU4p9qS9UyNpDJ712B+SXizxIHc0=;
	b=XzT73xpBiSZXUBHKHVFFAW33wdbXT7sBKLJmLoHjia5WpyoH42fNsYhcEmIWTodp+3is
	 kLyq81SdpJnkhDSsufMFco3MPop2Ei247OnBuBIYP72EnKnB46DuYLskjgyDt4hEV2Tld
	 cqZ79K0Roh6R85qJqvyAMKsljU1CaHG5gBRWZ/JpUZvkeTQimdUaXWRwiQceJzA+7EIxh
	 L+nmB3yRv2pLNSJ7slqG/PSm9zu77IqPSqkez/rFqkX/1HwdmfC0Jf9UqNwSknYZrTa8/
	 hkoaSthuDBOV+mFUMOTmyZqtPRilRKiaYNPbBHP7Gpt+vudwxD3SRaWpFp7TpDCBMOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P4Lfhhap;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E206A606A319;
	Thu, 22 Oct 2026 06:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P4Lfhhap
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FC841F000C1;
	Thu, 22 Oct 2026 06:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792650079;
	bh=kLoT6phYi/A+cLNwU4p9qS9UyNpDJ712B+SXizxIHc0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=P4Lfhhap0InRwKsCs0/dkg1EyfULyHn9OIBtWgvqdwGGsRbP35VwBxUMtusts7Q24
	 a0KI9Q7y8yy8IshZgAdMXx/MSAzjEh10l5rcmOSX0E/1SApLeF0MTYJr4z4Gy4h5Ur
	 LC3vUdkYSbjuhEBBbaJsN4YYtTx42ag5gGJSgg7+5Dojd8r9sr372vWNnJmdar+gCI
	 cSQqY6fxEY/zSNlYzfE5c0X2+shq5Cs+a5eHjOpldmev2l5m9205gD7twxQDo287QT
	 1Wyu/yvZVPuuLqGl2IbBgkQe8dXXzchWXD27+XGb/i68h8TOubDV4lFNXkIHcby9F/
	 OaLL4WWRZs8CA==
Message-ID: <sashiko-outbox-181088@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: allwinner: h6: Add Orange Pi 3 LTS
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cristian Filipescu" <filipescu.cristian@gmail.com>, linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261022-sunxi-orangepi-3-lts-v2-2-70b899252c6a@gmail.com>
References: <20261022-sunxi-orangepi-3-lts-v2-0-70b899252c6a@gmail.com>
 <20261022-sunxi-orangepi-3-lts-v2-2-70b899252c6a@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Oct 2026 06:21:18 +0000
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] arm64: dts: allwinner: per-PHY reset-gpios and c22 compatible brea=
k YT8531C
- [Medium] arm64: dts: allwinner: orangepi-3-lts: swapped LED default-state=
 values
--

commit e75611867d87d079b20765ad9c1ddf5482d2d71a
Author: Jernej Skrabec <jernej.skrabec@gmail.com>

arm64: dts: allwinner: h6: Add Orange Pi 3 LTS

This commit adds a device tree for the Allwinner H6-based Orange Pi 3 LTS
board, describing its regulators, storage, wireless module, LEDs, USB ports,
HDMI, and Motorcomm YT8531C Gigabit Ethernet PHY.

Link: https://lore.kernel.org/linux-sunxi/20250413134318.66681-3-jernej.skr=
abec@gmail.com/

> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3-lts.dts b=
/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3-lts.dts
> new file mode 100644
> index 0000000000000..e6aa0b2e17ebe
> --- /dev/null
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3-lts.dts
[ ... ]
> +	leds {
> +		compatible =3D "gpio-leds";
> +
> +		led-0 {
> +			function =3D LED_FUNCTION_STATUS;
> +			color =3D <LED_COLOR_ID_RED>;
> +			gpios =3D <&r_pio 0 4 GPIO_ACTIVE_HIGH>; /* PL4 */
> +			default-state =3D "on";
> +		};
> +
> +		led-1 {
> +			function =3D LED_FUNCTION_POWER;
> +			color =3D <LED_COLOR_ID_GREEN>;
> +			gpios =3D <&r_pio 0 7 GPIO_ACTIVE_HIGH>; /* PL7 */
> +			default-state =3D "off";
> +		};
> +	};

[Severity: Medium]
The commit message notes that the green PL7 LED is used as the power
indicator. When gpio_led_probe() -> create_gpio_led() in
drivers/leds/leds-gpio.c parses the leds node, led-0 (red PL4,
LED_FUNCTION_STATUS) is turned on and led-1 (green PL7, LED_FUNCTION_POWER)
is turned off.

When the LED functions were swapped relative to sun50i-h6-orangepi-3.dts,
were the default-state values on led-0 and led-1 accidentally left unswappe=
d?

> +
> +	reg_gmac_3v3: gmac-3v3 {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "gmac-3v3";
> +		vin-supply =3D <&reg_vcc5v>;
> +		regulator-min-microvolt =3D <3300000>;
> +		regulator-max-microvolt =3D <3300000>;
> +		startup-delay-us =3D <150000>;
> +		enable-active-high;
> +		gpio =3D <&pio 3 6 GPIO_ACTIVE_HIGH>; /* PD6 */
> +	};
[ ... ]
> +&mdio {
> +	ext_rgmii_phy: ethernet-phy@1 {
> +		compatible =3D "ethernet-phy-ieee802.3-c22";
> +		reg =3D <1>;
> +
> +		motorcomm,clk-out-frequency-hz =3D <125000000>;
> +		rx-internal-delay-ps =3D <1950>;
> +		tx-internal-delay-ps =3D <1950>;
> +
> +		reset-gpios =3D <&pio 3 14 GPIO_ACTIVE_LOW>; /* PD14 */
> +		reset-assert-us =3D <15000>;
> +		reset-deassert-us =3D <100000>;
> +	};
> +};

[Severity: High]
Will the YT8531C PHY fail to probe or lose its 125 MHz clock output with
compatible =3D "ethernet-phy-ieee802.3-c22" and reset-gpios placed on the
ethernet-phy@1 node?

First, during MDIO bus registration:

  sun8i_dwmac_init()
    regulator_enable(gmac->regulator) /* enables reg_gmac_3v3 (PD6) */
  stmmac_mdio_register()
    of_mdiobus_register()
      __of_mdiobus_parse_phys()
        fwnode_mdiobus_register_phy()

In drivers/net/mdio/fwnode_mdio.c:fwnode_mdiobus_register_phy():

	is_c45 =3D fwnode_device_is_compatible(child, "ethernet-phy-ieee802.3-c45"=
);
	if (is_c45 || fwnode_get_phy_id(child, &phy_id))
		phy =3D get_phy_device(bus, addr, is_c45);
	else
		phy =3D phy_device_create(bus, addr, phy_id, 0, NULL);
	if (IS_ERR(phy)) {
		rc =3D PTR_ERR(phy);
		goto clean_mii_ts;
	}
	...
	} else if (is_of_node(child)) {
		rc =3D fwnode_mdiobus_phy_device_register(bus, phy, child, addr);

Because compatible is not "ethernet-phy-id4f51.e91b" (which is also required
by Documentation/devicetree/bindings/net/motorcomm,yt8xxx.yaml),
fwnode_get_phy_id() fails and get_phy_device() -> get_phy_c22_id() reads
MII_PHYSID1 and MII_PHYSID2 over MDIO before
fwnode_mdiobus_phy_device_register() -> phy_device_register() registers and
deasserts the per-PHY reset-gpios (PD14):

  phy_device_register()
    mdiobus_register_device()
      mdio_device_register_reset()
    phy_device_reset(phydev, 0)

If PD14 is low when the kernel boots (for example, when U-Boot has not
initialized Ethernet) or on driver rebind after phy_device_remove() asserts
reset, the PHY is still held in reset during get_phy_c22_id(), causing MDIO
reads to return 0xffff and PHY registration to fail with -ENODEV.

Second, because reset-gpios is attached to the PHY node rather than the MDIO
bus, bringing the network interface down calls:

  stmmac_release()
    phylink_disconnect_phy()
      phy_disconnect()
        phy_detach()
          phy_device_reset(phydev, 1)

This asserts hardware reset on PD14, resetting YTPHY_SYNCE_CFG_REG back to
its 25 MHz default. When the interface is brought back up via stmmac_open()
-> stmmac_init_phy() -> phylink_fwnode_phy_connect() -> phy_attach_direct()
-> phy_init_hw(), PD14 is deasserted and yt8531_config_init() runs, but
motorcomm,clk-out-frequency-hz is only applied once in yt8531_probe() in
drivers/net/phy/motorcomm.c:

	if (device_property_read_u32(dev, "motorcomm,clk-out-frequency-hz", &freq))
		freq =3D YTPHY_DTS_OUTPUT_CLK_DIS;
	...
	return ytphy_modify_ext_with_lock(phydev, YTPHY_SYNCE_CFG_REG, mask,
					  val);

Should ethernet-phy@1 use compatible =3D "ethernet-phy-id4f51.e91b" (or move
the reset handling so the PHY is out of reset before ID reads and not hard
reset across interface down/up cycles)?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261022-sunxi-oran=
gepi-3-lts-v2-0-70b899252c6a@gmail.com?part=3D2
