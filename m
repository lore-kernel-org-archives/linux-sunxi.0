Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0CC179C0;
	Wed, 30 Nov 2022 18:37:32 +0000 (UTC)
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1p0Rwv-0003tW-CD; Wed, 30 Nov 2022 19:36:49 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Thierry Reding <thierry.reding@gmail.com>, Uwe =?ISO-8859-1?Q?Kleine=2DK=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Conor Dooley <conor.dooley@microchip.com>, Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Douglas Anderson <dianders@chromium.org>, Pavel Machek <pavel@ucw.cz>, Claudiu Beznea <claudiu.beznea@microchip.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Matthias Brugger <matthias.bgg@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Michael Walle <michael@walle.cc>, Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, Fabrice Gasnier <fabrice.gasnier@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>, Hammer Hsieh <hammerh0314@gmail.com>, Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>, Sean Anderson <sean.anderson@seco.com>, Michal Simek <michal.simek@xilinx.com>, Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <swboyd@chromium.org>, Matthias Kaehlcke <mka@chromium.org>, Satya Priya <quic_c_skakit@quicinc.com>, linux-pwm@vger.kernel.org, linux-gpio@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org, chrome-platform@lists.linux.dev, linux-amlogic@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 01/11] pwm: Make .get_state() callback return an error code
Date: Wed, 30 Nov 2022 19:36:47 +0100
Message-ID: <3943768.iZASKD2KPV@diego>
In-Reply-To: <20221130152148.2769768-2-u.kleine-koenig@pengutronix.de>
References: <20221130152148.2769768-1-u.kleine-koenig@pengutronix.de> <20221130152148.2769768-2-u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

> diff --git a/drivers/pwm/pwm-rockchip.c b/drivers/pwm/pwm-rockchip.c
> index a5af859217c1..3ec7d1756903 100644
> --- a/drivers/pwm/pwm-rockchip.c
> +++ b/drivers/pwm/pwm-rockchip.c
> @@ -57,9 +57,9 @@ static inline struct rockchip_pwm_chip *to_rockchip_pwm_chip(struct pwm_chip *c)
>  	return container_of(c, struct rockchip_pwm_chip, chip);
>  }
>  
> -static void rockchip_pwm_get_state(struct pwm_chip *chip,
> -				   struct pwm_device *pwm,
> -				   struct pwm_state *state)
> +static int rockchip_pwm_get_state(struct pwm_chip *chip,
> +				  struct pwm_device *pwm,
> +				  struct pwm_state *state)
>  {
>  	struct rockchip_pwm_chip *pc = to_rockchip_pwm_chip(chip);
>  	u32 enable_conf = pc->data->enable_conf;
> @@ -70,11 +70,11 @@ static void rockchip_pwm_get_state(struct pwm_chip *chip,
>  
>  	ret = clk_enable(pc->pclk);
>  	if (ret)
> -		return;
> +		return 0;
>  
>  	ret = clk_enable(pc->clk);
>  	if (ret)
> -		return;
> +		return 0;
>  
>  	clk_rate = clk_get_rate(pc->clk);
>  
> @@ -96,6 +96,8 @@ static void rockchip_pwm_get_state(struct pwm_chip *chip,
>  
>  	clk_disable(pc->clk);
>  	clk_disable(pc->pclk);
> +
> +	return 0;
>  }

for the Rockchip-part:
Reviewed-by: Heiko Stuebner <heiko@sntech.de>


