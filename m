Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795112817;
	b=KR49AfBO+RoTXecbAxNIMyPuebMUdhm/xTZyNB8hEeaU+XXGVAsWFnnzPvnFQPkAlEHs
	 /NIqZkMtgtn+sBaL/Rss8tXCdRgiephKsW+a5kD0cH9o9ZN8Pf8wj64DzSEac0VKmQghJ
	 PMM7zjDxsICrRqvr9gwCg1YZizs5cFbX/TMHexdGIBDlbCkJXq8dMem3qTEOc7ukILcxv
	 aLV9tNJA8D4HdkvlRgr9fgZWigBm8NyFRGmjhkmDfhw+85Ic08tpcEXMAgsLNHVZGqBsO
	 1jwXC/iGd1MffvMdMCoNhKcv1ks5ZJbGJGAk5HobcRGMhLrMNdIHGZE9kcONR6wb8FA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795112817;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=VL3K5EjjsbgmL54XExY+xD6gWFu3u6u6mDJdG1lvCdE=;
	b=eDPIpEaziNdoVUULCM2tj8DxRA1m2sXwVFi6wVeD7oXfgnpVdIZplScNWQtYfWR9NE7L
	 UXuD7cnrS+P3wrhjDgzooyZ9HRktHCl0tJ+SZLtaud7XiLHG2UY8o0ubVA3DfzJYubHa1
	 hQJkFsp1Hq0RTnaY9P/6x5weS+Ada76v8DRrxMfDICd377SjrGBLcwriV+uno0qPDhK7O
	 PvOL9ahXE1jMpdFJ6yaG7LUqJDz1o3UDNkAbMwAkpOmOj8AX0yaEjW0qcRkyS9F42e39w
	 OGsmsvcvGHBZrCwkZ5Tc1vsDBNcCGIpMWV0PlqCWPPhrM3QrmKU96jU6YAhWRTKjXUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="bMyP/PSN";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66B02606A331;
	Thu, 19 Nov 2026 18:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bMyP/PSN
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02DC81F000C6;
	Thu, 19 Nov 2026 18:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795112817;
	bh=VL3K5EjjsbgmL54XExY+xD6gWFu3u6u6mDJdG1lvCdE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bMyP/PSNwTMBsmvt7cUc8G0bIvaIuS9FswofH29pCMfwgCrllxyxePCAEdvj57CMb
	 rY3M4isFxLjv5ooBoViaIyY6b1fFdBlACWS4RzA8FKsW/mzKtP6ul+Lf+2/Y6nq5/J
	 jx/l6X+hRrSSFVK0p7UHSijijpjwfPYlV68r6MkOzotG9JhY3iM6I/CFZGG7U3D6mp
	 pKc7ZXS4ewrf1aSbeZJ0YmRDLAjn4npC4X889Id/PUEZwpH8oa5LgRQNsWZ8gZavQZ
	 bmRbsun2PVZcaLO3DQ1r2N4Qc/bEKxc+oa6e+XqGRuY/l0Z86s3VrtTjEZ9ayGdA24
	 RWAzIIBs/nCVA==
Message-ID: <sashiko-outbox-223768@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/3] arm64: dts: allwinner: add Radxa Cubie A7S board
Reply-To: sashiko-reviews@lists.linux.dev
To: "Enzo Adriano" <enzo.adriano.code@gmail.com>
Cc: devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <448e7551a6f560d8b8ede245ccfbc74101c76ef4.1795034153.git.enzo.adriano.code@gmail.com>
References: <cover.1795034153.git.enzo.adriano.code@gmail.com>
 <448e7551a6f560d8b8ede245ccfbc74101c76ef4.1795034153.git.enzo.adriano.code@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 18:26:56 +0000
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential
issues to consider:
- [High] arm64: dts: allwinner: unbound x-powers,axp318w PMIC defers
  uart0 and mmc0
- [High] arm64: dts: allwinner: cubie-a7s sets 1.8V vcc-pf-supply for
  3.3V-only mmc0
- [Low] arm64: dts: allwinner: undocumented allwinner,sun60i-a733-uart
  compatible
--

commit 3e2ac1a2ecf97dc48633ea46df0bd68b383bb1c3
Author: Enzo Adriano <enzo.adriano.code@gmail.com>

arm64: dts: allwinner: add Radxa Cubie A7S board

This commit adds initial Devicetree support for the Radxa Cubie A7S board,
enabling UART0, the AXP318W PMIC on R-I2C0, CPU and GPIO bank supplies, and
MMC0.

> diff --git a/arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7s.dts b/ar=
ch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7s.dts
> new file mode 100644
> index 0000000000000..9af9a68950d83
> --- /dev/null
> +++ b/arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7s.dts
> @@ -0,0 +1,287 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
> +/dts-v1/;
> +
> +#include "sun60i-a733.dtsi"

[ ... ]

> +&mmc0 {
> +	bus-width =3D <4>;
> +	cap-sd-highspeed;
> +	cd-gpios =3D <&pio 5 6 (GPIO_ACTIVE_HIGH | GPIO_PULL_DOWN)>;
> +	disable-wp;
> +	max-frequency =3D <50000000>;
> +	no-1-8-v;
> +	vmmc-supply =3D <&reg_swout2>;
> +	/* The 3.3 V path uses VCC-IO; no Port F voltage switching yet. */
> +	vqmmc-supply =3D <&reg_swout2>;
> +
> +	status =3D "okay";
> +};
> +
> +&osc {
> +	clock-frequency =3D <26000000>;
> +};
> +
> +&pio {
> +	vcc-pb-supply =3D <&reg_swout2>;
> +	vcc-pc-supply =3D <&reg_cldo5>;
> +	vcc-pd-supply =3D <&reg_swout1>;
> +	vcc-pe-supply =3D <&reg_bldo1>;
> +	vcc-pf-supply =3D <&reg_cldo5>;
> +	vcc-pg-supply =3D <&reg_aldo1>;
> +	vcc-ph-supply =3D <&reg_swout2>;
> +	vcc-pj-supply =3D <&reg_swout1>;
> +	vcc-pk-supply =3D <&reg_bldo1>;
> +};

[Severity: High]
Does setting vcc-pf-supply to reg_cldo5 (1.8 V) conflict with mmc0
operating Port F at 3.3 V via reg_swout2?

When mmc0 requests PF0-PF6, sunxi_pmx_request() ->
sunxi_pinctrl_set_io_bias_cfg() reads 1800000 uV from reg_cldo5 and
programs Port F's PIO_POW_MOD_SEL bit for 1.8 V operation instead of the
active 3.3 V signaling rail.  In addition,
drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c currently sets
.io_bias_cfg_variant =3D BIAS_VOLTAGE_PIO_POW_MODE_SEL rather than
BIAS_VOLTAGE_PIO_POW_MODE_CTL_INV, so connecting vcc-p*-supply on &pio
without that pinctrl change programs inverted IO bias mode bits across the
supplied PIO banks.

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

[Severity: High]
Will axp318w fail to bind and leave uart0, mmc0, pio, and r_pio deferred?

Neither the Devicetree bindings nor the axp20x MFD and regulator drivers
have support for "x-powers,axp318w" (or its grouped input supplies and
dcdc8, dcdc9, swout1, and swout2 regulator nodes), so pmic@36 never probes
and dtbs_check fails validation.  Because the supply phandles on &pio,
&r_pio, &mmc0, and &cpu0..&cpu7 point to present DT nodes under axp318w
whose regulators never register, of_regulator_dev_lookup() returns
-EPROBE_DEFER instead of falling back to the dummy regulator, causing
sunxi_pmx_request() for uart0 (PB9/PB10) and mmc0 (PF0-PF6) as well as
mmc_regulator_get_supply() to defer indefinitely.

[ ... ]

> +&uart0 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&uart0_pb_pins>;
> +
> +	status =3D "okay";
> +};

[Severity: Low]
sun60i-a733.dtsi declares uart0..uart6 and r_uart0..r_uart1 with
compatible =3D "allwinner,sun60i-a733-uart", "snps,dw-apb-uart", but
"allwinner,sun60i-a733-uart" is not documented in
Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml, causing
dtbs_check validation failures on sun60i-a733-cubie-a7s.dtb.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1795034153.gi=
t.enzo.adriano.code@gmail.com?part=3D3
