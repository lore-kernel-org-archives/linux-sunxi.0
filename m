Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A83F31B114
	for <linux-sunxi@lists.linux.dev>; Wed, 22 Jul 2026 22:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784757650; cv=none; b=qRbkNnzREZlZlgHP6U4zsIor0DmQtHKx1KuUN+4culSk4uzA7dvEeHQA7k9681GC3mvu3oakcM4M0pnsemUoD/XALojNOFlIdaAggzy14esgTUFCoOuaD5VOn4OyOkVysjcogAmEdJ0LvY3Z9Kp4Qfcmvl1ua1NbwCSSJE2kbfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784757650; c=relaxed/simple;
	bh=3MvGD1eFKe1vEcFRnSpsEpa0JYSXdYF12OcBVgaAJiU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SBoz/uyETxiH8U/3i4i3jlzRIQdk9JJc0UBDjL447/R9vBCI1JQWxBZZg6mC7xXhhmMVmIt7RwvAUsMBnh/mBzIGAxthoJ9+GdWX6ag6lm6wfbL4yhvQs9Mit2MOqvAol04CxjStfjVt4VLYHBNKMHOKs4M+UBRXMkl2z+Zxdjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=DQelirpG; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="DQelirpG"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4BB981595;
	Wed, 22 Jul 2026 15:00:43 -0700 (PDT)
Received: from ryzen.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 869EB3F66F;
	Wed, 22 Jul 2026 15:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784757647; bh=3MvGD1eFKe1vEcFRnSpsEpa0JYSXdYF12OcBVgaAJiU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=DQelirpGLPKsacn9h+egBlDB6+GT1AZD7LVjwqMTd3idUcsZvgDYICoe/gUxKIqCK
	 s6ZXmpdcAHCbOExSqv7gGQiIgYeecP4lSpCG3FFz4vxwglYSPa13gxgOLJtmN6I6fz
	 hdgoCzSVUFfQHN739oMqQilKLOdMDAa7q24D4hr4=
Date: Wed, 22 Jul 2026 23:56:48 +0200
From: Andre Przywara <andre.przywara@arm.com>
To: Justin Suess <utilityemal77@gmail.com>
Cc: Sean Young <sean@mess.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, Sashiko
 <sashiko-bot@kernel.org>
Subject: Re: [PATCH v2 2/3] arm64: dts: allwinner: a523: add IR receiver
 nodes
Message-ID: <20260722235648.40350459@ryzen.lan>
In-Reply-To: <20260722201717.2205609-3-utilityemal77@gmail.com>
References: <20260722201717.2205609-1-utilityemal77@gmail.com>
	<20260722201717.2205609-3-utilityemal77@gmail.com>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 22 Jul 2026 16:17:16 -0400
Justin Suess <utilityemal77@gmail.com> wrote:

Hi Justin,

thanks for the update!

> The A523 has two CIR receivers, both compatible with the A31 CIR: one
> in the CPUX domain, clocked from the main CCU, and one in the RTC
> power domain, clocked from the R-CCU.
> 
> Add nodes for both instances, disabled by default. Since the RX signal
> of each instance can be routed to more than one pin, boards with an IR
> receiver are expected to add the pinctrl properties next to where they
> enable the node. Keep the PL11 pin description in the dtsi, as boards
> commonly use that pin for the RTC domain instance.
> 
> Cc: Andre Przywara <andre.przywara@arm.com>
> Signed-off-by: Justin Suess <utilityemal77@gmail.com>

I compared the values against the manual, and can confirm that they
match. Also tested both interfaces. Just one nit below, but regardless:

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

> ---
>  .../arm64/boot/dts/allwinner/sun55i-a523.dtsi | 28 +++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> index ca6a16807049..19771aac68e5 100644
> --- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> @@ -327,6 +327,17 @@ ccu: clock-controller@2001000 {
>  			#reset-cells = <1>;
>  		};
>  
> +		ir: ir@2005000 {
> +			compatible = "allwinner,sun55i-a523-ir",
> +				     "allwinner,sun6i-a31-ir";
> +			reg = <0x02005000 0x400>;
> +			interrupts = <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&ccu CLK_BUS_IR_RX>, <&ccu CLK_IR_RX>;
> +			clock-names = "apb", "ir";
> +			resets = <&ccu RST_BUS_IR_RX>;
> +			status = "disabled";
> +		};
> +
>  		ledc: led-controller@2008000 {
>  			compatible = "allwinner,sun55i-a523-ledc",
>  				     "allwinner,sun50i-a100-ledc";
> @@ -927,6 +938,23 @@ r_i2c_pins: r-i2c-pins {
>  				allwinner,pinmux = <2>;
>  				function = "r_i2c0";
>  			};
> +
> +			r_ir_rx_pin: r-ir-rx-pin {
> +				pins = "PL11";
> +				allwinner,pinmux = <2>;
> +				function = "s_cir";

I think the function name should be "s_cir_rx", as there are IR TX pins
as well. And we used "{s_,}[c]ir_rx" for previous SoCs already.

Cheers,
Andre

> +			};
> +		};
> +
> +		r_ir: ir@7040000 {
> +			compatible = "allwinner,sun55i-a523-ir",
> +				     "allwinner,sun6i-a31-ir";
> +			reg = <0x07040000 0x400>;
> +			interrupts = <GIC_SPI 167 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&r_ccu CLK_BUS_R_IR_RX>, <&r_ccu CLK_R_IR_RX>;
> +			clock-names = "apb", "ir";
> +			resets = <&r_ccu RST_BUS_R_IR_RX>;
> +			status = "disabled";
>  		};
>  
>  		pck600: power-controller@7060000 {

