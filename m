Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7CDA1FCD
	for <linux-sunxi@lists.linux.dev>; Thu, 21 Apr 2022 17:07:47 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id c10so7613917wrb.1
        for <linux-sunxi@lists.linux.dev>; Thu, 21 Apr 2022 10:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qu4miKRfTQ5edYvqjwCdNnoZhdelBzzQxfVquTwJYcU=;
        b=lxA+j4hsGR37CsR5Pcl2akYbQ+9eiuuBp4pFH2LGebfC+LqkKZfG7H6fzk2IvrFcJt
         XsLiYjdR69D9iGA6qPpMFTk86JChOo/AomlJ2VbMPmsm4kOgP3oXEXft47RFsMJQ57AD
         Vxq5gk2rZ+BCIbH7Q7mRAYDHCjfpsiXoGDowdX916/ea67KHw9NM4wkxsAh0+bigZfiB
         BLicaU7MNZmEtp1JQOHY8LTMwHeUEozRWMOg98gmeDh7p47EJ++knKYdojZlFOTASofN
         bcv+MxJLsTyn75mUnleqvvO4gvsuyQ8jk5VbOFAUlkrj0CqoZJT6BH8WnvYBiYa9HRXU
         bo6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qu4miKRfTQ5edYvqjwCdNnoZhdelBzzQxfVquTwJYcU=;
        b=YhMYK2sbb7AsRW+MC3yCPzkC0Tx/gfusgfRnCtdQK7pKHZ19BVn6TCNwOl3Ad02S32
         +IWnfRwviE4LqLYxWVGV+b+lhGQHaAwLSlsu25Kac/Rrj2of9G4WdZc4Ge1Dcm3ombgB
         fwdJpCxfs3wXq4wsT15TInd5dkEr0a5qwTsd/6Bl14Aezo7kcTJYyaiXDZuH+HgK3dAo
         WeDzkWHjILTulCJW4k2GkrqFlAXUU7t8slsSLXp6xSCVo4ivkIg5vk+vl5YJlW6uMqBy
         k0LpFQDZMw7q/ND8JTvXKKGAjVplyn6c8W6sAoiE9Lux1O3MfAqyfUIVXqx+ZfuuLiGO
         4FPQ==
X-Gm-Message-State: AOAM531S8D+W9jINt1ZgW7a4oFi09QIVTc6ItwQWjI395rUYbfc+jWuF
	HDH4YbWc+l7M6BlZzpSrS0M=
X-Google-Smtp-Source: ABdhPJztCBlTtH8qv1VRhJlR2SzX0FcTLm+9xXk+65FTP+M5MyZVogXt4diKZu3QDquG6Bgk4X0BGQ==
X-Received: by 2002:a5d:6d0f:0:b0:20a:897d:ad95 with SMTP id e15-20020a5d6d0f000000b0020a897dad95mr552084wrq.113.1650560866018;
        Thu, 21 Apr 2022 10:07:46 -0700 (PDT)
Received: from localhost.localdomain ([94.73.37.128])
        by smtp.gmail.com with ESMTPSA id i11-20020a5d584b000000b0020a8d859e5fsm2963849wrf.10.2022.04.21.10.07.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Apr 2022 10:07:45 -0700 (PDT)
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
Subject: [PATCH 4/5] drm/sti/sti_hdmi: Replace drm_detect_hdmi_monitor() with is_hdmi
Date: Thu, 21 Apr 2022 19:07:24 +0200
Message-Id: <20220421170725.903361-5-jose.exposito89@gmail.com>
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
instead and also remove sti_hdmi.hdmi_monitor as it is no longer
necessary.

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 drivers/gpu/drm/sti/sti_hdmi.c | 7 ++++---
 drivers/gpu/drm/sti/sti_hdmi.h | 2 --
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/sti/sti_hdmi.c b/drivers/gpu/drm/sti/sti_hdmi.c
index f3ace11209dd..93841ba907a8 100644
--- a/drivers/gpu/drm/sti/sti_hdmi.c
+++ b/drivers/gpu/drm/sti/sti_hdmi.c
@@ -266,6 +266,7 @@ static void hdmi_active_area(struct sti_hdmi *hdmi)
 static void hdmi_config(struct sti_hdmi *hdmi)
 {
 	u32 conf;
+	struct drm_display_info *display = &hdmi->drm_connector->display_info;
 
 	DRM_DEBUG_DRIVER("\n");
 
@@ -274,7 +275,7 @@ static void hdmi_config(struct sti_hdmi *hdmi)
 
 	/* Select encryption type and the framing mode */
 	conf |= HDMI_CFG_ESS_NOT_OESS;
-	if (hdmi->hdmi_monitor)
+	if (display->is_hdmi)
 		conf |= HDMI_CFG_HDMI_NOT_DVI;
 
 	/* Set Hsync polarity */
@@ -984,9 +985,9 @@ static int sti_hdmi_connector_get_modes(struct drm_connector *connector)
 	if (!edid)
 		goto fail;
 
-	hdmi->hdmi_monitor = drm_detect_hdmi_monitor(edid);
 	DRM_DEBUG_KMS("%s : %dx%d cm\n",
-		      (hdmi->hdmi_monitor ? "hdmi monitor" : "dvi monitor"),
+		      (connector->display_info.is_hdmi ? "hdmi monitor" :
+							 "dvi monitor"),
 		      edid->width_cm, edid->height_cm);
 	cec_notifier_set_phys_addr_from_edid(hdmi->notifier, edid);
 
diff --git a/drivers/gpu/drm/sti/sti_hdmi.h b/drivers/gpu/drm/sti/sti_hdmi.h
index 05b2f3d0d48d..6d4c3f57bc46 100644
--- a/drivers/gpu/drm/sti/sti_hdmi.h
+++ b/drivers/gpu/drm/sti/sti_hdmi.h
@@ -57,7 +57,6 @@ struct hdmi_audio_params {
  * @reset: reset control of the hdmi phy
  * @ddc_adapt: i2c ddc adapter
  * @colorspace: current colorspace selected
- * @hdmi_monitor: true if HDMI monitor detected else DVI monitor assumed
  * @audio_pdev: ASoC hdmi-codec platform device
  * @audio: hdmi audio parameters.
  * @drm_connector: hdmi connector
@@ -83,7 +82,6 @@ struct sti_hdmi {
 	struct reset_control *reset;
 	struct i2c_adapter *ddc_adapt;
 	enum hdmi_colorspace colorspace;
-	bool hdmi_monitor;
 	struct platform_device *audio_pdev;
 	struct hdmi_audio_params audio;
 	struct drm_connector *drm_connector;
-- 
2.25.1

