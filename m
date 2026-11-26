Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795726381;
	b=Wrzgld+iomP50y7MxgJFYgAzIfocNNjrIQIHptl2yWlLV63ojGZEqsq1yD3TpPdhfXgO
	 PUhwWdF1j+KF9bGpP0kP7c47x6i0dtfXzN9uWdZZr070ymEk2BhLH0gLSbGxml24lnnip
	 +vIffPH1au/BVEcRbEV8szLC2wIT5LH6te+2FZNUOLZ9mVdxPXidH8+yQflKe3BqmnjKa
	 XF2pS62XcZ8Sp2+HGj6MHS/PVKs6C6N3+R5KI/94TeDqyXuKwlTEhLgqPm2a1QyM2+csj
	 RYqQyJDdqiPE4h849G5iXcqDYO8jvPSC24cQZaCMmdy6sxgduv0tcVC8YLjqNNi41Vw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795726381;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=tjQyY1vfmGep+Esa3MSlDcZQTtZ0AOYcA2A46l010/U=;
	b=aZXw56IFTooaJHXjrrTLnSyVXhjCp8gWkC6NN+8E9I2ooDJJM3RbooCa+mDA1d6dmKcS
	 nE49Qt5OzSMDR5lDl+C1QQ3ZClukcfJka3wEu/EFcACaVXzmXu7qWuqi56qgjlFeLxiQp
	 ooIDwS8UV1kMZpCrhRAW2vfCK6Ib/WKCV4yVlYouoiEwvKhwlQSwlWeksDoz5UngjMVrr
	 2/SuRdyxO5jswLWb0i4vWdnIO40hJu80gq24QYKa3FMzC1geGE1K6WL9k9mus8Uv7fNF7
	 Q5v/EMEmvI8VE3XhTNUfGhU2ciUyWuPC/x9XLrwtIQwVubfKvPn7DMXLIzZ5JXGDK7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GF9Op+Ia;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28DE4606A31C;
	Thu, 26 Nov 2026 20:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GF9Op+Ia
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 589711F00893;
	Thu, 26 Nov 2026 20:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795726380;
	bh=tjQyY1vfmGep+Esa3MSlDcZQTtZ0AOYcA2A46l010/U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GF9Op+Ia9d3aq+1M89g3LmTITBPxJ/if+0I8mX/Qlz5E7QjoslYKZiwmBIEIQJ29R
	 5tH9kzH74OQsJWfPldnWiyGr9z/qzQgYh7kxUuZyOGjapTxONQjV8huy4lZ6xXBhKe
	 QpD5THXs8COmwmkoQcb8cYaBFP4qdx2K3cpLzVkFPLR2YLILvr9RqQGxblzYGJhzxK
	 QdDMHS8yT1wEVbdOIAz5xCcy7P9FhMhOmSOW9KrcCUz+AWAQm6FGnNNg4C0uMHrSIq
	 YvEoXm2AJYcPoAt5t1GH6XK/Pq4a5Fq18OfxUOYF/oWtUrFClhuiMtq3mANTiUYke0
	 GulaXlwSzzgnw==
Message-ID: <sashiko-outbox-236168@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 2/5] arm64: dts: allwinner: add A733 SoC description
Reply-To: sashiko-reviews@lists.linux.dev
To: "Enzo Adriano" <enzo.adriano.code@gmail.com>
Cc: devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261126-a733-cubie-a7s-dt-v6-2@gmail.com>
References: <20261126-a733-cubie-a7s-dt-v6-0@gmail.com>
 <20261126-a733-cubie-a7s-dt-v6-2@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 20:52:59 +0000
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
- [High] arm64: dts: allwinner: missing Port A interrupt in A733 pio
  node
- [Low] arm64: dts: allwinner: undocumented allwinner,sun60i-a733-uart
  compatible
- [Low] arm64: dts: allwinner: commit message claims shared L3 is
  described in DT
--

commit ca507efa367e6e97ea2be259dd6d3577602268a3
Author: Enzo Adriano <enzo.adriano.code@gmail.com>

arm64: dts: allwinner: add A733 SoC description

This commit adds the base SoC Devicetree description for the Allwinner
A733, covering the CPUs, PSCI, timers, GIC, RTC, clock/reset and pin
controllers, UART, I2C, and MMC.

Link: https://gist.githubusercontent.com/apritzel/60fd7379b9560a15b8b352986=
b69d39f/raw/efd9cdf8f26ba5b0c7e138f093af44a1cf322469/sun60i-a733.dts
Link: https://lore.kernel.org/r/20261126172253.1097838-2-andre.przywara@arm=
.com

> Describe the single DynamIQ unit and shared L3 shown in section
> 5.1.2, figure 5-1. Partition PPI 7 (section 12.2.3, table 12-1)
> between the Cortex-A55 and Cortex-A76 PMUs so each probes its own
> core type. Defer capacity-dmips-mhz until it is measured on A733.

[Severity: Low]
Does the Devicetree actually describe the shared L3 cache as stated here?
The /cpus node defines cluster0 in cpu-map and cpu0 through cpu7, without
any cache nodes or next-level-cache properties.

> diff --git a/arch/arm64/boot/dts/allwinner/sun60i-a733.dtsi b/arch/arm64/=
boot/dts/allwinner/sun60i-a733.dtsi
> new file mode 100644
> index 0000000000000..e062b08006da0
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
Should pio include the Port A interrupt (GIC_SPI 67) as the first entry
so that interrupts has 11 items?

The binding in allwinner,sun55i-a523-pinctrl.yaml requires 11 interrupts
for allwinner,sun60i-a733-pinctrl (matching the A523 fix in commit
6b81aa0c8a4f ("arm64: dts: allwinner: a523: Add missing GPIO
interrupt")).  In the driver, prepare_function_table() starts at bank 1
for Port B because Port A has 0 pins, and sunxi_irq_base_reg() indexes
Port A at bank 0 and Ports B through K at banks 1 through 10.  Omitting
GIC_SPI 67 shifts pctl->irq[] by one bank, so any GPIO interrupt on
Ports B through K reads and clears the preceding bank's status register
and leaves the actual interrupt unhandled.

[ ... ]

> +		uart0: serial@2500000 {
> +			compatible =3D "allwinner,sun60i-a733-uart",
> +				     "snps,dw-apb-uart";

[Severity: Low]
As reported by Chen-Yu Tsai on v5 [1], the compatible string
"allwinner,sun60i-a733-uart" used on uart0 through uart6 and r_uart0
through r_uart1 is not documented in
Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml, which
causes dtbs_check validation failures.

[1] https://lore.kernel.org/r/CAGb2v64c5oirvfq7R3a1CWQCydfOOipcRD7dhSFAb=3D=
zczRdTHw@mail.gmail.com

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261126-a733-cubie=
-a7s-dt-v6-0@gmail.com?part=3D2
