Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DB80291F
	for <linux-sunxi@lists.linux.dev>; Sun, 26 Feb 2023 23:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1677452424; x=1708988424;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=J9Xh3CSLaOh0wPb+8qljSocu9qIOGDzuCRuMHEY8zLA=;
  b=mMpn/JWPDa+Bt/pH+XhY44QNZc54A8Yj/eNRBK2+1J8LZThkafBHXHvy
   vaj2cdKHtuxrXWH8PXsJkUWSerHcdGItua65tDTcDh32AtODCrcgBaQ3k
   BxwrfbkzNOcLo8tYSmTVIWC1M3N1f8YyQlCgIYM78TqlvIxN6qhdp7MoC
   9TzitxVfVYxNN6U6Uo1xv1D7YrhDT2HdD0rHgAZmeNjr3b+geACByQgA1
   mzzzqHjY6K82lpMwLUVF7shOjYFh+Mug8oijvXxnZPj9t6gsHq7eocfuH
   6nPURUMY0lq+Sg7+dTu60tKoTCbSMbkKyg+I0wCPJVCKP1R7z897oJP90
   A==;
X-IronPort-AV: E=Sophos;i="5.97,330,1669046400"; 
   d="scan'208";a="222554289"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 27 Feb 2023 06:59:15 +0800
IronPort-SDR: OyMGjyX9byzBRQTMqVEcwNvQHmfc1ZYC/y5XTQ5cI/7NYSgaO5mLyvv/wyNmdugfJQ6jkqUGrh
 ZBRihcvKWCgnq+vUij2SX/lDFDHA+MhJ1jNRZSO3WXwS7XK51cHs48q04CmyjpKDD1sJTKvw4Q
 2CeXJ8fdZqphAKogXZ0UWa7VFKcWG345GEvdEjxcIaehL+IMbo+VW+6Qb+pezrmoHsKVDIbu6n
 P4tvjH9BTu+yg6NMVtV0/2+JerPdDPE1SvOwC2WHpgNAczmn1KyWq34fjMZKwHxIMM2u3Ro5SI
 L3M=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 26 Feb 2023 14:16:08 -0800
IronPort-SDR: I7OmA1Zz8zbEhtIjza9Gh3dZCMiXT2kLPXaxWd64AQhPThJnQql7i7NWkRE7QE/WggNJiPXxfu
 jSzXn6R+FHsxy1va9BkOkScyjBcUFfU0AyVdXI42e4Ii3XNNw3Zm5/ahQWEWt+KYt6bQsFvAbX
 adwIkbe9bmuBIyRB8pOOIZQrsnBLgXeSmcZlOZnRgnEh0nzNsOkhdYwGtZZPEV6XBbxReF9Oup
 k1kBYw/q2W68ww763m6op49OHLnzAD8SWAVqy/O2DQ5OxalIjJjHbpWmwJA1iZA7aig7tPVsLJ
 EXc=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 26 Feb 2023 14:59:16 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4PPzb737Sfz1Rwt8
	for <linux-sunxi@lists.linux.dev>; Sun, 26 Feb 2023 14:59:15 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
	reason="pass (just generated, assumed good)"
	header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
	opensource.wdc.com; h=content-transfer-encoding:content-type
	:in-reply-to:organization:from:references:to:content-language
	:subject:user-agent:mime-version:date:message-id; s=dkim; t=
	1677452354; x=1680044355; bh=J9Xh3CSLaOh0wPb+8qljSocu9qIOGDzuCRu
	MHEY8zLA=; b=iAFv7gkoa1pp+0xeoFxAdTchRJcF7b5UmjXwypMYYaMEb+gXnhh
	i+xBLhRs7ybC6NKcaFw1srFUizSpMJeDj3DQb3u52D15SERUpb3qogMC05ahSV0Y
	Rfu9IKYjLO8ZUjHo834CD/sYRhYEslbVwDIEgc2ZmU1mFVQU7vxDbCob9DXmC60R
	A78dZnTzDMksnw3bnTzp+W8BcBYl0KqZEcYY13QB5+bS3Z0Bt7BmxsEweV82kybH
	cIMGUln2jO0hFnxaRlIQBZpOOvSZTLpgd3fHkasBzpalSwtP1irBSCNzj1UrwHzU
	e2IJ7N7AouJmgR9knygZsoS8VFPenj4hDWw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
	by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id GoMXAmrXKCM6 for <linux-sunxi@lists.linux.dev>;
	Sun, 26 Feb 2023 14:59:14 -0800 (PST)
Received: from [10.225.163.40] (unknown [10.225.163.40])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4PPzZz6V4Rz1RvLy;
	Sun, 26 Feb 2023 14:59:07 -0800 (PST)
Message-ID: <fc0adb2c-8be0-ec89-ba68-032862b700a9@opensource.wdc.com>
Date: Mon, 27 Feb 2023 07:59:06 +0900
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 04/20] thermal/core: Use the thermal zone 'devdata'
 accessor in remaining drivers
Content-Language: en-US
To: Daniel Lezcano <daniel.lezcano@linaro.org>, rafael@kernel.org
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Ido Schimmel <idosch@nvidia.com>,
 Gregory Greenman <gregory.greenman@intel.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Zhang Rui <rui.zhang@intel.com>, Len Brown <lenb@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Raju Rangoju
 <rajur@chelsio.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Petr Machata <petrm@nvidia.com>,
 Kalle Valo <kvalo@kernel.org>, Sebastian Reichel <sre@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 "open list:ACPI THERMAL DRIVER" <linux-acpi@vger.kernel.org>,
 "open list:LIBATA SUBSYSTEM (Serial and Parallel ATA drivers)"
 <linux-ide@vger.kernel.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:IIO SUBSYSTEM AND DRIVERS" <linux-iio@vger.kernel.org>,
 "open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>,
 "open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)..."
 <linux-input@vger.kernel.org>,
 "open list:CXGB4 ETHERNET DRIVER (CXGB4)" <netdev@vger.kernel.org>,
 "open list:INTEL WIRELESS WIFI LINK (iwlwifi)"
 <linux-wireless@vger.kernel.org>
References: <20230226225406.979703-1-daniel.lezcano@linaro.org>
 <20230226225406.979703-5-daniel.lezcano@linaro.org>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <20230226225406.979703-5-daniel.lezcano@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/27/23 07:53, Daniel Lezcano wrote:
> The thermal zone device structure is exposed to the different drivers
> and obviously they access the internals while that should be
> restricted to the core thermal code.
> 
> In order to self-encapsulate the thermal core code, we need to prevent
> the drivers accessing directly the thermal zone structure and provide
> accessor functions to deal with.
> 
> Use the devdata accessor introduced in the previous patch.
> 
> No functional changes intended.
> 
> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> Acked-by: Mark Brown <broonie@kernel.org>
> Reviewed-by: Ido Schimmel <idosch@nvidia.com> #mlxsw
> Acked-by: Gregory Greenman <gregory.greenman@intel.com> #iwlwifi
> Acked-by: Sebastian Reichel <sebastian.reichel@collabora.com> #power_supply
> Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

For the ahci change:

Acked-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>

-- 
Damien Le Moal
Western Digital Research

