Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=119.15.109.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795761865;
	b=ZSDrieJ49KvvVSNd/bEJSQ2k36peHLYxb7ATI8EsJS5k9MiPlFeP2fWwh1AjrcbgAjG3
	 kQJKYbUyAxGlU74qMW9jTMuVGLEJ/NG6UjcZCbt2Mi5d2zIHyb9zcnzA4ezfjkdhGvsA6
	 rLA0zLzQhWupT9PjOVl4W0j/NLX+d9asbK2FzfwrQ6PGaxphs9jowuI9SuQBFLZZ3ZR2X
	 QUMEMGd0p6pzwb5mjaZe3uaRYHVlwaMd1YFdIGVWQYgX80b4B8JkxO56ia2xU10mq9PQH
	 T5ABaE6h+BZ5s4CfE3xLDop8o9STVjgQkFqSZ1IagwaIUAQQDw1gUzsM66GtftROL8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795761865;
	h=DMARC-Filter:Received:DKIM-Signature:X-GPT-Reason:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=59ZldlQIgO+B2OmxbNWYDSyp3HqONBFUXP5EH5kGRBA=;
	b=RYnLvvpy3BTofVbkcB9o9TR8XFxNhr0DOTsQzh9YAucLqNZnpalEcdDCjiHQcpQXMiK8
	 rzqlxho4PoU39xXivjdiq32l7ty1tPJ20c+ERzirvo80nMOet6mda9MF5C3clMEpWst6s
	 L/6Tuua+gZDJ4loQimLuoyigXqVkI5KO4LI7MokpvHjcVY4KeWb5AEBuZcRd+ELZHJVUK
	 tj9cTbpCF78FauSUkvnBbTiyjYQSTiXcFizXWQFqaz/TKIVYfY+N03NuZjEG0LX+FTbk/
	 iLKM5LaJ5LzNDPVJTKkYCyebnkB4B6fAXG4ULOpo+X1TEmRuZ05gdPpQnS4YRxupCRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=d-silva.org;
	spf=pass smtp.mailfrom=d-silva.org;
	dkim=pass header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=ZdW3FHGo;
	arc=none smtp.remote-ip=119.15.109.137
Received: from www.nmnhosting.com (watt.d-silva.org [119.15.109.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2F7A606A321
	for <linux-sunxi@lists.linux.dev>; Fri, 27 Nov 2026 06:44:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2F7A606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=d-silva.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=d-silva.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=ZdW3FHGo
Received: from Hawking.lan (hawking.lan [10.0.1.4])
	by www.nmnhosting.com (Postfix) with ESMTP id 46F0340227;
	Fri, 27 Nov 2026 17:44:08 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=d-silva.org; s=2025a;
	t=1795761848;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=59ZldlQIgO+B2OmxbNWYDSyp3HqONBFUXP5EH5kGRBA=;
	b=ZdW3FHGoeYY6Qsvb2Odxs+TBuv5pHURLubNh5AHvx8x/Z5POO1NDDMOR3jOGFtmZ52l/wD
	/xT/Qyqz3pf+qlSMMJvUUbHNJ+pTbLRkzgRSYyYWtvDbgyZxWV0wDD6dGH8z+KEuXpX9+2
	ieN2Gk2Hh0Av+KzOyaBwBjIadtrnZnhfRE5RiBLWM0DoGur9uSYnENyF+k5YljtnHk0jvi
	xX3Lkx3okZ9p9fcOcTA+RsOL0uXkDHas4SSrGnLLWilqMAHCkp0HMBxGvFNrbhvFl12h+e
	gqdDOHYKaY8lB+oVQae51UiQ+tRLMV5lEs63t/+kgO3/DXhkywokEG1LJZNqEw==
X-GPT-Reason: legitimate; This is a technical software patch submission
	for the Linux kernel, which perfectly matches the personal/business
	context of the recipient (alastair@d-silva.org); the sender domain
	(d-silva.org) matches the recipient, indicating a trusted source;
	the content consists of specific technical changes (Device Tree
	Source for Allwinner A733) and includes a legitimate lore.kernel.org
	link; there are no signs of phishing, urgency, or unsolicited marketing.
From: Alastair D'Silva <alastair@d-silva.org>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alastair D'Silva <alastair@d-silva.org>
Subject: [PATCH v2 0/2] arm64: dts: allwinner: Enable A733 SPI0 on Orange Pi 4 Pro
Date: Fri, 27 Nov 2026 17:44:06 +1100
Message-ID: <20261127064408.1344250-1-alastair@d-silva.org>
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

Enable the SPI0 controller on Allwinner A733 and the onboard 16 MiB SPI
NOR flash (XMC XM25QU128C) on the Orange Pi 4 Pro.

Dependencies:
This series depends on:
- "[PATCH 0/3] arm64: dts: allwinner: Add Xunlong OrangePi 4 Pro support"
  by Alastair D'Silva <alastair@d-silva.org>
  https://lore.kernel.org/r/20261125124407.4098345-1-alastair@d-silva.org

Changes in v2:
- Add base-commit and prerequisite-patch-id trailers for the unmerged
  prerequisite patches.
- Reference the prerequisite series with a lore.kernel.org/r/ link.
- Drop deprecated Assisted-by tags.

Tested on Orange Pi 4 Pro:
- SPI0 probes at 50 MHz max and registers /dev/mtd0 (16 MiB, SFDP).
- Verified non-destructive read of the eGON.BT0 header at offset 0x0.

Alastair D'Silva (2):
  arm64: dts: allwinner: sun60i-a733: Add SPI0 node
  arm64: dts: allwinner: sun60i-a733-orangepi-4-pro: Enable SPI0 NOR
    flash

 .../allwinner/sun60i-a733-orangepi-4-pro.dts  | 24 +++++++++++++++++
 .../arm64/boot/dts/allwinner/sun60i-a733.dtsi | 27 +++++++++++++++++++
 2 files changed, 51 insertions(+)


base-commit: 988117cc1bb17338c586a4e21ade88b5397eac33
prerequisite-patch-id: 3b8415bb791a17bf30ae253b952ff1acf291fc96
prerequisite-patch-id: 75fc07dc2648e6610e80b21b910d9ae00d31c304
prerequisite-patch-id: 35c6c0bef613fb26f3f5bff6ff45dbadd8a51749
prerequisite-patch-id: 27ed3814dbd0c7ad830532ff125625917c873b4b
prerequisite-patch-id: 0df2ae41836b86fd868dfa01ddfde57f888f761a
prerequisite-patch-id: ed31fcb9809a267b49ee44a5cde678c3d77085cb
prerequisite-patch-id: 39a1e36d272d92139716356a50854eb8b01abc2b
prerequisite-patch-id: 89f5eb4b7c391953fc7ce6a96eb6ce22cbc9eba8
prerequisite-patch-id: 3bdae486f52d8983d80cf272c8c64465bf1d3231
prerequisite-patch-id: 2650d65df328931ab3b40c132c8a862e982ac73b
prerequisite-patch-id: 5d657469bcf35ca76bbe291203363403e00fab54
prerequisite-patch-id: 57131df5b3b6f1d1f12ef26a65e1b161c27e0838
prerequisite-patch-id: 309a5a3ca5b216915907263dea7024263abf1d1c
prerequisite-patch-id: 63342c5ec38e8eb9e55c8c74d3c5a81a630d5f69
prerequisite-patch-id: bf4ddc911cf8a6e246adf5f568e55a01abba4433
prerequisite-patch-id: 2ef0d68c7b24d98a3e9cdb55d71e68d84a0c51f3
prerequisite-patch-id: 4f4406ad18138f9dfce895e3ecece445f6134ac4
-- 
2.53.0

