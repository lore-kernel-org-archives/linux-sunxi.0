Received: from omta038.useast.a.cloudfilter.net (omta038.useast.a.cloudfilter.net [44.202.169.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B0851F3D3B
	for <linux-sunxi@lists.linux.dev>; Fri, 27 Dec 2024 11:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=44.202.169.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735297753; cv=none; b=eUmmM8/gPgozdRIa3ldmKmUZdxDSjv3ejFu+q52tiFHONG475JS1bjwN24X/3QCNz32xGQyl5JaE3FzlA5cnUGZRX6WrdwGxTFRZR2GgOM2RW5G3xf6J+rJ3o8yKBKtq2pKYkpVqtUnI0IOkAjyZtWr5pfXX5Lokrcf+jykQ9E8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735297753; c=relaxed/simple;
	bh=jEGKbLhjRFmr2GAicFc1z+s3hUCh595jXAXzn9My3y0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Dnu3eeaUbwgZ8QKqd7VAGNbwrBlgejScK463/ys83ath9e6OOKZbWH/4iHv2MxC9VPBluGOSy4dlaUkITe0a8O0ySCz7Ws//do9RpHuwpvnBgpoob43NqAG5EwrSTN/Do67BeT0utjjUIEWowkIrjOEojkXaYF8CEN/JQrAZmsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linumiz.com; spf=pass smtp.mailfrom=linumiz.com; dkim=pass (2048-bit key) header.d=linumiz.com header.i=@linumiz.com header.b=MONGxl3W; arc=none smtp.client-ip=44.202.169.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linumiz.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linumiz.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linumiz.com header.i=@linumiz.com header.b="MONGxl3W"
Received: from eig-obgw-6004a.ext.cloudfilter.net ([10.0.30.197])
	by cmsmtp with ESMTPS
	id QoPFtumQYjMK7R8DJtLfIA; Fri, 27 Dec 2024 11:09:05 +0000
Received: from md-in-79.webhostbox.net ([43.225.55.182])
	by cmsmtp with ESMTPS
	id R8DFteDliWdNZR8DHtgafw; Fri, 27 Dec 2024 11:09:04 +0000
X-Authority-Analysis: v=2.4 cv=FtTO/Hrq c=1 sm=1 tr=0 ts=676e8ad0
 a=LfuyaZh/8e9VOkaVZk0aRw==:117 a=kofhyyBXuK/oEhdxNjf66Q==:17
 a=IkcTkHD0fZMA:10 a=RZcAm9yDv7YA:10 a=-pn6D5nKLtMA:10 a=vU9dKmh3AAAA:8
 a=wzO6rqTgGfghY9OkdcwA:9 a=QEXdDO2ut3YA:10 a=rsP06fVo5MYu2ilr0aT5:22
 a=ZCPYImcxYIQFgLOT52_G:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linumiz.com
	; s=default; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=tQ0brnuopVNUKDJwJH0/VSRDFgILtmVRCbF+TM2fmxQ=; b=MONGxl3WeJf0arOy1cPFbArXcj
	RMSebZo86+sT9oYvJlias60GqUv3Zg9+bheoQ+qKIRGcEtjIcWS9Q49pW/FhkQrHotmidpp4a/7/H
	OAU396gG20Kp/cyTsoO2pX+1qMTLqVSbAOANlMBYOMQ16ebVXZatJc+jfPKPOsdJcq5zHBK83sn7i
	UV4U+3Rq8EcP8C72VhG8Fc/dpyRe6TkTehNjDGnlENCkvLCOSTKpZm0vc94Hldj1AKepr5AiAvLTM
	OlOcy8Vj++TXUVQdbCTERtAYLlVL+JH6tR2wIWUweXeaGIB7koEcVbtue4/cLFp9r1nPHJOcRbKr7
	jNxpal6w==;
Received: from [122.165.245.213] (port=50828 helo=[127.0.1.1])
	by md-in-79.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <parthiban@linumiz.com>)
	id 1tR8DA-000bEK-2T;
	Fri, 27 Dec 2024 16:38:56 +0530
From: Parthiban Nallathambi <parthiban@linumiz.com>
Date: Fri, 27 Dec 2024 16:37:55 +0530
Subject: [PATCH 08/22] dt-bindings: arm: sunxi: document Szbaijie A133
 helper board
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241227-a133-display-support-v1-8-13b52f71fb14@linumiz.com>
References: <20241227-a133-display-support-v1-0-13b52f71fb14@linumiz.com>
In-Reply-To: <20241227-a133-display-support-v1-0-13b52f71fb14@linumiz.com>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Linus Walleij <linus.walleij@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>
Cc: iommu@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-phy@lists.infradead.org, 
 Parthiban Nallathambi <parthiban@linumiz.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735297689; l=1029;
 i=parthiban@linumiz.com; s=20241125; h=from:subject:message-id;
 bh=jEGKbLhjRFmr2GAicFc1z+s3hUCh595jXAXzn9My3y0=;
 b=wGVr4ngKuSoVabYMJ83xGl1sX/P27vzNoNcVRiBreH5glgRC0hjGBmu8/xaRvpjz0+HQviRNZ
 Kl7VJO4tZIDDmoEuw1ZTkBz1LzFAJ32g+0k4pQHAUmeU87/GywdQTyk
X-Developer-Key: i=parthiban@linumiz.com; a=ed25519;
 pk=PrcMZ/nwnHbeXNFUFUS833wF3DAX4hziDHEbBp1eNb8=
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - md-in-79.webhostbox.net
X-AntiAbuse: Original Domain - lists.linux.dev
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - linumiz.com
X-BWhitelist: no
X-Source-IP: 122.165.245.213
X-Source-L: No
X-Exim-ID: 1tR8DA-000bEK-2T
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([127.0.1.1]) [122.165.245.213]:50828
X-Source-Auth: parthiban@linumiz.com
X-Email-Count: 256
X-Org: HG=dishared_whb_net_legacy;ORG=directi;
X-Source-Cap: bGludW1jbWM7aG9zdGdhdG9yO21kLWluLTc5LndlYmhvc3Rib3gubmV0
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfPhcUZ1uszOXvryYDKzbcbr5ylfrVWnvjI5qQGwqi9RTlDi9oI68TmigtRMxgBNUXhG/gynjHArwkht5XYnnTnuuBuUvrgEanzdh+uz1INbeYmqyaoK+
 PraGeaUWosPJVDujrHt1kobcEWUwNnRjTJUaXDBvt84ErLUIrozvL+qc71pB1Txw8QwZX3/9TyBrHjQigilFC0iFhf2K0fXZy9w=

Szbaijie Baijie Technology A133 helper board is an evaluation
board of their A133-Core SoM. Add its compatible (with the
SoM compatible) to the sunxi board DT binding file.

Signed-off-by: Parthiban Nallathambi <parthiban@linumiz.com>
---
 Documentation/devicetree/bindings/arm/sunxi.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index 046536d02706..eb19f8b1fe68 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -891,6 +891,12 @@ properties:
           - const: allwinner,sl631
           - const: allwinner,sun8i-v3
 
+      - description: Szbaijie A133 Helper board
+        items:
+          - const: szbaijie,helper-a133
+          - const: szbaijie,helper-a133-core
+          - const: allwinner,sun50i-a133
+
       - description: Tanix TX1
         items:
           - const: oranth,tanix-tx1

-- 
2.39.5

