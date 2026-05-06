Received: from s106b.cyber-folks.pl (s106b.cyber-folks.pl [195.78.66.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 324E448BD26;
	Wed,  6 May 2026 15:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.78.66.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778080259; cv=none; b=d5oSnfW6szc6T6ETf4cFWMi1zKKJ8md/eGCXV+ATYyzMraIHhQ0c1dp2dts6k05innZ6jc2iz8FHhEjyMkoZ9Z4tFwqvkLIfgVpwmZBhOGVhDp1LSiR+Ord1jATxXwiN7xZ42nsWoMf0/au1sYl+sNimd2azkasNLfnx/jrE6Bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778080259; c=relaxed/simple;
	bh=AZ/Zmj6bxiVSpb1BJYvgfM1oOy31/LD1MQmu0NZTr2g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d8+ydykkLsFerpKBym7PlA+cqz+H7JBTQVW5Ua00bbH/tuVY4Xo4vYHPAweoHMTq7JXuSpO00H5Pm1kBpsaFhNQfx/dX9a9bsRNBw/8+c3zeh8dBzxto9sYXPrjp4o3ZtcXYUC7U5dfP1bi5a9G2D6NA1/yu8eKe/TdP4ayZ/QM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mmpsystems.pl; spf=pass smtp.mailfrom=mmpsystems.pl; dkim=pass (2048-bit key) header.d=mmpsystems.pl header.i=@mmpsystems.pl header.b=Cr+OajGh; arc=none smtp.client-ip=195.78.66.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mmpsystems.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mmpsystems.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mmpsystems.pl header.i=@mmpsystems.pl header.b="Cr+OajGh"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=mmpsystems.pl; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=MHxIIdNZP/GM1WNtCzRWtqkwrd59+f6pkF9jEZfKEuY=; b=Cr+OajGhME6QFoe1JJzLpRTjys
	m0ETy9kvLbFuTg2EnqTKIMvLbWrMucgorKW0l5tTJMTe22c4k8YCFIyZ5mAtuw+6Xbtx4XhhoFhzX
	YZAvgrJ+KnfpYXpLLVTshVQlC22WHIaybJFdRRp/TYCoBdNRHdjTQxxsNfmHXukFJT5rnoJZJAOTh
	xC/lierVURJcsYvms1lnXbls82B7cwa3TVYEGtfkE06AZS0M6VSfizZnxjOn3OD1EMeHnaE9/hMw9
	NSlug8K6lrX2bEAG9nOYdMFQYsmbeJlOx5Pdwnej5LeCwUjoYTaAAbnTAC9qm3DGMFZUIHcL0K6iV
	06iDcTiQ==;
Received: from user-188-33-36-99.play-internet.pl ([188.33.36.99] helo=localhost)
	by s106.cyber-folks.pl with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <michal.piekos@mmpsystems.pl>)
	id 1wKdtk-00000003auw-1Ieu;
	Wed, 06 May 2026 17:10:52 +0200
From: Michal Piekos <michal.piekos@mmpsystems.pl>
Date: Wed, 06 May 2026 17:10:28 +0200
Subject: [PATCH v4 3/4] arm: dts: allwinner: d1s-t113: add hstimer node
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260506-h616-t113s-hstimer-v4-3-591d425863d6@mmpsystems.pl>
References: <20260506-h616-t113s-hstimer-v4-0-591d425863d6@mmpsystems.pl>
In-Reply-To: <20260506-h616-t113s-hstimer-v4-0-591d425863d6@mmpsystems.pl>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778080247; l=1181;
 i=michal.piekos@mmpsystems.pl; s=20260301; h=from:subject:message-id;
 bh=AZ/Zmj6bxiVSpb1BJYvgfM1oOy31/LD1MQmu0NZTr2g=;
 b=kb7ff0LSblEwP7boEqHpI9OtTFZiCNuH8u0t8A0njdqrV6Lz5l5dJh23PHQ/JF/GtFxBSbUhF
 mbe3BRl9p2UDcDQ9sViAGcsrcBaT96sqwdMaeA8OC1u6lDsPa5jw5kN
X-Developer-Key: i=michal.piekos@mmpsystems.pl; a=ed25519;
 pk=Aixyx03If7ZDamiKKN0lsa+0mtA+WjIuIf2ZQVYNBqg=
X-Authenticated-Id: michal.piekos@mmpsystems.pl

Describe high speed timer block on Allwinner D1S-T113.

Tested on LCPI-PC-T113/F113:
- hstimer is registered as clocksource
- switching clocksource at runtime works
- after rating increase hstimer operates as a broadcast clockevent device

Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>
---
 arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
index 82cc85acccb1..a849b0380386 100644
--- a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
+++ b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
@@ -295,6 +295,15 @@ timer: timer@2050000 {
 			clocks = <&dcxo>;
 		};
 
+		hstimer@3008000 {
+			compatible = "allwinner,sun20i-d1-hstimer";
+			reg = <0x03008000 0x1000>;
+			interrupts = <GIC_SPI 55 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_HSTIMER>;
+			resets = <&ccu RST_BUS_HSTIMER>;
+		};
+
 		wdt: watchdog@20500a0 {
 			compatible = "allwinner,sun20i-d1-wdt-reset",
 				     "allwinner,sun20i-d1-wdt";

-- 
2.43.0

