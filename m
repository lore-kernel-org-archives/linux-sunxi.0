Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E49243A0E81;
	Tue, 24 Mar 2026 16:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774369177; cv=none; b=LZcR0eEOud8Kw9/DM/5uSykYM/hM1GwpJ4UsDDRfMiLKoudHv7CUt4HS9niGFuzmL8J3ZGgXi6n3PCw45zfa1ihFxzHfX0Og2OqXZM+W6dfhAGbHtY60N8GiELCIA+vcvuGDKe+2r4UUb6Jp8wZNiFQ6vWrdrsdHuFkPXYM2ffc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774369177; c=relaxed/simple;
	bh=OOoOHuRKnfY4pEIgmq0rR3HB4Sgy5RohzLtXdcbQlig=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DLPr5y1YmEu8qaMyTGPk+rSBi2Cc8mozfIaU6EaNW9xmFPrIcLrLXHpD1IMsYNSHxFqpmSJguRkkN4B2Q8+sfvHT4lJOP8EI+v4qKeTwrJnrGGVob4BEzbDo0Ql3DO/FViGTiT9sFWVzTxXKTWZhKaZs6+TNXMzpXhYdcyXwefA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=popDtLTe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="popDtLTe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79A06C19424;
	Tue, 24 Mar 2026 16:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774369176;
	bh=OOoOHuRKnfY4pEIgmq0rR3HB4Sgy5RohzLtXdcbQlig=;
	h=From:To:Cc:Subject:Date:From;
	b=popDtLTeN25BTHrI27WnsvkVsSv8K+tiyhbH7yJVKfjRGFDKC3yv3MnF+UxqeGDJt
	 P0YeqRYwMDfjrAxQ8+RbOTJHlTwD7722oJtR5LTGt2LFPe4C/vvC+ZvLSNfmy72Es3
	 r33085vOTy+LeoIsXtvIS9wCyEUDJgyHk9w74SToFX6uNMtrvlNdGdD+5Zjb/Jbu7X
	 zb//NFvP6NpJr0RDU62HSqVzdql0C1npAc7inhWzXoMPWsEeBt0tLZjORXRtq0bxh9
	 QMH6K7qSWLoxH76f7isidoB95UGc2veq4UoXvP/4scN44Uz9txxxRq0GZXPXGHNjcQ
	 2w5ztWgtZD46w==
Received: by wens.tw (Postfix, from userid 1000)
	id E883F5FEB2; Wed, 25 Mar 2026 00:19:33 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] arm64: dts: allwinner: sun50i-a64: add UART DMA channels
Date: Wed, 25 Mar 2026 00:19:28 +0800
Message-ID: <20260324161930.1602083-1-wens@kernel.org>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All the UARTs support DMA and are hooked up to the DMA controller.

Add the DMA channels for the UARTs

Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
---
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
index 0fecf0abb204..04a26762a19a 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
@@ -1000,6 +1000,8 @@ uart0: serial@1c28000 {
 			reg-io-width = <4>;
 			clocks = <&ccu CLK_BUS_UART0>;
 			resets = <&ccu RST_BUS_UART0>;
+			dmas = <&dma 6>, <&dma 6>;
+			dma-names = "tx", "rx";
 			status = "disabled";
 		};
 
@@ -1011,6 +1013,8 @@ uart1: serial@1c28400 {
 			reg-io-width = <4>;
 			clocks = <&ccu CLK_BUS_UART1>;
 			resets = <&ccu RST_BUS_UART1>;
+			dmas = <&dma 7>, <&dma 7>;
+			dma-names = "tx", "rx";
 			status = "disabled";
 		};
 
@@ -1022,6 +1026,8 @@ uart2: serial@1c28800 {
 			reg-io-width = <4>;
 			clocks = <&ccu CLK_BUS_UART2>;
 			resets = <&ccu RST_BUS_UART2>;
+			dmas = <&dma 8>, <&dma 8>;
+			dma-names = "tx", "rx";
 			status = "disabled";
 		};
 
@@ -1033,6 +1039,8 @@ uart3: serial@1c28c00 {
 			reg-io-width = <4>;
 			clocks = <&ccu CLK_BUS_UART3>;
 			resets = <&ccu RST_BUS_UART3>;
+			dmas = <&dma 9>, <&dma 9>;
+			dma-names = "tx", "rx";
 			status = "disabled";
 		};
 
@@ -1044,6 +1052,8 @@ uart4: serial@1c29000 {
 			reg-io-width = <4>;
 			clocks = <&ccu CLK_BUS_UART4>;
 			resets = <&ccu RST_BUS_UART4>;
+			dmas = <&dma 10>, <&dma 10>;
+			dma-names = "tx", "rx";
 			status = "disabled";
 		};
 
-- 
2.47.3

