Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23B9372
	for <linux-sunxi@lists.linux.dev>; Mon, 10 May 2021 16:37:25 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id j3-20020a05600c4843b02901484662c4ebso11539883wmo.0
        for <linux-sunxi@lists.linux.dev>; Mon, 10 May 2021 09:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=azFO5ST2Nn2MQauTLMiqCfhjldm/wHJbC2Icruyek7s=;
        b=qUbwdwHV8iU3Hs2PvJt0bUxjTD+9Pp6RQaIz8ON4YBbuEaaQQi4Ea21kIlbRV2HFJ1
         GX0zf57HtFNYCGCY/hiYDhf81TgdJLATSOUSO2gG65d1gais6S3ScJU2VAaRZs5zp1GJ
         dYO2DWD/8xbH9MT2GPOYd1FK5C2hACQDFwYwTU3LfesuL93O05g5y9rLV3HSC4kej3Z5
         DtAAwreS5RIzSRSQ4foePi+u8i1DFzRRiT8yPX96WjVR5COv0DnCYQIfNSWJoqj4GI7h
         BCSpR7covmbavfN1nCeDc0vpWJezob0AxIKFmH7ymwBCOjwsAJyOQM3TREGXGi+ri8BV
         JKyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=azFO5ST2Nn2MQauTLMiqCfhjldm/wHJbC2Icruyek7s=;
        b=ZOLux/YAhQZKl4zhkrC/lkPntqENEfMJt0YPCjuothGXy8KQGgchs16euHd3JNi7qs
         hxwmXsLmGR0VNH33qnyLR8qt4QLm9dBRvcsohgM4gh4X4A21M5Mw3BGcm931/94Kdic3
         vpakV1Eqwj5gD7m1ytqt6D5e9wf2pHu2DurJt0nrzEu6Fdv+XkHmYlVopohSWT27R6OZ
         4Ifn7laDuMdYvpXyoJ6RW03naedClXZjzowTd+xiWhfsuC6/PviClxVjJ4JuR2pa3bqf
         7X4IpKgVa8ayGAqsLp9emrNdpdV43uNHeTWFJ41tGM1UcbNhGO9dtTu3LqfnsuSHwGCl
         6m3g==
X-Gm-Message-State: AOAM5332eFoDCKrt+m3eP1NSx1+xDV2+kVQgp52l+XuXI2aXbvivG3P3
	MIzWTMKQjalari2GP9VodMs=
X-Google-Smtp-Source: ABdhPJwMv8QoW5gXAbJ+zle4pP74S96CpwWQk5lyg9rQS1WkUZe5HzIxh1SY2zcBknhRWJo0kgtfcg==
X-Received: by 2002:a1c:e345:: with SMTP id a66mr37904184wmh.109.1620664643727;
        Mon, 10 May 2021 09:37:23 -0700 (PDT)
Received: from kista.localdomain (cpe-86-58-17-133.cable.triera.net. [86.58.17.133])
        by smtp.gmail.com with ESMTPSA id s10sm22775253wru.55.2021.05.10.09.37.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 09:37:23 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: mripard@kernel.org,
	wens@csie.org
Cc: robh+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	jernej.skrabec@gmail.com
Subject: [PATCH] ARM: dts: sun8i: r40: Add timer node
Date: Mon, 10 May 2021 18:36:47 +0200
Message-Id: <20210510163647.2731675-1-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.31.1
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allwinner R40 has a timer.

Add a node for it.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 arch/arm/boot/dts/sun8i-r40.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-r40.dtsi b/arch/arm/boot/dts/sun8i-r40.dtsi
index 03e054c0bac4..291f4784e86c 100644
--- a/arch/arm/boot/dts/sun8i-r40.dtsi
+++ b/arch/arm/boot/dts/sun8i-r40.dtsi
@@ -691,6 +691,18 @@ uart7_pi_pins: uart7-pi-pins {
 			};
 		};
 
+		timer@1c20c00 {
+			compatible = "allwinner,sun4i-a10-timer";
+			reg = <0x01c20c00 0x90>;
+			interrupts = <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&osc24M>;
+		};
+
 		wdt: watchdog@1c20c90 {
 			compatible = "allwinner,sun4i-a10-wdt";
 			reg = <0x01c20c90 0x10>;
-- 
2.31.1

