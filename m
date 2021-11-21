Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 732762C88
	for <linux-sunxi@lists.linux.dev>; Sun, 21 Nov 2021 19:54:03 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id bu18so70818724lfb.0
        for <linux-sunxi@lists.linux.dev>; Sun, 21 Nov 2021 11:54:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wirenboard-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=alj45tjzXeDfJ+7cslBZpCEeF9lcTvjC9KNxaxcnO9E=;
        b=1qZOxMA0fSJ7ozLQEbF8wX2dMGDkXUKzVIRteiG/npVKNS4C8tfWPDWEGmcHfx8gXz
         8enTc2tv8DeYMmBU03pg0FjlL7hbmxhpU4COs7EM5dNP8AL5xPfCRgt/Qq1XxgBFwnop
         c0niKq5r7lMiv43OriZkDmvYzwp4ozLE4gVC8dFXWJUmjjguxnVEOygKo6x+XdwY/VzE
         PhjuOwm3teHdkt6yrJs4fOIiFIwe1lnyzgcF7Vrii8R3cFRnOp24hPE35Xca4Olsg5UV
         yyeoKHjP9InhFpBQfIOH3DJXnD/iKi3h9NhZfABMNybxZW4mxGmwmrdEDKAZTZv/oIk0
         fsUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=alj45tjzXeDfJ+7cslBZpCEeF9lcTvjC9KNxaxcnO9E=;
        b=ak17n46pckPZHphg2bAFHteYXybczYixVmtTzWgk3qs6haYRP+g9S4r4xl4qcp5naL
         9LszM2BQmyIfRvvYIJvAiSB1GWQ3esnkzpq+JwPGa6Dei5qZ0mrTphIw3X2ruohVknDc
         X/qEw0AciVWfiSKQYWQFT02iCy2q88jM9MYanlxdsYUFH/f3NUX+hKiwwinoO4AosinM
         qD5f26EOl/r/Ru2paXxOY6IH3XN6bBKxy+wt+RnM1vTDt6XjYciWzhQ+6HnSweouqWxr
         Xrdc0Z8AcEHTdc8ZmRU0j/UnXlvMCSYDX4XzMHB7W8ujb0E6svRXfnliQhhNBIKrwoQb
         NOLw==
X-Gm-Message-State: AOAM533/TNOhoVm1ZT7+7SEGeNWpglxNnQCcNJFdSlz/sKqczbgSYOjL
	1a76sQnahcwAQQoedHch+OvA9w==
X-Google-Smtp-Source: ABdhPJyErcj/LDk+DJUfMBNW1gxvSi2lolzFq6sZthh1OnsHxTynUFegI7y5Nw5wlm11RsMwq3vr1A==
X-Received: by 2002:a05:6512:16a8:: with SMTP id bu40mr23795710lfb.483.1637524441671;
        Sun, 21 Nov 2021 11:54:01 -0800 (PST)
Received: from boger-laptop.lan (81.5.99.121.dhcp.mipt-telecom.ru. [81.5.99.121])
        by smtp.gmail.com with ESMTPSA id a24sm768987ljq.18.2021.11.21.11.54.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Nov 2021 11:54:01 -0800 (PST)
From: Evgeny Boger <boger@wirenboard.com>
To: Maxime Ripard <mripard@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	linux-arm-kernel@lists.infradead.org
Cc: Evgeny Boger <boger@wirenboard.com>,
	devicetree@vger.kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v3 2/3] dt-bindings: net: support for Allwinner R40 EMAC controller
Date: Sun, 21 Nov 2021 22:53:36 +0300
Message-Id: <20211121195337.230475-3-boger@wirenboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211121195337.230475-1-boger@wirenboard.com>
References: <20211121195337.230475-1-boger@wirenboard.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

R40 and A10/A20 share the same EMAC IP.
However, on R40 the EMAC is gated by default, so reset
property is required.

Signed-off-by: Evgeny Boger <boger@wirenboard.com>
---
 .../net/allwinner,sun4i-a10-emac.yaml         | 20 ++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/allwinner,sun4i-a10-emac.yaml b/Documentation/devicetree/bindings/net/allwinner,sun4i-a10-emac.yaml
index 8d8560a67abf..cbb297c38daa 100644
--- a/Documentation/devicetree/bindings/net/allwinner,sun4i-a10-emac.yaml
+++ b/Documentation/devicetree/bindings/net/allwinner,sun4i-a10-emac.yaml
@@ -15,7 +15,9 @@ maintainers:
 
 properties:
   compatible:
-    const: allwinner,sun4i-a10-emac
+    enum:
+      - allwinner,sun4i-a10-emac
+      - allwinner,sun4i-r40-emac
 
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
+        const: allwinner,sun4i-r40-emac
+
+then:
+  required:
+    - resets
+
 required:
   - compatible
   - reg
@@ -42,11 +57,14 @@ unevaluatedProperties: false
 
 examples:
   - |
+    #define RST_BUS_EMAC		14
+
     emac: ethernet@1c0b000 {
         compatible = "allwinner,sun4i-a10-emac";
         reg = <0x01c0b000 0x1000>;
         interrupts = <55>;
         clocks = <&ahb_gates 17>;
+        resets = <&ccu RST_BUS_EMAC>;
         phy-handle = <&phy0>;
         allwinner,sram = <&emac_sram 1>;
     };
-- 
2.25.1

