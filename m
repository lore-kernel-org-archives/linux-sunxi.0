Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55B6829CA
	for <linux-sunxi@lists.linux.dev>; Wed, 29 Sep 2021 13:46:33 +0000 (UTC)
Received: by mail-ot1-f41.google.com with SMTP id r43-20020a05683044ab00b0054716b40005so2908602otv.4
        for <linux-sunxi@lists.linux.dev>; Wed, 29 Sep 2021 06:46:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=+/MXDp5lSfzREKEgITArRlCmANJWQ4fNgTYRT7gWPOs=;
        b=YYyx3wjDpyLeGR5JuMyjPJMBekwh7qREDRrInCXJFSLAF1U3IyZqITxaX6RcLN0VhZ
         PM55Up3Wo8j7yTOP/enKVvLdVsMEj77/3ww0UKcHG4pEdXS7yWxMCgXNe7IRZScaEUUy
         dolkd66TYV4NN+mrM1VlJO9Ln1Qae3gMK7ULZ5o38zFfJLLSi4gvi9e/Ab0A4wrhL3oF
         A+1Tv5K7kU3PjvZdjNJt7opp1yMm8xDIVxvijFf0KMH0E95OWTBDSci9mw8w0pzSZ6j9
         IsbRYGUXWqgSdOr69xoKn/vZuB0IgRoJ6xuIb9tqBa/qzoz+m8fVq0KG+9T2PEsjsuHd
         3Dyg==
X-Gm-Message-State: AOAM530+BE0WM0atP5Uy5wp6dv5/PNo4Fmz0u78GCFdj50Aws7VU4D7Z
	zpX5VJLyZmfpcDdgy9wVTQ==
X-Google-Smtp-Source: ABdhPJwWCs2LpyK/SBbcMfPq3UTqBeSTapF14nv2GGsXxNcx6ZKbh/av/NqIZz0rV3ae7lFwIoiypw==
X-Received: by 2002:a05:6830:2806:: with SMTP id w6mr87527otu.238.1632923192413;
        Wed, 29 Sep 2021 06:46:32 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id t4sm470703otj.18.2021.09.29.06.46.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Sep 2021 06:46:31 -0700 (PDT)
Received: (nullmailer pid 3674451 invoked by uid 1000);
	Wed, 29 Sep 2021 13:46:25 -0000
From: Rob Herring <robh@kernel.org>
To: Samuel Holland <samuel@sholland.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, Rob Herring <robh+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Chen-Yu Tsai <wens@csie.org>, Chanwoo Choi <cw00.choi@samsung.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Jernej Skrabec <jernej.skrabec@gmail.com>
In-Reply-To: <20210929044254.38301-7-samuel@sholland.org>
References: <20210929044254.38301-1-samuel@sholland.org> <20210929044254.38301-7-samuel@sholland.org>
Subject: Re: [PATCH 06/10] dt-bindings: arm: sunxi: Expand MBUS binding
Date: Wed, 29 Sep 2021 08:46:25 -0500
Message-Id: <1632923185.755788.3674450.nullmailer@robh.at.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

On Tue, 28 Sep 2021 23:42:50 -0500, Samuel Holland wrote:
> The MBUS provides more than address translation and bandwidth control.
> It also provides a PMU to measure bandwidth usage by certain masters,
> and it provides notification via IRQ when they are active or idle.
> 
> The MBUS is also tightly integrated with the DRAM controller to provide
> a Memory Dynamic Frequency Scaling (MDFS) feature. In view of this, the
> MBUS binding needs to represent the hardware resources needed for MDFS,
> which include the clocks and MMIO range of the adjacent DRAM controller.
> 
> Add the additional resources for the H3 and A64 compatibles, and a new
> example showing how they are used.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
>  .../arm/sunxi/allwinner,sun4i-a10-mbus.yaml   | 75 ++++++++++++++++++-
>  1 file changed, 72 insertions(+), 3 deletions(-)
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/patch/1534210


dram-controller@1c62000: 'clock-names' is a required property
	arch/arm64/boot/dts/allwinner/sun50i-a64-amarula-relic.dt.yaml
	arch/arm64/boot/dts/allwinner/sun50i-a64-bananapi-m64.dt.yaml
	arch/arm64/boot/dts/allwinner/sun50i-a64-nanopi-a64.dt.yaml
	arch/arm64/boot/dts/allwinner/sun50i-a64-oceanic-5205-5inmfd.dt.yaml
	arch/arm64/boot/dts/allwinner/sun50i-a64-olinuxino.dt.yaml
	arch/arm64/boot/dts/allwinner/sun50i-a64-olinuxino-emmc.dt.yaml
	arch/arm64/boot/dts/allwinner/sun50i-a64-orangepi-win.dt.yaml
	arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dt.yaml
	arch/arm64/boot/dts/allwinner/sun50i-a64-pine64-lts.dt.yaml
	arch/arm64/boot/dts/allwinner/sun50i-a64-pine64-plus.dt.yaml
	arch/arm64/boot/dts/allwinner/sun50i-a64-pinebook.dt.yaml
	arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone-1.0.dt.yaml
	arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone-1.1.dt.yaml
	arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone-1.2.dt.yaml
	arch/arm64/boot/dts/allwinner/sun50i-a64-pinetab.dt.yaml
	arch/arm64/boot/dts/allwinner/sun50i-a64-pinetab-early-adopter.dt.yaml
	arch/arm64/boot/dts/allwinner/sun50i-a64-sopine-baseboard.dt.yaml
	arch/arm64/boot/dts/allwinner/sun50i-a64-teres-i.dt.yaml
	arch/arm64/boot/dts/allwinner/sun50i-h5-bananapi-m2-plus.dt.yaml
	arch/arm64/boot/dts/allwinner/sun50i-h5-bananapi-m2-plus-v1.2.dt.yaml
	arch/arm64/boot/dts/allwinner/sun50i-h5-emlid-neutis-n5-devboard.dt.yaml
	arch/arm64/boot/dts/allwinner/sun50i-h5-libretech-all-h3-cc.dt.yaml
	arch/arm64/boot/dts/allwinner/sun50i-h5-libretech-all-h3-it.dt.yaml
	arch/arm64/boot/dts/allwinner/sun50i-h5-libretech-all-h5-cc.dt.yaml
	arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-neo2.dt.yaml
	arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-neo-plus2.dt.yaml
	arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-r1s-h5.dt.yaml
	arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-pc2.dt.yaml
	arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-prime.dt.yaml
	arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dt.yaml
	arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus.dt.yaml
	arch/arm/boot/dts/sun8i-h2-plus-bananapi-m2-zero.dt.yaml
	arch/arm/boot/dts/sun8i-h2-plus-libretech-all-h3-cc.dt.yaml
	arch/arm/boot/dts/sun8i-h2-plus-orangepi-r1.dt.yaml
	arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dt.yaml
	arch/arm/boot/dts/sun8i-h3-bananapi-m2-plus.dt.yaml
	arch/arm/boot/dts/sun8i-h3-bananapi-m2-plus-v1.2.dt.yaml
	arch/arm/boot/dts/sun8i-h3-beelink-x2.dt.yaml
	arch/arm/boot/dts/sun8i-h3-emlid-neutis-n5h3-devboard.dt.yaml
	arch/arm/boot/dts/sun8i-h3-libretech-all-h3-cc.dt.yaml
	arch/arm/boot/dts/sun8i-h3-mapleboard-mp130.dt.yaml
	arch/arm/boot/dts/sun8i-h3-nanopi-duo2.dt.yaml
	arch/arm/boot/dts/sun8i-h3-nanopi-m1.dt.yaml
	arch/arm/boot/dts/sun8i-h3-nanopi-m1-plus.dt.yaml
	arch/arm/boot/dts/sun8i-h3-nanopi-neo-air.dt.yaml
	arch/arm/boot/dts/sun8i-h3-nanopi-neo.dt.yaml
	arch/arm/boot/dts/sun8i-h3-nanopi-r1.dt.yaml
	arch/arm/boot/dts/sun8i-h3-orangepi-2.dt.yaml
	arch/arm/boot/dts/sun8i-h3-orangepi-lite.dt.yaml
	arch/arm/boot/dts/sun8i-h3-orangepi-one.dt.yaml
	arch/arm/boot/dts/sun8i-h3-orangepi-pc.dt.yaml
	arch/arm/boot/dts/sun8i-h3-orangepi-pc-plus.dt.yaml
	arch/arm/boot/dts/sun8i-h3-orangepi-plus2e.dt.yaml
	arch/arm/boot/dts/sun8i-h3-orangepi-plus.dt.yaml
	arch/arm/boot/dts/sun8i-h3-orangepi-zero-plus2.dt.yaml
	arch/arm/boot/dts/sun8i-h3-rervision-dvk.dt.yaml
	arch/arm/boot/dts/sun8i-h3-zeropi.dt.yaml

dram-controller@1c62000: clocks: [[2, 112]] is too short
	arch/arm64/boot/dts/allwinner/sun50i-a64-amarula-relic.dt.yaml
	arch/arm64/boot/dts/allwinner/sun50i-a64-bananapi-m64.dt.yaml
	arch/arm64/boot/dts/allwinner/sun50i-a64-nanopi-a64.dt.yaml
	arch/arm64/boot/dts/allwinner/sun50i-a64-oceanic-5205-5inmfd.dt.yaml
	arch/arm64/boot/dts/allwinner/sun50i-a64-olinuxino.dt.yaml
	arch/arm64/boot/dts/allwinner/sun50i-a64-olinuxino-emmc.dt.yaml
	arch/arm64/boot/dts/allwinner/sun50i-a64-orangepi-win.dt.yaml
	arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dt.yaml
	arch/arm64/boot/dts/allwinner/sun50i-a64-pine64-lts.dt.yaml
	arch/arm64/boot/dts/allwinner/sun50i-a64-pine64-plus.dt.yaml
	arch/arm64/boot/dts/allwinner/sun50i-a64-pinebook.dt.yaml
	arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone-1.0.dt.yaml
	arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone-1.1.dt.yaml
	arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone-1.2.dt.yaml
	arch/arm64/boot/dts/allwinner/sun50i-a64-pinetab.dt.yaml
	arch/arm64/boot/dts/allwinner/sun50i-a64-pinetab-early-adopter.dt.yaml
	arch/arm64/boot/dts/allwinner/sun50i-a64-sopine-baseboard.dt.yaml
	arch/arm64/boot/dts/allwinner/sun50i-a64-teres-i.dt.yaml

dram-controller@1c62000: clocks: [[3, 113]] is too short
	arch/arm64/boot/dts/allwinner/sun50i-h5-bananapi-m2-plus.dt.yaml
	arch/arm64/boot/dts/allwinner/sun50i-h5-bananapi-m2-plus-v1.2.dt.yaml
	arch/arm64/boot/dts/allwinner/sun50i-h5-emlid-neutis-n5-devboard.dt.yaml
	arch/arm64/boot/dts/allwinner/sun50i-h5-libretech-all-h3-cc.dt.yaml
	arch/arm64/boot/dts/allwinner/sun50i-h5-libretech-all-h3-it.dt.yaml
	arch/arm64/boot/dts/allwinner/sun50i-h5-libretech-all-h5-cc.dt.yaml
	arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-neo2.dt.yaml
	arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-neo-plus2.dt.yaml
	arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-r1s-h5.dt.yaml
	arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-pc2.dt.yaml
	arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-prime.dt.yaml
	arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dt.yaml
	arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus.dt.yaml
	arch/arm/boot/dts/sun8i-h2-plus-bananapi-m2-zero.dt.yaml
	arch/arm/boot/dts/sun8i-h2-plus-libretech-all-h3-cc.dt.yaml
	arch/arm/boot/dts/sun8i-h2-plus-orangepi-r1.dt.yaml
	arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dt.yaml
	arch/arm/boot/dts/sun8i-h3-bananapi-m2-plus.dt.yaml
	arch/arm/boot/dts/sun8i-h3-bananapi-m2-plus-v1.2.dt.yaml
	arch/arm/boot/dts/sun8i-h3-beelink-x2.dt.yaml
	arch/arm/boot/dts/sun8i-h3-emlid-neutis-n5h3-devboard.dt.yaml
	arch/arm/boot/dts/sun8i-h3-libretech-all-h3-cc.dt.yaml
	arch/arm/boot/dts/sun8i-h3-mapleboard-mp130.dt.yaml
	arch/arm/boot/dts/sun8i-h3-nanopi-duo2.dt.yaml
	arch/arm/boot/dts/sun8i-h3-nanopi-m1.dt.yaml
	arch/arm/boot/dts/sun8i-h3-nanopi-m1-plus.dt.yaml
	arch/arm/boot/dts/sun8i-h3-nanopi-neo-air.dt.yaml
	arch/arm/boot/dts/sun8i-h3-nanopi-neo.dt.yaml
	arch/arm/boot/dts/sun8i-h3-nanopi-r1.dt.yaml
	arch/arm/boot/dts/sun8i-h3-orangepi-2.dt.yaml
	arch/arm/boot/dts/sun8i-h3-orangepi-lite.dt.yaml
	arch/arm/boot/dts/sun8i-h3-orangepi-one.dt.yaml
	arch/arm/boot/dts/sun8i-h3-orangepi-pc.dt.yaml
	arch/arm/boot/dts/sun8i-h3-orangepi-pc-plus.dt.yaml
	arch/arm/boot/dts/sun8i-h3-orangepi-plus2e.dt.yaml
	arch/arm/boot/dts/sun8i-h3-orangepi-plus.dt.yaml
	arch/arm/boot/dts/sun8i-h3-orangepi-zero-plus2.dt.yaml
	arch/arm/boot/dts/sun8i-h3-rervision-dvk.dt.yaml
	arch/arm/boot/dts/sun8i-h3-zeropi.dt.yaml

dram-controller@1c62000: reg: [[29761536, 4096]] is too short
	arch/arm64/boot/dts/allwinner/sun50i-a64-amarula-relic.dt.yaml
	arch/arm64/boot/dts/allwinner/sun50i-a64-bananapi-m64.dt.yaml
	arch/arm64/boot/dts/allwinner/sun50i-a64-nanopi-a64.dt.yaml
	arch/arm64/boot/dts/allwinner/sun50i-a64-oceanic-5205-5inmfd.dt.yaml
	arch/arm64/boot/dts/allwinner/sun50i-a64-olinuxino.dt.yaml
	arch/arm64/boot/dts/allwinner/sun50i-a64-olinuxino-emmc.dt.yaml
	arch/arm64/boot/dts/allwinner/sun50i-a64-orangepi-win.dt.yaml
	arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dt.yaml
	arch/arm64/boot/dts/allwinner/sun50i-a64-pine64-lts.dt.yaml
	arch/arm64/boot/dts/allwinner/sun50i-a64-pine64-plus.dt.yaml
	arch/arm64/boot/dts/allwinner/sun50i-a64-pinebook.dt.yaml
	arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone-1.0.dt.yaml
	arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone-1.1.dt.yaml
	arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone-1.2.dt.yaml
	arch/arm64/boot/dts/allwinner/sun50i-a64-pinetab.dt.yaml
	arch/arm64/boot/dts/allwinner/sun50i-a64-pinetab-early-adopter.dt.yaml
	arch/arm64/boot/dts/allwinner/sun50i-a64-sopine-baseboard.dt.yaml
	arch/arm64/boot/dts/allwinner/sun50i-a64-teres-i.dt.yaml
	arch/arm64/boot/dts/allwinner/sun50i-h5-bananapi-m2-plus.dt.yaml
	arch/arm64/boot/dts/allwinner/sun50i-h5-bananapi-m2-plus-v1.2.dt.yaml
	arch/arm64/boot/dts/allwinner/sun50i-h5-emlid-neutis-n5-devboard.dt.yaml
	arch/arm64/boot/dts/allwinner/sun50i-h5-libretech-all-h3-cc.dt.yaml
	arch/arm64/boot/dts/allwinner/sun50i-h5-libretech-all-h3-it.dt.yaml
	arch/arm64/boot/dts/allwinner/sun50i-h5-libretech-all-h5-cc.dt.yaml
	arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-neo2.dt.yaml
	arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-neo-plus2.dt.yaml
	arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-r1s-h5.dt.yaml
	arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-pc2.dt.yaml
	arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-prime.dt.yaml
	arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dt.yaml
	arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus.dt.yaml
	arch/arm/boot/dts/sun8i-h2-plus-bananapi-m2-zero.dt.yaml
	arch/arm/boot/dts/sun8i-h2-plus-libretech-all-h3-cc.dt.yaml
	arch/arm/boot/dts/sun8i-h2-plus-orangepi-r1.dt.yaml
	arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dt.yaml
	arch/arm/boot/dts/sun8i-h3-bananapi-m2-plus.dt.yaml
	arch/arm/boot/dts/sun8i-h3-bananapi-m2-plus-v1.2.dt.yaml
	arch/arm/boot/dts/sun8i-h3-beelink-x2.dt.yaml
	arch/arm/boot/dts/sun8i-h3-emlid-neutis-n5h3-devboard.dt.yaml
	arch/arm/boot/dts/sun8i-h3-libretech-all-h3-cc.dt.yaml
	arch/arm/boot/dts/sun8i-h3-mapleboard-mp130.dt.yaml
	arch/arm/boot/dts/sun8i-h3-nanopi-duo2.dt.yaml
	arch/arm/boot/dts/sun8i-h3-nanopi-m1.dt.yaml
	arch/arm/boot/dts/sun8i-h3-nanopi-m1-plus.dt.yaml
	arch/arm/boot/dts/sun8i-h3-nanopi-neo-air.dt.yaml
	arch/arm/boot/dts/sun8i-h3-nanopi-neo.dt.yaml
	arch/arm/boot/dts/sun8i-h3-nanopi-r1.dt.yaml
	arch/arm/boot/dts/sun8i-h3-orangepi-2.dt.yaml
	arch/arm/boot/dts/sun8i-h3-orangepi-lite.dt.yaml
	arch/arm/boot/dts/sun8i-h3-orangepi-one.dt.yaml
	arch/arm/boot/dts/sun8i-h3-orangepi-pc.dt.yaml
	arch/arm/boot/dts/sun8i-h3-orangepi-pc-plus.dt.yaml
	arch/arm/boot/dts/sun8i-h3-orangepi-plus2e.dt.yaml
	arch/arm/boot/dts/sun8i-h3-orangepi-plus.dt.yaml
	arch/arm/boot/dts/sun8i-h3-orangepi-zero-plus2.dt.yaml
	arch/arm/boot/dts/sun8i-h3-rervision-dvk.dt.yaml
	arch/arm/boot/dts/sun8i-h3-zeropi.dt.yaml

dram-controller@1c62000: 'reg-names' is a required property
	arch/arm64/boot/dts/allwinner/sun50i-a64-amarula-relic.dt.yaml
	arch/arm64/boot/dts/allwinner/sun50i-a64-bananapi-m64.dt.yaml
	arch/arm64/boot/dts/allwinner/sun50i-a64-nanopi-a64.dt.yaml
	arch/arm64/boot/dts/allwinner/sun50i-a64-oceanic-5205-5inmfd.dt.yaml
	arch/arm64/boot/dts/allwinner/sun50i-a64-olinuxino.dt.yaml
	arch/arm64/boot/dts/allwinner/sun50i-a64-olinuxino-emmc.dt.yaml
	arch/arm64/boot/dts/allwinner/sun50i-a64-orangepi-win.dt.yaml
	arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dt.yaml
	arch/arm64/boot/dts/allwinner/sun50i-a64-pine64-lts.dt.yaml
	arch/arm64/boot/dts/allwinner/sun50i-a64-pine64-plus.dt.yaml
	arch/arm64/boot/dts/allwinner/sun50i-a64-pinebook.dt.yaml
	arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone-1.0.dt.yaml
	arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone-1.1.dt.yaml
	arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone-1.2.dt.yaml
	arch/arm64/boot/dts/allwinner/sun50i-a64-pinetab.dt.yaml
	arch/arm64/boot/dts/allwinner/sun50i-a64-pinetab-early-adopter.dt.yaml
	arch/arm64/boot/dts/allwinner/sun50i-a64-sopine-baseboard.dt.yaml
	arch/arm64/boot/dts/allwinner/sun50i-a64-teres-i.dt.yaml
	arch/arm64/boot/dts/allwinner/sun50i-h5-bananapi-m2-plus.dt.yaml
	arch/arm64/boot/dts/allwinner/sun50i-h5-bananapi-m2-plus-v1.2.dt.yaml
	arch/arm64/boot/dts/allwinner/sun50i-h5-emlid-neutis-n5-devboard.dt.yaml
	arch/arm64/boot/dts/allwinner/sun50i-h5-libretech-all-h3-cc.dt.yaml
	arch/arm64/boot/dts/allwinner/sun50i-h5-libretech-all-h3-it.dt.yaml
	arch/arm64/boot/dts/allwinner/sun50i-h5-libretech-all-h5-cc.dt.yaml
	arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-neo2.dt.yaml
	arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-neo-plus2.dt.yaml
	arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-r1s-h5.dt.yaml
	arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-pc2.dt.yaml
	arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-prime.dt.yaml
	arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dt.yaml
	arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus.dt.yaml
	arch/arm/boot/dts/sun8i-h2-plus-bananapi-m2-zero.dt.yaml
	arch/arm/boot/dts/sun8i-h2-plus-libretech-all-h3-cc.dt.yaml
	arch/arm/boot/dts/sun8i-h2-plus-orangepi-r1.dt.yaml
	arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dt.yaml
	arch/arm/boot/dts/sun8i-h3-bananapi-m2-plus.dt.yaml
	arch/arm/boot/dts/sun8i-h3-bananapi-m2-plus-v1.2.dt.yaml
	arch/arm/boot/dts/sun8i-h3-beelink-x2.dt.yaml
	arch/arm/boot/dts/sun8i-h3-emlid-neutis-n5h3-devboard.dt.yaml
	arch/arm/boot/dts/sun8i-h3-libretech-all-h3-cc.dt.yaml
	arch/arm/boot/dts/sun8i-h3-mapleboard-mp130.dt.yaml
	arch/arm/boot/dts/sun8i-h3-nanopi-duo2.dt.yaml
	arch/arm/boot/dts/sun8i-h3-nanopi-m1.dt.yaml
	arch/arm/boot/dts/sun8i-h3-nanopi-m1-plus.dt.yaml
	arch/arm/boot/dts/sun8i-h3-nanopi-neo-air.dt.yaml
	arch/arm/boot/dts/sun8i-h3-nanopi-neo.dt.yaml
	arch/arm/boot/dts/sun8i-h3-nanopi-r1.dt.yaml
	arch/arm/boot/dts/sun8i-h3-orangepi-2.dt.yaml
	arch/arm/boot/dts/sun8i-h3-orangepi-lite.dt.yaml
	arch/arm/boot/dts/sun8i-h3-orangepi-one.dt.yaml
	arch/arm/boot/dts/sun8i-h3-orangepi-pc.dt.yaml
	arch/arm/boot/dts/sun8i-h3-orangepi-pc-plus.dt.yaml
	arch/arm/boot/dts/sun8i-h3-orangepi-plus2e.dt.yaml
	arch/arm/boot/dts/sun8i-h3-orangepi-plus.dt.yaml
	arch/arm/boot/dts/sun8i-h3-orangepi-zero-plus2.dt.yaml
	arch/arm/boot/dts/sun8i-h3-rervision-dvk.dt.yaml
	arch/arm/boot/dts/sun8i-h3-zeropi.dt.yaml

