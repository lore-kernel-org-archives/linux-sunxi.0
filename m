Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDD09285CB9
	for <linux-sunxi@lists.linux.dev>; Wed, 22 Jul 2026 22:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784759420; cv=none; b=SEBh5iw6ZV5FbPmcgvlrHGndQEOUpYR9xXZm/iPGG8A2moy2IuPRlbMrZu0TQymFLElnGYvU5aidhA/S4mOPCbDxg4gyOQAsCBVvzEFqqw7NhhuArZkr022fTKSWl/pGU2nyQ4yNSKAaLChGIcOFyVYelxQE0+H+7MMcn7CHwjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784759420; c=relaxed/simple;
	bh=GEJgn95LVfTN0f7LCnR1Kb7DD6JzpxxaVqfo9augIsY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ttMEoZrJUox+4N+Er1iLLwtEIkpuYaKP119jS6OJXRUXfPbwn8iw4KgyYFg9OHIYsK9++0zkgd2zo1m7HYe2m7tFBTdcbDJJdXt4CV1rh1PEAE+6BDG7JPixyoVxWOZpPsymBUmXuUZlyw12itWi5qkhNZ2Yz/x9XAD0O/NbK78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=PFkuEqlb; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="PFkuEqlb"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 240561595;
	Wed, 22 Jul 2026 15:30:14 -0700 (PDT)
Received: from ryzen.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DE0DD3F86F;
	Wed, 22 Jul 2026 15:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784759418; bh=GEJgn95LVfTN0f7LCnR1Kb7DD6JzpxxaVqfo9augIsY=;
	h=From:To:Cc:Subject:Date:From;
	b=PFkuEqlbZtbWide5d48YajwaebabyjfwC2wrnCMbpT+edBo6s8ZijZ+rSE5LgriMj
	 tGBp3Qu+dG5Cc5ApROTcLIRmveaVFSZ7sM/TUQaJIOe8vd4Ea01v3OI4/Z0ejk+6ZD
	 fS+T9fE+QV4CWm3heFcLh4NhBqfdmDxs2nMBUPYI=
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
	linux-kernel@vger.kernel.org,
	Justin Suess <utilityemal77@gmail.com>
Subject: [PATCH] arm64: dts: allwinner: a523: enable IR on the Avaota A1
Date: Thu, 23 Jul 2026 00:26:27 +0200
Message-ID: <20260722222627.14138-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.4
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Avaota A1 board has an IR receiver chip on the PCB (next to the
Ethernet jacks), wired to the PI8 pin on the SoC.

Add the pin description to the PIO DT node, and enable the CIR receiver
in the main power domain.

Tested on the board with evtest and some random TV remote control.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
Hi,

this goes on top of Justin's A523/H728/T527 IR receiver series.

Cheers,
Andre

 arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi          | 7 +++++++
 arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts | 6 ++++++
 2 files changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
index 19771aac68e53..770433b4f905b 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
@@ -155,6 +155,13 @@ i2s2_pi_pins: i2s2-pi-pins {
 				bias-disable;
 			};
 
+			/omit-if-no-ref/
+			ir_rx_pin: ir-rx-pin {
+				pins = "PI8";
+				allwinner,pinmux = <3>;
+				function = "cir_rx";
+			};
+
 			/omit-if-no-ref/
 			ledc_ph_pin: ledc-ph-pin {
 				pins = "PH19";
diff --git a/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts b/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
index 474354fbfcec1..994f1e4f0ce7d 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
+++ b/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
@@ -100,6 +100,12 @@ &gpu {
 	status = "okay";
 };
 
+&ir {
+	pinctrl-names = "default";
+	pinctrl-0 = <&ir_rx_pin>;
+	status = "okay";
+};
+
 &ledc {
 	pinctrl-names = "default";
 	pinctrl-0 = <&ledc_ph_pin>;

base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
prerequisite-patch-id: 7deae1861f99fd36ada1af9c830c337374a74980
prerequisite-patch-id: 0175281b3456fb2bfca8cc0e99238583682af0f1
prerequisite-patch-id: 93ebe68eb0b466e360c6a02e5d936be910c85752
-- 
2.46.4

