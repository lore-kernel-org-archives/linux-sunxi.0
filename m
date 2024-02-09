Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 753232E821
	for <linux-sunxi@lists.linux.dev>; Fri,  9 Feb 2024 11:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707479894; cv=none; b=Pz8YaxUhEKNdz6IQ0DPjghaTD1fejSpiYq0oK8vWq9qtrUuS3VlS/+RWFN9+YrxABaI8Gfm0BuLopfZLO840DTk9sGFUlX5iLcBk6UgXAkmbv5zbT+Plu4J6NVdTv+M+JUEubG9GevLoY1QCM81R5R+zSqcJ3hGkg6JllfzoVJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707479894; c=relaxed/simple;
	bh=ziVQhHbq0fKd+mRLuz6aLD8afKCWIAh3B+dAx+f0ObI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eBZQjeGAUtcuY/EIg5DRKoHS2+gA5ctotCn89GPnAHm1ASLv5wFSIKtxDaxVdAM2RuCCzrYZE4d0eRaktIYvr/OCevuI4XEhzKshOEwKUepKGzOsVL+zSM1RsNhOZ9/lfLzcLhKyjLPR1aNmq5taZgHdFVByAFX5XI0wvRLMMRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6A20FFEC;
	Fri,  9 Feb 2024 03:58:48 -0800 (PST)
Received: from donnerap.arm.com (donnerap.manchester.arm.com [10.32.100.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D018D3F5A1;
	Fri,  9 Feb 2024 03:58:04 -0800 (PST)
From: Andre Przywara <andre.przywara@arm.com>
To: Jernej Skrabec <jernej.skrabec@gmail.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Nick Alilovic <nickalilovic@gmail.com>
Subject: [PATCH v2 1/2] arm64: dts: allwinner: h616: Add 32K fanout pin
Date: Fri,  9 Feb 2024 11:57:58 +0000
Message-Id: <20240209115759.3582869-2-andre.przywara@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240209115759.3582869-1-andre.przywara@arm.com>
References: <20240209115759.3582869-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On some boards the designers saved on a 32KHz crystal for some external
chips, so the SoC has to help out, with providing a 32 KHz clock signal.

Add a pinctrl group node to allow DT nodes to reference this fanout signal.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
index d549d277d9729..12ffabc79bcde 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
@@ -256,6 +256,12 @@ uart1_rts_cts_pins: uart1-rts-cts-pins {
 				pins = "PG8", "PG9";
 				function = "uart1";
 			};
+
+			/omit-if-no-ref/
+			x32clk_fanout_pin: x32clk-fanout-pin {
+				pins = "PG10";
+				function = "clock";
+			};
 		};
 
 		gic: interrupt-controller@3021000 {
-- 
2.25.1

