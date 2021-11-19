Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14A862C8B
	for <linux-sunxi@lists.linux.dev>; Fri, 19 Nov 2021 19:15:16 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id bu18so48012695lfb.0
        for <linux-sunxi@lists.linux.dev>; Fri, 19 Nov 2021 11:15:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wirenboard-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9V4Hpv6UNWdRgHARpjljLPLAlbYv9H5cBhCpbSSCi+c=;
        b=f7rVKibT3ecrqCR0cs8vfe4FUDUZpkC2KqGSAXEQMFj2vekBjOILbMhzEq1i6vPYzT
         3vy8ZsvpvNMVwxYAXZSVCOjOr9rQzEWPk9vLd+YWzFq9qtayWT8X6yzYGM8eF8zjCu1u
         Fx84ccQbk4K/fRYJaHwUatGQcDF21etw/xzCK7cL49iFR+WTzKu6vs6GMQpv2O4DV0hk
         /o9u9J3r0xpbHuEHLdS5f4FF/a7JqBUdOu91yujKs1xRPuHBu67Ti2viXY/nu6eLZX/0
         9H6kmTQxh8fyFSTA04h0NyrN4o1mkpweRVYDSuoqMcfz8+DQYcD69fKBjyQowYhwB5za
         yO0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9V4Hpv6UNWdRgHARpjljLPLAlbYv9H5cBhCpbSSCi+c=;
        b=kXUGg/gcSghVgCmsKzaNoPKRTlmouIqwwwt49RTw8pNBHjje3HPc6bKzpPtU7pkszh
         Ghq/bz3NCLeVyjMFw3lsk8cEej8vGsDBnj8auzRxlB0+0ljL4pfqN/KsDlZzJUfd8sAw
         ackIhBQw4lZn4jn4CG0ovooYTBnnhT8EwzJPeziHV2bdMfWkxxdFfgp2CeV98f8a33WK
         uexA6vZjpbkRTDIbJI5damLfAlD2s6aVXzaISpLSS8S5rZIVz9K7IvtjsR7tLP9rIhzf
         PpN2TjS2ItidFLHjA6I4K/73BQNltEdCxDfZ1ZJkpu7BT9H5fayczOH39WHFiejrXqOL
         nVvw==
X-Gm-Message-State: AOAM530JMSbcZ/9YI47dvM5n5fphxAfkeMMP4s2oesl1olrUY9MWeeGe
	epFoYB7630rXY/kF3wkZB2Hj4A==
X-Google-Smtp-Source: ABdhPJxHKK81BOCRmq9i0bH5Ik3SOWDmpYRjcSqLtGov2dr/uD2ezBgt0kps6WS4s0VWUQp3y4f0xg==
X-Received: by 2002:a19:6412:: with SMTP id y18mr36119126lfb.494.1637349314198;
        Fri, 19 Nov 2021 11:15:14 -0800 (PST)
Received: from boger-laptop.lan (81.5.99.121.dhcp.mipt-telecom.ru. [81.5.99.121])
        by smtp.gmail.com with ESMTPSA id d4sm67676lfg.153.2021.11.19.11.15.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Nov 2021 11:15:13 -0800 (PST)
From: Evgeny Boger <boger@wirenboard.com>
To: Chen-Yu Tsai <wens@csie.org>,
	linux-sunxi@lists.linux.dev,
	Maxime Ripard <mripard@kernel.org>
Cc: Evgeny Boger <boger@wirenboard.com>,
	Lee Jones <lee.jones@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 3/3] ARM: dts: sun8i: r40: add rtp node
Date: Fri, 19 Nov 2021 22:14:56 +0300
Message-Id: <20211119191456.510435-4-boger@wirenboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211119191456.510435-1-boger@wirenboard.com>
References: <20211119191456.510435-1-boger@wirenboard.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

R40 SoC has touchscreen controller also serving as general-purpose ADC.
The hardware is very similar to A31, except that R40 has separate
calibrated thermal sensor IP, so temperature sensing channel in RTP is
not documented and is not to be used.

Signed-off-by: Evgeny Boger <boger@wirenboard.com>
---
 arch/arm/boot/dts/sun8i-r40.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-r40.dtsi b/arch/arm/boot/dts/sun8i-r40.dtsi
index 1d87fc0c24ee..3e98f24c1400 100644
--- a/arch/arm/boot/dts/sun8i-r40.dtsi
+++ b/arch/arm/boot/dts/sun8i-r40.dtsi
@@ -786,6 +786,14 @@ ths: thermal-sensor@1c24c00 {
 			#thermal-sensor-cells = <1>;
 		};
 
+		rtp: rtp@1c25000 {
+			compatible = "allwinner,sun8i-r40-ts",
+				     "allwinner,sun6i-a31-ts";
+			reg = <0x01c25000 0x100>;
+			interrupts = <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>;
+			#thermal-sensor-cells = <0>;
+		};
+
 		uart0: serial@1c28000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x01c28000 0x400>;
-- 
2.25.1

