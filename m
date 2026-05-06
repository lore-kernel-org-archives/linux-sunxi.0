Received: from s106b.cyber-folks.pl (s106b.cyber-folks.pl [195.78.66.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BBCE2D63F8;
	Wed,  6 May 2026 15:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.78.66.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778080260; cv=none; b=HB8fmlnXor16X386IPW7J5ddGMRd8gFAzVJ5HamJTVrexec/qNMcRcwoAPczxbxX3apTZ0NlSlx1tSC6WsocpL6k/vy2Vb4Rw8NiPTgofq2tHXHzPGpEVKByjqpN8fndDY0gjbyb/QMlmIhxD5YvnKCpQwaU+bp2Ri4FmhR921U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778080260; c=relaxed/simple;
	bh=cCHCvUuPpHPu5/1mgf/ezZ1u0bRGr6TqCo7i9RhbRKk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ggyPHQFlx8KLOsElQ9S5JtDhhBPZ7V4xXVg4SV+XLj46VD0TpLM+gzlFfcSIIuVz3W6LfQppunBOSP2fO5BnlMp+uOWMUt/CVMX12R5jU9VJRP6436GVe3bIGDNVvA/BuKWY14PqxGcgW6ddhk9RsQSjT44Y+b3U0PJ8tszQxNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mmpsystems.pl; spf=pass smtp.mailfrom=mmpsystems.pl; dkim=pass (2048-bit key) header.d=mmpsystems.pl header.i=@mmpsystems.pl header.b=taGCJg+4; arc=none smtp.client-ip=195.78.66.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mmpsystems.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mmpsystems.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mmpsystems.pl header.i=@mmpsystems.pl header.b="taGCJg+4"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=mmpsystems.pl; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=uNFzzd95mcTYhcO+wG3xMSmWT3vJi7xx2yg5IbFJlII=; b=taGCJg+4P02MpniCDPcIubfA1w
	NOEHJ7dt6xfUSyuW7VM5RKYK5msJBaLRIjZY27PWWEUPI0lOJeorgjzpKh77k9gFJUB+jFjGYeVXg
	QyyIqDiotcKedsEVmKqLi21R3DPwDmAGrraZSJvPdfsB32ftCbtV3EDF59TFWRZwFH59D9Qv2T5Ei
	gFqlhlaFiimxVTAF76ytqgf3G7QmY7CnKjqCDKPTTuQlu8l4PXSZbLlIGuvEeE9DckEpRgyr/WxVp
	aPaoYc+VeDfUhFQKktR3J+gLHpcFkS2d89z9olQweL5x0OpwjqjKrYkG5JVSYvD/NsARnNbWLegEQ
	17FMsUbw==;
Received: from user-188-33-36-99.play-internet.pl ([188.33.36.99] helo=localhost)
	by s106.cyber-folks.pl with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <michal.piekos@mmpsystems.pl>)
	id 1wKdtl-00000003avf-1ep8;
	Wed, 06 May 2026 17:10:53 +0200
From: Michal Piekos <michal.piekos@mmpsystems.pl>
Date: Wed, 06 May 2026 17:10:29 +0200
Subject: [PATCH v4 4/4] arm64: dts: allwinner: h616: add hstimer node
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260506-h616-t113s-hstimer-v4-4-591d425863d6@mmpsystems.pl>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778080247; l=1212;
 i=michal.piekos@mmpsystems.pl; s=20260301; h=from:subject:message-id;
 bh=cCHCvUuPpHPu5/1mgf/ezZ1u0bRGr6TqCo7i9RhbRKk=;
 b=YaIWpieKroR4LhBuwpwPUIEiVX/E0tev90OjSQlNoABbG8TFy7srK/mHFIZeen5eNfos4OV4h
 ts9YcBuwMO1BcfPgU3pyJzO93l/Vzq3Tf4uMJE0xeg+OIuRNJOcE0gW
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

