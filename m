Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B0623A9605
	for <linux-sunxi@lists.linux.dev>; Mon, 12 Oct 2026 10:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791799784; cv=none; b=M/FvBqug0kOLYtTTfI0VbMp0e8+GY/sZ2HPVBEbVQniyA4hn/1Ni3F01mIK1mieGFJn5ii+rsmlGoOcXiMOCgcDemIDkvWqKGo3Zj7tck4muapB2qca1y/knIMTiH6rnByahnB2ufqjNmHrv01x2wvVOYdLUuBwqwXVRUONbhTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791799784; c=relaxed/simple;
	bh=KOfinKpMQsa5zSbyZ5FVh9P3doA6BZAOXn+lKRg+jbw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r+0Ifzk0nP6FP0Z1WTu0fnMLRApj2BjyTtVV6GDgEStko8bM0Zrehv13Rpr8Tvd5V4DN+L+PraUiYNWwKrT/IR41uGKOw70ZmHDc5I3ADKzX02goS4KYJctQQlIlbIy+yrUpUbm4e99HJ95Pg8vKPdSTyIIM8SuPJhuJOZo03sE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZEyqY0zz; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZEyqY0zz"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a0e1b0681bso12044145e9.3
        for <linux-sunxi@lists.linux.dev>; Mon, 12 Oct 2026 03:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791799774; x=1792404574; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rTmPfvalZRTI6+lp6HTMlI98ng4/42Y7G5JNtyRc8+k=;
        b=ZEyqY0zzMwMvi8xzdSFaZ+CJsIGoCxeFCB6RDH4UKro/V1L2+wozDNuW9kiPm2ULRw
         9H4zyczoPj0X4jFKY2vwFfFywuc49ARbbf1LN7OgYN9PF3Ll6bxQfg6Md7EOoXuZw5hm
         d2BxfcwR0nm9zTR1tvBszaMF4GMKW26NU0C7nsmSy3zyjuCfQTARXNVHeVuILQv9gupJ
         JunCTXZqTe0sd1PTJJAGSsrbRc+xvQF6NE+igHe0jmTENmVKLkniWHGKKRiBrwafhoVW
         Yqb3qxwU9jdoxRCGjdIz0wob8fTs+BU0BdmbtUAGJBXjCNApG6c7Y4mGpOXZXPiHg5Mr
         noGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791799774; x=1792404574;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rTmPfvalZRTI6+lp6HTMlI98ng4/42Y7G5JNtyRc8+k=;
        b=Cc/2Wjn72BFKbkjltrwHwbZQxsBQlFyt1ZVkEwaJam4vMO3odSti4B5XNfzl85y/wZ
         8QlTLgapjXhMHUZBc/uB701uS+5jISEXbEZALifsUbWIGCjxX0vVRXLoQDqOemYPrma3
         pRRrlNvb5kpZldJu0HwT8QuJ/S/V1w0xakp8i8lxBdxos7tS5zcYiNkgv7zPP03rK01A
         rj1zBRzVTzr41dcfBsW8tUr5phSelkMVWQgmmQGUBsIisfNULXdxTDsKsozJcXNBRTJp
         QCb+joF/gifNZQt2bJ0SoFAvKjj5jsi3hg+w4Gzw9GTqzq7emcEemthzK/TI0TdEpcXL
         xGfA==
X-Forwarded-Encrypted: i=1; AKwUvBzKBW+kS2jn1aG1UuYVvwL16Ay0V6Re8tNIe6Q8lfnCEmC0yFuxWP0Im4UBHDuEF/nI7hqD0AOnPyro3w==@lists.linux.dev
X-Gm-Message-State: AFq9FYJ6HhvNGNfmMQ21QCU9+1MPxlTO+NXyuH6keuiGwsB8cejLhzYD
	Bmq7HH42bmLuP+VQi9iR2qUM5t/UzBqpTotrXj/bKZAczf4eOV2sflg1
X-Gm-Gg: AYBFou2BYEF962pJokoGQ8XufPfOPF1CHjtyyqLU7t4v9zOcZdmYOLpNvdxfSk0CVr8
	WBfpLkYeldU2g60ZGtHF+UinGSz2uTQg/h4BdtWaFdaA0YuTuoJq4wb6a+Rz/B3A9eIaLaVxoO5
	V5UtFgPDtaiWuTMKzDD8CpIp7v1jCdgSM/RKPVr2JaNnxX+aK8CUjYA3cggg5fZC6oSjIcqmraW
	Q6k1BULCxexB+RUnMXOyyj5Gb/1zmRI6cBMQ8FkkkN7fOfz5NQzn++4Vvi/J+CKZHp15B+E36ZY
	mUb2rQ8HswL/8UteE4LxqY3Wi+z2DGvb7H+YCY6jTIzIncMgIOmlIZfH1DasRQP36XuBpmshWGX
	5/VFVZCXwp7jjSpspF9r/YTqoduNLu3BnElhSClu+jS64/fzUCh17QdvLwQgbrO0yuZH82fHXJ4
	9gIK8k32Of4RKyKhP3opXs+hDBq94VRPkd9GTyHFgtrlBLWNXhgXPkikYvvHjkeB9SVYgAjcvxw
	Yq7JbNRIRLj8/qY9PbDWZsVH2FKtt9F
X-Received: by 2002:a05:600c:5397:b0:4a1:7ba9:da2c with SMTP id 5b1f17b1804b1-4a18e4a7cacmr168741805e9.25.1791799773645;
        Mon, 12 Oct 2026 03:09:33 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a192d3efb6sm166229885e9.1.2026.10.12.03.09.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 03:09:33 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v4 03/11] dt-bindings: pinctrl: sun4i-a10: add Allwinner B288
Date: Mon, 12 Oct 2026 11:08:08 +0100
Message-ID: <20261012100816.331033-4-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261012100816.331033-1-pmazzini@gmail.com>
References: <20261012100816.331033-1-pmazzini@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The B288 driver takes its mux values from the DT, so allwinner,pinmux
becomes an allowed property here, required for this compatible only.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 .../pinctrl/allwinner,sun4i-a10-pinctrl.yaml  | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml
index 45b7a0b6c626..b1f093d218f5 100644
--- a/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml
@@ -39,6 +39,7 @@ properties:
       - allwinner,sun8i-a33-pinctrl
       - allwinner,sun8i-a83t-pinctrl
       - allwinner,sun8i-a83t-r-pinctrl
+      - allwinner,sun8i-b288-pinctrl
       - allwinner,sun8i-h3-pinctrl
       - allwinner,sun8i-h3-r-pinctrl
       - allwinner,sun8i-r40-pinctrl
@@ -120,6 +121,15 @@ patternProperties:
         $ref: /schemas/types.yaml#/definitions/uint32
         enum: [10, 20, 30, 40]
 
+      allwinner,pinmux:
+        $ref: /schemas/types.yaml#/definitions/uint32-array
+        description:
+          Pinmux selector value, for each pin. Only used by SoCs whose
+          driver takes the mux values from the DT instead of an in-driver
+          table. Almost every time this value is the same for all pins, so
+          any array shorter than the number of pins will repeat the last
+          value, to allow just specifying a single cell, for all cells.
+
     required:
       - pins
       - function
@@ -144,6 +154,17 @@ allOf:
   # warnings.
 
   - $ref: pinctrl.yaml#
+
+  - if:
+      properties:
+        compatible:
+          const: allwinner,sun8i-b288-pinctrl
+
+    then:
+      patternProperties:
+        "^([rs]-)?(([a-z0-9]{3,}|[a-oq-z0-9][a-z0-9]*?)?-)+?(p[a-ilm][0-9]*?-)??pins?$":
+          required:
+            - allwinner,pinmux
   - if:
       not:
         properties:
@@ -222,6 +243,7 @@ allOf:
           enum:
             - allwinner,sun6i-a31-pinctrl
             - allwinner,sun6i-a31s-pinctrl
+            - allwinner,sun8i-b288-pinctrl
             - allwinner,sun50i-h6-pinctrl
 
     then:
-- 
2.52.0

