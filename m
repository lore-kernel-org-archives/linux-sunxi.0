Received: from relay02.th.seeweb.it (relay02.th.seeweb.it [5.144.164.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 696521842
	for <linux-sunxi@lists.linux.dev>; Mon, 14 Aug 2023 08:09:54 +0000 (UTC)
Received: from [192.168.2.144] (bband-dyn221.178-41-211.t-com.sk [178.41.211.221])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by m-r1.th.seeweb.it (Postfix) with ESMTPSA id BAFB91F4FF;
	Mon, 14 Aug 2023 10:09:50 +0200 (CEST)
Date: Mon, 14 Aug 2023 10:09:44 +0200
From: Martin Botka <martin.botka@somainline.org>
Subject: Re: [PATCH v5 0/4] Add BigTreeTech CB1 SoM & Boards
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>
Cc: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, Andre Przywara <andre.przywara@arm.com>, Alan Ma
	<tech@biqu3d.com>, Marijn Suijten <marijn.suijten@somainline.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
	Konrad Dybcio <konrad.dybcio@somainline.org>, Martin Botka
	<martin@biqu3d.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Message-Id: <80GDZR.UVN8MW510YHA2@somainline.org>
In-Reply-To: <20230814-b4-cb1-v5-0-92135086dee4@somainline.org>
References: <20230814-b4-cb1-v5-0-92135086dee4@somainline.org>
X-Mailer: geary/43.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed



On Mon, Aug 14 2023 at 10:07:02 AM +02:00:00, Martin Botka 
<martin.botka@somainline.org> wrote:
> Hello,
> This series adds a vendor prefix for BigTreeTech and adds BigTreeTech 
> CB1,
> Manta board and BigTreeTech Pi.
> 
> CB1 is just an SoM thats based on AllWinner H616.
> BigTreeTech Manta boards are expander boards for CB1 and BigTreeTech 
> Pi
> is an CB1 in Rpi style with few additional things like IR receiver 
> and fan port
> on GPIO.
> 
> This work started before I was hired by BigTreeTech and thus majority 
> of the
> patches are from SoMainline email and few are from my work email.
> 
> This series depends on commit https://lkml.org/lkml/2023/8/2/801
> "dt-bindings: mfd: x-powers,axp152: make interrupt optional for more 
> chips".
> 
> Due to the threading issues v5 is sent via my SoMainline email.
> 
> Cheers,
> Martin
> 
> Signed-off-by: Martin Botka <martin.botka@somainline.org>
> ---
Forgot to add it here
Changes in v5:
- Removal of wifi node comments that were obvious from properties
> Changes in v4:
> - Extend the range of vcc-dram to 1.5V (Max of 1.35V caused issues 
> with booting up)
> 
> Changes in v3:
> - Add missed semicolons
> - Move model string from dtsi to board dts
> - Add cb1 compatible to manta
> - Remove extra empty lines
> - Add pinctrl for SPI0
> 
> Changes in v2:
> - Fix alphabetical order in vendor prefixes
> - Remove CB1 SoM from bindings (Its not standalone)
> - Fixed whitespace errors
> - Move UART into carrier boards and BTT Pi
> - Remove usb1-vbus regulator
> - Fix ranges and naming of AXP313A rails
> - Add comment why broken-cb in mmc0 is needed
> - Rename sdio_wifi to wifi
> - Add model string to BTT Pi
> - Enable IR receiver for BTT Pi
> - Enable SPI0
> 
> ---
> Martin Botka (4):
>       dt-bindings: vendor-prefixes: Add BigTreeTech
>       dt-bindings: arm: sunxi: Add BigTreeTech boards
>       arm64: dts: allwinner: h616: Add BigTreeTech CB1 SoM & boards 
> support
>       arm64: dts: allwinner: h616: Add BigTreeTech Pi support
> 
>  Documentation/devicetree/bindings/arm/sunxi.yaml   |  11 ++
>  .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
>  arch/arm64/boot/dts/allwinner/Makefile             |   2 +
>  .../sun50i-h616-bigtreetech-cb1-manta.dts          |  35 ++++++
>  .../dts/allwinner/sun50i-h616-bigtreetech-cb1.dtsi | 138 
> +++++++++++++++++++++
>  .../dts/allwinner/sun50i-h616-bigtreetech-pi.dts   |  70 +++++++++++
>  6 files changed, 258 insertions(+)
> ---
> base-commit: 7935746bb793571417f832f0f1c8852cfdfccc06
> change-id: 20230814-b4-cb1-4b18801ecf6e
> 
> Best regards,
> --
> Martin Botka <martin.botka@somainline.org>
> 


