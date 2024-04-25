Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9CAA80C
	for <linux-sunxi@lists.linux.dev>; Thu, 25 Apr 2024 00:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714005157; cv=none; b=NWwA4Ry6jyfyeBkclJoWkcN6uubbKZ70NFtJ2ceZvYmZ7zxTBWyYn9wHLHNGx3jABxRZZImBVUjkPQKcnn9CUpLe/gZYjwrF80UD91TEaqxhi7CkGwvh8laNZCjGi2H39tcyeSt5EfqhxjxVUuklLn2tsedlIvQsMag7xqpoeMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714005157; c=relaxed/simple;
	bh=5H/Z7gM89SZUIXEIwFJ70MkbFoxa3IkTi9/ZcuM4h/o=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sT3xps8NGMF1uHqWp/+TIBKzt5McToJeAobt5rfjzFWaHksvwj8sI0yNdrblkDE9Skwzn8d1RGORGxoz7VAH9Bf4XLQfr8Ybqe4mvSZs+V3fZWRHu+kOd8E1mRJkRUGhJplew4m/11uUImWS3Ggayymp37oatj7NIcZw0aCc8U0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 966451007;
	Wed, 24 Apr 2024 17:33:02 -0700 (PDT)
Received: from minigeek.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 33F9B3F7BD;
	Wed, 24 Apr 2024 17:32:33 -0700 (PDT)
Date: Thu, 25 Apr 2024 01:32:12 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Ryan Walklin <ryan@testtoast.com>
Cc: Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel
 Holland <samuel@sholland.org>, Chris Morgan <macromorgan@hotmail.com>,
 devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v3 3/4] arm64: dts: allwinner: h700: Add RG35XX-Plus DTS
Message-ID: <20240425013212.0318bf72@minigeek.lan>
In-Reply-To: <20240424110947.9057-4-ryan@testtoast.com>
References: <20240424110947.9057-1-ryan@testtoast.com>
	<20240424110947.9057-4-ryan@testtoast.com>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 24 Apr 2024 23:09:46 +1200
Ryan Walklin <ryan@testtoast.com> wrote:

Hi,

> The RG35XX-Plus adds a RTL8221CS SDIO Wifi/BT chip to the RG35XX (2024).
> 
> Enabled in this DTS:
> - WiFi
> - Bluetooth
> - Supporting power sequence and GPIOs
> 
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>
> ---
> Changelog v1..v2:
> - Update copyright
> - Spaces -> Tabs
> - Remove redundant &uart0 node and DTS version tag
> - Add GPIO bank comments
> - Use generic pwrseq name
> 
> Changelog v2..v3:
> - Add DTB to Makefile
> - Correct Wifi vqmmc-supply to ALDO4
> - Move changelog below fold-line
> 
> ---
>  arch/arm64/boot/dts/allwinner/Makefile        |  1 +
>  .../sun50i-h700-anbernic-rg35xx-plus.dts      | 53 +++++++++++++++++++
>  2 files changed, 54 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-plus.dts
> 
> diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot/dts/allwinner/Makefile
> index 6f997157968e..4217328b1889 100644
> --- a/arch/arm64/boot/dts/allwinner/Makefile
> +++ b/arch/arm64/boot/dts/allwinner/Makefile
> @@ -48,3 +48,4 @@ dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h618-orangepi-zero2w.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h618-orangepi-zero3.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h618-transpeed-8k618-t.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h700-anbernic-rg35xx-2024.dtb
> +dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h700-anbernic-rg35xx-plus.dtb
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-plus.dts b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-plus.dts
> new file mode 100644
> index 000000000000..7e9d45eccb10
> --- /dev/null
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-plus.dts
> @@ -0,0 +1,53 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +/*
> + * Copyright (C) 2024 Ryan Walklin <ryan@testtoast.com>.
> + */
> +
> +#include "sun50i-h700-anbernic-rg35xx-2024.dts"
> +
> +/ {
> +	model = "Anbernic RG35XX Plus";
> +	compatible = "anbernic,rg35xx-plus", "allwinner,sun50i-h700";
> +
> +	wifi_pwrseq: pwrseq {
> +		compatible = "mmc-pwrseq-simple";
> +		clocks = <&rtc CLK_OSC32K_FANOUT>;
> +		clock-names = "ext_clock";
> +		pinctrl-0 = <&x32clk_fanout_pin>;
> +		pinctrl-names = "default";
> +		post-power-on-delay-ms = <200>;
> +		reset-gpios = <&pio 6 18 GPIO_ACTIVE_LOW>; /* PG18 */
> +	};
> +};
> +
> +/* SDIO WiFi RTL8821CS */
> +&mmc1 {
> +	vmmc-supply = <&reg_cldo4>;
> +	vqmmc-supply = <&reg_aldo4>;
> +	mmc-pwrseq = <&wifi_pwrseq>;
> +	bus-width = <4>;
> +	non-removable;
> +	status = "okay";
> +
> +	sdio_wifi: wifi@1 {
> +	   reg = <1>;
> +	   interrupt-parent = <&pio>;
> +	   interrupts = <6 15 IRQ_TYPE_LEVEL_LOW>; /* PG15 */
> +	   interrupt-names = "host-wake";

Those four lines here need to be indented with two tabs.

With that fixed:
Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre

> +	};
> +};
> +
> +/* Bluetooth RTL8821CS */
> +&uart1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&uart1_pins>, <&uart1_rts_cts_pins>;
> +	uart-has-rtscts;
> +	status = "okay";
> +
> +	bluetooth {
> +		compatible = "realtek,rtl8821cs-bt", "realtek,rtl8723bs-bt";
> +		device-wake-gpios = <&pio 6 17 GPIO_ACTIVE_HIGH>; /* PG17 */
> +		enable-gpios = <&pio 6 19 GPIO_ACTIVE_HIGH>; /* PG19 */
> +		host-wake-gpios = <&pio 6 16 GPIO_ACTIVE_HIGH>; /* PG16 */
> +	};
> +};

