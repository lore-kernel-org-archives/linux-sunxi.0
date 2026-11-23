Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795457483;
	b=p+Skt7uJKv4qVP1paz8FFjq0lZxO/2/RTZgWb+Blg2tyRyFsQMXrJRPycXoAf36tTRsg
	 rcSkYDbiyCSgQbJcHjKyPFOvx0req0ooqEsOQxgBs1hFBO13sEDYHgwp+YSuVQaMlP3Z+
	 yOIB6xioljVwlGcvL0kxMxGXiOCuuaQL8RbTVtFMfVUTyDd6YnP2zK6URWqqsxzpN+8LA
	 RVI07jnSqcBCT33AZgGvUmE+9hai/flDDKvRMOG7STEn/D/RaKyazTmegcUR/KdJl4OOs
	 C7BkK+Bwfv7oOurIqlqo62sRlpLc2zM7LwPyX3YU5+RWFzW6e0O3veRK79+Wm+agDiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795457483;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=vgIU1HlB1YNAMsqqmknEVgX8ZoIIZUz/3pk7Cr52YZg=;
	b=chmXLx6wcz0nWML7XfvTGpSz4yehBs9yrbUzfgNeG+8Zg5Mvbb57z352eORJtrILZQ4E
	 WGXgGicTGmrtMo1mndaGaEfNKT/j7qw5Pv5BDerZZdVCpvmqEcfopAPfgFzlhf8mAgr2C
	 KTL0zZz8Iu5Jlx/uYdT9noM8/rl8yXdpqupHS7u4YqTbYfojKgignqnmnUU8MuXmKv2Ye
	 NDPbcNH7bTL4q5FrZye3kx9VUvZbmqhNjL5FWQsqL78ookRWXmBdOKzysgIHT/qoG0sp5
	 tMeQyxNJmUc4MklSQ1xBTcxglJyas+JNZAn6WvDWVtYVYjEoK5l2FNkMm2cktlajFXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=czUqZZic;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86586606A33B;
	Mon, 23 Nov 2026 18:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=czUqZZic
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB8D81F000C0;
	Mon, 23 Nov 2026 18:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795457483;
	bh=vgIU1HlB1YNAMsqqmknEVgX8ZoIIZUz/3pk7Cr52YZg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=czUqZZicdRIOWHYENkpcM57jzzEmmVWTxSBL9Lbbjrj8qRyPATrfgGV4hIjh9fB1u
	 M44v5iBlo+xgkiW+ie+XK5ju97yHsaVz5I5whXNf8ImrdeeNnR7fN46N68MCsiOhY3
	 qLbmlA4VJ42DSJwmwyObwWP0i6YmEmgQxKCAv/g2PaNlZV43/5A3O37jhdPZbt8yWm
	 DzqkaWhWN9utWVh1/ybpTedsHPK4OXx1Q4i8ersNajqmy8xTfGIzwb5ymZUD8dbHIz
	 ATox5ql/xjdP+1XNr9/YktDdz6cE6/GizpNEHyuNy3Xc9rSRgEQWejHMP9hEc9DQTf
	 tK5u1WNmtbAUw==
Message-ID: <sashiko-outbox-229796@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 3/3] arm64: dts: allwinner: add Radxa Cubie A7S board
Reply-To: sashiko-reviews@lists.linux.dev
To: "Enzo Adriano" <enzo.adriano.code@gmail.com>
Cc: devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261121-a733-cubie-a7s-dt-v5-3@gmail.com>
References: <20261121-a733-cubie-a7s-dt-v5-0@gmail.com>
 <20261121-a733-cubie-a7s-dt-v5-3@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 18:11:22 +0000
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
- [Low] arm64: dts: allwinner: non-generic osc32k-clk fixed-clock node
  name
- [Low] arm64: dts: allwinner: undocumented allwinner,sun60i-a733-uart
  compatible
--

commit e16e02bf9bff4295531a8fc06d6b6852a523f527
Author: Enzo Adriano <enzo.adriano.code@gmail.com>

arm64: dts: allwinner: add Radxa Cubie A7S board

This commit adds the initial Devicetree source for the Allwinner
A733-based Radxa Cubie A7S board, enabling the UART0 console, AXP318W
PMIC, microSD slot, I2C0 EEPROM, and GPIO LEDs.

Link: https://dl.radxa.com/cubie/a7s/hw/radxa_cubie_a7s_schematic_v1.10.pdf
Link: https://github.com/radxa/allwinner-device/blob/6d911d1582dcccdb5a4c38=
be8d3c1ee851019795/configs/cubie_a7s/linux-5.15/board.dts#L372-L384

> diff --git a/arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7s.dts b/ar=
ch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7s.dts
> new file mode 100644
> index 0000000000000..7451c00570fb7
> --- /dev/null
> +++ b/arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7s.dts

[ ... ]

> +	osc32k: osc32k-clk {
> +		compatible =3D "fixed-clock";
> +		#clock-cells =3D <0>;
> +		clock-frequency =3D <32768>;
> +	};

[Severity: Low]
Should this fixed-clock node use a generic node name such as clock-osc32k
or clock-32768?

Documentation/devicetree/bindings/clock/fixed-clock.yaml deprecates node
names that do not match the ^clock-([0-9]+|[a-z0-9-]+)$ pattern.

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
Does wiring vcc-pb-supply through vcc-pk-supply on &pio configure inverted
1.8 V and 3.3 V I/O bias modes on the A733 pin banks?

The commit message notes that the A733 pinctrl voltage-mode fix is required
for these bank supply connections, but a733_pinctrl_data in
drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c still uses
BIAS_VOLTAGE_PIO_POW_MODE_SEL instead of BIAS_VOLTAGE_PIO_POW_MODE_CTL_INV.
When pins in banks PB through PK are requested with resolved bank
regulators, sunxi_pinctrl_set_io_bias_cfg() writes un-inverted mode bits to
pow_mod_sel_offset, programming 3.3 V banks for 1.8 V withstand mode and
1.8 V banks for 3.3 V mode.

> +
> +&r_i2c0 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&r_i2c0_pl_pins>;
> +
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
> +
> +		regulators {
> +			reg_dcdc1: dcdc1 {

[ ... ]

> +			reg_dcdc9: dcdc9 {
> +				regulator-name =3D "eldo-input";
> +			};
> +
> +			reg_swout1: swout1 {
> +				regulator-name =3D "vcc33-lcd";
> +			};
> +
> +			reg_swout2: swout2 {
> +				/* VCC-IO to the console and microSD. */
> +				regulator-name =3D "vcc-io-card";
> +				regulator-always-on;
> +			};

[Severity: High]
Will any consumer of the axp318w regulators ever finish probing without a
driver or Devicetree binding for x-powers,axp318w?

Neither Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml nor
axp20x_i2c_of_match[] in drivers/mfd/axp20x-i2c.c includes
"x-powers,axp318w" (or the grouped supply properties aldo156in-supply,
aldo234in-supply, vin19-supply, vin23-supply, vin45-supply, vin678-supply
and child regulator nodes dcdc9, swout1, swout2).  Because no driver binds
to pmic@36, none of its child regulators are registered.  When consumers
such as pio, r_pio, uart0, mmc0, i2c0, eeprom@50, and leds request their
bank or device supplies, sunxi_pmx_request() -> regulator_get() ->
of_regulator_dev_lookup() finds the DT regulator node without a registered
regulator device and returns -EPROBE_DEFER instead of falling back to the
dummy regulator, leaving the serial console, microSD slot, EEPROM, and
LEDs permanently deferred while also failing dtbs_check.

[ ... ]

> +&uart0 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&uart0_pb_pins>;
> +
> +	status =3D "okay";
> +};

[Severity: Low]
Does sun60i-a733-cubie-a7s.dtb fail dtbs_check on the UART nodes inherited
from sun60i-a733.dtsi?

Commit "arm64: dts: allwinner: add A733 SoC description" defines uart0
through uart6 and r_uart0 through r_uart1 in sun60i-a733.dtsi with
compatible =3D "allwinner,sun60i-a733-uart", "snps,dw-apb-uart", but
"allwinner,sun60i-a733-uart" is not documented in
Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261121-a733-cubie=
-a7s-dt-v5-0@gmail.com?part=3D3
