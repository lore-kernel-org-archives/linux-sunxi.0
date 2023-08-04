Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F07E5BA4D
	for <linux-sunxi@lists.linux.dev>; Fri,  4 Aug 2023 14:38:16 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-3fbea147034so20705905e9.0
        for <linux-sunxi@lists.linux.dev>; Fri, 04 Aug 2023 07:38:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691159895; x=1691764695;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BM5R+rkSeL9WIp21l2emysOOucIRf/CjafaqigjE3ns=;
        b=P52o47d9dHG1aUMZwk0pd23gUMU1gSEcAaorjtm0PUBSc4CTskirX886xdzRJezLg6
         M4MtQIA6juxB9+sFPFH3EPWi9hMPTVDd1wwyWh3PmXuu1po0m+repmiBQFo72mEPoUaF
         CKzmuVyB06487jxO3URnO0OYZ2cjQP/ZYPY+Ly4YmQO1h8Ul1MwxJiS6CzfTEpBkUg4D
         GvHC2AtRasiPCNfOkLFtYCr2iYrhUrXdaNuwr9xpfY5akGkjLPDtWAHv3doGspA8ZqzA
         BVho52Djxf/ClpbDDROl0ciKQJHwoe5ELFkv+xQsoTFDKnytt8GlFd+Ntd6Geakv25p/
         LA8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691159895; x=1691764695;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BM5R+rkSeL9WIp21l2emysOOucIRf/CjafaqigjE3ns=;
        b=hilmY/CorBloiqhxTKzDXBus1CujBsoh7L6bzv/sIlDR5eGRgawV2cXw7zYMuTwWEZ
         UNL32NURn1CbHGUM3PkD3pM5+4FnA61oPpAefBYTR0UGnQJDF9y7+VWyXBDo4V4uBk+u
         hb4kZBBQeeEpJTwDKP+QbR9IL7aIgNfi++1iVtnqMFH+NKC7a127zJxkAdNpn71f9KF0
         ScRhzF/i4cqGOuVPEhJ0llTxzqgEYarryIuJ5RmhBBL2Nf6j0nkIXsjeNTh7h5+7wNta
         C1Ms5zail3bmM3vJq90A3LpSdOIIfLlQQFLgD4b93YGo+oRm9rLhzYPMfzKSda4Wuc3E
         RiRg==
X-Gm-Message-State: AOJu0Ywr5gcoY9TIpwbu1hZLExsj/c52paCsgAFoZId8nNHtFlHUXraZ
	wVN6Gm8qnylL39iBJP98PLA=
X-Google-Smtp-Source: AGHT+IFR8gDqjRYqyXRMOxF0JJDJ3mrxElW64dDSszEM8SNr/lPevhKIntH0L12mO9e2OcoWVt3KOw==
X-Received: by 2002:a1c:7c05:0:b0:3fb:e4ce:cc65 with SMTP id x5-20020a1c7c05000000b003fbe4cecc65mr1591896wmc.25.1691159894687;
        Fri, 04 Aug 2023 07:38:14 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id f9-20020a7bc8c9000000b003fba92fad35sm6833727wml.26.2023.08.04.07.38.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Aug 2023 07:38:14 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: soc@kernel.org, Patrice Chotard <patrice.chotard@foss.st.com>,
 Tsahee Zidenberg <tsahee@annapurnalabs.com>,
 Antoine Tenart <atenart@kernel.org>, Jisheng Zhang <jszhang@kernel.org>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>,
 Jean-Marie Verdun <verdun@hpe.com>, Nick Hawkins <nick.hawkins@hpe.com>,
 Lubomir Rintel <lkundrak@v3.sk>, Linus Walleij <linus.walleij@linaro.org>,
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>,
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>,
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>,
 Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Heiko Stuebner <heiko@sntech.de>,
 Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
 Shiraz Has him <shiraz.linux.kernel@gmail.com>,
 Stuart Yoder <stuyoder@gmail.com>, Laurentiu Tudor <laurentiu.tudor@nxp.com>,
 Jay Fang <f.fangjian@huawei.com>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Cristian Marussi <cristian.marussi@arm.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Dinh Nguyen <dinguyen@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Michal Simek <michal.simek@amd.com>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Ulf Hansson <ulf.hansson@linaro.org>, Li Yang <leoyang.li@nxp.com>,
 Qiang Zhao <qiang.zhao@nxp.com>, Rob Herring <robh@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-rockchip@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-mediatek@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, linux-pm@vger.kernel.org
Subject:
 Re: [PATCH v2 21/23] soc: sunxi: Explicitly include correct DT includes
Date: Fri, 04 Aug 2023 16:38:11 +0200
Message-ID: <2690872.mvXUDI8C0e@jernej-laptop>
In-Reply-To:
 <20230803-dt-header-cleanups-for-soc-v2-21-d8de2cc88bff@kernel.org>
References:
 <20230803-dt-header-cleanups-for-soc-v2-0-d8de2cc88bff@kernel.org>
 <20230803-dt-header-cleanups-for-soc-v2-21-d8de2cc88bff@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne petek, 04. avgust 2023 ob 00:43:01 CEST je Rob Herring napisal(a):
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

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Should I take this through sunxi tree?

Best regards,
Jernej

> ---
> v2:
>  - Drop sun20i-ppu.c which moved
> ---
>  drivers/soc/sunxi/sunxi_sram.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/sunxi/sunxi_sram.c b/drivers/soc/sunxi/sunxi_sram.c
> index 4c4864cd2342..4458b2e0562b 100644
> --- a/drivers/soc/sunxi/sunxi_sram.c
> +++ b/drivers/soc/sunxi/sunxi_sram.c
> @@ -15,7 +15,7 @@
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/of_address.h>
> -#include <linux/of_device.h>
> +#include <linux/of_platform.h>
>  #include <linux/platform_device.h>
>  #include <linux/regmap.h>




