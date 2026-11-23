Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795455743;
	b=lNPz99x3PCz2fHLJ/Q2EwCNdS8sE6piuPZcReo3NjMio/xiTXQ1mEYg8oveqRTsXnMv3
	 +07MGCVFhERAEni2gYJvBN58/a3LBKSPA1RksudFWWnaApYalYRCZ4pfQAcQ3sMLgksu9
	 VEp+5MeQwpJ2M5l2Biis/S0dwUTRNkO7h3h9ofPXXe8xADPYlyLVqj/TtkvhyaYt69zp8
	 5b/bED8z9wLFH9me20ZlbyAe5Y8yTuoSHnjOC0UzmY08ojbHoOQpKovszY9jo6knJxlbz
	 7B4tCBAQK2pwOI1wIjFiRMQqWvIuiguLwMVUaraXcBB15uSukiooa/7X/xKAgbqCiXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795455743;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=SIbteC45At9e/phHEDZccWeZUiRHWTYBk94KBVq+cmo=;
	b=dAHmHHl5v65jK7P2qspgY14uxwlJe7g1rxoHRgrlnywKEJkUdES8qRVKiw574sTdHFhs
	 tgt05f20NED0ncGxXb8+CiHk8GKox74IN/vygdRDB8XfUqTLLqCeeqci02Q6iZ+PMROtn
	 gWQ9umiGIH6rGvOkKsKbUDTxmpw0RGE+j+YoVqpLEP5jiXgVJPFth4/aLqxx9dJgJJff3
	 Eo7EjDdsWvnhYVXSSp1M3RZSQMELEKwClKMaM5Mgvte0m4eW+XRGLd5ixKarjKRw1D+mQ
	 6aqWuIhPvtpOe+9sZOYMQoLqy87DMJWORHWEedET3Qz3Z1FT+KFXnNHFrab6mSsv/WQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DR+M0usT;
	arc=none smtp.remote-ip=209.85.167.175
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC21D606A31E
	for <linux-sunxi@lists.linux.dev>; Mon, 23 Nov 2026 17:42:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC21D606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DR+M0usT
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-57e468d51b1so3531b6e.3
        for <linux-sunxi@lists.linux.dev>; Mon, 23 Nov 2026 09:42:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795455742; x=1796060542; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SIbteC45At9e/phHEDZccWeZUiRHWTYBk94KBVq+cmo=;
        b=DR+M0usTsw+BRyAaG1FDumoTSEift59PfxamDi5HxF6LyS3IDJsUyFP6Klh+909o4b
         KcjO4vR2C4s24GFsKFftQZZhEJ5B2pVPB9Ahn978A5VrQ9H74fI6sAK3g4gjukxjgWx2
         vePykIZPKqTbk3wLX3EXJXTs884oweZyiLdEhVUZn8HEfjwtsYayVwRe9wuwTlf5P32c
         FAR19g0Sxco8mi303EhSnnCpQjp+xPuRfne0QJGzYcpG9CpPcF9DeE5vgz/eWZaQSUj2
         GLvIs66xeAC4+gMyGYNcTOfXubYlfM8EPBfelNfrJtF64O4lxknqXzDJ34+1tKdbBQQL
         x4fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795455742; x=1796060542;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SIbteC45At9e/phHEDZccWeZUiRHWTYBk94KBVq+cmo=;
        b=sWLolIbwE04a3vCDu3OpbnPTCkfTwQCNllNGtRTw3YPXmP93NLNjBRnuCeiOiS2TN+
         Y3h/4eHOwK512OWYb/9FtV3dnxl5JOfMyTF9iYZHPnq2ZvyGGEvH1kc2RZAysOEvG30q
         NeK6DChjOlULPIc4Cew5xfUXee8M9un2stER6iF5OjpGcxrS/dy6xc0IIhO8fdFnTi+u
         rzhVTwTeFZ6FCKSM44mwEVsExC/XQCgMHoTsc+KrrO4vWbizf0a+91LfgEVEHnjDD134
         1OuO75d/VveM1jtLW4R4Jjr/UncDVkKZcfpuDCk53lS4YUXIHMGdLtqEmRpuDFUR/XAf
         zA0A==
X-Forwarded-Encrypted: i=1; AL+hErGW2nRBJ3cWMEaPaPmX5StHJ3FVaCq4SESMLUwmYbsygXYBwwyQnJ6gAfa39+TlKyuPVa4M5hETF0UV5Q==@lists.linux.dev
X-Gm-Message-State: APuU4Z9ingoffksXZ9YjaOF9nwZE5nXyOLvRR8I6/cgO92Ldss4V1DSL
	OHU9/mj5iY0br3yOFscCRGyzVcIJ7yE2EYKFRNMA6iz0y791qrv8eMa9
X-Gm-Gg: AZFdTZddzBOND1w/uvR+W7RZFDkRWAFaVS9rkH8KCEoEi+i5PnN+VIFfpiYJ06nBq2b
	7tXfZRuasLsjRs3iFxv1goPexJHGmVBom+CDuIU6ywEDqa3+UeisJaFM9j9u10kYmbXMLpGSl3U
	TybAaPesF1pot9gbmqbFADgI3obRdGBX0XiPq2QFrTiPMkf7oCL5b/tqP5PFIQIOdMGpuz+l/2W
	cbNifpf6nE/Gn1FgVHPPTpSqbmHJSv50Buvqagne2TI53RqmCx9mQuR3814nCn44NPL0MDzAgXs
	5WNa0ZbWGdKPtuAbsPucFyZ0Xz97aqlURP45Xdd39nRPsldjC9aO2+Yy3RwshR4hIh7i2SQdPqC
	LYAHB1ZXbx6uC1KBAUv7QKBTYtmVwgRfK4ctkmTSFif6zo2LaVacRpiu6AHGI+bdI8SAN9LK3K8
	NF4cncaNMDe+ivceFDFrTnhXsxGJZhGQiGf/O3tjM5GXPF+nlLs+0U+Aok0xVLNuKr+CzX2pLvP
	Qw4LLlI3mwXwdwXK3/TnZnMkj1hjTaGlWOq59VP3USG56j6mpLs0hBmhQzuyP+/8AoZnla2g3CS
	VQB/rec4QyZBdGQwbgWIHVqJWJ69ZwlIOkgC3fxVh5E5dvKw+T53lLe4SyTdOkwX02iglJNd2qJ
	xb2FP9A==
X-Received: by 2002:a05:6808:1908:b0:571:b166:3d76 with SMTP id 5614622812f47-57a0ab2460amr14209938b6e.29.1795455741608;
        Mon, 23 Nov 2026 09:42:21 -0800 (PST)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4bc5b07d57csm11240123fac.1.2026.11.23.09.42.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 09:42:20 -0800 (PST)
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
Subject: [PATCH v5 0/3] arm64: dts: allwinner: add A733/Cubie A7S support
Date: Mon, 23 Nov 2026 12:42:18 -0500
Message-ID: <20261121-a733-cubie-a7s-dt-v5-0@gmail.com>
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

Add initial Allwinner A733 and Radxa Cubie A7S device trees for the
console, PMIC, microSD, LEDs and EEPROM. The Cubie A7A compatible is
for Andre Przywara's forthcoming DTS:
https://lore.kernel.org/r/20261122004008.0ee8e16d@ryzen.lan

Base: sunxi/for-next (2ba07dfcd45bb6ec414e68213620490548fd5aec).
Previous version:
https://lore.kernel.org/r/cover.1795034153.git.enzo.adriano.code@gmail.com

Changes in v5:
- 1/3: Add the Cubie A7A compatible.
- 2/3: Keep one DynamIQ cluster, rename osc to hosc and add I2C0 pins.
- 3/3: Add LEDs and EEPROM, simplify MMC0, describe the 3.3 V PF path,
  and revise the PMIC rail descriptions, bounds and always-on flags.

The hosc label also affects Vinicius's A7Z and Alastair's U-Boot import:
https://lore.kernel.org/r/20261111134919.90264-3-vinicius.eduardo.pedrosa@gmail.com
https://lore.kernel.org/r/20261113023236.569054-26-alastair@d-silva.org

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

The A7S DTB and schema checks use [1] 3/5, [2] 2/3 and [3] 3/4.
The runtime build uses context adjustments for [1] 5/5 and [5]
after the regulator allocation and IRQ-bank changes.

Validation: clean application of the mail patches, arm64 defconfig
Image, arm/sunxi.yaml binding check and warning-free A7S
W=2 CHECK_DTBS=y.

On a Cubie A7S, a RAM boot with vendor firmware, this DTB and the runtime
dependencies above reached a responsive console and probed the PMIC.
Pre-boot U-Boot selector reads put every bounded rail within its bounds;
none changed at registration (sysfs at about 1 and 91 seconds, and no
regulator "Bringing" messages). At about 32 seconds unused-regulator
cleanup disabled DCDC4, BLDO1, BLDO2 and CLDO2; DCDC9, SWOUT1 and
CLDO5 stayed enabled through their users, and the console remained
responsive. MMC0 enumerated the card in High Speed, with a 50 MHz clock
tree reading, and completed a 4 MiB read; its data was not verified.
Both LEDs registered: green:power was on with trigger none, blue:status
was off at sampling with heartbeat selected. AT24 registered the 2 KiB
EEPROM with its WP GPIO; topology sysfs showed one cluster. A warm
reboot returned to vendor firmware. Not tested: early and repeatable MMC
reads, MMC ios, SD writes, hotplug and 1.8 V switching; EEPROM contents,
writes and write protection; visible LED operation; physical rail voltages
and CPU/cache topology; PMU counting, EL2 interrupts, ITS/MSI, stimulated
PMIC/NMI interrupts, suspend, power-off and other boards.

---
Enzo Adriano (3):
  dt-bindings: arm: sunxi: document Radxa Cubie A7A and A7S
  arm64: dts: allwinner: add A733 SoC description
  arm64: dts: allwinner: add Radxa Cubie A7S board

 Documentation/devicetree/bindings/arm/sunxi.yaml  |  10 +
 arch/arm64/boot/dts/allwinner/Makefile            |   1 +
 .../boot/dts/allwinner/sun60i-a733-cubie-a7s.dts  | 331 ++++++++++
 arch/arm64/boot/dts/allwinner/sun60i-a733.dtsi    | 663 ++++++++++++++++++++
 4 files changed, 1005 insertions(+)

base-commit: 2ba07dfcd45bb6ec414e68213620490548fd5aec
-- 
2.53.0

