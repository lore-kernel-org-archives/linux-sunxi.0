Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E8B715AF2
	for <linux-sunxi@lists.linux.dev>; Fri, 29 Sep 2023 17:09:25 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-9a65f9147ccso1895830066b.1
        for <linux-sunxi@lists.linux.dev>; Fri, 29 Sep 2023 10:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696007363; x=1696612163; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ujmc83yMXpLQs62oq9Ku7OlREc5p41OJ1IYLLDbMl+E=;
        b=isuRJFiESZGnR7gWjknlYWFQ01KXGr6oboWMj8vu9/L0CkQsF2Hb7vq3y6UdJ/VkFE
         LL5Gws7/xU68CixjAdg1gZAZqkrr8KDUcdYw1ASequ+5jXtOXN3byKvM1MtV/7ZCsZpc
         gqysP7Prp7Qv4BdtisX0svCVGp84YiPWKge6qOOBZpPtM4IkdzLU4kvwJZUBlChm7PAT
         +FcFp5uKJ2MeGesmfGMC6l/n+BUcwjkYyf9yHMKu9/DnrafvDVrPRETNusfAMFCEfiPn
         OH/jPbPRE470aWT9kJRoZEpTktxZ0ts4NJ9TF9ld1uwCTO1KGrLQdP8N7wyYO0tan/YM
         pnfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696007363; x=1696612163;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ujmc83yMXpLQs62oq9Ku7OlREc5p41OJ1IYLLDbMl+E=;
        b=wwc0JCClYJoXtiy8uFZ/kGgVn1l2XVQ0vD/FCKMARDQuL3QvbFc6C3ozFSF+koOEZg
         qk5J/a6SYLRmvtZ5NvYmZmsZTdMgq1mtni64mkIbOfiXB8jTmgiIE9WCRY+AzLqqwIeN
         suNSmXwGa9m35SuQVzDyWVV6GsRPIAjG0cbL11MFYdc5tm7Kag44TPtDPztX+KZ4rzMu
         mYu95Sv8UJqW/E9OxR9jqQT0eqWclD3vBxq3YpEZnQHSPlZ9faenkBthAtzWDQ8uXI7N
         F2FHKGr4dqc9ngUJ+OkRqMSOgEbv4+kPxGZBXgk1dEq6wVVmYId9ZJ4jw5i+p1txwd7P
         8ADw==
X-Gm-Message-State: AOJu0Yzix8KB7X1QmAo9FE61i734SWNEz5podtshmCwE9q/gn67zag5+
	vP2a8+039z4w5BpZABHJeA170219q57hAHSf
X-Google-Smtp-Source: AGHT+IGqE2ODrXB51bwkoA2pZUpFK02WZje6PSamseE7PI4J+zgN/84WhvtDm7xPzh7WNHrV1ajI/w==
X-Received: by 2002:a17:907:78c4:b0:9ae:37d9:803e with SMTP id kv4-20020a17090778c400b009ae37d9803emr4842386ejc.8.1696007363114;
        Fri, 29 Sep 2023 10:09:23 -0700 (PDT)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id rh27-20020a17090720fb00b0099b6becb107sm12766981ejb.95.2023.09.29.10.09.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 10:09:22 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-sunxi@lists.linux.dev, Chris Morgan <macroalpha82@gmail.com>
Cc: devicetree@vger.kernel.org, mripard@kernel.org, uwu@icenowy.me,
 samuel@sholland.org, wens@csie.org, conor+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
 andre.przywara@arm.com, Chris Morgan <macromorgan@hotmail.com>
Subject: Re: [PATCH V6 0/4] Add Anbernic RG-Nano
Date: Fri, 29 Sep 2023 19:09:21 +0200
Message-ID: <12291999.O9o76ZdvQC@jernej-laptop>
In-Reply-To: <20230929144441.3409-1-macroalpha82@gmail.com>
References: <20230929144441.3409-1-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne petek, 29. september 2023 ob 16:44:37 CEST je Chris Morgan napisal(a):
> From: Chris Morgan <macromorgan@hotmail.com>
> 
> Add support for the Anbernic RG-Nano handheld gaming device
> 
> Changes since V5:
>  - Removed references to "driver" in comments in device tree.
> 
> Changes since V4:
>  - Rebased off main branch as some patches had been pulled into main.
>  - Re-enabled the internal RTC based on advice from maintainers.
>  - Removed "clocks" property from internal RTC based on advice from
>  - maintainers.
>  - Gave external RTC alias of rtc0 and internal RTC alias of rtc1 so
>    priority would be given to the external RTC. The external RTC keeps
>    accurate time, while the internal RTC lost 8 hours for me in a 24
>    hour period.
> 
> Changes since V3:
>  - Added PHY to the OHCI and EHCI nodes. Note that the PHY driver
>    currently forces the PHY to host mode always; a correction to
>    the PHY driver or removal of the phy values from the OHCI and EHCI
>    nodes are necessary to get otg mode working properly.
>  - Disabled SoC RTC in favor of external clock. The SoC RTC is not
>    set up correctly in hardware and runs fast, whereas the external RTC
>    keeps accurate time. This matches the BSP.
>  - Added labels to GPIO pins to aid in readability.
> 
> Changes since V2:
>  - Add display support.
>  - Add USB host support.
>  - Removed CPU frequency and voltage parameters, as CPU regulator may
>    be tied into additional areas that need further testing.
>  - Added regulator names back, as they appear to have been accidentally
>    dropped in v2.
>  - Updated notes to denote all hardware tested and working.
> 
> Changes since V1:
>  - Added additional pwm pin configs to sun8i-v3s.dtsi and removed
>    default config for pwm0 in lieu of defining it for each board.
>  - Noted in patch notes that additional hardware of UART debug port,
>    USB port (in gadget mode) also work, and that USB host mode does
>    not work.
>  - Identified GPIO responsible for enabling external speaker amplifier
>    and defined it, allowing onboard audio to work.
>  - Removed ac_power_supply node.
>  - Set regulator min and max values to the same value as defined in the
>    schematics.
>  - Removed definition for reg_ldo1. This regulator is hardware
>    configured so the value did not affect anything, however the driver
>    must be updated to support the correct value of 3.3v in this case.
>  - Removed usb0_id_det-gpios as I cannot confirm these are correct.
> 
> Chris Morgan (4):
>   arm: dts: sun8i: V3s: Add pinctrl for pwm
>   ARM: dts: sun8i: v3s: add EHCI and OHCI to v3s dts
>   dt-bindings: arm: sunxi: add Anbernic RG-Nano
>   ARM: dts: sunxi: add support for Anbernic RG-Nano
> 
>  .../devicetree/bindings/arm/sunxi.yaml        |   5 +
>  arch/arm/boot/dts/allwinner/Makefile          |   1 +
>  .../allwinner/sun8i-v3s-anbernic-rg-nano.dts  | 276 ++++++++++++++++++
>  arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi    |  35 +++
>  4 files changed, 317 insertions(+)
>  create mode 100644 arch/arm/boot/dts/allwinner/sun8i-v3s-anbernic-rg-nano.dts
> 

Applied, thanks!

Best regards,
Jernej



