Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC7722CA3
	for <linux-sunxi@lists.linux.dev>; Tue, 11 Jan 2022 15:57:36 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id j11so57924371lfg.3
        for <linux-sunxi@lists.linux.dev>; Tue, 11 Jan 2022 07:57:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wirenboard-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QNe6aTzR9gkb/+vCdyAp/Zw0YKIRP/v2w6mNVEQQPNA=;
        b=Sb/19RRQhexxPXEkK2R+CyPHogUGdOuD91tyq2+OtAsxTg2PBjEaHzNghcM/Vvvngv
         AuUSjXT8l49cPedjFw5f5oLFdBOzEdWih2udE2daJEVOa+/kOWtmZXnUYKTe5h9/U26w
         Pvit1XUTGmWpSkkDvfUq1ItJq9A1WB4MFGdGpCNRLiXeP8kIHqMGAhV2fQ9B5OkSbAbj
         kFEEs/WQLbOFtrnpejTUqVQTz9E8f1nGg5YW504HjtKo2FTm4lKOM0oh68mJD0s+CU58
         DosBLfUpAwwAsh5UnEuia0TtZXT1nREPhmRlcN2BFYAHm5wxzKC/KYScEsbep2pJYJ2o
         H4WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QNe6aTzR9gkb/+vCdyAp/Zw0YKIRP/v2w6mNVEQQPNA=;
        b=XXAoxTyTAkFVjJKsW9AtpNqlsDwm5aGnhwv64RhmP/5QRRQDG3W5FpeW06S3J3bw8o
         CmSR1rOOwlvRNs8Cr67EslFe8vKIEhCp4+IIfKuqh4BM8afvwzIvuVj2a7SOZqZI8Nkl
         +3P5xbpErhbC78UbZ3UqfMFoV5sCtObjiKhYLUe7nSq7wCSGL6msmjLdUiAUZpTatC83
         lGoF6yP2pra4wb+uDfua9aEQ4QFEGC7IlnClugzY0l9L2t8idVzuGS4Li/siRk8jTniK
         88ROpBLMZyz8F7zOx6QtQZ+4aW4n5CHtlwrDo8sjjrJ2KIOkeCAzUlUaTlwIoFpahAFk
         Kbvw==
X-Gm-Message-State: AOAM530UQXzr2fNtwIUJ9EZGmxNjM4AoZp49AQuVosSP6hk77R3BVDXw
	LVjIOjQbITapDCU0Pz+CQT3OCw==
X-Google-Smtp-Source: ABdhPJyNSYENIMVpHSSHyxWqxJl6Udb1sNgi9hY5EUxIFgnHjlsRjgUnOWiZhRR53Ri1ZiafUZ8MWg==
X-Received: by 2002:a05:6512:c13:: with SMTP id z19mr3756063lfu.640.1641916655051;
        Tue, 11 Jan 2022 07:57:35 -0800 (PST)
Received: from boger-laptop.lan (81.5.110.253.dhcp.mipt-telecom.ru. [81.5.110.253])
        by smtp.gmail.com with ESMTPSA id y7sm1370706lfa.92.2022.01.11.07.57.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 07:57:34 -0800 (PST)
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
Subject: [PATCH v2 1/3] dt-bindings: net: can: add support for Allwinner R40 CAN controller
Date: Tue, 11 Jan 2022 18:57:07 +0300
Message-Id: <20220111155709.56501-2-boger@wirenboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220111155709.56501-1-boger@wirenboard.com>
References: <20220111155709.56501-1-boger@wirenboard.com>
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

