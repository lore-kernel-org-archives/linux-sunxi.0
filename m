Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4632115C9E
	for <linux-sunxi@lists.linux.dev>; Mon,  5 Dec 2022 22:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1670278762;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r/SpJiKMRZzsA13nt/vHo0GTokdNpO5dXKV/2C5VsvI=;
	b=ih586JWuZPX0OoQKho9f4XX9XuxHjI05ii0gItXWIGhvtPBM/uZU5dpOUnS12GSu7Edjcx
	imZ7ZHXkZN6HpeHSfuMQTS5uSlFtJSJkdPFXCtAHcw81soa+dv1IiXcthoo6Zw3qzgaKhK
	INzJbeaje+n3BxiTKDrZfvHIVxxccmM=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-261-s2gl38GxPzCVlMvm-EuZrg-1; Mon, 05 Dec 2022 17:19:20 -0500
X-MC-Unique: s2gl38GxPzCVlMvm-EuZrg-1
Received: by mail-ed1-f70.google.com with SMTP id i2-20020a05640242c200b0046c66305ebaso3716951edc.15
        for <linux-sunxi@lists.linux.dev>; Mon, 05 Dec 2022 14:19:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r/SpJiKMRZzsA13nt/vHo0GTokdNpO5dXKV/2C5VsvI=;
        b=rl3jMAOrZWFWCHTdP4YeAGUI6DSQIe6HRGf5ra+Y2pgMEa4NfkE/3lTwGyB+h+hIoh
         AyAj7Odrq5S0XgIK8Ctcakcd8bwAT3ygENeng9+Ym82eEOUjoHdO4DkLsUjxKb0Zdemv
         jVX1kihr4RS9qPIn+LjCcI41s1pFekcubjor+JcfbmajS2xVC4UajKpoSTnGlWF23CqA
         +O5T1eff+b1/iuRYWFHw2ZYDopyDASAE4K9sfC16Uucyk15swFk6XaNKfKQwiAD5B5hG
         NVd/6hwAjj1UDxsWsfrP03cZDsoeSSQsZbUIz3WlPDFUgIpKNUfWTj7Uj2Is0Wk8etqf
         CH6A==
X-Gm-Message-State: ANoB5plnz5IGJ89qwH95HE3b47adYJelcdwpoc1Iv7iVIunZIESKX6mQ
	f/xAMAp1ugLVoVOQyydK98bOw4ZO4erqzOD7CGscUZFslkxiKRv3gBCSgqu6sf2bAoNQc0exKA1
	MujV4L7N/nAvqktPtHQZuk3c=
X-Received: by 2002:a17:906:402:b0:7a6:fc0f:6fe6 with SMTP id d2-20020a170906040200b007a6fc0f6fe6mr68328925eja.694.1670278759570;
        Mon, 05 Dec 2022 14:19:19 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4/AZjHdk4blrYZTy+WUNqF0ehBqnPpjtR2Q0U1GDaaqR6yRlJDcKawBK9sFngjEIEqwh3gGA==
X-Received: by 2002:a17:906:402:b0:7a6:fc0f:6fe6 with SMTP id d2-20020a170906040200b007a6fc0f6fe6mr68328906eja.694.1670278759272;
        Mon, 05 Dec 2022 14:19:19 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id g26-20020a056402181a00b004618a89d273sm286672edy.36.2022.12.05.14.19.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Dec 2022 14:19:18 -0800 (PST)
Message-ID: <2186e672-8795-8da0-32a3-e6dba00ff504@redhat.com>
Date: Mon, 5 Dec 2022 23:19:17 +0100
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v3 0/9] fix reset line polarity for Goodix touchscreen
 controllers
To: Quentin Schulz <foss+kernel@0leil.net>,
 Samuel Holland <samuel@sholland.org>, Bastien Nocera <hadess@hadess.net>,
 =?UTF-8?Q?Guido_G=c3=bcnther?= <agx@sigxcpu.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Angus Ainslie <angus@akkea.ca>, Ondrej Jirman <megous@megous.com>,
 Icenowy Zheng <icenowy@aosc.io>, Andy Gross <agross@kernel.org>,
 Aleksei Mamlin <mamlinav@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 David Jander <david@protonic.nl>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Peter Geis <pgwipeout@gmail.com>, Heiko Stuebner <heiko@sntech.de>,
 Shawn Guo <shawnguo@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Lukasz Majewski <lukma@denx.de>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Chen-Yu Tsai <wens@csie.org>, Michael Riesch
 <michael.riesch@wolfvision.net>, Rob Herring <robh+dt@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 linux-input@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 linux-rockchip@lists.infradead.org
References: <20221103-upstream-goodix-reset-v3-0-0975809eb183@theobroma-systems.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20221103-upstream-goodix-reset-v3-0-0975809eb183@theobroma-systems.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Quentin,

On 12/5/22 14:40, Quentin Schulz wrote:
> From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
> 
> The Goodix touchscreen controller has a reset line active low. It happens to
> also be used to configure its i2c address at runtime. If the reset line is
> incorrectly asserted, the address will be wrongly configured. This cost me a few
> hours, trying to figure out why the touchscreen wouldn't work.
> 
> The driver is "asserting" this reset GPIO by setting its output to 0, probably
> to reflect the physical state of the line. However, this relies on the fact that
> the Device Tree node setting the reset line polarity to active high, which is
> incorrect since the reset is active low in hardware.
> 
> To fix this inconsistency, the polarity is inverted to not confuse the user
> about the reset line polarity. This obviously requires to fix the DT since most
> users had the "incorrect" value in there, it needs to be inverted.
> Note that the v2 highlighted that I was not the only one that got confused since
> PRT8MM board has the "correct" HW representation for this line in DT (which does
> not match what the driver was expecting).
> 
> This is marked as RFC because I can neither test ACPI support nor boards I don't
> own. Please test on the boards you have that are impacted by this patchset and
> give your Tested-By.

I have tested this on a x86/ACPI device where we actually need to reset
the controller at boot to get it to work and things still work fine there
after this series.

I've also reviewd patches 1-3 and they look good to me to.

So for patches 1-3 you may add my:

Tested-by: Hans de Goede <hdegoede@redhat.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans





> Do we also make this patch series only one patchset since the DT patches depend
> on the driver patch and vice-versa? In which tree would this go?
> 
> Thanks,
> Quentin
> 
> To: Bastien Nocera <hadess@hadess.net>
> To: Hans de Goede <hdegoede@redhat.com>
> To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> To: Rob Herring <robh+dt@kernel.org>
> To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> To: Shawn Guo <shawnguo@kernel.org>
> To: Sascha Hauer <s.hauer@pengutronix.de>
> To: Pengutronix Kernel Team <kernel@pengutronix.de>
> To: Fabio Estevam <festevam@gmail.com>
> To: NXP Linux Team <linux-imx@nxp.com>
> To: Chen-Yu Tsai <wens@csie.org>
> To: Jernej Skrabec <jernej.skrabec@gmail.com>
> To: Samuel Holland <samuel@sholland.org>
> To: Andy Gross <agross@kernel.org>
> To: Bjorn Andersson <andersson@kernel.org>
> To: Konrad Dybcio <konrad.dybcio@somainline.org>
> To: Heiko Stuebner <heiko@sntech.de>
> To: David Jander <david@protonic.nl>
> To: Angus Ainslie <angus@akkea.ca>
> To: Peter Geis <pgwipeout@gmail.com>
> To: Michael Riesch <michael.riesch@wolfvision.net>
> To: Konrad Dybcio <konrad.dybcio@somainline.org>
> To: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> To: Guido Günther <agx@sigxcpu.org>
> To: Jagan Teki <jagan@amarulasolutions.com>
> To: Ondrej Jirman <megous@megous.com>
> To: Icenowy Zheng <icenowy@aosc.io>
> To: Aleksei Mamlin <mamlinav@gmail.com>
> To: Lukasz Majewski <lukma@denx.de>
> To: Frieder Schrempf <frieder.schrempf@kontron.de>
> Cc: linux-input@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-sunxi@lists.linux.dev
> Cc: linux-arm-msm@vger.kernel.org
> Cc: linux-rockchip@lists.infradead.org
> Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
> ---
> Changes in v3:
> - Cc'ing people who contributed to DTS of impacted boards,
> - removed PRT8MM DTS change since it's been reported the polarity is actually
>   correct (goes through an inverter), keeping the appropriate folks in Cc though
>   since it'd be a good idea to check this patch series anyways,
> - added ACPI_GPIO_QUIRK_NO_IO_RESTRICTION to acpi_gpio_mapping quirks to make
>   gpiolib-acpi core respect GPIOD_ASIS flag in gpiod_get,
> - checked schematics of:
>   - pinephone: https://files.pine64.org/doc/PinePhone/PinePhone%20v1.2%20Released%20Schematic.pdf
>   - pinetab: https://files.pine64.org/doc/PineTab/PineTab%20Schematic%20v1.2-20191125.pdf
>   - px30 evb: https://opensource.rock-chips.com/images/d/db/Px30_mini_evb_v10_20180528.pdf
>   - rockpro64: https://files.pine64.org/doc/rockpro64/rockpro64_v21-SCH.pdf
>   - librem5 devkit: https://source.puri.sm/Librem5/dvk-mx8m-bsb/blob/master/dvk-mx8m-bsb.pdf
> 
>   All seems to be directly connected to the GPIO on the SoC side, without an
>   inverter on the line.
> - Link to v2: https://lore.kernel.org/r/20221103-upstream-goodix-reset-v2-0-2c38fb03a300@theobroma-systems.com
> 
> Changes in v2:
> - implemented ACPI support as suggested by Hans,
> - removed Qcom SC7180 Trogdor-based devices changes as they are not using this Goodix driver,
> - added comment on how to read gpiod_request_output and the GPIO DT polarity,
> - Link to v1: https://lore.kernel.org/r/20221103-upstream-goodix-reset-v1-0-87b49ae589f1@theobroma-systems.com
> 
> ---
> Quentin Schulz (9):
>       Input: goodix - add macro for gpio mapping
>       Input: goodix - make gpiod_get honor GPIOD_ASIS
>       Input: goodix - fix reset polarity
>       ARM: dts: imx: fix touchscreen reset GPIO polarity
>       ARM: dts: sunxi: fix touchscreen reset GPIO polarity on Wexler TAB7200 tablet
>       arm64: dts: allwinner: fix touchscreen reset GPIO polarity
>       arm64: dts: librem5: fix touchscreen reset GPIO polarity
>       arm64: dts: qcom: msm8998-fxtec: fix touchscreen reset GPIO polarity
>       arm64: dts: rockchip: fix touchscreen reset GPIO polarity
> 
>  arch/arm/boot/dts/imx6q-kp.dtsi                    |  2 +-
>  arch/arm/boot/dts/imx6ul-kontron-bl-43.dts         |  2 +-
>  arch/arm/boot/dts/sun7i-a20-wexler-tab7200.dts     |  2 +-
>  .../dts/allwinner/sun50i-a64-amarula-relic.dts     |  2 +-
>  .../allwinner/sun50i-a64-oceanic-5205-5inmfd.dts   |  2 +-
>  .../boot/dts/allwinner/sun50i-a64-pinephone.dtsi   |  2 +-
>  .../boot/dts/allwinner/sun50i-a64-pinetab.dts      |  2 +-
>  .../boot/dts/freescale/imx8mq-librem5-devkit.dts   |  2 +-
>  arch/arm64/boot/dts/qcom/msm8998-fxtec-pro1.dts    |  2 +-
>  arch/arm64/boot/dts/rockchip/px30-evb.dts          |  2 +-
>  arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dtsi |  2 +-
>  arch/arm64/boot/dts/rockchip/rk3568-evb1-v10.dts   |  2 +-
>  drivers/input/touchscreen/goodix.c                 | 54 ++++++++++++++++++----
>  13 files changed, 56 insertions(+), 22 deletions(-)
> ---
> base-commit: 76dcd734eca23168cb008912c0f69ff408905235
> change-id: 20221103-upstream-goodix-reset-aa1c65994f57
> 
> Best regards,

