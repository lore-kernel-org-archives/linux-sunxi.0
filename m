Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=119.15.109.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795766817;
	b=brW8vvH/25+/VqrUsva6+AU5MbSYOYgil2i9+t+LHPFmq8Djdt2stYafKbo4+PAg21a8
	 6R+AprNwWQ7sQ1POl+lhhaIEjMrw8IOI9kpo2U+cok+Xn/XBFbRt34ZjV3JR/3VdIahOV
	 IirbZ3Gt03Uuzs5XIMrWxoP8k7YicZxMSjOM6eR65KrGfaoccCC+/ZykIj1BCc0XxWCiF
	 XNyMzonxN5kG5axmtO2nBVJtuZsjrhyN16lqYLtwXVn4qT8cQY5wKGu5DTZIE8fslUuIR
	 AeJdz1x8o2438nanlcUBrQXjZUG5NzyMv2QrheoHQ7MXWQMvAOw0/oFMW1U59W5vOBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795766817;
	h=DMARC-Filter:Received:DKIM-Signature:X-GPT-Reason:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=gvWBA1mhx8ibYVBggwemKsSLz8VkwDf35wvv7VpFuF4=;
	b=QffR6w6dF9wcmUCijUFrVP7y61LWHOoECCsr+HeqoPoex/uKvnl0HhGNxZaNsFGeLALp
	 iUtpyeiPd6fTdUwT6h44r0WM57pNDbjwkvWVoOAPZ+rlMwZKNfE2CVyl2jIokbKOvN8pd
	 UTDGUkhednrxG5ZaREhtCML9w9doNLilW9Ihd2ogaxuVgNkimvSt+yKsL6LZEZ2qzIuVO
	 EaBi5y0ZfACp29sfX50vQq+c2Qwg/NVPRP8d3+xz6UkQZERnFj9ZA6pJr7Zt7EP1i7PQq
	 2Pg+px1a96IGJs/r9gldjUSL3Knd41EtvXnOzukdypbGPzpudHx9QZa3UaI0CbfkKYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=d-silva.org;
	spf=pass smtp.mailfrom=d-silva.org;
	dkim=pass header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=NKiQWi6G;
	arc=none smtp.remote-ip=119.15.109.137
Received: from www.nmnhosting.com (watt.d-silva.org [119.15.109.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3271B606A31E
	for <linux-sunxi@lists.linux.dev>; Fri, 27 Nov 2026 08:06:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3271B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=d-silva.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=d-silva.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=NKiQWi6G
Received: from Hawking.lan (hawking.lan [10.0.1.4])
	by www.nmnhosting.com (Postfix) with ESMTP id 2D6D74C972;
	Fri, 27 Nov 2026 19:06:49 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=d-silva.org; s=2025a;
	t=1795766809;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=gvWBA1mhx8ibYVBggwemKsSLz8VkwDf35wvv7VpFuF4=;
	b=NKiQWi6GIrzDGR2pthCqjgdeHpEK1h48kycZnGQ7Ij9HtRGZZYqaQzFhr33YzIhXsi1wtz
	Hrb3hB6WyphdOfO4PgxapHCaxHo4CpfbhEYOPBZoKuJBa9aZNXnsV/ljO+tPh2cTY/z6px
	ZdnS0wSCDQOPZihsbANHOh0Nyb40lS3tWMWiALnJrcQsB4VydiV4h3H1rV6EuJQ1hNtuUX
	HcFoKpCA2XAkHSBIa34g6fCWIQFwDQxpX2+Jk7pqaneaEMiu9Dz6/7NlRykG5OtEE4/eN5
	wB7z1OQGZNxmcuAsT/zGrX5JHiikTexn8pVu91UgyrPGXTvlUmbMzUvjI848ow==
X-GPT-Reason: legitimate; the message is a technical software patch
	for the Linux kernel, which is consistent with the personal mailbox
	of a developer (alastair@d-silva.org); the sender domain matches
	the recipient domain; the links provided point to the well-known
	kernel.org mailing list platform; there are no markers of marketing,
	phishing, or urgency.
From: Alastair D'Silva <alastair@d-silva.org>
To: Hans de Goede <hansg@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Alastair D'Silva <alastair@d-silva.org>
Subject: [PATCH 0/3] arm64: dts: allwinner: sun60i-a733: Add simplefb HDMI support
Date: Fri, 27 Nov 2026 19:06:46 +1100
Message-ID: <20261127080649.1982883-1-alastair@d-silva.org>
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

This series adds boot-time simplefb HDMI support for Allwinner A733
(sun60i-a733). U-Boot enables DE3.5, TCON_TV0, and DW-HDMI2.0 and
updates the disabled /chosen/framebuffer-hdmi node. Linux keeps the
display clocks and PCK-600 power domains active across boot.

Tested on Xunlong OrangePi 4 Pro, based on:
  [PATCH 0/3] arm64: dts: allwinner: Add Xunlong OrangePi 4 Pro support
  https://lore.kernel.org/r/20261125124407.4098345-1-alastair@d-silva.org
  [PATCH] pmdomain: sunxi: pck600: Initialize pd->pck in probe
  https://lore.kernel.org/r/20261127080625.1982574-1-alastair@d-silva.org

Alastair D'Silva (3):
  dt-bindings: display: simple-framebuffer: Add Allwinner DE3.5 HDMI
    pipeline
  arm64: dts: allwinner: sun60i-a733: Add PCK-600 power domain
    controller
  arm64: dts: allwinner: sun60i-a733: Add simplefb HDMI node

 .../bindings/display/simple-framebuffer.yaml  |  1 +
 .../arm64/boot/dts/allwinner/sun60i-a733.dtsi | 36 +++++++++++++++++++
 2 files changed, 37 insertions(+)

prerequisite-patch-id: 309a5a3ca5b216915907263dea7024263abf1d1c
prerequisite-patch-id: 55e543b9854c7ae2fa86969233d05ccadd3792e9
prerequisite-patch-id: cfcad85224e288ec2168e7f245b4a1c63e9a34a7
-- 
2.53.0

