Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8598287276
	for <linux-sunxi@lists.linux.dev>; Tue,  1 Jul 2025 20:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751401289; cv=none; b=i+NDdxJanZTulIedZe4a6OLEGUTwv7+x5XDDO4fw20hITlpKsCEab5qoqF8ZS10oFkADUisSvd9SBpf10LLyttAj1MXe7d/pPt0INo021i1JHcJiKXaTL19/3qBCD63enjulXJwnRWpZctjdR692aVu3L34/7ncjtMFD6hG5wzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751401289; c=relaxed/simple;
	bh=steg6a1+hCtR+jKLPj2Ing5gOSLfQT7l3xm3wI/UNGo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uOVioTfJd7+xlCE2gPaqU8rtRQdVPGWmcK5yqp3Q2vNsgw8UtlyuTDzUSB/QeX4ghhkXB630wnZRAPsXcHAJeUf9vhn6rCXY7LqUbnh+ijUyRd80KymCZ2Wr5cVAGk6EZZ0vOvw66bRVwJPQYw3pC1imuREo2mA7L716Dg5mYkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id F2F531F0004D
	for <linux-sunxi@lists.linux.dev>; Tue,  1 Jul 2025 20:21:25 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 7C553AC96BC; Tue,  1 Jul 2025 20:21:25 +0000 (UTC)
X-Spam-Level: *
Received: from localhost.localdomain (unknown [192.168.1.64])
	by laika.paulk.fr (Postfix) with ESMTP id 07126AC9684;
	Tue,  1 Jul 2025 20:15:44 +0000 (UTC)
From: Paul Kocialkowski <paulk@sys-base.io>
To: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Kocialkowski <paulk@sys-base.io>
Subject: [PATCH 2/2] ARM: dts: sun8i: v3: Add RGB666 LCD PD pins definition
Date: Tue,  1 Jul 2025 22:15:34 +0200
Message-ID: <20250701201534.815513-2-paulk@sys-base.io>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250701201534.815513-1-paulk@sys-base.io>
References: <20250701201534.815513-1-paulk@sys-base.io>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The V3 supports RGB666 LCD output on PD pins, which are not available
on the V3s package.

Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
---
 arch/arm/boot/dts/allwinner/sun8i-v3.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/allwinner/sun8i-v3.dtsi b/arch/arm/boot/dts/allwinner/sun8i-v3.dtsi
index 186c30cbe6ee..95bd0b616349 100644
--- a/arch/arm/boot/dts/allwinner/sun8i-v3.dtsi
+++ b/arch/arm/boot/dts/allwinner/sun8i-v3.dtsi
@@ -56,6 +56,15 @@ i2s0_pins: i2s0-pins {
 		function = "i2s";
 	};
 
+	/omit-if-no-ref/
+	lcd_rgb666_pd_pins: lcd-rgb666-pd-pins {
+		pins = "PD0", "PD1", "PD2", "PD3", "PD4", "PD5",
+		       "PD6", "PD7", "PD8", "PD9", "PD10", "PD11",
+		       "PD12", "PD13", "PD14", "PD15", "PD16", "PD17",
+		       "PD18", "PD19", "PD20", "PD21";
+		function = "lcd";
+	};
+
 	uart1_pg_pins: uart1-pg-pins {
 		pins = "PG6", "PG7";
 		function = "uart1";
-- 
2.49.0

