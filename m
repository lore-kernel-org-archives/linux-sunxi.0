Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF4BAEA0
	for <linux-sunxi@lists.linux.dev>; Thu,  3 Aug 2023 22:43:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3E4CC433C8;
	Thu,  3 Aug 2023 22:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691102615;
	bh=kctz/l+HgXckSr6lVdAzsQHOS1XESSmOihgpTHJWf9g=;
	h=From:Date:Subject:References:In-Reply-To:List-Id:To:Cc:From;
	b=T6mNtFCyRS5oK0vEok38vwwn5WIkSnHOxfrlW2LiTFvlyzPOGs6vpCggN3ekIMaMM
	 X1dJXxrYrRLIaxKyROcB1BxGvZfu4np/or/T8E1ydIuxLNG6jftYrr8voPz4BBP6lf
	 D+uQSa+QH8pYFHLiZGeKKxYKG8nZWJ1kT6vBbCDDCP4pn1A99AjoGVKQ22TyO+Ko6l
	 C3RLceVqm3X96S75wWVZpXyNiFSt36SlCcvr8s4MHB6/je5fCWzMDplUy4V7obTOFY
	 5SACrSQMk7BltBiWPXo8+AMt2mOXgT9v+S7XJkz1pWjBDSNxhEr0DzbkBqHpWPlKSy
	 qgIM2TSKlG1pw==
Received: (nullmailer pid 3693770 invoked by uid 1000);
	Thu, 03 Aug 2023 22:42:55 -0000
From: Rob Herring <robh@kernel.org>
Date: Thu, 03 Aug 2023 16:42:50 -0600
Subject: [PATCH v2 10/23] ARM: nspire: Drop unused includes
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230803-dt-header-cleanups-for-soc-v2-10-d8de2cc88bff@kernel.org>
References: <20230803-dt-header-cleanups-for-soc-v2-0-d8de2cc88bff@kernel.org>
In-Reply-To: <20230803-dt-header-cleanups-for-soc-v2-0-d8de2cc88bff@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, Patrice Chotard <patrice.chotard@foss.st.com>, Tsahee Zidenberg <tsahee@annapurnalabs.com>, Antoine Tenart <atenart@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, Jean-Marie Verdun <verdun@hpe.com>, Nick Hawkins <nick.hawkins@hpe.com>, Lubomir Rintel <lkundrak@v3.sk>, Linus Walleij <linus.walleij@linaro.org>, Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, Heiko Stuebner <heiko@sntech.de>, Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, Viresh Kumar <vireshk@kernel.org>, Shiraz Has
 him <shiraz.linux.kernel@gmail.com>, Stuart Yoder <stuyoder@gmail.com>, Laurentiu Tudor <laurentiu.tudor@nxp.com>, Jay Fang <f.fangjian@huawei.com>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Cristian Marussi <cristian.marussi@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Florian Fainelli <florian.fainelli@broadcom.com>, Dinh Nguyen <dinguyen@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Michal Simek <michal.simek@amd.com>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>, Ulf Hansson <ulf.hansson@linaro.org>, Li Yang <leoyang.li@nxp.com>, Qiang Zhao <qiang.zhao@nxp.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-pm@vger.kernel.org
X-Mailer: b4 0.13-dev

Several includes are not needed, so drop them. io.h was implicitly included
and is needed.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 arch/arm/mach-nspire/nspire.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/arch/arm/mach-nspire/nspire.c b/arch/arm/mach-nspire/nspire.c
index 2d4abb0288b9..d20974a9fbc1 100644
--- a/arch/arm/mach-nspire/nspire.c
+++ b/arch/arm/mach-nspire/nspire.c
@@ -5,17 +5,10 @@
  *	Copyright (C) 2013 Daniel Tang <tangrs@tangrs.id.au>
  */
 #include <linux/init.h>
-#include <linux/of_irq.h>
-#include <linux/of_address.h>
-#include <linux/of_platform.h>
-#include <linux/irqchip.h>
-#include <linux/irqchip/arm-vic.h>
-#include <linux/clkdev.h>
-#include <linux/amba/bus.h>
+#include <linux/io.h>
 
 #include <asm/mach/arch.h>
 #include <asm/mach-types.h>
-#include <asm/mach/map.h>
 
 #include "mmio.h"
 

-- 
2.40.1

