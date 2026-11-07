Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794046586;
	b=Zi10vhq7ifctYuSTAuQuan5nadiCWRKUKZ6AYNjtvAdEon1QpLEvAibliEEHOsrGKgzW
	 3qBEk9o8wG2J3OkOdHIZijZHjmtTPsRAwvALAyYyDR0mJxpz7yOw4sMilmTl/ctVBb8uW
	 e1FFXW55MM+2udbgfkgG1qsCFkcbO1SkklDm+bqYXZOqyYzcx5ion7GE9lIDzKURjTWf7
	 cRqWacqa1Pi0UwnEmXOsfZWydT2PS5dbiH8OTdfm0oTi/VhTyUHe6XdMquHf2e7AvRMjg
	 TSmFt706RJTcX/Bqchd9FT1QMowuu+/YVDQkQ8SWT8fEH/QttxYm9bBnxyJMp9qMqng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794046586;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=3JSGrKkfasSjkXz6S7pS4jiVu0FeZWNudCsARugg3Tw=;
	b=KzfMe+gkCNz+lavWr3NVtMKuSQXikDbBzBnbVceI5tpSHggh8ZqvxTv+quyEK/yXf+yo
	 rTPX1uqykTbJcx+BSKuGHwaE4PmZmc4pQpuTHV4aMVJYdunNo473uln/K+a1ZUq0R816Y
	 OZGKkVTjKQ9i4s4jQT2Opw2xSdIfiin/wQe4Y7shWUwFYnEFv9YomPF4AeBtKO6sY65wq
	 LJv081eyRy/hFtNmcX/vS5lUnT0EWfh6ddE3GHI3Z1In7yXxz5gMhjapi8zE0+54g/5X8
	 DZ9UiWF10SQZJ5430xfgKOsOn1m/f7WfMwzM0s/YEEjcyyaZz9sfuSTO5DJrO99mPkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=u2z2hGxt;
	arc=none smtp.remote-ip=209.85.210.46
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFB27606D80E
	for <linux-sunxi@lists.linux.dev>; Sat,  7 Nov 2026 10:16:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFB27606D80E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=u2z2hGxt
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-844a8bf7e25so793881a34.1
        for <linux-sunxi@lists.linux.dev>; Sat, 07 Nov 2026 02:16:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794046584; x=1794651384; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3JSGrKkfasSjkXz6S7pS4jiVu0FeZWNudCsARugg3Tw=;
        b=u2z2hGxtkFYn/8wsJ05lBvG1GLVLoyuq3plOZoLEhlGQermhuVnRahC9Nfc1dnQ62D
         l1kS/GcOwN3F0z+2+MiUH7VFI/nMktC3Jf6vZfJECstvnofapc+qldI3DlT0XjMQ6eh/
         NjpLJeRyQVTVsly9lnQsTsEdKGitl/2xwW0kDaNyL6Qw6ICH0IYFPs+iNVf/90XLypX9
         /MlClAMQUdlsQu6FEqVEeZXfgIJKiBtkdcGJsUG70Z/FkDv6KvzzSHQWPItqHHLrHt5p
         UbWDwbODvVfjQTKndq/3DkillTIAn72dSO9331snttAqEGfSGUsVHT0oaHV2WgwCkxiq
         6+4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794046584; x=1794651384;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3JSGrKkfasSjkXz6S7pS4jiVu0FeZWNudCsARugg3Tw=;
        b=X7Yl5X/3X4aN6Ks4Xu13TZ33Q7EUSJmI0GcWKSjq7MK7P97TAQmLhfA890MLhTl/EU
         /xKdUf3Ez+88aLl23xLQBYHUDHRuomQiyXinZGKzEwUw1ZjVsOIrdaqpleOop0OF3OF/
         oYcDMqW4VNClxLoKNMsSe5QmfaeVgi1J7VP6geb8Xz6wSmCgv3mfGQ6czTVh7OqDy4B6
         zrxgPJUTtPJllb+r2qxWvrlbmCSKUxeJe5u9SRHuZ/F/je8yczkyLYs5mxFU158FTFac
         Fzfnmj+UdNpghyiGmlDeys6hqL0NbgHodcojBQszS7r5xz1rY1l2d5bJgPO3aFdi9n4l
         dIWw==
X-Forwarded-Encrypted: i=1; AKwUvBxH/mGfsPGQjAL4ijV8vHsnGk5nv9LbPS1cpp45XaslSHT7jtSMdPfMm+HxufVvHu7Heuwuskzh2u5eYg==@lists.linux.dev
X-Gm-Message-State: APuU4Z84YsFpwdoef4H1LSvvevcHjT6/o8BNcajXfEmrP203k0UVUZAg
	kXn5CmnoemRRs4p0yB8rN8FkLywqgl82xWyElFwbazcNK3zP5sdXaP0U
X-Gm-Gg: AYBFou2sIeKfS4OYIRvIl+Uha5V+1YsYJXksp93rYsE8IVk1DLTObdTZOX3iI+9g89w
	wMlno+UYwWI/RKSXlKQjvC0isWYaeboUedzWMT/Lk51HhslaAZeFz5SEva1HYYeA4G7qHTF9h89
	n88LSyDWCYMqUK0wMclaB+zmKuv0zJ/Isr5ldjht8ENxMDMMo2sLupQmr95DxeZewM+UHPMZ9w2
	I/mNvEQfwUWozh+hy6fiA1jxTW2g4DfBvoycYkRxhOHJRxO9H4uPkGRc2IEg4SBB7gOiILXM47D
	WxesVWsUAFZHeY+bEBime4c68e7W5a7DdNoKJICMPxubmqC5YP0JdlxuORTSIDUUtIrgnfwF9IV
	TF6I4MVLIu99tDKmPdJOXNLS7UWBIX9gDOhNWIeI+EnVltuTgUWThdX+P5HQnTcStT60s01GbkS
	9hiOKIWumbnmISCoX1uyS7Ha/t9KLdwe01QNKQn4S2BWhdOs/DalUmasgobFz6/+M++fWSgQiKR
	CWN5TPObrwUC70i2iy1NYAwYOTcnlSuQkz16M8Xi7a4XilaDOhMkEhm0dxB1DvHF/JTze4V931i
	PF/GCJjgLYlSWoQyHtbQqBIXZouRIwrRMeav30VadRpclllqv6LQ/Lvp3nD6JKlYIWhhidznd1K
	hBTgPxzaI2/M23BGfnga9LxWJYBYYHVNDfTnDtJXakv7twzke+5H6a+P9U4HAIaG+DhOWHLHWzv
	VTTK9HXthnQ3SlOgzUF74keKB/H6mZPW1BltGns+cPxgcxa9Z+0ivJ
X-Received: by 2002:a05:6830:917:b0:844:4959:e855 with SMTP id 46e09a7af769-85f1cf7a431mr5394630a34.6.1794046584470;
        Sat, 07 Nov 2026 02:16:24 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1dbef224sm3990269a34.12.2026.11.07.02.16.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 02:16:23 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH 00/58] mtd: rawnand: retain chip and controller state
 across removal
Date: Sat, 07 Nov 2026 03:15:57 -0700
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-0-0181ef0cc4c8@gmail.com>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/y2OS24DIRAFrzJiHSS+A8xVIi+66Z6YyDN2ADuRL
 N89OM6ypFK9dxeNa+EmlukuKt9KK+d9gH6bRD7C/sGy0GBhlJm1Vk62K26lywrfO+wkK3coO5M
 cMp1YnsrKvWwsb1oqdMZ49pkVihG8VF7Lz9/Y++HFo/bJuT8X/o3KX9fxor80cYGej+PDMoHXm
 DI6FYJW3qWkrc1OW/IxByCjKQWLNj47CI1lPm/j6TJZRQCr5RBTQAeREgbDHlWOM9HMBhwFil4
 cHo9fEYSVahABAAA=
X-Change-ID: 20261104-submit-rawnand-retained-handle-lifetime-v1-0b4225e5ce0b
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Brian Norris <computersforpeace@gmail.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Arseniy Krasnov <AVKrasnov@sberdevices.ru>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Thomas Gleixner <tglx@kernel.org>, 
 Vitaly Wool <vitalywool@gmail.com>, David Woodhouse <dwmw2@infradead.org>, 
 Russell King <rmk+kernel@arm.linux.org.uk>, 
 David Woodhouse <David.Woodhouse@intel.com>, 
 Mike Rapoport <rppt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Christophe Kerello <christophe.kerello@st.com>, 
 Jason Roberts <jason.e.roberts@intel.com>, 
 Michal Simek <michal.simek@amd.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Mason Yang <masonccyang@mxic.com.tw>, 
 Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>, 
 Stefan Agner <stefan@agner.ch>, Lucas Stach <dev@lynxeye.de>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>, 
 Heiko Stuebner <heiko@sntech.de>, Yifeng Zhao <yifeng.zhao@rock-chips.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Keguang Zhang <keguang.zhang@gmail.com>, Jacky Huang <ychuang3@nuvoton.com>, 
 Shan-Chun Hung <schung@nuvoton.com>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Han Xu <han.xu@nxp.com>, 
 Liang Yang <liang.yang@amlogic.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Kamal Dasu <kamal.dasu@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Vladimir Zapolskiy <vz@mleia.com>, 
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
 Paul Cercueil <paul@crapouillou.net>, 
 Harvey Hunt <harveyhuntnexus@gmail.com>, 
 Maxim Levitsky <maximlevitsky@gmail.com>, Michael Walle <michael@walle.cc>, 
 Srinivas Kandagatla <srini@kernel.org>
Cc: Tze Yee Ng <tze.yee.ng@altera.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-mips@vger.kernel.org, imx@lists.linux.dev, 
 linux-renesas-soc@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.15.2

An MTD handle can outlive controller unbind. Its metadata and NAND locks
must remain valid, including when a writable file closes and calls sync,
while further hardware access must be rejected after disconnection.

This builds on earlier MTD removal-lifetime work. Commit 19bfa9ebebb5
("mtd: use refcount to prevent corruption") added MTD reference counting
[0], but retaining an MTD reference does not by itself retain the
driver-owned allocation containing the master. The 2025 read/unbind
discussion also covered raw NAND [1] and highlighted the need to drain
active operations before releasing resources [2]. Tze Yee Ng's SPI-NOR
series addresses the corresponding SPI-NOR paths [3]. This series adds
shared backing-object ownership and applies it to raw-NAND drivers.

Introduce an opt-in backing-object lifetime for MTD masters and separate
raw-NAND hardware disconnection from final cleanup. Registered MTD nodes,
device references and open handles retain the backing chip; nested
partitions also retain their parent metadata. Removal notifiers can
finish I/O before disconnection drains admitted operations. Hardware
resources are then released without waiting for open files to close.

OTP providers retain their callback context through final NVMEM device
release while keeping their existing physical-device parent. Preparatory
patches clear unregistered OTP provider pointers and add opt-in NVMEM
context references.

Share the chip and controller ownership helpers, serialize Macronix OTP
access through the same operation locks, and convert the raw-NAND
controller drivers. Each driver conversion keeps metadata cleanup
separate from hardware teardown, including partially published probes.
Shared controllers remain allocated until their last retained chip is
released. R852 allocates a new chip for each inserted card, and NDFC
allocates controller state per binding, so old handles cannot refer to
replacement media or a new binding.

The series adds the common lifetime support and converts its driver
users. It is based on NAND next at 30daaf3e7897 and Tze Yee Ng's posted
module-reference ordering fix [4], whose patch ID is a prerequisite.

TLA+ models of retained-handle, controller and OTP ownership, including
their assumptions and coverage limits, are available in [5].

[0] https://lore.kernel.org/r/20230620131905.648089-2-alexander.usyskin@intel.com
[1] https://lore.kernel.org/r/CAND4H7dz94Gsi_tXSQmLNme9uROnouOUwuCX9BW_+RCc2ZFDqA@mail.gmail.com
[2] https://lore.kernel.org/r/mafs0bjs73tbq.fsf@kernel.org
[3] https://lore.kernel.org/r/20261022035352.52129-1-tze.yee.ng@altera.com
[4] https://lore.kernel.org/r/20261022035352.52129-2-tze.yee.ng@altera.com
[5] https://github.com/jameshilliard/linux-h616-nand-tla

Assisted-by: Codex:gpt-6-astra
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
James Hilliard (58):
      mtd: clear OTP provider pointers after unregistering them
      nvmem: retain provider context through final device release
      mtd: add opt-in lifetime ownership for backing objects
      mtd: rawnand: separate hardware disconnection from cleanup
      mtd: rawnand: share retained chip and controller ownership
      mtd: rawnand: macronix: serialize OTP access with NAND operations
      mtd: rawnand: sunxi: retain chip state until the final MTD put
      mtd: rawnand: plat_nand: retain open-handle state on removal
      mtd: rawnand: gpio: retain open-handle state on removal
      mtd: rawnand: stm32_fmc2: retain open-handle state on removal
      mtd: rawnand: denali: retain chips across controller removal
      mtd: rawnand: arasan: retain chips across controller removal
      mtd: rawnand: mxic: retain open-handle state on removal
      mtd: rawnand: intel: retain open-handle state on removal
      mtd: rawnand: tegra: retain open-handle state on removal
      mtd: rawnand: mtk: retain chips across controller removal
      mtd: rawnand: rockchip: retain chips across controller removal
      mtd: rawnand: atmel: retain chips across controller removal
      mtd: rawnand: orion: retain open-handle state on removal
      mtd: rawnand: socrates: retain open-handle state on removal
      mtd: rawnand: fsl_upm: retain open-handle state on removal
      mtd: rawnand: pasemi: retain open-handle state on removal
      mtd: rawnand: ams-delta: retain open-handle state on removal
      mtd: rawnand: xway: retain open-handle state on removal
      mtd: rawnand: hisi504: retain open-handle state on removal
      mtd: rawnand: vf610: retain open-handle state on removal
      mtd: rawnand: technologic: retain open-handle state on removal
      mtd: rawnand: loongson: retain open-handle state on removal
      mtd: rawnand: ma35d1: retain open-handle state on removal
      mtd: rawnand: pl35x: retain open-handle state on removal
      mtd: rawnand: mxc: retain open-handle state on removal
      mtd: rawnand: fsmc: retain open-handle state on removal
      mtd: rawnand: gpmi: retain open-handle state on removal
      mtd: rawnand: omap2: retain open-handle state on removal
      mtd: rawnand: marvell: retain open-handle state on removal
      mtd: rawnand: renesas: retain open-handle state on removal
      mtd: rawnand: meson: retain open-handle state on removal
      mtd: rawnand: cadence: retain open-handle state on removal
      mtd: rawnand: qcom: retain open-handle state on removal
      mtd: rawnand: cafe: retain open-handle state on removal
      mtd: rawnand: brcmnand: retain open-handle state on removal
      mtd: rawnand: au1550nd: retain chip state across removal
      mtd: rawnand: sharpsl: retain chip state across removal
      mtd: rawnand: davinci: retain chip state across removal
      mtd: rawnand: sh_flctl: retain chip state across removal
      mtd: rawnand: lpc32xx_slc: retain chip state across removal
      mtd: rawnand: lpc32xx_mlc: retain chip state across removal
      mtd: rawnand: ndfc: retain chip state across removal
      mtd: rawnand: txx9ndfmc: retain chip state across removal
      mtd: rawnand: ingenic: retain chip state across removal
      mtd: rawnand: mpc5121: retain chip state across removal
      mtd: rawnand: bcm47xxnflash: retain chip state across removal
      mtd: rawnand: fsl_elbc: retain chip state across removal
      mtd: rawnand: fsl_ifc: retain chip state across removal
      mtd: rawnand: r852: retain chip state across removal
      mtd: rawnand: nandsim: retain chip state across removal
      mtd: rawnand: cs553x: retain chip state across removal
      mtd: rawnand: diskonchip: retain chip state across removal

 drivers/mtd/mtdcore.c                              | 214 +++++++++++++++++----
 drivers/mtd/nand/raw/Makefile                      |   1 +
 drivers/mtd/nand/raw/ams-delta.c                   |  29 ++-
 drivers/mtd/nand/raw/arasan-nand-controller.c      |  57 ++++--
 drivers/mtd/nand/raw/atmel/nand-controller.c       |  59 ++++--
 drivers/mtd/nand/raw/au1550nd.c                    |  26 ++-
 drivers/mtd/nand/raw/bcm47xxnflash/main.c          |  23 ++-
 drivers/mtd/nand/raw/brcmnand/brcmnand.c           |  72 +++++--
 drivers/mtd/nand/raw/cadence-nand-controller.c     |  60 ++++--
 drivers/mtd/nand/raw/cafe_nand.c                   |  37 +++-
 drivers/mtd/nand/raw/cs553x_nand.c                 |  46 +++--
 drivers/mtd/nand/raw/davinci_nand.c                |  29 ++-
 drivers/mtd/nand/raw/denali.c                      |  31 ++-
 drivers/mtd/nand/raw/denali_dt.c                   |  21 +-
 drivers/mtd/nand/raw/denali_pci.c                  |  15 +-
 drivers/mtd/nand/raw/diskonchip.c                  |  21 +-
 drivers/mtd/nand/raw/fsl_elbc_nand.c               |  68 ++++---
 drivers/mtd/nand/raw/fsl_ifc_nand.c                |  58 ++++--
 drivers/mtd/nand/raw/fsl_upm.c                     |  23 ++-
 drivers/mtd/nand/raw/fsmc_nand.c                   |  22 ++-
 drivers/mtd/nand/raw/gpio.c                        |  21 +-
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c         |  22 ++-
 drivers/mtd/nand/raw/hisi504_nand.c                |  23 ++-
 drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c    |  49 +++--
 drivers/mtd/nand/raw/intel-nand-controller.c       |  22 ++-
 drivers/mtd/nand/raw/internals.h                   |   2 +
 drivers/mtd/nand/raw/loongson-nand-controller.c    |  23 ++-
 drivers/mtd/nand/raw/lpc32xx_mlc.c                 |  26 ++-
 drivers/mtd/nand/raw/lpc32xx_slc.c                 |  26 ++-
 drivers/mtd/nand/raw/marvell_nand.c                |  54 ++++--
 drivers/mtd/nand/raw/meson_nand.c                  |  55 ++++--
 drivers/mtd/nand/raw/mpc5121_nfc.c                 |  29 ++-
 drivers/mtd/nand/raw/mtk_nand.c                    |  44 ++++-
 drivers/mtd/nand/raw/mxc_nand.c                    |  24 ++-
 drivers/mtd/nand/raw/mxic_nand.c                   |  26 ++-
 drivers/mtd/nand/raw/nand_base.c                   |  78 ++++++--
 drivers/mtd/nand/raw/nand_lifetime.c               | 118 ++++++++++++
 drivers/mtd/nand/raw/nand_macronix.c               |   4 +
 drivers/mtd/nand/raw/nandsim.c                     |  24 ++-
 drivers/mtd/nand/raw/ndfc.c                        |  37 +++-
 .../mtd/nand/raw/nuvoton-ma35d1-nand-controller.c  |  44 ++++-
 drivers/mtd/nand/raw/omap2.c                       |  45 ++++-
 drivers/mtd/nand/raw/orion_nand.c                  |  27 ++-
 drivers/mtd/nand/raw/pasemi_nand.c                 |  25 ++-
 drivers/mtd/nand/raw/pl35x-nand-controller.c       |  46 ++++-
 drivers/mtd/nand/raw/plat_nand.c                   |  24 ++-
 drivers/mtd/nand/raw/qcom_nandc.c                  |  74 ++++---
 drivers/mtd/nand/raw/r852.c                        | 111 +++++++----
 drivers/mtd/nand/raw/r852.h                        |   1 +
 drivers/mtd/nand/raw/renesas-nand-controller.c     |  45 +++--
 drivers/mtd/nand/raw/rockchip-nand-controller.c    |  49 +++--
 drivers/mtd/nand/raw/sh_flctl.c                    |  25 ++-
 drivers/mtd/nand/raw/sharpsl.c                     |  25 ++-
 drivers/mtd/nand/raw/sm_common.c                   |  15 +-
 drivers/mtd/nand/raw/sm_common.h                   |   2 +-
 drivers/mtd/nand/raw/socrates_nand.c               |  22 ++-
 drivers/mtd/nand/raw/stm32_fmc2_nand.c             |  22 ++-
 drivers/mtd/nand/raw/sunxi_nand.c                  |  59 ++++--
 drivers/mtd/nand/raw/technologic-nand-controller.c |  25 ++-
 drivers/mtd/nand/raw/tegra_nand.c                  |  37 +++-
 drivers/mtd/nand/raw/txx9ndfmc.c                   |  42 +++-
 drivers/mtd/nand/raw/vf610_nfc.c                   |  22 ++-
 drivers/mtd/nand/raw/xway_nand.c                   |  27 ++-
 drivers/nvmem/core.c                               |  12 +-
 drivers/nvmem/internals.h                          |   1 +
 include/linux/mtd/mtd.h                            |  16 ++
 include/linux/mtd/rawnand.h                        |  21 +-
 include/linux/nvmem-provider.h                     |  10 +
 68 files changed, 1949 insertions(+), 544 deletions(-)
---
base-commit: 30daaf3e7897b4a8d9b72e5b0c86dd6e2a4d7d85
change-id: 20261104-submit-rawnand-retained-handle-lifetime-v1-0b4225e5ce0b
prerequisite-patch-id: a51b9cb4077105499133c413d58c7ad21d973b38

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

