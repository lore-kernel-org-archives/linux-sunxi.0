Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6F1D39DBC2;
	Tue, 24 Mar 2026 16:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774369176; cv=none; b=cCylQZiW0EtPdBOqCfBqoFP9EJHWtlOQx7OaojzEvXcH1DTxI/nsRdKWX5ECJAPSpxbl4YhYovdxldMi2IyOHcF8LWhCaRJM+93qOkziq9aFNvCJmW6WHxPUUSxSAZvfEMhIU7JR/rErQrfjcnCtFG8UniJmRvj2+AsG3aHYaX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774369176; c=relaxed/simple;
	bh=U0PWUj5062qmvlDAU2epmm8GpkD59Wxm5HsjIIPSxV4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mWeYpoiXNd/05sbQXZPLNw3Z1FUQuFzgTV5FrtH84eMLCcpctmJvmPkBbT9BQ1fajqL5HpCi41yrb6z5bNAAeXCZjpio29Dwb6YcNPLoF0KZviZZSumYu/Ky/pa2BZh2N1sr/ukGTw8I/PXLWDcM8WEfgCeVdNd+WThQi+FNul0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uvA1HOhI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uvA1HOhI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E2D5C2BC87;
	Tue, 24 Mar 2026 16:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774369176;
	bh=U0PWUj5062qmvlDAU2epmm8GpkD59Wxm5HsjIIPSxV4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uvA1HOhIBtBO7Yv650j/0h/keBcN/53WmUpxl1IbKtHIEr87KOQqE1D/qrJ2mxaeE
	 3lnezfXcpXRvflK+pQaH6MGxhmrxcdI7lX4Mv5GVBJItwETf24VvK+hkI4WK6W9e70
	 T6i7Ao0QzIvk/udX0vy27OxoH5KgdUJJHXskswL9bsB70E34/1Li09efTCJxQL1LnG
	 vYI3s16rtCau89257hZBOlxkeYE1Y/ex5rFsyLy1YnwKfKnj1qbSOBa01qcNkTdU5O
	 eIdxU730QjKiCI3s1G4YYf+dRpildUV8tGPY6Nss8TiwOoK/FHILC+PfuHrorFZXXQ
	 MhtEFUtB/ldCw==
Received: by wens.tw (Postfix, from userid 1000)
	id 0ACB05F941; Wed, 25 Mar 2026 00:19:33 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] arm64: dts: allwinner: sun50i-h6: add UART DMA channels
Date: Wed, 25 Mar 2026 00:19:29 +0800
Message-ID: <20260324161930.1602083-2-wens@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260324161930.1602083-1-wens@kernel.org>
References: <20260324161930.1602083-1-wens@kernel.org>
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
 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
index 73e8604315c5..72ce1a75647b 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
@@ -540,6 +540,8 @@ uart0: serial@5000000 {
 			reg-io-width = <4>;
 			clocks = <&ccu CLK_BUS_UART0>;
 			resets = <&ccu RST_BUS_UART0>;
+			dmas = <&dma 14>, <&dma 14>;
+			dma-names = "tx", "rx";
 			status = "disabled";
 		};
 
@@ -551,6 +553,8 @@ uart1: serial@5000400 {
 			reg-io-width = <4>;
 			clocks = <&ccu CLK_BUS_UART1>;
 			resets = <&ccu RST_BUS_UART1>;
+			dmas = <&dma 15>, <&dma 15>;
+			dma-names = "tx", "rx";
 			status = "disabled";
 		};
 
@@ -562,6 +566,8 @@ uart2: serial@5000800 {
 			reg-io-width = <4>;
 			clocks = <&ccu CLK_BUS_UART2>;
 			resets = <&ccu RST_BUS_UART2>;
+			dmas = <&dma 16>, <&dma 16>;
+			dma-names = "tx", "rx";
 			status = "disabled";
 		};
 
@@ -573,6 +579,8 @@ uart3: serial@5000c00 {
 			reg-io-width = <4>;
 			clocks = <&ccu CLK_BUS_UART3>;
 			resets = <&ccu RST_BUS_UART3>;
+			dmas = <&dma 17>, <&dma 17>;
+			dma-names = "tx", "rx";
 			status = "disabled";
 		};
 
-- 
2.47.3

