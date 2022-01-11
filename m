Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFAFF2CA3
	for <linux-sunxi@lists.linux.dev>; Tue, 11 Jan 2022 15:57:38 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id s30so30128835lfo.7
        for <linux-sunxi@lists.linux.dev>; Tue, 11 Jan 2022 07:57:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wirenboard-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=47xSV+aaBbv5R4/VZxIMXkl87pTBxA8gxKimR52zIw4=;
        b=xYt51TdBtGKqbhNBcKJ1NegEp9roXnfM0Awac3Ot4lBOZrN6bU7K1mmGM7sS6IA9dk
         PfKR/4fIe9N/K7Ysr9vbNeThsKwfkjB0/sMDMqQfQSGBXL4XD8Nln+mkIAajX5pk8c37
         Jj+5Eq9ekE/nke1mb2yL4NfB+Y5Rbpyh5C7fjkeH7cmhU9NZoeBIxHq/a9jgGc8KQzY7
         zg+cuKhA//SCsiHqshYQXGfx0jDQZ7scTlGVSJ2KY1UeViFPfwEgzRfKYJbvcyjrbu7T
         X2pIVwwqPPwoJukIIWAHPeVTEJ21qh17FpLXtGsRwyemwSbrkxnCxg4Ze6MJKXa7lb4f
         J6YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=47xSV+aaBbv5R4/VZxIMXkl87pTBxA8gxKimR52zIw4=;
        b=W0j7Cm8yvCAlRMHW3BPZLXBG5FOi2q5rHeysFuYxICMqXuejbhbeDKy0oHqwG085ZW
         GlGsW5UHWFN6gdksNvdK5iQD5clAwcHrgTbUXSRM6QhOCA3ZaY6B6T/wtR1UaS2D3miX
         LMIxn5YGRhrUqmHf/kLPawSY7U81VKvz+cviY39OV1dhSCTBvaAy20NBpUC0s1gmFuyz
         jh9zvbGBJE199r0BvbFmFxfkmtETjlzCoixNrmX1Lh42y2a6fJXrfXJuJVyrDnofpC/I
         jRcGhJU8GHs09GB4SZJkDTpcA5XHkePFXuWOE20w1OgzhxRV4UK649FipRYWWBwolvlV
         FHZQ==
X-Gm-Message-State: AOAM532N+K5wtr5CAFZSXxGcq/01dk2mWTrARRzUhLAK/qKxvDxb6Bu/
	0Q7XXLSvdO2F6CrY/aqHvotBQg==
X-Google-Smtp-Source: ABdhPJyO255tJMptzPXJzXNfFkOg0Wu92ztH4j40AdRIvV89TtHlMz6T2+uPCWJYvncbd5NL9VF04A==
X-Received: by 2002:a2e:8781:: with SMTP id n1mr3408385lji.96.1641916657189;
        Tue, 11 Jan 2022 07:57:37 -0800 (PST)
Received: from boger-laptop.lan (81.5.110.253.dhcp.mipt-telecom.ru. [81.5.110.253])
        by smtp.gmail.com with ESMTPSA id y7sm1370706lfa.92.2022.01.11.07.57.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 07:57:36 -0800 (PST)
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
Subject: [PATCH v2 3/3] ARM: dts: sun8i: r40: add node for CAN controller
Date: Tue, 11 Jan 2022 18:57:09 +0300
Message-Id: <20220111155709.56501-4-boger@wirenboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220111155709.56501-1-boger@wirenboard.com>
References: <20220111155709.56501-1-boger@wirenboard.com>
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
 arch/arm/boot/dts/sun8i-r40.dtsi | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-r40.dtsi b/arch/arm/boot/dts/sun8i-r40.dtsi
index 1d87fc0c24ee..2ba0e681a7ac 100644
--- a/arch/arm/boot/dts/sun8i-r40.dtsi
+++ b/arch/arm/boot/dts/sun8i-r40.dtsi
@@ -511,6 +511,18 @@ pio: pinctrl@1c20800 {
 			#interrupt-cells = <3>;
 			#gpio-cells = <3>;
 
+			/omit-if-no-ref/
+			can_pa_pins: can-pa-pins {
+				pins = "PA16", "PA17";
+				function = "can";
+			};
+
+			/omit-if-no-ref/
+			can_ph_pins: can-ph-pins {
+				pins = "PH20", "PH21";
+				function = "can";
+			};
+
 			clk_out_a_pin: clk-out-a-pin {
 				pins = "PI12";
 				function = "clk_out_a";
@@ -926,6 +938,15 @@ i2c3: i2c@1c2b800 {
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

