Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2C9523A5
	for <linux-sunxi@lists.linux.dev>; Wed, 22 Feb 2023 09:32:09 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id B776866021B5;
	Wed, 22 Feb 2023 09:31:59 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1677058321;
	bh=ypc2TjbNSU7dsJCUFEveVUwkvQ3RanGmsWbkzF7sWgo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FNUVhOeaDNZZVi6pZQ6VK2lEs7a/M+4teR0YM9KUip7qVBhKutdX2Zy5nYfzcsOw/
	 djyt2EwIP5Di/RZRdmEMzeMePbU80C0D67C7pzmY3I+ERCTLfaiuXS0VslS+F5WaQf
	 fjBUKZFaOPp8MNRri82Y6HG0SawCtkD28MTQdNV3Ngc9lm+Y7QvVyAYXZkPONKGGR3
	 //lqrmT+fnoduRyAOcor6oP/m+ktaSMj/YwcK6jU0HJ5AVhr5fHJkV6I6p37l2uCTI
	 uK1G4sXntFRI6/e2q9TLw+v7lgGy9Qq0NJ20hPk63AyJ776C9yOMTdEfDrBHBaptWP
	 uWZWkFvCBsZtA==
Message-ID: <fce7ef68-8145-75ae-4ca2-35560e334cfc@collabora.com>
Date: Wed, 22 Feb 2023 10:31:57 +0100
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 05/16] thermal/hwmon: Use the right device for
 devm_thermal_add_hwmon_sysfs()
Content-Language: en-US
To: Daniel Lezcano <daniel.lezcano@linaro.org>, rafael@kernel.org
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Guillaume La Roque <glaroque@baylibre.com>, Amit Kucheria
 <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Thara Gopinath <thara.gopinath@gmail.com>,
 Vasily Khoruzhick <anarsoul@gmail.com>, Yangtao Li <tiny.windzz@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Eduardo Valentin <edubezval@gmail.com>, Keerthy <j-keerthy@ti.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Balsam CHIHI
 <bchihi@baylibre.com>, Daniel Golle <daniel@makrotopia.org>,
 =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 ye xingchen <ye.xingchen@zte.com.cn>, Randy Dunlap <rdunlap@infradead.org>,
 Adam Ward <DLG-Adam.Ward.opensource@dm.renesas.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Mark Brown <broonie@kernel.org>,
 "open list:THERMAL DRIVER FOR AMLOGIC SOCS"
 <linux-amlogic@lists.infradead.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>,
 "open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>,
 "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>,
 "open list:TI BANDGAP AND THERMAL DRIVER" <linux-omap@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>
References: <20230221180710.2781027-1-daniel.lezcano@linaro.org>
 <20230221180710.2781027-6-daniel.lezcano@linaro.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230221180710.2781027-6-daniel.lezcano@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 21/02/23 19:06, Daniel Lezcano ha scritto:
> The devres variant of thermal_add_hwmon_sysfs() only takes the thermal
> zone structure pointer as parameter.
> 
> Actually, it uses the tz->device to add it in the devres list.
> 
> It is preferable to use the device registering the thermal zone
> instead of the thermal zone device itself. That prevents the driver
> accessing the thermal zone structure internals and it is from my POV
> more correct regarding how devm_ is used.
> 
> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com> #amlogic_thermal

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com> 
#MediaTek auxadc


