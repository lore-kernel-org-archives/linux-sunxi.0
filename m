Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795111756;
	b=ZgeNrvsXkGGjFYnotwMVJIkYiWVbZOU37IS+oVWQZxaS8dT0CjEqka32rbM/KCdbbPD2
	 fas7SpdAgjmHpkhb5fHWthRXlmwnmXMosZPws31JiNKK+7DX4R13UoLqxqS+vWFpxPcIB
	 tprrrCFYd6H5fx1ZCT8wdTuzAwXKU8/wuzvV+OoT9kBI0A6T8JO1Gr2GCCt9ebHRb9d+c
	 abTEMcNT78CWr+7wTf/xA/8kJa9ooTmbPCfddbNW2LEO+7yI/VwczW2wBmB2sE1VTuzJP
	 xNwXE3mJxbTDOSQB8bOAgCHTcVEdbVpox++DFZ6BYUaDpGl/S16UtPeeMDc7iUz7N+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795111756;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=eqGeXaKgskH76AWGvxlQS6K/15vXQQ9IhK4LOBED4PI=;
	b=gTlpSPY1qDDIcTA5DAHxnMhFCxL+gho9Cvd6edV/Qs38LvfxE0jepjAuL3nbYbx3WAp/
	 +r18u0v7vFOLg/MvE8AcOcwGcdhzjavVn4tTeiv9DNsJ7RuPgo1mTkl8f2wVSpsrpI9jl
	 QoKyi3Y2Dy0NvrEnJnVvvy5jSIv22FGqNIviHGFfKGMqCt/wOqzIYfgJ2/po6zqTae4VB
	 c4hXqNvLxK8db85D3vLlMQT01q/AOcT9u/X2XJeLq8G3k+ixljwnZTL5A/oF3pUwQkUVa
	 tA74xNBlSyCsSotAqz/2ntzgfr61rnRs7okoN77D2UBifxaeXlHwqJjGRlLdEqQJ4vA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="tC0/RfG7";
	arc=none smtp.remote-ip=209.85.160.42
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D978606A332
	for <linux-sunxi@lists.linux.dev>; Thu, 19 Nov 2026 18:09:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D978606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tC0/RfG7
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-4a76f0cce5fso57906fac.2
        for <linux-sunxi@lists.linux.dev>; Thu, 19 Nov 2026 10:09:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795111755; x=1795716555; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eqGeXaKgskH76AWGvxlQS6K/15vXQQ9IhK4LOBED4PI=;
        b=tC0/RfG7t3UiukUZsZYmtEVNecPBYzeAF8CImHuFRyWzlz8Pyhwv058RLwANh5EKZg
         HLMop+fzLVnYpUDvoC+XUk9siegp5D+wFmVd9D9mbgrVUX8ZKxir01auAUU+dp5HRfrU
         F/dELRNqe4Ja0so0PPltpWlfpcwAkOGO8Md5acSRjYtCLIxnWfcCMU/iw+uZt0Yf1GLR
         cE/l6NORFkar/JnjZXX/MHTcRz9pUXSgL9F9Mp7TgMW5ZTLjif91Y+ItbFWrIqwXluFB
         aVPcbUJAOZNPEm+KffZG0SX6K6m79YjixxDenC7Fkz/sJrymFwUKBzjbzh1WDVj1Oh+S
         XfZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795111755; x=1795716555;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eqGeXaKgskH76AWGvxlQS6K/15vXQQ9IhK4LOBED4PI=;
        b=lqfIzdWlOiJst7micHrh9Y5txAd/0iIoReQfT6IXjZJqs8hzVfEyB7xWOSw/zqPTDL
         c9eLzNi1e9kBAk1dDTlESMb9COn5ql6FPAVBtmLuyB7DrWIOVfMI3+CmzvPT/nyKQDNr
         O7en1/5cLcNu4tIxcxtCspe9Ro8Hw6lSjgKet0QvlpHELpm+uJKcxpxyULgAMga0oRrl
         TV8jrsRau3WrvqIGL8WOkoKSUuUkfCaCATCTSfeHs7gCm+9py19791fFBeZoNUwwFWkX
         jAtRAP/sVpVZYV/RB/tAWQsuZOXJ4TO2teMLCGtvNk9lnKooDksMChNrffYQVvG1YK0e
         qECg==
X-Forwarded-Encrypted: i=1; AL+hErGyUQFNrO1SusD9yAFd3NYRVYePUGWUsKKXuFGgPvb+0EauXq3nxM83YqtPJjujHI6eQWdMDe7ooMhWLA==@lists.linux.dev
X-Gm-Message-State: APuU4Z/P4meCfy774zrtWUotMY3353qBlgKvW62Kaj7AUu+lcKdFQhXW
	j+MVDPyx2V8NGWD5Q25iKqmbK1DawLimVTIXiv3n0kWsk9uAEw5LRSch
X-Gm-Gg: AYBFou3veWV7OXxwkDDIWrW8O9PCCooFXhFgvPCBIJ3SIRstUbt4s9wKs/AJa1eGyEH
	ilo5dgKDOFP+h+FLSeMv9BjzRCsx1Uu0Uw6WtEBOrXvNo8uDkWSbQOopLF6dgCRITnsrgzk95jc
	wrupGcKq1jMywMiKu8vjBTpBsC9AXhy0dK98qCNCKw/rW1AWdrryfrlP/9WewIdmitp96PeN/ZZ
	hccYvGvbIaZ262S+77eZYqa9Pw8qmvw+jAeqm6blFP26xBR4a50oBv4Wo5FC/mmBHRiwBYMe0Mv
	mq75eEdeCkj7e0t8VfzHM2USfwx7jNj+VgSd0v7Cd396MP0nmyvVlEFUH/qVfXEZ0VtMhk/m5iA
	sbtgMafedQtoVq8ztDBLB648Yb9c2mbf1RUkaN4xCTXXBuyau85lSr1LayWQuCOvi7wX1hUX+t2
	Xy9o4tZgbEZwxZxT5hYEa59sG9EUbWxrW8AiJdshs/ysUrRy0RuG+k6Mb9BtWH8SBgwTlsQyaGM
	8dk3TlJKJmAenVUX8xJwa0jArhH9R1vitVr+kNOgHhrBCVOC3qbNaGYMmb3JJCsplQhdZlVCEI+
	iu18LLpsy9qZQFInviIMV/S0MtKs/vNfDpif8BMzmPnsM2tCiiyLcVuujAa4L0rRlSajlFnMevO
	2
X-Received: by 2002:a05:6870:51ce:b0:47b:cd37:f931 with SMTP id 586e51a60fabf-4bc81aa2294mr384102fac.13.1795111754944;
        Thu, 19 Nov 2026 10:09:14 -0800 (PST)
Received: from AMD.home.local (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4bc60491337sm446604fac.12.2026.11.19.10.09.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 10:09:14 -0800 (PST)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: andre.przywara@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org
Cc: Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Pablo Mazzini <pmazzini@gmail.com>,
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>,
	Alexander Sverdlin <alex@sverdlin.org>,
	Jun Yan <jerrysteve1101@gmail.com>,
	Lukas Schmid <lukas.schmid@netcube.li>
Subject: [PATCH v4 0/3] arm64: dts: allwinner: add A733/Cubie A7S support
Date: Thu, 19 Nov 2026 13:09:12 -0500
Message-ID: <cover.1795034153.git.enzo.adriano.code@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds the initial Allwinner A733 and Radxa Cubie A7S device
trees for UART0, the AXP318W PMIC and 3.3 V microSD.

Base: sunxi/for-next (03b3355ed7a39b4416f0d0a39061479b1aa13196).
Previous posting (v3):
https://lore.kernel.org/r/cover.1794227241.git.enzo.adriano.code@gmail.com

Changes in v4:
- 1/3: Carry Alexander Sverdlin's Reviewed-by.
- 2/3: Add a one-cluster CPU map and A55/A76 PMUs on PPI 7, using
  GIC ppi-partitions. Change #interrupt-cells from 3 to 4 and add a
  fourth cell to every GIC interrupt specifier. Drop Vinicius Pedrosa's
  Tested-by because of the interrupt encoding change.
- 3/3: Sort root nodes and put status last. Move boot history below ---.

Runtime dependencies in application order:
[1] AXP318W PMIC v8
https://lore.kernel.org/r/20260910-axp318-regulator-v8-0-e906a61a7f3d@baylibre.com
[2] Pinctrl IRQ-bank v3
https://lore.kernel.org/r/20261025142412.112216-1-pmazzini@gmail.com
[3] A733 8250_dw v2, patches 1-4
https://lore.kernel.org/r/cover.1792439398.git.vinicius.eduardo.pedrosa@gmail.com
[4] Firmware-clock v2 for vendor-firmware warm reboot
https://lore.kernel.org/r/20261112-a733-fwclk-v2@gmail.com
[5] Pinctrl voltage-mode v3
https://lore.kernel.org/r/20261109-a733-pinctrl-v3@gmail.com

A7S DTB/schema checks need [1] 3/5, [2] 2/3 and [3] 3/4 before v4.

Validation: clean git am, arm64 defconfig Image, arm/sunxi.yaml binding
check and warning-free A7S W=2 CHECK_DTBS=y. The compiled DTB has one
eight-core cluster and two disjoint PMU partitions.

A November 18 RAM boot on Cubie A7S with vendor firmware used the base
and runtime dependencies above. Two context-only adaptations were needed:
PMIC v8 regulator allocation context and pinctrl voltage-mode v3 IRQ-bank
map context. CPUs 0-7 came online in one cluster. The A55 PMU covered
CPUs 0-5 and the A76 PMU CPUs 6-7; cycles and instructions counted and
PPI 7 overflow samples were observed on each CPU. The timer, console,
AXP318W probe and MMC0 read-only transfers worked; warm reboot returned
to vendor Linux unaided.

Untested: PMIC/NMI interrupt delivery, card writes, hotplug, suspend,
power-off, CPU capacity, 1.8 V switching, other UART/I2C and storage
instances, RTC alarms, EL2/ITS/MSI, and physical BLDO2 voltage.

Enzo Adriano (3):
  dt-bindings: arm: sunxi: document Radxa Cubie A7S
  arm64: dts: allwinner: add A733 SoC description
  arm64: dts: allwinner: add Radxa Cubie A7S board

 .../devicetree/bindings/arm/sunxi.yaml        |   5 +
 arch/arm64/boot/dts/allwinner/Makefile        |   1 +
 .../dts/allwinner/sun60i-a733-cubie-a7s.dts   | 287 ++++++++
 .../arm64/boot/dts/allwinner/sun60i-a733.dtsi | 657 ++++++++++++++++++
 4 files changed, 950 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7s.dts
 create mode 100644 arch/arm64/boot/dts/allwinner/sun60i-a733.dtsi

base-commit: 03b3355ed7a39b4416f0d0a39061479b1aa13196
