Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1590D5221
	for <linux-sunxi@lists.linux.dev>; Fri, 27 Jan 2023 22:16:04 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id ss4so17319772ejb.11
        for <linux-sunxi@lists.linux.dev>; Fri, 27 Jan 2023 14:16:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oWZmCcBUXcf+wDULbnXIO3z2JjycNCL/zSqNv6nHObI=;
        b=FRA1xrdeH7965NGSPZ8DODdV885dSPsIzAWrDAM7bSwSD/5N+IiStpnKM/QJ9JzDEM
         Eh/Su8eNZCD7EpZTLhtfoY/lkTbjq1zYgEP/wtwpMQ+yewRUlQdcfMysj0L/nrmxqjPk
         fgX4CsuNORrNy5Ul+7TcKG02Buoqlz5CUYzcYXcEssx5dalDX6g3lEfHFwBWlP83BZnU
         hkftbMmB0ksA7dDUmpLcmPCF7zmeRqDd++6vPVvfVwQz3RF2D9BRRllSqijb1GXS4e8w
         vHHzyTKJxG7J6mVTDII4EOlY4OPPhKzO1p7XosrK4b3b1zAnrkB2S8WZ3J2pIKI51W3z
         hPIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oWZmCcBUXcf+wDULbnXIO3z2JjycNCL/zSqNv6nHObI=;
        b=HbM6ByWRwFO+B06heD9C39W4YoH1HeaNuK1UZgP1hWb8xReknrbTuiFH7yEQxZxo3E
         PWSVcZEFZBGzicU5icUu0arHIPXs7YedFRnIRdNfGkFfIyL+HwPjRCK0jMBknp2XBhjb
         BKQgOTOUEvNGWSERk50J7vgn9NMc3I9proRVnWRyVCdEZiKqb0QxFTpxPNg/e++uaZVd
         Vv4glb7okBi/wCSPjN8EKBSf52L7t+gfgiOb78sy28fq1YF+nS5F+h+2vw3PFacoxyZ3
         XDmSpiDyGNgb6zDRlybG1EiKixew5zPuIxhiqr/NIPoUukhGCIsYnemOkKrXUxVHtWU4
         vEYw==
X-Gm-Message-State: AO0yUKURZi+ThTNKad1tqZ6zLpdqCyTxbA2K3TtOoygvYHzLzIPo0eb2
	6xaBoYJ/pPJu1siDZ7thlvyYHwoQndaophbV
X-Google-Smtp-Source: AK7set8oLCp7tLV15V8dKR8TK7uxSbo7jxHx20QA6+KJkrKlAVoE/gir68j8+Rgi/X4d6J8ZokU1Og==
X-Received: by 2002:a17:907:7f94:b0:879:bff:55c with SMTP id qk20-20020a1709077f9400b008790bff055cmr7511455ejc.1.1674857763179;
        Fri, 27 Jan 2023 14:16:03 -0800 (PST)
Received: from jernej-laptop.localnet (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id gn19-20020a1709070d1300b0087862f45a29sm2964335ejc.174.2023.01.27.14.16.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 14:16:02 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, linux-sunxi@lists.linux.dev,
 Samuel Holland <samuel@sholland.org>
Cc: linux-riscv@lists.infradead.org, Heiko Stuebner <heiko@sntech.de>,
 Palmer Dabbelt <palmer@dabbelt.com>, Conor Dooley <conor@kernel.org>,
 Jisheng Zhang <jszhang@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Andre Przywara <andre.przywara@arm.com>, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH v5 00/11] riscv: Allwinner D1/D1s platform support
Date: Fri, 27 Jan 2023 23:16:00 +0100
Message-ID: <4456339.LvFx2qVVIh@jernej-laptop>
In-Reply-To: <20230126045738.47903-1-samuel@sholland.org>
References: <20230126045738.47903-1-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Dne =C4=8Detrtek, 26. januar 2023 ob 05:57:27 CET je Samuel Holland napisal=
(a):
> This series adds the Kconfig/defconfig plumbing and devicetrees for a
> range of Allwinner D1 and D1s-based boards. Many features are already
> enabled, including USB, Ethernet, and WiFi.
>=20
> This version drops all boards/nodes with missing YAML bindings, so at
> least some support can get merged for v6.3.
>=20
> $ make ARCH=3Driscv CROSS_COMPILE=3Driscv64-linux-musl- dtbs_check
>   LINT    Documentation/devicetree/bindings
>   CHKDT   Documentation/devicetree/bindings/processed-schema.json
>   SCHEMA  Documentation/devicetree/bindings/processed-schema.json
>   DTC_CHK arch/riscv/boot/dts/allwinner/sun20i-d1-dongshan-nezha-stu.dtb
>   DTC_CHK
> arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-86-panel-480p.dtb DTC_C=
HK
> arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-86-panel-720p.dtb DTC_C=
HK
> arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-dock.dtb DTC_CHK
> arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv.dtb
>   DTC_CHK arch/riscv/boot/dts/allwinner/sun20i-d1-mangopi-mq-pro.dtb
>   DTC_CHK arch/riscv/boot/dts/allwinner/sun20i-d1-nezha.dtb
>   DTC_CHK arch/riscv/boot/dts/allwinner/sun20i-d1s-mangopi-mq.dtb
> $
>=20
> Note that validation requires dt-schema v2022.12 or newer.
>=20
> I thoroughly tested earlier versions of this series (DMIC, Ethernet,
> LEDs, MMC, PMIC, touch, and USB, where available) on several boards.
> v4/v5 have trivial changes, and I boot-tested them on sun20i-d1-nezha.
>=20
> Changes in v5:
>  - Drop system LDOs because the binding is still not merged
>  - Drop the configuration for LDOA and LDOB
>  - Drop the ClockworkPi and DevTerm DTS, since it needs the system LDOs
>=20
> Changes in v4:
>  - Rebase on v6.2-rc1 + soc2arch-immutable
>  - Drop the now-redundant 'select SIFIVE_PLIC'
>=20
> Changes in v3:
>  - Drop dummy DCXO clock-frequency property
>  - Decrease the PLIC's riscv,ndev property to 175
>  - Fix `make W=3D1 dtbs` warnings (unnecessary #address/#size-cells)
>  - Drop mmc aliases
>  - Change LED_FUNCTION_BACKLIGHT to LED_FUNCTION_STATUS (the backlight
>    regulator is disconnected by default, so this is a standalone LED)
>  - Fix `make W=3D1 dtbs` warnings (missing reg properties)
>  - ARCH_SUNXI depends on MMU && !XIP_KERNEL
>=20
> Changes in v2:
>  - Add MangoPi MQ (non-Pro) board
>  - Split into separate files for sharing with D1s/R528/T113
>  - Use SOC_PERIPHERAL_IRQ macro for interrupts
>  - Rename osc24M to dcxo and move the frequency to the board DTs
>  - Drop analog LDOs due to the missing binding
>  - Correct tcon_top DSI clock reference
>  - Add DMIC, DSI controller, and DPHY (bindings are in linux-next)
>  - Add CPU OPP table
>  - Common regulators moved to MangoPi MQ patch, removed analog LDOs
>  - Removed LRADC (depends on analog LDOs)
>  - Added XR829 host-wake interrupt
>  - Added DMIC sound card to Lichee RV dock and Lichee RV 86 Panel
>  - Removed LRADC (depends on analog LDOs)
>  - Added LED (GPIO shared between onboard LED and backlight regulator)
>  - Sort Kconfig as if we had done s/SOC_/ARCH_/ for future-proofing
>=20
> Samuel Holland (11):
>   MAINTAINERS: Match the sun20i family of Allwinner SoCs
>   dt-bindings: vendor-prefixes: Add Allwinner D1/D1s board vendors
>   dt-bindings: riscv: Add Allwinner D1/D1s board compatibles
>   riscv: dts: allwinner: Add the D1/D1s SoC devicetree
>   riscv: dts: allwinner: Add MangoPi MQ devicetree
>   riscv: dts: allwinner: Add Allwinner D1 Nezha devicetree
>   riscv: dts: allwinner: Add Sipeed Lichee RV devicetrees
>   riscv: dts: allwinner: Add MangoPi MQ Pro devicetree
>   riscv: dts: allwinner: Add Dongshan Nezha STU devicetree
>   riscv: Add the Allwinner SoC family Kconfig option
>   riscv: defconfig: Enable the Allwinner D1 platform and drivers

Applied to sunxi tree. Thanks for your hard work!

Best regards,
Jernej

>=20
>  .../devicetree/bindings/riscv/sunxi.yaml      |  69 ++
>  .../devicetree/bindings/vendor-prefixes.yaml  |   4 +
>  MAINTAINERS                                   |   2 +-
>  arch/riscv/Kconfig.socs                       |   9 +
>  arch/riscv/boot/dts/Makefile                  |   1 +
>  arch/riscv/boot/dts/allwinner/Makefile        |   9 +
>  .../allwinner/sun20i-common-regulators.dtsi   |  28 +
>  .../sun20i-d1-dongshan-nezha-stu.dts          | 117 +++
>  .../sun20i-d1-lichee-rv-86-panel-480p.dts     |  29 +
>  .../sun20i-d1-lichee-rv-86-panel-720p.dts     |  10 +
>  .../sun20i-d1-lichee-rv-86-panel.dtsi         | 119 +++
>  .../allwinner/sun20i-d1-lichee-rv-dock.dts    |  97 ++
>  .../dts/allwinner/sun20i-d1-lichee-rv.dts     |  87 ++
>  .../allwinner/sun20i-d1-mangopi-mq-pro.dts    | 142 +++
>  .../boot/dts/allwinner/sun20i-d1-nezha.dts    | 166 ++++
>  arch/riscv/boot/dts/allwinner/sun20i-d1.dtsi  |  66 ++
>  .../dts/allwinner/sun20i-d1s-mangopi-mq.dts   | 128 +++
>  arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi |  76 ++
>  .../boot/dts/allwinner/sunxi-d1-t113.dtsi     |  15 +
>  .../boot/dts/allwinner/sunxi-d1s-t113.dtsi    | 826 ++++++++++++++++++
>  arch/riscv/configs/defconfig                  |  22 +-
>  21 files changed, 2020 insertions(+), 2 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/riscv/sunxi.yaml
>  create mode 100644 arch/riscv/boot/dts/allwinner/Makefile
>  create mode 100644
> arch/riscv/boot/dts/allwinner/sun20i-common-regulators.dtsi create mode
> 100644 arch/riscv/boot/dts/allwinner/sun20i-d1-dongshan-nezha-stu.dts
> create mode 100644
> arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-86-panel-480p.dts create
> mode 100644
> arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-86-panel-720p.dts create
> mode 100644 arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-86-panel.dt=
si
> create mode 100644
> arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-dock.dts create mode
> 100644 arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv.dts create mode
> 100644 arch/riscv/boot/dts/allwinner/sun20i-d1-mangopi-mq-pro.dts create
> mode 100644 arch/riscv/boot/dts/allwinner/sun20i-d1-nezha.dts create mode
> 100644 arch/riscv/boot/dts/allwinner/sun20i-d1.dtsi
>  create mode 100644 arch/riscv/boot/dts/allwinner/sun20i-d1s-mangopi-mq.d=
ts
>  create mode 100644 arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
>  create mode 100644 arch/riscv/boot/dts/allwinner/sunxi-d1-t113.dtsi
>  create mode 100644 arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi




