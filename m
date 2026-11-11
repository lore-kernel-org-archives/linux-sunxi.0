Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794404974;
	b=Oz90zeoxYXo4jWAz+CKWy7gqki4DVij1wDO0+qIyhAtAU2yboTKQAFOhNr6DplCmCqHq
	 pYAB7XZyQuINjpLr2X4Akvg5V320Ci3/P9uaq268O0oOoCsMaeaXbKupBNe5PTXw0pbZo
	 Cvf56vk65J0dJ4jznA+QdBXrr/N0zY9VlyXW+9CcbeYnYjWqaD/59aYi79T/FXwTEp2Dr
	 xj8N9WP4ESYme4eSAq0swkN76IMPFBIxCbtEIYKj57EIDIIQ+Nvzjth2381+P3DSKYyOU
	 hhMkXf9DnBHZNlZoXsbmNNMxODUMxZ7WXCqmiXXSgizu4MXyf3ZRPtIzZi8y15rHSWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794404974;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=OXy8NjisYDxdyWccLLdZy0AuSzDlkdMHnGHG7lMtXcI=;
	b=W2AIIBYRR95RgaazIBTvvj2Glt1urG3QD0mgPyyOc30DUPrpfehT5wuLAloY8jbHwxuG
	 sUD9p7qMJEJYAf0dsGTssHoaRyd9qJ6NkjfBoYEyoaKLqqnwyrIxn+YfwA/zDqwVsflMz
	 mC0jiFCLuYa4eA24HuwQZ8wHmCGLwZ6gBWLdzhTf9HIpeHH5FXbU7WNr2VrhZCqSDiVJy
	 dxdH/eLeRIbRQAAtdq2gFX57rqmjWTH5Z4sqtcwkGfOHyqfVx1paA3uDP5jIf5EBLM4Mz
	 v8ikX6MU0Vucf0RwJxqjVRsp1LJtLnXmaVUD1NsU32UoKJxzm9V3OmG0B7IvZ0Dr7MA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=K73TKOWu;
	arc=none smtp.remote-ip=209.85.128.169
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25EA5606A33D
	for <linux-sunxi@lists.linux.dev>; Wed, 11 Nov 2026 13:49:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25EA5606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=K73TKOWu
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-8b32daac9d7so24598177b3.0
        for <linux-sunxi@lists.linux.dev>; Wed, 11 Nov 2026 05:49:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794404973; x=1795009773; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OXy8NjisYDxdyWccLLdZy0AuSzDlkdMHnGHG7lMtXcI=;
        b=K73TKOWuDVtzjegOR6Bh4dD6nBfuzsDnjRbW0NAQn0ninE2PQg5mkgcvfOSsmsQixI
         jIr1+pvtLP4bBnSp+GGPdk7Z5crSp+HBxxnI7rxn7plTxNfkEBYv/npuJv3qsFLFsX3K
         TucJlj7LGkEGfyj+zQ+i7vgkowuqiGIhPq3hdeFgM1fAebdlCfeCfIEr0MQiHG4a7U2V
         98LewqY4JKsOAA2U0icQAl8pyz4a8XMf7D9/9W+5HO37oJ5+2DZmu0D7SD3Ds1zSxW0w
         qO2H8Ru7+RSuvEL/MaShFzK8jfPiBLRk26iLsv5ZZOzTwUu6l1PHCG8oSpV40zAnYrhE
         DoXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794404973; x=1795009773;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OXy8NjisYDxdyWccLLdZy0AuSzDlkdMHnGHG7lMtXcI=;
        b=dCZg0tgCM0okgnxk8UPEdMccsN9tHkt+V/8+cKntEW5/2IjBTq3xXdLpB6cE7TbpJc
         jUC2u8vco3S1ysfpli2sP09RL21OQbFFWYkTo6MUSmea8bdJrJp8Od6dwXbDfd3gT4rd
         pFrNoQkyUqcUjQ11enDm3VCZLwa8vvjubiVZhkkB7Nm60ia4o6H0KL65SvMM98j1Q2S4
         6reZhKIju3l5SXOIIH/u2zScsxvPnERJrqDNjlqjYcYVtnXtvH+/ZpeUTMlFoLybpoCo
         TsKWw1hI1sFcn0K6TAebaXjIc/D2hDYnpfFhreFBuj4jBabvdqwxxpDPTBegG+/kLoCi
         6gdw==
X-Forwarded-Encrypted: i=1; AL+hErHBTrZQtJqLalgce8ujRB7rHTU9ABbCSvlH+/RgR5MeBe1+IrFwZ/JGb/BWE2lkeOQYejKNSWicOcbC+Q==@lists.linux.dev
X-Gm-Message-State: APuU4Z+0XdmIqFQTzXAkxrNzH06+1oYBJISVMFuXCKV72PLVhAgyJ/8v
	PVGO+9/sURAup7i86NCP2VwAO+TDVzBJ5rKXsGsogdjReXaLuZZRlY//
X-Gm-Gg: AYBFou3HFVId4hm6dOMOV9jao362znArT+bMClSAz4cPGGLyYZq9TCkRskngbHK1Naw
	qvVdoGzJQTaQjfgXt4UFRvvtMqNTuDy2NqCSNduU0rtTTl0w/OjcWGJsgLPDw/Q6gQh7RnkjskB
	zWx5YMosp02d3QvZClSa+Jt8VIRGdWWmMq7lPnpiyP1h8BforMxzhQej2+6+qZaAnaVC14lHhYG
	icyT+wsHWN0jvqgHtBcospPo4gB4AIXDaLt7pgSi96U3GBLEx0MPiT3ald0GiZK43YbxkwYTf5H
	oH6Tc9UKaAiYJB8kQZWfVeBf0vu5NZjAS/ibD5H1/orXJt/2YIKLQtO+2OLpuZyVSN5vHcwOTUO
	MJj3m6zMCsxCLZAC7d6rqlkcdJDdvBSyElxQLjZCkuZjs9FtGOkWyViGEsgQlGxXQuq9IlzdvX8
	Z3dS5F6NE2OH+ZYLLfpptoyt31aJnNxSH24jK6HVj6imuAouFNj13Y3OgKX0y4HXoydFEVDes8X
	rRauAc3IjicgKy6/lht435ii47yaduEA4Qwa0Bxui7PctVHaZ/h7CKFxeDYRwsMdHWgKJZWM3u8
	HjrVu0j40bpIEjk3n8CC4e6nonHOS/1dGz+ZcSrDe2k3FCv+cWD5IFqCSfV1UMwPoI9qWV8WYZL
	FERgYBolAhcW8FUmTgz6/SXtJXKSyscNE4sD+f7qhMgURdtfNMb/Ii92sSBaChN3bab5V3BmFje
	A=
X-Received: by 2002:a05:690c:399:b0:873:5c6b:a31d with SMTP id 00721157ae682-8b3a80c2c99mr17468437b3.23.1794404971972;
        Wed, 11 Nov 2026 05:49:31 -0800 (PST)
Received: from MaquinaLab.. (189.27.147.77.dynamic.adsl.gvt.net.br. [189.27.147.77])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b393426f13sm44519817b3.34.2026.11.11.05.49.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 05:49:31 -0800 (PST)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Andre Przywara <andre.przywara@arm.com>,
	Enzo Adriano <enzo.adriano.code@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] arm64: dts: allwinner: add Radxa Cubie A7Z support
Date: Wed, 11 Nov 2026 10:49:14 -0300
Message-ID: <20261111134919.90264-1-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Add a board DT for the Radxa Cubie A7Z (Allwinner A733), based on Enzo's
A733 SoC description and Cubie A7S DT [1].

The A7Z differs from the A7S in its PG supply (BLDO5), the SY8089
regulator feeding the PMIC's BLDO and CLDO inputs, and the microSD
card-detect line, which has an external pull-up. The series enables
UART0, the AXP318W PMIC, MMC0, RTC, bank supplies and the green user LED.

Tested on a Cubie A7Z with v7.4-rc1 and the posted A733 prerequisites.
Eight CPUs, R-I2C0/PMIC, MMC0 read/write at 3.3 V, RTC, LED, PSCI
reboot/power-off and CPU hotplug worked.

MMC0 card-detect hotplug needs the separate A733 EINT-mux fix [8]. The
tested DTB also had a local 16 MiB no-map reservation for my boot
firmware, which is not part of this series.

Dependencies:
[1] https://lore.kernel.org/r/cover.1794227241.git.enzo.adriano.code@gmail.com
[2] https://lore.kernel.org/r/20261009-a733-clk-v6-0-ae8178fce7e8@pigmoral.tech
[3] https://lore.kernel.org/r/20260910-axp318-regulator-v8-0-e906a61a7f3d@baylibre.com
[4] https://lore.kernel.org/r/20261025142412.112216-1-pmazzini@gmail.com
[5] https://lore.kernel.org/r/cover.1792439398.git.vinicius.eduardo.pedrosa@gmail.com
[6] https://lore.kernel.org/r/20261109-a733-pinctrl-v3@gmail.com
[7] https://lore.kernel.org/r/20261031020640-263f7b05-a7s-clock@gmail.com
[8] https://lore.kernel.org/r/20261110130157.112155-1-vinicius.eduardo.pedrosa@gmail.com

Vinicius Pedrosa (3):
  dt-bindings: arm: sunxi: document Radxa Cubie A7Z
  arm64: dts: allwinner: add Radxa Cubie A7Z board
  arm64: dts: allwinner: sun60i-a733-cubie-a7z: add the user LED

 .../devicetree/bindings/arm/sunxi.yaml        |   5 +
 arch/arm64/boot/dts/allwinner/Makefile        |   1 +
 .../dts/allwinner/sun60i-a733-cubie-a7z.dts   | 298 ++++++++++++++++++
 3 files changed, 304 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7z.dts


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
prerequisite-patch-id: 0ed6b92774b5b794761c7ce34db653a5435dc833
prerequisite-patch-id: 27ed3814dbd0c7ad830532ff125625917c873b4b
prerequisite-patch-id: 74d03898c5ce14763f4e89fb73e021de59f0fb9f
prerequisite-patch-id: 9225cb094cf6cbb338b14ac63711d68bed12d24d
prerequisite-patch-id: 568dae1c91a0d7318d6eb14a18054343b84b603a
prerequisite-patch-id: ff3806332e741f0e2c8dac1c11f4c71449c16c8c
prerequisite-patch-id: 39461e0543aefb5c40184664625cbab19ac8408a
prerequisite-patch-id: 6fc03bfbd343042dd3b660938fcc09c5e7d48314
prerequisite-patch-id: e27ef0b1e3a7fc0a659a1a82c1a7184665451265
prerequisite-patch-id: c598480f753e36b7f6230129b864c559b9f185d5
prerequisite-patch-id: f86b468a896a40f132adfcba885700327dff1bc5
prerequisite-patch-id: 079d60101e1b9e5425458060314bde3e9cc2fe4c
prerequisite-patch-id: 5d657469bcf35ca76bbe291203363403e00fab54
prerequisite-patch-id: 85db03df3394cdcb2780a0da122a74b2c1fe220d
prerequisite-patch-id: a3e883da50bf03e8f522444def66fec7f996ffbe
prerequisite-patch-id: c6889699a6dc13c336ce4cf4659e21b551e9a9fc
prerequisite-patch-id: af0aebcae7c38d58354925119c412178b5821b5e
prerequisite-patch-id: beb8a098ba14724e316ff243bdf8e00e729243c1
prerequisite-patch-id: 63342c5ec38e8eb9e55c8c74d3c5a81a630d5f69
prerequisite-patch-id: 1dc8d70f80674c98b2b15d09556dd27f643b20da
prerequisite-patch-id: cf6d9a8d3f2089f59a8a5afb4cc9375d7a6dc482
prerequisite-patch-id: 4cdaae8c384016491ce01e6e328acbb347debd62
prerequisite-patch-id: cb253a02b7d81079cc1ea4f75def94564468c80c
prerequisite-patch-id: 1f869e65014f3cd678bab7f235cbcb14c60a1608
prerequisite-patch-id: 184825f979a16a0b6900c58ba342899747da11b4
-- 
2.43.0

