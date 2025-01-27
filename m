Received: from mail.netcube.li (mail.netcube.li [173.249.15.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1688E192D86
	for <linux-sunxi@lists.linux.dev>; Mon, 27 Jan 2025 20:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.249.15.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738009310; cv=none; b=u8tmy5busGxn4YOjPJ5W/eGL2cGRCmKeuOTnUxYXTa3gdXczDOh2WfNMheTP7XaSbv3pcwfpS+PsRpwLThYEJLb4HDKxvQYETyDoW5n3QyL2FDXsbAF/EG5WMI7VagTJ+x+oR8PE1XIbdQgRvVurw2dyeMpXDJ8YybqUFKwo6CY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738009310; c=relaxed/simple;
	bh=z5DJ+7tRWnP86mThktUdcx4Y02EVex9RDatuvcIZmZ8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GMAfGUAKUGAv7fqW6VqT1CuwOx3PBbr80AsGLq8/O06dkJLOvaIcUKfJ5/UGij5vel0VIE73fxzRrYgmADROZ651UcLzhfX/kN5y71ijZkd6vWQWdidq1+66q7kAmU94Tghma9OY7wuXPZSMKRVA/UMIBHtitKND8oiqisqUJOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=netcube.li; spf=pass smtp.mailfrom=netcube.li; dkim=pass (1024-bit key) header.d=netcube.li header.i=@netcube.li header.b=sCXa1/5H; arc=none smtp.client-ip=173.249.15.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=netcube.li
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netcube.li
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=netcube.li header.i=@netcube.li header.b="sCXa1/5H"
dkim-signature: v=1; a=rsa-sha256; d=netcube.li; s=s1;
	c=relaxed/relaxed; q=dns/txt; h=From:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Transfer-Encoding:In-Reply-To:References;
	bh=7LpuIfgFkcg7deKdxaYs8XgeKDBHsfgB22qLaTM8G20=;
	b=sCXa1/5HNH0+VodExpV+nDF3we8MCJkjLPQjDNIn6qUdVrtiuhU2S/YIaR3FWpoRBUgM9aKKDNhTrEE89mObEEr+TjXAjL60xaOqomXiDB4TQ7VtE/uvHVAx/BOHeaAv1VPIiB8jD2cQ5QlrM1uVrC+OF+FlPx+EUl8B5z1RDyY=
Received: from lukas-hpz440workstation.lan.sk100508.local (cm70-231.liwest.at [212.241.70.231])
	by mail.netcube.li with ESMTPSA
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256)
	; Mon, 27 Jan 2025 21:21:38 +0100
From: Lukas Schmid <lukas.schmid@netcube.li>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>
Cc: Lukas Schmid <lukas.schmid@netcube.li>,
	Andre Przywara <andre.przywara@arm.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 3/4] ARM: dts: sunxi: add uart1_pe pinctrl for sun8i-v3s
Date: Mon, 27 Jan 2025 21:21:24 +0100
Message-Id: <20250127202127.971172-4-lukas.schmid@netcube.li>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250127202127.971172-1-lukas.schmid@netcube.li>
References: <20250127202127.971172-1-lukas.schmid@netcube.li>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Added the uart1_pe_pins pinctrl for use by the NetCube
Systems Kumquat board

Signed-off-by: Lukas Schmid <lukas.schmid@netcube.li>
Reviewed-by: Andre Przywara <andre.przywara@arm.com>
---
 arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi b/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi
index 9e13c2aa8911..f909b1d4dbca 100644
--- a/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi
+++ b/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi
@@ -416,6 +416,12 @@ uart0_pb_pins: uart0-pb-pins {
 				function = "uart0";
 			};
 
+			/omit-if-no-ref/
+			uart1_pe_pins: uart1-pe-pins {
+				pins = "PE21", "PE22";
+				function = "uart1";
+			};
+
 			uart2_pins: uart2-pins {
 				pins = "PB0", "PB1";
 				function = "uart2";
-- 
2.39.5


