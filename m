Received: from mail-oo2-f38.google.com (mail-oo2-f38.google.com [74.125.231.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE46F257ACF
	for <linux-sunxi@lists.linux.dev>; Sun, 27 Sep 2026 00:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790468468; cv=none; b=W/67FXYySzw2Aiy6LtXEaO7J2Mg/wCBlAlC8yPR5K0ZASsCnsGFmyOEbMxiTgmx+lpntuwCMv33YC0gujzdynR237S/TeyOciGbEGgMRUZtyrjPV89qziMJ2qezvt+4EhNXw33kECTWJkc234gTV46u9fK14WSrvMyAuxlNKdQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790468468; c=relaxed/simple;
	bh=8/pV73x78jrNfWMKzRpgQhL/uS+KEamSLh1zpjcATE4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DnHOrG8djOQWrgZT8efwo05wLxE48p1GuZcgJiYpNlOo+/wdkqgox99g6siJiJ0a/Sj1L31dH/zQCmNbpniiJNBYWDKGWM36oJVFrvz8x49h5/B6M3WcUJKp3WHEReIPmOfMHZBw3W0aRRPljjj2nuqnhqO8DG6JqjcIcCP8duw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sIUmwKXX; arc=none smtp.client-ip=74.125.231.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sIUmwKXX"
Received: by mail-oo2-f38.google.com with SMTP id 46e09a7af769-81be5042c56so50846a34.0
        for <linux-sunxi@lists.linux.dev>; Sat, 26 Sep 2026 17:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790468464; x=1791073264; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TIkNGJES0hm9OJqnA5eP6Pl3OVYCfTyaqkdgFUAgvWM=;
        b=sIUmwKXXGQNxUq7+tYNiyZdO3PBJmeyqb6xDrOEsOPEXf1Jp/Of/YjY95Cdo9sE0s3
         049DECAQSc5ffFy1EeWIjFO6Hrb2Af2ueeiWBLUE9KPJdayEhFW1rQ0NVRS4cHch5XGJ
         prZl9wBaB4CgExDr+fuyzGW61F0C1Sid9oYvCOizh0GE8XXhEEfquOJT+OA4uSlEgra9
         q1nhlPuMgjkbT+Tw6quJdj38XOghqNHNZoVwmcnkeAONuu/QrSzCdJYvk5Vq4XzL86Au
         HQbeRKRUd8Y+viZ2qmNMXpymKbVY/jGMvWlNgzo8C2Co1Mu8csG8v5XMKpYoc7JkPHYq
         Es4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790468464; x=1791073264;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TIkNGJES0hm9OJqnA5eP6Pl3OVYCfTyaqkdgFUAgvWM=;
        b=uITsG440G1b1v6xBDpKTcoHhpueLochTBABJbaKixf8O8YoSS7CjBADqiQmnLxLFlh
         DAvCoWMhk9q/bsT3M3lwhxeLzl4c6F94UbggfzmBsVTikZH9BNlfTXaVdf3EFnz/yTsW
         2Jy2EDyYyHDhy2tuStAxShselNZdNH60qSgnURsQBzzErotJaGXsT++8mnpMiQIIr+ul
         +YQ98sh78yQfwDsEIPmpb4I6sknjNs7npUCmcD9lAHxH4SE60rn0kGiAUY5paip2vcqR
         64+7FnsGT235s6/9JbLh7Wqb5RuLnOlrj7f9DCEtAn86LBaEY4zjCmAiRVDU5fM7oHW6
         Vxmw==
X-Gm-Message-State: AFuF++ktDrOYqSRCeXixfGRXHQL5n4Z+nBNWaDldG2c/Wgidw/MvFvvJ
	Xndkcr66qyrJu4H4dFHziKnk8u4pVehecf2xwWS4vIXl3s+wpLwTOhIGNzhQ+FRM
X-Gm-Gg: AYBFou10xDUm1ecpPbRQYoYSNnDdYswENMFlqVR7BhDj99RZr++wj06o7CRn55g57cC
	CTaZCH0+Gt6m6PTKJ2pcCL9UwbdESD/iZIJdNyFD0pz/yHvveEEea0RmSGwZAKq/QcCViLr8Zmh
	lcn+EWAUYGFHlYjVqWbnWPYdTm2o2HQ2UbxLEBAyt4YIlgFw/pZqhjZswIw8nEUGFUAnEWzrJy3
	+R9q2hv4LAfSoy76PlEr9zy2PfMhNCwhvxj0APvYe1aWpwV4LmO+cFDEMFCUYLxuA21+X+ZgIZ8
	QLc220J06xHUo/7Lfr3s1dz020uQI6y9vfZZjCDb4KnTDDE89WQ7fXwZhW2KQfZMKZAW1/AHcHu
	QlgJYH6e8VF40kGVwkbHOuta7Wofp4fNoX+cVbkodv6Tcw3SlnLr1aEADzgrfK21tridZKuJ9Dl
	qFuYYgjMY7RsrgOJBRKQjmfoQ2hz8P/emTZ35AuuvBA0rZEM8P+5mPPET3lxogIwdmTKq3dsasu
	I81miVjlSBrA3XEt8lBQQ==
X-Received: by 2002:a05:6820:61d:b0:6be:137b:3f98 with SMTP id 006d021491bc7-6d5b869c1f6mr6321898eaf.22.1790468464256;
        Sat, 26 Sep 2026 17:21:04 -0700 (PDT)
Received: from tcmichals-5759.lan ([2607:fb91:3584:35a9:66f8:2cb5:aa80:21fd])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6d8828e1ea0sm838989eaf.6.2026.09.26.17.21.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 17:21:03 -0700 (PDT)
From: Tim Michals <tcmichals@gmail.com>
To: linux-sunxi@lists.linux.dev,
	linux-remoteproc@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	andersson@kernel.org,
	mathieu.poirier@linaro.org,
	jassisinghbrar@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Tim Michals <tcmichals@gmail.com>
Subject: [PATCH v2 7/7] arm64: dts: allwinner: add a523 msgbox and remoteproc nodes
Date: Sat, 26 Sep 2026 19:20:16 -0500
Message-ID: <20260927002021.797069-8-tcmichals@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260927002021.797069-1-tcmichals@gmail.com>
References: <20260922034711.190253-1-tcmichals@gmail.com>
 <20260927002021.797069-1-tcmichals@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the hardware mailbox (CPUX_MSGBOX) node and the XuanTie E907 RISC-V
remoteproc node for Allwinner A523/A527/T527 SoCs.

Connect the remoteproc node to the MCU CCU clocks (bus, core, sram,
msgbox) and resets (cfg, core, sram, msgbox) and mailbox channels 8 & 9
for bidirectional host-coprocessor IPC.

Signed-off-by: Tim Michals <tcmichals@gmail.com>
---
 .../arm64/boot/dts/allwinner/sun55i-a523.dtsi | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
index 85ef492ffeae..b4699c4df5e9 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
@@ -605,6 +605,23 @@ dma: dma-controller@3002000 {
 			#dma-cells = <1>;
 		};
 
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
+			interrupt-names = "arm", "dsp", "cpus", "rv";
+			#mbox-cells = <1>;
+		};
+
 		sid: efuse@3006000 {
 			compatible = "allwinner,sun55i-a523-sid",
 				     "allwinner,sun50i-a64-sid";
@@ -1144,5 +1161,27 @@ npu: npu@7122000 {
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
2.43.0

