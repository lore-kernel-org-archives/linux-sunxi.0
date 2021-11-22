Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 820402C81
	for <linux-sunxi@lists.linux.dev>; Mon, 22 Nov 2021 10:46:48 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id k37so78819155lfv.3
        for <linux-sunxi@lists.linux.dev>; Mon, 22 Nov 2021 02:46:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wirenboard-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=311GWPIXU+cwXxA7Ckz/STalbmM5HGKI3ZPI+zF+AxU=;
        b=C2vLaC6sb735/pasDKME38R6Mdg/XwVypZnM92+kTdhnoTIIwD6NID8mfskzt3zY4i
         tQVD7SoCmSHxZzczPBWXFwxxQZQ/CJXB6Krrn5wtGZ7X/6fJLsMp4fubBdtyzlajuy67
         +Xb1Tonjg9CEbTEFd9Mz8cAbZGK06Q3ogCWH6OFkPS6SH5WyhgyCcIRBuXIZiYCg9iXz
         a/43nYsG/gm79Zeo7kLp3dZ/5m/ez+DSw0ZF5E0cJ1xj18ebuP9LbjqJOvkOm4tWzfQm
         4djhqZSQLiSM9tWsfUpNIrBSIb85dMYx1QkRxn5Vp+jDMwliidA2azAJxTmZc7S8MRnf
         yE5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=311GWPIXU+cwXxA7Ckz/STalbmM5HGKI3ZPI+zF+AxU=;
        b=kQpkh78mTpq84RZdtHl8L5bq7GfkgUHQYfCOIAYUFzvsI9F00hDgLYNrwteAjujNX5
         vK8P5kPveA5gfK7V92fknl7pSw4h+m1Hpo0xjr3nYu4i1JqzJe2qgrFbeRqKQOBcpwbB
         q/dtFu4B8MAvPkTMsCPpNplSv4gFjd5t2FSasEQfxNe29q2Om7LpraZ+ejq09VaW+879
         4L70/wWkODmbx8Lb/KdIzN7G5TXclK/sF+JYtlPO00cC/u/0+zMPGsKgJz1aTMo048Be
         wIBtcOXRUPTMkZIDuPVTNr0R/oujGfJL3nmN3dPmrqYBGK5iJeZTo3hfpM5hLKvcQEcK
         LezA==
X-Gm-Message-State: AOAM531RIPoftbvD4VAkFgckAsk7BsY/4ZbkYTfAZEhvfLc8EClgrIKb
	SZyR4vRSiUb+x7KdOpZJhJ6mNg==
X-Google-Smtp-Source: ABdhPJwJHm4/CL7dIRX3Q10ViHuUVbbGK/y0BysXvqEG1YX0vYPX8lTD4tzA8QuiDlgZJiU/X6NPOw==
X-Received: by 2002:a2e:9b01:: with SMTP id u1mr51418465lji.379.1637578006428;
        Mon, 22 Nov 2021 02:46:46 -0800 (PST)
Received: from boger-laptop.lan (81.5.99.121.dhcp.mipt-telecom.ru. [81.5.99.121])
        by smtp.gmail.com with ESMTPSA id bi24sm923538lfb.49.2021.11.22.02.46.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Nov 2021 02:46:46 -0800 (PST)
From: Evgeny Boger <boger@wirenboard.com>
To: Maxime Ripard <mripard@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	linux-arm-kernel@lists.infradead.org
Cc: Evgeny Boger <boger@wirenboard.com>,
	devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-can@vger.kernel.org,
	Wolfgang Grandegger <wg@grandegger.com>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	"David S . Miller" <davem@davemloft.net>,
	Jeroen Hofstee <jhofstee@victronenergy.com>,
	Gerhard Bertelsmann <info@gerhard-bertelsmann.de>
Subject: [PATCH 3/3] ARM: dts: sun8i: r40: add node for CAN controller
Date: Mon, 22 Nov 2021 13:46:16 +0300
Message-Id: <20211122104616.537156-4-boger@wirenboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211122104616.537156-1-boger@wirenboard.com>
References: <20211122104616.537156-1-boger@wirenboard.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allwinner R40 (also known as A40i, T3, V40) has a CAN controller. The
controller is the same as in earlier A10 and A20 SoCs, but needs reset
line to be deasserted before use.

This patch adds a CAN node and the corresponding pinctrl descriptions.

Signed-off-by: Evgeny Boger <boger@wirenboard.com>
---
 arch/arm/boot/dts/sun8i-r40.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-r40.dtsi b/arch/arm/boot/dts/sun8i-r40.dtsi
index 1d87fc0c24ee..c99c92f008a0 100644
--- a/arch/arm/boot/dts/sun8i-r40.dtsi
+++ b/arch/arm/boot/dts/sun8i-r40.dtsi
@@ -511,6 +511,16 @@ pio: pinctrl@1c20800 {
 			#interrupt-cells = <3>;
 			#gpio-cells = <3>;
 
+			can_ph_pins: can-ph-pins {
+				pins = "PH20", "PH21";
+				function = "can";
+			};
+
+			can_pa_pins: can-pa-pins {
+				pins = "PA16", "PA17";
+				function = "can";
+			};
+
 			clk_out_a_pin: clk-out-a-pin {
 				pins = "PI12";
 				function = "clk_out_a";
@@ -926,6 +936,15 @@ i2c3: i2c@1c2b800 {
 			#size-cells = <0>;
 		};
 
+		can0: can@1c2bc00 {
+			compatible = "allwinner,sun8i-r40-can";
+			reg = <0x01c2bc00 0x400>;
+			interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_CAN>;
+			resets = <&ccu RST_BUS_CAN>;
+			status = "disabled";
+		};
+
 		i2c4: i2c@1c2c000 {
 			compatible = "allwinner,sun6i-a31-i2c";
 			reg = <0x01c2c000 0x400>;
-- 
2.25.1

