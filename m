Received: from s106b.cyber-folks.pl (s106b.cyber-folks.pl [195.78.66.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0E591BD9C9;
	Sun, 26 Apr 2026 10:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.78.66.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777198581; cv=none; b=jTRmUIDT9ETqt3ZEkcwTSHAMF/tD21rWemEETiR9oMpmkI7qyXk68kTnIei92eUnoXZqK+V35TKwtRYTynyMkp4fWQud7p+f/AbQho71ZCpg3VR5GT7AKH6GDbo/8WvliOu/2zpriEsj+bh6oUdZftDftQhoPw/IHPMySd4/4ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777198581; c=relaxed/simple;
	bh=cCHCvUuPpHPu5/1mgf/ezZ1u0bRGr6TqCo7i9RhbRKk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MeA0hTdhL7b5ejbaCquvBZogjocKaKRqC0kmgNbIoC/FkGCnxMbl2e+hadoQmEw32hGYc+d4oPFJjsALbpXbR8EHZ3XIV0c4X22BgRFYXjn3eMatFNE+eMil9npqmEcmeHw3v5Z1vaHJVMYRLi5wrHS1McsK5dsQzfYx8nO5dlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mmpsystems.pl; spf=pass smtp.mailfrom=mmpsystems.pl; dkim=pass (2048-bit key) header.d=mmpsystems.pl header.i=@mmpsystems.pl header.b=BK7Bz3OV; arc=none smtp.client-ip=195.78.66.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mmpsystems.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mmpsystems.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mmpsystems.pl header.i=@mmpsystems.pl header.b="BK7Bz3OV"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=mmpsystems.pl; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=uNFzzd95mcTYhcO+wG3xMSmWT3vJi7xx2yg5IbFJlII=; b=BK7Bz3OVlygoGKz6TSBEGDuzY9
	nKq/RULN7AVEGlNaIwQ2wB3KXYF59XDtOJ9E1ny5mOljANkJ4zI38btt8jXI2Lzc2YXHTlTgT/enV
	Ph18uzznc22o4KyS6pd72dS+M3dAb2hP4bJxXY3P87/zOsh6YLhyv8LFZ4zFQcBz6/40717lwBhhJ
	7TJ2WzI6Uui4/mY/dq66lGo+eIqKphoBWnqCYW6xxWOAx2im92fDYlwsKshF04ZvMEu2FfxshQ78+
	UVW+RGDLgvF1xOlRURDdXsqdU+vwIiVqePxlUxW54gb0obaP9nDk2POAxYu1qfJBBUIyyUaPsLn7P
	hwbI3caQ==;
Received: from user-188-33-36-99.play-internet.pl ([188.33.36.99] helo=localhost)
	by s106.cyber-folks.pl with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <michal.piekos@mmpsystems.pl>)
	id 1wGwX9-0000000CBRV-3ut5;
	Sun, 26 Apr 2026 12:16:16 +0200
From: Michal Piekos <michal.piekos@mmpsystems.pl>
Date: Sun, 26 Apr 2026 12:15:29 +0200
Subject: [PATCH v2 4/4] arm64: dts: allwinner: h616: add hstimer node
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260426-h616-t113s-hstimer-v2-4-e65e9dc0c9da@mmpsystems.pl>
References: <20260426-h616-t113s-hstimer-v2-0-e65e9dc0c9da@mmpsystems.pl>
In-Reply-To: <20260426-h616-t113s-hstimer-v2-0-e65e9dc0c9da@mmpsystems.pl>
To: Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 Michal Piekos <michal.piekos@mmpsystems.pl>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777198529; l=1212;
 i=michal.piekos@mmpsystems.pl; s=20260301; h=from:subject:message-id;
 bh=cCHCvUuPpHPu5/1mgf/ezZ1u0bRGr6TqCo7i9RhbRKk=;
 b=0x0K5umTBuHAYa/VBYZvkuflhbBQIa1oByPmLb0zonwXUViZBNgJ3TSBKIRGDk/8Payuva2uG
 zx9x83mwLcMC2kPHFZJEXGuASvsTKqT0CnfES+2VefcrYFfTnsswHp4
X-Developer-Key: i=michal.piekos@mmpsystems.pl; a=ed25519;
 pk=Aixyx03If7ZDamiKKN0lsa+0mtA+WjIuIf2ZQVYNBqg=
X-Authenticated-Id: michal.piekos@mmpsystems.pl

Describe high speed timer block on Allwinner H616.

Tested on Orange Pi Zero 3:
- hstimer is registered as clocksource
- switching clocksource at runtime works
- after rating increase hstimer operates as a broadcast clockevent device

Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>
---
 arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
index bf054869e78b..1356e5df2562 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
@@ -237,6 +237,16 @@ timer0: timer@3009000 {
 			clocks = <&osc24M>;
 		};
 
+		hstimer@3005000 {
+			compatible = "allwinner,sun50i-h616-hstimer",
+				     "allwinner,sun20i-d1-hstimer";
+			reg = <0x03005000 0x1000>;
+			interrupts = <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 46 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_HSTIMER>;
+			resets = <&ccu RST_BUS_HSTIMER>;
+		};
+
 		watchdog: watchdog@30090a0 {
 			compatible = "allwinner,sun50i-h616-wdt",
 				     "allwinner,sun6i-a31-wdt";

-- 
2.43.0

