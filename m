Received: from s106b.cyber-folks.pl (s106b.cyber-folks.pl [195.78.66.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35D3A238C16;
	Sun, 19 Apr 2026 12:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.78.66.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776602844; cv=none; b=nkjmmQVz2UqtrjFdPMwowa+7KXLrFBiiupt0SeWWssRvmQ66Q/d/7KzG/CSDMwNNYAvNOKbCRd1anEuOD2jDPG7qv9KrBHyVDdW5+907PGTmBc4u4RYCz0GrRjz1HycaFh/UVM89Zbm/TQ7Ak65N9HoH9NVAxvI/x9FsSUKIjMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776602844; c=relaxed/simple;
	bh=mj0JDjZUFHZ4rOn28SnspZzqXtvUOmaAZYgt95OujCs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=maPOGSpgZzhtFypXBkMLOyhSncaiJiNwvNkjim8b47AFknRC7BGetIDGtPCg1GcBpOxCGF/vN0fEIoHDy7H1fsOVlGuReiB87PH/50bDJ64tMMjY5NVSeeKqzJdTgHZtot+ntwrjstDlCpE7jNqTAAQ8KaVZNRxfFwtFADEAvog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mmpsystems.pl; spf=pass smtp.mailfrom=mmpsystems.pl; dkim=pass (2048-bit key) header.d=mmpsystems.pl header.i=@mmpsystems.pl header.b=x7bzI3DB; arc=none smtp.client-ip=195.78.66.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mmpsystems.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mmpsystems.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mmpsystems.pl header.i=@mmpsystems.pl header.b="x7bzI3DB"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=mmpsystems.pl; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=duDa3+ZscPYRkPNsXgchEpJheiwlOl2UgtFoR/YB8xI=; b=x7bzI3DB1vfv4hzWVy3R3UERTd
	IQ3620hBREs2Tss9v3pVrUUbwzCADuuaY0inaH+fW+5IMJl9Uktzjw3g4Y2GccB6GxyyYZ0mcSekj
	0Y3QgSSVAODkn59XX5TQhghT+0q7VakCOXYCQSAD1vcmHRK3qS294U3UfI7hq8J6Asatm+MoPxZNb
	Jomi5vOwTnsx8iHBVKhoziG0F9B0PUAWKhXIwMK5BEKDEHEFCNE4SZz9AGdEPBnXX2CcZ/ZzUs17L
	LnZSFqk/HZMPRL3+BG+MOikOTQv35JKDrIxZIoO9HKUPqJeRTMgzQRqOEcvxh0b+yjF+R9Q1lVi9Z
	v1gc3/9w==;
Received: from user-5-173-16-91.play-internet.pl ([5.173.16.91] helo=localhost)
	by s106.cyber-folks.pl with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <michal.piekos@mmpsystems.pl>)
	id 1wERYW-0000000FcUF-0Ifs;
	Sun, 19 Apr 2026 14:47:20 +0200
From: Michal Piekos <michal.piekos@mmpsystems.pl>
Date: Sun, 19 Apr 2026 14:46:09 +0200
Subject: [PATCH 3/4] arm64: dts: allwinner: h616: add hstimer node
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260419-h616-t113s-hstimer-v1-3-1af74ebef7c5@mmpsystems.pl>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776602788; l=1167;
 i=michal.piekos@mmpsystems.pl; s=20260301; h=from:subject:message-id;
 bh=mj0JDjZUFHZ4rOn28SnspZzqXtvUOmaAZYgt95OujCs=;
 b=VHTIDceAoy0tODkhQAo0zsJJo39Q4ejDDRU3zeRqv4VuebSPNJyYgQu61A8WfHEf0mXE/VxJ6
 2E9gAmFxeOPDUZl7AHLpUjzuWEM+w/gjcrAEIG4MW9iRo+qR4RdJGza
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
 arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
index bf054869e78b..0713a17264ec 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
@@ -237,6 +237,15 @@ timer0: timer@3009000 {
 			clocks = <&osc24M>;
 		};
 
+		hstimer@3005000 {
+			compatible = "allwinner,sun50i-h616-hstimer";
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

