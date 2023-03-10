Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 399228820
	for <linux-sunxi@lists.linux.dev>; Fri, 10 Mar 2023 14:48:37 +0000 (UTC)
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-17638494edbso6036543fac.10
        for <linux-sunxi@lists.linux.dev>; Fri, 10 Mar 2023 06:48:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678459716;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GQ2+PQGllxO2iVkzKima9jszwdEFIn3jQrBHflP9Onc=;
        b=Uhy+l6TsDuhuYeT6ecDGxCdzRsh/ZFrgeg5mYnhKwhtIyxn/xhDCyHx2qsCVI8P9yr
         Nd1DMVtvTsFznYYcjhZDSXWjZdJUCti7wE3E0NqB+G26OFnvV/qc+Dgere5UEksxxCjY
         eIbM8JwfPGb9uFu/UXNDjSkDt07+lcqsZ9Hi/mf/gsMG8uxsK09tRtW61kSTHs2ot/Fm
         fZnYz5WWnLirl0yVwNgRFnYe+La7D9V2udRUoWCIzHp2N2/86oEfwU1suuSI/CsUr88H
         Z2RXN6YujvsrgOSNq9g4C8zt9F3Bx9yp3RFAFMCZEG7SNoHew2MDD3qGtltLMFiFrhYK
         VCAg==
X-Gm-Message-State: AO0yUKU3A9zVuFN6EBLbV8e4X/uNX/CuNGKGFz+uIL4zeSYZLOfiUFqh
	rPxPuDI3mmvA/sDIwt0dUA==
X-Google-Smtp-Source: AK7set9dCtF6YjDNuDf/itnbkBqLEzqFi/95OtxgYDb7R2Ro64NdR9SeQyVNbDETqd4yarYgCX0wAg==
X-Received: by 2002:a05:6870:2108:b0:16e:2d3f:187 with SMTP id f8-20020a056870210800b0016e2d3f0187mr17201161oae.11.1678459716307;
        Fri, 10 Mar 2023 06:48:36 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id e6-20020a056870920600b0017630fe87e5sm88853oaf.33.2023.03.10.06.48.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 06:48:35 -0800 (PST)
Received: (nullmailer pid 1544626 invoked by uid 1000);
	Fri, 10 Mar 2023 14:47:20 -0000
From: Rob Herring <robh@kernel.org>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org, linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] phy: Use of_property_present() for testing DT property presence
Date: Fri, 10 Mar 2023 08:47:20 -0600
Message-Id: <20230310144720.1544600-1-robh@kernel.org>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It is preferred to use typed property access functions (i.e.
of_property_read_<type> functions) rather than low-level
of_get_property/of_find_property functions for reading properties. As
part of this, convert of_get_property/of_find_property calls to the
recently added of_property_present() helper when we just want to test
for presence of a property and nothing more.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/phy/allwinner/phy-sun4i-usb.c  | 2 +-
 drivers/phy/broadcom/phy-bcm-ns-usb2.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/allwinner/phy-sun4i-usb.c b/drivers/phy/allwinner/phy-sun4i-usb.c
index fbcd7014ab43..fc9f6fb447a0 100644
--- a/drivers/phy/allwinner/phy-sun4i-usb.c
+++ b/drivers/phy/allwinner/phy-sun4i-usb.c
@@ -758,7 +758,7 @@ static int sun4i_usb_phy_probe(struct platform_device *pdev)
 		return PTR_ERR(data->vbus_det_gpio);
 	}
 
-	if (of_find_property(np, "usb0_vbus_power-supply", NULL)) {
+	if (of_property_present(np, "usb0_vbus_power-supply")) {
 		data->vbus_power_supply = devm_power_supply_get_by_phandle(dev,
 						     "usb0_vbus_power-supply");
 		if (IS_ERR(data->vbus_power_supply)) {
diff --git a/drivers/phy/broadcom/phy-bcm-ns-usb2.c b/drivers/phy/broadcom/phy-bcm-ns-usb2.c
index 6a36e187d100..269564bdf687 100644
--- a/drivers/phy/broadcom/phy-bcm-ns-usb2.c
+++ b/drivers/phy/broadcom/phy-bcm-ns-usb2.c
@@ -107,7 +107,7 @@ static int bcm_ns_usb2_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	usb2->dev = dev;
 
-	if (of_find_property(dev->of_node, "brcm,syscon-clkset", NULL)) {
+	if (of_property_present(dev->of_node, "brcm,syscon-clkset")) {
 		usb2->base = devm_platform_ioremap_resource(pdev, 0);
 		if (IS_ERR(usb2->base)) {
 			dev_err(dev, "Failed to map control reg\n");
-- 
2.39.2

