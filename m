Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F351DDDD
	for <linux-sunxi@lists.linux.dev>; Sun, 24 Sep 2023 19:26:20 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-9b281a2aa94so65040866b.2
        for <linux-sunxi@lists.linux.dev>; Sun, 24 Sep 2023 12:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695583578; x=1696188378; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LyCnYDXrBkQd8nc6ex8m6+Z4ml6K8C/rEJGtjuolnss=;
        b=YmZI6YPc4cqz+6ap00oqy2p6wx1ruH87l9ZYUtp0mgU5NZ1IXN0ZcMQT3E3tFmgvYh
         ZPOLp84pWqqEimD4I+9QuY5hdY389HE/DJW6FVbJZuwI21aZLbpe8fCEE7o3mTgYPXXS
         iYIq+UrMoV1zRI1z6r0m6AeA2GJ1d/Ek+FPs7fwvjvgz7QKV7NqBOMUy0I5JlaoDfXYb
         gXtZ7rmWvkit2YsPNETg49RsSBRLcWis67nMXlrzhG1fI9had3xDhPznmqN1YBGFK3pA
         agZA0P1Kr0FDKxXl9ltJ73mbVbxvNw9ih53X77VkxOajNbZ0G0EF0zhgIfo6qpcgJmrk
         F2Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695583578; x=1696188378;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LyCnYDXrBkQd8nc6ex8m6+Z4ml6K8C/rEJGtjuolnss=;
        b=vf3H8yXGWv5zN2vAjE0YUsF48GCesrbiPqMOSZs0bTPo+KRwFyf03XpNe2odo+qwQp
         wIwJohSX7LV0LiQoXyun3J5YZbFBhhXkETS8Xy91FpbrFpR2ioK+H0xW5A+Uk8mwS+nv
         5yryySjAklFEOcslJNdmVdWo6+y/EGzmW3wVNtmtHf6SvXV7kWKO+T+lYlRfLKT2MpDD
         T70XR0eYOzpx2Twi+H7apwnOBRCEVB8V6IpKrdicL3T4ajWwGVN5W0Ntxp/KABM0H640
         D7CcqJZx1ToTXqWf0WwAWvkPY5Rxpzd+v/U6bGQyG58z0AXzadoMU+5su2fsE4u5YbJH
         BZpg==
X-Gm-Message-State: AOJu0YzJtO42TspmTXmEsIFgQ4Dxb0UmP9lKK/jWQcrg5HUjfwPzUefu
	nd2nP+zdxquQkO3Zs/+Y7Zk=
X-Google-Smtp-Source: AGHT+IHCd1BgUV+vVYd3ZH8172gAFJIE1DUEWCbKCJthb4PpjhafqLcGbcOPCGbl9m5xDtLEBPKB7g==
X-Received: by 2002:a17:907:7715:b0:9ae:6a8b:f8aa with SMTP id kw21-20020a170907771500b009ae6a8bf8aamr3983876ejc.26.1695583578522;
        Sun, 24 Sep 2023 12:26:18 -0700 (PDT)
Received: from localhost.localdomain (82-149-12-148.dynamic.telemach.net. [82.149.12.148])
        by smtp.gmail.com with ESMTPSA id z21-20020a1709063a1500b0099d0c0bb92bsm5317632eje.80.2023.09.24.12.26.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Sep 2023 12:26:18 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: mripard@kernel.org,
	wens@csie.org
Cc: airlied@gmail.com,
	daniel@ffwll.ch,
	samuel@sholland.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 6/7] drm/sun4i: dw-hdmi: Make sun8i_hdmi_phy_get() more intuitive
Date: Sun, 24 Sep 2023 21:26:03 +0200
Message-ID: <20230924192604.3262187-7-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230924192604.3262187-1-jernej.skrabec@gmail.com>
References: <20230924192604.3262187-1-jernej.skrabec@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Let's make sun8i_hdmi_phy_get() to behave more like other kernel
functions and return phy pointer instead of setting field in struct.
This also makes function more universal.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c  |  5 +++--
 drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h  |  2 +-
 drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c | 10 ++++------
 3 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
index d93e8ff71aae..41f815a1faec 100644
--- a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
+++ b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
@@ -239,10 +239,11 @@ static int sun8i_dw_hdmi_bind(struct device *dev, struct device *master,
 		goto err_disable_clk_tmds;
 	}
 
-	ret = sun8i_hdmi_phy_get(hdmi, phy_node);
+	hdmi->phy = sun8i_hdmi_phy_get(phy_node);
 	of_node_put(phy_node);
-	if (ret) {
+	if (IS_ERR(hdmi->phy)) {
 		dev_err(dev, "Couldn't get the HDMI PHY\n");
+		ret = PTR_ERR(hdmi->phy);
 		goto err_disable_clk_tmds;
 	}
 
diff --git a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h
index 21e010deeb48..748b6a4d9cdd 100644
--- a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h
+++ b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h
@@ -200,7 +200,7 @@ encoder_to_sun8i_dw_hdmi(struct drm_encoder *encoder)
 	return container_of(encoder, struct sun8i_dw_hdmi, encoder);
 }
 
-int sun8i_hdmi_phy_get(struct sun8i_dw_hdmi *hdmi, struct device_node *node);
+struct sun8i_hdmi_phy *sun8i_hdmi_phy_get(struct device_node *node);
 
 int sun8i_hdmi_phy_init(struct sun8i_hdmi_phy *phy);
 void sun8i_hdmi_phy_deinit(struct sun8i_hdmi_phy *phy);
diff --git a/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c b/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c
index f917a979e4a4..1c9bdefed35e 100644
--- a/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c
+++ b/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c
@@ -650,25 +650,23 @@ static const struct of_device_id sun8i_hdmi_phy_of_table[] = {
 	{ /* sentinel */ }
 };
 
-int sun8i_hdmi_phy_get(struct sun8i_dw_hdmi *hdmi, struct device_node *node)
+struct sun8i_hdmi_phy *sun8i_hdmi_phy_get(struct device_node *node)
 {
 	struct platform_device *pdev = of_find_device_by_node(node);
 	struct sun8i_hdmi_phy *phy;
 
 	if (!pdev)
-		return -EPROBE_DEFER;
+		return ERR_PTR(-EPROBE_DEFER);
 
 	phy = platform_get_drvdata(pdev);
 	if (!phy) {
 		put_device(&pdev->dev);
-		return -EPROBE_DEFER;
+		return ERR_PTR(-EPROBE_DEFER);
 	}
 
-	hdmi->phy = phy;
-
 	put_device(&pdev->dev);
 
-	return 0;
+	return phy;
 }
 
 static int sun8i_hdmi_phy_probe(struct platform_device *pdev)
-- 
2.42.0

