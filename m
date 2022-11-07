Received: from mail.rnplus.nl (mail.rnplus.nl [178.251.25.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48A96122BC
	for <linux-sunxi@lists.linux.dev>; Mon,  7 Nov 2022 20:50:16 +0000 (UTC)
Received: from localhost (unknown [127.0.0.1])
	by mail.rnplus.nl (Postfix) with ESMTP id 1E764378521
	for <linux-sunxi@lists.linux.dev>; Mon,  7 Nov 2022 20:55:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at rnplus.nl
Received: from mail.rnplus.nl ([127.0.0.1])
	by localhost (mail.rnplus.nl [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sVCA2ZHjAAVk for <linux-sunxi@lists.linux.dev>;
	Mon,  7 Nov 2022 21:55:09 +0100 (CET)
Received: from mail.rnplus.nl (mail.rnplus.nl [178.251.25.70])
	by mail.rnplus.nl (Postfix) with ESMTPSA id 19466377FDD;
	Mon,  7 Nov 2022 21:55:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=rnplus.nl; s=dkim;
	t=1667854504; bh=j6/hl1Q/eLB5dfplzUEE3Y3Xcn8JgcBaeo5qHF07U1c=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=Sx6Ui834KnjajDINNMaoFkChSB9FS8NXlnkEeBY5rzPxCfrDtDn5EFVA3ubH/3b7e
	 oq6cl58fNCblM17SfHJDJxA03nrHfs3iwPBErDgl3OLaX5rkRXcqI4zmaOK1nWMH+d
	 Vp4BzvS8AGqFVec4tMIHmQfOIKnPjeB7oStdY8ZY=
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Mon, 07 Nov 2022 21:55:04 +0100
From: Renze Nicolai <renze@rnplus.nl>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Chen-Yu Tsai <wens@csie.org>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>
Subject: [PATCH v2] arm64: allwinner: a64: add device tree for SoPine with
 clusterboard
In-Reply-To: <334c5f69-2f25-aeb1-b87f-500cf2a6c205@linaro.org>
References: <b3b8320f0d2b54a0557331977582d05c@rnplus.nl>
 <334c5f69-2f25-aeb1-b87f-500cf2a6c205@linaro.org>
User-Agent: RN+ Webmail
Message-ID: <c2523181268451aa04a2474a2cf5bedb@rnplus.nl>
X-Sender: renze@rnplus.nl
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

Hello Krzysztof,

Thank you for your feedback! I've fixed the indentation and I've added 
the compatible and model elements.

Greetings,
Renze Nicolai


The Pine64 clusterboard needs a to have the tx delay changed to
500ps for ethernet to work. This solution was described by multiple
people on the Pine64 forum years ago and nobody has submitted it.

Add a device tree for SoPine with the clusterboard.

Signed-off-by: Renze Nicolai <renze@rnplus.nl>
---
  arch/arm64/boot/dts/allwinner/Makefile           |  1 +
  .../allwinner/sun50i-a64-sopine-clusterboard.dts | 16 ++++++++++++++++
  2 files changed, 17 insertions(+)
  create mode 100644 
arch/arm64/boot/dts/allwinner/sun50i-a64-sopine-clusterboard.dts

diff --git a/arch/arm64/boot/dts/allwinner/Makefile 
b/arch/arm64/boot/dts/allwinner/Makefile
index 6a96494a2e0a..15b011d1aaea 100644
--- a/arch/arm64/boot/dts/allwinner/Makefile
+++ b/arch/arm64/boot/dts/allwinner/Makefile
@@ -15,6 +15,7 @@ dtb-$(CONFIG_ARCH_SUNXI) += 
sun50i-a64-pinephone-1.2.dtb
  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-pinetab.dtb
  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-pinetab-early-adopter.dtb
  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-sopine-baseboard.dtb
+dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-sopine-clusterboard.dtb
  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-teres-i.dtb
  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a100-allwinner-perf1.dtb
  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h5-bananapi-m2-plus.dtb
diff --git 
a/arch/arm64/boot/dts/allwinner/sun50i-a64-sopine-clusterboard.dts 
b/arch/arm64/boot/dts/allwinner/sun50i-a64-sopine-clusterboard.dts
new file mode 100644
index 000000000000..f75325d43d76
--- /dev/null
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-sopine-clusterboard.dts
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+// Copyright (c) 2022 Renze Nicolai <renze@rnplus.nl>
+
+/dts-v1/;
+
+#include "sun50i-a64-sopine-baseboard.dts"
+
+/ {
+	model = "SoPine with clusterboard";
+	compatible = "pine64,sopine-clusterboard", "pine64,sopine",
+		     "allwinner,sun50i-a64";
+};
+
+&emac {
+	allwinner,tx-delay-ps = <500>;
+};
-- 
2.38.1

