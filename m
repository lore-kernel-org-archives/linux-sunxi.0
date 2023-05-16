Received: from the.earth.li (the.earth.li [93.93.131.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 469C5101D5
	for <linux-sunxi@lists.linux.dev>; Tue, 16 May 2023 17:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=earth.li;
	s=the; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:
	Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=EaPNEMUKyDQN26JSwTClLnrKV94BnN1/m1X9svWJsHE=; b=fgGNK20tVf6lKE/XBJsbvivEtj
	f89o+cJwIwkH8VRHgHAUUGq3Vdtdlzw4kD/LL1wTKVZtD32nazepzwJX8E3+R1aPcx/0u1YqRuerx
	RI4EuyoFxt7aMdiH6pYF8whMsbbYQHMB8cV/wxkccMzGq4gUUd2iqI6LpP25AbYCWySEVqCX1srIR
	ZXMDP2LtqAhjXtGCKaIdg4ankggG6DTN2rD9lST4EG+N4tZ3k0qqKcgKQBgSgHHgSg4JztVt9PTXZ
	0IxXjmqrNhQj0jWyR4WG0HJep1xDiaLj4StaaP8Ay1KBm10CLWJmDwW9GuiKeZIzK4NF+qIjznFJX
	PFIhpBdA==;
Received: from [2001:4d48:ad59:1403::16a3] (helo=earth.li)
	by the.earth.li with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <noodles@earth.li>)
	id 1pyymR-00GMvT-7Y; Tue, 16 May 2023 18:48:11 +0100
Date: Tue, 16 May 2023 18:48:05 +0100
From: Jonathan McDowell <noodles@earth.li>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Conor Dooley <conor+dt@kernel.org>, andy.shevchenko@gmail.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v3 4/5] ARM: dts: sun5i: Add port E pinmux settings for mmc2
Message-ID: <644b0a6aee41d205eb51d35365265ed63669707b.1684258957.git.noodles@earth.li>
References: <cover.1683719613.git.noodles@earth.li>
 <cover.1684258957.git.noodles@earth.li>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1684258957.git.noodles@earth.li>

These alternate pins for mmc2 are brought out to the 40 pin U14 header
on the C.H.I.P and can be used to add an external MMC device with a 4
bit interface. See

https://byteporter.com/ntc-chip-micro-sd-slot/

for further details on how.

Signed-off-by: Jonathan McDowell <noodles@earth.li>
Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 arch/arm/boot/dts/sun5i.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/sun5i.dtsi b/arch/arm/boot/dts/sun5i.dtsi
index 250d6b87ab4d..ab7f675aeec4 100644
--- a/arch/arm/boot/dts/sun5i.dtsi
+++ b/arch/arm/boot/dts/sun5i.dtsi
@@ -517,6 +517,15 @@ mmc2_4bit_pc_pins: mmc2-4bit-pc-pins {
 				bias-pull-up;
 			};
 
+			/omit-if-no-ref/
+			mmc2_4bit_pe_pins: mmc2-4bit-pe-pins {
+				pins = "PE4", "PE5", "PE6", "PE7",
+				       "PE8", "PE9";
+				function = "mmc2";
+				drive-strength = <30>;
+				bias-pull-up;
+			};
+
 			mmc2_8bit_pins: mmc2-8bit-pins {
 				pins = "PC6", "PC7", "PC8", "PC9",
 				       "PC10", "PC11", "PC12", "PC13",
-- 
2.39.2

