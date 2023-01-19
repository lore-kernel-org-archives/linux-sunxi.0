Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18B18A936
	for <linux-sunxi@lists.linux.dev>; Thu, 19 Jan 2023 16:24:38 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id x40so3952860lfu.12
        for <linux-sunxi@lists.linux.dev>; Thu, 19 Jan 2023 08:24:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8lVOvMoIQ2x2Wf6zy8frHnpB0eXV9ve1xBd2DqHKd8Y=;
        b=a/g9O4xy606aS7gTGUOYByXG9qF6KTMWOZA30DBpya3y/ma8wWSWbZ0GhEnw/5Dd56
         SwWKUvve09j1o3F73iD1XSqxXcz9bXivs5oPpAd58vaExY7Ut/gg8J5SySYtOKeJp85Y
         xmSrmvNHPLNYd+qGYEno2szmpyk9kL3REN4AGFML0pKUuvB9xnBoYaDYyqhUn2RKO/PI
         lFHQZLGbsqrirm06txrQIW/ebbIiz59ba6eAsRY5KjrWXIZ73jywqljunaP/ghJHB5A9
         uKyEtu3Zvgig66EC5x+MjGQiTGePO5AKzyatccaZUr2ktzAcgc0H0B/UBMut22jZ1DsG
         EBCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8lVOvMoIQ2x2Wf6zy8frHnpB0eXV9ve1xBd2DqHKd8Y=;
        b=id3jd2B3sLzCZXJc3B7tGZ8xQ/hUFhnXzrIN8/XXie/ej9BdLAukgStXMrbOFxrYP9
         BZ5LtJkumpVyUYQL6DynqqPIfao95sdJ5wtNHFkw8sf4xVaCeR5NEmaTrqKSqXZpMues
         AzXx3aFXbSlPLR41eyOxnmprYyUr8/MYvEMVzuycYHQm125fxZzaX1pTHNgFWfSkU3sB
         E8VowGHYVt6g2wqIfjteiesbrPinZ4LlaQfKRJFk0Aqsg1OHpK0ymuqlxqkGeqHnCLAS
         emlWcYW7Iwrt4cCM4JkQTf7nEgExxUP5M4PivX/DqW2kHcLTx1Yqhqz91TTPx21x9OPV
         9ULg==
X-Gm-Message-State: AFqh2kqzRzVbpKpD81ALTL7WpmD+gHZGLurQbWn+2nAClA0njocICPMF
	h053pKM72BbezJ/t9yJT5Ls=
X-Google-Smtp-Source: AMrXdXv7/blNpjVnMJiMaPKfEdqpiTFTh3jtjnRI+SUuGsVsK9TsgKmt9RRC03LAK7v7xiQAHH0RHA==
X-Received: by 2002:a05:6512:25a5:b0:4b5:7338:e2c7 with SMTP id bf37-20020a05651225a500b004b57338e2c7mr3358360lfb.53.1674145476128;
        Thu, 19 Jan 2023 08:24:36 -0800 (PST)
Received: from mobilestation ([95.79.133.202])
        by smtp.gmail.com with ESMTPSA id s9-20020ac24649000000b004cb41b43c25sm5884147lfo.197.2023.01.19.08.24.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jan 2023 08:24:35 -0800 (PST)
Date: Thu, 19 Jan 2023 19:24:31 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>,
	=?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
	Kamal Dasu <kdasu.kdev@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Han Xu <han.xu@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Haibo Chen <haibo.chen@nxp.com>,
	Yogesh Gaur <yogeshgaur.83@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Li-hao Kuo <lhjeff911@gmail.com>,
	Michal Simek <michal.simek@xilinx.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Maxime Ripard <mripard@kernel.org>,
	=?utf-8?B?77+9ZWNraQ==?= <rafal@milecki.pl>,
	Vaishnav Achath <vaishnav.a@ti.com>,
	Parshuram Thombare <pthombar@cadence.com>,
	Leilk Liu <leilk.liu@mediatek.com>,
	Gabor Juhos <juhosg@openwrt.org>, Bert Vermeulen <bert@biot.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Marek Vasut <marex@denx.de>,
	Birger Koblitz <mail@birger-koblitz.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Anson Huang <Anson.Huang@nxp.com>,
	Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Kuldeep Singh <singh.kuldeep87k@gmail.com>,
	Pragnesh Patel <pragnesh.patel@sifive.com>,
	Christophe Kerello <christophe.kerello@foss.st.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Erwan Leray <erwan.leray@foss.st.com>,
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
	linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
	linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 1/2] spi: dt-bindings: drop unneeded quotes
Message-ID: <20230119162431.mepdze3xibqjgwsi@mobilestation>
References: <20230118173932.358153-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230118173932.358153-1-krzysztof.kozlowski@linaro.org>

On Wed, Jan 18, 2023 at 06:39:31PM +0100, Krzysztof Kozlowski wrote:
> Cleanup by removing unneeded quotes from refs and redundant blank lines.
> No functional impact except adjusting to preferred coding style.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

[nip]

>  .../bindings/spi/snps,dw-apb-ssi.yaml          |  2 +-

[nip]

> diff --git a/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml b/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
> index d33b72fabc5d..a132b5fc56e0 100644
> --- a/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
> +++ b/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
> @@ -10,7 +10,7 @@ maintainers:
>    - Mark Brown <broonie@kernel.org>
>  
>  allOf:
> -  - $ref: "spi-controller.yaml#"
> +  - $ref: spi-controller.yaml#
>    - if:
>        properties:
>          compatible:

For the Synopsys DW SSI bindings:
Reviewed-by: Serge Semin <fancer.lancer@gmail.com>

Thanks
-Serge(y)

