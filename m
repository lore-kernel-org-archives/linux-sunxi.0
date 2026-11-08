Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794153497;
	b=jykLTD47eTUXTT3QSj/3A5IxbcMisUi2yHxdJnLhAMPRZ5F0VRS5HMakIqFGqn8M9D1G
	 USC9Kyjtaj5pYf6FCLMrqekrvnNhxiVhYRh7NjlzYV13WRlKSkrFNP52cUoarpN6Npy5f
	 MGuw+i+fOUG4L5LV1vWAkgdruwLQ+YQznL09IJQQmg9ubEACr/mG93VKolWO7vEI5uTJq
	 Fxy2UgnDYYCIls3FjEfBuqdyrRmY4A5mA/njOsj7ii6xKYvGisIp0Rbubs1Zs/650IYwT
	 iOxToAGcpCWg7KasFjuzVdom+ZrSku4qih4nINbqA9vQs/WXB/Rpnx2dsbrv7uOkYGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794153497;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=i1WY2bokB2/Ue8Pd5z/j/FUW7ky8/bU+qddAvCVhc7E=;
	b=FNauGEE1ySFNBOE9Rwm3fD0wnI+GdKTRnzcM2yJVs+g49a8F3MmWWQnabHj+XidrV1Lp
	 HR03jwycc17bRXki2Otfb4nUERR7/7W3fkm9W8SByJTzZ7nntDZ13IUiS1o7kUAqNUmPj
	 7iNDSbRusFuMTX738ajK9LAHBjKGNN5nX+S0CKX522Dntk+My46c4d+YxQG9ALuB/0v9Q
	 bT0W5RPs+vO3R8xVBJTvbiwR72JvPjWQ8yUiad4HrVunLreEAvVxlW2KzcIe6/9gFs0Ck
	 dP4JRpgcGfGShtkrdeZFC2xH8Exx71biKK/IYVwVSM6dX29QpsydQM7x3NQH6EQtbWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=id4jpDxo;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F5F6606A338
	for <linux-sunxi@lists.linux.dev>; Sun,  8 Nov 2026 15:58:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F5F6606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=id4jpDxo
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-492f6b7f70dso73628f8f.0
        for <linux-sunxi@lists.linux.dev>; Sun, 08 Nov 2026 07:58:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794153496; x=1794758296; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i1WY2bokB2/Ue8Pd5z/j/FUW7ky8/bU+qddAvCVhc7E=;
        b=id4jpDxoQITatQLU8fKx+X3JgxRlbupLZYYTU9zK4eog9fBXdvEImH1Q/o1fgl1jQ/
         gtlZi1PUDyf+FLC8zDn+vDI/yTJWFDK91AJx0kJzfMTkz0SFqXpa/M2EhkeJ0lUq+m8S
         NaqU50zOm9+xp685Ukrk+6H1aryapdplX/e56ZAAv5ldttTOWQW8Q8nxe+cD5ussHk4b
         2mB7VzFWYRDlM88HWMpp7tBuvOHVmXMaekGj80wkEgoJLhBalwnMhY3tIvZynrG+ZXzx
         t64ja+foIbu5X9tutBWqm0GzcInn771AdjeHA3Eii4ehsfqIvgCNHm5OUkalsEG9glj4
         kygw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794153496; x=1794758296;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=i1WY2bokB2/Ue8Pd5z/j/FUW7ky8/bU+qddAvCVhc7E=;
        b=ZooxrUKxswkaIG4vVo471lwM+yS8PSfw6TLCv78LK0qHXzENkN1k2Qj5jNm4BD6aNN
         OLbx7zxlqjjeQ1rD73V8hng8qf57uW/UBGmIWR7yAgl07xPHIKdw1sg7BWtCHtqtU1JM
         dwwyVvrNzVyptBvMjin2IZ4xEkft/XoIKh7BM+AasM/hhtv0Egmk70hH//BdmGq4Jixa
         8NPjz8Yv2/xAwgBVzXEjxPIxxmlUIT+TivWiN4V6kKDIvIr4mMsI4K+4nuIyHiSc2UCn
         jJXmMygyb0MTIwM9QI1SRnfvszgWRQL12Ichza/OLhe1B90ispXJww24vsqOwnDUEcCb
         xr8A==
X-Forwarded-Encrypted: i=1; AL+hErG1wG/114ilkWVhKw5pczWJMlOPh+N28BbiUY8XhsXZxFpMtTDGcNqKSX3HjfrcEI8XL6h9kbGe8Ogb6g==@lists.linux.dev
X-Gm-Message-State: APuU4Z99yz6M43zZDH4SIM+mM2R236DKkLjgEly9EZbcX4sn11f4LKSZ
	4pWHcJUavLYlC+L/HyHcHApbQ6MhuJKhoyQ+JEmZzKF1ShBBXcI1SKvI
X-Gm-Gg: AYBFou2mZDfXQKke1cqqGT/zfCc2zqsJJfI1Hn3x21sUdqW0RWPbjYcqJnnt2oVfUqH
	2WGad2X3MmnvhB6HkwTlm/IQcewLWh3UPdhq2O5U7tnohIyDA+neb6n1el8PTBa8I0sIKjYHUMM
	u6Rx8m+UBAE490ls6lNVSS4x4rBbMVjUMqhATE3KJ1wbpAdpiA71rnnlWZ0WmWzNBg3dAHur0ct
	+0bCVFUGRqepTFjmN/R92lujilbflpb6KqBN2v6wWMIJo3vF+n8/kvwQteKZoKIorHizMhPxtAS
	gVRObpvGgOiZ9rLiexg8/XitMnCWxbQGFCZcskrPupxNCgmMvXCmJphAEZMUAkshlZzkAL7srVt
	zPbugSrzwIsvH4luYt/KsdxV7/yk7nZEP9t5he52Uy1TXJa7HjQGLARGGZlpcoWnz2tHUyA6+aN
	QHjnaGupKmOAbFFd+mpN6xsooQICtSIsdIXvFeiHPe0ACbG8HcG56tY4RkZuRG9tlwtYDPRp+f4
	P7KQnVj+GRHsq19AEs0yvJyIKTxN8EAgsr3uSNx/ZX5eDgQqw4CkUX1A/5eVrOLto/fCFJW1jb5
	rcK9ipm43xM0aA/QODJhXs54v62KIvFOEAexX1BIHTg1tBoSAaL0gRUjjXgDbjk=
X-Received: by 2002:adf:e199:0:b0:48e:84e8:88c3 with SMTP id ffacd0b85a97d-49580830930mr2975816f8f.5.1794153495753;
        Sun, 08 Nov 2026 07:58:15 -0800 (PST)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-495966f316esm4753282f8f.17.2026.11.08.07.58.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 07:58:15 -0800 (PST)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Brian Masney <bmasney+clk@redhat.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Andre Przywara <andre.przywara@arm.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 1/3] dt-bindings: clock: sun4i-a10-ccu: add Allwinner B288
Date: Sun,  8 Nov 2026 15:56:59 +0000
Message-ID: <20261108155702.361022-2-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261108155702.361022-1-pmazzini@gmail.com>
References: <20261108155702.361022-1-pmazzini@gmail.com>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The B288 (sun8iw10p1) is a dual Cortex-A7 SoC used in e-book readers.
Its CCU needs only the two oscillator inputs, so it fits the existing
schema without changes.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
Moved unchanged from the B288 series v4.
---
 .../clock/allwinner,sun4i-a10-ccu.yaml        |  1 +
 include/dt-bindings/clock/sun8i-b288-ccu.h    | 82 +++++++++++++++++++
 include/dt-bindings/reset/sun8i-b288-ccu.h    | 45 ++++++++++
 3 files changed, 128 insertions(+)
 create mode 100644 include/dt-bindings/clock/sun8i-b288-ccu.h
 create mode 100644 include/dt-bindings/reset/sun8i-b288-ccu.h

diff --git a/Documentation/devicetree/bindings/clock/allwinner,sun4i-a10-ccu.yaml b/Documentation/devicetree/bindings/clock/allwinner,sun4i-a10-ccu.yaml
index 1690b9d99c3d..cc3f62d3554c 100644
--- a/Documentation/devicetree/bindings/clock/allwinner,sun4i-a10-ccu.yaml
+++ b/Documentation/devicetree/bindings/clock/allwinner,sun4i-a10-ccu.yaml
@@ -28,6 +28,7 @@ properties:
       - allwinner,sun8i-a33-ccu
       - allwinner,sun8i-a83t-ccu
       - allwinner,sun8i-a83t-r-ccu
+      - allwinner,sun8i-b288-ccu
       - allwinner,sun8i-h3-ccu
       - allwinner,sun8i-h3-r-ccu
       - allwinner,sun8i-r40-ccu
diff --git a/include/dt-bindings/clock/sun8i-b288-ccu.h b/include/dt-bindings/clock/sun8i-b288-ccu.h
new file mode 100644
index 000000000000..c9b9eaf979ad
--- /dev/null
+++ b/include/dt-bindings/clock/sun8i-b288-ccu.h
@@ -0,0 +1,82 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
+#ifndef _DT_BINDINGS_CLK_SUN8I_B288_H_
+#define _DT_BINDINGS_CLK_SUN8I_B288_H_
+
+#define CLK_PLL_CPUX	0
+#define CLK_PLL_AUDIO_BASE	1
+#define CLK_PLL_VIDEO0	2
+#define CLK_PLL_DDR0	3
+#define CLK_PLL_PERIPH0	4
+#define CLK_PLL_VIDEO1	5
+#define CLK_PLL_24M	6
+#define CLK_PLL_PERIPH1	7
+#define CLK_PLL_DE	8
+#define CLK_PLL_DDR1	9
+
+#define CLK_PLL_PERIPH0_2X	10
+#define CLK_PLL_PERIPH1_2X	11
+#define CLK_CPUX	12
+#define CLK_AXI	13
+#define CLK_CPUAPB	14
+#define CLK_AHB1	15
+#define CLK_APB1	16
+#define CLK_APB2	17
+
+#define CLK_NAND	18
+#define CLK_MMC0	19
+#define CLK_MMC1	20
+#define CLK_MMC2	21
+#define CLK_MMC3	22
+#define CLK_SPI0	23
+#define CLK_SPI1	24
+#define CLK_SPI2	25
+#define CLK_DRAM	26
+#define CLK_DE	27
+#define CLK_EE	28
+#define CLK_EDMA	29
+#define CLK_TCON0	30
+#define CLK_MBUS	31
+
+#define CLK_BUS_THS	32
+#define CLK_BUS_NAND	33
+#define CLK_BUS_SDMMC0_BUS	34
+#define CLK_BUS_SDMMC1_BUS	35
+#define CLK_BUS_SDMMC2_BUS	36
+#define CLK_BUS_SDMMC3_BUS	37
+#define CLK_BUS_SPI0	38
+#define CLK_BUS_SPI1	39
+#define CLK_BUS_SPI2	40
+#define CLK_BUS_I2S0	41
+#define CLK_BUS_I2S1	42
+#define CLK_BUS_SPDIF	43
+#define CLK_BUS_DSD	44
+#define CLK_BUS_DMIC	45
+#define CLK_BUS_USBOHCI0	46
+#define CLK_BUS_USBEHCI0	47
+#define CLK_BUS_USBOTG	48
+#define CLK_BUS_DE	49
+#define CLK_BUS_EE	50
+#define CLK_BUS_TCON0	51
+#define CLK_BUS_CSI	52
+#define CLK_BUS_ADDA	53
+#define CLK_BUS_SDRAM	54
+#define CLK_BUS_PSRAM	55
+#define CLK_BUS_DMA	56
+#define CLK_BUS_UART0	57
+#define CLK_BUS_UART1	58
+#define CLK_BUS_UART2	59
+#define CLK_BUS_UART3	60
+#define CLK_BUS_UART4	61
+#define CLK_BUS_UART5	62
+#define CLK_BUS_TWI0	63
+#define CLK_BUS_TWI1	64
+#define CLK_BUS_TWI2	65
+#define CLK_BUS_PIO	66
+#define CLK_BUS_GPADC	67
+#define CLK_BUS_KEYADC	68
+#define CLK_MMC0_SAMPLE	69
+#define CLK_MMC0_OUTPUT	70
+#define CLK_MMC1_SAMPLE	71
+#define CLK_MMC1_OUTPUT	72
+
+#endif
diff --git a/include/dt-bindings/reset/sun8i-b288-ccu.h b/include/dt-bindings/reset/sun8i-b288-ccu.h
new file mode 100644
index 000000000000..675145654548
--- /dev/null
+++ b/include/dt-bindings/reset/sun8i-b288-ccu.h
@@ -0,0 +1,45 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
+#ifndef _DT_BINDINGS_RST_SUN8I_B288_H_
+#define _DT_BINDINGS_RST_SUN8I_B288_H_
+
+#define RST_BUS_THS	0
+#define RST_BUS_NAND	1
+#define RST_BUS_MMC0	2
+#define RST_BUS_MMC1	3
+#define RST_BUS_MMC2	4
+#define RST_BUS_MMC3	5
+#define RST_BUS_SPI0	6
+#define RST_BUS_SPI1	7
+#define RST_BUS_SPI2	8
+#define RST_BUS_I2S0	9
+#define RST_BUS_I2S1	10
+#define RST_BUS_SPDIF	11
+#define RST_BUS_DSD	12
+#define RST_BUS_DMIC	13
+#define RST_USBPHY0	14
+#define RST_BUS_OHCI0	15
+#define RST_BUS_EHCI0	16
+#define RST_BUS_OTG	17
+#define RST_BUS_DE	18
+#define RST_BUS_EE	19
+#define RST_BUS_TCON0	20
+#define RST_BUS_CSI	21
+#define RST_BUS_ADDA	22
+#define RST_BUS_WLAN	23
+#define RST_MBUS	24
+#define RST_BUS_DRAM	25
+#define RST_BUS_PSRAM	26
+#define RST_BUS_DMA	27
+#define RST_BUS_UART0	28
+#define RST_BUS_UART1	29
+#define RST_BUS_UART2	30
+#define RST_BUS_UART3	31
+#define RST_BUS_UART4	32
+#define RST_BUS_UART5	33
+#define RST_BUS_I2C0	34
+#define RST_BUS_I2C1	35
+#define RST_BUS_I2C2	36
+#define RST_BUS_GPADC	37
+#define RST_BUS_KEYADC	38
+
+#endif
-- 
2.52.0

