Received: from s106b.cyber-folks.pl (s106b.cyber-folks.pl [195.78.66.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF6B4155C82;
	Sun, 26 Apr 2026 10:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.78.66.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777198582; cv=none; b=IF+si+rDxWZUv2yByNoySUIQ722BZ5C1nFrH6sN4L0c5MjnxB7qbI5vhIuqo9NbUM77wXHU12N7YVYu+HucolsY7z6/Qs/pXxX5sYmyMSLKsM/JugQQ/NRmwlA8Xu7sT7V3cVCFRnNPKqO+z+qskFjrtjClXgwWDUnDbUHi/4gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777198582; c=relaxed/simple;
	bh=WB+FLCQ1pB6/hLLpL8qe5azyJH79mgJP5EWQCmjzLQg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d9bv6iSt0tHlysjbIfsnMJxTQg0jcrIDazKN5mrYg3Ih4A163mV4wVYStAD5qZStMSacBHTWLl7mLrNpnkRSB0lY33GduzI4IZsBRxE52aIpJEj5uVEE6JQqzladdfwiPtTjlfvfm/IddjWsmB4fikzxnO/KCzH4yJl0Ry+98IE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mmpsystems.pl; spf=pass smtp.mailfrom=mmpsystems.pl; dkim=pass (2048-bit key) header.d=mmpsystems.pl header.i=@mmpsystems.pl header.b=f5UJfnpd; arc=none smtp.client-ip=195.78.66.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mmpsystems.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mmpsystems.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mmpsystems.pl header.i=@mmpsystems.pl header.b="f5UJfnpd"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=mmpsystems.pl; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=As6ZBk4C50Ztj8e2ha9+tle4FDPExjLzugeDmo/Ec94=; b=f5UJfnpd7FZcEGzV2AC7OMV8WB
	S4yt0NRE3YMUidrW1HwK7eW6undC6fVyAb5FVBs9cT+6W/pLU16cloakIgBCjvodd2nMiQKRFRodK
	g+9ckC3cS6W3KlVdybbGfoT2sUJLzvSGoF1rWba94MmsKulXAM47swBT8t6E7rOGRKdRcUwwv2Pik
	VP0zyPnjv294W2rhebOcFraZuoIc4bulGHMSI9tT4LeCO9G7L+8xrO679v/+Uk1jNLx2WND9o+I31
	/7KrXU40g+hmab1IlPst2V/TpHZPJI4U4TLbLxpxm9moge3sEQMVyf8qb6Bd6BTHOF+9yswh/8cRg
	OeXeDx5A==;
Received: from user-188-33-36-99.play-internet.pl ([188.33.36.99] helo=localhost)
	by s106.cyber-folks.pl with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <michal.piekos@mmpsystems.pl>)
	id 1wGwX9-0000000CBP1-12M6;
	Sun, 26 Apr 2026 12:16:15 +0200
From: Michal Piekos <michal.piekos@mmpsystems.pl>
Date: Sun, 26 Apr 2026 12:15:28 +0200
Subject: [PATCH v2 3/4] arm: dts: allwinner: t113s: add hstimer node
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260426-h616-t113s-hstimer-v2-3-e65e9dc0c9da@mmpsystems.pl>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777198529; l=1131;
 i=michal.piekos@mmpsystems.pl; s=20260301; h=from:subject:message-id;
 bh=WB+FLCQ1pB6/hLLpL8qe5azyJH79mgJP5EWQCmjzLQg=;
 b=mpfCT2u6GufWLMtPwwuQchKqLEF/UtLqs0dd8cGyVMPhzR78lkFYR71DSiYs0yI0tGb529pND
 Pnmsyt39wvFA6Sh4fCGWO2Mpx3MFBSLa1pkvRfSc605LHb8LXd1O6b7
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

