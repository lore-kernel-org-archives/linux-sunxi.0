Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B794D2E1
	for <linux-sunxi@lists.linux.dev>; Thu, 23 Mar 2023 21:00:04 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id eg48so181155edb.13
        for <linux-sunxi@lists.linux.dev>; Thu, 23 Mar 2023 14:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679605203;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SXTHqUkgElHBBeFAVOcvTRAWbCAD12vtyPZ9oCoqefc=;
        b=ERxCmRIR+vNEvKK4N2jZsiPXAmoEkSyBHwlSxj2gX1xZl0+Nyc9W8MwzWoIAJjdIT5
         AsR/U8la1X8EZEHnPH3j2ju6QaSABn2oOYnSLXfBrGVYKIXiQd8giPiro31uSvnuc8Er
         RyKqdjmj2kRtv2UaMs4909iAHNKH9T/XvSszAOI6M04sm60/DGqa6pantf3B/yvtorzt
         I9wC0/gQFE9Y1SDQ8bZqvSwCJs6Ay3vOpXrE8ygcRb2hL2sFnCA8x3LK/JzjSG9BlBAM
         xR9nI2VZz0TxuqJF3BNEVe1KdpwhcD5sn0uN6fPYbOsY0Ssp6qH60grGKc/KSsgrwJgz
         mlfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679605203;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SXTHqUkgElHBBeFAVOcvTRAWbCAD12vtyPZ9oCoqefc=;
        b=DGK/QrkBl+6qdd1X+s41cWy6pjjp36TEAXt0Eip9WkUFqHaME6meGNoM9uM110gJne
         sXrH8yEiM2BHLVObXNA3QtwFhh4snVLPs8NT9cT23eIvFq3R86Yz8EJzsjz/gcXcNfNm
         05o71Hj8acZGjjrgkTakiPvGTHEBNV931EoTd3KQgrT1PiKoSKMMSAgCZ6/fT/5OeAQf
         jvx0JAYQOpnEe7ugYl64dMooZb9mbzf/8BZlMmp0Mk7TXa4Tt5ZQf/ilTxWNUqByWfuy
         wX1FrYNuRtStY45bxiAOseidtunfW2ITfxs/exKUikxYqhKcF2CRQbp7U0K5whuu4rP6
         j63w==
X-Gm-Message-State: AAQBX9f4JfgoukMM50RAei7dUyryLmjXibuYfd5raSzTepB2G+z8740b
	i+n8I582i2U+eG6qRrkp7Do=
X-Google-Smtp-Source: AKy350ba/GjYu/fl0aA5IPWcKXRbEYNMpKWfpBFDMdwHxkgH2tRThr48mohbUrUiNOunFYIRiewn+A==
X-Received: by 2002:a05:6402:183:b0:4fa:dad6:4b63 with SMTP id r3-20020a056402018300b004fadad64b63mr584841edv.37.1679605203037;
        Thu, 23 Mar 2023 14:00:03 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id e23-20020a50d4d7000000b004bf28bfc9absm9570284edj.11.2023.03.23.14.00.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 14:00:02 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@csie.org>,
 Andre Przywara <andre.przywara@arm.com>
Cc: linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, Icenowy Zheng <uwu@icenowy.me>
Subject: Re: [PATCH v6 0/6] ARM: suniv: USB and two new boards support
Date: Thu, 23 Mar 2023 22:00:01 +0100
Message-ID: <1845538.tdWV9SEqCh@jernej-laptop>
In-Reply-To: <20230319212936.26649-1-andre.przywara@arm.com>
References: <20230319212936.26649-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne nedelja, 19. marec 2023 ob 22:29:30 CET je Andre Przywara napisal(a):
> Hi,
> 
> This patchset introduces support for F1C100s' USB, and the SourceParts
> PopStick and Lctech Pi boards.
> 
> These are the remaining (DT) patches, all driver and devicetree binding
> patches for USB related devices, which were part of former versions of
> this series, have now been merged (into v6.3-rc1).
> What's left are just the DT bits: for the SoC .dtsi and LicheePi Nano
> board .dts files. On top go patches that add support for two new boards.
> 
> There were no actual changes to the patches, they are merely resend,
> with the vendor and DT board name binding patches combined for the two
> boards.  All prerequisites are in the tree, so the tooling checks pass.
> 
> Cheers,
> Andre
> 
> Changelog v5 ... v6:
> - Drop all driver and USB DT binding patches (already merged separately)
> - based on v6.3-rc2
> 
> Changelog v4 ... v5:
> - Rebase on top to v6.2-rc1
> 
> Changelog v3 ... v4:
> - Dropped the PHY patches, they go via a different tree and need a
>   different base
> - rebased on top of linux-sunxi/sunxi/for-next (provides H616 USB)
> - musb DT binding: use enum
> - musb cleanup: use musb_hdrc_config config pointer directly
> - musb cleanup: use const where possible
> - drop partitions from Popstick DTS file
> - clarify Popstick has a USB type-A *plug*
> - add tags
> 
> Changelog v2 ... v3:
> - remove redundant "Device Tree Bindings" suffix in DT binding doc title
> - add BSD license to binding doc file (as per checkpatch)
> - fix some commit message title prefixes
> - use proper plural spelling for usb0_id_det-gpios
> - popstick.dts: Reorder otg_sram node reference alphabetically
> - popstick.dts: Add regulator- prefix to 3.3V regulator node name
> - popstick.dts: Fix status, compatible and reg property order
> - popstick.dts: Drop unneeded mmc0 and spi0 aliases
> - add patch to clean up sunxi MUSB driver
> - add Acks and Reviewed-by's
> 
> Changelog v1 ... v2:
> - USB PHY binding: clarify the relation with other phy-sun4i-usb bindings
> - Add Popstick binding and .dts patches
> 
> 
> Andre Przywara (1):
>   ARM: dts: suniv: Add Lctech Pi F1C200s devicetree
> 
> Icenowy Zheng (5):
>   ARM: dts: suniv: add USB-related device nodes
>   ARM: dts: suniv: licheepi-nano: enable USB
>   dt-bindings: vendor-prefixes: add Source Parts and Lctech names
>   dt-binding: arm: sunxi: add two board compatible strings
>   ARM: dts: suniv: add device tree for PopStick v1.1
> 
>  .../devicetree/bindings/arm/sunxi.yaml        | 13 +++
>  .../devicetree/bindings/vendor-prefixes.yaml  |  4 +
>  arch/arm/boot/dts/Makefile                    |  4 +-
>  .../boot/dts/suniv-f1c100s-licheepi-nano.dts  | 16 ++++
>  arch/arm/boot/dts/suniv-f1c100s.dtsi          | 32 ++++++++
>  arch/arm/boot/dts/suniv-f1c200s-lctech-pi.dts | 76 +++++++++++++++++
>  .../boot/dts/suniv-f1c200s-popstick-v1.1.dts  | 81 +++++++++++++++++++
>  7 files changed, 225 insertions(+), 1 deletion(-)
>  create mode 100644 arch/arm/boot/dts/suniv-f1c200s-lctech-pi.dts
>  create mode 100644 arch/arm/boot/dts/suniv-f1c200s-popstick-v1.1.dts

Applied, thanks!

Best regards,
Jernej



