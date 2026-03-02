Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DA052820C6
	for <linux-sunxi@lists.linux.dev>; Mon,  2 Mar 2026 02:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772417439; cv=none; b=lyi6PyptWIVIDHZdf+IZpm5qyrlsAyfS1UaYX3ocYJ6fCk3f65CYQbu6IxGW1qEpKxPZaPgWM9Thl0l+cjWQoJElBNgQnCa7xld6NYn1Ky376I2PUz6BiOvTCXxtKAvd3wVDd018NsfYNW6li7mq7c1lrEdEqIiNTuhTp12dSNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772417439; c=relaxed/simple;
	bh=ihWtm6BNeZIdHJPxSWdVbPBlhVDJEp9hB8t4Ho65JDw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RgSG/iiykek+XYUwRDdddj7ebg9XcUK7fMF+cjC3+mFHnSOJ+2LmyGNmIVybo7HSZY+RSlaM+u/BdlQ70FQCCDI0UHXXX7bvFvjpMhPsgLq79VajC2gFzLNoQx1C9xIxeurebWbguO6q15rg6EmdaPMLk/LAkdPhtVYIdDfrx6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KTJaObAs; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KTJaObAs"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-48069a48629so43164775e9.0
        for <linux-sunxi@lists.linux.dev>; Sun, 01 Mar 2026 18:10:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772417437; x=1773022237; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5OSdZggynsJBsU/qtiL9Wji3B58q5QjoIHphGlxLwaA=;
        b=KTJaObAsnXF7aLQvsNlk+PdaA0WuLyI4jkAlj+LCP0nGrBgbB0BA2GtuhLchZ33a9y
         0prllgfp9JQzxjS74SRUBdX07Vfg7FDDOnJ9wZiTfhSpUk3SCtJaQCK29AazCZ7tgAwU
         lW40L9p+3/0wMf68hBqKulomnJzm2VYHGpcdA3tzztFQ2QmoiS0uk2ke0Tyw/ekIDZqF
         4c+26WYvN55b40yTk7BasE2GL1J3F0GvvG6FH6Nuxs2hA3qIYDHG39aN5m0nqSZymOns
         EEmzzM/1AXggC0Pn7dgRb0sqnr5JOTvXpKDzFsGmBSY8CZsFEKJXfhtNMCHXXolsloWj
         eBzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772417437; x=1773022237;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5OSdZggynsJBsU/qtiL9Wji3B58q5QjoIHphGlxLwaA=;
        b=IjuRSRe5lrDb+t9Hj36b5jovohlct+TJa6VJvZFDxZbHwWTMHALN1V/UyX+ZOu6XOd
         v1F4Vy8wpqExN7srYY+kNq3hdqe9i2VVGdt0BTgs4zw0nx4bNGuw2N7cz5xPvMWbN6+E
         Wg0wnGV97KHXmhE3imN7UZrDuGrsCn6iYCl3s4hk9mquRgeeJ/ErYqBg/eIs4Iu6jqGl
         RYffL8ynAKDiiK36aRukGkU9+lRS0gbmd9IJ1X+ZCOPE/PuGheHpl2MF0GWeCYxzwXzl
         Dh2bkP7Gb908oQh7WhFqNctutJGeVVK+BX2R1/wF2zXaQ/Ogpe/gkyvF5hHhjMkTyGw2
         sgtg==
X-Forwarded-Encrypted: i=1; AJvYcCW28wc6/8jt8p2H+DZoQiKgXKbPv2WaKJKz0IhJBNg2/YMe2+4Vj/cLXILVktiKckrNciPUpB3vuFnncA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyXVLZuZBCZEW4wxG0Y/1sPlX2d+WQoLRsUlwtiGgDW3kqMEZJN
	jGOH5/BDR13M4oFPB9yzT5NPRM6eHwAnMaHUp8SENjlDF2+0I9x71fde
X-Gm-Gg: ATEYQzyJe/m3cxDcDL9TQqJU7JO1WNAFM178MWYh/Dnksf1c5TUN/VhsqgutDhfXI2M
	c2N2e48bDMwUVsWvpr1sirgmEDO1M15TXZfWOctzzD+zyFCFKpF/Wommv53edhT9GJltiCiKMVG
	3XIVYjmZEWLzOYWMT333mfetX6fuHjdwwBp2XUJwbSbcaIYDH8pamUJn9L/H1uVpyxemyeAGzXv
	+B/tH3MG2IxLMAGd3ovUnVUCd7cTRUimnVvsybM1Q6DWlOeybsO0ufCCKSVEDMgr5yOkESG4NlC
	7YcfUw4WD8uwyaVfhqNZ0o/8xpwbdlnMQalzUx5ZhYRY+cXkdJWc/w5/HcsA2vZq3kUlW2y+HDi
	uTgEQHB+325BgXxbT3cfaE7M5SSlGS7kCkAEy6QptZ0Epv7c3OHDO09VylTdMf6q6YvDkyoHSvW
	+sPdQEqKh6QY5L7aJwKB2A
X-Received: by 2002:a05:600c:c490:b0:480:20f1:7abd with SMTP id 5b1f17b1804b1-483c9c204b0mr180073705e9.31.1772417436800;
        Sun, 01 Mar 2026 18:10:36 -0800 (PST)
Received: from arch.localdomain ([2409:8a28:a55:9af1::1002])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfcb9b97sm194451105e9.7.2026.03.01.18.10.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 18:10:36 -0800 (PST)
From: Jun Yan <jerrysteve1101@gmail.com>
To: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	mripard@kernel.org,
	andre.przywara@arm.com,
	Jun Yan <jerrysteve1101@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 2/3] dt-bindings: arm: sunxi: Add TaiqiCat (TQC) A01
Date: Mon,  2 Mar 2026 10:09:55 +0800
Message-ID: <20260302020956.96424-3-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260302020956.96424-1-jerrysteve1101@gmail.com>
References: <20260302020956.96424-1-jerrysteve1101@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

TaiqiCat (TQC) A01 is a set-top box powered by an Allwinner H6 SoC,
equipped with an AXP305 PMIC, 1GB LPDDR3 RAM, 8GB eMMC, an AP6212
WiFi/BT combo module, one 100M Ethernet port, one USB 3.0 Type-A port,
one USB 2.0 Type-A port, one Micro USB port, HDMI, SPDIF, Micro-SD, and
infrared input.

It is a blockchain-based terminal product launched by UQSoft
(Beijing UQSoft Interactive Technology Co., Ltd.), a wholly-owned
subsidiary of Ultrapower. Its dedicated product homepage[1] was once
hosted on Ultrapower’s official website[2].

It should be noted that UQSoft's official website[3] is no longer
operational, and the company appears to have been discontinued.

[1] https://web.archive.org/web/20190409213228/https://tq.ultrapower.com.cn/product.html
[2] https://www.ultrapower.com.cn
[3] http://www.uqsoft.com

Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/sunxi.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index 9e4627f97d7e..e6443c266fa1 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -901,6 +901,11 @@ properties:
           - const: allwinner,sl631
           - const: allwinner,sun8i-v3
 
+      - description: TaiqiCat A01
+        items:
+          - const: ultrapower,taiqicat-a01
+          - const: allwinner,sun50i-h6
+
       - description: Tanix TX1
         items:
           - const: oranth,tanix-tx1
-- 
2.53.0

