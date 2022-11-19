Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32F703C36
	for <linux-sunxi@lists.linux.dev>; Sat, 19 Nov 2022 18:16:33 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8A8891FB;
	Sat, 19 Nov 2022 10:16:32 -0800 (PST)
Received: from slackpad.lan (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4C4493F587;
	Sat, 19 Nov 2022 10:16:24 -0800 (PST)
Date: Sat, 19 Nov 2022 18:14:59 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Renze Nicolai <renze@rnplus.nl>
Cc: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Chen-Yu Tsai <wens@csie.org>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 Maxime Ripard <maxime@cerno.tech>, Conley Lee <conleylee@foxmail.com>,
 Andrew Lunn <andrew@lunn.ch>, krzysztof.kozlowski@linaro.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: allwinner: a64: add device tree for SOPINE
 on Pine64 Clusterboard
Message-ID: <20221119181459.7a264ddd@slackpad.lan>
In-Reply-To: <3351526.aeNJFYEL58@werkpc>
References: <3351526.aeNJFYEL58@werkpc>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 19 Nov 2022 13:31:59 +0100
Renze Nicolai <renze@rnplus.nl> wrote:

> The Pine64 SOPINE Clusterboard is a mini-ITX sized board capable
> of hosting up-to 7 SOPINE modules. It is largely compatible
> with the SOPINE baseboard but it omits most of the in- and
> output interfaces. Also The Clusterboard needs a tx delay
> of 500ps for ethernet to work.
> 
> Add a device tree for SOPINE on the Pine64 Clusterboard.
> 
> Signed-off-by: Renze Nicolai <renze@rnplus.nl>
> ---
>  arch/arm64/boot/dts/allwinner/Makefile           |  1 +
>  .../allwinner/sun50i-a64-sopine-clusterboard.dts | 16 ++++++++++++++++
>  2 files changed, 17 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-a64-sopine-
> clusterboard.dts
> 
> diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot/dts/
> allwinner/Makefile
> index 6a96494a2e0a..15b011d1aaea 100644
> --- a/arch/arm64/boot/dts/allwinner/Makefile
> +++ b/arch/arm64/boot/dts/allwinner/Makefile
> @@ -15,6 +15,7 @@ dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-pinephone-1.2.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-pinetab.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-pinetab-early-adopter.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-sopine-baseboard.dtb
> +dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-sopine-clusterboard.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-teres-i.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a100-allwinner-perf1.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h5-bananapi-m2-plus.dtb
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-sopine-clusterboard.dts 
> b/arch/arm64/boot/dts/allwinner/sun50i-a64-sopine-clusterboard.dts
> new file mode 100644
> index 000000000000..f75325d43d76
> --- /dev/null
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-sopine-clusterboard.dts
> @@ -0,0 +1,16 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +// Copyright (c) 2022 Renze Nicolai <renze@rnplus.nl>
> +
> +/dts-v1/;

Since you include a complete .dts (not a .dtsi) below, you don't need
the dts-v1 tag, as this is provided by the baseboard.dts. That's the
same situation as with the Pine64 LTS.

Cheers,
Andre

> +
> +#include "sun50i-a64-sopine-baseboard.dts"
> +
> +/ {
> +	model = "SOPINE with clusterboard";
> +	compatible = "pine64,sopine-clusterboard", "pine64,sopine",
> +		     "allwinner,sun50i-a64";
> +};
> +
> +&emac {
> +	allwinner,tx-delay-ps = <500>;
> +};

