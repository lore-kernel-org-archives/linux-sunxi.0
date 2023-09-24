Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFCD6DDDC
	for <linux-sunxi@lists.linux.dev>; Sun, 24 Sep 2023 19:26:21 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2c108e106f0so83254991fa.1
        for <linux-sunxi@lists.linux.dev>; Sun, 24 Sep 2023 12:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695583580; x=1696188380; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8y8h3EEz9VirQFhjmojPuvqBkQuqu/oUUWDuJnG4W+c=;
        b=AafzEG31gTAeWnyJZ5jC/rY9lZG/ySs9J+4wG44ep8ZRnQ+HWh+j5XO8X+rCf3Xc75
         wOOXdM/MiMVtyYXsSW+Guy+PwxGvTkANviVCNy/Ff4MdAiVKLqyCsSfjHVBdD3iOG3Qa
         jMOi03pxI/51vHIDc4N6IiLkAjhGJl8/gc4MWDH9rwddd7Ynb3HTJUh23JuyhbP0ln+8
         X4jdrcsW7iJfcGcW5qIMD9vOGOmG+IbbqDcCQpgxDjn6DUIxlP024nfHeh5hp8adyBEw
         WBsGKf9w7dRDy8zObjpmOnRaIDr98l1JpEGvOsEQlHkEivhWEna0WU0h7f9oIYJ189Pg
         drtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695583580; x=1696188380;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8y8h3EEz9VirQFhjmojPuvqBkQuqu/oUUWDuJnG4W+c=;
        b=gDDNT3S9ccaceqNhekbSbbcSSa6WcDn5P2S1o83+M3D9GzjSWmZCsAKdCQsZ7plfbB
         UH4b00otHZ3FrPv8SovcumFxnrBmYRAjdAOL1XA8fSUnrn6nD+qDP5tPukc/fuAWIqBE
         kO3jnStaz0L0Z33zJMC1GwMYsqAEufos6fIAtkSPPDDntATcXytB9S/rLlW2y4D5cHbD
         2x8Emo8oinpnhaKdL2vRxJVqj/wIstI29yYTq+HmTAGWR/oQ9UNUcofu/bHKSHleqr37
         yGfnKuBWZ8i7diKs8yRkJEzhu8rEOuY0xLUJv3fYnxCFPtMgDtHX7cVwdJUTVl1dTH9B
         FFeQ==
X-Gm-Message-State: AOJu0YzNwdieaCnXDcakU0/ocPFybMTCgj+IK2fXfdmn8tUzwBCf1aC0
	biBDeL2UM5ru8qTdg/LKVYU=
X-Google-Smtp-Source: AGHT+IGnY2zymlYXEbyV+5gsOUvzTU+WsC5ThrC5P4hO3P9yxgQq4BLXWnYLwnhf4fRNeIa24G6f0Q==
X-Received: by 2002:a2e:2417:0:b0:2c0:2ab7:9ab5 with SMTP id k23-20020a2e2417000000b002c02ab79ab5mr4174912ljk.12.1695583579523;
        Sun, 24 Sep 2023 12:26:19 -0700 (PDT)
Received: from localhost.localdomain (82-149-12-148.dynamic.telemach.net. [82.149.12.148])
        by smtp.gmail.com with ESMTPSA id z21-20020a1709063a1500b0099d0c0bb92bsm5317632eje.80.2023.09.24.12.26.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Sep 2023 12:26:19 -0700 (PDT)
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
Subject: [PATCH 7/7] drm/sun4i: dw-hdmi: check for phy device first
Date: Sun, 24 Sep 2023 21:26:04 +0200
Message-ID: <20230924192604.3262187-8-jernej.skrabec@gmail.com>
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

Let's check for phy device first. Since it uses much of the same clocks
and resets it also lowers amount of possible deferred probes.

While at it, don't report error for deferred phy probe.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c | 35 +++++++++++++--------------
 1 file changed, 17 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
index 41f815a1faec..c1becd964326 100644
--- a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
+++ b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
@@ -173,11 +173,24 @@ static int sun8i_dw_hdmi_bind(struct device *dev, struct device *master,
 	struct device_node *phy_node;
 	struct drm_encoder *encoder;
 	struct sun8i_dw_hdmi *hdmi;
+	struct sun8i_hdmi_phy *phy;
 	int ret;
 
 	if (!pdev->dev.of_node)
 		return -ENODEV;
 
+	phy_node = of_parse_phandle(dev->of_node, "phys", 0);
+	if (!phy_node) {
+		dev_err(dev, "Can't find PHY phandle\n");
+		return -EINVAL;
+	}
+
+	phy = sun8i_hdmi_phy_get(phy_node);
+	of_node_put(phy_node);
+	if (IS_ERR(phy))
+		return dev_err_probe(dev, PTR_ERR(phy),
+				     "Couldn't get the HDMI PHY\n");
+
 	hdmi = drmm_kzalloc(drm, sizeof(*hdmi), GFP_KERNEL);
 	if (!hdmi)
 		return -ENOMEM;
@@ -185,6 +198,7 @@ static int sun8i_dw_hdmi_bind(struct device *dev, struct device *master,
 	plat_data = &hdmi->plat_data;
 	hdmi->dev = &pdev->dev;
 	encoder = &hdmi->encoder;
+	hdmi->phy = phy;
 
 	hdmi->quirks = of_device_get_match_data(dev);
 
@@ -232,22 +246,7 @@ static int sun8i_dw_hdmi_bind(struct device *dev, struct device *master,
 		goto err_assert_ctrl_reset;
 	}
 
-	phy_node = of_parse_phandle(dev->of_node, "phys", 0);
-	if (!phy_node) {
-		dev_err(dev, "Can't found PHY phandle\n");
-		ret = -EINVAL;
-		goto err_disable_clk_tmds;
-	}
-
-	hdmi->phy = sun8i_hdmi_phy_get(phy_node);
-	of_node_put(phy_node);
-	if (IS_ERR(hdmi->phy)) {
-		dev_err(dev, "Couldn't get the HDMI PHY\n");
-		ret = PTR_ERR(hdmi->phy);
-		goto err_disable_clk_tmds;
-	}
-
-	ret = sun8i_hdmi_phy_init(hdmi->phy);
+	ret = sun8i_hdmi_phy_init(phy);
 	if (ret)
 		goto err_disable_clk_tmds;
 
@@ -259,7 +258,7 @@ static int sun8i_dw_hdmi_bind(struct device *dev, struct device *master,
 	plat_data->mode_valid = hdmi->quirks->mode_valid;
 	plat_data->use_drm_infoframe = hdmi->quirks->use_drm_infoframe;
 	plat_data->output_port = 1;
-	sun8i_hdmi_phy_set_ops(hdmi->phy, plat_data);
+	sun8i_hdmi_phy_set_ops(phy, plat_data);
 
 	platform_set_drvdata(pdev, hdmi);
 
@@ -310,7 +309,7 @@ static int sun8i_dw_hdmi_bind(struct device *dev, struct device *master,
 	drm_bridge_remove(&hdmi->enc_bridge);
 	dw_hdmi_remove(hdmi->hdmi);
 err_deinit_phy:
-	sun8i_hdmi_phy_deinit(hdmi->phy);
+	sun8i_hdmi_phy_deinit(phy);
 err_disable_clk_tmds:
 	clk_disable_unprepare(hdmi->clk_tmds);
 err_assert_ctrl_reset:
-- 
2.42.0

