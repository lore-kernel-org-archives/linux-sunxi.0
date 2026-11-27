Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=119.15.109.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795762434;
	b=0IVnusHCrg8pPbka80PfzF6fnHMXfwMxN5ZKc7wU+cRyXFKRJKuJpwKTjlRgF0VjU4m9
	 jH/XDqxhcHhehmS96xkLPv2dfMhghPY6EZjKw/rqUDzS+c/6AaAomCegG4hiwnO4CHbNX
	 jnyNld/jsglnCNV6wWfktvjZ4rvAUdWFR+Xhp8WK/WgwZX91Q3qYWXhJw/CrImTlogeZq
	 f0sYJ7w2Sid2ptm2q+JqeGHZTr9KOh189y+Zlw3FQ3Q8Y34QnCysFgq50GfNqKuyD1s+b
	 SIMauWpsRbGrJr8l4xWxZT+MfymOyt3PbZFyYM8FYu3qZYh1Gk8Lz9P+HRVZhMH0o7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795762434;
	h=DMARC-Filter:Received:DKIM-Signature:X-GPT-Reason:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=CeHxjipdZ2d0rn+6lilOW4bTUv1soutBDy7ycEHy7Oc=;
	b=3XNvYuJwsBFXiBt83ZrU3OeOxO9PU/DroE8PPL9tw8kZPSOaoHRNbqbeK8RI/dIEjQhs
	 uypwh7qN9zrL7yx7uYhwublDiYbq7n5ec8qarznGVoe7d0kShWG1HvL1UlK0Xu9x5cilF
	 ZQd2MHotZW1Zkt7of7j37OgsE4CKt8ZaSKSmKROVx/3ZeoZXJDcDEsm2QNObB0UfaBJ8l
	 NOUCTDnB7W+fnBcXcXCZET9xnnAIPIm+xcTSv4WQTN2H0vVJH2ZzFRL/1YoNJr2dyqx5g
	 E/g7zqOfLt3RyAjNoQgKVWj3TvU34P/Rhd+acsRLanqaiOh4Cf4PAFZtpyvHKt81oCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=d-silva.org;
	spf=pass smtp.mailfrom=d-silva.org;
	dkim=pass header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=lpflKu7Y;
	arc=none smtp.remote-ip=119.15.109.137
Received: from www.nmnhosting.com (watt.d-silva.org [119.15.109.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 407AC606A329
	for <linux-sunxi@lists.linux.dev>; Fri, 27 Nov 2026 06:53:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 407AC606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=d-silva.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=d-silva.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=lpflKu7Y
Received: from Hawking.lan (hawking.lan [10.0.1.4])
	by www.nmnhosting.com (Postfix) with ESMTP id 831EB4C952;
	Fri, 27 Nov 2026 17:53:43 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=d-silva.org; s=2025a;
	t=1795762423;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=CeHxjipdZ2d0rn+6lilOW4bTUv1soutBDy7ycEHy7Oc=;
	b=lpflKu7YWOcwgnwRTA4NJuOzQEK07a1daCx/LmjMlulNVlVBJ0nzdAWOk+GbA8JZaRNwkm
	jwrZjBUROl+2mP/RWHTXiNzjEocg8dALM88b0eIMW5zsKWRGlaLwsOh/IESU0aqPgpX0c8
	aljPWW5m0gu22blGkcxUz+VcKYjMNITJf7X6zrxY7wmNkVvjpi5Mn4S9fHywImOskYOKRU
	9fsHzUf6UeFzHZW9G3dfxvGnR16kXCFOnSzUBV3hHDXTf7OG8WLpmoUQuqxKtweNbvZNyh
	gAtjFsYqZgakHWtEwPitFs4IH/3XqjtXof+QPonx2TsrB31ii74m891WBr4Lxg==
X-GPT-Reason: legitimate; the email is a technical software patch
	for the Linux kernel as evidenced by the subject line, the use
	of the kernel.org URL domain, and the highly specific technical
	content regarding "arm64: dts: allwinner" support; the sender "alastair@d-silva.org" matches
	the "alastair@d-silva.org" personal mailbox listed in the environment
	context; there are no phishing indicators, urgency, or marketing
	elements, and the content perfectly aligns with a technical contribution
	workflow.
From: Alastair D'Silva <alastair@d-silva.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Maxime Ripard <mripard@kernel.org>,
	Enzo Adriano <enzo.adriano.code@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Alastair D'Silva <alastair@d-silva.org>
Subject: [PATCH v2 0/2] arm64: dts: allwinner: Add Xunlong OrangePi 4 Pro support
Date: Fri, 27 Nov 2026 17:53:41 +1100
Message-ID: <20261127065343.1449675-1-alastair@d-silva.org>
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

Add initial devicetree support for the Xunlong OrangePi 4 Pro board
(Allwinner A733 / sun60i-a733).

This series enables the UART0 serial console, SD card (MMC0), and the
AXP318W PMIC on R-I2C0. Audio, WiFi, USB, and Ethernet are omitted for
follow-on series.

This series is rebased on linux-next (next-20261125) and builds on the
following unmerged prerequisite series:
- [PATCH v2] clk: sunxi-ng: a733: Keep SCP firmware bus clocks enabled
  https://lore.kernel.org/r/20261112-a733-fwclk-v2@gmail.com
- [PATCH RESEND v3 0/3] pinctrl: sunxi: number the IRQ banks from the first one that has IRQs
  https://lore.kernel.org/r/20261124215048.42074-1-pmazzini@gmail.com
- [PATCH v4] pinctrl: sunxi: use automatic voltage detection on A733
  https://lore.kernel.org/r/20261125-a733-pinctrl-v4@gmail.com
- [PATCH v8 0/5] regulator: Add X-Powers AXP318W PMIC support
  https://lore.kernel.org/r/20260910-axp318-regulator-v8-0-e906a61a7f3d@baylibre.com
- [PATCH v2 0/4] serial: 8250_dw: Allwinner A733 UART support
  https://lore.kernel.org/r/cover.1792439398.git.vinicius.eduardo.pedrosa@gmail.com
- [PATCH v6 0/5] arm64: dts: allwinner: add A733 and Radxa Cubie A7 support
  https://lore.kernel.org/r/20261126-a733-cubie-a7s-dt-v6-0@gmail.com

Tested on OrangePi 4 Pro:
- make dt_binding_check and make CHECK_DTBS=y pass with zero warnings.
- Boots cleanly to /bin/sh over UART0 (ttyS0 base_baud = 1500000) with
  RTC, pinctrl, AXP318W PMIC, MMC0, and PMUs initialized.

Changes in v2:
- Rebase onto linux-next (next-20261125); drop the allwinner,sun60i-a733-i2c
  binding patch now already merged in linux-next, and drop merged CCU v7
  and pinctrl v1 dependencies.
- Update prerequisite dependencies to pinctrl voltage-mode v4 and A733
  SoC DTSI v6.
- Fix &hosc clock-frequency from 24 MHz to 26 MHz to match hardware.
- Add base-commit and prerequisite-patch-id metadata footer for b4 and
  patchwork CI tracking, plus full prerequisite series titles.
- Link to v1: https://lore.kernel.org/r/20261125124407.4098345-1-alastair@d-silva.org

Alastair D'Silva (2):
  dt-bindings: arm: sunxi: Add Xunlong OrangePi 4 Pro
  arm64: dts: allwinner: Add Xunlong OrangePi 4 Pro board

 .../devicetree/bindings/arm/sunxi.yaml        |  5 ++
 arch/arm64/boot/dts/allwinner/Makefile        |  1 +
 .../allwinner/sun60i-a733-orangepi-4-pro.dts  | 75 +++++++++++++++++++
 3 files changed, 81 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun60i-a733-orangepi-4-pro.dts


base-commit: 9437046953b2fb3bf55b36582450ea0267df82a7
prerequisite-patch-id: 19691099774bd3dc41f56585c03ddefb7bdc6f9c
prerequisite-patch-id: 85db03df3394cdcb2780a0da122a74b2c1fe220d
prerequisite-patch-id: a3e883da50bf03e8f522444def66fec7f996ffbe
prerequisite-patch-id: c6889699a6dc13c336ce4cf4659e21b551e9a9fc
prerequisite-patch-id: ef2f0344452092edb2221b93c44a3e82cb896a2d
prerequisite-patch-id: c598480f753e36b7f6230129b864c559b9f185d5
prerequisite-patch-id: f86b468a896a40f132adfcba885700327dff1bc5
prerequisite-patch-id: a733e6bbf6de77dd9f260e65912894fd4d97aa78
prerequisite-patch-id: 090c5ff78d4e2150804aa8d294581cd338b1e971
prerequisite-patch-id: af0aebcae7c38d58354925119c412178b5821b5e
prerequisite-patch-id: beb8a098ba14724e316ff243bdf8e00e729243c1
prerequisite-patch-id: 63342c5ec38e8eb9e55c8c74d3c5a81a630d5f69
prerequisite-patch-id: 1dc8d70f80674c98b2b15d09556dd27f643b20da
prerequisite-patch-id: 4555860586ef50f27bf787a23f6ba693e9c3b0d6
prerequisite-patch-id: 0279f281cd59cf54bceee39b0fa4d0b6a7b87c48
prerequisite-patch-id: 14424bd8324b6cae2b8c4d6840df0db626d1385f
prerequisite-patch-id: 7b42728bc8271e5dfd57fffec47a7f5745eff357
prerequisite-patch-id: 74f5c7d066477024a374a789b3180e841398fb07
-- 
2.53.0

