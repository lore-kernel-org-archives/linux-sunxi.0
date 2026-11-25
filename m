Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=119.15.109.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795640741;
	b=Fe6rE3exZYOKvlPvaV2mjKff3YqWCg3jFEbX6TM478eJ4K3FRkq9ePRJVvPqs3cpcnH5
	 sGy94PsX3yFuOQXznmcdmLHLZiLggqth9eTeVljIqy+GnFFRHnnklKTr/oTRJHqSYYRJ0
	 NJIpYx5/ryStIEprO+3slb2weUTFtrN72dEEN1oaPDc/ks9oDhrcsqRoBclrYSmYx18tv
	 cJGO+BzqL8T1aREMfUcrjpgmQtMxYT4d0x40BvWJu5tPZ2EwxfRd2UdXSSiB/xHQJXunI
	 wk1tNdNTxp68xgvYuVkLvG8t3PaoVjj+ebMqcWPCYEPMQint8cmgw108HpNekxh/J0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795640741;
	h=DMARC-Filter:Received:DKIM-Signature:X-GPT-Reason:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=+7MuY/6UP2Bsh775A7XrC/mnlab/U/JJYl8O0EaI6UA=;
	b=Ui8b+V7rdUOrOIjyA3HlcjqDZ3Y2e/oL3EZ1aGZ/wUBdY0PVKwRpy1gwHwBCMu/iEVNY
	 OVdXFFtkpuo4ycwfTko+vG2+JqLtrS9wQH1B7MBBJf1rMYqf9lHA9tPNLGm2TGjwmj4lA
	 GzYSujK2JOo7LOoRU+/7z92TSYN6sGZ+0t4asi4RMnh0mVQ1PTOVT6mTRH7UVrEzhjCIe
	 z1HkUZcuTbTELKhE7oulXcojgPeCwuVqMLV9oTlRjUgS/djM8oSTzq6V2kic+4res6mCN
	 eN7xhoLCMFZT4BxQIjt4vuy4Y+m85/a+6c9OrNf/lisQK8r9PAAPrKd2Ubj7WLZb7Zw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=d-silva.org;
	spf=pass smtp.mailfrom=d-silva.org;
	dkim=pass header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=j02+UmPS;
	arc=none smtp.remote-ip=119.15.109.137
Received: from www.nmnhosting.com (watt.d-silva.org [119.15.109.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A02C2606A31E
	for <linux-sunxi@lists.linux.dev>; Wed, 25 Nov 2026 21:05:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A02C2606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=d-silva.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=d-silva.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=j02+UmPS
Received: from Hawking.lan (hawking.lan [10.0.1.4])
	by www.nmnhosting.com (Postfix) with ESMTP id 4203E4C89A;
	Thu, 26 Nov 2026 08:05:32 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=d-silva.org; s=2025a;
	t=1795640732;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+7MuY/6UP2Bsh775A7XrC/mnlab/U/JJYl8O0EaI6UA=;
	b=j02+UmPSaqgpY9N9yYLyP5D4k9ACgdBnURpGXfJ2NTjIMMmsDjOSOhn0nvp7N3scF20geo
	d6biDUYWKWaSA3oOOpJSOlXppJYfguRIR7qwORiOKcWeR2n6b7T+eRd3zaIyYAxKnRVYry
	xNR/6z4/a3p9QSRPJG0Edt1KdF9wE4T6llSiBl9bMxPqApBFpHUxFk1jzar5HwoQM5GwQz
	uPBUeNP2epTo/YTunxSNwey2bgA3flRNN9bl8chnLuBsvOq5AgtEHS0AX16FuMaj9K6xuo
	YNTHQHtHo8NjR1Xc/q6YXV4/tfMYI+saS7f0SHKefS+iE6gT+WYZLz1kEevYQA==
X-GPT-Reason: legitimate; this is a technical software patch submission
	(Linux kernel style) matching the sender's personal domain
	(alastair@d-silva.org) and the recipient's personal domain
	(alastair@d-silva.org); the content is highly specific to hardware
	driver development (Allwinner A733 TRNG support) rather than marketing
	or a scam; there are no URLs, sense of urgency, or requests for sensitive
	information; and the message-ID is consistent with the sender's
	domain.
From: Alastair D'Silva <alastair@d-silva.org>
To: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S . Miller" <davem@davemloft.net>,
	Olivia Mackall <olivia@selenic.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-crypto@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Alastair D'Silva <alastair@d-silva.org>
Subject: [PATCH 0/4] hwrng: sun55i-ce: Add Allwinner A733 CE v5 TRNG support
Date: Thu, 26 Nov 2026 08:05:28 +1100
Message-ID: <20261125210532.695823-1-alastair@d-silva.org>
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

This series adds True Random Number Generator (TRNG) support for the
Allwinner Crypto Engine v5 on A523 and A733 SoCs, and enables it on the
Xunlong OrangePi 4 Pro.

Dependencies:
Patches 3 and 4 depend on the OrangePi 4 Pro bringup series:
  [PATCH 0/3] arm64: dts: allwinner: Add Xunlong OrangePi 4 Pro support
  Message-ID: <20261125124407.4098345-1-alastair@d-silva.org>

Tested on Xunlong OrangePi 4 Pro (/dev/hwrng).

Alastair D'Silva (4):
  dt-bindings: crypto: Add Allwinner A523/A733 Crypto Engine
  hwrng: sun55i-ce - Add Allwinner CE v5 TRNG driver
  arm64: dts: allwinner: sun60i-a733: Add Crypto Engine node
  arm64: dts: allwinner: sun60i-a733-orangepi-4-pro: Enable Crypto
    Engine

 .../crypto/allwinner,sun55i-a523-crypto.yaml  |  68 ++++
 MAINTAINERS                                   |   7 +
 .../allwinner/sun60i-a733-orangepi-4-pro.dts  |   4 +
 .../arm64/boot/dts/allwinner/sun60i-a733.dtsi |  12 +
 drivers/char/hw_random/Kconfig                |  13 +
 drivers/char/hw_random/Makefile               |   1 +
 drivers/char/hw_random/sun55i-ce-trng.c       | 377 ++++++++++++++++++
 7 files changed, 482 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/crypto/allwinner,sun55i-a523-crypto.yaml
 create mode 100644 drivers/char/hw_random/sun55i-ce-trng.c

-- 
2.53.0

