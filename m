Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BBF4D29E
	for <linux-sunxi@lists.linux.dev>; Sun, 24 Sep 2023 19:26:16 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-9adb9fa7200so1197796566b.0
        for <linux-sunxi@lists.linux.dev>; Sun, 24 Sep 2023 12:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695583575; x=1696188375; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7GGwz4wHTU6Hq3RRU7lNI3Q1wc2dl9iWY5fWoPCz14w=;
        b=bF9hsANxYhm84DtnF+AxK5G4QKB5T/QdxAoCnCI5BfoUfpG7tt62viUfkh4ayzKBBn
         T7c04xIVsy7k3YWUEMeg7tjaX6QF3aJ3zt8Ltdy5xWhc0YQMddlL7Ry9kfyJQYRVLmkO
         QOZ0STMgWa6NSBHOtVPrYTNq820pyNRm4L09ckrdBnaF7CF+U+qMMIDDq2MxKqeDnh4X
         Dv9dkSXtT5rQhUcABW1YN5M7+kQlfrvg2u/gyGZtCDRRGScsm4+Lmm6AiBu89m0+QYhy
         dP8RGoa0gVPW3ZM+bylqR3snoujQk43sHh3I2AjX5783RCgjxTJWDWvPpZETJjkuGuTr
         6tag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695583575; x=1696188375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7GGwz4wHTU6Hq3RRU7lNI3Q1wc2dl9iWY5fWoPCz14w=;
        b=FflLj93/E6oD41G9btBJWzXdkct6fzNGwFnYQz3OzG9pl2F9U4BjENVrtpRVg6Tqbw
         gsf171cid/pSTnnPsCTCrvpS0XU5wBVOmjetSPQ+Y1LPMRFTjMUkYU3hVr3wJpIhXMza
         l3ZUNZwTIiAfcvv0JAVKQcFY2+vkGGuwEDN+7nBjffCV0B6JxytPbms/iXXVKr9qrWSb
         dMLy1bdI+RV6DrsRPyQnUiXfFrP5aEWOx3fJGBHE1RHrDByhx5xDlwJ/qkcBOyXSWHmO
         OFFPvEcEJPvfLYquQC+4OhzptXh2g7QJ3nB6kuqygc+Oa3RGaqi3bSxzbXyclmhAYpYd
         iOCg==
X-Gm-Message-State: AOJu0YzNlFNIT0/AX9vIGGvvq90GLsuJ8xSWOYTu9+raq6eE2TUv5AQL
	ZqqkwL9chD5fX2zHZOUoTWY=
X-Google-Smtp-Source: AGHT+IGrm0GcL+bThs+FW6loLKtnsAa0IIh3+UexCsckNUEBFlIPvms+brojuoJoSOy/PrKpwCa8JQ==
X-Received: by 2002:a17:907:ea5:b0:9a1:e0b1:e919 with SMTP id ho37-20020a1709070ea500b009a1e0b1e919mr13414633ejc.4.1695583574659;
        Sun, 24 Sep 2023 12:26:14 -0700 (PDT)
Received: from localhost.localdomain (82-149-12-148.dynamic.telemach.net. [82.149.12.148])
        by smtp.gmail.com with ESMTPSA id z21-20020a1709063a1500b0099d0c0bb92bsm5317632eje.80.2023.09.24.12.26.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Sep 2023 12:26:14 -0700 (PDT)
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
Subject: [PATCH 2/7] drm/sun4i: dw-hdmi: Remove double encoder cleanup
Date: Sun, 24 Sep 2023 21:25:59 +0200
Message-ID: <20230924192604.3262187-3-jernej.skrabec@gmail.com>
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

It turns out that comment is wrong - dw hdmi driver never does any
encoder cleanup. In fact, cleanup is done automatically, in destroy
callback of encoder. Even more, encoder memory will be freed when hdmi
device is destroyed. However, encoder will be cleaned up after that, in
drm_mode_config_cleanup(), which is called later. This will cause use
after free bug.

Remove redundant encoder cleanup, switch memory allocation to live as
long as drm object and while at it, check return code of encoder
initialization.

Fixes: b7c7436a5ff0 ("drm/sun4i: Implement A83T HDMI driver")
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
index 0b647b030b15..8f8d3bdba5ce 100644
--- a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
+++ b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
@@ -8,6 +8,7 @@
 #include <linux/of.h>
 #include <linux/platform_device.h>
 
+#include <drm/drm_managed.h>
 #include <drm/drm_modeset_helper_vtables.h>
 #include <drm/drm_of.h>
 #include <drm/drm_simple_kms_helper.h>
@@ -107,7 +108,7 @@ static int sun8i_dw_hdmi_bind(struct device *dev, struct device *master,
 	if (!pdev->dev.of_node)
 		return -ENODEV;
 
-	hdmi = devm_kzalloc(&pdev->dev, sizeof(*hdmi), GFP_KERNEL);
+	hdmi = drmm_kzalloc(drm, sizeof(*hdmi), GFP_KERNEL);
 	if (!hdmi)
 		return -ENOMEM;
 
@@ -180,7 +181,9 @@ static int sun8i_dw_hdmi_bind(struct device *dev, struct device *master,
 		goto err_disable_clk_tmds;
 
 	drm_encoder_helper_add(encoder, &sun8i_dw_hdmi_encoder_helper_funcs);
-	drm_simple_encoder_init(drm, encoder, DRM_MODE_ENCODER_TMDS);
+	ret = drm_simple_encoder_init(drm, encoder, DRM_MODE_ENCODER_TMDS);
+	if (ret)
+		goto err_deinit_phy;
 
 	plat_data->mode_valid = hdmi->quirks->mode_valid;
 	plat_data->use_drm_infoframe = hdmi->quirks->use_drm_infoframe;
@@ -189,20 +192,14 @@ static int sun8i_dw_hdmi_bind(struct device *dev, struct device *master,
 	platform_set_drvdata(pdev, hdmi);
 
 	hdmi->hdmi = dw_hdmi_bind(pdev, encoder, plat_data);
-
-	/*
-	 * If dw_hdmi_bind() fails we'll never call dw_hdmi_unbind(),
-	 * which would have called the encoder cleanup.  Do it manually.
-	 */
 	if (IS_ERR(hdmi->hdmi)) {
 		ret = PTR_ERR(hdmi->hdmi);
-		goto cleanup_encoder;
+		goto err_deinit_phy;
 	}
 
 	return 0;
 
-cleanup_encoder:
-	drm_encoder_cleanup(encoder);
+err_deinit_phy:
 	sun8i_hdmi_phy_deinit(hdmi->phy);
 err_disable_clk_tmds:
 	clk_disable_unprepare(hdmi->clk_tmds);
-- 
2.42.0

