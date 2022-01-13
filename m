Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 818482CA2
	for <linux-sunxi@lists.linux.dev>; Thu, 13 Jan 2022 05:37:49 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id s30so15730002lfo.7
        for <linux-sunxi@lists.linux.dev>; Wed, 12 Jan 2022 21:37:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wirenboard-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LMVIf6eidCZlhuBpwEpwVRF+pP+2nKVMi7BQpp34us4=;
        b=Bvsb1h0AIb14iTaT86yWwrvNGz0PAr7ClUuU3fvGQU2XxheDeP9LJblRniC6xYjsvW
         lrKsPV03aO2q8coFCQcLlkAcYArJ4/ZW0xeI2VE2+s7Dxs6Y3EspdKgrMwm/u56iAM8M
         HVD+AtmXg0zZ8ctBSU8ER6sZ7Ro4xu7kVi/eyEV/0HamYpCPTaUeKS4QAlnFQCPeXAQs
         Eu8Mmt3G2MFQ1fxOpqwKRpvUKOyLiG/mjkVPT1PsiLCqcgf5+DIpKmMSKb+J7oHazjy9
         3+LcSq7KB+nLlwkMwmphPyc2vLQqmHZQ58JrVrm30fHjuHuqtGaFDp+OJjbw6hTPE5UB
         wZlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LMVIf6eidCZlhuBpwEpwVRF+pP+2nKVMi7BQpp34us4=;
        b=5Hyeo401OodwmJ7tgSeLEoYFzKUXhaVMaZT7w4PJ/UZhjbF7kApXN4E/T4bAkPra5V
         8vhQbfvOUHSB/r4y3s+mTyUa8ddYV51IVMtXpBdGqdQ3PxRosX2+seD+F5BJh2RXroMz
         119ar1VhrxKsA6/emoOVuBW7ePjUAoHAcklN32K9SY6U6U8KvGXn1brwzooHlsp4mWQj
         ZWgC/9mFtStbEsmv+jEwWAEdTbRx7T6IGOimT4rp2hSf/E7q7coWRpEhwtC0PC4eGwcL
         ZkPXT6sMipH7gXGPNoFOcq3rCehOV0yVs6yfO/fesS4eWtbwr4wdK9tHz5QIYDyDMqIB
         qTzw==
X-Gm-Message-State: AOAM533Jm4bEiExlfuxw9z0Mpfgfzy9PQYqaD10vbKJOfOrbbuj9BvFV
	l5yZ41CoVgJl66uqAiQt6sOu/A==
X-Google-Smtp-Source: ABdhPJxVtxlA4bWuEqA2uFn9Wd95Jc9arVr0nXuJXUGhs2wGi+qnEcxMcnypYqKX6crSvaItGv3kqA==
X-Received: by 2002:a05:6512:b01:: with SMTP id w1mr2194009lfu.301.1642052267729;
        Wed, 12 Jan 2022 21:37:47 -0800 (PST)
Received: from boger-laptop.lan (81.5.110.253.dhcp.mipt-telecom.ru. [81.5.110.253])
        by smtp.gmail.com with ESMTPSA id x21sm180212lfa.296.2022.01.12.21.37.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jan 2022 21:37:47 -0800 (PST)
From: Evgeny Boger <boger@wirenboard.com>
To: Maxime Ripard <mripard@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	linux-arm-kernel@lists.infradead.org
Cc: Evgeny Boger <boger@wirenboard.com>,
	devicetree@vger.kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v5 2/3] dt-bindings: net: support for Allwinner R40 EMAC controller
Date: Thu, 13 Jan 2022 08:37:33 +0300
Message-Id: <20220113053734.105813-3-boger@wirenboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220113053734.105813-1-boger@wirenboard.com>
References: <20220113053734.105813-1-boger@wirenboard.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

R40 and A10/A20 share the same EMAC IP.
However, on R40 the EMAC reset needs to be deasserted first,
so resets property is required.

Signed-off-by: Evgeny Boger <boger@wirenboard.com>
---
 .../bindings/net/allwinner,sun4i-a10-emac.yaml  | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/allwinner,sun4i-a10-emac.yaml b/Documentation/devicetree/bindings/net/allwinner,sun4i-a10-emac.yaml
index 8d8560a67abf..d9ed7b547af3 100644
--- a/Documentation/devicetree/bindings/net/allwinner,sun4i-a10-emac.yaml
+++ b/Documentation/devicetree/bindings/net/allwinner,sun4i-a10-emac.yaml
@@ -15,7 +15,9 @@ maintainers:
 
 properties:
   compatible:
-    const: allwinner,sun4i-a10-emac
+    enum:
+      - allwinner,sun4i-a10-emac
+      - allwinner,sun8i-r40-emac
 
   reg:
     maxItems: 1
@@ -30,6 +32,19 @@ properties:
     description: Phandle to the device SRAM
     $ref: /schemas/types.yaml#/definitions/phandle-array
 
+  resets:
+    maxItems: 1
+
+if:
+  properties:
+    compatible:
+      contains:
+        const: allwinner,sun8i-r40-emac
+
+then:
+  required:
+    - resets
+
 required:
   - compatible
   - reg
-- 
2.25.1

