Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 603505732B
	for <linux-sunxi@lists.linux.dev>; Sun, 14 Apr 2024 18:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713119840; cv=none; b=Ae3mCJq501NZR9goJe6Vqz05VgHUwfGVMZJrp8BOWBEgqtkM3Yv3H7RuQWUzw//XVrwRNcfLYVk1JbrDGgxWVlJY4k9qG59vsLmjYlbWV+IQFuEUFvNskomVYVN3UQUWkaW2SGnhhyTnPq/j/B6OQ/B50gDY/HZzOsidpp+RlsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713119840; c=relaxed/simple;
	bh=RZVfVHfiDkKN+97qkwuDrU6LAJCVY95cLG2p/+2L3JE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IeVMXMv04RNzo7R8aTCEnTBfMhbzqAhTkqC9V7FZhvkda11MLiaEkx5yHxD17qLJSaHRgAuZEeji0UBTAGUZGa+71lJOo6b6PFCup3SKz+PrIG80oxXP/0JWImBoOGOUBUnAYj57nivrMOnMs8E6/NmkxnsbjxCKAIV/1cVUFvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 01E7F339;
	Sun, 14 Apr 2024 11:37:46 -0700 (PDT)
Received: from minigeek.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 119EC3F792;
	Sun, 14 Apr 2024 11:37:15 -0700 (PDT)
Date: Sun, 14 Apr 2024 19:37:10 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Ryan Walklin <ryan@testtoast.com>
Cc: Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel
 Holland <samuel@sholland.org>, Chris Morgan <macromorgan@hotmail.com>,
 devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 3/4] arm64: dts: allwinner: h700: Add RG35XX-Plus DTS
Message-ID: <20240414193710.6ede3db4@minigeek.lan>
In-Reply-To: <20240414083347.131724-6-ryan@testtoast.com>
References: <20240414083347.131724-2-ryan@testtoast.com>
	<20240414083347.131724-6-ryan@testtoast.com>
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

On Sun, 14 Apr 2024 20:33:47 +1200
Ryan Walklin <ryan@testtoast.com> wrote:

Hi,

> From: Ryan Walklin <ryan@testtoast.com>
> 
> The RG35XX-Plus adds a RTL8221CS SDIO Wifi/BT chip to the RG35XX (2024).
> 
> Enabled in this DTS:
> - WiFi
> - Bluetooth
> - Supporting power sequence and GPIOs
> 
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>
> ---
>  .../sun50i-h700-anbernic-rg35xx-plus.dts      | 63 +++++++++++++++++++
>  1 file changed, 63 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-plus.dts
> 
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-plus.dts b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-plus.dts
> new file mode 100644
> index 000000000000..b9a163ed5d0b
> --- /dev/null
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-plus.dts
> @@ -0,0 +1,63 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +/*
> + * Copyright (C) 2024 Andre Przywara <andre.przywara@arm.com>.

I don't remember writing anything in here explicitly, so please remove
this copyright line.

> + * Copyright (C) 2024 Ryan Walklin <ryan@testtoast.com>.
> + * Copyright (C) 2024 Chris Morgan <macroalpha82@gmail.com>.
> + */
> +
> +/dts-v1/;

That line is already in the file included next, so please remove it
from here.

> +
> +#include "sun50i-h700-anbernic-rg35xx-2024.dts"
> +
> +/ {
> +    model = "Anbernic RG35XX Plus";
> +    compatible = "anbernic,rg35xx-plus", "allwinner,sun50i-h700";
> +
> +    wifi_pwrseq: wifi_pwrseq {
> +        compatible = "mmc-pwrseq-simple";
> +        clocks = <&rtc CLK_OSC32K_FANOUT>;
> +        clock-names = "ext_clock";
> +        pinctrl-0 = <&x32clk_fanout_pin>;
> +        pinctrl-names = "default";
> +        post-power-on-delay-ms = <200>;
> +        reset-gpios = <&pio 6 18 GPIO_ACTIVE_LOW>; /* PG18 */
> +    };
> +};
> +
> +/* SDIO WiFi RTL8821CS, powered by CLDO4, regon=PG18, hostwake=PG15 */
> +&mmc1 {
> +    vmmc-supply = <&reg_cldo4>;
> +    vqmmc-supply = <&reg_vcc1v8>;

That regulator should then also provide the PIO's vcc-pg-supply. And
maybe it should be renamed.

> +    mmc-pwrseq = <&wifi_pwrseq>;
> +    bus-width = <4>;
> +    non-removable;
> +    status = "okay";
> +
> +    sdio_wifi: wifi@1 {
> +       reg = <1>;
> +       interrupt-parent = <&pio>;
> +       interrupts = <6 15 IRQ_TYPE_LEVEL_LOW>; /* PG15 */
> +       interrupt-names = "host-wake";
> +    };
> +};
> +
> +&uart0 {
> +    pinctrl-names = "default";
> +    pinctrl-0 = <&uart0_ph_pins>;
> +    status = "okay";
> +};

That would be redundant, as the node is already contained in the base
.dts?

> +
> +/* Bluetooth RTL8821CS, RST_N: PG19, BT_WAKE: PG17, BT_HOSTWAKE: PG16 */
> +&uart1 {
> +    pinctrl-names = "default";
> +    pinctrl-0 = <&uart1_pins>, <&uart1_rts_cts_pins>;
> +    uart-has-rtscts;
> +    status = "okay";
> +
> +    bluetooth {
> +        compatible = "realtek,rtl8821cs-bt", "realtek,rtl8723bs-bt";
> +        device-wake-gpios = <&pio 6 17 GPIO_ACTIVE_HIGH>;
> +        enable-gpios = <&pio 6 19 GPIO_ACTIVE_HIGH>;
> +        host-wake-gpios = <&pio 6 16 GPIO_ACTIVE_HIGH>;

As usual, please add the GPIO names as a comment.

Cheers,
Andre

> +    };
> +};

