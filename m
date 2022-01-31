Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B79A2C9E
	for <linux-sunxi@lists.linux.dev>; Mon, 31 Jan 2022 10:19:39 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 25ECAD6E;
	Mon, 31 Jan 2022 02:19:38 -0800 (PST)
Received: from donnerap.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3DC443F774;
	Mon, 31 Jan 2022 02:19:37 -0800 (PST)
Date: Mon, 31 Jan 2022 10:14:28 +0000
From: Andre Przywara <andre.przywara@foss.arm.com>
To: Jesse Taube <mr.bossman075@gmail.com>
Cc: devicetree@vger.kernel.org, robh+dt@kernel.org,
 linux-sunxi@lists.linux.dev, mripard@kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 3/4] ARM: dtsi: suniv: Add mmc to f1c100s dtsi.
Message-ID: <20220131101428.58f19968@donnerap.cambridge.arm.com>
In-Reply-To: <20220130220325.1983918-3-Mr.Bossman075@gmail.com>
References: <20220130220325.1983918-1-Mr.Bossman075@gmail.com>
	<20220130220325.1983918-3-Mr.Bossman075@gmail.com>
Organization: ARM
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 30 Jan 2022 17:03:24 -0500
Jesse Taube <mr.bossman075@gmail.com> wrote:

> Add mmc0 and 1 for f1c100s dtsi.
> 
> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>

The numbers looks alright, just one thing below:

> ---
> V1 -> V2:
> * Split patch
> ---
>  arch/arm/boot/dts/suniv-f1c100s.dtsi | 41 ++++++++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/suniv-f1c100s.dtsi b/arch/arm/boot/dts/suniv-f1c100s.dtsi
> index 953228cc8d52..60fa56c278a8 100644
> --- a/arch/arm/boot/dts/suniv-f1c100s.dtsi
> +++ b/arch/arm/boot/dts/suniv-f1c100s.dtsi
> @@ -96,6 +96,11 @@ uart0_pe_pins: uart0-pe-pins {
>  				pins = "PE0", "PE1";
>  				function = "uart0";
>  			};
> +
> +			mmc0_pins: mmc0-pins {
> +				pins = "PF0", "PF1", "PF2", "PF3", "PF4", "PF5";
> +				function = "mmc0";
> +			};
>  		};
>  
>  		timer@1c20c00 {
> @@ -111,6 +116,42 @@ wdt: watchdog@1c20ca0 {
>  			reg = <0x01c20ca0 0x20>;
>  		};
>  
> +		mmc0: mmc@1c0f000 {
> +			compatible = "allwinner,suniv-f1c100s-mmc",
> +				     "allwinner,sun7i-a20-mmc";
> +			reg = <0x01c0f000 0x1000>;
> +			clocks = <&ccu CLK_BUS_MMC0>,
> +				 <&ccu CLK_MMC0>,
> +				 <&ccu CLK_MMC0_OUTPUT>,
> +				 <&ccu CLK_MMC0_SAMPLE>;
> +			clock-names = "ahb", "mmc", "output", "sample";
> +			resets = <&ccu RST_BUS_MMC0>;
> +			reset-names = "ahb";

The A20 does not have a reset control for the MMC controllers. It looks
like the Linux driver is fine with this (it always tries to get a reset
control, but treats it as optional), and the binding makes it optional for
all compatibles.
I just wonder if that would need to be strengthened in the binding? At the
cost of dropping the sun7i-a20-mmc fallback here? Or do we keep at least
the A20 supporting both, so that existing kernel can support this device?
Or do we not care and just keep the reset control deliberately optional
for all SoCs?

The other bits check out when compared to the manual, though the
full compatibility to the A20 is more a less an assumption at this point.
At least the clock story seems to match (non-calibrate, extra sample
clocks).

Cheers,
Andre

> +			interrupts = <23>;
> +			pinctrl-names = "default";
> +			pinctrl-0 = <&mmc0_pins>;
> +			status = "disabled";
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +		};
> +
> +		mmc1: mmc@1c10000 {
> +			compatible = "allwinner,suniv-f1c100s-mmc",
> +				     "allwinner,sun7i-a20-mmc";
> +			reg = <0x01c10000 0x1000>;
> +			clocks = <&ccu CLK_BUS_MMC1>,
> +				 <&ccu CLK_MMC1>,
> +				 <&ccu CLK_MMC1_OUTPUT>,
> +				 <&ccu CLK_MMC1_SAMPLE>;
> +			clock-names = "ahb", "mmc", "output", "sample";
> +			resets = <&ccu RST_BUS_MMC1>;
> +			reset-names = "ahb";
> +			interrupts = <24>;
> +			status = "disabled";
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +		};
> +
>  		uart0: serial@1c25000 {
>  			compatible = "snps,dw-apb-uart";
>  			reg = <0x01c25000 0x400>;

