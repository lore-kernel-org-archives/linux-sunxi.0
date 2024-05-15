Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE4294F213
	for <linux-sunxi@lists.linux.dev>; Wed, 15 May 2024 23:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715817037; cv=none; b=I7nflggzPnG+iJxoHbN1Mh+La5UX7GBTbXg7cmTCCkjJEJo5+sqeuXQftVwsbHKTBA8Efib4fcjkm2GAmr6Svvoc2GPxnpzP+QtnvqdNf/oUnlfeSDMVdKSIcOvd9n84QRwglp+lPplp9mT7qAQZge9WDq61jjBUKs249CWM/bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715817037; c=relaxed/simple;
	bh=rMFQpRBQtROmPZxBA0gxbO848Q+ON3pN6JKx1Q6etL0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=qUm7Hc0KcvNp4kqQg6luXbHtd5jRXxOJYXM5lp1iSIfp4Ro4SU604NyhDZTgcsO7zO70c3HoIqFK10c9OVGEjV8k3U0AfFN8Me1QF6hrXUlJVbFWWiefTXzS7N/bkUW6ZZyo1TSfUDdrOJEMSRU3IC1Gy9HdGkzezxmYMb3IKEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D925ADA7;
	Wed, 15 May 2024 16:50:59 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1163D3F641;
	Wed, 15 May 2024 16:50:33 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Samuel Holland <samuel@sholland.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH] arm64: dts: allwinner: Fix PMIC interrupt number
Date: Thu, 16 May 2024 00:48:52 +0100
Message-Id: <20240515234852.26929-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.35.8
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The "r_intc" interrupt controller on the A64 uses a mapping scheme, so
the first (and only) NMI interrupt #0 appears as interrupt number 32
(cf. the top comment in drivers/irqchip/irq-sun6i-r.c).

Fix that number in the interrupts property to properly forward PMIC
interrupts to the CPU.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
Fixes: 4d39a8eb07eb ("arm64: dts: allwinner: Add Jide Remix Mini PC support")
---
Hi,

I didn't notice this before because I changed the interrupts property in
the U-Boot copy of the DT, to comply with the old binding, where it is
actually IRQ 0, and then used that DTB.

Cheers,
Andre

 arch/arm64/boot/dts/allwinner/sun50i-h64-remix-mini-pc.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h64-remix-mini-pc.dts b/arch/arm64/boot/dts/allwinner/sun50i-h64-remix-mini-pc.dts
index b6e3c169797f0..0dba413963776 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h64-remix-mini-pc.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h64-remix-mini-pc.dts
@@ -191,7 +191,7 @@ axp803: pmic@3a3 {
 		compatible = "x-powers,axp803";
 		reg = <0x3a3>;
 		interrupt-parent = <&r_intc>;
-		interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_LOW>;
+		interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_LOW>;
 		x-powers,drive-vbus-en;
 
 		vin1-supply = <&reg_vcc5v>;
-- 
2.35.8

