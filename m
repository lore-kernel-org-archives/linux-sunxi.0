Received: from mxb.seznam.cz (mxb.seznam.cz [77.75.78.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D87B1D69E
	for <linux-sunxi@lists.linux.dev>; Wed, 20 Mar 2024 06:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.75.78.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710915182; cv=none; b=YnbeYa3nQq5AdgHZ6dDWc3Qx7seGDUqrmRvC0YaIihWL3AVcEw9h7vj/1VrauUTEpRfNANwmON9l7WwXEdIu7IVkyXysN3wD2Aixcaj1GJmuZ1CXIJuXVqEk1RK7up6MkzGBYzClZLvTY1A7xN/Y6/Hq7aASSOVbW84NK3U284s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710915182; c=relaxed/simple;
	bh=TVUPJzlCw5lhK609xZGi2P73DDdfI9SUKKRByHtc4Qo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=N7hzMJNH94EgMPyywOzCKeFK8gacu7SdfbPPfEiZEu9JlfzsJEcXQpbS4cO6I5uN3rOBjMyFKkt7bnQDW05MJprK3RTvuRNXiW1IkVxA78V5VM2Y8x8Vw64nrDHXN5Jk28RbgA17bgjjH/BFFBQpw/Hz5l4IrMcqy3alwRAcNQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loebl.cz; spf=none smtp.mailfrom=loebl.cz; dkim=pass (2048-bit key) header.d=emailprofi.seznam.cz header.i=@emailprofi.seznam.cz header.b=Ca9STdKC; arc=none smtp.client-ip=77.75.78.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loebl.cz
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=loebl.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=emailprofi.seznam.cz header.i=@emailprofi.seznam.cz header.b="Ca9STdKC"
Received: from email.seznam.cz
	by smtpc-mxb-f995f5b8f-2qczm
	(smtpc-mxb-f995f5b8f-2qczm [2a02:598:64:8a00::1000:3ac])
	id 77f44ba56c66c6717311f227;
	Wed, 20 Mar 2024 07:12:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=emailprofi.seznam.cz; s=szn20221014; t=1710915152;
	bh=eGdGurR1cxU3eyEf7oGDFxamjR9Yrr5deVJKSh0wMNM=;
	h=Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Type:Content-Transfer-Encoding;
	b=Ca9STdKCShgp1AscpS2WPiRJ6Dmp+jPiwNqTsR87jhXyh+EwjUZFJpwUQxIhZoDcl
	 KXwcXCZnfAyktNvXI3PNmXk6v3MojV6ns/PBAslSJE0hOqfEvYr9QImN39dLN7McyD
	 S77jYmNr2kt3fvupN4dH/t5Y1JwPglIA5NCTrcNyQ+Oj8jXOHAUBfaFF+bR1lWITiP
	 ZZsa3afIrf9Z0qoL9CbE2lNXxHnLuqaomd7nNagg4PrA/syPjllGBtUKDviZJME+Cz
	 YIHUfLSShcy+E8oUXI0Qvj8LAGl6fbRwTuFmBn7pGx9BEk/4t3H85XEc2tzUhIIfC2
	 LOZUiIAr5NmGQ==
Received: from localhost ([2a03:a900:1020:47::f71])
	by smtpd-relay-78cd484798-qqwnp (szn-email-smtpd/2.0.18) with ESMTPA
	id eee3d0a6-c8dd-4ac4-8465-b279cf06de72;
	Wed, 20 Mar 2024 07:12:28 +0100
From: =?UTF-8?q?Pavel=20L=C3=B6bl?= <pavel@loebl.cz>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: =?UTF-8?q?Pavel=20L=C3=B6bl?= <pavel@loebl.cz>,
	devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v2 1/3] ARM: dts: sunxi: remove duplicated entries in makefile
Date: Wed, 20 Mar 2024 07:10:19 +0100
Message-ID: <20240320061027.4078852-1-pavel@loebl.cz>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240320001152.4077150-1-pavel@loebl.cz>
References: <20240320001152.4077150-1-pavel@loebl.cz>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

During introduction of DTS vendor subdirectories in 724ba6751532, sun8i
section of the makefile got duplicated. Clean that up.

Fixes: 724ba6751532 ("ARM: dts: Move .dts files to vendor sub-directories")

Signed-off-by: Pavel Löbl <pavel@loebl.cz>
---
 arch/arm/boot/dts/allwinner/Makefile | 62 ----------------------------
 1 file changed, 62 deletions(-)

diff --git a/arch/arm/boot/dts/allwinner/Makefile b/arch/arm/boot/dts/allwinner/Makefile
index 2d26c3397f14..2a4162657a2c 100644
--- a/arch/arm/boot/dts/allwinner/Makefile
+++ b/arch/arm/boot/dts/allwinner/Makefile
@@ -260,68 +260,6 @@ dtb-$(CONFIG_MACH_SUN8I) += \
 	sun8i-v3s-licheepi-zero.dtb \
 	sun8i-v3s-licheepi-zero-dock.dtb \
 	sun8i-v40-bananapi-m2-berry.dtb
-dtb-$(CONFIG_MACH_SUN8I) += \
-	sun8i-a23-evb.dtb \
-	sun8i-a23-gt90h-v4.dtb \
-	sun8i-a23-inet86dz.dtb \
-	sun8i-a23-ippo-q8h-v5.dtb \
-	sun8i-a23-ippo-q8h-v1.2.dtb \
-	sun8i-a23-polaroid-mid2407pxe03.dtb \
-	sun8i-a23-polaroid-mid2809pxe04.dtb \
-	sun8i-a23-q8-tablet.dtb \
-	sun8i-a33-et-q8-v1.6.dtb \
-	sun8i-a33-ga10h-v1.1.dtb \
-	sun8i-a33-inet-d978-rev2.dtb \
-	sun8i-a33-ippo-q8h-v1.2.dtb \
-	sun8i-a33-olinuxino.dtb \
-	sun8i-a33-q8-tablet.dtb \
-	sun8i-a33-sinlinx-sina33.dtb \
-	sun8i-a83t-allwinner-h8homlet-v2.dtb \
-	sun8i-a83t-bananapi-m3.dtb \
-	sun8i-a83t-cubietruck-plus.dtb \
-	sun8i-a83t-tbs-a711.dtb \
-	sun8i-h2-plus-bananapi-m2-zero.dtb \
-	sun8i-h2-plus-libretech-all-h3-cc.dtb \
-	sun8i-h2-plus-orangepi-r1.dtb \
-	sun8i-h2-plus-orangepi-zero.dtb \
-	sun8i-h3-bananapi-m2-plus.dtb \
-	sun8i-h3-bananapi-m2-plus-v1.2.dtb \
-	sun8i-h3-beelink-x2.dtb \
-	sun8i-h3-libretech-all-h3-cc.dtb \
-	sun8i-h3-mapleboard-mp130.dtb \
-	sun8i-h3-nanopi-duo2.dtb \
-	sun8i-h3-nanopi-m1.dtb\
-	\
-	sun8i-h3-nanopi-m1-plus.dtb \
-	sun8i-h3-nanopi-neo.dtb \
-	sun8i-h3-nanopi-neo-air.dtb \
-	sun8i-h3-nanopi-r1.dtb \
-	sun8i-h3-orangepi-2.dtb \
-	sun8i-h3-orangepi-lite.dtb \
-	sun8i-h3-orangepi-one.dtb \
-	sun8i-h3-orangepi-pc.dtb \
-	sun8i-h3-orangepi-pc-plus.dtb \
-	sun8i-h3-orangepi-plus.dtb \
-	sun8i-h3-orangepi-plus2e.dtb \
-	sun8i-h3-orangepi-zero-plus2.dtb \
-	sun8i-h3-rervision-dvk.dtb \
-	sun8i-h3-zeropi.dtb \
-	sun8i-h3-emlid-neutis-n5h3-devboard.dtb \
-	sun8i-r16-bananapi-m2m.dtb \
-	sun8i-r16-nintendo-nes-classic.dtb \
-	sun8i-r16-nintendo-super-nes-classic.dtb \
-	sun8i-r16-parrot.dtb \
-	sun8i-r40-bananapi-m2-ultra.dtb \
-	sun8i-r40-oka40i-c.dtb \
-	sun8i-s3-elimo-initium.dtb \
-	sun8i-s3-lichee-zero-plus.dtb \
-	sun8i-s3-pinecube.dtb \
-	sun8i-t113s-mangopi-mq-r-t113.dtb \
-	sun8i-t3-cqa3t-bv3.dtb \
-	sun8i-v3-sl631-imx179.dtb \
-	sun8i-v3s-licheepi-zero.dtb \
-	sun8i-v3s-licheepi-zero-dock.dtb \
-	sun8i-v40-bananapi-m2-berry.dtb
 dtb-$(CONFIG_MACH_SUN9I) += \
 	sun9i-a80-optimus.dtb \
 	sun9i-a80-cubieboard4.dtb
-- 
2.39.2

