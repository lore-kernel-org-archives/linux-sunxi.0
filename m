Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2C8B1C36;
	Thu,  1 Dec 2022 13:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1669901370; x=1701437370;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=uzYyfpe5ovcmHtziruShrAihFDRO3ojyXNM6UnYgYzM=;
  b=iUpH7ehJxKBw+C0mn8E/TY8cIR2T+gknuBqbUfD9ABYvupb80gGapdf9
   o8oRtiKloSR3Ns+Vp8U12KwSLPWghEb2WJG73KOBHtGRJ60E71PqSyvBf
   GRbKAwgcsCSYLdlaMOL4OEBezMXIYsvrMlV1renGiMB2sotdfd5/R9b7u
   NuGMvARe6+VWqHw4TInxFQq/b5c7wJE8S3Pg09QM6r3N9AnOEu6I5V9/Z
   RDen2VdYJyhtCdThUmrDbhFezpAwd3XqmR+dH3VrKo55vVhq1KiXPuJUF
   6ygoIA21ykDjjeJFzt0gno4+Mg5iCpWCBoqgQkXHF/mHux0OfTprCAwec
   g==;
X-IronPort-AV: E=Sophos;i="5.96,209,1665471600"; 
   d="scan'208";a="125998122"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 01 Dec 2022 06:29:21 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Thu, 1 Dec 2022 06:29:09 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Thu, 1 Dec 2022 06:29:01 -0700
Date: Thu, 1 Dec 2022 13:28:42 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
CC: Alexandre Belloni <alexandre.belloni@bootlin.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>, <dri-devel@lists.freedesktop.org>, "Douglas
 Anderson" <dianders@chromium.org>, Thierry Reding <thierry.reding@gmail.com>,
	Satya Priya <quic_c_skakit@quicinc.com>, Pavel Machek <pavel@ucw.cz>,
	"Guenter Roeck" <groeck@chromium.org>, Marijn Suijten
	<marijn.suijten@somainline.org>, Nobuhiro Iwamatsu
	<nobuhiro1.iwamatsu@toshiba.co.jp>, <linux-riscv@lists.infradead.org>,
	<linux-leds@vger.kernel.org>, "Jerome Brunet" <jbrunet@baylibre.com>,
	<chrome-platform@lists.linux.dev>, "Florian Fainelli" <f.fainelli@gmail.com>,
	Samuel Holland <samuel@sholland.org>, "Sean Anderson"
	<sean.anderson@seco.com>, Kevin Hilman <khilman@baylibre.com>, Bartosz
 Golaszewski <brgl@bgdev.pl>, Michal Simek <michal.simek@xilinx.com>,
	<linux-stm32@st-md-mailman.stormreply.com>, Hammer Hsieh
	<hammerh0314@gmail.com>, <linux-rockchip@lists.infradead.org>, Chen-Yu Tsai
	<wens@csie.org>, Matthias Kaehlcke <mka@chromium.org>, "Broadcom internal
 kernel review list" <bcm-kernel-feedback-list@broadcom.com>, NXP Linux Team
	<linux-imx@nxp.com>, Orson Zhai <orsonzhai@gmail.com>,
	<linux-sunxi@lists.linux.dev>, <linux-pwm@vger.kernel.org>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>, Ray Jui <rjui@broadcom.com>, "Sascha
 Hauer" <s.hauer@pengutronix.de>, Steven Rostedt <rostedt@goodmis.org>,
	"Stephen Boyd" <swboyd@chromium.org>, <linux-gpio@vger.kernel.org>, Fabrice
 Gasnier <fabrice.gasnier@foss.st.com>, <linux-mediatek@lists.infradead.org>,
	<linux-rpi-kernel@lists.infradead.org>, Baolin Wang
	<baolin.wang@linux.alibaba.com>, Paul Walmsley <paul.walmsley@sifive.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	<linux-amlogic@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	Scott Branden <sbranden@broadcom.com>, Bjorn Andersson
	<andersson@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, "Michael
 Walle" <michael@walle.cc>, Palmer Dabbelt <palmer@dabbelt.com>, "Masami
 Hiramatsu" <mhiramat@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Chunyan Zhang <zhang.lyra@gmail.com>, Shawn Guo
	<shawnguo@kernel.org>, Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: Re: [PATCH v2 00/11] pwm: Allow .get_state to fail
Message-ID: <Y4isCnKP9pTacksl@wendy>
References: <20221130152148.2769768-1-u.kleine-koenig@pengutronix.de>
 <Y4iL9xf5bJM5pyeR@wendy>
 <20221201131907.bmrenldnua7uaeab@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221201131907.bmrenldnua7uaeab@pengutronix.de>

On Thu, Dec 01, 2022 at 02:19:07PM +0100, Uwe Kleine-König wrote:
> Hello Conor,
> 
> On Thu, Dec 01, 2022 at 11:11:51AM +0000, Conor Dooley wrote:
> > TL;DR, I quite like the ability to return an error and not mislead the
> > caller.
> 
> Is this an Ack?

It is if you want it to be! I didn't really feel qualified to do so
which is why I gave some context etc.

I did check out the callsites for the non-void returning op, and it
looked good to me, so sure, why not:

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

