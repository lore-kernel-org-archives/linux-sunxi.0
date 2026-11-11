Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794355249;
	b=0oyX9PmtMMCjoJuKaaKCJ9ztiDvLFzYdQmEM4poz8d+EfZXStRF1rcGNeaZub6zEfSWc
	 gvv01Dd3gdizTSKXe+FXd3A1WptnsRPfNBH+tuPHLSwdAocRtkQGDTyG/QPidoKKGQPdI
	 ZKDn/KKVYlRK+QPeXB7CDMAckabR026yFTHlfrXcFhUQ860ogyezBrdHO4v5aeprqnm12
	 li4QVeZjUyB+RC727+ifSpietJE7nAAHY7fTRv3E45B8x5cIlqwohaz8xlPphxilbHQ2z
	 4BMrk8AMtfWHb9So8QQVIfzTPYAY9tsUlJuCxndyTR4kLBciAeIP/W1Mp1m/UHHom2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794355249;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=gIaEn4TkrtnmKkUOxyudDKWr3AzVet9RtUDZifhF1qA=;
	b=1E3ANdVK9y1ZERnt4SQHnFL2SqcEdM5pN+hFeb5hr7GycUHfGQpTQweVXPtpcG4P1aSj
	 5vs8ZkIFCf5N2YS3b1PKhI21g9sWxy70XZcOP6ZXcq4cndJYGqdWSyO3+/Lq1w2MeB0ti
	 Sgg2wnI5vA7PnLWzZxIKYNv+fWo6ubl4Ru7oCZG9x6fJvPaMV6+YoxB8fPKTGldfqgNJ5
	 WM8teLOmAvWjlcmwyF3XtUXrvIZz29hVYa7hn8B+LJ3PPgynSX0hr9W2BFdRfqtre+s6b
	 Ds+FhoJ+xvNeqd85doOLHblS8tb5sMtDDPq6oRik3L9HcGxDh84dvSF0Z9PcqcFUabQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=I4962yNZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D7A5606A31C;
	Wed, 11 Nov 2026 00:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=I4962yNZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD9E71F0089F;
	Wed, 11 Nov 2026 00:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794355249;
	bh=gIaEn4TkrtnmKkUOxyudDKWr3AzVet9RtUDZifhF1qA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=I4962yNZxEVTRAMSDgGkLVpbQTOT+GUQmTr2UYyg3nuAFZaeEmdJbMOjw6nejTWnD
	 djgaEJT7slTJpJm27nZucRfL9tNOE+mu4STEl6SzVo88w79OXWH9LquVkZaAQQ4y0q
	 lXPNP/8+MuLQBoadxGpRTx47ozno370Q2m8LVybd5Cmr/DLJEBs78PbK9E60oAIvaV
	 WDjDMePAUSttoiWJrWlXRT3WuBmT4qXKJmT4y34GyULmS2Ey0F1EVaHVTMELIR4nka
	 zOGSoP6o70FqSlakDLA4YL13rwJRIHFTN+bqO5yrCYTFWtEi4DOFrCWUszNEui5CeU
	 xVLuR9C4IREHQ==
Message-ID: <sashiko-outbox-207989@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/3] arm64: dts: allwinner: add Radxa Cubie A7S board
Reply-To: sashiko-reviews@lists.linux.dev
To: "Enzo Adriano" <enzo.adriano.code@gmail.com>
Cc: devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <0fe5938e04cc8a5af3825a0e01bd07b626a15b46.1794227241.git.enzo.adriano.code@gmail.com>
References: <cover.1794227241.git.enzo.adriano.code@gmail.com>
 <0fe5938e04cc8a5af3825a0e01bd07b626a15b46.1794227241.git.enzo.adriano.code@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 00:00:48 +0000
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
- [High] arm64: dts: allwinner: cubie-a7s DTB build fails on missing
  A733 CCU headers
- [High] arm64: dts: allwinner: unsupported x-powers,axp318w PMIC blocks
  consumer probe
- [High] arm64: dts: allwinner: cubie-a7s sets 1.8V vcc-pf-supply for
  3.3V-only mmc0
--

commit 572e2012767dbd5d4ea9dfb9c1da49853b19d780
Author: Enzo Adriano <enzo.adriano.code@gmail.com>

arm64: dts: allwinner: add Radxa Cubie A7S board

This commit adds the device tree for the Radxa Cubie A7S board based on the
Allwinner A733 SoC, enabling UART0, the AXP318W PMIC, and MMC0, and wires it
into the sunxi DTB build.

> diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot/dts=
/allwinner/Makefile
> index d1f768dd6461d..792152525b433 100644
> --- a/arch/arm64/boot/dts/allwinner/Makefile
> +++ b/arch/arm64/boot/dts/allwinner/Makefile
> @@ -68,3 +68,4 @@ dtb-$(CONFIG_ARCH_SUNXI) +=3D sun55i-a527-cubie-a5e.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun55i-h728-x96qpro+.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun55i-t527-avaota-a1.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun55i-t527-orangepi-4a.dtb
> +dtb-$(CONFIG_ARCH_SUNXI) +=3D sun60i-a733-cubie-a7s.dtb

[Severity: High]
Does adding sun60i-a733-cubie-a7s.dtb to dtb-$(CONFIG_ARCH_SUNXI) break the
DTB build?

sun60i-a733-cubie-a7s.dts includes sun60i-a733.dtsi and references
CLK_BUS_R_RTC and CLK_R_AHB in the &rtc node, and sun60i-a733.dtsi includes:

arch/arm64/boot/dts/allwinner/sun60i-a733.dtsi {
	#include <dt-bindings/clock/allwinner,sun60i-a733-ccu.h>
	#include <dt-bindings/clock/allwinner,sun60i-a733-r-ccu.h>
	#include <dt-bindings/interrupt-controller/arm-gic.h>
	#include <dt-bindings/reset/allwinner,sun60i-a733-ccu.h>
	#include <dt-bindings/reset/allwinner,sun60i-a733-r-ccu.h>
}

None of those four A733 clock and reset binding headers exist in
include/dt-bindings/, so compiling dtbs with CONFIG_ARCH_SUNXI enabled fails
at the preprocessor stage.  In addition, there are no in-tree drivers for
allwinner,sun60i-a733-ccu or allwinner,sun60i-a733-r-ccu to provide clocks =
and
resets at runtime.

> diff --git a/arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7s.dts b/ar=
ch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7s.dts
> new file mode 100644
> index 0000000000000..341c24360ce29
> --- /dev/null
> +++ b/arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7s.dts

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

[Severity: High]
Will setting vcc-pf-supply =3D <&reg_cldo5> configure Port F's IO bias for =
1.8 V
while &mmc0 operates at 3.3 V?

&mmc0 uses Port F pins (PF0-PF6) with no-1-8-v and vqmmc-supply =3D
<&reg_swout2> for 3.3 V signaling, whereas reg_cldo5 is fixed at 1800000 uV.
When mmc0 requests its pins, sunxi_pmx_request() ->
sunxi_pinctrl_set_io_bias_cfg() reads the voltage of vcc-pf-supply and
programs the bank's PIO_POW_MOD_SEL bit for 1.8 V whenever uV <=3D 1800000,
mismatching the 3.3 V SD signaling path.  Pointing vcc-pf-supply at the 3.3=
 V
supply (&reg_swout2, with a defined 3.3 V voltage or parent supply) would k=
eep
Port F's bias configuration aligned with 3.3 V signaling.

> +	vcc-pg-supply =3D <&reg_aldo1>;
> +	vcc-ph-supply =3D <&reg_swout2>;
> +	vcc-pj-supply =3D <&reg_swout1>;
> +	vcc-pk-supply =3D <&reg_bldo1>;
> +};
> +
> +&r_i2c0 {
> +	status =3D "okay";
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&r_i2c0_pl_pins>;
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
Does axp318w prevent &pio, &uart0, and &mmc0 from probing because
"x-powers,axp318w" has no in-tree driver or DT binding?

Neither drivers/mfd/axp20x*.c, drivers/regulator/axp20x-regulator.c, nor
Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml supports
"x-powers,axp318w" (or its grouped input supplies and swout1/swout2/dcdc8/d=
cdc9
regulators).  Because &pio, &r_pio, and &mmc0 reference child regulator nod=
es
under axp318w, of_regulator_dev_lookup() finds the DT nodes without registe=
red
regulator devices and returns -EPROBE_DEFER, causing sunxi_pmx_request() for
uart0 and mmc0 as well as mmc_regulator_get_supply() to defer indefinitely.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1794227241.gi=
t.enzo.adriano.code@gmail.com?part=3D3
