Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DEAD1870
	for <linux-sunxi@lists.linux.dev>; Sun, 21 Apr 2024 01:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713661603; cv=none; b=Gv540hmygdxsQ1c0f6pCj7cha11aeDj9YndSmXkb1RuZbCWPcYvMF0lnrHl1gDYES4og2zDfKZXU9KQUgwkv4Vj+A9AlhjnL9ONWV++Mkffr6wXcyNDlPGmmOQzynJISWiF7GX0eiLOhbE9nk/+vasKkfF6rcLIbw3CsROORcHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713661603; c=relaxed/simple;
	bh=uldYLoxlo4OBNtF6pqodmofXuBfCT/REdYJSZ/7AfDM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=N4BwGK44qDeKCpM1yOsVhVpNqh0feFHrNjJ5PhN2SDSxuCmk0M5Xkx8uGORRWYppMwiCc9FJGxj4v6WF2/xz5fFAshyvJHPfS8IStWvzIPYQO8Zw4WQnOvjgQ2ZarmNbghK8KGnFqNpulzdVOzODtuYxuXlqg3AUQDczQZ/Cfao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 23190143D;
	Sat, 20 Apr 2024 18:07:10 -0700 (PDT)
Received: from minigeek.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DEA963F792;
	Sat, 20 Apr 2024 18:06:39 -0700 (PDT)
Date: Sun, 21 Apr 2024 02:06:27 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Ryan Walklin <ryan@testtoast.com>
Cc: Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel
 Holland <samuel@sholland.org>, Chris Morgan <macromorgan@hotmail.com>,
 devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 4/5] arm64: dts: allwinner: h700: Add RG35XX-H DTS
Message-ID: <20240421020627.6d186f8f@minigeek.lan>
In-Reply-To: <20240420104354.334947-10-ryan@testtoast.com>
References: <20240420104354.334947-5-ryan@testtoast.com>
	<20240420104354.334947-10-ryan@testtoast.com>
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

On Sat, 20 Apr 2024 22:43:58 +1200
Ryan Walklin <ryan@testtoast.com> wrote:

Hi,

> The RG35XX-H adds thumbsticks, a stereo speaker, and a second USB port to the RG35XX-Plus, and has a horizontal form factor.
> 
> Enabled in this DTS:
> - Thumbsticks
> - Second USB port
> 
> Changelog v1..v2:
> - Update copyright
> - Spaces -> Tabs
> - Add GP ADC joystick axes and mux [1]
> - Add EHCI/OHCI1 for second USB port and add vbus supply
> 
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>
> 
> [1]: https://lore.kernel.org/linux-sunxi/20240417170423.20640-1-macroalpha82@gmail.com/T/#t

As mention on patch 2/5, this might be better an optional dependency,
so the GPADC part might be a separate patch.

> 
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>
> ---
>  .../sun50i-h700-anbernic-rg35xx-h.dts         | 126 ++++++++++++++++++
>  1 file changed, 126 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-h.dts
> 
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-h.dts b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-h.dts
> new file mode 100644
> index 000000000000..d62cf5cd9d9b
> --- /dev/null
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-h.dts
> @@ -0,0 +1,126 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +/*
> + * Copyright (C) 2024 Ryan Walklin <ryan@testtoast.com>.
> + * Copyright (C) 2024 Chris Morgan <macroalpha82@gmail.com>.
> + */
> +
> +#include "sun50i-h700-anbernic-rg35xx-plus.dts"
> +
> +/ {
> +	model = "Anbernic RG35XX H";
> +	compatible = "anbernic,rg35xx-h", "allwinner,sun50i-h700";
> +
> +	adc-joystick {
> +		compatible = "adc-joystick";
> +		io-channels = <&adc_mux 0>,
> +				  <&adc_mux 1>,
> +				  <&adc_mux 2>,
> +				  <&adc_mux 3>;
> +		pinctrl-0 = <&joy_mux_pin>;
> +		pinctrl-names = "default";
> +		poll-interval = <60>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		axis@0 {
> +			reg = <0>;
> +			abs-flat = <32>;
> +			abs-fuzz = <32>;
> +			abs-range = <4096 0>;
> +			linux,code = <ABS_X>;
> +		};
> +
> +		axis@1 {
> +			reg = <1>;
> +			abs-flat = <32>;
> +			abs-fuzz = <32>;
> +			abs-range = <0 4096>;
> +			linux,code = <ABS_Y>;
> +		};
> +
> +		axis@2 {
> +			reg = <2>;
> +			abs-flat = <32>;
> +			abs-fuzz = <32>;
> +			abs-range = <0 4096>;
> +			linux,code = <ABS_RX>;
> +		};
> +
> +		axis@3 {
> +			reg = <3>;
> +			abs-flat = <32>;
> +			abs-fuzz = <32>;
> +			abs-range = <4096 0>;
> +			linux,code = <ABS_RY>;
> +		};
> +	};
> +
> +	adc_mux: adc-mux {
> +		compatible = "io-channel-mux";
> +		channels = "left_x", "left_y", "right_x", "right_y";
> +		#io-channel-cells = <1>;
> +		io-channels = <&gpadc 0>;
> +		io-channel-names = "parent";
> +		mux-controls = <&gpio_mux>;
> +		settle-time-us = <100>;
> +	};
> +
> +	gpio_keys: gpio-keys-thumb {

Is there any reason to not just use the existing gpio-keys node?
Either put a label on it in patch 2/5, and reference that below,
outside of the root node, or use an absolute path reference.

> +		compatible = "gpio-keys";
> +
> +		button-thumbl {
> +			label = "GPIO Thumb Left";
> +			gpios = <&pio 4 8 GPIO_ACTIVE_LOW>; /* PE8 */
> +			linux,input-type = <EV_KEY>;
> +			linux,code = <BTN_THUMBL>;
> +		};
> +
> +		button-thumbr {
> +			label = "GPIO Thumb Right";
> +			gpios = <&pio 4 9 GPIO_ACTIVE_LOW>; /* PE9 */
> +			linux,input-type = <EV_KEY>;
> +			linux,code = <BTN_THUMBR>;
> +		};
> +	};
> +
> +	gpio_mux: mux-controller {
> +		compatible = "gpio-mux";
> +		mux-gpios = <&pio 8 1 GPIO_ACTIVE_LOW>,
> +				<&pio 8 2 GPIO_ACTIVE_LOW>; /* PI1, PI2 */
> +		#mux-control-cells = <0>;
> +	};
> +};
> +
> +&gpadc {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +	status = "okay";
> +
> +	channel@0 {
> +		reg = <0>;
> +	};
> +};
> +
> +&pio {
> +	joy_mux_pin: joy-mux-pin {
> +		pins = "PI0";
> +		function = "gpio_out";
> +	};
> +};
> +
> +&ehci1 {
> +	status = "okay";
> +};
> +
> +&ohci1 {
> +	status = "okay";
> +};
> +
> +&usbotg {
> +	dr_mode = "peripheral";
> +	status = "okay";
> +};
> +
> +&usbphy {
> +	usb1_vbus-supply = <&reg_vcc_usb>;

This is the dodgy USB supply chain. Any chance we can narrow this down,
to maybe one GPIO controlled regulator? Also, where does the boost
controller come into play here?

Cheers,
Andre

> +};

