Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7942A326924
	for <linux-sunxi@lists.linux.dev>; Sun, 13 Sep 2026 14:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789311371; cv=none; b=GxamcCR9V0Dfu8CNB6VD2FQNL6EP5EeTiEUPjOTztwwvRLE1JpQ3dP6+7JDaeu/xeL08c5VlSciugAMq538mvnyGANf+GOidY+a4wrvN5IYWo/dlF84hnlaVPu4vkJX2k6EXBxy79dwTCnIl6hJyTIMdd0kXNafODadTV8Vu7Ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789311371; c=relaxed/simple;
	bh=c0FwilGJH257Vmi4WBaFoyoKQXfgT/wqYU4kh/brsPk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PSoxuetYpnVO0WK5xoSxg0vZTg38ytUGLt62uzAA7xXDHKfEC3ZoVd5K7dGAOKOKzh4AydxLbQ3u++KVS2bAwVtC0syI0JXKxWCiwd/VVxRk0irk7il+go3PTUeOgFlrS5DnCDGlalEkC74dRc6JfFxJ/BHYgxqLZUrog7s34/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mstvJRj+; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mstvJRj+"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-86a25369f16so1869671b3a.3
        for <linux-sunxi@lists.linux.dev>; Sun, 13 Sep 2026 07:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789311368; x=1789916168; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z/z4QNBtUdI4E15ZNXPZtkbjaHvGmUhKoMr+O5uGaIE=;
        b=mstvJRj+OPo6xZyFBxcxqEb+0rpbXYSWdTZkmtOtKLOkriEkYo41GKHFb/thLLNBho
         tNk7LovoxV75yjoG0LhsAHGOwUO/ezc1McUpnpJIBkQgoDJoWsqr8hlnChYGg28Jglcm
         vG/uLfqO2Q/JJNgb64D1sGoNfMu/DRg0Eu3A+pPGbiD8Xrt6RVxKG5DaYrn6Di2lckj5
         E7KRhaaJLiEO9pRGdwKq4sTUcgKEDHB+geGrDtygH7tZZqPP4imE1ZtbeNv8e+oKUJ2q
         8XHHJ978j3+fSRXbz1Ejd/DhFP/aSQosy4jqvBKpHnO/bMteE59nLyhPb6NzKEMZI/NT
         y/Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789311368; x=1789916168;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=z/z4QNBtUdI4E15ZNXPZtkbjaHvGmUhKoMr+O5uGaIE=;
        b=dZijcQIK9VqEn9lo4KDEbgvImKrt3oQfW5A4eao//UBCsAqZF6TnYufpnHh22HOIQf
         k1dq8A6/Y/CzP+OOiYHXqH5PC7lCmeOQ8te/TQPa7Fb8b+L8eKL04lR5qvMwP1Oy+XnF
         AfDjrKljF+pM1cfwCN6T8+gUTpON+nRyIqr/U5niygsOt7wgfTSd9hiqfuERzQ5R6Z8l
         WVi3LwgwO1R7dUGdrw9wz/Tg3Q5W5HDd/cuPU2OWCDegLF7lnC7IvYFuSs2Hn3ctaswS
         TbVA33Av0Zc6TKX/MTPX50jnE3llAJ+CvQ/yEGVOWyTA7FAPVruvJHbQ3s2X17VWaihK
         pX5w==
X-Forwarded-Encrypted: i=1; AKwUvBwIbKzYsVw+UHEum9QZCmvxvgB9WjR0BwWiiV5I9Btz2IuV2Ly3Q+d8mZfE/Cov88va/Ga1aYGQez3QUw==@lists.linux.dev
X-Gm-Message-State: AFuF++ltwc4JSRNt8dYsNF16goY2noHExlx5Ls5QU3Guez8A2DqZlZMf
	uQ1AWbSSO4dmZFIplxje2O2BKb6sliz5zm0eaEynlcBRQjCp8esFJw5e
X-Gm-Gg: AYBFou0CjQLLnNLk2nfMIISgrCYEYyzYQKVpaaRYbooHzSGExFAYZDAgbHbAYxAwuez
	QdpbSY+C7acnjiL1x8mUTjk4BUbh6ale9rJqAIG0z8DdFyM21jIpQI8lJ+LUsCzwlShjYV4C56m
	uecN4hLvrCZOUw5yUujU3lHu3AvmvSAwuvsNNkZnzncMyOLm/yliGk+LKFBSpO/aEV26tE61Yud
	D6bFxjcNWFdkmoK19zCVcfpAvKkJBVRdKsINhTZyp3opQmp+76aipG7XOSBC9CWouoKe8BSbFqr
	i0cv2qKjC3ImGNxUeq8xLOyAThDXS6EfJ/r2+Wg27zGL3Pf/QdHWSGH0StxIHF/p5Z5oiSNZnji
	oSrgYDqqOb8m9VLHFlYgWaUUsBtJ7T/cWBFBNneroHsFrNuMVxx3rf0xNk/NesiJbb/Oxzu24wu
	Iv6FtC3zNMGY6uJdotVqENtvTbVhO/sd02feGiQo9db+27AKWUPqJErGk2/gVVZzgp
X-Received: by 2002:a05:6a21:46c5:b0:3d1:60d3:99f8 with SMTP id adf61e73a8af0-3daed46ad42mr25849990637.5.1789311368455;
        Sun, 13 Sep 2026 07:56:08 -0700 (PDT)
Received: from archlinux ([207.90.239.231])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba7a9bb56sm21467366eec.31.2026.09.13.07.55.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 07:56:08 -0700 (PDT)
From: Mikhail Kalashnikov <iuncuim@gmail.com>
To: Vasily Khoruzhick <anarsoul@gmail.com>,
	Yangtao Li <tiny.windzz@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Philipp Zabel <p.zabel@pengutronix.de>,
	=?UTF-8?q?Juan=20Manuel=20L=C3=B3pez=20Carrillo?= <juanmanuellopezcarrillo@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>
Subject: [PATCH v6 1/5] dt-bindings: thermal: sun8i: Add A523 THS0/1 controllers
Date: Sun, 13 Sep 2026 22:55:23 +0800
Message-ID: <20260913145527.18148-2-iuncuim@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260913145527.18148-1-iuncuim@gmail.com>
References: <20260913145527.18148-1-iuncuim@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mikhail Kalashnikov <iuncuim@gmail.com>

Add dt-bindings description of the thermal sensors in the A523 processor.

The calibration data for both thermal controllers (THS0, THS1) is split
across two nvmem cells at different offsets, requiring the two cells
to be read and merged. To maintain backward compatibility, the name of
the old cell remains "calibration" and the new cell is named
"calibration-second-part".

Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>
---
 .../thermal/allwinner,sun8i-a83t-ths.yaml     | 34 +++++++++++++++++--
 1 file changed, 31 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.yaml b/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.yaml
index 3e61689f6..792081af5 100644
--- a/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.yaml
+++ b/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.yaml
@@ -24,6 +24,8 @@ properties:
       - allwinner,sun50i-h5-ths
       - allwinner,sun50i-h6-ths
       - allwinner,sun50i-h616-ths
+      - allwinner,sun55i-a523-ths0
+      - allwinner,sun55i-a523-ths1
 
   clocks:
     minItems: 1
@@ -47,11 +49,16 @@ properties:
     maxItems: 1
 
   nvmem-cells:
-    maxItems: 1
-    description: Calibration data for thermal sensors
+    minItems: 1
+    items:
+      - description: Calibration data for thermal sensors
+      - description: Additional cell in case of separate calibration data
 
   nvmem-cell-names:
-    const: calibration
+    minItems: 1
+    items:
+      - const: calibration
+      - const: calibration-second-part
 
   allwinner,sram:
     maxItems: 1
@@ -107,6 +114,7 @@ allOf:
             enum:
               - allwinner,sun8i-h3-ths
               - allwinner,sun20i-d1-ths
+              - allwinner,sun55i-a523-ths0
 
     then:
       properties:
@@ -132,6 +140,26 @@ allOf:
         - clock-names
         - resets
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - allwinner,sun55i-a523-ths0
+              - allwinner,sun55i-a523-ths1
+    then:
+      properties:
+        nvmem-cells:
+          minItems: 2
+        nvmem-cell-names:
+          minItems: 2
+    else:
+      properties:
+        nvmem-cells:
+          maxItems: 1
+        nvmem-cell-names:
+          maxItems: 1
+
 required:
   - compatible
   - reg
-- 
2.55.0

