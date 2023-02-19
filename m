Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52FB729B0
	for <linux-sunxi@lists.linux.dev>; Sun, 19 Feb 2023 17:26:35 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id eq27so987777edb.5
        for <linux-sunxi@lists.linux.dev>; Sun, 19 Feb 2023 09:26:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3VEydMb61qXjyUuHx50DS5MjqkMWbNi7p/BGphDgb7g=;
        b=BTDQKmDAUpCMrOaZ65GdSbOPIMPVt9MrMM2yyDYjGh5NttUwebWMfZRJKk/aym79M2
         krwJSPLEjjSVd9ZxQ6t0eajf+A8F/FAe88qsZtN8cFlgeBZJP49ICI+U72C61KNSnutg
         iFLNp91+zfOuoFggFt6d/n+4QpJ5RKV2nkxoTVMm6zz7PUzmrksewDw9XE1EjJPtW3bK
         KVZrLOB+N3FfD17qI3V+oyqT49P3K9DrnzL4BKxkf4Fm3rcQkFEd8UA1sV7GFlqeRo80
         I3OKYEM7d4YiM0WiuyRG8lEqETnSubptt9k6JL7CvzICu0BvKe34O/Ykn1FXp7/3upTB
         uRvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3VEydMb61qXjyUuHx50DS5MjqkMWbNi7p/BGphDgb7g=;
        b=XkfKzUZPVXrrleDjGmMf456bkb3V4qx3fvXFfKflkb1SitLpzvCuW9sQfxfj1gHNtC
         0rHQQ66Rimr37SLrdNMlFrbjskwQlG+q9P6Z//qJA8j4rMTUqJo5moWYnwthJx40mLYC
         9QnwZF9qDGoohtdp4egjmpt2dBXjWKHM0cuRZAkzQPc2wpdKWVOtJDPuyKMw50KYvRkb
         NIObjnw7vpXSDiFC6QN2G7/6trC8QmpFx2zRHt6zCAtx6SziOTqGUn5KWxkRVL6nX9cQ
         2AHry6LGXCcDXTCyRfOTbp8FUNc8VObycH9bo9srQa9150yvC08vi4+dUPULePD0YEq2
         1xjA==
X-Gm-Message-State: AO0yUKVVPx72cqgoyycV0Vzm42cVMi0G4eOO0EUcqBZg0fxHWCywotYI
	+HWtPdH9w0UASVBi7H6CE9K8Z2gq3bSg8ZSIw04=
X-Google-Smtp-Source: AK7set+HJ8ugf54hyVxoMHuivdcoWWsyfiGwYdZMNvgLG69WPq5tKTBVZni7iBuMPHyMZ4Z10CLK8MHIDK89J3oADnI=
X-Received: by 2002:a17:906:c5b:b0:8cf:bb36:1486 with SMTP id
 t27-20020a1709060c5b00b008cfbb361486mr448990ejf.6.1676827593334; Sun, 19 Feb
 2023 09:26:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230219143657.241542-1-daniel.lezcano@linaro.org> <20230219143657.241542-6-daniel.lezcano@linaro.org>
In-Reply-To: <20230219143657.241542-6-daniel.lezcano@linaro.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 19 Feb 2023 18:26:22 +0100
Message-ID: <CAFBinCAm+pFuuJEL3_2B3o3ZaLWxb-JqHhxY0vJfb8ZfxKOieQ@mail.gmail.com>
Subject: Re: [PATCH v1 05/17] thermal/hwmon: Use the right device for devm_thermal_add_hwmon_sysfs()
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: rafael@kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Guillaume La Roque <glaroque@baylibre.com>, Amit Kucheria <amitk@kernel.org>, 
	Zhang Rui <rui.zhang@intel.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, 
	Thara Gopinath <thara.gopinath@gmail.com>, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Vasily Khoruzhick <anarsoul@gmail.com>, Yangtao Li <tiny.windzz@gmail.com>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Eduardo Valentin <edubezval@gmail.com>, Keerthy <j-keerthy@ti.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Daniel Golle <daniel@makrotopia.org>, ye xingchen <ye.xingchen@zte.com.cn>, 
	Randy Dunlap <rdunlap@infradead.org>, Balsam CHIHI <bchihi@baylibre.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
	"open list:THERMAL DRIVER FOR AMLOGIC SOCS" <linux-amlogic@lists.infradead.org>, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	"open list:QUALCOMM TSENS THERMAL DRIVER" <linux-arm-msm@vger.kernel.org>, 
	"open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>, 
	"open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>, 
	"open list:TI BANDGAP AND THERMAL DRIVER" <linux-omap@vger.kernel.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, Feb 19, 2023 at 3:38 PM Daniel Lezcano
<daniel.lezcano@linaro.org> wrote:
>
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
> ---
>  drivers/thermal/amlogic_thermal.c                  | 2 +-
For amlogic_thermal.c:
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
