Received: from s106b.cyber-folks.pl (s106b.cyber-folks.pl [195.78.66.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CD381FDA61;
	Sun, 19 Apr 2026 12:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.78.66.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776602844; cv=none; b=G73SZD7jWxz20MImYeUaRunpnIljBxzCSKXW0+mcPVYtigCwOnlphZMdAXf5eEqHUmXkGp6O3L3pn8kxbs5JnvdCHETrscZh480fLSJdyqGp9k/V1V9HMaH7KViOk6YswmUjI/TN96D7H1AzfDpgCu8aqbB2Dh+00rk66yBbrhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776602844; c=relaxed/simple;
	bh=XIZIjEbSaQwU8SHGIG2f7vQGlj5NsG6mt1shAs4DnYk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C0sUlaztPC37kJ9nM+16N5gNARbyIm+in0Z8OMiTkyI5uCj6E4GlC5H/xtGGcOSVKx8R5JMJWobqpd5NPGs2wyX0cxhio2l52bwIrwoaGDNQkfqy2ZCpvbHgR/tZF2qKDrwnWbODjrG5PJqqeVjQqQdQs3zoQ8aADXFqpaEAN68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mmpsystems.pl; spf=pass smtp.mailfrom=mmpsystems.pl; dkim=pass (2048-bit key) header.d=mmpsystems.pl header.i=@mmpsystems.pl header.b=WHYyn43z; arc=none smtp.client-ip=195.78.66.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mmpsystems.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mmpsystems.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mmpsystems.pl header.i=@mmpsystems.pl header.b="WHYyn43z"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=mmpsystems.pl; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=2BKUeRAw6ts3xVXKTWrENRqOPfrQujq1taYcPu1ViSY=; b=WHYyn43zrwSsNZHvME77Khnubn
	z32UzaMgwVlhoL7jAJBnnIuj7T3EUdmVUQBow5D4T1VWf4K9NvR2oEPpSbRZdzrrCWwQO1Z2LCpw+
	BsJfPC+xZ3129MMuBG1utOo5W025gj89Awhkigpa00yLPS05cXxummsln/dSPE37bmxzopZmIVEdy
	2Qjv52bUPT4DtEQOfEONr8YBe4sT5+Yaqi9G4cEpfaloZ3Ys4G2Hz+PJSL8U3rwwFh8xIClnbESJg
	/Dw0Rx2tZH/UpkmHoYbjvzjHrorlnAyG7ACaWiV4tDbPwsRc3/DTUXPA5wiIOJDPHgh7I589nDoSH
	Z3eKIf4A==;
Received: from user-5-173-16-91.play-internet.pl ([5.173.16.91] helo=localhost)
	by s106.cyber-folks.pl with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <michal.piekos@mmpsystems.pl>)
	id 1wERYW-0000000FcVm-3A4V;
	Sun, 19 Apr 2026 14:47:20 +0200
From: Michal Piekos <michal.piekos@mmpsystems.pl>
Date: Sun, 19 Apr 2026 14:46:10 +0200
Subject: [PATCH 4/4] arm: dts: allwinner: t113s: add hstimer node
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260419-h616-t113s-hstimer-v1-4-1af74ebef7c5@mmpsystems.pl>
References: <20260419-h616-t113s-hstimer-v1-0-1af74ebef7c5@mmpsystems.pl>
In-Reply-To: <20260419-h616-t113s-hstimer-v1-0-1af74ebef7c5@mmpsystems.pl>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776602788; l=1183;
 i=michal.piekos@mmpsystems.pl; s=20260301; h=from:subject:message-id;
 bh=XIZIjEbSaQwU8SHGIG2f7vQGlj5NsG6mt1shAs4DnYk=;
 b=TWIqqEA3ErGL3FCRddP1xCmGyg6MgptJEaxLHGDfIlXCIwxmqmSSlTDe+7h5M1kN/P9BSgKau
 jlIiAaWCfkTBQMbfJDBTIr2MWKsAwz5QTib25pUuAMasN+08WxHdfMO
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
 arch/arm/boot/dts/allwinner/sun8i-t113s.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/allwinner/sun8i-t113s.dtsi b/arch/arm/boot/dts/allwinner/sun8i-t113s.dtsi
index 424f4a2487e2..f811ae0924d6 100644
--- a/arch/arm/boot/dts/allwinner/sun8i-t113s.dtsi
+++ b/arch/arm/boot/dts/allwinner/sun8i-t113s.dtsi
@@ -34,6 +34,18 @@ cpu1: cpu@1 {
 		};
 	};
 
+	soc {
+		hstimer@3008000 {
+			compatible = "allwinner,sun8i-t113s-hstimer",
+				     "allwinner,sun50i-h616-hstimer";
+				reg = <0x03008000 0x1000>;
+				interrupts = <GIC_SPI 55 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&ccu CLK_BUS_HSTIMER>;
+				resets = <&ccu RST_BUS_HSTIMER>;
+		};
+	};
+
 	gic: interrupt-controller@1c81000 {
 		compatible = "arm,gic-400";
 		reg = <0x03021000 0x1000>,

-- 
2.43.0

