Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1BF3241116
	for <linux-sunxi@lists.linux.dev>; Mon, 26 May 2025 18:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748284218; cv=none; b=SLzzmpF2WABA/cyfYIQb57AsLzRW4WyCBeNmjv1a+0X/vbIwn3sK3LgAisEXPp23Oaosuh81E3NlN3v51SVMN6BJZc0OwkCkiXVAWTWB7TQ9DNJhUMQEopuBh1YarlJHKNRNWUBnyEy0uzDaIMMqMTIme83onu1nGrXpwuvin+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748284218; c=relaxed/simple;
	bh=Xp7PQEwsXr/t3weISbAl8pNnnIKTP2opDnVGAv6TSHg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XrWySvY5YwFPBMNz+0ri6Z0UoghjQSWKEO/onvRDE6jzXU3nfczDox0LPo42K3/Y0aK3YaewlrBnFN4rgq+VNOJzmPkZCV3QiNeD/Kanb2pZxQXdChmPqDL1QTFj7aQswd+kwMeOuHhHi7SD44Mz8ZudMiV5p1tOmj/gCIWBdAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SHobQ28X; arc=none smtp.client-ip=209.85.166.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SHobQ28X"
Received: by mail-io1-f41.google.com with SMTP id ca18e2360f4ac-85b3f92c8f8so250794939f.1
        for <linux-sunxi@lists.linux.dev>; Mon, 26 May 2025 11:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748284216; x=1748889016; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ULjqis0u87KSpipZTk1NBKJD257/ZcSGIbJ8awB7PCg=;
        b=SHobQ28Xu3LnX6LW7qFZVBgbuLVd7er28k4JABcdptRGjS/+3VvmdN3RM911aZtlFB
         OeJ6ruG/MDdBsK/qI1DpfmdM/fomtyTEE12/vHrczS4FAsEeQ1J5k7d1VnrV+nFpjJE7
         UqVe+gDSzsBlyuf5YUUis7w1dTHHmA39WN5x6MAxP9juIIAK7kIvdkuszIc0KQb82+S4
         ryczdlQvFy7NV0kdVfBq/gB1DiGhKjejFMoxkp6bw9jsDRdKIfytSQvTWYEkEk12rT0w
         H1Bt12TBoT8gbBX2uNQowsCcThBiQTNVAyR5xttvu3GfjgIl64OIOPy/DQkNpd/USVny
         f7oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748284216; x=1748889016;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ULjqis0u87KSpipZTk1NBKJD257/ZcSGIbJ8awB7PCg=;
        b=Z+roehmkWwU/whrcJMtHEPSbNuQEeAhqHEMKg24k0EYw+q0XbeE0GiZYFge762DMm/
         CUsnMSzSaadUkQ1RbCddqhRK2Q7mQbBySjoqfGV0S3W+6ITWzuVjjKO80dLOotUYkq3g
         Ptn6SgjRIJUaSpFGsmUy7cABhOuz+9Jof5CNKqbRtarZuV9o9wLCTrE1g2brFDQDTmVj
         KLn2Vpt2Az6T2ZKjZfUlICBmIznWnvB+hHqrZAnTUSuPkhz/KlUGngWn6Fy63/WdWh1B
         zUukf+9IPWUOiC2L5dh+ggX41u9F8TU2nMmmWo5lHtl2EkrhTuklTOTygL2pEFdq+XDO
         lN8g==
X-Gm-Message-State: AOJu0Yz4HiWhnhHTjT39q6FmM/0G8XqGTt8DltxVPx4R0fYqIFvaDact
	I2VNKssSjrQQfq5uBHLfvvYYzacgNGoQig2NBxvEZN/kiOE6xqz9YD45
X-Gm-Gg: ASbGncub1tUycO1cHd7kVy5z0yjnt4v6aGgqxThuWPkGOrRzmPolKqsjZe1DzRjpHeu
	IVNCptGVN9jlXgxN6VNYZ3pxu8RHrw5a9/wJ9kZHAixmOKN5tldH/qp0//Nkb+swvNxLPWsb+75
	m695S5SlqmhFGCoOd7efcoZ0E1lnVVdZcqwbZNSt/dGWmJUoZLsbpDu0NdFY+lDcJJGAjUlXc99
	SS5wW46iRl16vFq5wQAo1EHHoX5bM+AAu3dqCcG6GBKf+ZDrGsnFjDapZlCd8KZrwd5t+O+GuIs
	40ncRApAYKa82YLNhJpJvaSdqJtXwFF/HZ7K/Ncbz+KD9AvXIKkJZl6wzkmDcd937IEfXrYIeFD
	V46JVPct1Od9Hen43rmxuEdnHmzq1Zw==
X-Google-Smtp-Source: AGHT+IHNnI4y1dgkj56msBwfJyexQj/NA4bKNpsudos+JvpD2sSrSNG4qTOxJTKBL54sr41hgUQMyw==
X-Received: by 2002:a05:6602:4a0d:b0:86a:25d5:2dbe with SMTP id ca18e2360f4ac-86cbb7dcffamr1231342039f.4.1748284215957;
        Mon, 26 May 2025 11:30:15 -0700 (PDT)
Received: from james-x399.localdomain (97-118-146-220.hlrn.qwest.net. [97.118.146.220])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-86a235bff69sm477028639f.8.2025.05.26.11.30.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 11:30:15 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: netdev@vger.kernel.org
Cc: linux-sunxi@lists.linux.dev,
	James Hilliard <james.hilliard1@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 3/3] dt-bindings: net: sun8i-emac: Add AC300 EMAC1 nvmem phy selection
Date: Mon, 26 May 2025 12:29:36 -0600
Message-Id: <20250526182939.2593553-3-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250526182939.2593553-1-james.hilliard1@gmail.com>
References: <20250526182939.2593553-1-james.hilliard1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Allwinner H616 EMAC1 can be connected to an on-die AC200 or AC300
PHY depending upon the silicon variant.

Add a new allwinner,sun50i-h616-emac1 compatible and example, support
for the allwinner,sun50i-h616-emac1 will be added later on.

Add nvmem-cells and nvmem-cell-names properties for the ac300 efuse
based phy selection.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../net/allwinner,sun8i-a83t-emac.yaml        | 42 +++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml b/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml
index 7fe0352dff0f..b6bf1718dba1 100644
--- a/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml
+++ b/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml
@@ -18,6 +18,7 @@ properties:
       - const: allwinner,sun8i-r40-gmac
       - const: allwinner,sun8i-v3s-emac
       - const: allwinner,sun50i-a64-emac
+      - const: allwinner,sun50i-h616-emac1
       - items:
           - enum:
               - allwinner,sun20i-d1-emac
@@ -28,6 +29,14 @@ properties:
   reg:
     maxItems: 1
 
+  nvmem-cells:
+    maxItems: 1
+    description: NVMEM cell with the ac300 efuse.
+
+  nvmem-cell-names:
+    items:
+      - const: ac300
+
   interrupts:
     maxItems: 1
 
@@ -321,4 +330,37 @@ examples:
         };
     };
 
+  - |
+    ethernet@5030000 {
+        compatible = "allwinner,sun50i-h616-emac1";
+        reg = <0x05030000 0x10000>;
+        interrupts = <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "macirq";
+        resets = <&ccu RST_BUS_EMAC1>;
+        reset-names = "stmmaceth";
+        clocks = <&ccu CLK_BUS_EMAC1>;
+        clock-names = "stmmaceth";
+        phys = <&ac200_rmii_phy>, <&ac300_rmii_phy>;
+        phy-names = "ac200", "ac300";
+        phy-mode = "rgmii";
+        nvmem-cells = <&ephy_acx00>;
+        nvmem-cell-names = "ac300";
+
+        mdio {
+            compatible = "snps,dwmac-mdio";
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            ac300_rmii_phy: ac300-ethernet-phy@0 {
+              compatible = "ethernet-phy-ieee802.3-c22";
+              reg = <0>;
+            };
+
+            ac200_rmii_phy: ac200-ethernet-phy@1 {
+              compatible = "ethernet-phy-ieee802.3-c22";
+              reg = <1>;
+            };
+        };
+    };
+
 ...
-- 
2.34.1

