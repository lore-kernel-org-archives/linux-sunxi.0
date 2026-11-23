Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795456894;
	b=kl5sWT/jWTHPYHkhd0dVxyAh0UHdyzYudF//bWw7bozpn+dNFzJqs+6zx7ytEGlNLZfX
	 lCC/2WtJFnl0O8tZX0i3cBws8L2ftryBvdfxqzJIiD3df/5oxbnJsyNaJ2SMmJ7ayF30Q
	 FpDZmMEvTLBfgH4AqCf+afR5hE93jHfd3Et+iT+bhO/tSShPGycUCRJs64WLAnl6l9e9/
	 iHyly0orRattFMDxD/rhBkjgTBbFE+uSblk33VNELLQwtqqAgL3wJiJ/4g5yfc9UExaHZ
	 uo/rUnDLU8aexXg+1tIfAxSiO0+MaPhOXWROr5jV8AsUhVy5tSeFCG/RNG8S+TU4cOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795456894;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=jgsmFkQcJTRjr+5kofVo4qXbEGT1C/E4F/foxT+ncPA=;
	b=pKZ6X4sR17B25i0/1wxgdw+kuyjEPSo1DJcAODyoLmZc11s5rHt3csCflmqcxs0JUTIk
	 l6iuUlCvZAuRC1JGg3NXPrCYZpnZmx+2gNasRP8f5fCmJ6X+JNLAUZ/sUOfIF0K40yghk
	 MmN1lD05I+oV6eZGU7LyPqh5lPv17g397RsX/pbYKDxjTSRECwT35u/e7fq2jekRDXvVN
	 1qAc1OZBvTR6sRFIVyaW3KbD3stBzDIWHXeepP1Gg8oj/GlHrrLLxEflbWR+LGRcJJfRh
	 SWrC2y+s/X+MDgHd+P8x59VZyzJ6bjjnTxHRsS5D04vHDM0vnkpD4XIdxhgl1do4VdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Dh+Ph1za;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F200606A31E;
	Mon, 23 Nov 2026 18:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Dh+Ph1za
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78DA31F000D8;
	Mon, 23 Nov 2026 18:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795456893;
	bh=jgsmFkQcJTRjr+5kofVo4qXbEGT1C/E4F/foxT+ncPA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Dh+Ph1za8FiTO93H749j/yXWRKkxs4++oobWaPbkZYvSpqsxvaY1vEFSiwvZzvQnq
	 ay8O5Joe88JDRHbyp/gmtVSrWKD6hHfqU9OXNi/7JtF3bjYwPkgWVgsYCDk/kGqgIO
	 QQ1zpiwuMVyn+HgmBIOxAmHMgn9Ptg2IKsDzUvsF9ZO9rpnxYG7IbVItEJ2YAgYInW
	 qXEIgU0AQD8ePbr+tRanlZcolldqFQWxLEnyz2qQNWy6XE4WVqhFRSkRnFU2/a5cf9
	 RQyvWqyPFcdHBSJcpykXxcSUl+JRJ/1PIX2YAMtlgPMKF066KkQvhgRHkNrGzaqP5h
	 TTaH2ICO5Y79w==
Message-ID: <sashiko-outbox-229789@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/3] arm64: dts: allwinner: add A733 SoC description
Reply-To: sashiko-reviews@lists.linux.dev
To: "Enzo Adriano" <enzo.adriano.code@gmail.com>
Cc: devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261121-a733-cubie-a7s-dt-v5-2@gmail.com>
References: <20261121-a733-cubie-a7s-dt-v5-0@gmail.com>
 <20261121-a733-cubie-a7s-dt-v5-2@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 18:01:33 +0000
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [High] arm64: dts: allwinner: missing Port A interrupt in A733 pio
  node
- [Low] arm64: dts: allwinner: undocumented allwinner,sun60i-a733-uart
  compatible
--

commit e06ab06b491f829b4ed6d875edfe27c2c5015fab
Author: Enzo Adriano <enzo.adriano.code@gmail.com>

arm64: dts: allwinner: add A733 SoC description

This commit adds the base Devicetree source include for the Allwinner
A733 SoC, describing the CPUs, GIC, timers, clocks, pin controllers,
UARTs, I2C controllers, MMC controllers, and RTC.

Link: https://gist.githubusercontent.com/apritzel/60fd7379b9560a15b8b352986=
b69d39f/raw/efd9cdf8f26ba5b0c7e138f093af44a1cf322469/sun60i-a733.dts
Link: https://github.com/radxa/allwinner-bsp/blob/2045a3ca2a01f088c0314dc92=
4bda59d154e363e/drivers/pinctrl/pinctrl-sun60iw2.c#L1591-L1610

> diff --git a/arch/arm64/boot/dts/allwinner/sun60i-a733.dtsi b/arch/arm64/=
boot/dts/allwinner/sun60i-a733.dtsi
> new file mode 100644
> index 0000000000000..8a258f16751e6
> --- /dev/null
> +++ b/arch/arm64/boot/dts/allwinner/sun60i-a733.dtsi

[ ... ]

> +		pio: pinctrl@2000000 {
> +			compatible =3D "allwinner,sun60i-a733-pinctrl";
> +			reg =3D <0x02000000 0x800>;
> +			interrupts =3D <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH 0>,
> +				     <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH 0>,
> +				     <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH 0>,
> +				     <GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH 0>,
> +				     <GIC_SPI 77 IRQ_TYPE_LEVEL_HIGH 0>,
> +				     <GIC_SPI 79 IRQ_TYPE_LEVEL_HIGH 0>,
> +				     <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH 0>,
> +				     <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH 0>,
> +				     <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH 0>,
> +				     <GIC_SPI 87 IRQ_TYPE_LEVEL_HIGH 0>;

[Severity: High]
Is the Port A interrupt (GIC_SPI 67) missing from the first slot of
pio's interrupts property?

In drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c, prepare_function_table()
starts with irq_bank =3D 0 and last_bank =3D 0.  Because Port A (bank 0) has
0 pins, the first pin (PB0, bank 1) increments irq_bank to 1, so Ports B
through K are assigned irq_bank 1 through 10 and sunxi_irq_base_reg()
indexes the IRQ registers by that bank number.  Omitting GIC_SPI 67
at index 0 shifts pctl->irq[] by one bank, so when a GPIO interrupt fires
on Ports B through K, sunxi_pinctrl_irq_handler() reads the preceding
bank's status register and leaves the interrupt unhandled.

Documentation/devicetree/bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml
also requires 11 interrupts for allwinner,sun60i-a733-pinctrl, matching
6b81aa0c8a4f ("arm64: dts: allwinner: a523: Add missing GPIO interrupt").

[ ... ]

> +		uart0: serial@2500000 {
> +			compatible =3D "allwinner,sun60i-a733-uart",
> +				     "snps,dw-apb-uart";
> +			reg =3D <0x02500000 0x400>;
> +			interrupts =3D <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH 0>;
> +			reg-shift =3D <2>;
> +			reg-io-width =3D <4>;
> +			clocks =3D <&ccu CLK_BUS_UART0>;
> +			resets =3D <&ccu RST_BUS_UART0>;
> +			status =3D "disabled";
> +		};

[Severity: Low]
Is "allwinner,sun60i-a733-uart" documented in
Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml?

Without a binding entry, dtbs_check fails on uart0 through uart6 and
r_uart0 through r_uart1.  Other Allwinner arm64 SoC device trees (such as
sun55i-a523.dtsi and sun50i-h616.dtsi) use compatible =3D "snps,dw-apb-uart"
directly unless the SoC-specific compatible is added to the binding schema.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261121-a733-cubie=
-a7s-dt-v5-0@gmail.com?part=3D2
