Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F404CDDD8
	for <linux-sunxi@lists.linux.dev>; Sun, 24 Sep 2023 19:58:55 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-405361bb9cdso48910175e9.0
        for <linux-sunxi@lists.linux.dev>; Sun, 24 Sep 2023 12:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695585534; x=1696190334; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b4gxioHy8aGHDnCuZrlWWRKNJpX1fQ4gmtJqtKMaNZU=;
        b=a+ZX1lV/h9ywz6OubAH/PsVSNpg2bVR3szhY80igRTJKnHRn1mcqXaJbxy2DuAiPj2
         7aBbBz0ELIslKPXMuSzUwX8PMZieectkqjBAyK/CojJTCqbuHic1bVtJt0ZDEi9Z+eH9
         Iznm5PIySwqmeDQXLOwLVf8YzK3MLb5qoqokjaKfdgr9f7r/qPfPd62KQZtlpKdDoUxN
         nj4Nj2lHBkMda2+iY1lSuTLHT5O3AJVC4tzKw9Z2Mr51g5irzixm77/GHAW9V+m9cBbM
         S1tuIWkUqEo/GKRNj1/pt+dWdzd4s1vfu9Kd9EBAnJh8eCLJSQfIeYdxq52nm1FgQRfo
         Gc7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695585534; x=1696190334;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b4gxioHy8aGHDnCuZrlWWRKNJpX1fQ4gmtJqtKMaNZU=;
        b=Bx3wfxQwcw/SFeSycKHgHFRtF4CfNASCn09Dq8xWv4zbPNUmjwMQcvxhO4rSEj7Xas
         lR7MQSlsf/mGmSm2BKaigN0DXJ2hFddRFcroXhifuiZkAvAg1LeWfcH/kIC0wJ7f2Z8G
         eTOFy+q2W2qRh109EspkjBaSIW8uBihlPJKJLXgcz9ylprrqaHS08jftFE7TDosmqk1l
         CXwqRp3dUJiDuJSLDytjK3wDxEIQzQYzrZ3khOvOBFpUZbK0TC11HG03XenSrqTahwyz
         hh+QQqNxXKFo9Vbc8Q48jnGp9qNJjVgAga2AnQz5cFNbFLRkkKaYz4WzM7qJubS2ajnf
         /Qkg==
X-Gm-Message-State: AOJu0YyMMnnnOlWsqw0D46R/7jAqFdCZoiFd5lkWBaGBj2+cBN0/LRtr
	kNQVYM8hi0JX8KVis6V7QrE=
X-Google-Smtp-Source: AGHT+IFlK2jRwDE9nvD4C1P7Ijq53OoCIw27RVycf2mZqkl8y5ZnNXsf3pn/9aRnLQW1RA3FdTAfUQ==
X-Received: by 2002:adf:feca:0:b0:320:4cf:5b50 with SMTP id q10-20020adffeca000000b0032004cf5b50mr4726656wrs.5.1695585534137;
        Sun, 24 Sep 2023 12:58:54 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-12-148.dynamic.telemach.net. [82.149.12.148])
        by smtp.gmail.com with ESMTPSA id dt18-20020a170906b79200b0099bcf9c2ec6sm5311658ejb.75.2023.09.24.12.58.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Sep 2023 12:58:53 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>,
 Martin Botka <martin.botka@somainline.org>
Cc: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, Andre Przywara <andre.przywara@arm.com>,
 Alan Ma <tech@biqu3d.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Martin Botka <martin@biqu3d.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rogerio Goncalves <rogerlz@gmail.com>,
 Martin Botka <martin.botka@somainline.org>
Subject: Re: [PATCH v6 0/4] Add BigTreeTech CB1 SoM & Boards
Date: Sun, 24 Sep 2023 21:58:50 +0200
Message-ID: <7571855.EvYhyI6sBW@jernej-laptop>
In-Reply-To: <20230912-b4-cb1-v6-0-bb11238f3a9c@somainline.org>
References: <20230912-b4-cb1-v6-0-bb11238f3a9c@somainline.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne torek, 12. september 2023 ob 13:20:46 CEST je Martin Botka napisal(a):
> Hello,
> This series adds a vendor prefix for BigTreeTech and adds BigTreeTech CB1,
> Manta board and BigTreeTech Pi.
> 
> CB1 is just an SoM thats based on AllWinner H616.
> BigTreeTech Manta boards are expander boards for CB1 and BigTreeTech Pi
> is an CB1 in Rpi style with few additional things like IR receiver and fan port
> on GPIO.
> 
> This work started before I was hired by BigTreeTech and thus majority of the
> patches are from SoMainline email and few are from my work email.
> 
> This series depends on commit https://lkml.org/lkml/2023/8/28/1073
> and https://lkml.org/lkml/2023/8/2/801
> 
> Cheers,
> Martin

Applied, thanks!

Best regards,
Jernej

> 
> Signed-off-by: Martin Botka <martin.botka@somainline.org>
> ---
> Changes in v6:
> - Remove SPI node from BTT Pi (To be used via overlays)
> - Rebase on top of 6.6-rc1
> 
> Changes in v5:
> - Removal of wifi node comments that were obvious from properties
> 
> Changes in v4:
> - Extend the range of vcc-dram to 1.5V (Max of 1.35V caused issues with booting up)
> 
> Changes in v3:
> - Add missed semicolons
> - Move model string from dtsi to board dts
> - Add cb1 compatible to manta
> - Remove extra empty lines
> - Add pinctrl for SPI0
> 
> Changes in v2:
> - Fix alphabetical order in vendor prefixes
> - Remove CB1 SoM from bindings (Its not standalone)
> - Fixed whitespace errors
> - Move UART into carrier boards and BTT Pi
> - Remove usb1-vbus regulator
> - Fix ranges and naming of AXP313A rails
> - Add comment why broken-cb in mmc0 is needed
> - Rename sdio_wifi to wifi
> - Add model string to BTT Pi
> - Enable IR receiver for BTT Pi
> - Enable SPI0
> 
> ---
> Martin Botka (4):
>       dt-bindings: vendor-prefixes: Add BigTreeTech
>       dt-bindings: arm: sunxi: Add BigTreeTech boards
>       arm64: dts: allwinner: h616: Add BigTreeTech CB1 SoM & boards support
>       arm64: dts: allwinner: h616: Add BigTreeTech Pi support
> 
>  Documentation/devicetree/bindings/arm/sunxi.yaml   |  11 ++
>  .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
>  arch/arm64/boot/dts/allwinner/Makefile             |   2 +
>  .../sun50i-h616-bigtreetech-cb1-manta.dts          |  35 ++++++
>  .../dts/allwinner/sun50i-h616-bigtreetech-cb1.dtsi | 138 +++++++++++++++++++++
>  .../dts/allwinner/sun50i-h616-bigtreetech-pi.dts   |  63 ++++++++++
>  6 files changed, 251 insertions(+)
> ---
> base-commit: cc19c78b3b3f1af285182dd800a3def22227f9a2
> change-id: 20230814-b4-cb1-4b18801ecf6e
> 
> Best regards,
> 




