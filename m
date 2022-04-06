Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 918EB3226
	for <linux-sunxi@lists.linux.dev>; Wed,  6 Apr 2022 20:33:11 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id bh17so6632395ejb.8
        for <linux-sunxi@lists.linux.dev>; Wed, 06 Apr 2022 13:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0m7PH0Q/gMJwYH81Lv70Om6dm0wczrWyXZh2Bgkw4MU=;
        b=VtVnsMq/7tOn4wxjKQyZphqJwDqkLg3eyg+CmcUaVuhdgqBaJlvulJx4F6QUiolHtt
         J7JF3YdeQa4N7qECZXJ/HWaFMH8jrFROHWaOmUhV49PE8M+UvsFE7qhDFyfKZk1Vqaom
         31gZ5BUHb1bbu8uG1sjc7phhrT0RcaqCvXk/WX3ONZPKCWLokS6dQKJT+Fp4fyXDF91s
         y2BASd4oSEeZsHlNO8Zkv+E/yf/MgmAuqOv6b2qi/4jpvo7/ZohltHDTWO2NjD12CZ11
         gr6+MZEcmgFxCWoMN2HVF85S3FBONoqgY4yrf1rlpVYBTDKjxIPkTHFala66NUsMfHJT
         mFtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0m7PH0Q/gMJwYH81Lv70Om6dm0wczrWyXZh2Bgkw4MU=;
        b=NJYLW3BF+h7E1gSQvLEGdsKhRD7sq/Vq3f7rG/wyiqjuMOMT4BBs0HJRrRyddrqfQ9
         uD2YZEG2iYtd0iIifHKmw/rCOrrxqRnz4wnzmWrxDSFC9TYQgb4lEZ+kcm/fpOVLCdUn
         ifPQIsGrZINYM3saQS5fQ/1U4tAfn+oFRQu2YOO16wL0x0gENaTWdizkUvxRKOs2azBp
         A21i+7UgiF46EfL0mu6YdMqMnIzyFTtbHjh0kcXK5P79Asv1uaEduE9xV1ld6e0lrmFj
         yQ/h0lX8A/ftJ1VRJcHBDv6HpQLGWvBJNYCr2UrJTsigzjsWsiYS/xMUuwPj9Ll85hUd
         klTQ==
X-Gm-Message-State: AOAM533a0N0tcUHjWL/s/7fpnvuGGOARzH9yUOJ2R5Iy7TRDTbLSdFTD
	p6kly0w8gzE20jTCamiVwm8=
X-Google-Smtp-Source: ABdhPJydL4RHESm5WcY2efQtxbg5hGnAp5RmaI/u/zSAPu4ZUNZU6gI6Gep1+rf/SDpIBmOqfHMwgA==
X-Received: by 2002:a17:907:6d8f:b0:6e0:1512:913b with SMTP id sb15-20020a1709076d8f00b006e01512913bmr10320317ejc.491.1649277189683;
        Wed, 06 Apr 2022 13:33:09 -0700 (PDT)
Received: from kista.localnet (cpe-86-58-32-107.static.triera.net. [86.58.32.107])
        by smtp.gmail.com with ESMTPSA id sa26-20020a1709076d1a00b006e6b23c8dafsm5290796ejc.164.2022.04.06.13.33.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Apr 2022 13:33:09 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>, Andre Przywara <andre.przywara@arm.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mesih Kilinc <mesihkilinc@gmail.com>, Icenowy Zheng <icenowy@aosc.io>, Jesse Taube <mr.bossman075@gmail.com>, Giulio Benetti <giulio.benetti@benettiengineering.com>, George Hilliard <thirtythreeforty@gmail.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 00/12] ARM: suniv: dts: update Allwinner F1C100
Date: Wed, 06 Apr 2022 22:33:07 +0200
Message-ID: <2623195.mvXUDI8C0e@kista>
In-Reply-To: <20220317162349.739636-1-andre.przywara@arm.com>
References: <20220317162349.739636-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Dne =C4=8Detrtek, 17. marec 2022 ob 17:23:37 CEST je Andre Przywara napisal=
(a):
> Hi,
>=20
> an update to the F1C100 DT update series. I dropped the defconfig
> patches for now, there is more to them than it seems, and they warrant a
> separate series and discussion. Also I dropped the MMC binding patch
> (v1 07/14), since Ulf already applied that.
> Other than that this tries to clarify the watchdog clock situation in a
> new patch (02/12), and fixes some smaller issues, as pointed out by
> Samuel (many thanks for that!).
>=20
> ----------
>=20
> The Allwinner F1C100 SoC didn't see much love since its initial merge in
> 2018: the originally submitted .dts files were very basic, and didn't
> cover such simple peripherals as MMC and SPI.
> On top of that the watchdog compatible string was wrong, leading to a
> non-functional watchdog and reset functionality.
>=20
> This series aims to fix that, after the series MMC and SPI work, and
> make dtbs_check comes back clean.
> This was tested with mounting a filesystem on /dev/mmcblk0 on a
> LicheePi Nano, also with accessing the SPI flash through /dev/mtdblock
> and mtd_debug. Reboot and watchdog now also work.
>=20
> Mainline U-Boot recently gained F1C100 support, and those DT updates are
> needed there as well to get full MMC and SPI access.
>=20
> The series is structured as follows:
> - Patches 01/12 and 03/12 fix the watchdog, which allows to properly
>   reboot the system.
> - Patches 04-07 fix some shortcomings of the existing DT files, to make
>   them DT binding compliant.
> - Patches 08-09 are Jesse's recent MMC patches, with the comments from
>   the last version addressed [1].
> - Patches 10-12 add SPI support, to enable access to the SPI flash on
>   the LicheePi Nano board.

Applied to sunxi/dt-for-5.19, thanks!

Best regards,
Jernej

>=20
> Cheers,
> Andre
>=20
> Changelog v1 ... v2:
> - drop multi_v5_defconfig patches (v1 13/14 and 14/14)
> - drop MMC bindings patch (v1 07/14): already applied
> - dt-binding: move watchdog compatible string among the others
> - dt-binding: new patch to clarify watchdog clock source
> - dtsi: add missing @0 to cpu node
> - add Acks and R-b's
> - dtsi: fix ordering of SPI nodes (plus typo in commit message)
>=20
> Changelog for the MMC patches [1]:
> - bindings doc: extend commit message
> - .dtsi: extend commit message, re-order mmc0_pins node, add
>   drive-strength
> - .dts: extend commit message, add alias, regulator and disable-wp
>=20
> [1] https://lore.kernel.org/linux-arm-kernel/20220130220325.1983918-1-Mr.=
Bossman075@gmail.com/
> [2] https://lore.kernel.org/linux-usb/20200331170219.267732-1-thirtythree=
forty@gmail.com/
>=20
> Andre Przywara (9):
>   dt-bindings: watchdog: sunxi: fix F1C100s compatible
>   dt-bindings: watchdog: sunxi: clarify clock support
>   ARM: dts: suniv: F1C100: fix watchdog compatible
>   dt-bindings: arm: sunxi: document LicheePi Nano name
>   ARM: dts: suniv: F1C100: fix CPU node
>   ARM: dts: suniv: F1C100: fix timer node
>   dt-bindings: spi: sunxi: document F1C100 controllers
>   ARM: dts: suniv: F1C100: add SPI support
>   ARM: dts: suniv: licheepi-nano: add SPI flash
>=20
> Jesse Taube (3):
>   ARM: dts: suniv: F1C100: add clock and reset macros
>   ARM: dts: suniv: F1C100: add MMC controllers
>   ARM: dts: suniv: licheepi-nano: add microSD card
>=20
>  .../devicetree/bindings/arm/sunxi.yaml        |   5 +
>  .../bindings/spi/allwinner,sun6i-a31-spi.yaml |   1 +
>  .../watchdog/allwinner,sun4i-a10-wdt.yaml     |  24 ++--
>  .../boot/dts/suniv-f1c100s-licheepi-nano.dts  |  31 ++++++
>  arch/arm/boot/dts/suniv-f1c100s.dtsi          | 104 ++++++++++++++++--
>  5 files changed, 140 insertions(+), 25 deletions(-)
>=20
> --=20
> 2.25.1
>=20
>=20


