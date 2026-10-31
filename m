Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793413613;
	b=MQFoVGkYM/oCvWEB9TfaOh3rw15JKEeCalIKaHkd7Sf2RZsb8+ArHyd3WkJ65BPj/HJk
	 QYMNXe0meKbsXW26XJBiJRldPusZBDDXjK1kSZjpcGxDZvWIzqnVvX5oq1SztfGJUDsT7
	 qN2KQctlpXl1oEtUlnPo1mll1j33o7QTXGJmdQ/WnVf+TeARHtxZ+IIN6iNg4uYCdpqlL
	 D4Y+4p/GuppVEZy+JyQdqqtAOZCcMegKT7sIZqLsPYo1NZAwm4qp+u9NqUEWXUtekOpGx
	 Bgj7tc/TdsiJzBdIsj3bvmKHt7cK99Dy5En72FOxRn/DpVpOU/+pF/bmXy2vew6TvDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793413613;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=WSDe6VAckHzkQ8XkTETzpDW5Bx6aUAkrRS4D3VagePM=;
	b=w1zRGzUrhLB3LrLmUlawUC4QuOxS0L5/XrWbSyU+3Mk8MYh2RgaPmc255hTv63BCLlcx
	 waXX3CsHh0zoLJZMokeC4ns2irylxK38GKhoMEaDOdh+R3FMratisbtm/SKxx3Eol4bBH
	 m4CFCLhuanaq+6oF1bhOm174QZS70krF1X1BDbgN3SQx3LbTYYd33DoLPIG7YVdnQOzUO
	 mBkba8DDIkgZvFMWywKgIHmiXQO9/lmYZcfmLN/b0reQEbHmQDmvswJX0SWeHmP2N/KU8
	 AcPkUe3vIGBKiI1n/BYPhXtKvBIdFwkDKgGpy9r79AGXP7S3CurRL0D6mxNjhduA82Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j449s2Ju;
	arc=none smtp.remote-ip=209.85.210.43
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E328606A322
	for <linux-sunxi@lists.linux.dev>; Sat, 31 Oct 2026 02:26:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E328606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j449s2Ju
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-85ac281604dso769730a34.0
        for <linux-sunxi@lists.linux.dev>; Fri, 30 Oct 2026 19:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793413612; x=1794018412; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WSDe6VAckHzkQ8XkTETzpDW5Bx6aUAkrRS4D3VagePM=;
        b=j449s2JuWywBkJmDavPI6wJx6MpTmoOTsAIDlbBDlWNn8HZQwZIXZodMtLa31WWUYh
         6Vj6uI05QnkRNuzall05WumPkU9ieULB5bo3ZFndUF/IfwIC0lJv+W5hjplPdYUvF0w3
         M/QrGn2G/6Es8Y99sWYmuBIGnoBtWKmFoF/93owP2c3gXOGgt7bJQRMpTwVCCwC1Yr3F
         HMUX85Je2CbYpWw5IW+hUB412sR8wuP2xcJxcZrHPHqwYlo22lTxA7kG6yUjwCnqmxU0
         kCHVjmTOcztdYuKhXGh6rAuUWF9JFpmY+Z8v1yWAknr+TBGNLDl+gF38vLSq/uvCGQDx
         RfWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793413612; x=1794018412;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WSDe6VAckHzkQ8XkTETzpDW5Bx6aUAkrRS4D3VagePM=;
        b=cKHw/+O6y+gWA5tQBHFq90e370V2rBoHuZeXKkYvNqRLjmKyx16sh2oQ1ZsTGlpmKg
         U10ji83yZ5gKERg2ugRuqYaQ6v+Yk28wLmTXuI9AnSk++ciBYRS6G5JCvBFD1pwCQ5fj
         V4odpljPQwmE55JHO4dAc0xIAWBbVWpushj4FsejW573WSxrGATacShYRTyg+/zlgVsJ
         DY8f7ft7/hT+SUTxF3fVktAKiR8JkNuW6SoBswE62HY1qF48XHsb1wh6oDHvts+FnohK
         bCgVHKdRXcT8qIu5eiZy/N4nOO7REq7JppOXwtrvRiUy4LctTwTf0QeCdY0rzlRJ/N2V
         5zLg==
X-Forwarded-Encrypted: i=1; AKwUvByrdLvf9UJTN9EO1wmraVAHQslm2sktK4DT9XG6ElrdaDiwgW111InijUn7AJyyFKj6ZuD788J8Z2ldZQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYKdRMqErj2wd6IQB6/U2AbJkMutpMv5fG3IOqcEmVTudmdW465T
	jNtUXXnkeAuU5h6Kf1BNwkkjr7gNFZsvHvjS5t2n6jyYWrJ6By/Vifue
X-Gm-Gg: AYBFou2V4YPLtvckXj6RHTqKs1ndTreM3A1BOVtNcs05EQq7+QqE2ckXKW6XThXaBBP
	/Ud/i6a9gpYi470pjfyQumPjeTP9T0IsTUVb3b/UIoEh7/MTWYYU8LkAYdAb3ZUKBId/7GkhMEt
	RfOjuUFpx47Vt35ESbkJbyKssASfy08/BIZICG2lGokjrpEAKoYWlBQzGpcJ7POmKgsUDm3O7os
	52SoVQWsCexRkAv3uPQSPT1H0hHwbpUvSLvoRKvJyzP+/6zOrVK56UgyPAi3uCJ8xqEEFsbWfmZ
	uY4eX54u7K+X72ONoF5ga6XaBDCRDziQRksms1jpr1oW8vHuWnLZl9yRP8OWXgs00zgRiH4wfHj
	2F3oSumRdxvQND/ETGSY4J0JGi5SwKGn17t8FodkVcE+ILlHwKqnrSo+aR1FRXAh8EfhMfIr1MO
	wcMVkoYqJh+ObEKy2guQT4GuUj2yyANI22AA3lowSHIwIL8gQtGsXkitJbo45zcofXZgM51LJ+U
	2Ju3M1O8HmdB6qRSxPVgNMsWBsHmsthSr0b3AsP2QEG7qdSwDZVMdFmcvDvljfEIBbjwsPkyigS
	DbHebRFkBd/l7pIEbEUS+fBsdD4NHCDbWPZfw7TjzCkZJrI7OQO4AUigBhs84vWSA/q8kp9K+ID
	IutO1ho1lQMZFvuoYyg3iAujBHwM=
X-Received: by 2002:a05:6830:4413:b0:81f:22fd:6ed5 with SMTP id 46e09a7af769-85d364de390mr3092732a34.21.1793413612419;
        Fri, 30 Oct 2026 19:26:52 -0700 (PDT)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85d3545b89asm3810712a34.6.2026.10.30.19.26.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 19:26:51 -0700 (PDT)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Pablo Mazzini <pmazzini@gmail.com>,
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
Subject: [PATCH v2 0/3] arm64: dts: allwinner: add A733/Cubie A7S support
Date: Fri, 30 Oct 2026 22:26:50 -0400
Message-ID: <20261031020640-263f7b05-a7s-dt-v2-0@gmail.com>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

This v2 adds the initial Allwinner A733 SoC description and Radxa Cubie
A7S board support. It incorporates Andre's review of v1: RTC, all main
and R-domain UART/I2C instances, all four MMC controllers and their pin
groups, R-PIO/R-CCU, the GIC maintenance interrupt, ITS description and
the ARMv8.2 EL2 virtual timer interrupt.

The board enables UART0, AXP318W on R-I2C0, and the microSD slot at up to
50 MHz with four data bits and 3.3 V signaling. PMIC input/output, CPU
and pin-bank supplies follow the board schematic. PF6 card detect is
active-high with a pull-down. The firmware-selected PF supply path is
preserved; 1.8 V signaling and dynamic voltage switching are disabled.

The DT patches are separate from three supporting submissions:

* clk: sunxi-ng: a733: preserve system-controller firmware clocks
* pinctrl: sunxi: preserve A733 firmware voltage modes
* dt-bindings: mmc: describe the Allwinner A733 eMMC controller

The clock change keeps firmware-owned timer/mailbox resources available
through Linux's unused-clock cleanup. The pinctrl change follows
Vinicius Pedrosa's recommendation to preserve A733 firmware voltage
modes and give A733-R its own descriptor, without changing A523-R.
The MMC3 binding is distinct because SMHC3's DMA descriptors differ
from SMHC0-2. The node is disabled and has no driver match; the existing
A733/D1 fallback is used only for MMC0-2. ITS is also described disabled.

Base and dependencies
---------------------

The tested base is the official Torvalds commit
d89e1d186ec9271bf78e62771779e9fc03bf0fc3, plus these public inputs:

[1] Junhui Liu, clock helpers, v1 patches 1-4:
https://lore.kernel.org/r/20260906-sunxi-clk-no-p-v1-0-cbde21c9fe69@pigmoral.tech
[2] Junhui Liu, A733 CCU/PRCM, v6 patches 1-8:
https://lore.kernel.org/r/20261009-a733-clk-v6-0-ae8178fce7e8@pigmoral.tech
[3] Jerome Brunet / Andre Przywara, AXP318W, v8 patches 1-5:
https://lore.kernel.org/r/20260910-axp318-regulator-v8-0-e906a61a7f3d@baylibre.com
[4] Pablo Mazzini, pinctrl IRQ-bank numbering, v3 patches 1-3:
https://lore.kernel.org/r/20261025142412.112216-1-pmazzini@gmail.com
[5] Vinicius Pedrosa, A733 UART, v2 patches 2-4:
https://lore.kernel.org/r/cover.1792439398.git.vinicius.eduardo.pedrosa@gmail.com

This is the exact 23-patch test stack, not a claim that every patch in
each series is a direct A7S dependency. The A523-only changes in [1]
and [4] accompany those public series. UART patch 1 concerns the real
DLF path; patch 2 excludes the A733 noncontiguous readback from that
path. PMIC patch 5 and UART patch 2 needed context-only adaptations to
this base; their added/deleted implementation lines were unchanged.
The three separate supporting patches above complete the test stack.
The DT series should follow the clock and binding prerequisites through
their respective trees; the external series are not being resubmitted
here. Patch 1 records the exact base and prerequisite patch IDs.

Changes since v1
----------------

* Retain the acknowledged board-compatible binding.
* Drop the old MMC binding patch already present in the selected base.
* Add RTC and its clock connections; use the board's 26 MHz crystal and
  32768 Hz RTC input, and provide all four main-CCU clock inputs.
* Use arm,psci-0.2 without the redundant arm,psci-1.0 string; add the
  fifth architectural timer interrupt and GIC maintenance PPI 9.
* Add the ITS subwindow and retain dma-noncoherent on GIC/ITS, following
  Andre's A733 reference and the A523 integration precedent.
* Add remaining UARTs, MMC controllers, main/R I2C, R-PIO and R-CCU.
* Move UART0 pins into the DTSI; supply explicit MMC/UART pinmux values.
* Add the PMIC and real board power connections, CPU supplies and card
  detection; sort the DTB Makefile entry and use schema-valid node names.

Validation
----------

The full ARM64 dtbs target and W=2 CHECK_DTBS=y for the final A7S DTB
passed. The separate MMC3 binding example passed dt_binding_check.
The W=1 Image build reused the independent build tree and rebuilt the
affected objects; source reconstruction and patch application also pass.

On one Cubie A7S, two final-candidate RAM boots passed with vendor boot
firmware: eight CPUs, RTC counter advancement, AXP318W/R-I2C0, UART0
including 115200/57600/115200 baud changes, and warm reboot. Each boot
completed a read-only SD ladder of 4 + 16 + 128 MiB at the reported
50 MHz/four-bit/3.3 V mode. The first 4 MiB matched a fresh vendor-kernel
read; the later loops checked successful transfers. The second boot
tested after late unused-regulator shutdown. No clk_ignore_unused or
register-writing helper was used. The existing vendor handoff needed a
RAM-only BL31 reservation at 0x48000000/0x01000000.

Limits: card writes, physical hotplug, UHS, other UART/I2C instances,
MMC1-3 operation, RTC alarms and EL2/ITS/MSI delivery were not tested.
The BLDO2 software selector reports 3.3 V, while the schematic implies
a nominal 2.4 V input. Physical measurements are unavailable, so the
board DT preserves that setting without a voltage constraint or newly
enabled LVDS consumer. Assigning its actual voltage requires checking
the fitted RP220/RP298/RP299 values and measuring UP11 LDO2V5-INPUT and
BLDO2/VCC-LVDS0 to ground.

The six source diffs have no checkpatch errors/checks. The requested
Assisted-by: LLM trailer produces a nonstandard-signature/unrecognized
email diagnostic in raw mail checkpatch; it is retained explicitly.
AI assistance: Codex:gpt-6-astra.

v1:
https://lore.kernel.org/r/20260613-a733-dts-v1-public-ready-v1-0-7787c94681db@gmail.com
Andre's review:
https://lore.kernel.org/r/20260911001805.0a2e033d@ryzen.lan

Enzo Adriano (3):
  dt-bindings: arm: sunxi: document Radxa Cubie A7S
  arm64: dts: allwinner: add A733 SoC description
  arm64: dts: allwinner: add Radxa Cubie A7S board

Supporting submission Message-IDs:
  clock: <20261031020640-263f7b05-a7s-clock@gmail.com>
  pinctrl: <20261031020640-263f7b05-a7s-pinctrl@gmail.com>
  mmc-binding: <20261031020640-263f7b05-a7s-mmc-binding@gmail.com>

-- 
Enzo Adriano
