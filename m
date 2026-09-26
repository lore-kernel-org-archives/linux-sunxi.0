Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA39E314B66
	for <linux-sunxi@lists.linux.dev>; Sat, 26 Sep 2026 23:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790465198; cv=none; b=EI4TInoQK81huFKTqMsEfw3916OTVdyRNIkxcGPRIIShrDZ81CXA6Ffq0qzS6sds0nIwpCQ0IdyMB5tUOW1jF6I0r54SQmDjRLj6SDb68vUZ4NtdDDwpkGJdw5SFrKoAqGkF32yoaD8kP7ekeA3Wl+CnBuaubFw6Q2LcGWRvB6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790465198; c=relaxed/simple;
	bh=W5iZHw/9hbynSVMkDHufc1P8AF2PukWPWeCd4BJBy1A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZaJG72ILBB6krznHDzf6ZAyjsLVTMKRpwKKS5oxaGmc7Y4nidYMIVDnlCW3jNmQhXhqVr1hbHNLxceMy7ETJp1LrCTBVtu59+TbQIryLCse0HTMujSGNb68klULay9w7NIsr/Z171jNQkFsUPR+7vVOafSupii5yjoMyEZ2GPgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=CqGsx+28; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="CqGsx+28"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C397A1596;
	Sat, 26 Sep 2026 16:26:32 -0700 (PDT)
Received: from ryzen.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 68D633F85F;
	Sat, 26 Sep 2026 16:26:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790465196; bh=W5iZHw/9hbynSVMkDHufc1P8AF2PukWPWeCd4BJBy1A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CqGsx+28/+rPIouDhtlPfUGK+LTE/N5Ngf5iiuR+uTaiPTkCeXrkmQ6AN5VDAOEb5
	 UYPD346wMwDFLuEDgIoEi1/CKXXZLVmk2vpElrw/OCil08N1jhq57fIKJ66fHw0QTK
	 QlxtmAcS7VAoIiOc3FbLSfqP8jZEcz67LvkWEHEs=
From: Andre Przywara <andre.przywara@arm.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Per Larsson <per@palvencia.se>
Subject: [PATCH v2 1/2] arm64: dts: allwinner: a523: add EPHY 25MHz clock fanout pins
Date: Sun, 27 Sep 2026 01:21:41 +0200
Message-ID: <20260926232142.5244-2-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.4
In-Reply-To: <20260926232142.5244-1-andre.przywara@arm.com>
References: <20260926232142.5244-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Allwinner A523 SoC family provides two clock fanout pins, which are
backed by gated clocks fixed to 25 MHz, divided down from the main
peripheral PLL. Those are meant to clock an Ethernet PHY, and allow to
save an external crystal oscillator typically employed for that purpose.

Add the pin descriptions of the two pins for those clocks, one is within
the RGMII0 pins, the other within the RGMII1 pins, although the clock
fanout works completely independently from the two MACs.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
index 85ef492ffeae7..ce01fad22b469 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
@@ -147,6 +147,20 @@ pio: pinctrl@2000000 {
 			interrupt-controller;
 			#interrupt-cells = <3>;
 
+			/omit-if-no-ref/
+			ephy0_25m_pin: ephy0-25m-pin {
+				pins = "PH13";
+				allwinner,pinmux = <5>;
+				function = "ephy_25m";
+			};
+
+			/omit-if-no-ref/
+			ephy1_25m_pin: ephy1-25m-pin {
+				pins = "PJ10";
+				allwinner,pinmux = <5>;
+				function = "ephy_25m";
+			};
+
 			/omit-if-no-ref/
 			i2s2_pi_pins: i2s2-pi-pins {
 				pins = "PI2", "PI3", "PI4", "PI5";
-- 
2.46.4

