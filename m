Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EFAC7C
	for <linux-sunxi@lists.linux.dev>; Sun, 19 Mar 2023 21:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1679261840; x=1710797840;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=TT1NZFDlglG04lWn8b3D569FNDwhCTSHE8VYkA5Dx+U=;
  b=nlxGwoEnu7XBeCpGL6EB5mJEflO/0CEwMDPqU32Uj30RhwaqK7h8Ip0C
   RhPwaqd2pCmYPxl7v7Vw8UG5LXMUxtySnWSUbwrEBFqMkr/EDLSfAxtku
   zYh3IqGYnGdpefFGLHDDv6tTMTOzhHm5dp0xKl/FF3UHGpWHy+GVrlzVE
   ydbF/OQFDMpOwt+bocAlmwuTSec77an5DAqMlxAvMu33qvX0AIoUz+U0o
   8ncU8dxY1E0VDpwgGeYmVVIf+l8kxZ/SjRYcSGAMrHfw+akBlKMNxY4/A
   ClB/dxIl7kKovUB6cPA9LaID1ansRcOyw6MqpPscPkilemzI8qR3uHTmM
   w==;
X-IronPort-AV: E=Sophos;i="5.98,274,1673884800"; 
   d="scan'208";a="330394021"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 20 Mar 2023 05:36:10 +0800
IronPort-SDR: pyylIcHuW5lLLHu1eUuNh8N1CTDXwMaYyeCvHyzzbnwEghO6ZukPl+hQbULcgphiEqZY6PHq1G
 Z3jm/Qtcacu3qGHJ5OfFLoH0ggspzewAnPhg4CAODUEFw2T5jkeCXjbPA5HPG4oj7hqXre6xyS
 xePXP8e0m/9pbACAM9L5+WXN/NKigmiMkAMYfajkZkw6qZl7Zla+3UxchsmZPWGSRB302y9Pz/
 YrSjgAIcuZ5oM0gfmlJJkTge3uB43Y6vdpDfN6iCfUFYG/Hvlmk8Tqqfv80Hh39ZeryYbJdjJa
 yXw=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 19 Mar 2023 13:46:50 -0700
IronPort-SDR: CpmeTPBntBLcJ5q5qsskcQDgUDsZFB1ZnR9YUNpXqVjENdcHdVw4rdHGpbEd89FLBqnJ2Wrg18
 thNOlCOGXfWMe1xGirS+zN4bB8tT43VKvpdPyEjja5Sd7L93MlDBhIgnupOvs9WllIwteSbhBj
 fxeQ7APInHD2o29p9JUhX6fTH4VnpzXS/j8RbozzD7308F1p4cCE/lfsagbgEaXOjfW7R3tkFi
 BkOMUsswKyBTkgLvMcbKTBfX4O2PFw9vFbxwuQUp0letN1l0/clAi/O724R0C/2a2CnB5+ZGc/
 /BQ=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 19 Mar 2023 14:36:10 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4PfrlY4rHjz1RtVp
	for <linux-sunxi@lists.linux.dev>; Sun, 19 Mar 2023 14:36:09 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
	reason="pass (just generated, assumed good)"
	header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
	opensource.wdc.com; h=content-transfer-encoding:content-type
	:in-reply-to:organization:from:content-language:references:to
	:subject:user-agent:mime-version:date:message-id; s=dkim; t=
	1679261769; x=1681853770; bh=TT1NZFDlglG04lWn8b3D569FNDwhCTSHE8V
	YkA5Dx+U=; b=QceyF5oNgACqQ8sjsaRsiMOKfIYhjptv+fXpR24cGwPjyZhDE1j
	vVmgqZawW8MFo5w81UX/N52F6h67agOJDFUyUb26MzgcphLhiinAiqQWkieTDSKP
	tMMgaECZYxLp1AAz1MMQPIQxuB1u4yb+076EfiIzRPeTuVAU47AJHX2rsw0FD0M6
	aN6IbHH5zNoOnkdty9lS8MRF7fH9wn7leP6VHgCRIEPD0Lu8nhsE0QYDYh6J7RuV
	YATURhDOEJMHT68V1LyWGaCM/XqNoNFWnDzd7tMvIHoW1lRA0mU47aUJRZFpCT9y
	Rk7jzcAnxN6RDazWX8w6IClCd740fySdtZQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
	by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id r5626LB6ljeG for <linux-sunxi@lists.linux.dev>;
	Sun, 19 Mar 2023 14:36:09 -0700 (PDT)
Received: from [10.225.163.91] (unknown [10.225.163.91])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4PfrlK1xCLz1RtVm;
	Sun, 19 Mar 2023 14:35:57 -0700 (PDT)
Message-ID: <de10b014-1a97-e74a-c7c4-b1004bf4cb60@opensource.wdc.com>
Date: Mon, 20 Mar 2023 06:35:55 +0900
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] dt-bindings: pinctrl: Drop unneeded quotes
To: Rob Herring <robh@kernel.org>, =?UTF-8?Q?Andreas_F=c3=a4rber?=
 <afaerber@suse.de>, Manivannan Sadhasivam <mani@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Hector Martin <marcan@marcan.st>,
 Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
 Damien Le Moal <damien.lemoal@wdc.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, NXP Linux Team <linux-imx@nxp.com>,
 Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Heiko Stuebner <heiko@sntech.de>, Tomasz Figa <tomasz.figa@gmail.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Emil Renner Berthing <kernel@esmil.dk>,
 Jianlong Huang <jianlong.huang@starfivetech.com>,
 Dvorkin Dmitry <dvorkin@tibbo.com>, Wells Lu <wellslutw@gmail.com>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Michal Simek <michal.simek@xilinx.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-actions@lists.infradead.org,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev,
 asahi@lists.linux.dev, linux-aspeed@lists.ozlabs.org,
 openbmc@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
References: <20230317233623.3968172-1-robh@kernel.org>
Content-Language: en-US
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <20230317233623.3968172-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/18/23 08:36, Rob Herring wrote:
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>

Reviewed-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>

-- 
Damien Le Moal
Western Digital Research

