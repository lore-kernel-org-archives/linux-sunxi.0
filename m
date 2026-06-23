Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4B0A2DC76A
	for <linux-sunxi@lists.linux.dev>; Tue, 23 Jun 2026 15:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782228943; cv=none; b=U3D36xSHeEdcntsfD1eHwa/KQvwfAUp7rWdO2gzqkg7G2RPrkRSeMWJmVSSBRosbKrmvtWYIYSUrgFXLJpEI+Rcbu8Hy6aJRWgl9unez0CmrnP2d7pkm3DnKBfBRocSA0b0lqsMinTnN+AZd+PB0feX32ZRr+hQYxeaGcZzQmaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782228943; c=relaxed/simple;
	bh=Mo5yQHzaURvGYHb7CZmhngVSC2hCJb50rxMxvMmHtdU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=JxISrK3V0qnaSRgqTdGmK23Xri2wz9BdSjSWAQy26/BD/JvfnMLpYsb8CYpilYY8hvbMCcycnaAls5xGXI+blS++hZSo0CKxxgFD8+DAUxekCc1cru8ov6YqmZhZXKoVYQKAr7PnYoca1n1bUvoGy1wqa9giBDApykXfvojBGHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=pUApv8Eo; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="pUApv8Eo"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4924593f45dso327365e9.1
        for <linux-sunxi@lists.linux.dev>; Tue, 23 Jun 2026 08:35:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782228939; x=1782833739; darn=lists.linux.dev;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Tv+HFheUg03EfuoN4T+QaHYdh9A1PWG93ECLbXxMf3g=;
        b=pUApv8Eo00V2DCPYDfPd9IqLhkGm4t2loJTmnnqDXhG7BKu+BnhQ0AkFoxzAZHyOxf
         ae29tvc0pbmjFg9YcEmGOap0hukWrYarsLhnxw90ezzDMYYSkOzgK2pq7yJP6KI5Blhs
         hdR2dwwoVneujHRtE9wwaKDWLneTjykikHcS5Eu83hFkblS4Cnh1DPSS0ozUsRlLNmHx
         V6ZPdAZnnsMVPRUrkk31n0ugux1Vt+keUkSj5h2Q9xjDoj55GonWlHz3UTvn6Rg/tCA6
         kA9g2xJDhC4FIwHlQ/nP2In5CTwNy17YpS7o4rL4eSr/AfPoR8TIqhn3GgD7CaPzUhX4
         BbtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782228939; x=1782833739;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Tv+HFheUg03EfuoN4T+QaHYdh9A1PWG93ECLbXxMf3g=;
        b=Kq+A+x+EmndMyOGFl7C1syT7tKaRsrSGDyJCXqHT/QnRAsAj+VKYB6rpjkBcuQLRuj
         u2jt6jfvNqtSVSDlhPIRn06r5HhVY9rea8QXTX98gw+xiR9jZFZDiUeHVuEmOTDYY3/T
         FdJX0a8qva5m0poLegFIKqXnqeg2dyhLVrjaC+5jHKo3sbyXENwH0EWgD1Fby2OwWeJK
         xncxtQMw2zfBsWpcPvtmWSWcF+mTuETHqDmIgHtMy05wvUadggWmNAKulSbd5STecYPU
         ZTuSfVbHFf8tDBGzObhG9gUloJCQ8NQs2lLs78OFRyFI9pzYHwMqLVxBykk8uiZBeFRW
         V/oA==
X-Forwarded-Encrypted: i=1; AFNElJ8vtZVCpk+inU7KXKIajM/9jZBmuFyMVry1O1upyyjrM9o9G75BKeSf51VAYPwXIwEb/fDXuchrro5Ejg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy/Unenc7maAHLKu+0uKOyfCoOlnbqMO2Sz4CSW6iAXwpUcrQ8e
	lSLVlpPTvfhyjffu8H3sfYJgzMMiJ95f/yKJqSJDfpjIuvHGkVl5/ZE/hnkB6DgDtxU=
X-Gm-Gg: AfdE7cnffyrpTLQjr2HSrVodkxvGofK8FPyXl3i4kh7ykbH6mSQ764BYsKFlnxw+uO4
	2flYYsdBeBmL5hHHyAoy4eLacahw5kZADlXJPTyfHgkNG4yCqjwMi1CPfh2+JvM/eRSSZT2xXEv
	YO1ewXjYkK5aTO8ZgUXiJ7hiksSECgklL9LagC6giB2MRY1JRGshIUraaSFoWpSUnDlOsnyAxYP
	xFmUl+0OxYsvsUm7kL7oaWPS/4Fg5ZrhMIIahsTqlg/th3GQse2cbe2XTkRX/CbLg/6HYU9GZDI
	VT+r2XkCiPhBkVLAfkXqJh1EKHeYHVHMnkryZ2DQbnpYGC0prht4RCLr6GU8SsYtcUdVN4ytwYL
	YNw9Ugsg6S0/dtJ5eTAjxAB5/lYRQW+p3LTady45A0lhp1PFXw8KCapc2p2zOER9RG2ZO5zP1jG
	gbCZf/7DJzTg==
X-Received: by 2002:a05:600c:8b18:b0:490:e5c1:b8bf with SMTP id 5b1f17b1804b1-4925b38cfa9mr49681285e9.13.1782228939052;
        Tue, 23 Jun 2026 08:35:39 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:20f1:5c9:8a6d:48a1])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4923fe7b9e5sm370653045e9.10.2026.06.23.08.35.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 08:35:38 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Enzo Adriano via B4 Relay <devnull+enzo.adriano.code.gmail.com@kernel.org>
Cc: Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Chen-Yu Tsai
 <wens@kernel.org>,  Jernej Skrabec <jernej.skrabec@gmail.com>,  Samuel
 Holland <samuel@sholland.org>,  Maxime Ripard <mripard@kernel.org>,  Ulf
 Hansson <ulfh@kernel.org>,  enzo.adriano.code@gmail.com,
  devicetree@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-sunxi@lists.linux.dev,  linux-kernel@vger.kernel.org,
  linux-mmc@vger.kernel.org
Subject: Re: [PATCH 3/4] arm64: dts: allwinner: add Allwinner A733 SoC
In-Reply-To: <20260613-a733-dts-v1-public-ready-v1-3-7787c94681db@gmail.com>
	(Enzo Adriano via's message of "Sat, 13 Jun 2026 05:42:15 -0400")
References: <20260613-a733-dts-v1-public-ready-v1-0-7787c94681db@gmail.com>
	<20260613-a733-dts-v1-public-ready-v1-3-7787c94681db@gmail.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Tue, 23 Jun 2026 17:35:36 +0200
Message-ID: <1j33ydb77b.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On sam. 13 juin 2026 at 05:42, Enzo Adriano via B4 Relay <devnull+enzo.adriano.code.gmail.com@kernel.org> wrote:

> From: Enzo Adriano <enzo.adriano.code@gmail.com>
>
> Add the initial A733 SoC description with CPUs, timers, interrupt
> controller, clocks, pinctrl, UART0, and MMC0.
>
> Keep peripherals disabled by default. Board DTS files can enable only the
> devices that are proven on their hardware.
>
> Signed-off-by: Enzo Adriano <enzo.adriano.code@gmail.com>
> ---
>  arch/arm64/boot/dts/allwinner/sun60i-a733.dtsi | 198 +++++++++++++++++++++++++
>  1 file changed, 198 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/allwinner/sun60i-a733.dtsi b/arch/arm64/boot/dts/allwinner/sun60i-a733.dtsi
> new file mode 100644
> index 000000000000..3721aa9e8573
> --- /dev/null
> +++ b/arch/arm64/boot/dts/allwinner/sun60i-a733.dtsi
> @@ -0,0 +1,198 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
> +
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/clock/sun60i-a733-ccu.h>
> +#include <dt-bindings/reset/sun60i-a733-ccu.h>
> +
> +/ {
> +	interrupt-parent = <&gic>;
> +	#address-cells = <2>;
> +	#size-cells = <2>;
> +
> +	cpus {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		cpu0: cpu@0 {
> +			compatible = "arm,cortex-a55";
> +			device_type = "cpu";
> +			reg = <0x000>;
> +			enable-method = "psci";
> +			capacity-dmips-mhz = <530>;
> +		};
> +
> +		cpu1: cpu@100 {
> +			compatible = "arm,cortex-a55";
> +			device_type = "cpu";
> +			reg = <0x100>;
> +			enable-method = "psci";
> +			capacity-dmips-mhz = <530>;
> +		};
> +
> +		cpu2: cpu@200 {
> +			compatible = "arm,cortex-a55";
> +			device_type = "cpu";
> +			reg = <0x200>;
> +			enable-method = "psci";
> +			capacity-dmips-mhz = <530>;
> +		};
> +
> +		cpu3: cpu@300 {
> +			compatible = "arm,cortex-a55";
> +			device_type = "cpu";
> +			reg = <0x300>;
> +			enable-method = "psci";
> +			capacity-dmips-mhz = <530>;
> +		};
> +
> +		cpu4: cpu@400 {
> +			compatible = "arm,cortex-a55";
> +			device_type = "cpu";
> +			reg = <0x400>;
> +			enable-method = "psci";
> +			capacity-dmips-mhz = <530>;
> +		};
> +
> +		cpu5: cpu@500 {
> +			compatible = "arm,cortex-a55";
> +			device_type = "cpu";
> +			reg = <0x500>;
> +			enable-method = "psci";
> +			capacity-dmips-mhz = <530>;
> +		};
> +
> +		cpu6: cpu@600 {
> +			compatible = "arm,cortex-a76";
> +			device_type = "cpu";
> +			reg = <0x600>;
> +			enable-method = "psci";
> +			capacity-dmips-mhz = <1024>;
> +		};
> +
> +		cpu7: cpu@700 {
> +			compatible = "arm,cortex-a76";
> +			device_type = "cpu";
> +			reg = <0x700>;
> +			enable-method = "psci";
> +			capacity-dmips-mhz = <1024>;
> +		};
> +	};
> +
> +	osc24M: osc24M-clk {

Note A733 supports 19.2MHz, 24MHz and 26MHz xtals apparently.
The A7S and A7A do have a 26MHz xtal according to the schematics.

While this might be fine in the SoC dtsi, your are missing something in
your board dts to change the xtal rate, at least.

Also the node and clock name are a bit misleading now.

> +		#clock-cells = <0>;
> +		compatible = "fixed-clock";
> +		clock-frequency = <24000000>;
> +		clock-output-names = "osc24M";
> +	};
> +
> +	osc32k: osc32k-clk {
> +		#clock-cells = <0>;
> +		compatible = "fixed-clock";
> +		clock-frequency = <32768>;
> +		clock-output-names = "osc32k";

I think this is the ext32k supposed to feed the rtc ccu ...

> +	};
> +
> +	iosc: internal-osc-clk {
> +		#clock-cells = <0>;
> +		compatible = "fixed-clock";
> +		clock-frequency = <16000000>;
> +		clock-output-names = "iosc";
> +	};
> +
> +	psci {
> +		compatible = "arm,psci-1.0", "arm,psci-0.2";
> +		method = "smc";
> +	};
> +
> +	timer {
> +		compatible = "arm,armv8-timer";
> +		arm,no-tick-in-suspend;
> +		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_PPI 14 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_PPI 11 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_PPI 10 IRQ_TYPE_LEVEL_HIGH>;
> +	};
> +
> +	soc {
> +		compatible = "simple-bus";
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges = <0x0 0x0 0x0 0x40000000>;
> +
> +		pio: pinctrl@2000000 {
> +			compatible = "allwinner,sun60i-a733-pinctrl";
> +			reg = <0x02000000 0x600>;
> +			interrupts = <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 77 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 79 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 87 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&ccu CLK_APB1>, <&osc24M>, <&osc32k>;
> +			clock-names = "apb", "hosc", "losc";
> +			gpio-controller;
> +			#gpio-cells = <3>;
> +			interrupt-controller;
> +			#interrupt-cells = <3>;
> +
> +			mmc0_pins: mmc0-pins {
> +				pins = "PF0", "PF1", "PF2",
> +				       "PF3", "PF4", "PF5";
> +				function = "mmc0";
> +				drive-strength = <30>;
> +				bias-pull-up;
> +			};
> +		};
> +
> +		ccu: clock-controller@2002000 {
> +			compatible = "allwinner,sun60i-a733-ccu";
> +			reg = <0x02002000 0x2000>;
> +			clocks = <&osc24M>, <&osc32k>, <&iosc>;
                                                ^
... not directly the main CCU.

> +			clock-names = "hosc", "losc", "iosc";
> +			#clock-cells = <1>;
> +			#reset-cells = <1>;
> +		};
> +
> +		uart0: serial@2500000 {
> +			compatible = "snps,dw-apb-uart";
> +			reg = <0x02500000 0x400>;
> +			interrupts = <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;
> +			reg-shift = <2>;
> +			reg-io-width = <4>;
> +			clocks = <&ccu CLK_BUS_UART0>;
> +			resets = <&ccu RST_BUS_UART0>;
> +			status = "disabled";
> +		};
> +
> +		gic: interrupt-controller@3400000 {
> +			compatible = "arm,gic-v3";
> +			#interrupt-cells = <3>;
> +			interrupt-controller;
> +			reg = <0x03400000 0x10000>,
> +			      <0x03460000 0x100000>;
> +		};
> +
> +		mmc0: mmc@4020000 {
> +			compatible = "allwinner,sun60i-a733-mmc",
> +				     "allwinner,sun20i-d1-mmc";
> +			reg = <0x04020000 0x1000>;
> +			interrupts = <GIC_SPI 161 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&ccu CLK_BUS_MMC0>, <&ccu CLK_MMC0>;
> +			clock-names = "ahb", "mmc";
> +			resets = <&ccu RST_BUS_MMC0>;
> +			reset-names = "ahb";
> +			pinctrl-names = "default";
> +			pinctrl-0 = <&mmc0_pins>;
> +			max-frequency = <200000000>;
> +			cap-sd-highspeed;
> +			status = "disabled";
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +		};
> +	};
> +};

-- 
Jerome
