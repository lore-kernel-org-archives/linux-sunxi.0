Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DE1F1FCD
	for <linux-sunxi@lists.linux.dev>; Thu, 21 Apr 2022 17:07:46 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id h25so1554292wrc.13
        for <linux-sunxi@lists.linux.dev>; Thu, 21 Apr 2022 10:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dLb9n6Vqs4Ih6Tde/WV0zahdLSPBAQf9NPHM6Jy9hzo=;
        b=LAevyX/ERqtxF65hYRvst71jOVYt9rxNi2LfjZ3L4IvPvF3WP6C6foYJwdUqmgc9Uz
         3DIsXUyUOQFeHRz3NsIo4oChjNW1OCy6txnH8L4BbdXswQosN4TMfCACw1LMm3EUoGcW
         w/YN9U3gZRYMLrDoUzse9t2+NaarYg2H3R4Qb5AEHrQDoBbfX/Umx/8r2KqHv4WnSlDg
         xGZ0YsuUYnS5tu4PO/M9Ff3iq+eFrJ/BfqjRx59gzmbdDqIj8mpYMkD+euQeJa7DJuOO
         RGO2VuwabF3TTZDyScm1NSbxJEaTFG8bAbkFTFv3WpVPXJFWGINMOtgCQ5/U2SuQXeLp
         4d4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dLb9n6Vqs4Ih6Tde/WV0zahdLSPBAQf9NPHM6Jy9hzo=;
        b=pH1Z5rs9rAR6KPyEbgpmqMwS+P8HOF58gVl5oxJuKo6VOREItY2QMyyMX6T/bw5fa6
         zwqhL0z+r4qUuiqSPUSFzVOo7HCC7y7KKXw4ibjYXSfUpPQsbA6JEqipYyWZd0RNjDKY
         mYCb0QJSvd//2aj43GZvqqfYZBf49QKZDwP415FRVtcvD5TJ5kqQOnA9y0gRaSckc8qY
         Eft/gptrC0nAsOo42ynpuG9xZIk3ZuxYr3+gyl5uouuo3JBML63SFmGl84MIOT7Fch/O
         Wz4sf/IEcAJI8XwW/hqklUGCZiWODQBQJKzquNi0y5q4cL3024DCF/m3ikH8J5deWMXj
         sN9Q==
X-Gm-Message-State: AOAM532rBXCiCNIxYPnWb1YaCq0oCsOiJZSmFvUqHmVmUCMuhO6RLO7T
	OOizahzQppOeA427JWqpfn8=
X-Google-Smtp-Source: ABdhPJx/kFGrmr6cOw1E9qfYzW98wPDX3Gw0oBcObPlkQWqdzFcmeXcXxIP+Db0E7MqTjK84xMOdHQ==
X-Received: by 2002:a5d:6488:0:b0:203:b628:70d2 with SMTP id o8-20020a5d6488000000b00203b62870d2mr522020wri.83.1650560864504;
        Thu, 21 Apr 2022 10:07:44 -0700 (PDT)
Received: from localhost.localdomain ([94.73.37.128])
        by smtp.gmail.com with ESMTPSA id i11-20020a5d584b000000b0020a8d859e5fsm2963849wrf.10.2022.04.21.10.07.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Apr 2022 10:07:44 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: inki.dae@samsung.com
Cc: jy0922.shim@samsung.com,
	sw0312.kim@samsung.com,
	kyungmin.park@samsung.com,
	airlied@linux.ie,
	daniel@ffwll.ch,
	krzk@kernel.org,
	alim.akhtar@samsung.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	hjc@rock-chips.com,
	heiko@sntech.de,
	linux-rockchip@lists.infradead.org,
	alain.volmat@foss.st.com,
	p.zabel@pengutronix.de,
	mripard@kernel.org,
	wens@csie.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	linux-sunxi@lists.linux.dev,
	laurent.pinchart@ideasonboard.com,
	=?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH 3/5] drm/rockchip: rk3066_hdmi: Replace drm_detect_hdmi_monitor() with is_hdmi
Date: Thu, 21 Apr 2022 19:07:23 +0200
Message-Id: <20220421170725.903361-4-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220421170725.903361-1-jose.exposito89@gmail.com>
References: <20220421170725.903361-1-jose.exposito89@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Once EDID is parsed, the monitor HDMI support information is available
through drm_display_info.is_hdmi.

This driver calls drm_detect_hdmi_monitor() to receive the same
information and stores its own cached value, which is less efficient.

Avoid calling drm_detect_hdmi_monitor() and use drm_display_info.is_hdmi
instead and also remove hdmi_data_info.sink_is_hdmi as it is no longer
necessary.

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 drivers/gpu/drm/rockchip/rk3066_hdmi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rk3066_hdmi.c b/drivers/gpu/drm/rockchip/rk3066_hdmi.c
index 1c546c3a8998..a09dbb7d446a 100644
--- a/drivers/gpu/drm/rockchip/rk3066_hdmi.c
+++ b/drivers/gpu/drm/rockchip/rk3066_hdmi.c
@@ -22,7 +22,6 @@
 
 struct hdmi_data_info {
 	int vic; /* The CEA Video ID (VIC) of the current drm display mode. */
-	bool sink_is_hdmi;
 	unsigned int enc_out_format;
 	unsigned int colorimetry;
 };
@@ -317,6 +316,8 @@ static void rk3066_hdmi_config_phy(struct rk3066_hdmi *hdmi)
 static int rk3066_hdmi_setup(struct rk3066_hdmi *hdmi,
 			     struct drm_display_mode *mode)
 {
+	struct drm_display_info *display = &hdmi->connector.display_info;
+
 	hdmi->hdmi_data.vic = drm_match_cea_mode(mode);
 	hdmi->hdmi_data.enc_out_format = HDMI_COLORSPACE_RGB;
 
@@ -349,7 +350,7 @@ static int rk3066_hdmi_setup(struct rk3066_hdmi *hdmi,
 
 	rk3066_hdmi_config_video_timing(hdmi, mode);
 
-	if (hdmi->hdmi_data.sink_is_hdmi) {
+	if (display->is_hdmi) {
 		hdmi_modb(hdmi, HDMI_HDCP_CTRL, HDMI_VIDEO_MODE_MASK,
 			  HDMI_VIDEO_MODE_HDMI);
 		rk3066_hdmi_config_avi(hdmi, mode);
@@ -472,7 +473,6 @@ static int rk3066_hdmi_connector_get_modes(struct drm_connector *connector)
 
 	edid = drm_get_edid(connector, hdmi->ddc);
 	if (edid) {
-		hdmi->hdmi_data.sink_is_hdmi = drm_detect_hdmi_monitor(edid);
 		drm_connector_update_edid_property(connector, edid);
 		ret = drm_add_edid_modes(connector, edid);
 		kfree(edid);
-- 
2.25.1

