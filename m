Received: from s106b.cyber-folks.pl (s106b.cyber-folks.pl [195.78.66.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17E442FFF81;
	Tue, 28 Apr 2026 16:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.78.66.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777393774; cv=none; b=iX1y9v4ZHtsIv9e9DhpEEWq+EGsbpFfWJaqQrMv7zcAmPdwjy363JiTFQSm0izs5WcvxoHxmrtwh/xnpupx3arksI8m/m+sIEdPnGEraHMsHHt1LJ6C6wcI6ie5agd0FzhhFz5STM9XGEAfAcZdv/x0CAs1EIYJ3l4om6bUTnM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777393774; c=relaxed/simple;
	bh=cCHCvUuPpHPu5/1mgf/ezZ1u0bRGr6TqCo7i9RhbRKk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iTCDJq1pzhzmOwcxnLw53INgfLWfyjREtLeVBnSwaCuLVaBA81BPxWdbaX+0aA2R7UuQE7GxO9MjKmHAaP4sKpTAAM/Jf1UGUEQVbWW3H7WjPtSOU6VC1E9syHHy8uDOTDNDxDxHHWmfaYMrc+w3/LxAlYzxoE8G7fEaorI6CoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mmpsystems.pl; spf=pass smtp.mailfrom=mmpsystems.pl; dkim=pass (2048-bit key) header.d=mmpsystems.pl header.i=@mmpsystems.pl header.b=LpdUe6vW; arc=none smtp.client-ip=195.78.66.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mmpsystems.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mmpsystems.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mmpsystems.pl header.i=@mmpsystems.pl header.b="LpdUe6vW"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=mmpsystems.pl; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=uNFzzd95mcTYhcO+wG3xMSmWT3vJi7xx2yg5IbFJlII=; b=LpdUe6vWV8GUx6T658P2IK+BBb
	e8Llc/HH+kyKSsjFa1nxnEfOkrUs1Bv9oGzPrX+P/8SZ0BbR7Pby05UQ2X1xvvCH7GShWW5tJJnMG
	LOA8pKZBm2I8zWzLiVET0M9wCT3M3rrg1vcqGij2lGhgXNB7YqHOuZd/+GnaAXZr7CeWDGBL+w2E1
	qYXR0WVan1GWrI6utM3WWp3CQz/mZZBHTbKhgOrOmvqEsriwB1PGXq2bpyeNGrtIemj/+hbmOQ+jG
	RQ5zeRZqNo0Vxi/ExRXbPDkV29Smb5z+0pYHRvG9VzvY12ucuc8LAjsnSleUi33MKbcyWDwGdDzyv
	kHDk9uIQ==;
Received: from user-188-33-36-99.play-internet.pl ([188.33.36.99] helo=localhost)
	by s106.cyber-folks.pl with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <michal.piekos@mmpsystems.pl>)
	id 1wHlJS-0000000AyAH-33fe;
	Tue, 28 Apr 2026 18:29:30 +0200
From: Michal Piekos <michal.piekos@mmpsystems.pl>
Date: Tue, 28 Apr 2026 18:27:01 +0200
Subject: [PATCH v3 4/4] arm64: dts: allwinner: h616: add hstimer node
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-h616-t113s-hstimer-v3-4-7e02178a93ee@mmpsystems.pl>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777393718; l=1212;
 i=michal.piekos@mmpsystems.pl; s=20260301; h=from:subject:message-id;
 bh=cCHCvUuPpHPu5/1mgf/ezZ1u0bRGr6TqCo7i9RhbRKk=;
 b=eFK3ao3uugOuv143hz0liRBNNc2Xesw0yOGSCckqUgPwCm5JUa2FLamO0kXHGhWPW9uAVb/3s
 0sqvXLmq0WhBVS/BrEBPdbZ4YK6th3qxM4WgPB7NxXjKfqpDzkuhzZz
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

