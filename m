Received: from gofer.mess.org (gofer.mess.org [88.97.38.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C391228F2
	for <linux-sunxi@lists.linux.dev>; Mon, 13 Mar 2023 14:47:24 +0000 (UTC)
Received: by gofer.mess.org (Postfix, from userid 1000)
	id E2BC91000C4; Mon, 13 Mar 2023 14:47:22 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1678718842; bh=A6Y556DDngnyfZDUq/i6s59n3p9QlOwB9TuI5IIX23Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jNI+nhi92YA9jFcloGjP836tOzSltRSbge0kglWgPUauPoC2ishEnQ0Kc1PR1zJZo
	 ewgi/8Ut0X/20A7nTgRdHl3cVFthlrQuS7tWmfUigtx8xLOQg1KQInwxcH44RviUVB
	 uyKKQYO4hPgDNNiYI0jkqe1E9jPfMH1faIY2wq61mYL3CKqve5XFRU1mUQGtI50Y5c
	 6gAYsn20KWM7YaEo1BTe2CtYkzoBrOLYCJdTGisNUZO9LPKtKl4uajSrf9nO38oVFN
	 1TXC+CnzivmXncSSohEL9g4v5HA6z74H/uPZfcd2zYIAwm2AGo66gBH3EC9so5avm3
	 WYXc/5jd2q4Dg==
Date: Mon, 13 Mar 2023 14:47:22 +0000
From: Sean Young <sean@mess.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Joe Tessler <jrt@google.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Michael Tretter <m.tretter@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Jacopo Mondi <jacopo+renesas@jmondi.org>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Wenyou Yang <wenyou.yang@microchip.com>,
	Bin Liu <bin.liu@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
	Houlong Wei <houlong.wei@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Yong Deng <yong.deng@magewell.com>,
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	"Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 06/28] media: rc: ir-rx51: drop of_match_ptr for ID table
Message-ID: <ZA83eipHUk5/vsRp@gofer.mess.org>
References: <20230312131318.351173-1-krzysztof.kozlowski@linaro.org>
 <20230312131318.351173-6-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230312131318.351173-6-krzysztof.kozlowski@linaro.org>

On Sun, Mar 12, 2023 at 02:12:56PM +0100, Krzysztof Kozlowski wrote:
> The driver can match only via the DT table so the table should be always
> used and the of_match_ptr does not have any sense (this also allows ACPI
> matching via PRP0001, even though it might not be relevant here).  This
> also fixes !CONFIG_OF error:
> 
>   drivers/media/rc/ir-rx51.c:264:34: error: ‘ir_rx51_match’ defined but not used [-Werror=unused-const-variable=]
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Sean Young <sean@mess.org>

Thanks
Sean

> ---
>  drivers/media/rc/ir-rx51.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/rc/ir-rx51.c b/drivers/media/rc/ir-rx51.c
> index adbbe639a261..13e81bf8005d 100644
> --- a/drivers/media/rc/ir-rx51.c
> +++ b/drivers/media/rc/ir-rx51.c
> @@ -275,7 +275,7 @@ static struct platform_driver ir_rx51_platform_driver = {
>  	.resume		= ir_rx51_resume,
>  	.driver		= {
>  		.name	= KBUILD_MODNAME,
> -		.of_match_table = of_match_ptr(ir_rx51_match),
> +		.of_match_table = ir_rx51_match,
>  	},
>  };
>  module_platform_driver(ir_rx51_platform_driver);
> -- 
> 2.34.1
