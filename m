Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A418233C9
	for <linux-sunxi@lists.linux.dev>; Sun,  6 Aug 2023 11:41:58 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-52307552b03so5033228a12.0
        for <linux-sunxi@lists.linux.dev>; Sun, 06 Aug 2023 04:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691322116; x=1691926916;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WPZWtH2u7SjnBR/riBWb7bbLQE9L9HbqZdnf0YnBktM=;
        b=Sty5lhf/+MyIEk4hwQ9cvBMD8WViZJPDvPtKFCwKiOj31yKv1xg8RNt7qVng+uuxAB
         dF0J+R1WzMezzlkqB6H3KudnW8pfvn392k/vzmJc+BF6eMwm0XAI9JYi8u3ebjqPp4YW
         6nPWSX99BdkyZld9vm3FaE1/bmmc2r5N8d/VXv2A7o00bUBkNjopUPw/htodQjibsRtM
         IByA4tpKN5ijL6QCap/t2vppD4mGMCtkg+7Jl/4q9XFGGS2tUCtlhYEvXF7Ddqrri8pb
         rgQkzkiawXEXsCF2b6/EgR5dtx5G/51BSm3cSDohUepsNi7iKQwA9xvMfRcxifgKNO9W
         Pe0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691322116; x=1691926916;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WPZWtH2u7SjnBR/riBWb7bbLQE9L9HbqZdnf0YnBktM=;
        b=ao7LHVT921jZ8bJEVYflZMmSXb4Jymhcjkxt7n+pSPXfIn8LMN1j7OQw5ytyMr+Bnc
         Vwlbjq+ha4O6prucEvRPHMjBPceQXNW/O5U7eRaaGcSY7eX3zlZ3MT56dkkkjQb+KWT8
         ebGi8q7UYPEJG5BYM/XmkXv8w3LRQ/qqIGxofrly+JiwDeQBzahy7zZd/2A32E9MIliP
         zNm3V0GyluW28NyzllmCDFNaTHlavq5xm3OsNqqSthtKn09WASyi4rk0HLZn8q4ZNULu
         wZ3xhhq5Nbh9YwYvL0eG/CRCy35rm6Siufue7SAIaslamh/3+aNwMuOclnX/FAw/9XWl
         lzcA==
X-Gm-Message-State: AOJu0YyycvFpuGjoNU4qbs4jGCt640uQNNKmN+OdNJ2iHg/fH1rfIOLU
	DrCM6JFvANHnz49/E+auPMw=
X-Google-Smtp-Source: AGHT+IHjfr2mP6x5YwxDkuQ5vcpWIDj7BomvgLaOgkchjT8hDOHRAVJXim0VA8pfWmn5GNkEOKAxeQ==
X-Received: by 2002:a05:6402:74f:b0:523:1410:b611 with SMTP id p15-20020a056402074f00b005231410b611mr5851706edy.25.1691322116476;
        Sun, 06 Aug 2023 04:41:56 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id j2-20020a50ed02000000b005223e54d1edsm3785473eds.20.2023.08.06.04.41.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Aug 2023 04:41:55 -0700 (PDT)
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
Date: Sun, 06 Aug 2023 13:41:53 +0200
Message-ID: <5696647.DvuYhMxLoT@jernej-laptop>
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

Applied to sunxi tree, thanks!

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




