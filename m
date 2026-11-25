Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=119.15.109.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795637377;
	b=LzMRXWRiM6z2ukHwSAEAqOCnKCgF+LtOmQ8ZRv6nwixEO076tTnV3Icg8TRzrdI25inZ
	 Vh9tX4J21l09f2XlRi+JeeFCLkTrswIAlPDDbiYzn8EAnZAR4CKUCdAzgfj5EMM1M9BLp
	 xoVq0gez+YisxwYB7y3jtuIAFIzTfegWHtzr/YmY9NG4HWWcRyj7djOtM/1uppbg5dsX3
	 7HUhGAfcU19uOHC0jJjt9L/olL7yHmxOH7Cm7aXTeCKnbnVxbZduc9FVGSzVuQGN/LV8v
	 JpsMXiyuhNdE1Ypf0vr9dDj4pNJj4YeWjtUS7w7HFk5rIug22Hiahk2kJf0lKWN9knA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795637377;
	h=DMARC-Filter:Received:DKIM-Signature:X-GPT-Reason:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=8NfOYQ9xOQe4jaVMMbVRX9QNJs2ea2xAaZLXH5A8ISM=;
	b=pGpCVBs/jJ6yRN0xYK9ygZFvBNZceQCLNQMwXuULuYAfgteSUmndP0HSP2ZKZTcu/lDS
	 1AEnZ6GVZmBFeVyfRatO8nK/oFXCLzxTPKdykJV7ESN8IgGRGn9ocxNvPtvyoFj4eDwVW
	 mxoymAG4/n05YCNEKqI0NVOrScARPuFRibM7kF/TeHheZwiDOn5NfO/X876ahgbU07YSs
	 tMYFeipNYsq/z7U59bAR7JiV2NcR3EJEUNsLdSfxlRqZI0j5qVUlS2ocjrpsqWDSKU2Bn
	 uXxJdHiiGaCypAMswTq6ZXmZnNKoPA6nKo390rgDUvc9luUwhuGHJ8uX4w9blqUbwRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=d-silva.org;
	spf=pass smtp.mailfrom=d-silva.org;
	dkim=pass header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=ipcMGvgS;
	arc=none smtp.remote-ip=119.15.109.137
Received: from www.nmnhosting.com (watt.d-silva.org [119.15.109.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02A8C606A32D
	for <linux-sunxi@lists.linux.dev>; Wed, 25 Nov 2026 20:09:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02A8C606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=d-silva.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=d-silva.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=ipcMGvgS
Received: from Hawking.lan (hawking.lan [10.0.1.4])
	by www.nmnhosting.com (Postfix) with ESMTP id 28BCA403EF;
	Thu, 26 Nov 2026 07:09:27 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=d-silva.org; s=2025a;
	t=1795637367;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=8NfOYQ9xOQe4jaVMMbVRX9QNJs2ea2xAaZLXH5A8ISM=;
	b=ipcMGvgSX9aaPdr4ULF3tlN/IALDqJEV+3PDAN8JzbopXc+qZ7gB4KI3i6Smv3eXleac7S
	j4At8EQK6UEfGTTLxneNdWLs8ehejEYDRQ7doLq4uSANiyfYMYa+PqRyJjX9IAqRzQFb76
	tCFjF5MhqG9NS6dwIirGXLlFvO4hjHjG1OHweEhn9+574kyHrd8OTFtj4SWtHSL4xChJe/
	5fU+y/C0wqKoL0OWWwMJ6JmpNJq3RAVI+NwEXDRnyXlLas9LkKg7sH66DSWacCROgQYikX
	fZikfMjAWf26Ps88+wonH1jr1bm92Yd0FfgYQ2SW6X31yrTF1TDuGzLKgMnPYg==
X-GPT-Reason: legitimate; the message is a technical software patch
	submission for the Linux kernel; the sender (alastair@d-silva.org)
	matches the personal mailbox (alastair@d-silva.org); the content
	involves specific hardware configuration (Orange Pi 4 Pro) and
	includes a link to a known trusted domain (kernel.org) which aligns
	with the technical nature of the subject; there are no indicators
	of phishing, urgency, or unsolicited marketing.
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
Subject: [PATCH 0/2] arm64: dts: allwinner: Enable A733 SPI0 on Orange Pi 4 Pro
Date: Thu, 26 Nov 2026 07:09:25 +1100
Message-ID: <20261125200927.515136-1-alastair@d-silva.org>
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
This series depends on the Xunlong OrangePi 4 Pro bring-up series:
- Author: Alastair D'Silva <alastair@d-silva.org>
- Series: [PATCH 0/3] arm64: dts: allwinner: Add Xunlong OrangePi 4 Pro support
- Link: https://lore.kernel.org/all/20261125124407.4098345-1-alastair@d-silva.org/

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

-- 
2.53.0

