Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F7881FB2
	for <linux-sunxi@lists.linux.dev>; Sun, 14 May 2023 07:47:55 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-52c30fa5271so6084196a12.0
        for <linux-sunxi@lists.linux.dev>; Sun, 14 May 2023 00:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=heitbaum.com; s=google; t=1684050475; x=1686642475;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ay1MPc6F0iyKA9Pf+RpucZR4uy8JJBBnlfw3+ke13QI=;
        b=c9CtYou5DiDEv6nGqLhstt6vJCSMYNO/S5P96q/XqghzCd/gomUZ/HQlblodvKDIlx
         Oh7IWEW+tsTEg8LA5W/LzBt/EvuBWmj9hY/hVLGf+YbBIpE79aoUGOMJKxueqM004iu1
         f1NCXVfpxrDWOYWrCC36+PRLCDmBurqms4Vac=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684050475; x=1686642475;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ay1MPc6F0iyKA9Pf+RpucZR4uy8JJBBnlfw3+ke13QI=;
        b=GHWKN0gCcvweZC+XKNlKnj9rfOsGBSqri+MgNl947W25gpnwuNos+OOrBmA9yyY6DS
         26OOLrN8vLXSqSBodzlEIrmIp27njLr/EY52V6dW2sffLIcfkTdd+2D/tbWUVi2HTcQA
         CCc06ZO3R9qIgBCeWnyDPvGs8UumJlIzn/P7IGj6pA3nRw2KDHAuGyLgoy5UJRZH5GEl
         SE5d2UF0KPVqTn0NVa5cIXo7XgagQ9pl3kv4F/tGjt+6MPPEreU9e5Q4MuBYlVXKy1t0
         VM0XPSpXHoIUDWiWDHArKXhlnikrbncUJouAwhXnS8hK5e4a/JboXSi+tzzE1DWDxZx/
         Sk+g==
X-Gm-Message-State: AC+VfDwsnWFe50jWCmlJkxVOMVJT5v5PikHiN/I9icGcmp41H5w9LnTZ
	VT/umQdF4W53rZy5Iur1qv7tqw==
X-Google-Smtp-Source: ACHHUZ7+GvsJHRM7m26GQl/jq/2g/yljHEAye1w4XghdoWhpKePYcISv5PAzlF6jy9GhkyljLOaE1w==
X-Received: by 2002:a17:90b:1bc1:b0:24e:2248:31c with SMTP id oa1-20020a17090b1bc100b0024e2248031cmr30507509pjb.22.1684050474747;
        Sun, 14 May 2023 00:47:54 -0700 (PDT)
Received: from 8add390ca20e.heitbaum.com ([122.199.31.3])
        by smtp.googlemail.com with ESMTPSA id j4-20020a17090276c400b00194caf3e975sm10903363plt.208.2023.05.14.00.47.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 May 2023 00:47:54 -0700 (PDT)
From: Rudi Heitbaum <rudi@heitbaum.com>
To: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	wens@csie.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	marcel@holtmann.org,
	johan.hedberg@gmail.com,
	luiz.dentz@gmail.com,
	anarsoul@gmail.com,
	alistair@alistair23.me
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-bluetooth@vger.kernel.org,
	Rudi Heitbaum <rudi@heitbaum.com>
Subject: [PATCH 1/3] dt-bindings: net: realtek-bluetooth: Add RTL8822BS
Date: Sun, 14 May 2023 07:47:29 +0000
Message-Id: <20230514074731.70614-2-rudi@heitbaum.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230514074731.70614-1-rudi@heitbaum.com>
References: <20230514074731.70614-1-rudi@heitbaum.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add compatible string for RTL8822BS for existing Realtek Bluetooth
driver.

Signed-off-by: Rudi Heitbaum <rudi@heitbaum.com>
---
 .../devicetree/bindings/net/realtek-bluetooth.yaml  | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/realtek-bluetooth.yaml b/Documentation/devicetree/bindings/net/realtek-bluetooth.yaml
index 8cc2b9924680..d2103931fc1c 100644
--- a/Documentation/devicetree/bindings/net/realtek-bluetooth.yaml
+++ b/Documentation/devicetree/bindings/net/realtek-bluetooth.yaml
@@ -4,16 +4,16 @@
 $id: http://devicetree.org/schemas/net/realtek-bluetooth.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: RTL8723BS/RTL8723CS/RTL8821CS/RTL8822CS Bluetooth
+title: RTL8723BS/RTL8723CS/RTL8821CS/RTL8822BS/RTL8822CS Bluetooth
 
 maintainers:
   - Vasily Khoruzhick <anarsoul@gmail.com>
   - Alistair Francis <alistair@alistair23.me>
 
 description:
-  RTL8723CS/RTL8723CS/RTL8821CS/RTL8822CS is a WiFi + BT chip. WiFi part
-  is connected over SDIO, while BT is connected over serial. It speaks
-  H5 protocol with few extra commands to upload firmware and change
+  RTL8723CS/RTL8723CS/RTL8821CS/RTL8822BS/RTL8822CS is a WiFi + BT chip.
+  WiFi part is connected over SDIO, while BT is connected over serial. It
+  speaks H5 protocol with few extra commands to upload firmware and change
   module speed.
 
 properties:
@@ -23,11 +23,14 @@ properties:
           - realtek,rtl8723bs-bt
           - realtek,rtl8723cs-bt
           - realtek,rtl8723ds-bt
+          - realtek,rtl8822bs-bt
           - realtek,rtl8822cs-bt
       - items:
           - enum:
               - realtek,rtl8821cs-bt
-          - const: realtek,rtl8822cs-bt
+          - const:
+              - realtek,rtl8822bs-bt
+              - realtek,rtl8822cs-bt
 
   device-wake-gpios:
     maxItems: 1
-- 
2.25.1

