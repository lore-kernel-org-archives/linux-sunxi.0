Received: from s106b.cyber-folks.pl (s106b.cyber-folks.pl [195.78.66.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E83042C027C;
	Sun, 29 Mar 2026 11:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.78.66.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774784637; cv=none; b=Q+7TSUTZ8IaEg9ftjTdQjPICJp2QwsMfPvubTVVtrHyVhOPZPYSHjRpglgdHb5hrkMpocgprPiDY4MSfMrnEpsKE6eykt+BB3IvIkgiSPc2wEdexO4/mSKsalK5E/XKQGqapXIaZTxyQtArBRQsFodFCehp1Z3mOzHJzNQj6jd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774784637; c=relaxed/simple;
	bh=/x2bgSPLjMPRtMCgOrqMlQDlUtZoPJY2aQ5+GW5XhUs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=tgIikGq8wuspsWhXDn4VsFynfArmBkRBdcpNCuMiy+XV+L3T3hWvsfGUNjpsXtjlpyo/NaKLa/UWMsdJGqFZ8+OsO4F+ERs7d2R5badv/UvCvvFQin9Jw8AmRbJ8sGRxAR+D/ogRITeepCc+jAxuwDL5VtHJFcGYZSYQDkDDh58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mmpsystems.pl; spf=pass smtp.mailfrom=mmpsystems.pl; dkim=pass (2048-bit key) header.d=mmpsystems.pl header.i=@mmpsystems.pl header.b=gmnaP2Ru; arc=none smtp.client-ip=195.78.66.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mmpsystems.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mmpsystems.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mmpsystems.pl header.i=@mmpsystems.pl header.b="gmnaP2Ru"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=mmpsystems.pl; s=x; h=Cc:To:Message-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=NsDDl+yTVHlLP7IF4N9Zv94wAjZ2/9tT1ZDu4kPuHBo=; b=gmnaP2Ru3ijtE98GSZLZm60+Q0
	1ytO42TKS2P8gr9TgacXNM9uO3fEsNCJx24+7HshblRxD5WM5cRFrT6VfF60rcUcbP7O5TRku6jLJ
	fU+buNxWIW/em4KSYlHf56IG6PCbZMpKGse07p9BR+8AnIKu5L0TRZ+RKZBfouEjxjMTuugu2wrJn
	2qx9ykfl8AXqtTM9QHm0W5wpfv/Xq3YILNbLXL3LvP97x/6Rit/wV6wleQuoOzZ1yJjHVvTLJvESj
	Zyava6JzNEmwq5X0v78pXq8jZ29H8sn2iNWy8YRWbWFx6Z9U2+HSxoiNfgtFDmnxb3nFXjTzlidLS
	wKMdvR7g==;
Received: from user-5-173-16-20.play-internet.pl ([5.173.16.20] helo=localhost)
	by s106.cyber-folks.pl with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <michal.piekos@mmpsystems.pl>)
	id 1w6oYZ-0000000GCr0-2xJN;
	Sun, 29 Mar 2026 13:43:51 +0200
From: Michal Piekos <michal.piekos@mmpsystems.pl>
Date: Sun, 29 Mar 2026 13:43:04 +0200
Subject: [PATCH] arm64: dts: allwinner: enable h616 timer support
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260329-h616-timer-v1-1-5966d0420a66@mmpsystems.pl>
X-B4-Tracking: v=1; b=H4sIAEcQyWkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDYyML3QwzQzPdkszc1CJdAxOzVLPEZGNTE8tUJaCGgqLUtMwKsGHRsbW
 1AIEalLBcAAAA
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Michal Piekos <michal.piekos@mmpsystems.pl>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774784592; l=2614;
 i=michal.piekos@mmpsystems.pl; s=20260301; h=from:subject:message-id;
 bh=/x2bgSPLjMPRtMCgOrqMlQDlUtZoPJY2aQ5+GW5XhUs=;
 b=spZzLnfw6iqy8vd4Ucz8b5Px8716PU/4p8eh3j3FODFnmcEIO/5YaErEhymPRcQs5tASum502
 EzC93QHzr4kBPyVseWeQXwSStYugkMDwwOxbP1esOY3pLVhLUfgdolM
X-Developer-Key: i=michal.piekos@mmpsystems.pl; a=ed25519;
 pk=Aixyx03If7ZDamiKKN0lsa+0mtA+WjIuIf2ZQVYNBqg=
X-Authenticated-Id: michal.piekos@mmpsystems.pl

Add support for timer by reusing existing sun4i timer driver.

H616 timer is compatible with earlier sunxi timer variants and provides
both clocksource and clockevent functionality. It runs from 24 MHz
oscillator. It can serve as broadcast clockevent for wake up from idle
states.

Tested on Orange Pi Zero 3:
- timer is registered as clocksource:
- switching clocksource at runtime works
- timer operates as a broadcast clockevent device
- no regression observed compared to arch_sys_counter

Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>
---
Test results:

Clocksource switching:
  cat /sys/devices/system/clocksource/clocksource0/available_clocksource
    arch_sys_counter timer
  echo timer > /sys/devices/system/clocksource/clocksource0/current_clocksource
    [ 5031.105997] clocksource: Switched to clocksource timer

Clockevent configuration:
  cat /proc/timer_list
    ...
    Tick Device: mode:     1
    Broadcast device
    Clock Event Device: sun4i_tick
     max_delta_ns:   178956969070
     min_delta_ns:   1000
     mult:           51539608
     shift:          31
     mode:           1
     next_event:     9223372036854775807 nsecs
     set_next_event: sun4i_clkevt_next_event
     shutdown:       sun4i_clkevt_shutdown
     periodic:       sun4i_clkevt_set_periodic
     oneshot:        sun4i_clkevt_set_oneshot
     resume:         sun4i_clkevt_shutdown
     event_handler:  tick_handle_oneshot_broadcast
    ...

Cyclictest measurements:
  Dominated by system scheduler latency and do not reflect clocksource
  precision.
---
 arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
index 8d1110c14bad..bf054869e78b 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
@@ -228,6 +228,15 @@ cpu_speed_grade: cpu-speed-grade@0 {
 			};
 		};
 
+		timer0: timer@3009000 {
+			compatible = "allwinner,sun50i-h616-timer",
+				     "allwinner,sun8i-a23-timer";
+			reg = <0x03009000 0xa0>;
+			interrupts = <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&osc24M>;
+		};
+
 		watchdog: watchdog@30090a0 {
 			compatible = "allwinner,sun50i-h616-wdt",
 				     "allwinner,sun6i-a31-wdt";

---
base-commit: be762d8b6dd7efacb61937d20f8475db8f207655
change-id: 20260328-h616-timer-046e6ac3549e

Best regards,
-- 
Michal Piekos <michal.piekos@mmpsystems.pl>

