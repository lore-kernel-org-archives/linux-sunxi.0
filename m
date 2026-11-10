Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794354354;
	b=MTAdFbAZ5j3Fm0WsBqQs1tgbgq3F1+VTH3WF4QjcKlj47SWjyzoEbWqS4drOciYKwzuU
	 VY46mTfxcSoOiCHI5vtbvAQrGLvFI8xrKLlk+Hp//9X+cwtG0WNmHQTTOY3bN6cvkH4c6
	 UsFKT76DAY5onFOu0nLB3wuKQ/zO/RUwAnwe9gXWm+/eiM/xgwDZAJMyYa67EV+3c742s
	 SSXe+naBjVhI5z6yMvx2sxcX08teQxwSUVqN3TEl1iF5WFnhc430Lk6WAIvfVeF5F61Q4
	 axkwRZnSzO8aCjAvJmA5wFLT5fTD5LS5Eo0x6OPRILP9ykA8zI8dvo6ItDkDGMZqd/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794354354;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=YPJuazr+aBlGlIiwel2r0Bkzs9agjt70cGq/ZORNd6k=;
	b=d1PYunsSsRRSn7fQLHTQUQG/v/orM9unFRtx2+7alhOp1v1SnBx0kC/p3usQeymZnrDi
	 XKWSq08qMOJD4QkhcwCZolfLMUBoAUA7NxwsqaZYM3ETNt7im/WN9kJ6UAyqqpeVG9ClY
	 4y1mHQOjkTeTOkfHiN7aQlabliGW2/589Ud/aWGnQSFDveSk68+QCp/YsNvWw5XVKL8Xc
	 CwFC3GuyZQE1+Fqk6ePVJ9bCdbi8qN3mrnRlByYFs8x4byKcP8SBzWPd4FRZo2DSVbyDp
	 C7DKN0HSDd6ZMxbWYcB8NIrzu/G6LUnc4vXytTOfxk2z6aUt02pSyCG2olmCPJnARRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Kqk10bdm;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CBBF60A2619;
	Tue, 10 Nov 2026 23:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Kqk10bdm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38A3C1F0093E;
	Tue, 10 Nov 2026 23:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794354354;
	bh=YPJuazr+aBlGlIiwel2r0Bkzs9agjt70cGq/ZORNd6k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Kqk10bdmV62qI7Jfbvf3CUQwvVFScNNAITV5Ps8nSa+h+GAaWcTlTTtEZFX43+0nj
	 fb0VBGauB5lIEnTO9z+nqynfzqwg2SZMoVzkPvPMITtOVGz3BvS1n4VOix0DKIgapa
	 Dav1qpU5OMuHTpvcCBaEdI88dmf5uh8ixPfHJQ97e7NnDTldrOHoe93CD8juikYY1t
	 7KZodFdkmIFBY6oc2K3QPFxVbMpsXUpRy38kiC5LHvWEz7y8lFRHAljM1EBG6+duQv
	 mIhnmGpIm1O0hnufi8VABGfOAo8YLkCo+0HtW4f8Prc4V4WN2DoJOVyMT0C+cN/vwt
	 DXJ/IL75ukI8w==
Message-ID: <sashiko-outbox-207954@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/3] arm64: dts: allwinner: add A733 SoC description
Reply-To: sashiko-reviews@lists.linux.dev
To: "Enzo Adriano" <enzo.adriano.code@gmail.com>
Cc: devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <7c0ee4e609db5979d2a6598f46f40896b4f47a57.1794227241.git.enzo.adriano.code@gmail.com>
References: <cover.1794227241.git.enzo.adriano.code@gmail.com>
 <7c0ee4e609db5979d2a6598f46f40896b4f47a57.1794227241.git.enzo.adriano.code@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 23:45:53 +0000
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
- [High] arm64: dts: allwinner: missing A733 CCU dt-bindings headers and
  schemas
- [High] arm64: dts: allwinner: pio node lists 10 interrupts instead of
  11 on A733
- [Low] arm64: dts: allwinner: undocumented allwinner,sun60i-a733-uart
  compatible
--

commit 7fc84ade8f1b2531c3b62b4ae64bebc46f692d4e
Author: Enzo Adriano <enzo.adriano.code@gmail.com>

arm64: dts: allwinner: add A733 SoC description

This commit adds the base SoC device tree description for the Allwinner
A733 (sun60i-a733.dtsi), covering the CPUs, PSCI, timers, GIC, RTC,
clock/reset and pin controllers, UARTs, I2C controllers, and MMC0-2.

Link: https://gist.githubusercontent.com/apritzel/60fd7379b9560a15b8b352986=
b69d39f/raw/efd9cdf8f26ba5b0c7e138f093af44a1cf322469/sun60i-a733.dts

> diff --git a/arch/arm64/boot/dts/allwinner/sun60i-a733.dtsi b/arch/arm64/=
boot/dts/allwinner/sun60i-a733.dtsi
> new file mode 100644
> index 0000000000000..d0b9f432e3ab3
> --- /dev/null
> +++ b/arch/arm64/boot/dts/allwinner/sun60i-a733.dtsi
> @@ -0,0 +1,601 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
> +
> +#include <dt-bindings/clock/sun6i-rtc.h>
> +#include <dt-bindings/clock/allwinner,sun60i-a733-ccu.h>
> +#include <dt-bindings/clock/allwinner,sun60i-a733-r-ccu.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/reset/allwinner,sun60i-a733-ccu.h>
> +#include <dt-bindings/reset/allwinner,sun60i-a733-r-ccu.h>

[Severity: High]
Are the A733 CCU and R-CCU dt-binding headers and schemas missing from the
tree?

None of dt-bindings/clock/allwinner,sun60i-a733-ccu.h,
dt-bindings/clock/allwinner,sun60i-a733-r-ccu.h,
dt-bindings/reset/allwinner,sun60i-a733-ccu.h, or
dt-bindings/reset/allwinner,sun60i-a733-r-ccu.h exist under
include/dt-bindings/, so preprocessing any DTB that includes
sun60i-a733.dtsi fails immediately and leaves all CCU and R-CCU clock and
reset macros undefined.  In addition, the allwinner,sun60i-a733-ccu and
allwinner,sun60i-a733-r-ccu compatibles used by ccu and r_ccu below have no
binding documentation or driver support.

[ ... ]

> +		pio: pinctrl@2000000 {
> +			compatible =3D "allwinner,sun60i-a733-pinctrl";
> +			reg =3D <0x02000000 0x800>;
> +			interrupts =3D <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 77 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 79 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 87 IRQ_TYPE_LEVEL_HIGH>;

[Severity: High]
Does omitting Port A's interrupt (GIC_SPI 67) shift all GPIO bank interrupts
on pio off by one bank?

Documentation/devicetree/bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml
requires 11 interrupts for allwinner,sun60i-a733-pinctrl to cover Port A
through Port K.  In drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c,
prepare_function_table() assigns irq_bank =3D 1 to Port B through irq_bank =
=3D 10
to Port K (since Port A has 0 pins at bank 0), and sunxi_irq_base_reg()
indexes IRQ status/control registers by 0-based bank number:

drivers/pinctrl/sunxi/pinctrl-sunxi.h:sunxi_irq_base_reg() {
	if (pctl->flags & SUNXI_PINCTRL_NCAT3_REG_LAYOUT)
		return pctl->bank_offset + bank * pctl->bank_mem_size +
		       A733_IRQ_REGS_OFFSET;
    ...
}

Listing only 10 interrupts starting at Port B (GIC_SPI 69) maps GIC_SPI 69
to bank 0 (Port A) instead of bank 1 (Port B), so when any GPIO interrupt on
Port B through Port K fires, sunxi_pinctrl_irq_handler() reads the preceding
bank's status register and fails to clear or dispatch the interrupt.

[ ... ]

> +		uart0: serial@2500000 {
> +			compatible =3D "allwinner,sun60i-a733-uart",
> +				     "snps,dw-apb-uart";

[Severity: Low]
Is "allwinner,sun60i-a733-uart" documented in
Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml?

The binding schema does not list allwinner,sun60i-a733-uart, which causes
dtbs_check validation failures on uart0..uart6 and r_uart0..r_uart1 (other
Allwinner arm64 SoCs use "snps,dw-apb-uart" directly).

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1794227241.gi=
t.enzo.adriano.code@gmail.com?part=3D2
