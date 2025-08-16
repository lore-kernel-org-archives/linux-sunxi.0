Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A36523AB9F
	for <linux-sunxi@lists.linux.dev>; Sat, 16 Aug 2025 08:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755334066; cv=none; b=lRIxhvMPPEYkhWARYR/DCaCs9ZxBNkN2k6c6FTxgbJkqoIw32nuyrxcxgTo1YvwT/N4z80qS2UdrVXausPvfK3byKK8F8wKoI22TNCitHdBLp9FHcPQOOD0tkblZu1wpOaoZZukZStrvKrU8RohLZkdLeCFpABHWX+SoeEf9vH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755334066; c=relaxed/simple;
	bh=feqnGZIaBW0Kxr7JtqcWFeJjTYfwwUCPcXNkynw7PPU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oqVu1cmmnK602jZz7IgkyNpcDRJ4jKevd8FGV0TUXGyRl9CcL/+i+n3Gsxq7s6p+PQSd4WYxdqGPy6GFlW0YkSjbkZNOzsYx7x2xLhzI03J4ew6hCQCBUUY76z/xssv0e/v4zT/pIvTQkqaK3mM1YYgEkhr8c0+rAKdWJxyf3j4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EOclI8D1; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EOclI8D1"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-24456f3f669so27104625ad.1
        for <linux-sunxi@lists.linux.dev>; Sat, 16 Aug 2025 01:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755334064; x=1755938864; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VzugRTjSEEA3vhHWZEvncDTD2t0Cnyv/9flgnww7Mso=;
        b=EOclI8D1Fjym19jfc8Q1owFDR0EgNk7wMXQbYS3kTWUg07oDPpjEiWosVt+dFQtwgM
         mOOhf0x0WHst2OthRDheX8STN7PiOHZEfo8cmmPmEvWUhZUEZPeoprh0cPYfyZnSCx0Q
         vhXfHcVbgQATp3pZiYOI6OkO9uvn+0bwS1V6onYybHFY37CIDv+11bxidXuB7+kzF58n
         iJiBh/dF9J5JYZJTtMtiavu+tx1iFVSHf22T50+AP5fO9wcaM3Ppij8Yj5QttFymGixT
         ORzOmlUEoR52sJF+c/2UjlJW7e2hv9+bOECbG6GyYSzNvCHWt51A2IVOexhOGxdiBjUX
         xDFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755334064; x=1755938864;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VzugRTjSEEA3vhHWZEvncDTD2t0Cnyv/9flgnww7Mso=;
        b=b9mUp9Es/s5lxsKsTXqGHaf8zjcvrdHEuXqbs+IOlosX0LlCCNpOd3oEw62qzAViyH
         FKnowHaTfTKZ/7wsmaWeWeKI4d8L+RmLqpLZphTh0D7X1UdVCsHFxMsuWFKbXAWxYiZo
         OPIcpefps9BzD9lvm8mu4o3Pun10jp79LU0rSZRl+1FdyHHMsc67Puen3ff8Oq0l52XA
         VGDtMzGMnJymw2wSJdSXOfErtwMxanuCbDbypCbW6LLGyJYL2Ok1pfu5e4hqtfH454uy
         GYMvIsJ9Vx2PIO+OlUk6F+1Tq5K84zJk1D7VT/zTQ9puEFPnWQQUmVh9Tb5NiW6rdI/F
         tL4A==
X-Forwarded-Encrypted: i=1; AJvYcCV5n56hzRO8hxMF0q0VBrN2usqH26UJf51UvnT12FguJxTPd69LxmgYbzT2gDdnr0reg0k2PP7fxMgp2g==@lists.linux.dev
X-Gm-Message-State: AOJu0YziMTr8h2fm9wbUUiSemESLRYa4gzMS82ASh6D19zl09I1qnmFD
	/0nGrFMgdFxe7Hq0eFHwcds3T0pVKxlZrN2RUT/USB9mW9brtz/7AAua
X-Gm-Gg: ASbGncuD8CijGP2urmnHZgZMwDVsww2T4bpqOiONsg742uKk+m9LL2X0aEDBlilcagG
	st1D7Ls+aFmWu1LQRv1tn86rgiHxIQ9bc0CxLDFVdyV+xpsRWjGvIz7RZ7bmB+08Nuk4ol19nsv
	87g19qCgpXTqcx9ZrilCv9i+Qw57MxWzFx5h5DHRrCNTcwX9ElbB21Z7rcjtDyplsOdLoTws1J0
	M99/UG7TspMoQdV21Hl8VIo8/zRStvypuZHysqF/Zkt0nVCEKx8WGCuYS9okLoodx9KF2nk1uwx
	Awvyy/3dI2bUKlZiqSBylov9nX9hrvrATJTZ/rwz6ZxoLdbQ2DmgjdeRr59DYHXr3WwTIKMais5
	oc5V/lDbERek=
X-Google-Smtp-Source: AGHT+IGC/f9ctRQyGd8OhPgk/EDa/XtCGcODk7HhjJFFgAw+CxRy4DpFueYRqcfy/Uow1U/CzbWKQQ==
X-Received: by 2002:a17:902:d4d0:b0:240:6fc0:3421 with SMTP id d9443c01a7336-2446bce444fmr73487325ad.3.1755334064339;
        Sat, 16 Aug 2025 01:47:44 -0700 (PDT)
Received: from junAIR ([212.192.12.80])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2446d57f12esm31048215ad.157.2025.08.16.01.47.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Aug 2025 01:47:43 -0700 (PDT)
From: iuncuim <iuncuim@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 2/7] arm64: dts: allwinner: a523: add third usb2 phy
Date: Sat, 16 Aug 2025 16:46:55 +0800
Message-ID: <20250816084700.569524-3-iuncuim@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250816084700.569524-1-iuncuim@gmail.com>
References: <20250816084700.569524-1-iuncuim@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mikhail Kalashnikov <iuncuim@gmail.com>

It seems that there are actually three usb2 phys in the processor, which
makes it incompatible with D1.
The third phy is used together with USB3/PCIe combophy with DWC3
controller. In the BSP code, the third PHY requires a separate glue
driver, but it seems that it is not needed.
According to the BSP code, the third phy does not have a reset line; the
only reset is declared in the DWC3 node, but none of this is documented.
Since sun4i-usb-phy driver requires a reset, I added RST_BUS_3 here.

Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>
---
 .../arm64/boot/dts/allwinner/sun55i-a523.dtsi | 21 ++++++++++++-------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
index 6b6f2296b..e4ed4fa82 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
@@ -503,22 +503,27 @@ usb_otg: usb@4100000 {
 		};
 
 		usbphy: phy@4100400 {
-			compatible = "allwinner,sun55i-a523-usb-phy",
-				     "allwinner,sun20i-d1-usb-phy";
+			compatible = "allwinner,sun55i-a523-usb-phy";
 			reg = <0x4100400 0x100>,
 			      <0x4101800 0x100>,
-			      <0x4200800 0x100>;
+			      <0x4200800 0x100>,
+				  <0x4e00000 0x100>;
 			reg-names = "phy_ctrl",
 				    "pmu0",
-				    "pmu1";
+				    "pmu1",
+					"pmu2";
 			clocks = <&osc24M>,
-				 <&osc24M>;
+				 <&osc24M>,
+				 <&ccu CLK_USB2>;
 			clock-names = "usb0_phy",
-				      "usb1_phy";
+				      "usb1_phy",
+					  "usb2_phy";
 			resets = <&ccu RST_USB_PHY0>,
-				 <&ccu RST_USB_PHY1>;
+				 <&ccu RST_USB_PHY1>,
+				 <&ccu RST_BUS_3>;
 			reset-names = "usb0_reset",
-				      "usb1_reset";
+				      "usb1_reset",
+					  "usb2_reset";
 			status = "disabled";
 			#phy-cells = <1>;
 		};
-- 
2.50.1

