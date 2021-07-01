Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE5C072
	for <linux-sunxi@lists.linux.dev>; Thu,  1 Jul 2021 14:40:00 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C34FCD6E;
	Thu,  1 Jul 2021 07:30:07 -0700 (PDT)
Received: from slackpad.fritz.box (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E33A83F718;
	Thu,  1 Jul 2021 07:30:06 -0700 (PDT)
Date: Thu, 1 Jul 2021 15:29:35 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: qianfanguijin@163.com
Cc: linux-sunxi@lists.linux.dev, mripard@kernel.org, wens@csie.org,
 jernej.skrabec@gmail.com
Subject: Re: [PATCH 2/3] ARM: dts: sun8i: r40: Add usb_otg device node
Message-ID: <20210701152935.19dc66a7@slackpad.fritz.box>
In-Reply-To: <20210701015009.13985-2-qianfanguijin@163.com>
References: <20210701015009.13985-1-qianfanguijin@163.com>
	<20210701015009.13985-2-qianfanguijin@163.com>
Organization: Arm Ltd.
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.31; x86_64-slackware-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu,  1 Jul 2021 09:50:08 +0800
qianfanguijin@163.com wrote:

Hi,

> From: qianfan Zhao <qianfanguijin@163.com>
> 
> R40's usb otg is compatibled with H3.
> 
> Signed-off-by: qianfan Zhao <qianfanguijin@163.com>
> ---
>  arch/arm/boot/dts/sun8i-r40.dtsi | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/sun8i-r40.dtsi b/arch/arm/boot/dts/sun8i-r40.dtsi
> index d5ad3b9efd12..3edc849d39be 100644
> --- a/arch/arm/boot/dts/sun8i-r40.dtsi
> +++ b/arch/arm/boot/dts/sun8i-r40.dtsi
> @@ -363,6 +363,20 @@
>  			#size-cells = <0>;
>  		};
>  
> +		usb_otg: usb@1c13000 {
> +			compatible = "allwinner,sun8i-h3-musb";

Please use a specific compatible string as well:
		compatible = "allwinner,sun8i-r40-musb",
			     "allwinner,sun8i-h3-musb";

The rest looks alright (base address, IRQ compared to the manual).

Thanks,
Andre



> +			reg = <0x01c13000 0x0400>;
> +			clocks = <&ccu CLK_BUS_OTG>;
> +			resets = <&ccu RST_BUS_OTG>;
> +			interrupts = <GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "mc";
> +			phys = <&usbphy 0>;
> +			phy-names = "usb";
> +			extcon = <&usbphy 0>;
> +			dr_mode = "otg";
> +			status = "disabled";
> +		};
> +
>  		usbphy: phy@1c13400 {
>  			compatible = "allwinner,sun8i-r40-usb-phy";
>  			reg = <0x01c13400 0x14>,

