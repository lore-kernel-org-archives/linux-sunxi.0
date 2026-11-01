Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793559477;
	b=LkM5+p3Kpe487Imy9XvNZVbD3tdVYbx4vRGf/G+zvzHMjIZEx82VWgpSThLIzIximTh1
	 w1ft/nVzApKTDCXBGVZpdcXZjjepPxWIjm+qfMAg3mzfpMLFbMlauLovhi6Vh6oqPId11
	 m9EcFrdwVc274MaUBR1W1oCRJSyLaUALKjQwoFfYPawqa1f6sqzHyc4cRrIwZAVvF0dlu
	 4zTzZ0nCRkF96DdUD/mUHqN30JtlTXrDPuSsACOCdmwEsCyhMO2FnegJoBrxA0r0l8wHW
	 3M7WFWvjE5c1mgUZ85s8e3KW/Z0R/yZAIfrxLeVCyrsyM+fDfvARwS+iZe1dzmhcM2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793559477;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=RMZ3p8klhNcSbnVfVK6IB8YKNvjqcF62RjoXmPpSb6g=;
	b=ivvUFhKpg6fXiGnEoxamzKfYnZNnI/lRE6gaFlft/fdzytQLDI4qX/t6JA2qrk1V9ZWZ
	 aCmuU7OGu4rB+jPZPYDRm0tiMlcqkvEbF1LNO3aSSP73ZYxyPBnttHYO4J+YBLjSPZL9l
	 fRYDOl5DLK+PdhhkkGjDGGPWYBoqowBFTY18/lLWGcJyqA9iy17ijo+obLdKbVOWyxnN/
	 9Hp7sgXSOV1i5urhjo/OdRj10qs81iDG6/bR2GHLrUch4ght+m2kH1jzsE/mcsFrxDuDR
	 Lb9QlbREfLB0V/owxxshIboIK3vLpERaXbvezkS3+UvrYcvp8CwDUzRvRCy0r8RC3Sw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="QyOm/F73";
	arc=none smtp.remote-ip=209.85.128.177
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3412560A2633
	for <linux-sunxi@lists.linux.dev>; Sun,  1 Nov 2026 18:57:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3412560A2633
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QyOm/F73
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-8ab38a051aaso21799027b3.3
        for <linux-sunxi@lists.linux.dev>; Sun, 01 Nov 2026 10:57:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793559475; x=1794164275; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RMZ3p8klhNcSbnVfVK6IB8YKNvjqcF62RjoXmPpSb6g=;
        b=QyOm/F73fasOnt0hVHw+D5gLPhyPEjXKlOR3loAY14KXE02GD6f7HEExxmCxol6x58
         3Sxqb0b6uyydIjepFLSEuODNDZxZFFeZgpDJJC5JJLIlizHgJRxXQNqdpeKofrL0o68R
         KKv5ATlcvnr+oW964HpSWs8pQWhHhVIBnpdVvkuWn+3VKd1XYU7/XNPtPHutng34uTc9
         6Z3yDxalvMrg7St5by2RJC2mSoAIvWsCBtT6TpAvytQtOqQu3YzyKaon914/1Y+YEjb0
         xuA07h89Dns0Lq70J3jonRGjo7dR4lRZ9g6xS3n/ujKgL1sz4oZB9D2X+bdnCNm2feC1
         YKyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793559475; x=1794164275;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RMZ3p8klhNcSbnVfVK6IB8YKNvjqcF62RjoXmPpSb6g=;
        b=AGtLcr9ee1bxlos90Eaf/+1szWNXkbdMTacjo5EnRLZJDVX9lfhYqCnJTXc5Ws5mMK
         gurG16crSobht9bzl6XvsbYLsSuwZZQXkUd2GqMmdiTuhZf8CK0Wiwqr2C0B4QLyORLS
         P/R9NohkrYDRptnPsIzt4I0OlDAOTLRNZ9BZUvYMbgZB244nGxEnjbktnolSKdi9cYQy
         XpDpGMeco2zCObBDlPfs7EFIrIlAclt0hy7mc+fTWvfNcKVl4lSFaQtE/4yAv3W2AK4k
         VTPCQVTzfjHzrpTPearVXFZ2k9RGquf2jx0Ix0bmtNeTTDwD3fU8jTWovvQFcO6X1hoI
         kdSw==
X-Gm-Message-State: APuU4Z9N+9MXyuzcKYmyP34R4W/D5NCjzgg9beEgG/eOTdVeQZf5x+o4
	8k9PjDd8dVFSk6eePXUJ/l4zV26z6mm168vGEReisUaOMB5zb95dxZE7
X-Gm-Gg: AYBFou2YMy1kZOwoEXRE6/oqnRexZCNO0CL3GS3OeKeEW9DUNTFUqi6cFzyngXJirfX
	Fy/tlwkvzPq96ZskCeK4+xb3ovRdTgl3/ocb+GRVwh632Op/oXFKNDQSJU4LLmbyfwrBLSLzQSR
	L7Auii2GZ/DWAD1fDvpaoGdncMD9GPQp8M//ymr51KI6eVtFOG2PWkBbMUfTEbzkhhCmd1T9YVb
	myBjI8WORU7P5Pht8/ru68tgDpu0D0qLgirZ0KRGx2Fc93yNnyor/EN6SpZ/LLte3EbcVqAH3gB
	mj+cVo6Ji//+NIUkYEGaJP4QEa+wGS2xFxNfnhhgxDRBrWvtPI/4uNSgLE1nZc1XDkYDGvj+Nfl
	+DeRhbUESsnj2x3wJdQq4SGMcRUvsobZW2uCbbluptsjT/tiOCdnzHgM2DQ5foBvzZ66lkX8FJW
	m6VE//qX1+woqBMdjRjBseyvIK7bxX/PZZBFMY9qQAuUkuZZLCkTLWTQmRGSQsjx2haYZqqb7a5
	OSFr6Lc3XNUlx49Fl1st4xA3RDbkMoQfbRcSeL84we4o18Wjts8oAmQIsTdc+puRlVwJo9MPwtD
	W/JFFg5fn5X8SH9fpcvZD37PN1gv+NG083lqo8qQ9RNcxmWqdCyo3iDrnfxSu3swtZg=
X-Received: by 2002:a05:690c:1b:b0:8b0:dc77:6b29 with SMTP id 00721157ae682-8b2b6790179mr69509227b3.55.1793559475269;
        Sun, 01 Nov 2026 10:57:55 -0800 (PST)
Received: from hp ([71.12.40.102])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b2b716d420sm40869397b3.33.2026.11.01.10.57.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 10:57:54 -0800 (PST)
From: Tim Michals <tcmichals@gmail.com>
To: Jassi Brar <jassisinghbrar@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-sunxi@lists.linux.dev,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Tim Michals <tcmichals@gmail.com>
Subject: [PATCH v3 5/7] arm64: dts: allwinner: a523: Add message box and remoteproc nodes
Date: Sun,  1 Nov 2026 12:57:33 -0600
Message-ID: <20261101185735.762559-6-tcmichals@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261101185735.762559-1-tcmichals@gmail.com>
References: <20261101185735.762559-1-tcmichals@gmail.com>
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

Add the message box node, with its four register banks, bank clocks
and resets, bank interrupts, and the XuanTie E906 remoteproc node,
with the MCU CCU clocks and resets, the RISC-V and SRAM power domains
and message box channel 9.

The remoteproc node is disabled; a board enables it together with its
firmware name and reserved memory regions.

Signed-off-by: Tim Michals <tcmichals@gmail.com>
---
Changes in v3:
- Message box: all four banks with their clocks and resets; the DSP and
  CPUS bank addresses were swapped in v2; remote bank interrupts
  corrected to SPI 181/174/205
- Message box: interrupt-names
- Remoteproc: debug reset, RISC-V and SRAM power domains, one message
  box channel; the message box clock and reset moved to the message box
  node; reg-names sram-a3-0 and sram-a3-1
---
 .../arm64/boot/dts/allwinner/sun55i-a523.dtsi | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
index 85ef492ffeae..316698b999c6 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
@@ -605,6 +605,31 @@ dma: dma-controller@3002000 {
 			#dma-cells = <1>;
 		};
 
+		msgbox: mailbox@3003000 {
+			compatible = "allwinner,sun55i-a523-msgbox";
+			reg = <0x03003000 0x1000>,
+			      <0x07120000 0x1000>,
+			      <0x07094000 0x1000>,
+			      <0x07136000 0x1000>;
+			reg-names = "arm", "dsp", "cpus", "rv";
+			clocks = <&ccu CLK_BUS_MSGBOX>,
+				 <&mcu_ccu CLK_BUS_MCU_DSP_MSGBOX>,
+				 <&r_ccu CLK_BUS_R_MSGBOX>,
+				 <&mcu_ccu CLK_BUS_MCU_RISCV_MSGBOX>;
+			clock-names = "arm", "dsp", "cpus", "rv";
+			resets = <&ccu RST_BUS_MSGBOX>,
+				 <&mcu_ccu RST_BUS_MCU_DSP_MSGBOX>,
+				 <&r_ccu RST_BUS_R_MSGBOX>,
+				 <&mcu_ccu RST_BUS_MCU_RISCV_MSGBOX>;
+			reset-names = "arm", "dsp", "cpus", "rv";
+			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 181 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 205 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "arm", "dsp", "cpus", "rv";
+			#mbox-cells = <1>;
+		};
+
 		sid: efuse@3006000 {
 			compatible = "allwinner,sun55i-a523-sid",
 				     "allwinner,sun50i-a64-sid";
@@ -1144,5 +1169,27 @@ npu: npu@7122000 {
 			resets = <&mcu_ccu RST_BUS_MCU_NPU>;
 			power-domains = <&ppu PD_NPU>;
 		};
+
+		rproc: remoteproc@7130000 {
+			compatible = "allwinner,sun55i-a523-rproc";
+			reg = <0x07130000 0x1000>,
+			      <0x07280000 0x40000>,
+			      <0x072c0000 0x40000>,
+			      <0x07010364 0x4>;
+			reg-names = "cfg", "sram-a3-0", "sram-a3-1", "remap";
+			clocks = <&mcu_ccu CLK_BUS_MCU_RISCV_CFG>,
+				 <&mcu_ccu CLK_MCU_RISCV>,
+				 <&mcu_ccu CLK_BUS_MCU_PUBSRAM>;
+			clock-names = "bus", "core", "sram";
+			resets = <&mcu_ccu RST_BUS_MCU_RISCV_CFG>,
+				 <&mcu_ccu RST_BUS_MCU_RISCV_CORE>,
+				 <&mcu_ccu RST_BUS_MCU_PUBSRAM>,
+				 <&mcu_ccu RST_BUS_MCU_RISCV_DEBUG>;
+			reset-names = "cfg", "core", "sram", "debug";
+			power-domains = <&ppu PD_RISCV>, <&ppu PD_SRAM>;
+			power-domain-names = "riscv", "sram";
+			mboxes = <&msgbox 9>;
+			status = "disabled";
+		};
 	};
 };
-- 
2.53.0

