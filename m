Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5E782563
	for <linux-sunxi@lists.linux.dev>; Thu,  7 Jul 2022 17:07:31 +0000 (UTC)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out2.suse.de (Postfix) with ESMTP id CD8D21F9B2;
	Thu,  7 Jul 2022 17:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1657213649; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0Ci4Dep1Zdb2ngukBlBCgO8oicNdK+KrkT4H7UcJ2kQ=;
	b=FUlwb0EqBnGrORmKhwXUa5r6qWXAdWT8tUoyLVl9iw+4GUwO+Cz1kOS5VJg6b4tPJ6KIrI
	AYe4dAVZy3FNjiTyP/nwTzCXgXeRtL41jD2pxajrt/G4sijt294X46OmrRswnqXvrj9a0m
	ncUHTV057vlD2LBZbEFh95qoJdPnDxQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1657213649;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0Ci4Dep1Zdb2ngukBlBCgO8oicNdK+KrkT4H7UcJ2kQ=;
	b=anndg+nTRyO4WGTNepgA3Zo5d70jt/982ZGZLCjdZZoo/SBQjlmJzdWiVeecSxUZPUM0du
	WNN6uvly1E584JBw==
Received: from kitsune.suse.cz (kitsune.suse.cz [10.100.12.127])
	by relay2.suse.de (Postfix) with ESMTP id 82C602C141;
	Thu,  7 Jul 2022 17:07:29 +0000 (UTC)
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
Subject: [PATCH v2] sunxi: dts: Fix SPI NOR campatible on Orange Pi Zero
Date: Thu,  7 Jul 2022 19:07:20 +0200
Message-Id: <20220707170721.20225-1-msuchanek@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220707174801.36e010da@donnerap.cambridge.arm.com>
References: <20220707174801.36e010da@donnerap.cambridge.arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Without "jedec,spi-nor" compatible the flash memory cannot be probed by
u-boot. The macronix part is what is shipped on the boards that come
with a flash chip.

Signed-off-by: Michal Suchanek <msuchanek@suse.de>
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

