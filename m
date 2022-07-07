Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23955637
	for <linux-sunxi@lists.linux.dev>; Thu,  7 Jul 2022 16:38:59 +0000 (UTC)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out1.suse.de (Postfix) with ESMTP id 6AED92201A;
	Thu,  7 Jul 2022 16:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1657211937; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=HT0gKUbR4TG74DXhq9GfoGkggJzW6+enxLTmjGI67i8=;
	b=ssrnnFUwxE56I5Ypvm6THYQX0NEwf3NBmdhTPNPycDru2bUP0GFJ2/DC2336Vk6qgCjPDM
	3J58gjztb6lvjm70a0obl2dpdYPsPIkVV5VeNIcYjZI1K4K1apArSPhfzBikMqIDsnI3Ys
	2te0/Op/k7KZnj7gCjzG0LSsUpvn824=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1657211937;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=HT0gKUbR4TG74DXhq9GfoGkggJzW6+enxLTmjGI67i8=;
	b=TIbNdTvfBJN+NPjbdqHfcNG2GLsUULX5CZF/mAy1OkEv8jOzWsLOaqrBEuhUf6zwBg8yPO
	kduA0Ht0JE2GEyBw==
Received: from kitsune.suse.cz (kitsune.suse.cz [10.100.12.127])
	by relay2.suse.de (Postfix) with ESMTP id BBE4E2C141;
	Thu,  7 Jul 2022 16:38:56 +0000 (UTC)
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
Subject: [PATCH] sunxi: dts: Fix SPI NOR campatible on Orange Pi Zero
Date: Thu,  7 Jul 2022 18:38:55 +0200
Message-Id: <20220707163855.18838-1-msuchanek@suse.de>
X-Mailer: git-send-email 2.35.3
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Without "jedec,spi-nor" compatible the flash memory cannot be probed by
u-boot.

Signed-off-by: Michal Suchanek <msuchanek@suse.de>
---
 arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts b/arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts
index f19ed981da9d..d114bbc5f441 100644
--- a/arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts
+++ b/arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts
@@ -169,7 +169,7 @@ &spi0 {
 	flash@0 {
 		#address-cells = <1>;
 		#size-cells = <1>;
-		compatible = "mxicy,mx25l1606e", "winbond,w25q128";
+		compatible = "mxicy,mx25l1606e", "winbond,w25q128", "jedec,spi-nor";
 		reg = <0>;
 		spi-max-frequency = <40000000>;
 	};
-- 
2.35.3

