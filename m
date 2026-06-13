Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DED082F9D98
	for <linux-sunxi@lists.linux.dev>; Sat, 13 Jun 2026 15:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781364454; cv=none; b=TT8JuGdmcgVn9Jfhg1xrUkFn2ROGPWemYBCHN9HR5jqWoedl26B2k6743uWf6FzFSFCGMZhXqhMKudMsaqybego1eBczP9ILR39a9+stNICNTtHuv11JlRNQUcQg2nbw9lYXNKuNMcBXYKFDPJAoUlbu71CnSe35f4SHV/sfGBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781364454; c=relaxed/simple;
	bh=/31T6WAMjIR7AN2S3ymAQtgatmirOtaIef3/rrgW8Cw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B0GnXIHDiREdC6fJcxSQ5eSfWJesSuc15EgyBAQ0KbdTIbqaI9wuSUmo3WZoGXfQOXQpWJuGdduLXdZVPUqnClEZ1W9OHMgbp+HcDBk5ZhauLXlNLlVK+FHeCdta7q6io9Qc5b2V8i3D5ttCHLef0uhadlWhkTx562/fIdeQUzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id BF13C370030C
	for <linux-sunxi@lists.linux.dev>; Sat, 13 Jun 2026 15:27:17 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 07726B4551A; Sat, 13 Jun 2026 15:27:15 +0000 (UTC)
X-Spam-Level: **
Received: from collins (unknown [192.168.1.64])
	by laika.paulk.fr (Postfix) with ESMTP id 86935B45520;
	Sat, 13 Jun 2026 15:26:58 +0000 (UTC)
From: Paul Kocialkowski <paulk@sys-base.io>
To: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Yong Deng <yong.deng@magewell.com>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Maxime Ripard <mripard@kernel.org>,
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: [PATCH v10 3/6] ARM: dts: sun8i: v3s: Add mbus node to represent the interconnect
Date: Sat, 13 Jun 2026 17:26:52 +0200
Message-ID: <20260613152655.212490-4-paulk@sys-base.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260613152655.212490-1-paulk@sys-base.io>
References: <20260613152655.212490-1-paulk@sys-base.io>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

The V3s uses the mbus interconnect to provide DRAM access for a
number of blocks. The SoC can only map 2 GiB of DRAM, which is
reflected in the dma-ranges property.

Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Reviewed-by: Samuel Holland <samuel@sholland.org>
---
 arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi b/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi
index fa54510319ac..02d6c62b3874 100644
--- a/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi
+++ b/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi
@@ -629,6 +629,21 @@ int_mii_phy: ethernet-phy@1 {
 			};
 		};
 
+		mbus: dram-controller@1c62000 {
+			compatible = "allwinner,sun8i-v3s-mbus";
+			reg = <0x01c62000 0x1000>,
+			      <0x01c63000 0x1000>;
+			reg-names = "mbus", "dram";
+			clocks = <&ccu CLK_MBUS>,
+				 <&ccu CLK_DRAM>,
+				 <&ccu CLK_BUS_DRAM>;
+			clock-names = "mbus", "dram", "bus";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			dma-ranges = <0x00000000 0x40000000 0x80000000>;
+			#interconnect-cells = <1>;
+		};
+
 		spi0: spi@1c68000 {
 			compatible = "allwinner,sun8i-h3-spi";
 			reg = <0x01c68000 0x1000>;
-- 
2.54.0

