Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F262879FC
	for <linux-sunxi@lists.linux.dev>; Sat, 15 Jul 2023 17:25:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EECADC433C8;
	Sat, 15 Jul 2023 17:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689441924;
	bh=2rWa0saIx/aSMdEvevYBh+MQQSg3D2IqD2pink9uqAw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ehhFp2aPpwHHqcFgPeCL1aRVMT6SJUvZ0WbwW5z1GdEEHVzpkLgPuWV8jHGduq8S1
	 RVF2ykVEzsL3rBi31a/3Iu+dYS0nJqrH/Xphsl3DFfvW3YFp32q8BwSpSPxLzKwcTP
	 x9yO3DYNCagSY89ZgkOlaXPYZZZdGN2w/f/MQ+ootmn3o3uFglzPoxUX8ygl1d+6fD
	 /jed+oevOtn+4fAMcNoMWj8+sLgWPQ850ABlryL6OC6pD1CyTg7UAuP+m058Z7qGDr
	 tP2TCei67hN8ux/kvDFEcvFLMsvw1b0dVGELWwf/IbQZQDCT/y+18MC1PHPh8P2Hvf
	 dDcPQJAgg6vFA==
Date: Sat, 15 Jul 2023 18:25:10 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Michael Hennerich <michael.hennerich@analog.com>, Lars-Peter Clausen
 <lars@metafoo.de>, Alexandru Tachici <alexandru.tachici@analog.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Claudiu Beznea
 <claudiu.beznea@microchip.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Andy Gross
 <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio
 <konrad.dybcio@linaro.org>, Heiko Stuebner <heiko@sntech.de>, Orson Zhai
 <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan
 Zhang <zhang.lyra@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Chen-Yu Tsai
 <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland
 <samuel@sholland.org>, Crt Mori <cmo@melexis.com>,
 devicetree@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH] iio: adc: Explicitly include correct DT includes
Message-ID: <20230715182510.3d09970c@jic23-huawei>
In-Reply-To: <20230714174628.4057920-1-robh@kernel.org>
References: <20230714174628.4057920-1-robh@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 14 Jul 2023 11:46:26 -0600
Rob Herring <robh@kernel.org> wrote:

> The DT of_device.h and of_platform.h date back to the separate
> of_platform_bus_type before it as merged into the regular platform bus.
> As part of that merge prepping Arm DT support 13 years ago, they
> "temporarily" include each other. They also include platform_device.h
> and of.h. As a result, there's a pretty much random mix of those include
> files used throughout the tree. In order to detangle these headers and
> replace the implicit includes with struct declarations, users need to
> explicitly include the correct includes.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>

Hi Rob,

Just one in here that I noticed isn't quite right. I'd have fixed it 
up (and can still do so if nothing else comes up) but I want to give
this more time on list anyway so won't pick it up today.

Jonathan

> diff --git a/drivers/iio/adc/stmpe-adc.c b/drivers/iio/adc/stmpe-adc.c
> index 67518e460e05..55e36b40fdf5 100644
> --- a/drivers/iio/adc/stmpe-adc.c
> +++ b/drivers/iio/adc/stmpe-adc.c
> @@ -14,9 +14,10 @@
>  #include <linux/kernel.h>
>  #include <linux/mfd/stmpe.h>
>  #include <linux/module.h>
> -#include <linux/of_platform.h>
> +#include <linux/of.h>
>  #include <linux/platform_device.h>
>  #include <linux/device.h>
> +#include <linux/of.h>

Duplicate include.

