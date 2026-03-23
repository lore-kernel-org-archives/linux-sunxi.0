Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 842673C661C;
	Mon, 23 Mar 2026 17:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774286372; cv=none; b=ro4E8c09+8BgiqWs/hMLrPs0FVS3tr1IvZ72jHAEygDqrALFUVRpmK2eFEH9RRmpBRMrHQzBFmmac60wmw/AwQRvtlTIT+K85bL5cjOc4RBzKbm8DXk69OkQ6yWJ5eRk3XLogaVdc278E5i97x74YO7tLcGl16JpI8n9w3HGCrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774286372; c=relaxed/simple;
	bh=/iM84VPZCJwEWriacUA4NUmZx+hreQbQHgkrGVWtHdc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=F0u7PuCd9fEpF2lLp0HnD4neJJQobgQD3QlWS19IfGDM6I/yv3ToTfHcVdzXdA5takRbfMwY2wfeqEDORHPLcMROZO97AYmvFqOHowY83cMjNSUa3IPedUaYAqkrPqcbZBBWVAB1c6xwu83IN2TdWisisyeqNAUBiXuBEbC8tw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fhONbQEk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fhONbQEk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4B95C4CEF7;
	Mon, 23 Mar 2026 17:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774286371;
	bh=/iM84VPZCJwEWriacUA4NUmZx+hreQbQHgkrGVWtHdc=;
	h=From:To:Cc:Subject:Date:From;
	b=fhONbQEkPslS3qtm+EAtHY/CfcG2+pp+oN5Vm2hcMwJKdy6R65wRJpCWLHk94jN8Q
	 guJUpXg3mn534+8/AbzAKAGBiey3O6z7mBvbroUA22zg/lL/JfTntc/An/ZDboiMeo
	 HwD3jYT+DAmFqlfmEHLgZD5K/lD2DEAyMhq5KLPgUnslrXpROYsAcdDRkUSScv07ri
	 zOxNFN0huRjCBSOyxk58d+AptK9sIqM3cw485Qd0+DWmKzLv45RMEc/KRsrC+MNvu7
	 19em4OyG93NLEklgPn8MoCTlaKRQkvthFps6YfLXZVgZLdDiK8cZe2zE9bNobT1dsi
	 loxQec1NGKi/A==
Received: by wens.tw (Postfix, from userid 1000)
	id 9ED165FBE4; Tue, 24 Mar 2026 01:19:28 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: allwinner: sun55i: Fix r-spi DMA
Date: Tue, 24 Mar 2026 01:19:26 +0800
Message-ID: <20260323171927.1256507-1-wens@kernel.org>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

r-spi has DRQs for both the main and MCU DMA controllers on the A523 SoC
family, however it seems it that it is mainly routed to the MCU DMA
controller, with no obvious way to change it.

Change the DMA channels of r-spi to the MCU so that it works properly.

Fixes: 1bec3bd1f839 ("arm64: dts: allwinner: sun55i: Add SPI controllers")
Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
---
 arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
index 56d4e5862ff4..34d7547a6004 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
@@ -1018,7 +1018,7 @@ r_spi0: spi@7092000 {
 			interrupts = <GIC_SPI 172 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&r_ccu CLK_BUS_R_SPI>, <&r_ccu CLK_R_SPI>;
 			clock-names = "ahb", "mod";
-			dmas = <&dma 53>, <&dma 53>;
+			dmas = <&mcu_dma 13>, <&mcu_dma 13>;
 			dma-names = "rx", "tx";
 			resets = <&r_ccu RST_BUS_R_SPI>;
 			status = "disabled";
-- 
2.47.3

