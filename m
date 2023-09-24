Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FDBDDF41
	for <linux-sunxi@lists.linux.dev>; Sun, 24 Sep 2023 19:26:19 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-9ad8bf9bfabso636086166b.3
        for <linux-sunxi@lists.linux.dev>; Sun, 24 Sep 2023 12:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695583577; x=1696188377; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MFf1cGltxf8drTRitrLUgd7Y0FznH+yCbskJSQDkt2Q=;
        b=W1eDrXre905gBt4YVhYP2veL87m+3rU+JbbhSN1VloChT5y9vUsYR6cyE558QbyTRh
         FWnTL/hUObtmKCHmOLmFaCaYNbALT/4+cyXZLzbaPNfMfX6zHe/+p1pEk2nTzTVS78ri
         pmDdi5nPEqhbnspu3M4CBh0NSpJbHAzC2CIUEac+wRZ0faWSAnmMVhpA7DsYjc3UfS/B
         TdxRs8z/WEiY5h89DvgyngAUi+x0GQDsFf+1KpEd/x6RYCrnpiJ7F2w07qbwIikTrgPn
         BzUXjrjzyGUkbefFv+/xCXFh07AmmzIpH7yNqWbfpAt9dA6qj0H1KY3Y2O53DCIN3n3s
         jlrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695583577; x=1696188377;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MFf1cGltxf8drTRitrLUgd7Y0FznH+yCbskJSQDkt2Q=;
        b=XSKqaO+Q/JOcARQmeGo8CydWQanQ0VzVxtHAgTU+dKd6F6VhSej2kmAohXsj+ndNGH
         nXgZ6IWfSQJwbz3Auyz1+Ffa4CWaFhKK3hoanosCX1NMFjXJ5H8L5arMAFlT6+c/Odfi
         B9lgDcCRDhBbzTxRORD5YvAjSBLuOOCFpszmthbx15ElfTpb52kWvdErrzxFQy5kq6jm
         I+ixZVHW1369ZZKCRj6m0K55YJLssXGFva+XRbOeW3IOcRhO4XMsPvJwxRWD/nyxa7bI
         yjqsYFhdtTBeyZGV1d9KPLBoE/KpkaOan3SIeCBQ7C1jQYjeBhxvM7PgND2PWLVWWtxo
         CCcA==
X-Gm-Message-State: AOJu0YwhykmaWtBeRZ92DPo6DbcXT3nUGJ+kmdA7DwsJlgZ9eeSa/bg6
	/OFNRZ6WqmKYiGLhh+Z+tBw=
X-Google-Smtp-Source: AGHT+IGAhle5kDIIp4WuTj01RyhcLxUc0q31fsjC0IfkTvI/FNrLn/S5IoePIuTCGmzEdhew1ZtvcA==
X-Received: by 2002:a17:906:210a:b0:9a3:c4f4:12de with SMTP id 10-20020a170906210a00b009a3c4f412demr4134394ejt.37.1695583577533;
        Sun, 24 Sep 2023 12:26:17 -0700 (PDT)
Received: from localhost.localdomain (82-149-12-148.dynamic.telemach.net. [82.149.12.148])
        by smtp.gmail.com with ESMTPSA id z21-20020a1709063a1500b0099d0c0bb92bsm5317632eje.80.2023.09.24.12.26.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Sep 2023 12:26:17 -0700 (PDT)
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
Subject: [PATCH 5/7] drm/sun4i: dw-hdmi: Split driver registration
Date: Sun, 24 Sep 2023 21:26:02 +0200
Message-ID: <20230924192604.3262187-6-jernej.skrabec@gmail.com>
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

There is no reason to register two drivers in same place. Using macro
lowers amount of boilerplate code.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c  | 27 +-------------------------
 drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h  |  2 --
 drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c |  3 ++-
 3 files changed, 3 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
index 93831cdf1917..d93e8ff71aae 100644
--- a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
+++ b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
@@ -378,32 +378,7 @@ static struct platform_driver sun8i_dw_hdmi_pltfm_driver = {
 		.of_match_table = sun8i_dw_hdmi_dt_ids,
 	},
 };
-
-static int __init sun8i_dw_hdmi_init(void)
-{
-	int ret;
-
-	ret = platform_driver_register(&sun8i_dw_hdmi_pltfm_driver);
-	if (ret)
-		return ret;
-
-	ret = platform_driver_register(&sun8i_hdmi_phy_driver);
-	if (ret) {
-		platform_driver_unregister(&sun8i_dw_hdmi_pltfm_driver);
-		return ret;
-	}
-
-	return ret;
-}
-
-static void __exit sun8i_dw_hdmi_exit(void)
-{
-	platform_driver_unregister(&sun8i_dw_hdmi_pltfm_driver);
-	platform_driver_unregister(&sun8i_hdmi_phy_driver);
-}
-
-module_init(sun8i_dw_hdmi_init);
-module_exit(sun8i_dw_hdmi_exit);
+module_platform_driver(sun8i_dw_hdmi_pltfm_driver);
 
 MODULE_AUTHOR("Jernej Skrabec <jernej.skrabec@siol.net>");
 MODULE_DESCRIPTION("Allwinner DW HDMI bridge");
diff --git a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h
index 18ffc1b4841f..21e010deeb48 100644
--- a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h
+++ b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h
@@ -194,8 +194,6 @@ struct sun8i_dw_hdmi {
 	struct reset_control		*rst_ctrl;
 };
 
-extern struct platform_driver sun8i_hdmi_phy_driver;
-
 static inline struct sun8i_dw_hdmi *
 encoder_to_sun8i_dw_hdmi(struct drm_encoder *encoder)
 {
diff --git a/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c b/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c
index 489ea94693ff..f917a979e4a4 100644
--- a/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c
+++ b/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c
@@ -729,10 +729,11 @@ static int sun8i_hdmi_phy_probe(struct platform_device *pdev)
 	return 0;
 }
 
-struct platform_driver sun8i_hdmi_phy_driver = {
+static struct platform_driver sun8i_hdmi_phy_driver = {
 	.probe  = sun8i_hdmi_phy_probe,
 	.driver = {
 		.name = "sun8i-hdmi-phy",
 		.of_match_table = sun8i_hdmi_phy_of_table,
 	},
 };
+module_platform_driver(sun8i_hdmi_phy_driver);
-- 
2.42.0

