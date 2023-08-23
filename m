Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 558E3156E6
	for <linux-sunxi@lists.linux.dev>; Wed, 23 Aug 2023 19:36:56 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2b9f0b7af65so91678951fa.1
        for <linux-sunxi@lists.linux.dev>; Wed, 23 Aug 2023 12:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692819414; x=1693424214;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7XseqOE+hrW2j1mbiFEeFoJsIauOkD7dow7NanYEiT8=;
        b=Kft/HoItEBfX/gA5eGlgeAkK7GnSL6fuOyiIN1iL/tsUG4Q/3M1VEkLwg4UTHuglGE
         x3wnrm+/yrsVs0RuFq5y8SsyTt9CduXxGmM2kkq41TC++M2w0mtXmUZ0RlhRLMLdDwyF
         OcAnRIMTRex0rHE5IKq35VzvjzOD2boCrTenHGv5WO2E1fMZNJcvVIWyQb/H+JCRUN3C
         jei7nMhB/7+t+5Sn9vvne0uztfOfdHqaqIXFyVV2SVwBNDkigi5qhWZCCTMO1ExetObK
         KYYTf0w7NITLBszeBLnbsaLwJ8FlxsYUA+bmyMY2UySxaTBBQjMxpercv/15ucIugMUR
         Ti3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692819414; x=1693424214;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7XseqOE+hrW2j1mbiFEeFoJsIauOkD7dow7NanYEiT8=;
        b=fgurU0bPK6KB3trJdvQ2oM3kFME1nH16pNtHVsDTHng0VGsdcw+C1PMiYv3knqTRpe
         NEvKS39l6rU2L4NyUNZhyqd3FIra/3gOstgTHdmPr7vao3yyNmiVqJecVUIZ+2/WrL1G
         eHiT/9+upHI9p/GVZ828HuqualT6rZVT/wMjvCkBVDdzYskIdcKhMVKJbHQxKrD06z4v
         EW1kcrDnUQCezWbSca1CiSYh3RdlvjM/xAa3rziJNboUoInuUIK6IjFxUFQySMTrI1CV
         0KYpHx3Y1At2okD+4HUBl3ZwHhKH/cHeUPr3KGKabutPQcQgimRFsR6Qs8SfHy1FCDQl
         /f3w==
X-Gm-Message-State: AOJu0Yxy8BxW+lDKUNk6XjTC/LQ2umiaL7gXXb8Zf+adJBwzQqaaa1Bl
	zDhH/wU7Gbiciw6rg8GYFyw=
X-Google-Smtp-Source: AGHT+IEag43atiZQRGzFMqHQ4Knh0z6BzGKYlRrJOybchcj/oRn0svYRxmL4xbMLG9fqUNS87csexQ==
X-Received: by 2002:a2e:a201:0:b0:2b5:9d78:213e with SMTP id h1-20020a2ea201000000b002b59d78213emr9825308ljm.22.1692819413752;
        Wed, 23 Aug 2023 12:36:53 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-12-148.dynamic.telemach.net. [82.149.12.148])
        by smtp.gmail.com with ESMTPSA id y6-20020a170906070600b0099cadcf13cesm10074851ejb.66.2023.08.23.12.36.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Aug 2023 12:36:53 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, Kees Cook <keescook@chromium.org>,
 Tony Luck <tony.luck@intel.com>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
 Jarrah Gosbell <kernel@undef.tools>,
 Arnaud Ferraris <arnaud.ferraris@collabora.com>, Pavel Machek <pavel@ucw.cz>,
 Andrey Skvortsov <andrej.skvortzov@gmail.com>
Cc: Andrey Skvortsov <andrej.skvortzov@gmail.com>
Subject:
 Re: [PATCH v2] arm64: dts: pinephone: Add pstore support for PinePhone A64
Date: Wed, 23 Aug 2023 21:36:51 +0200
Message-ID: <2235209.iZASKD2KPV@jernej-laptop>
In-Reply-To: <20230822092358.309835-1-andrej.skvortzov@gmail.com>
References:
 <20230821160817.GA2227@bug>
 <20230822092358.309835-1-andrej.skvortzov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Andrey,

send new revision as standalone e-mail, not as reply to old discussion.

Dne torek, 22. avgust 2023 ob 11:23:58 CEST je Andrey Skvortsov napisal(a):
> This patch reserves some memory in the DTS and sets up a
> pstore device tree node to enable pstore support.
> 
> In general any DRAM address, that isn't overwritten during a boot is
> suitable for pstore.
> 
> Range from 0x40000000 - 0x50000000 is heavily used by u-boot for
> internal use and to load kernel, fdt, fdto, scripts, pxefile and ramdisk
> later in the boot process. Ramdisk start address is 0x4FF00000,
> initramfs for kernel with some hacking features and debug info enabled
> can take more than 100Mb and final address will be around 0x58000000.
> Address 0x61000000 will most likely not overlap with that.

There are other bootloaders as U-Boot, especially on PinePhone. Are you sure 
it works there too? What about U-Boot configuration, will those addresses still 
be used if configuration is changed?

Best regards,
Jernej

> 
> Signed-off-by: Andrey Skvortsov <andrej.skvortzov@gmail.com>
> ---
> 
> Changes in v2:
>  - Update commit description with information about why this base address is
> used.
> 
>  .../boot/dts/allwinner/sun50i-a64-pinephone.dtsi | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi
> b/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi index
> 87847116ab6d..84f9410b0b70 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi
> @@ -19,6 +19,22 @@ aliases {
>  		serial0 = &uart0;
>  	};
> 
> +	reserved-memory {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges;
> +
> +		pstore_mem: ramoops@61000000 {
> +			compatible = "ramoops";
> +			reg = <0x61000000 0x100000>;
> +			record-size = <0x20000>;
> +			console-size = <0x20000>;
> +			ftrace-size = <0x20000>;
> +			pmsg-size = <0x20000>;
> +			ecc-size = <16>;
> +		};
> +	};
> +
>  	backlight: backlight {
>  		compatible = "pwm-backlight";
>  		pwms = <&r_pwm 0 50000 PWM_POLARITY_INVERTED>;




