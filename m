Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6E2A275A1
	for <linux-sunxi@lists.linux.dev>; Wed, 19 Jul 2023 18:46:03 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-4fb7589b187so11979620e87.1
        for <linux-sunxi@lists.linux.dev>; Wed, 19 Jul 2023 11:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20221208.gappssmtp.com; s=20221208; t=1689792361; x=1692384361;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8P6p5GxD+C7LfK4xTVAmdgfr7J5QiZZmSr+c4qR0eQ4=;
        b=PNHMPmfGkc1gL3s+kuZsOV06iS0AVcua9wceAmdSEpVaau8usQXOmlxuVajPoqahSZ
         oXCeyXW3i7qO4gPQC3/B5Lo5Eqmi2HM4U13eYxzJby4ZFd5uR2kFc8wjOiArIEd55PBA
         FeCJue+xZBMErbY8RHL9QpZivP+scZ+Uhv+xiPlfw+QmU/c+xu8cJYkIrMEc/MG7elAK
         qWZ83FR4V9wLcNgcODc1mJlKxSJnwdLewAg5rcPN0PhCf2e09w5V1Bp1xL5H141MnfFQ
         Zld3xPSZJnzYVXtM2wQmsSZTU5Qt4Z0CaW8ampG4BzUMYrnqq3UfbUoP7KRh6XWbjalG
         17Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689792361; x=1692384361;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8P6p5GxD+C7LfK4xTVAmdgfr7J5QiZZmSr+c4qR0eQ4=;
        b=Oxlu81a9ky7GH4F0Qi3pezKLgl6wSRtYpxlnuqqIqkbNBnT7Pfa3HwzK0rnNkyV0m5
         4E27KN2i7VqzlzBGbJaBfKROZ48b4C3IIAAHkr2e7/L/Z+/TnsX4b8CLQB1EssH1C67W
         LBEju7//AEeHx9CRNVWWfc2iNH2FMVYddm92N5rMErijEF/37kuGRsezodpL8aTCGoMz
         g1RcnDQoy9nkz0O6UhYmTEdO5nmIw9RYSkFqc7TlZC/DRodYCnqpOYwVOyxaqINP2yIq
         WjA75VaK5k+vBdxTl/bX9B0MMRbI/Uzur4jCCejhQ+HdzSm/NqR0tCFCd7c7iQbLKbcX
         DseA==
X-Gm-Message-State: ABy/qLaglvFdlWFke7YUJPQ53FczTz6VJNfUDxafwW+7K3KsWR216KU1
	ITFQ9qTxQNCyQSWiCWtVxcH6RQ==
X-Google-Smtp-Source: APBJJlFtrWyQNURr4DI24Yfx+KhHtEnbcs8mZXCEdNLSvmMP4IixrdRQLU+06NloRR7Z4XxkYEDlqQ==
X-Received: by 2002:a05:6512:250f:b0:4fb:8de9:ac0e with SMTP id be15-20020a056512250f00b004fb8de9ac0emr607490lfb.1.1689792361237;
        Wed, 19 Jul 2023 11:46:01 -0700 (PDT)
Received: from localhost (h-46-59-89-207.A463.priv.bahnhof.se. [46.59.89.207])
        by smtp.gmail.com with ESMTPSA id m8-20020ac24248000000b004fbad6bc93dsm1057209lfl.136.2023.07.19.11.46.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jul 2023 11:46:00 -0700 (PDT)
Date: Wed, 19 Jul 2023 20:45:59 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Rob Herring <robh@kernel.org>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Michael Riesch <michael.riesch@wolfvision.net>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Steve Longerbeam <slongerbeam@gmail.com>,
	Matt Ranostay <matt.ranostay@konsulko.com>,
	Michael Tretter <m.tretter@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Ming Qian <ming.qian@nxp.com>, Shijie Qin <shijie.qin@nxp.com>,
	Zhou Peng <eagle.zhou@nxp.com>, Eddie James <eajames@linux.ibm.com>,
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Bin Liu <bin.liu@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
	Houlong Wei <houlong.wei@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Tiffany Lin <tiffany.lin@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Dmitry Osipenko <digetx@gmail.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Mikhail Ulyanov <mikhail.ulyanov@cogentembedded.com>,
	Jacopo Mondi <jacopo@jmondi.org>,
	Dafna Hirschfeld <dafna@fastmail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Krz ysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Yong Deng <yong.deng@magewell.com>,
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
	Benoit Parrot <bparrot@ti.com>, Sean Young <sean@mess.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Sean Wang <sean.wang@mediatek.com>, devicetree@vger.kernel.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org,
	linux-aspeed@lists.ozlabs.org, linux-mediatek@lists.infradead.org,
	linux-tegra@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev,
	linux-amlogic@lists.infradead.org
Subject: Re: [PATCH v2] media: Explicitly include correct DT includes
Message-ID: <ZLgvZ2ao1tgrRlFu@oden.dyn.berto.se>
References: <20230718143118.1065743-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230718143118.1065743-1-robh@kernel.org>

Hi Rob,

On 2023-07-18 08:31:14 -0600, Rob Herring wrote:
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
> ---
> v2:
> - Fix double include of of.h
> ---

For,

>  drivers/media/platform/renesas/rcar-isp.c                     | 2 +-
>  drivers/media/platform/renesas/rcar-vin/rcar-core.c           | 1 -
>  drivers/media/platform/renesas/rcar-vin/rcar-csi2.c           | 1 -

Reviewed-by: Niklas Söderlund <niklas.soderlund@ragnatech.se>
