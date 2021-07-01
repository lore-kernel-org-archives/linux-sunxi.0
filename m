Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F14472
	for <linux-sunxi@lists.linux.dev>; Thu,  1 Jul 2021 14:37:49 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 88799113E;
	Thu,  1 Jul 2021 07:37:48 -0700 (PDT)
Received: from slackpad.fritz.box (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A21A53F718;
	Thu,  1 Jul 2021 07:37:47 -0700 (PDT)
Date: Thu, 1 Jul 2021 15:37:20 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: qianfanguijin@163.com
Cc: linux-sunxi@lists.linux.dev, mripard@kernel.org, wens@csie.org,
 jernej.skrabec@gmail.com
Subject: Re: [PATCH 3/3] ARM: dts: sun8i: r40: bananapi-m2-ultra: Enable
 usb_otg
Message-ID: <20210701153720.42c1f512@slackpad.fritz.box>
In-Reply-To: <20210701015009.13985-3-qianfanguijin@163.com>
References: <20210701015009.13985-1-qianfanguijin@163.com>
	<20210701015009.13985-3-qianfanguijin@163.com>
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

On Thu,  1 Jul 2021 09:50:09 +0800
qianfanguijin@163.com wrote:

Hi,

> From: qianfan Zhao <qianfanguijin@163.com>
> 
> Enable it.
> 
> Signed-off-by: qianfan Zhao <qianfanguijin@163.com>
> ---
>  arch/arm/boot/dts/sun8i-r40-bananapi-m2-ultra.dts | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/sun8i-r40-bananapi-m2-ultra.dts b/arch/arm/boot/dts/sun8i-r40-bananapi-m2-ultra.dts
> index a6a1087a0c9b..072535b383b5 100644
> --- a/arch/arm/boot/dts/sun8i-r40-bananapi-m2-ultra.dts
> +++ b/arch/arm/boot/dts/sun8i-r40-bananapi-m2-ultra.dts
> @@ -43,6 +43,7 @@
>  
>  /dts-v1/;
>  #include "sun8i-r40.dtsi"
> +#include "sunxi-common-regulators.dtsi"
>  
>  #include <dt-bindings/gpio/gpio.h>
>  
> @@ -299,6 +300,11 @@
>  	regulator-name = "vdd1v2-sata";
>  };
>  
> +&reg_usb0_vbus {
> +	gpio = <&pio 8 13 GPIO_ACTIVE_HIGH>; /* PI13 */
> +	status = "okay";
> +};

So there is the same USB0-DRVVBUS signal connected to this GPIO, but
also to the AXP's N_VBUSEN line.

Not sure if that means either of them can control the voltage?

> +
>  &tcon_tv0 {
>  	status = "okay";
>  };
> @@ -328,7 +334,15 @@
>  	};
>  };
>  
> +&usb_otg {
> +	dr_mode = "peripheral";

That should be "otg", since we have a working ID pin and can control
VBUS.

> +	status = "okay";
> +};
> +
>  &usbphy {
> +	usb0_id_det-gpios = <&pio 8 4 GPIO_ACTIVE_HIGH>; /* PI4 */
> +	usb0_vbus_det-gpios = <&pio 8 8 GPIO_ACTIVE_HIGH>; /* PH8 */

The comment should say PI8.

I don't have the board, but can at least confirm that the GPIO pins
(PI4, PI8 and PI13) match the schematic.

Cheers,
Andre

> +	usb0_vbus-supply = <&reg_usb0_vbus>;
>  	usb1_vbus-supply = <&reg_vcc5v0>;
>  	usb2_vbus-supply = <&reg_vcc5v0>;
>  	status = "okay";

