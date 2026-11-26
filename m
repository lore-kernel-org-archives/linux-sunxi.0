Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795726515;
	b=aXBPeAteFRugdsuUfNlPw866cRtdpE8zw1uGkXJgNqJTQOdCbeXF5VZ5kfIUNN6OzJVi
	 IhM0OlVRPVTor6KyfLbwL8YEi05LFAdRKW55x6lMJSLsN0GW8MrCkAYgIUysd4wDNNrN5
	 S/EuTidDy7KJYkbGtYjqgQEvVMrw2BGhz1Isc2WYN9gG7TB/lOCV+CZtWoDTsEb9kotK6
	 xYTfKc9WIaoEOUNVUW3xa4alD1oWsUDdE1M56vZ7l6cb88g71UJg2Jbvv/UDBBP+sy3Yj
	 tpomf+3A3PB/R0BCThzBdulsc1F4tfQ6GXsPtfPHWz+J1YkixU+r1WlRwTj9PFSbQBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795726515;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=KqIvkE3FoYPuBMPJ7N0yDrHqQXrkWFCi3zgfzHpYG7Y=;
	b=gGx5/iUkY5YzjK9zyDEudMqnhOWnCgVxE2ZKb7A7QP+zJNJl2wJZNft/RA+8aC0ANewz
	 jUGewO7GCaRAZD7MBEIgQQzudqqc59n/XxPHv+hHUtg2ISEz1V4Hew08Rctc1nBTADZ1D
	 d2/12fQ4ieqlQb0IALJgPotqNBe2qulMqSyUJwQnt/aTyAHS/z4yrA9g/aAY4QjiZ/Vvy
	 QsCuC+Me0ziUjGhF6PBGQ6zTtjUXhQVvO/W1ayvA6y5Tmq/rSsccORjT5o/vL2iYw50aS
	 iDqoMyumlkw/UBsmariF+TNTQMRHOWIMgUHWEkF5bEPYafH1VowMIw16wvSHp3pvrFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hTqcSnop;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE58F606A31C;
	Thu, 26 Nov 2026 20:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hTqcSnop
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9BEF1F00893;
	Thu, 26 Nov 2026 20:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795726515;
	bh=KqIvkE3FoYPuBMPJ7N0yDrHqQXrkWFCi3zgfzHpYG7Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hTqcSnop+qlE6wroLnDlFwhUA0KMNoqBmMSqsu4ciEC4WiuVEddiEdxqcdlyTTLT0
	 UHvC6ztHcSEVNU/1zDLIpXW9u1qE8l0Il44pQB6IAtUMVld8+LcyynWyoNtXsm7ybh
	 xf+jnbR9HqLsn4chFsnDa6xxKqz6Y6sD907F6USuIuIydS4ESUW+5mbeYCIJVkL1f9
	 IRx/yyJYoQj1wdXN8wWc6FqDLZhsHLhW3RwDMygkn4LO7W/2WDWdw6Q1QBFD0tdgFZ
	 Dn8B1XcvVDlT1g2mIM4LfAI8Ody5YezVuihboHJiABKYZ1YGDxFoDB0da5Jr1DESAn
	 kr9SShlMJglgA==
Message-ID: <sashiko-outbox-236178@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 3/5] arm64: dts: allwinner: add Radxa Cubie A7S board
Reply-To: sashiko-reviews@lists.linux.dev
To: "Enzo Adriano" <enzo.adriano.code@gmail.com>
Cc: devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261126-a733-cubie-a7s-dt-v6-3@gmail.com>
References: <20261126-a733-cubie-a7s-dt-v6-0@gmail.com>
 <20261126-a733-cubie-a7s-dt-v6-3@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 20:55:14 +0000
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 4 potential
issues to consider:
- [High] arm64: dts: allwinner: unbound x-powers,axp318w PMIC defers all
  consumers
- [High] arm64: dts: allwinner: pio bank supplies program inverted A733
  IO bias mode
- [Low] arm64: dts: allwinner: undocumented allwinner,sun60i-a733-uart
  compatible
- [Low] arm64: dts: allwinner: missing voltage range on reg_eldo1 in
  cubie-a7s
--

commit bf6c15da857b8c21da3e29b02171cb433eb632f0
Author: Enzo Adriano <enzo.adriano.code@gmail.com>

arm64: dts: allwinner: add Radxa Cubie A7S board

This commit adds the initial Devicetree for the Radxa Cubie A7S board,
enabling the serial console, AXP318W PMIC, microSD slot, I2C0 EEPROM, and
GPIO LEDs.

Link: https://dl.radxa.com/cubie/a7s/hw/radxa_cubie_a7s_schematic_v1.10.pdf
Link: https://github.com/radxa/allwinner-device/blob/6d911d1582dcccdb5a4c38=
be8d3c1ee851019795/configs/cubie_a7s/linux-5.15/board.dts#L372-L384

> diff --git a/arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7s.dts b/ar=
ch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7s.dts
> new file mode 100644
> index 0000000000000..98a878a2d739b
> --- /dev/null
> +++ b/arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7s.dts

[ ... ]

> +&pio {
> +	vcc-pb-supply =3D <&reg_swout2>;	/* via VCC-IO */
> +	vcc-pc-supply =3D <&reg_cldo5>;
> +	vcc-pd-supply =3D <&reg_swout1>;
> +	vcc-pe-supply =3D <&reg_bldo1>;
> +	/* PF uses VCC-IO at 3.3 V, with CLDO5 as the 1.8 V input. */
> +	vcc-pf-supply =3D <&reg_swout2>;
> +	vcc-pg-supply =3D <&reg_aldo1>;
> +	vcc-ph-supply =3D <&reg_swout2>;
> +	vcc-pj-supply =3D <&reg_swout1>;
> +	vcc-pk-supply =3D <&reg_bldo1>;
> +};

[Severity: High]
Will wiring vcc-pb-supply through vcc-pk-supply on pio program inverted
1.8V/3.3V I/O bias settings for banks PB through PK?

In drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c, a733_pinctrl_data still
uses BIAS_VOLTAGE_PIO_POW_MODE_SEL rather than
BIAS_VOLTAGE_PIO_POW_MODE_CTL_INV, so sunxi_pinctrl_set_io_bias_cfg()
writes un-inverted 1.8V/3.3V withstand bits into
PIO_NCAT3_POW_MOD_SEL_REG whenever a pin in those banks is requested.
In addition, reg_swout1 and reg_swout2 omit microvolt bounds and have no
input supply property on axp318w linking them to reg_dcdc1, causing
regulator_get_voltage() on those switches to return -EINVAL.

> +&r_i2c0 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&r_i2c0_pl_pins>;
> +	status =3D "okay";
> +
> +	axp318w: pmic@36 {
> +		compatible =3D "x-powers,axp318w";
> +		reg =3D <0x36>;
> +		interrupt-parent =3D <&nmi_intc>;
> +		interrupts =3D <0 IRQ_TYPE_LEVEL_LOW>;
> +		interrupt-controller;
> +		#interrupt-cells =3D <1>;
> +
> +		aldo156in-supply =3D <&reg_ps>;
> +		aldo234in-supply =3D <&reg_aldo1>;
> +		bldoin-supply =3D <&reg_ldo_input>;
> +		cldoin-supply =3D <&reg_ldo_input>;
> +		dldoin-supply =3D <&reg_ps>;
> +		eldoin-supply =3D <&reg_dcdc9>;
> +		ips-supply =3D <&reg_ps>;
> +		vin19-supply =3D <&reg_ps>;
> +		vin23-supply =3D <&reg_ps>;
> +		vin45-supply =3D <&reg_ps>;
> +		vin678-supply =3D <&reg_ps>;

[Severity: High]
As reported by Chen-Yu Tsai on v5 [1], does pmic@36 using the
undocumented and unsupported "x-powers,axp318w" compatible cause all its
regulator consumers to defer probe permanently?

No in-tree MFD or regulator driver matches "x-powers,axp318w", and
Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml does not
document that compatible, the grouped supply properties (aldo156in-supply,
aldo234in-supply, vin19-supply, vin23-supply, vin45-supply,
vin678-supply), or the dcdc9, swout1, and swout2 regulator nodes.
Because pmic@36 never binds and never registers its child regulators,
of_regulator_dev_lookup() finds the unpopulated DT regulator nodes and
returns -EPROBE_DEFER whenever uart0, mmc0, i2c0, eeprom@50, or the LEDs
request their supplies or pins through pio and r_pio.

[ ... ]

> +			reg_eldo1: eldo1 {
> +				regulator-name =3D "vdd2l-lpddr";
> +				regulator-always-on;
> +			};

[Severity: Low]
As reported by Andre Przywara on v4 [2], should reg_eldo1 specify
regulator-min-microvolt and regulator-max-microvolt bounds for the
vdd2l-lpddr rail?

[ ... ]

> +&uart0 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&uart0_pb_pins>;
> +	status =3D "okay";
> +};

[Severity: Low]
Does enabling uart0 from sun60i-a733.dtsi cause dtbs_check validation
failures because "allwinner,sun60i-a733-uart" is not documented in
Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml?

[1] https://lore.kernel.org/r/CAGb2v64p4GvDMDKzDLfedDQCexD+=3Dgu3+YxMAt=3DA=
Rj4bZxR_eA@mail.gmail.com
[2] https://lore.kernel.org/r/20261122003932.568c099c@ryzen.lan

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261126-a733-cubie=
-a7s-dt-v6-0@gmail.com?part=3D3
