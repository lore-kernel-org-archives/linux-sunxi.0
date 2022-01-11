Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A70E52C9C
	for <linux-sunxi@lists.linux.dev>; Tue, 11 Jan 2022 16:06:13 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id br17so26878183lfb.6
        for <linux-sunxi@lists.linux.dev>; Tue, 11 Jan 2022 08:06:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wirenboard-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=870eFOoZ0Fa1c614sBVDWlzu1xI6Oxw/buGlrAvGuc8=;
        b=O4dnc68PcYexc81xffY36nJmPSYyhU6oqtmFTBO563Py6RrT/h3Ujk9C9N6g7ljw7S
         1G5J/xfd6dlM1LMIHnedEjDz9pkjd4Oyz218Gm2roG5tQRuFw1LGTZMsiR9TsG3IMiny
         U2RSCD3uBjFH5EXIaBPezgsC5eUHW41yWjuOZfhmPMgAW4T2Cl1wNeJba3YbEdBVfEw0
         AMbSYI2X9EiUKJCVOYQkG2TeGeGvFQgbIA09ul9BaBK0bcNIcM3V715qpFUIzFQsn0qf
         Xh7Gw/ljyWShy+4NRkexB0yKPdutDo9q3VFHmch1BAC+LK5QDiSau7HZVPFEvtxuBSNG
         0w/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=870eFOoZ0Fa1c614sBVDWlzu1xI6Oxw/buGlrAvGuc8=;
        b=WAzvCFzas85o4jBql5pD4pQgkig4IbjjzCf/pma7UOuDhHpeDEt7zvexhbQ36GGFkb
         uZb1OADcK958j3JtYhHgHA0loOUDaJJpchUBhGAsGVumU0BT9aecihSMDkodRDVCtizS
         5RjMiB+eikbpsUD3SUz22PQ+x8oXzdjIxSgKESVgfjaKm038G6u6JcIYkDwnWjolWwnl
         kArZkxeIKTrsdiL5LkWK/PTy7dOeW5s38ZYGwFpajTBxMEECwZ8Y3pP6frV0pP4t7Phv
         9JSbpOXUL0el70T8B1+gA6bLYlZRRzoz86YytIgpRpGGQy2wg83jAe+iug4VrtG87Sfg
         x7qQ==
X-Gm-Message-State: AOAM530hSQpaKYCPBbIiGInBPJFQAPUan3X8EcwGaMoRhcTXLmAuFKNV
	VyYVp+OGPITZqHiKG2Poa/jRNQ==
X-Google-Smtp-Source: ABdhPJyOwUv704liXlDnm4OvuF5plvIFbBwx4/3ze9uLYbh0RH0iLKEOO1GauxurTZLTw0rxDBRAww==
X-Received: by 2002:ac2:5599:: with SMTP id v25mr4002074lfg.662.1641917171778;
        Tue, 11 Jan 2022 08:06:11 -0800 (PST)
Received: from boger-laptop.lan (81.5.110.253.dhcp.mipt-telecom.ru. [81.5.110.253])
        by smtp.gmail.com with ESMTPSA id k39sm564803lfv.150.2022.01.11.08.06.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 08:06:11 -0800 (PST)
From: Evgeny Boger <boger@wirenboard.com>
To: Maxime Ripard <mripard@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	linux-arm-kernel@lists.infradead.org
Cc: Evgeny Boger <boger@wirenboard.com>,
	devicetree@vger.kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v4 2/3] dt-bindings: net: support for Allwinner R40 EMAC controller
Date: Tue, 11 Jan 2022 19:05:59 +0300
Message-Id: <20220111160600.58384-3-boger@wirenboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220111160600.58384-1-boger@wirenboard.com>
References: <20220111160600.58384-1-boger@wirenboard.com>
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
 .../net/allwinner,sun4i-a10-emac.yaml         | 20 ++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/allwinner,sun4i-a10-emac.yaml b/Documentation/devicetree/bindings/net/allwinner,sun4i-a10-emac.yaml
index 8d8560a67abf..8b38b4e981fe 100644
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

