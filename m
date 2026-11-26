Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795725331;
	b=gjHCeoj+ZDSG+5G0WeJjNiRHASsr9WBCKLF4029715SJQTD+WwxcQgL2+yPPblC3yVIP
	 iKB0yEWBGNZfDi9znBJzSHXdmeVGBU/KpPY3wndXXPuwHZsw+Tg+bNcq+tjFMTqXOA4tX
	 FDZ8a/4mEOdLnpPM74+iLZqrQKjJC4oDI2rutwgRysz1BFlGGL7DzNnr0gf2qwUWCet7+
	 tTspv3EfR3Nkf4JCPuTHFQ4GfOe4TGpvq52Um1oB2ruxMhi9ZKp6WpOl00XO28ll8Iv7g
	 l+Uk6KnToL8t6hPKqsP20Ht8RyWu5fU/sPtwXHZoVdpklPXzFfxS5B1hQhen7hfeUog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795725331;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=zqO3yiYGog30zyUcuMfbgRi3wkNhqWosSS3VtCYqruE=;
	b=Oi8luUwUxWgEKQoVcSAKBJbyn2L6Pz5GaS5OQGv8RRN9ebGH7ZWSE4YUht0n1six661F
	 9eMhtm2WaXyh5fCCU9kz9G9Sns1ZsjyAv9EXyEjnplVwh2SilMrxOrg6yfncTY/uYX49v
	 wLUXf2tPNo6J5rzKRCMVFjv6Z1H42rYNx8kLW9aKr2s+ZKsQjnQQkrzoiNn0DSK9LNeTT
	 84vB0cUX2cgw0xryEZn1eO8lisGta27jGUMTQAekljVi1yWymAvvW5cMhDUdDCY5zjHfv
	 o0ZVbNZOmkYBFTYfqPk4kbwQLIu0PqP2zM89qOoo8O6vT6UBEiXlF0tkbd4ROFu0dCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LiJpTutT;
	arc=none smtp.remote-ip=209.85.161.46
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6BD3606A326
	for <linux-sunxi@lists.linux.dev>; Thu, 26 Nov 2026 20:35:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6BD3606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LiJpTutT
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-6ddef424972so5929869eaf.3
        for <linux-sunxi@lists.linux.dev>; Thu, 26 Nov 2026 12:35:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795725329; x=1796330129; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zqO3yiYGog30zyUcuMfbgRi3wkNhqWosSS3VtCYqruE=;
        b=LiJpTutTEQ5qK6jlz9iZEZn2EgyWrTORdo/YC4OMZTxLJ9UG3MwLbRlmB/k6ySVTmW
         cGMS3q0FIz/oEWQI95fqzsSAnKgmb4XluW8ey9Yg7I3v0w6sKXkRR7T6Bm6MkaEyDix1
         9wSqbiOda20oi58txtNAUx5kHAGtycUydqqm7qaBO3LHctHm6F0GF2umdjxbqINndJ5L
         8LAfZ6ghmNOdtVXdGeyzpfWZSejixbW0RR/Ba2OewVipFbhwD8hggZmkynbT5W8+NyDm
         Q6QebdyxCfovug0MDjF4Fj1m7qAO7KA6DptdfjlZozcS8t8RcPw3gGUQ5UAmAAwVuR+3
         kXGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795725329; x=1796330129;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zqO3yiYGog30zyUcuMfbgRi3wkNhqWosSS3VtCYqruE=;
        b=gsk4VtgHPoeJrNa2f15a+AeYZN5zPfI5guyESMhPjM8fPPPq2Ip8yxP5ZAbw5d3qBb
         e/UeBqZkeVA+ft9th6LI7+MRQsf4TSbTmEbEDzX3LdgIYo4cfo0GkmP34znmxqXlLJVu
         oen03AWKXDjt8sw7kmR3dB3ySJe3WdGU90gKTzi+gc1Y3rRTYjXSaxaFdAmhaSShx9Zd
         2f2W2dO6hCKjtgd3SBCCX5Kj3BP4obWyr9BJph1UTeMCaaI3tbBDhI9/vrl5D2NW4MYw
         bnv+DU93k0dkIY7p7ihVWLLqtmJIsbUr3O4iyP3niNL5hg4ZscVJqiGKn6FQt4JGNBOu
         HvqQ==
X-Forwarded-Encrypted: i=1; AL+hErG+xAlPICNIyUWZyzpug66L61D2vV+uOHnxqsnBN0IBewaP2asvwGMVdAlAqc0d+iptv6aOVMUlzipYeA==@lists.linux.dev
X-Gm-Message-State: APuU4Z/rq3qZbVONz9t9Mgr7J1xWcv8inihS19+9w4fo49RRGTXbyCmG
	grQGuC++GQ3PJhq+kVxC4SuGgBr3Vs0/kqy4te+uivlxpIS378Uw8HOV
X-Gm-Gg: AZFdTZc9sLPOuu7mRIdWu0FAmOJmIyFFYZpqS/YF73/Qo08Wg2b2PayDoc+LH4YnQFm
	nipk9elYgj37UqvMe0d/OWO2A8/EZhomsrEMmhFOu0Xli3Ff3Xb1zSF/GqpL2zhzG5SEnwNFEgO
	8YsAAlezwsw3abv2kGp4NdTFEOofUf3+AddBgyhWHsr+LRXKfynZdE2bK8tddjNNk1Gb1pohdft
	7hmPA9XUAM1MfdHRkNJNZCfCB8/5NJAZJlZKQQJSnJpOUnsqRbgqgL6MWynXwynMtJBY7VS7W3N
	qnAoRxronDrw3URmGZDpBJ4POJxIDrApGY3jfPfH72bufJeR7xpFMlavVm5GXyDHwoKaO1uT5UD
	js6Mp37wdIH6wxN0B0qsxlyS4TmVkzuWvVBm/IHDM7s2f8qml4VMz7QIhQwD6+jpD/yQrNKSNNa
	yZjpUoEHExtGHjiDCv4pXIU37fLK2yLB5EbK9LAR7L/f8d+HskCo5B2OePmU9EJRvpolnlB/7ew
	esCt4H0+pc4X/EH7ddA3dCqeHpaNSDiiP80U9FWuewIwLvXFEh+Se6HaVy7wzOIj29pI0mkKU82
	UlxyU2Xk1Oxfwcp0kSLeN09fyXUJUkml/Ya5qTpWSCTgLrI09ybT6TtDJ7+0SpgCdfEFlidylca
	Qf2ygeg==
X-Received: by 2002:a05:6820:1c86:b0:71b:790a:9ee7 with SMTP id 006d021491bc7-71b790aa590mr6624976eaf.67.1795725329526;
        Thu, 26 Nov 2026 12:35:29 -0800 (PST)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4bc5f7ae7dcsm18946578fac.8.2026.11.26.12.35.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 12:35:28 -0800 (PST)
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
	Lukas Schmid <lukas.schmid@netcube.li>,
	Cristian Filipescu <filipescu.cristian@gmail.com>,
	Norman Herms <dockseed@proton.me>
Subject: [PATCH v6 0/5] arm64: dts: allwinner: add A733 and Radxa Cubie A7 support
Date: Thu, 26 Nov 2026 15:35:26 -0500
Message-ID: <20261126-a733-cubie-a7s-dt-v6-0@gmail.com>
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

Add the common Allwinner A733 device tree and initial Radxa Cubie A7A,
A7S and A7Z support. V6 adds the tested A7A and A7Z board descriptions
and their shared pin and binding updates. The A7S ELDO1 voltage range
remains open pending Chen-Yu's answer on LPDDR5 VDD2L.

Base: sunxi/for-next (abcb290978fbfddb56fc77171918dd8b8ef3e81b).
V5: https://lore.kernel.org/r/20261121-a733-cubie-a7s-dt-v5-0@gmail.com

Schema check: arm/sunxi.yaml and all three DTBs with arm64 defconfig
and W=2 CHECK_DTBS=y. The three schema prerequisites, in apply order:

  AXP318W PMIC v8, 3/5
  https://lore.kernel.org/r/20260910-axp318-regulator-v8-3-e906a61a7f3d@baylibre.com
  Pinctrl IRQ-bank RESEND v3, 2/3
  https://lore.kernel.org/r/20261124215048.42074-3-pmazzini@gmail.com
  A733 UART binding v2, 3/4
  https://lore.kernel.org/r/09f3a181436e6f19317224e583c2fdaa787797d7.1792439398.git.vinicius.eduardo.pedrosa@gmail.com

The A733 CCU support is in the base. The remaining runtime dependencies
are the full PMIC, IRQ-bank and UART series, firmware clocks for warm
reboot with vendor firmware, and automatic pinctrl voltage detection:

  https://lore.kernel.org/r/20260910-axp318-regulator-v8-0-e906a61a7f3d@baylibre.com
  https://lore.kernel.org/r/20261124215048.42074-1-pmazzini@gmail.com
  https://lore.kernel.org/r/cover.1792439398.git.vinicius.eduardo.pedrosa@gmail.com
  https://lore.kernel.org/r/20261112-a733-fwclk-v2@gmail.com
  https://lore.kernel.org/r/20261125-a733-pinctrl-v4@gmail.com

The card-detect EINT-mux fix is in pinctrl fixes as a256b8c8083e.
It is outside the stated sunxi base.
https://lore.kernel.org/r/20261110130157.112155-1-vinicius.eduardo.pedrosa@gmail.com

Boot: the v6 DTBs have yet to run on hardware.

- A7S v5 booted with vendor firmware and the runtime dependencies.
  Console, PMIC readback, MMC enumeration, LED and EEPROM probe,
  and warm reboot worked. A follow-up with the EINT-mux fix read
  a matching 16 MiB MMC prefix at 50 MHz and 3.3 V. An earlier read
  from a different offset returned an unexplained digest mismatch.
- Norman tested A7S v5 with his own firmware and a 2 MiB RAM
  reservation. He verified PMIC readback, PMU counting and overflow
  on all CPUs, MMC reads and write/readback, EEPROM reads, visible
  LEDs, warm reboot and power-off.
  https://lore.kernel.org/r/CqGMQaDysL6l016qtEM8oOEnYUMKACgmwLUbb0wruVAzPcwiqrz00WCOhTrhkVEaZt1YB3xfucXdEc-ZFi-sCPgn69RNqtW0v4Gn_HjQZXs=@proton.me
- Vinicius tested A7Z v1.11 with a local 16 MiB RAM reservation
  and a subset of the dependencies. Eight CPUs, PMU counting
  and overflow, PMIC probe, MMC readback and the LED worked. He
  tested card hotplug on the preceding DTS with the EINT-mux fix.
  https://lore.kernel.org/r/20261125131435.33190-1-vinicius.eduardo.pedrosa@gmail.com
- Andre tested A7A with pinctrl and PMIC patches. MMC and its
  card-detect IRQ, LEDs and EEPROM reads worked. The external RTC
  probed and reported an invalid calendar format.
  https://lore.kernel.org/r/20261126172253.1097838-1-andre.przywara@arm.com

Still untested: physical rail voltages and CPU/cache topology, EL2
interrupts, ITS/MSI, stimulated PMIC/NMI interrupts, suspend, 1.8 V
SD signalling, A7S card hotplug, EEPROM writes and write protection,
A7Z v1.10 pull-up behaviour and A7Z v2.00.

Andre Przywara (1):
  arm64: dts: allwinner: add Radxa Cubie A7A board

Enzo Adriano (3):
  dt-bindings: arm: sunxi: document Radxa Cubie A7A, A7S and A7Z
  arm64: dts: allwinner: add A733 SoC description
  arm64: dts: allwinner: add Radxa Cubie A7S board

Vinicius Pedrosa (1):
  arm64: dts: allwinner: add Radxa Cubie A7Z board

 .../devicetree/bindings/arm/sunxi.yaml        |  15 +
 arch/arm64/boot/dts/allwinner/Makefile        |   3 +
 .../dts/allwinner/sun60i-a733-cubie-a7a.dts   | 385 ++++++++++
 .../dts/allwinner/sun60i-a733-cubie-a7s.dts   | 333 +++++++++
 .../dts/allwinner/sun60i-a733-cubie-a7z.dts   | 349 +++++++++
 .../arm64/boot/dts/allwinner/sun60i-a733.dtsi | 671 ++++++++++++++++++
 6 files changed, 1756 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7a.dts
 create mode 100644 arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7s.dts
 create mode 100644 arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7z.dts
 create mode 100644 arch/arm64/boot/dts/allwinner/sun60i-a733.dtsi


base-commit: abcb290978fbfddb56fc77171918dd8b8ef3e81b

