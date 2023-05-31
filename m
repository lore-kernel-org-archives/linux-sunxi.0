Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FA701640F
	for <linux-sunxi@lists.linux.dev>; Wed, 31 May 2023 21:20:14 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-9741caaf9d4so1612366b.0
        for <linux-sunxi@lists.linux.dev>; Wed, 31 May 2023 14:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685568010; x=1688160010;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DTefpjTnRZwzVlyTq29ijDBrPiJ0xnSJwo8bcfjK+r0=;
        b=ZFTcDDCB+AImDsN60FrC9VBlEtsMZFDvVnEE5x4/2yTGBPIiWndvUFYAl6tHOi6WIy
         YieUjYix44EqaB5hUp4ldMGNazarRLkck+YAQf8DViExoqjwYF4ZS+aReuMLn0SY2GtR
         hdPVtp1IJOwkQ59+zx6g6KN4PzSVy8+4Nb85rJbAUfEtpk1ag+Q1KfFHcwieqYph9BJV
         NhiflZjBIF9AfS/BsyhTCmjOs9ir4NwE75gyg28zu921bkgsb+KVnAazMybI11s8L+sp
         2DFGmwd1oXlYdiWZUrxe7i1Lo3XdUiyQ5Fcaf61KhqxahCPiQKk/Q8655i9AHLyOSvV3
         Qrvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685568010; x=1688160010;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DTefpjTnRZwzVlyTq29ijDBrPiJ0xnSJwo8bcfjK+r0=;
        b=MjUsQqHIq81YGqtSFJWd/sDyAYQYaxUBD6gcMDpCR9u9/t8/YHBSQeIXsU0r86ggmv
         WTQDanApqj4W7t31JZCe9Rb31WS14nRXuUXvsHK19QDdfTHJvDOMa4DiiM7+3T2HBgkG
         oL/u8STChtGw4I6Jt6PKywxGsCjPGVybnHgmxb/0K+mkW4f25C1bm4vlo5hWukZC3/9i
         k15FsZY4yAom991Xdt+6h+iMONm01EP7myoK+/kVfcFDoQJqDswQNKradQSrda6oXiGS
         tQzaLgbLHuacn6oZfuOtmiOlmCfLkGwaI3BTfXuPq3IqCZgqGTYEtTPdN0vTUYoHSxhF
         iKqg==
X-Gm-Message-State: AC+VfDyS1HWTVnHraDaQ3LN/dDaVdWtteIKBWki9dLARizJbQQKYiaPj
	NZhAiaVa3taqSihsO2Dwkik=
X-Google-Smtp-Source: ACHHUZ5mr/4sMrKF5T8XZ8TsweV7bGMUcQcBrBBBVN+jEXwVJ5fiLfFcaaqr4tN2QnOP13QcHGC7qA==
X-Received: by 2002:a17:907:6d23:b0:973:d9ad:273f with SMTP id sa35-20020a1709076d2300b00973d9ad273fmr6055603ejc.46.1685568010061;
        Wed, 31 May 2023 14:20:10 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id b8-20020a1709064d4800b00965f31ff894sm9472629ejv.137.2023.05.31.14.20.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 14:20:09 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Conor Dooley <conor+dt@kernel.org>,
 andy.shevchenko@gmail.com, Jonathan McDowell <noodles@earth.li>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3 0/5] Minor device-tree additions for C.H.I.P
Date: Wed, 31 May 2023 23:20:06 +0200
Message-ID: <4832198.31r3eYUQgx@jernej-laptop>
In-Reply-To: <cover.1684258957.git.noodles@earth.li>
References:
 <cover.1683719613.git.noodles@earth.li>
 <cover.1684258957.git.noodles@earth.li>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne torek, 16. maj 2023 ob 19:46:55 CEST je Jonathan McDowell napisal(a):
> This small patch series adds some improvements for the C.H.I.P DTS,
> enabling bluetooth, exporting the PMIC temperature details via iio-hwmon
> and finally adding the appropriate base pinmux info for an external MMC
> card. As a pre-requisite for the Bluetooth it also adds support to the
> AXP209 driver for GPIO3, which is the Bluetooth device wakeup line.
> 
> v3:
> - Add Reviewed-By/Acked-Bys
> - Drop redundant else
> - Switch to GENMASK/decimal values for GPIO3 function defs
> v2:
> - Fix missing ; on bluetooth stanza in DTS
> - Add device/host wake GPIOs for Bluetooth device
> - Add omit-if-no-ref on the port E pinmux stanza
> - Rename axp20x_temp to pmic-temp
> - Add AXP209 GPIO3 support
> 
> Jonathan McDowell (5):
>   dt-bindings: gpio: Add GPIO3 for AXP209 GPIO binding schema
>   pinctrl: axp209: Add support for GPIO3 on the AXP209
>   ARM: dts: sun5i: chip: Enable bluetooth
>   ARM: dts: sun5i: Add port E pinmux settings for mmc2
>   ARM: dts: axp209: Add iio-hwmon node for internal temperature

Patches 3-5 applied to sunxi tree. Thanks!

Best regards,
Jernej

> 
>  .../bindings/gpio/x-powers,axp209-gpio.yaml   |  1 +
>  arch/arm/boot/dts/axp209.dtsi                 |  7 ++++
>  arch/arm/boot/dts/sun5i-r8-chip.dts           |  6 +++
>  arch/arm/boot/dts/sun5i.dtsi                  |  9 ++++
>  drivers/pinctrl/pinctrl-axp209.c              | 42 +++++++++++++++++++
>  5 files changed, 65 insertions(+)
> 
> 




