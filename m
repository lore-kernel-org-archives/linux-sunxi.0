Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB20370
	for <linux-sunxi@lists.linux.dev>; Mon, 21 Jun 2021 00:35:24 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8E809D6E;
	Sun, 20 Jun 2021 17:35:24 -0700 (PDT)
Received: from slackpad.fritz.box (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A82803F718;
	Sun, 20 Jun 2021 17:35:23 -0700 (PDT)
Date: Mon, 21 Jun 2021 01:35:07 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Qianfan Zhao <qianfanguijin@163.com>
Cc: u-boot@lists.denx.de, Icenowy Zheng <icenowy@aosc.io>, Chen-Yu Tsai
 <wens@csie.org>, Jagan Teki <jagan@amarulasolutions.com>, linux-sunxi
 <linux-sunxi@lists.linux.dev>
Subject: Re: [PATCH 3/4] dts: bpi-m2u: Enable USB_OTG by default
Message-ID: <20210621013507.2efed026@slackpad.fritz.box>
In-Reply-To: <20210616023326.18135-3-qianfanguijin@163.com>
References: <20210616023326.18135-1-qianfanguijin@163.com>
	<20210616023326.18135-3-qianfanguijin@163.com>
Organization: Arm Ltd.
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.31; x86_64-slackware-linux-gnu)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 16 Jun 2021 10:33:25 +0800
qianfanguijin@163.com (qianfanguijin@163.com) wrote:

Hi,

in general this patch looks mostly alright (see below), but this needs
to go through Linux first, since we only sync DTs this way.

Some comments below, for when you send this to Linux:

> From: qianfan Zhao <qianfanguijin@163.com>
> 
> bpi-m2u has a hardware usb_otg, let's enable it in dts.
> 
> Signed-off-by: qianfan Zhao <qianfanguijin@163.com>
> ---
>  arch/arm/dts/sun8i-r40-bananapi-m2-ultra.dts |  4 ++++
>  arch/arm/dts/sun8i-r40.dtsi                  | 13 +++++++++++++
>  2 files changed, 17 insertions(+)
> 
> diff --git a/arch/arm/dts/sun8i-r40-bananapi-m2-ultra.dts b/arch/arm/dts/sun8i-r40-bananapi-m2-ultra.dts
> index a6a1087a0c..828ddc63ae 100644
> --- a/arch/arm/dts/sun8i-r40-bananapi-m2-ultra.dts
> +++ b/arch/arm/dts/sun8i-r40-bananapi-m2-ultra.dts
> @@ -117,6 +117,10 @@
>  	status = "okay";
>  };
>  
> +&usb_otg {

Please keep this sorted alphabetically, so it belongs just above the
usbphy node below.
And please put the dr_mode property here (even though U-Boot ignores
this, AFAIK).
Also we would need the USB-ID and power supply in the PHY node
below, compare other DTs with a micro-USB socket and proper VBUS
support.

> +	status = "okay";
> +};
> +
>  &ehci1 {
>  	status = "okay";
>  };
> diff --git a/arch/arm/dts/sun8i-r40.dtsi b/arch/arm/dts/sun8i-r40.dtsi
> index d5ad3b9efd..7c7a9cd9f8 100644
> --- a/arch/arm/dts/sun8i-r40.dtsi
> +++ b/arch/arm/dts/sun8i-r40.dtsi
> @@ -363,6 +363,19 @@
>  			#size-cells = <0>;
>  		};
>  
> +		usb_otg: usb@1c13000 {
> +			compatible = "allwinner,sun8i-r40-musb";

Since this is fully compatible with the H3, please use:
			compatible = "allwinner,sun8i-r40-musb",
				     "allwinner,sun8i-h3-musb";

This way we won't need code changes to the MUSB driver.

The rest (address, interrupt) look alright.

Cheers,
Andre


> +			reg = <0x01c13000 0x0400>;
> +			clocks = <&ccu CLK_BUS_OTG>;
> +			resets = <&ccu RST_BUS_OTG>;
> +			interrupts = <GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "mc";
> +			phys = <&usbphy 0>;
> +			phy-names = "usb";
> +			extcon = <&usbphy 0>;
> +			status = "disabled";
> +		};
> +
>  		usbphy: phy@1c13400 {
>  			compatible = "allwinner,sun8i-r40-usb-phy";
>  			reg = <0x01c13400 0x14>,

