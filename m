Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A1CA418340
	for <linux-sunxi@lists.linux.dev>; Fri, 16 Oct 2026 09:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792142230; cv=none; b=YoDJVryilmm+K+KnbKGY/ejgnkgxfvgXJlDLgp3qvg0M+ReHkhA/bR1rZM+8s1YZaAONsmtTYItamiMBuofV7jrpT7hw5EhhG23AmAzGXl0UHnVz1pCqQjrXaWeYPuQ6DaEfN9Eolfr9KCUDJTV0XqhosKBc3xYSbArxzq9dD+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792142230; c=relaxed/simple;
	bh=5FA+o6Bd0GGbcLX7H7LrsM5mOmRN0Glct79ZLwQSjb8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aHI7BC/ZRYd0Uv8AgyXqW80XT4cTy5x7GcKDhWwfdmeDb0DhU9hRcOFXFpaGz2cwP41Grpp41zV5XK9AlQa5RBQQRUa4j6HLFJIeOD3Z8AsOzAH9uKIZEDLeCdRvGNxhXpOV25EstLyYsJgeHSa2EOGAWFk5/610kLQkJVp8AmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mpAFUjm6; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mpAFUjm6"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a17baef589so26400015e9.0
        for <linux-sunxi@lists.linux.dev>; Fri, 16 Oct 2026 02:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792142227; x=1792747027; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jpoCXXA+4Dxv7CGXvWoJAsrnicmQLNQevk6y5xHl3wI=;
        b=mpAFUjm6k5eXEEou4oZ8cegOm/FsmK6p2Mc1PpJOcr+6K4kPBeRg7bQkqVVmUciE5g
         qKSUHiGwscsPXwZGHXx0fEGMD1QzhE2Yz21z7nDKcE4osArZk0WvoDEkCc6iXcct5hk4
         7T9i1O6NkAoyZRv5Vlgns8E+WjE1u9m1nkOezZYk5PS7UBqUAldNxdJ9BPW8jlE2LxRB
         pVFZvC4hm1SyTHZwx7AVFXfl2XmXbr9na9qBwVcSeogGnzR2bELjho9hYSU1VbdaEAc9
         TwFUDl8vd9Y2KdghTNmnhj2d6jw8FFNPmloQkBMj86qs8bIL6vI9f/5VJE5Qd8TVNyOB
         rEHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792142227; x=1792747027;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jpoCXXA+4Dxv7CGXvWoJAsrnicmQLNQevk6y5xHl3wI=;
        b=nvKMRwIUVBwzANSQDpA2E8caAIrDRDFXxgBI1T02mXQoRbaU29gbMjEa3V2rpFAphE
         vKoL79LnQPajMWuL76aEbB5mFRJhWG5ynnqMOQUcyD3q83ZfYhodylwFJCp01cSjFfNn
         UYzmIu1HlXe9OR6Occ7R4DLDBKtpq85Dw0RYfj0LvahG1dQ4vWYvh0WYgi1MKKiOTRab
         te9O3oZZaMFfyE5E6wODodzcn0O4jMqEw4CnNO+ULSZQQlW73b8HEDSz3IakxdIvgnZX
         9ckNXSuyCoa/MKsWGx8eCU4DOIoPyhYQuWejFNnvxdEKVq1Ts8H1yYOlXZDKrOGQo+oi
         rpFg==
X-Forwarded-Encrypted: i=1; AKwUvBziQJVeCP9ZtO7apsRr3JEXyg0ZTEk37j0s4aFwKY3b1L5Um6Zj4AnOPqRqJsdLbOAd3dKrSbapOp1UtA==@lists.linux.dev
X-Gm-Message-State: AFq9FYI9BABClB8Ay8g+x49GTJ0V1LujF0Gwma2sc3vmJxPn+C/L6pue
	w+7nuYCD9TDSpfYQHxWqQ0XhEWvmDNTT3Yce10UdjbAL+FdOjaMXXoENX0aESd2X+ijF5w==
X-Gm-Gg: AYBFou1VXzKHkLQ42lVKUanH6fDyTh5oYQnYC5dtcn3nYuwOakNaxpxwSIZcdaOU1d4
	olwlvCiY25qd2gs7dewNoQNNQqrZS5yUZ0osdNSvEGJvFbT6lSFO5DAJkRuRhfK6lJbyCL/b2yF
	XYwT8Pj+5tK5E8Vp25LDwo+HmMLL7yRIVByruhwZFHXG0mBFDXVIxl7TVbzoevb7HtKtabGNv8A
	QPEw+UTfZkiRf6ifFzP8q3VtkBq7FOFYDoiXHhwapqd5GrMu+Uel50UliOKaIsu5hbcECwZC6E0
	mofROberGGJfXeIiAVcoVYfAAtoP1I1/dpEW25DR+31k+kF+QD48gilbI8oPSNdYG7CXR8ua5qE
	1Nfcyot8zC/elZCVDEiY6S7LocfNyaDlAI4jYbD/Mvj7OCi1k/Ry200YQcPhnIl7/4YUtBa7H0Q
	G8CUggpnbqkPg8G2Jf+588uagPOEoaCBAFA8GXoOO/1RpUG0f+qbtyt9iGk9o=
X-Received: by 2002:a05:600c:3b8b:b0:4a1:811c:8078 with SMTP id 5b1f17b1804b1-4a18e4a7cfcmr545274385e9.26.1792142226569;
        Fri, 16 Oct 2026 02:17:06 -0700 (PDT)
Received: from debian.tfbnw.net ([2620:10d:c092:400::4:7d8a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4ee183sm3692331f8f.29.2026.10.16.02.17.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 02:17:05 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>,
	u-boot@lists.u-boot-project.org
Cc: Tom Rini <trini@konsulko.com>,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 3/7] dt-bindings: clock: add the Allwinner B288 CCU
Date: Fri, 16 Oct 2026 10:16:04 +0100
Message-ID: <20261016091608.121842-4-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261016091608.121842-1-pmazzini@gmail.com>
References: <20261016091608.121842-1-pmazzini@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The clock and reset indices of the B288 CCU, as under review for Linux.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 include/dt-bindings/clock/sun8i-b288-ccu.h | 82 ++++++++++++++++++++++
 include/dt-bindings/reset/sun8i-b288-ccu.h | 45 ++++++++++++
 2 files changed, 127 insertions(+)
 create mode 100644 include/dt-bindings/clock/sun8i-b288-ccu.h
 create mode 100644 include/dt-bindings/reset/sun8i-b288-ccu.h

diff --git a/include/dt-bindings/clock/sun8i-b288-ccu.h b/include/dt-bindings/clock/sun8i-b288-ccu.h
new file mode 100644
index 00000000000..c9b9eaf979a
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
index 00000000000..67514565454
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

