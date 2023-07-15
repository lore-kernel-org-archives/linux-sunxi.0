Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B86C15C5
	for <linux-sunxi@lists.linux.dev>; Sat, 15 Jul 2023 15:48:57 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 713BCFF802;
	Sat, 15 Jul 2023 15:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1689436130;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Un+ufkhrXfZqLrVbDU6HeKyr3kcyHpaOW08JuHJOTAQ=;
	b=FqWexEyC5/ncjoaJwBj4G53wiu8VDHhDUUmjeiui8D15gl2UK0/z1/JhojGPaXb7myBHt0
	+m0+8luEUYwOnP8t5sbvBF01u6wPPDP8ekc+E+xiI5dXBEOsZg27UBqN6/Cx2Ykd/d38zY
	Uxi4xN1DsWH3172+Q9prP3vN3AfuAUnTk0v/cqkvsBuezHKkylG8hSiaysYLY7BLSvc/OK
	X/4nONxCNA9EoFF0A6ADkUMqN/54fCJrQYuzSAtxsbm00dNaTjHSMLlKGNk9Pa5uVm4JDa
	KtHa+BsMQbwWPxRZR03AmaWLttL4j4jDIfE8mWV10b4zCsVL6+eAIvNGObilXQ==
Date: Sat, 15 Jul 2023 17:48:42 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Rob Herring <robh@kernel.org>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Linus Walleij <linus.walleij@linaro.org>, Kyungmin Park
 <kyungmin.park@samsung.com>, Han Xu <han.xu@nxp.com>, Harvey Hunt
 <harveyhuntnexus@gmail.com>, Paul Cercueil <paul@crapouillou.net>, Liang
 Yang <liang.yang@amlogic.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Michal Simek
 <michal.simek@amd.com>, Manivannan Sadhasivam <mani@kernel.org>, Heiko
 Stuebner <heiko@sntech.de>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Vladimir
 Zapolskiy <vz@mleia.com>, Tudor Ambarus <tudor.ambarus@linaro.org>,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mips@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH] mtd: Explicitly include correct DT includes
Message-ID: <20230715174804.6fc2a4c1@xps-13>
In-Reply-To: <20230714174751.4060439-1-robh@kernel.org>
References: <20230714174751.4060439-1-robh@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: miquel.raynal@bootlin.com

Hi Rob,

robh@kernel.org wrote on Fri, 14 Jul 2023 11:47:49 -0600:

> The DT of_device.h and of_platform.h date back to the separate
> of_platform_bus_type before it as merged into the regular platform bus.

				 was?

Otherwise LGTM, I will fix it when applying.

> As part of that merge prepping Arm DT support 13 years ago, they
> "temporarily" include each other. They also include platform_device.h
> and of.h. As a result, there's a pretty much random mix of those include
> files used throughout the tree. In order to detangle these headers and
> replace the implicit includes with struct declarations, users need to
> explicitly include the correct includes.
>=20
> Signed-off-by: Rob Herring <robh@kernel.org>

Thanks,
Miqu=C3=A8l
