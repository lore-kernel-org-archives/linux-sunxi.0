Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795713788;
	b=H3l6VhoElpwptA4B006PPXuenVXPyiUdU9YLB0n8Ku/KQI4Fi2idpNlkkYxzROM+maAq
	 ZbBIliDb3wbIZBh6XbZrVKAbwEivxiiMeF433w45IwdKGD+X90hAhB2mbAtV77uVY9a4T
	 zo7yJi9uEKBDP1xx0TsPXxUlQnd+4xWRpN+gj9DHXeK0aP5UT2Gzl5r7DDrzCmSSLyABo
	 JcTETYkzMolC3fx+qDoePV7ns7kCoes76dSANNplDQRL55+S74e0hocEG5/IKHPeI6Miq
	 XnVlDeEli8+Ft1OuDxNTmVplCJfdkrFkeZ0Ndu+xoxf4lFho61N8iulgpSnOzSCxOeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795713788;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=dLkNPiv/xl+P6umWyR3G+hlZbr8X7kcPVrM7p4myao0=;
	b=ibhf1Dje17IyB8YYjBmLWc19bKoK/DPu6bC9tm2P3N+BE9lBlXTjcI/sR1OuKQcWMffj
	 pi+548fRMXA7xMUYWhVOv2uNrJTKVkZI6ye6Ir6W8vI+uESGAB/uklr4H7pG70eOXISnn
	 BwAZ4wh3hB8VagTa/SX16/aut/bPtKuhDPBoy4ovEzLAz57A7MTf1HyYtkKl4zc5KyzOl
	 aBdQQGUWi8megKL8NviOH39G92WAnQY05ipd12Yky/EE9e+mjboLDNi7F3+sTVmMO9vDg
	 8fYUcoPAVWKd5NkOB8X7mNOngtiLAfxvALVDQ1bxTYKf/iqswOdYK+WU5v3G9ThQPXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=A6Fv5VIS;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E959606A329
	for <linux-sunxi@lists.linux.dev>; Thu, 26 Nov 2026 17:23:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E959606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=A6Fv5VIS
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0A7861C2B;
	Thu, 26 Nov 2026 09:23:05 -0800 (PST)
Received: from e142021.manchester.arm.com (e142021.arm.com [10.33.50.35])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 91FDC3F632;
	Thu, 26 Nov 2026 09:23:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795713787; bh=UW0HYlQy3YHqOrhT+H8MjwdGt+BCMyK7r7KTgbmojD4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=A6Fv5VISVzg+Oz5+JGSGNdmUl7cufPYWJW2/p60njZlDwyLdfcAucKu3i5pxV4rDb
	 CZ8LD3C1SsKElpB2x4pUBQUPPLI4WQYqFV7fp2MHUkunbuLhlRCO8w300sK10CcmTY
	 wOXWtcKlEeZ5e1YNlelDHmD9us4YyLOpxwNhkYlE=
From: Andre Przywara <andre.przywara@arm.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Alastair D'Silva <alastair@d-silva.org>,
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>,
	Pablo Mazzini <pmazzini@gmail.com>,
	Enzo Adriano <enzo.adriano.code@gmail.com>
Subject: [PATCH 1/2] arm64: dts: allwinner: a733: add r_i2c1 pins
Date: Thu, 26 Nov 2026 17:22:52 +0000
Message-ID: <20261126172253.1097838-2-andre.przywara@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261126172253.1097838-1-andre.przywara@arm.com>
References: <20261126172253.1097838-1-andre.przywara@arm.com>
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

The Radxa Cubie A7A board connects an external RTC chip to the R_I2C1
pins (S_TWI1 in the schematic).
Add the pinctrl subnode to the secondary GPIO controller, to allow using
those pins in a board .dts.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 arch/arm64/boot/dts/allwinner/sun60i-a733.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun60i-a733.dtsi b/arch/arm64/boot/dts/allwinner/sun60i-a733.dtsi
index 8a258f16751e6..fe1abee701310 100644
--- a/arch/arm64/boot/dts/allwinner/sun60i-a733.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun60i-a733.dtsi
@@ -585,6 +585,13 @@ r_i2c0_pl_pins: r-i2c0-pl-pins {
 				function = "r_i2c0";
 				allwinner,pinmux = <2>;
 			};
+
+			/omit-if-no-ref/
+			r_i2c1_pl_pins: r-i2c1-pl-pins {
+				pins = "PL12", "PL13";
+				function = "r_i2c1";
+				allwinner,pinmux = <3>;
+			};
 		};
 
 		r_uart0: serial@7080000 {
-- 
2.43.0

