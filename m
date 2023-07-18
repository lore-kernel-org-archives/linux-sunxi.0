Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1411A10EA
	for <linux-sunxi@lists.linux.dev>; Tue, 18 Jul 2023 06:32:01 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E080220008;
	Tue, 18 Jul 2023 06:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1689661919;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RpKAtUiUinq9Lhw+v54h3QcTHPMMcdg2W9j58F9msCI=;
	b=lVsAfqer8xWiySiEq4z7Whp9otUwyCQXKtPI1tRr5f7imi5WmvidsvbXpCUGXwxk1c+lvE
	oUHmSljh698Kg7YXWz38yD7YKynczdgakNvh9W31vXeG3ASFtYmUbHMMJvu2jAXs6WXMFe
	qDOvnq5fNCwuhkU5Pv9JkSJ8uAbs1yjvZIjT+WnxMiQeDJLtUHfZO7aM8YIAG7auX7E6KB
	neoUdUzoHRJnTzkhM6WLVgYwYyzcHYvDk8cc5I9mppjSrEmHREOSYJaDUdNw61xuiMD/34
	m7I4N+6JbCgr4Op1Mxo+kriyEeSldJsgWRrKtcIj3mGk+C0lffE+F3dHz9dysw==
Date: Tue, 18 Jul 2023 08:31:49 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Rob Herring <robh@kernel.org>
Cc: Peter Chen <peter.chen@kernel.org>, Pawel Laszczak <pawell@cadence.com>,
 Roger Quadros <rogerq@kernel.org>, Aswath Govindraju <a-govindraju@ti.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 NXP Linux Team <linux-imx@nxp.com>, Thierry Reding
 <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Minas
 Harutyunyan <hminas@synopsys.com>, Thinh Nguyen
 <Thinh.Nguyen@synopsys.com>, Li Yang <leoyang.li@nxp.com>, Daniel Mack
 <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, Robert
 Jarzmik <robert.jarzmik@free.fr>, Michal Simek <michal.simek@amd.com>, Alan
 Stern <stern@rowland.harvard.edu>, Nicolas Ferre
 <nicolas.ferre@microchip.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Claudiu Beznea
 <claudiu.beznea@microchip.com>, Mathias Nyman <mathias.nyman@intel.com>,
 Richard Leitner <richard.leitner@linux.dev>, Chunfeng Yun
 <chunfeng.yun@mediatek.com>, Paul Cercueil <paul@crapouillou.net>, Bin Liu
 <b-liu@ti.com>, Conor Dooley <conor.dooley@microchip.com>, Daire McNamara
 <daire.mcnamara@microchip.com>, Chen-Yu Tsai <wens@csie.org>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 Guenter Roeck <linux@roeck-us.net>, Heikki Krogerus
 <heikki.krogerus@linux.intel.com>, "Bryan O'Donoghue"
 <bryan.odonoghue@linaro.org>, Andy Gross <agross@kernel.org>, Bjorn
 Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno     
    <angelogioacchino.delregno@collabora.com>, devicetree@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-renesas-soc@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-mips@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] usb: Explicitly include correct DT includes
Message-ID: <20230718083149.77fa57ef@bootlin.com>
In-Reply-To: <20230714175027.4065135-1-robh@kernel.org>
References: <20230714175027.4065135-1-robh@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com

Hi Rob,

On Fri, 14 Jul 2023 11:50:23 -0600
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
> ---

[...]

> diff --git a/drivers/usb/gadget/udc/renesas_usbf.c b/drivers/usb/gadget/udc/renesas_usbf.c
> index 6cd0af83e91e..3482b41d0646 100644
> --- a/drivers/usb/gadget/udc/renesas_usbf.c
> +++ b/drivers/usb/gadget/udc/renesas_usbf.c
> @@ -12,10 +12,9 @@
>  #include <linux/iopoll.h>
>  #include <linux/kernel.h>
>  #include <linux/kfifo.h>
> +#include <linux/mod_devicetable.h>
>  #include <linux/module.h>
> -#include <linux/of_address.h>
> -#include <linux/of_irq.h>
> -#include <linux/of_platform.h>
> +#include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/types.h>
>  #include <linux/usb/composite.h>

Acked-by: Herve Codina <herve.codina@bootlin.com>

Best regards,
Hervé
