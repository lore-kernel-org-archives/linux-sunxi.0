Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C91593229
	for <linux-sunxi@lists.linux.dev>; Fri,  8 Jul 2022 17:45:40 +0000 (UTC)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out2.suse.de (Postfix) with ESMTP id 900EF1FD67;
	Fri,  8 Jul 2022 17:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1657302333; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WTlnG+uuiCfvqn7xrHsgAyoZbypsgvBz1wNoT15Hvoo=;
	b=UA2amvDCQQTEMgc+oMAIWAnW9q6WVAwIa/58NrUhwHFQiUdZ2luhs3NootKMBQGixPTVF7
	JYttU9E5El22ptX+Zp2b5bkCYDiFbH2tZRODI2Pcam6rj1OVXYiuf7vydlAcOTOkVV0Ghr
	M7RKsq80AZmG76a/d0tmGsUehzywJuo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1657302333;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WTlnG+uuiCfvqn7xrHsgAyoZbypsgvBz1wNoT15Hvoo=;
	b=vFAcpZMRjCSWaOrATDI77+P4vwFu5reaOBcx1bD9RQrcv7W4ttE3p6ZLJ4044r1wbkYvwN
	qpOGccqeB4O7c0Bw==
Received: from kitsune.suse.cz (kitsune.suse.cz [10.100.12.127])
	by relay2.suse.de (Postfix) with ESMTP id BEE682C141;
	Fri,  8 Jul 2022 17:45:32 +0000 (UTC)
From: Michal Suchanek <msuchanek@suse.de>
To: linux-sunxi@lists.linux.dev
Cc: Michal Suchanek <msuchanek@suse.de>,
	Icenowy Zheng <icenowy@aosc.xyz>,
	Andre Przywara <andre.przywara@arm.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] ARM: dts: sunxi: Fix SPI NOR campatible on Orange Pi Zero
Date: Fri,  8 Jul 2022 19:45:29 +0200
Message-Id: <20220708174529.3360-1-msuchanek@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <10106175.nUPlyArG6x@jernej-laptop>
References: <10106175.nUPlyArG6x@jernej-laptop>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The device tree should include generic "jedec,spi-nor" compatible, and a
manufacturer-specific one.
The macronix part is what is shipped on the boards that come with a
flash chip.

Fixes: 45857ae95478 ("ARM: dts: orange-pi-zero: add node for SPI NOR")
Signed-off-by: Michal Suchanek <msuchanek@suse.de>
Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
v2: drop winbond compatible
v3: reword commit message
---
 arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts b/arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts
index f19ed981da9d..3706216ffb40 100644
--- a/arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts
+++ b/arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts
@@ -169,7 +169,7 @@ &spi0 {
 	flash@0 {
 		#address-cells = <1>;
 		#size-cells = <1>;
-		compatible = "mxicy,mx25l1606e", "winbond,w25q128";
+		compatible = "mxicy,mx25l1606e", "jedec,spi-nor";
 		reg = <0>;
 		spi-max-frequency = <40000000>;
 	};
-- 
2.35.3

