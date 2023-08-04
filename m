Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0200440E
	for <linux-sunxi@lists.linux.dev>; Fri,  4 Aug 2023 19:08:24 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-3fe4cdb727cso4752385e9.0
        for <linux-sunxi@lists.linux.dev>; Fri, 04 Aug 2023 12:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691176103; x=1691780903;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uUct/82ZzJYoId4uQpyLnXW8CpRtqtjF90BwOBq+j0o=;
        b=Sw0i87+1TNyjnpxDcQG2yBq3mmDztmoLnSIvDewEdu7MsRTVLhilD7q5AKtBLX6bCP
         elMoZXCrptU3/c0hUjL82BhwCUtuwD234IiW92vDvJchvI9yWOV7n3ucy+Kx7L537UpN
         ipmvlloMQL3eFNqO481bhW999WW4XvMDm6ak4OyD64Rpj8BB6hwXU8YfbYPNYGs75uOd
         /SYwTd7gX9E3bMqFbqOqYohdq/v+V4XPSZkY26rQAtiQgPWjeUZjGKHlAxIk49TCmKSy
         gHGT/pFVmDRTERB+/+brCukvg2dEggQozIodxVeorNa5WTQs0TY+qbw22NEndee1NBb9
         N+dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691176103; x=1691780903;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uUct/82ZzJYoId4uQpyLnXW8CpRtqtjF90BwOBq+j0o=;
        b=b8/pnUH3mtjQJoQrL5W9q+Bay5QYCP2vpiuTcka8nHyX5svlrc648sRyUGLjL/qaVl
         PdWvYBBvrpo49b9W7BO7Hc8XLlS8nu65bHAyh1PHmv39UYCfvzsENGG51hKSP4zS9d43
         F1XZqyvJk3M99RQJUJtBsy3qQ/ILOpV8wpc0J88qGB5IlnA6bVPfR2FEj4SbNQlGqFrJ
         R4VoZa/4zV4Mqp3tVZy40K+kVhjcpVEPyU27cyPIl9A4qREMRSXbozLOz8fwnLIJY6A2
         vYzh4udz4fA2W517OozKwGoiVonMzYgXPscqrRUyzYjE3HCLk4VqRAGMerz32VUdz/IO
         T0JQ==
X-Gm-Message-State: AOJu0YyWPVRgZUm+VNGQSSdhCNmN3kg7FF81RcTAl7A+22RrGJIwzaFo
	8DyvVdNiIFujSiMwUc+V8yA=
X-Google-Smtp-Source: AGHT+IEVrZLvF9EJvd/t1u18YqhdNyGjzTlFOtuLbcjUbAk5S3X8YO69YyZ5+NC4O8tskW7xE0E92w==
X-Received: by 2002:a7b:cbd3:0:b0:3fb:c9f4:1506 with SMTP id n19-20020a7bcbd3000000b003fbc9f41506mr2400916wmi.1.1691176102471;
        Fri, 04 Aug 2023 12:08:22 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id u24-20020a05600c00d800b003fa95f328afsm7461683wmm.29.2023.08.04.12.08.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Aug 2023 12:08:22 -0700 (PDT)
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
Subject: Re: [PATCH v2 16/23] bus: Explicitly include correct DT includes
Date: Fri, 04 Aug 2023 21:08:19 +0200
Message-ID: <2151246.irdbgypaU6@jernej-laptop>
In-Reply-To:
 <20230803-dt-header-cleanups-for-soc-v2-16-d8de2cc88bff@kernel.org>
References:
 <20230803-dt-header-cleanups-for-soc-v2-0-d8de2cc88bff@kernel.org>
 <20230803-dt-header-cleanups-for-soc-v2-16-d8de2cc88bff@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne petek, 04. avgust 2023 ob 00:42:56 CEST je Rob Herring napisal(a):
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
>  drivers/bus/fsl-mc/fsl-mc-bus.c | 1 +
>  drivers/bus/fsl-mc/fsl-mc-msi.c | 2 --
>  drivers/bus/hisi_lpc.c          | 2 +-
>  drivers/bus/omap_l3_smx.c       | 1 -
>  drivers/bus/simple-pm-bus.c     | 2 ++
>  drivers/bus/sunxi-rsb.c         | 2 +-

for sunxi-rsb:
Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

>  drivers/bus/ti-pwmss.c          | 2 +-



