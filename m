Received: from s106b.cyber-folks.pl (s106b.cyber-folks.pl [195.78.66.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60FD27404E;
	Tue, 28 Apr 2026 16:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.78.66.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777393773; cv=none; b=Ld+Z7vEd4HBGEzc8TOUwjt8VuhOXlETExVkoIrWSpDh/P5VfbKpm5eI4nKoNv2+IQIisAE2Yun/3Xp7CqYEkfvR/gjV3JXcg+AckrsB8DwYcla3z84z2o8YhA2nMyZpdvMctuQyZY2RTv+eNS74sy7I3CBaq5jx3BhIb7EjKsV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777393773; c=relaxed/simple;
	bh=WB+FLCQ1pB6/hLLpL8qe5azyJH79mgJP5EWQCmjzLQg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F00BAidQtoF3J1REjCD2EvxZZ58G6/oghA/VdrjMAaVoVOGiTyJvx119Evaz9bsgH57kepUIp0qJRqu8cacCgVLJQsHNEUrvHrh7+RfK5fv9o743AreUyHX7pnC4tJh8FrwY0E3lJr3wUtZM7qswP2WCG5DuonG2xJuC18w9v+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mmpsystems.pl; spf=pass smtp.mailfrom=mmpsystems.pl; dkim=pass (2048-bit key) header.d=mmpsystems.pl header.i=@mmpsystems.pl header.b=tS1ehIJc; arc=none smtp.client-ip=195.78.66.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mmpsystems.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mmpsystems.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mmpsystems.pl header.i=@mmpsystems.pl header.b="tS1ehIJc"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=mmpsystems.pl; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=As6ZBk4C50Ztj8e2ha9+tle4FDPExjLzugeDmo/Ec94=; b=tS1ehIJcZ9mwCbgLBOWmQ6G/uH
	/b/F+OrCEe7x28CAYJ0oCpM7vrhEDUv8f7ZfBVQsfvb13EiB0VjPkZo6vsFxJOHlVVkLEwNBs4kwO
	c8lj8XGy8poOUhCeVv8T1YGUHPcczGaU5Oo2UudxXXnc6XBUCT7eTP6lRtdjmViKTksOrnvgup4P8
	pW8Uww+V/YLewiGs/pQK0oVt4q09FQtZ9djRxqilZVaa2nrIHhZn3HS7+OP/VHkIntjTOKEUcOi0b
	879/M/PQyGk2BGzQvjssegYWVbbKRUKh2K67MEYkS5+azXApm2iOzQ1wfJ/bR+BdLoigap8tGCRv+
	CxdwtiQw==;
Received: from user-188-33-36-99.play-internet.pl ([188.33.36.99] helo=localhost)
	by s106.cyber-folks.pl with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <michal.piekos@mmpsystems.pl>)
	id 1wHlJR-0000000Ay9T-49YO;
	Tue, 28 Apr 2026 18:29:30 +0200
From: Michal Piekos <michal.piekos@mmpsystems.pl>
Date: Tue, 28 Apr 2026 18:27:00 +0200
Subject: [PATCH v3 3/4] arm: dts: allwinner: t113s: add hstimer node
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-h616-t113s-hstimer-v3-3-7e02178a93ee@mmpsystems.pl>
References: <20260428-h616-t113s-hstimer-v3-0-7e02178a93ee@mmpsystems.pl>
In-Reply-To: <20260428-h616-t113s-hstimer-v3-0-7e02178a93ee@mmpsystems.pl>
To: Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>
Cc: Michal Piekos <michal.piekos@mmpsystems.pl>, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 Andre Przywara <andre.przywara@arm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777393718; l=1131;
 i=michal.piekos@mmpsystems.pl; s=20260301; h=from:subject:message-id;
 bh=WB+FLCQ1pB6/hLLpL8qe5azyJH79mgJP5EWQCmjzLQg=;
 b=3GNyRfpjDbtcqK/LKJuzrzfNjknCnh257Oxx/AACPv/6jmBonzBlC/rUmweHPXkCCV2s9ovxW
 +RWr7slZII6AWiXogzBlFfjGAxODMDIGJnMukfzR5ZNI2rzhBaiw/26
X-Developer-Key: i=michal.piekos@mmpsystems.pl; a=ed25519;
 pk=Aixyx03If7ZDamiKKN0lsa+0mtA+WjIuIf2ZQVYNBqg=
X-Authenticated-Id: michal.piekos@mmpsystems.pl

Describe high speed timer block on Allwinner T113-S3.

Tested on LCPI-PC-T113/F113:
- hstimer is registered as clocksource
- switching clocksource at runtime works
- after rating increase hstimer operates as a broadcast clockevent device

Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>
---
 arch/arm/boot/dts/allwinner/sun8i-t113s.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm/boot/dts/allwinner/sun8i-t113s.dtsi b/arch/arm/boot/dts/allwinner/sun8i-t113s.dtsi
index 424f4a2487e2..40e76cfc8a1d 100644
--- a/arch/arm/boot/dts/allwinner/sun8i-t113s.dtsi
+++ b/arch/arm/boot/dts/allwinner/sun8i-t113s.dtsi
@@ -34,6 +34,17 @@ cpu1: cpu@1 {
 		};
 	};
 
+	soc {
+		hstimer@3008000 {
+			compatible = "allwinner,sun20i-d1-hstimer";
+			reg = <0x03008000 0x1000>;
+			interrupts = <GIC_SPI 55 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_HSTIMER>;
+			resets = <&ccu RST_BUS_HSTIMER>;
+		};
+	};
+
 	gic: interrupt-controller@1c81000 {
 		compatible = "arm,gic-400";
 		reg = <0x03021000 0x1000>,

-- 
2.43.0

