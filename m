Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B72E972
	for <linux-sunxi@lists.linux.dev>; Fri, 14 May 2021 07:07:15 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 570E6169E;
	Fri, 14 May 2021 00:07:15 -0700 (PDT)
Received: from slackpad.fritz.box (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EEE1F3F718;
	Fri, 14 May 2021 00:07:13 -0700 (PDT)
Date: Fri, 14 May 2021 08:07:08 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Tobias Schramm <t.schramm@manjaro.org>
Cc: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Maxime Ripard
 <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/7] ARM: dts: sun8i: v3s: add DMA controller to v3s
 dts
Message-ID: <20210514080708.2c108851@slackpad.fritz.box>
In-Reply-To: <20210513233024.2076725-2-t.schramm@manjaro.org>
References: <20210513233024.2076725-1-t.schramm@manjaro.org>
	<20210513233024.2076725-2-t.schramm@manjaro.org>
Organization: Arm Ltd.
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.31; x86_64-slackware-linux-gnu)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 14 May 2021 01:30:18 +0200
Tobias Schramm <t.schramm@manjaro.org> wrote:

> The Allwinner V3s and V3 feature a DMA controller.
> This commit adds it to the V3s dtsi.
> 
> Signed-off-by: Tobias Schramm <t.schramm@manjaro.org>

Address, interrupt and clocks/reset match the manual.

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre

> ---
>  arch/arm/boot/dts/sun8i-v3s.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/sun8i-v3s.dtsi b/arch/arm/boot/dts/sun8i-v3s.dtsi
> index eb4cb63fef13..f0296ab46137 100644
> --- a/arch/arm/boot/dts/sun8i-v3s.dtsi
> +++ b/arch/arm/boot/dts/sun8i-v3s.dtsi
> @@ -1,5 +1,6 @@
>  /*
>   * Copyright (C) 2016 Icenowy Zheng <icenowy@aosc.xyz>
> + * Copyright (C) 2021 Tobias Schramm <t.schramm@manjaro.org>
>   *
>   * This file is dual-licensed: you can use it either under the terms
>   * of the GPL or the X11 license, at your option. Note that this dual
> @@ -172,6 +173,15 @@ nmi_intc: interrupt-controller@1c000d0 {
>  			interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
>  		};
>  
> +		dma: dma-controller@1c02000 {
> +			compatible = "allwinner,sun8i-v3s-dma";
> +			reg = <0x01c02000 0x1000>;
> +			interrupts = <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&ccu CLK_BUS_DMA>;
> +			resets = <&ccu RST_BUS_DMA>;
> +			#dma-cells = <1>;
> +		};
> +
>  		tcon0: lcd-controller@1c0c000 {
>  			compatible = "allwinner,sun8i-v3s-tcon";
>  			reg = <0x01c0c000 0x1000>;

