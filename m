Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 429C21116;
	Thu,  1 Dec 2022 11:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1669893209; x=1701429209;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=oqwp1prmygFipaS7+KydzauQtsm23Yws4T/2+sBogyI=;
  b=Z/3h6Q9k4V3XsrkV+Qy0vu4OobfONq3lCoCg24OVBEBRSy6GwKRerOpZ
   ZTbojb1/37XOFwAwv56sMJg8rAesYRIX/NPK4fpAl8LFI852dW6I9jjaG
   jEHASMqE9eaqUaGTOfIcNnlThTFuyffEbe3/zH+zewg39FNB2bj9Mwov2
   GUQHm8Lg96uUHthOuT2LMpQ1wosGwzkpVTLYh9XfOuNbwYlddBVHgEXH/
   9m1/dsOM40nLCwWMPkQiOGDXd9eaRbSptCuMWop+nP+fIvK7FFnyJSOqS
   ve/G6ExNqKSGvsSRpvA6XlsHFduswL1QojDwGL4KfBtR/+JuLcS7rzguk
   g==;
X-IronPort-AV: E=Sophos;i="5.96,209,1665471600"; 
   d="scan'208";a="202161679"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 01 Dec 2022 04:12:19 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Thu, 1 Dec 2022 04:12:19 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Thu, 1 Dec 2022 04:12:10 -0700
Date: Thu, 1 Dec 2022 11:11:51 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
CC: Thierry Reding <thierry.reding@gmail.com>, Linus Walleij
	<linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, "Douglas
 Anderson" <dianders@chromium.org>, Pavel Machek <pavel@ucw.cz>, Claudiu
 Beznea <claudiu.beznea@microchip.com>, Nicolas Ferre
	<nicolas.ferre@microchip.com>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Ray Jui <rjui@broadcom.com>, Scott Branden
	<sbranden@broadcom.com>, "Broadcom internal kernel review list"
	<bcm-kernel-feedback-list@broadcom.com>, Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>, Shawn Guo <shawnguo@kernel.org>, Sascha
 Hauer <s.hauer@pengutronix.de>, "Pengutronix Kernel Team"
	<kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, "NXP Linux Team"
	<linux-imx@nxp.com>, Kevin Hilman <khilman@baylibre.com>, "Jerome Brunet"
	<jbrunet@baylibre.com>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>, Matthias Brugger
	<matthias.bgg@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, "Heiko
 Stuebner" <heiko@sntech.de>, Palmer Dabbelt <palmer@dabbelt.com>, "Paul
 Walmsley" <paul.walmsley@sifive.com>, Michael Walle <michael@walle.cc>,
	"Orson Zhai" <orsonzhai@gmail.com>, Baolin Wang
	<baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>,
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>, Hammer
 Hsieh <hammerh0314@gmail.com>, Nobuhiro Iwamatsu
	<nobuhiro1.iwamatsu@toshiba.co.jp>, Sean Anderson <sean.anderson@seco.com>,
	Michal Simek <michal.simek@xilinx.com>, Bjorn Andersson
	<andersson@kernel.org>, Stephen Boyd <swboyd@chromium.org>, Matthias Kaehlcke
	<mka@chromium.org>, Satya Priya <quic_c_skakit@quicinc.com>,
	<linux-pwm@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
	<dri-devel@lists.freedesktop.org>, <linux-leds@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <chrome-platform@lists.linux.dev>,
	<linux-amlogic@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-rpi-kernel@lists.infradead.org>, <linux-rockchip@lists.infradead.org>,
	<linux-riscv@lists.infradead.org>,
	<linux-stm32@st-md-mailman.stormreply.com>, <linux-sunxi@lists.linux.dev>,
	Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>,
	Marijn Suijten <marijn.suijten@somainline.org>
Subject: Re: [PATCH v2 00/11] pwm: Allow .get_state to fail
Message-ID: <Y4iL9xf5bJM5pyeR@wendy>
References: <20221130152148.2769768-1-u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221130152148.2769768-1-u.kleine-koenig@pengutronix.de>

Hey Uwe!

On Wed, Nov 30, 2022 at 04:21:37PM +0100, Uwe Kleine-König wrote:
> Hello,
> 
> I forgot about this series and was remembered when I talked to Conor
> Dooley about how .get_state() should behave in an error case.

In the context of "my" driver, get_state() the proposal was to fail with
-ETIMEDOUT rather than block a caller, potentially, for seconds or
report a potentially "random" state.

Specifically, values writen to the registers that control the PWM duty
cycle are not visible to the cpu until the changes have propagated to
the waveform at the start of a new period.
The timeout would occur if the bit that signifies that the "shadow
registers" contain a value which has not yet propagated. This bit is
per PWM "controller" and not per PWM channel.

Returning from apply() without waiting, possibly for seconds, for the
writes to become visible could cause get_state() to see anything between
the new and old states, inclusive!

If anyone cares at all, the discussion is here:
https://lore.kernel.org/linux-pwm/20221110093512.333881-1-conor.dooley@microchip.com/T/#m800eeabad29067940a5684e54106fd0bb7261944

> In v1 Thierry had the concern:
> 
> | That raises the question about what to do in these cases. If we return
> | an error, that could potentially throw off consumers. So perhaps the
> | closest would be to return a disabled PWM?
> | Or perhaps it'd be up to the
> | consumer to provide some fallback configuration for invalidly configured
> | or unconfigured PWMs.
> 
> .get_state() is only called in pwm_device_request on a pwm_state that a
> consumer might see. Before my series a consumer might have seen a
> partial modified pwm_state (because .get_state() might have modified
> .period, then stumbled and returned silently). The last patch ensures
> that this partial modification isn't given out to the consumer. Instead
> they now see the same as if .get_state wasn't implemented at all.

Getting the same thing as if get_state() did not exist seems
preferable to me in this context than "lying" and pretending that a PWM
is disabled or potentially inconsistent reports from get_state() that I
mentioned above.

TL;DR, I quite like the ability to return an error and not mislead the
caller.

Thanks for sending a v2 of this so quickly :)
Conor.

