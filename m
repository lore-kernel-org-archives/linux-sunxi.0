Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3762F29CA
	for <linux-sunxi@lists.linux.dev>; Mon, 22 Nov 2021 10:46:43 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id k37so78818338lfv.3
        for <linux-sunxi@lists.linux.dev>; Mon, 22 Nov 2021 02:46:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wirenboard-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QNe6aTzR9gkb/+vCdyAp/Zw0YKIRP/v2w6mNVEQQPNA=;
        b=3OEh1zKxBUNBazeE8TXb6pak8tCqz0c4CoZMXS16AFtpOYDidMJVNek6ZxCUO5xeXx
         pMM9+KRg+aAxqMZwFgzqDlaFlYlyzKft6NLXHgMN09MOwyo8351V4S+X1V4pSbG01C4u
         ILcfBGnqeEcEVsYfK0w/qPXgTnVLn2linheH8b5nRbBR96L5A2ab/ObIfFQ0EuDUEcYI
         fAzVEmdBFCzWn8UiGcuHDgESMCLUTw8hKAn8NwZCktXMLXNTKDZ+j2mV1pRC9cO0/soY
         GPbXLHXzxb05ZlgrQg4DBAbPjRWXAubO8sOUI77c5bFf3bXery24v2vYgj7c5TNXiZph
         5MyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QNe6aTzR9gkb/+vCdyAp/Zw0YKIRP/v2w6mNVEQQPNA=;
        b=quHCpBTklBT7rC0nec+s/CWPd0jxQQ2lqL5oIhK48TYuSKExd8XvAGn+MeVgrYkTyL
         SqQGbC66jTVM3ICYk/H3hLk5i4fBzXN9B52kSZhKt45qHnjwqE28Kfe6ZpyBFFO5T5oq
         PrN69CEB3fgAAwFVcqR04Ifs/daMvWiENRoLTMDPu5xMhzvxBm4yRE80gjnIkt8BEJS9
         tjzAUUnIfRtXXZPX0APHjccl6PxYnjKYx0cAylUZRqKTt57gWAojhUpqXQC9MFLyQGD0
         OuVl2jdcqY6F1w02R9Ej+1J6hdI3nG2N3Ou2vIGAyFMlOWv4jkiOzHnLoVicuy9IOgJX
         37Cw==
X-Gm-Message-State: AOAM533HSkz4BRrDCm9ASZjRpVwyBpcwf50526iY0P7fvV2xwu5TBZXq
	x3FuEndMEzpNCWLVzltG/ouGeA==
X-Google-Smtp-Source: ABdhPJzL4Pb/y4VHvTqNi3h3McYI6lp2gv8xX2z4vKS4OUiGMikVJcAVlJtMMmJ8yufQyTioFh7x+Q==
X-Received: by 2002:a05:6512:1194:: with SMTP id g20mr52837084lfr.58.1637578001912;
        Mon, 22 Nov 2021 02:46:41 -0800 (PST)
Received: from boger-laptop.lan (81.5.99.121.dhcp.mipt-telecom.ru. [81.5.99.121])
        by smtp.gmail.com with ESMTPSA id bi24sm923538lfb.49.2021.11.22.02.46.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Nov 2021 02:46:41 -0800 (PST)
From: Evgeny Boger <boger@wirenboard.com>
To: Maxime Ripard <mripard@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	linux-arm-kernel@lists.infradead.org
Cc: Evgeny Boger <boger@wirenboard.com>,
	devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-can@vger.kernel.org,
	Wolfgang Grandegger <wg@grandegger.com>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	"David S . Miller" <davem@davemloft.net>,
	Jeroen Hofstee <jhofstee@victronenergy.com>,
	Gerhard Bertelsmann <info@gerhard-bertelsmann.de>
Subject: [PATCH 1/3] dt-bindings: net: can: add support for Allwinner R40 CAN controller
Date: Mon, 22 Nov 2021 13:46:14 +0300
Message-Id: <20211122104616.537156-2-boger@wirenboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211122104616.537156-1-boger@wirenboard.com>
References: <20211122104616.537156-1-boger@wirenboard.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allwinner R40 (also known as A40i, T3, V40) has a CAN controller. The
controller is the same as in earlier A10 and A20 SoCs, but needs reset
line to be deasserted before use.

This patch Introduces new compatible for R40 CAN controller with
required resets property.

Signed-off-by: Evgeny Boger <boger@wirenboard.com>
---
 .../net/can/allwinner,sun4i-a10-can.yaml      | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/can/allwinner,sun4i-a10-can.yaml b/Documentation/devicetree/bindings/net/can/allwinner,sun4i-a10-can.yaml
index a95960ee3feb..c93fe9d3ea82 100644
--- a/Documentation/devicetree/bindings/net/can/allwinner,sun4i-a10-can.yaml
+++ b/Documentation/devicetree/bindings/net/can/allwinner,sun4i-a10-can.yaml
@@ -17,6 +17,7 @@ properties:
           - const: allwinner,sun7i-a20-can
           - const: allwinner,sun4i-a10-can
       - const: allwinner,sun4i-a10-can
+      - const: allwinner,sun8i-r40-can
 
   reg:
     maxItems: 1
@@ -27,6 +28,19 @@ properties:
   clocks:
     maxItems: 1
 
+  resets:
+    maxItems: 1
+
+if:
+  properties:
+    compatible:
+      contains:
+        const: allwinner,sun8i-r40-can
+
+then:
+  required:
+    - resets
+
 required:
   - compatible
   - reg
@@ -47,5 +61,15 @@ examples:
         interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
         clocks = <&ccu CLK_APB1_CAN>;
     };
+  - |
+    #define RST_BUS_CAN		68
+    #define CLK_BUS_CAN		91
+    can1: can@1c2bc00 {
+        compatible = "allwinner,sun8i-r40-can";
+        reg = <0x01c2bc00 0x400>;
+        interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&ccu CLK_BUS_CAN>;
+        resets = <&ccu RST_BUS_CAN>;
+    };
 
 ...
-- 
2.25.1

