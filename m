Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A147E4680
	for <linux-sunxi@lists.linux.dev>; Thu, 21 Jul 2022 15:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1658418738; x=1689954738;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=III64DW+0u4G+CjBfeIS14HoJGrVBM+FP7wl8Jf7dg8=;
  b=yLvNW77xsyoAOhywBCg6lLjtymieczJKqQ2LpkpBChfTrpIuWAiOB9HW
   A0SoUVbwi9wM2Wthv7ePu2OXEtiopueEv9Fn+Xoleinl7iQ1Lw5XxXwsx
   snqS0uS8MP9Z+sSpxY3WaVjBBSq1WMWQBsSCrV2Mjd5J8aPxeYD1nhwGY
   J0zcZ3NX6WyQxj9lnStn1yxpu6iYqdST7TpCU1Lg+7U5qtlcbRiwvxVYK
   APjjc88wMwWIIHGNEDUSdryh6HxV0D2/9Rr5+WwNW45KU+ysKWAR7p30B
   FZGXT2Z2Z2hYYI8g7v+y8N3qqFAWjazbNJ/L4H7je1vThockGV+x2zR/D
   A==;
X-IronPort-AV: E=Sophos;i="5.93,183,1654585200"; 
   d="scan'208";a="105554930"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 21 Jul 2022 08:52:07 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 21 Jul 2022 08:51:58 -0700
Received: from [10.159.245.112] (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Thu, 21 Jul 2022 08:51:48 -0700
Message-ID: <365646fb-ea8b-6202-48a4-874f1e3c0a65@microchip.com>
Date: Thu, 21 Jul 2022 17:51:47 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/6] ARM: refresh defconfig files
Content-Language: en-US
To: Arnd Bergmann <arnd@kernel.org>, <linux-arm-kernel@lists.infradead.org>
CC: Arnd Bergmann <arnd@arndb.de>, Russell King <linux@armlinux.org.uk>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea
	<claudiu.beznea@microchip.com>, Florian Fainelli <f.fainelli@gmail.com>, "Ray
 Jui" <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, "Alexander
 Shiyan" <shc_work@mail.ru>, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>,
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
	<festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Vladimir Zapolskiy
	<vz@mleia.com>, Taichi Sugaya <sugaya.taichi@socionext.com>, Takao Orito
	<orito.takao@socionext.com>, Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla
	<sudeep.holla@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, "Andrew
 Lunn" <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Aaro Koskinen
	<aaro.koskinen@iki.fi>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, "Tony
 Lindgren" <tony@atomide.com>, Neil Armstrong <narmstrong@baylibre.com>, "Dinh
 Nguyen" <dinguyen@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Chen-Yu Tsai
	<wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland
	<samuel@sholland.org>, Thierry Reding <thierry.reding@gmail.com>, "Jonathan
 Hunter" <jonathanh@nvidia.com>, Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-aspeed@lists.ozlabs.org>, <bcm-kernel-feedback-list@broadcom.com>,
	<linux-rpi-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-omap@vger.kernel.org>, <linux-oxnas@groups.io>,
	<linux-stm32@st-md-mailman.stormreply.com>, <linux-sunxi@lists.linux.dev>,
	<linux-tegra@vger.kernel.org>, <linux-sh@vger.kernel.org>
References: <20220721141325.2413920-1-arnd@kernel.org>
 <20220721141325.2413920-2-arnd@kernel.org>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Organization: microchip
In-Reply-To: <20220721141325.2413920-2-arnd@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 21/07/2022 at 16:13, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> A lot of Kconfig options have changed over the years, and we tend
> to not do a blind 'make defconfig' to refresh the files, to ensure
> we catch options that should not have gone away.
> 
> I used some a bit of scripting to only rework the bits where an
> option moved around in any of the defconfig files, without also
> dropping any of the other lines, to make it clearer which options
> we no longer have.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
[..]
>   arch/arm/configs/at91_dt_defconfig        |  10 +-
[..]
>   arch/arm/configs/sama5_defconfig          |   8 +-
>   arch/arm/configs/sama7_defconfig          |   8 +-
[..]

For at91:
Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>
Thanks, best regards,
   Nicolas

-- 
Nicolas Ferre
