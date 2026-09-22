Received: from mail-yx2-f43.google.com (mail-yx2-f43.google.com [74.125.224.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F3863D3336
	for <linux-sunxi@lists.linux.dev>; Tue, 22 Sep 2026 03:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790048863; cv=none; b=CqqlRGQIdNPOxD/00VcYLJI4smiqmqk1dK0aXYAYoMTovxT/uUoJ1DhgOmQtdTy+OSb+jzzOkL4wDONHDMV6GiLIn7MSHmpbFlsVF/k0GLnoD16nvZ2PqojxLLVZ29+EGIYZ3iggzUfBd9PrxRXuPrZSLWaC8ZxXQ6Ns+TZlatg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790048863; c=relaxed/simple;
	bh=vs0p7aKfRjm32/JARKxXOJKs9GaInGuJp6lBcXmuJBA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o+7ov2MbmYmV4ZfHxxw9S50N953SfTIEOp2MtsVdY9eNcV/4oQuYL76o1TJ4NWKP9vpL3mrr0GXCU5SyHeLbiHogSF49GN2Qm7iPcQY2+Gs2CKzV5o+e811NM+/9g6PJOZ3jtwIMfVdFNVhjVsEvWtKmWGUkTkCATZvPWR8hoiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g8EtRJN1; arc=none smtp.client-ip=74.125.224.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g8EtRJN1"
Received: by mail-yx2-f43.google.com with SMTP id 00721157ae682-85d440939f0so28619017b3.2
        for <linux-sunxi@lists.linux.dev>; Mon, 21 Sep 2026 20:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790048861; x=1790653661; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4/zsDmJePgaslWzMD95723Em6EJMVLj62D0M57SSna4=;
        b=g8EtRJN1lbqyMcbSYqQ7VlVVQWjUlBGmOA2WhxTz58r8EOK0TEUq4BBAf3MRbkCUXj
         a2/atgxx1eotuLxSNTFCPuQuJ2gJOhZU9yseBavgYFyP8PWUpQ+pjQTHsIMnMMAiXd/5
         BWH/JEzR7/8rGvDnZc/TizCQF2LRc3AQQVosZRbKR/QRyl+i05MwGmqW9HNk2INgJKUj
         xqehOQOQlh1DADseKWnWMrRHVqsHICNrLhbxWyBaJFys7lThrz8+Gpy+fupGnnYQn+9M
         /tvbD11yNLg8Zqtb0+6oU1vGh1xI8Obzc0R1xex4aXodJFCXN5OTXqTdqFXYwsDcpx5N
         MmqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790048861; x=1790653661;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4/zsDmJePgaslWzMD95723Em6EJMVLj62D0M57SSna4=;
        b=gM5D/FtEGKAJtGphfDEuQQNWcfp1SI/j/WWBsRhH9zowKp/Xqxb27TYA/d28EKEhrX
         rvqIEKnAQ4UTMT8LuugYMy1Lqfv3xcF8LI/wgP+/ceV/L+mxdaeOeHUVRD/6mZXt1Bf4
         TVzOD7P8rHgN1TPReS9iXV8fpLX9OPX5q/ppa79R6Ry5AVLAgfr4kh0/uIXJ59kqf7yT
         NYYDd00J7ZaUYSppM6CG+8BWTM3IyYfAeEQaiVE+eJmmuK6CQFjrl2AiIFWatzrbBN4d
         jSlpFCiI8zRHpvGE5qC/iW2udYiA2WKDnKtOP/A1yly+F1ZikoWM42GARUdBFY8mBAM/
         Nb8A==
X-Gm-Message-State: AFuF++noFHETunAfNKrx5VqQfUxgJUQJiwKNSSLA8Z2WV3m7rh+lB/cW
	ss7x9JND208fdoWvgo2LtfGvRmciTdGOanwfMgrR55Lxu1zkDLWt5rsePLK+LFSK
X-Gm-Gg: AYBFou0nfoeATVOpv6WlmQrvil0m0PPGO3YYV8HTvXtqGmDJ/TRK+Gt4963PFaJy08X
	9lLrXBUWgbiX22FGd3d9BBX4hahBPOHUW4I7bJ4yif/N8B6CWXj3ZbzapoXfWpO7BBx99Q+Yrwm
	aTZJ78rKn76c7JAvzo2n6TzLf54zQwH3wiZ1EMvq+YETGzFSn1HAN/pFzbV5V/yO0hhWogH8XCV
	01oWIqXVELRH3nVSatFo6N7yedduHYZ5dfbF0LygEesB57Z/zbv1czsKAb0a7qPkbse7k5p6u+z
	ZLFKkg4x73h6cW02hZN0/OVFnC8BCQXqgKMhAf8DoD8RaWehvXOtlumcFGvRfBVx1PlKht3HORp
	s6jh6Jy9K5uZAi+loUu0D7Ms72wtNkx2yD4gWVfsCxSL3+zsE61Cg91KpSoye41461ejSeiZJ/k
	/sONrxPqmxjziqJTB6QPXLKmIwHw+bDaOZ4Vs7k/G2xVDOeiS5u+KyRXvefO+4krEjxQ==
X-Received: by 2002:a05:690c:e3cf:b0:88a:4770:c2e9 with SMTP id 00721157ae682-897308f88c2mr50874537b3.14.1790048861342;
        Mon, 21 Sep 2026 20:47:41 -0700 (PDT)
Received: from hp ([71.12.40.102])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8a2bd79e82bsm1822337b3.5.2026.09.21.20.47.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 20:47:41 -0700 (PDT)
From: Tim Michals <tcmichals@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	Tim Michals <tcmichals@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 7/7] arm64: dts: allwinner: add a523 msgbox and remoteproc nodes
Date: Mon, 21 Sep 2026 22:47:11 -0500
Message-ID: <20260922034711.190253-8-tcmichals@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260922034711.190253-1-tcmichals@gmail.com>
References: <20260922034711.190253-1-tcmichals@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the hardware mailbox (CPUX_MSGBOX) node and the XuanTie RISC-V
remoteproc node for Allwinner A523/A527 SoCs. Connect the remoteproc
node to the MCU CCU clocks (bus, core) and resets (cfg, core) to
support remote processor lifecycle management and RPMsg IPC.

Cc: Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Samuel Holland <samuel@sholland.org>
Cc: Andre Przywara <andre.przywara@arm.com>
Cc: Chen-Yu Tsai <wens@csie.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-remoteproc@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-sunxi@lists.linux.dev
Signed-off-by: Tim Michals <tcmichals@gmail.com>
---
 .../arm64/boot/dts/allwinner/sun55i-a523.dtsi | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
index 85ef492ffeae..7c5c39c56858 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
@@ -1144,5 +1144,44 @@ npu: npu@7122000 {
 			resets = <&mcu_ccu RST_BUS_MCU_NPU>;
 			power-domains = <&ppu PD_NPU>;
 		};
+
+		msgbox: mailbox@3003000 {
+			compatible = "allwinner,sun55i-a523-msgbox";
+			reg = <0x03003000 0x1000>,
+			      <0x07094000 0x1000>,
+			      <0x07120000 0x1000>,
+			      <0x07136000 0x1000>;
+			reg-names = "arm", "dsp", "cpus", "rv";
+			clocks = <&ccu CLK_BUS_MSGBOX>;
+			resets = <&ccu RST_BUS_MSGBOX>;
+			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 181 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
+			#mbox-cells = <1>;
+		};
+
+		rproc: remoteproc@7130000 {
+			compatible = "allwinner,sun55i-a523-rproc",
+				     "allwinner,sun55i-a527-rproc";
+			reg = <0x07130000 0x1000>,
+			      <0x07280000 0x40000>,
+			      <0x072c0000 0x40000>,
+			      <0x07010364 0x4>;
+			reg-names = "cfg", "r_sram", "r_sram1", "remap";
+			clocks = <&mcu_ccu CLK_BUS_MCU_RISCV_CFG>,
+				 <&mcu_ccu CLK_MCU_RISCV>,
+				 <&mcu_ccu CLK_BUS_MCU_PUBSRAM>,
+				 <&mcu_ccu CLK_BUS_MCU_RISCV_MSGBOX>;
+			clock-names = "bus", "core", "sram", "msgbox";
+			resets = <&mcu_ccu RST_BUS_MCU_RISCV_CFG>,
+				 <&mcu_ccu RST_BUS_MCU_RISCV_CORE>,
+				 <&mcu_ccu RST_BUS_MCU_PUBSRAM>,
+				 <&mcu_ccu RST_BUS_MCU_RISCV_MSGBOX>;
+			reset-names = "cfg", "core", "sram", "msgbox";
+			mboxes = <&msgbox 8>, <&msgbox 9>;
+			mbox-names = "rx", "tx";
+			status = "disabled";
+		};
 	};
 };
-- 
2.53.0

