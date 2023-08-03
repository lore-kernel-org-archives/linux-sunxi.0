Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4090A14A80
	for <linux-sunxi@lists.linux.dev>; Thu,  3 Aug 2023 12:39:19 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 92CB7113E;
	Thu,  3 Aug 2023 05:40:01 -0700 (PDT)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6CB4E3F6C4;
	Thu,  3 Aug 2023 05:39:15 -0700 (PDT)
Date: Thu, 3 Aug 2023 13:39:13 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Martin Botka <martin@biqu3d.com>
Cc: Konrad Dybcio <konrad.dybcio@somainline.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@somainline.org>, Marijn Suijten
 <marijn.suijten@somainline.org>, Jami Kettunen
 <jamipkettunen@somainline.org>, Paul Bouchara
 <paul.bouchara@somainline.org>, Martin Botka <martin.botka@somainline.org>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Andrew Lunn <andrew@lunn.ch>, Icenowy
 Zheng <uwu@icenowy.me>, Ludwig Kormann <ludwig.kormann@ict42.de>, Heiko
 Stuebner <heiko@sntech.de>, Shawn Guo <shawnguo@kernel.org>, Bjorn
 Andersson <andersson@kernel.org>, Chris Morgan <macromorgan@hotmail.com>,
 Jagan Teki <jagan@edgeble.ai>, Maxime Ripard <mripard@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 6/6] arm64: dts: allwinner: h616: Add BigTreeTech Pi
 support
Message-ID: <20230803133913.368d055d@donnerap.manchester.arm.com>
In-Reply-To: <DFE9B2F1349F69AE+20230802220309.163804-7-martin@biqu3d.com>
References: <20230802220309.163804-1-martin@biqu3d.com>
	<DFE9B2F1349F69AE+20230802220309.163804-7-martin@biqu3d.com>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu,  3 Aug 2023 00:02:39 +0200
Martin Botka <martin@biqu3d.com> wrote:

Hi,

> The BigTreeTech Pi is an H616 based board based on CB1.
> Just in Rpi format board.
> 
> It features the same internals as BTT CB1 but adds:
>     - Fan port
>     - IR receiver

You would then need to enable the "ir" node, check the X96 Mate .dts.

And I think this "ADXL345 SPI" connector justifies enabling the respective
SPI node.

>     - 24V DC power supply via terminal plugs
>     - USB to CAN module connector (The actual USB to CAN happens on the external module)

Still confused how this works. So you would need to connect an USB->CAN
adapter to one of the USB ports, but how do you feed the CAN signal back
to the board? Or if this is done via this port, where does it go then? To
the GPIO header?

> List of currently working things is the same as BTT CB1.
> 
> Signed-off-by: Martin Botka <martin@biqu3d.com>
> ---
>  .../allwinner/sun50i-h616-bigtreetech-pi.dts  | 44 +++++++++++++++++++

Please wire this up in the Makefile as well, otherwise we will miss out on
the build testing and DTB checking.

>  1 file changed, 44 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-pi.dts
> 
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-pi.dts b/arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-pi.dts
> new file mode 100644
> index 000000000000..05f39b3606ba
> --- /dev/null
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-pi.dts
> @@ -0,0 +1,44 @@
> +// SPDX-License-Identifier: (GPL-2.0+ or MIT)
> +/*
> + * Copyright (C) 2023 Martin Botka <martin@biqu3d.com>.
> + */
> +
> +/dts-v1/;
> +
> +#include "sun50i-h616-bigtreetech-cb1.dtsi"
> +
> +/ {
> +	compatible = "bigtreetech,pi", "allwinner,sun50i-h616";
> +};
> +
> +&ehci0 {
> +	status = "okay";
> +};
> +
> +&ohci0 {
> +	status = "okay";
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
> +&ehci2 {
> +	status = "okay";
> +};
> +
> +&ohci2 {
> +	status = "okay";
> +};
> +
> +&ehci3 {
> +	status = "okay";
> +};
> +
> +&ohci3 {
> +	status = "okay";
> +};

Oh wow, it really connects all four USB ports directly to the SoC? Nice.
Do you have access to the schematic to check what the power supply
situation is? Are all ports hardwired to a fixed 5V source?

And you would of course need to adjust this file according to the
changes requested in the previous patch, so that you have the UART,
stdout-path and other moved nodes in here.

Cheers,
Andre
