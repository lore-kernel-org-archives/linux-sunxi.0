Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E2EF1FCD
	for <linux-sunxi@lists.linux.dev>; Thu, 21 Apr 2022 17:07:50 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id p18so7594111wru.5
        for <linux-sunxi@lists.linux.dev>; Thu, 21 Apr 2022 10:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1DHr0UfeFKvgTc9CqETxWAhcnj8bwvB27mi7L/RJMLI=;
        b=P3YAtF35V53kyVqjeoLe6NLR6GC/doMtIALc3tdmXTpE4LrW2S2r1iOO54iREtCJxH
         dOTTK9hlGJ+9eEh532NzO318GRvv72+BePjdQztXTWKNZ5KBRVg3kEehRTC2u6l9OuDA
         WyN/gR2kdohSojmSfR71eW5heZTUm1swjm1FhpBiAt5P1j8iGudP1VksYTrWIyc/TPJZ
         zO6eIlGiJrE5j/OszmcVXjcgemR/u2dxwYFQlRq1UkFGUtPu5oKguyC0r+8QcnOAuC87
         BsRWuNatkxU/1mf9mOfrzEK7X+Wmg1Auq3cC4wSMaYC6wrC8x5aajWQ4/9ElGwsP/Rat
         1Puw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1DHr0UfeFKvgTc9CqETxWAhcnj8bwvB27mi7L/RJMLI=;
        b=at24N8Ja/KJCChNh4+Sn9bApyYtL9OG09WnZDPVCJEx7Q54hrLptx03Pm3A5R/v2oU
         03Q/V2dTP0KqLP3oTITEpgq0Mg54N6Q0LQ3ZV16bRnXJXcix6VgZF8VDmeJX+GrvUSlH
         hf33kWj3MzUhx24yKs8wQXuKgnobMdecI8nJKDOIRl+TPfiUPg3hKpam0VyWPR/O5n3R
         MudAfBgB+aGBgJWFQ/4teP4AIXwh6CMsYGzO/PhSI6HnoUyr3ZWThVDEyZsh+iwHea2R
         iC2qeMtmC0C7uxyBDIg+BodY7BC2wFkLvAMIkmpjXwhEtLmvXC5doYvxMHuS5MQBaanK
         bwug==
X-Gm-Message-State: AOAM531M6JQB7H5rsAo7pnWVRgxPxctwaV/U/HoLUr2kjn2KrglK06VQ
	wklI9w6HvLB1NTxwieJtTRrzGU0z/02ZXQ==
X-Google-Smtp-Source: ABdhPJyF9I+tOdug2GInrB3O1KIZXBnyfjirt1kYYZ6Dne73ApfJWTQEjsu+D+I0t5Nf5JVuBfCwqA==
X-Received: by 2002:adf:e908:0:b0:207:a28e:b904 with SMTP id f8-20020adfe908000000b00207a28eb904mr562456wrm.542.1650560868785;
        Thu, 21 Apr 2022 10:07:48 -0700 (PDT)
Received: from localhost.localdomain ([94.73.37.128])
        by smtp.gmail.com with ESMTPSA id i11-20020a5d584b000000b0020a8d859e5fsm2963849wrf.10.2022.04.21.10.07.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Apr 2022 10:07:48 -0700 (PDT)
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
Subject: [PATCH 5/5] drm/sun4i: hdmi: Replace drm_detect_hdmi_monitor() with is_hdmi
Date: Thu, 21 Apr 2022 19:07:25 +0200
Message-Id: <20220421170725.903361-6-jose.exposito89@gmail.com>
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
instead and also remove sun4i_hdmi.hdmi_monitor as it is no longer
necessary.

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 drivers/gpu/drm/sun4i/sun4i_hdmi.h     | 1 -
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c | 6 +++---
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi.h b/drivers/gpu/drm/sun4i/sun4i_hdmi.h
index 00ca35f07ba5..65c801cd6f35 100644
--- a/drivers/gpu/drm/sun4i/sun4i_hdmi.h
+++ b/drivers/gpu/drm/sun4i/sun4i_hdmi.h
@@ -285,7 +285,6 @@ struct sun4i_hdmi {
 
 	struct sun4i_drv	*drv;
 
-	bool			hdmi_monitor;
 	struct cec_adapter	*cec_adap;
 
 	const struct sun4i_hdmi_variant	*variant;
diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
index 3799a745b7dd..d8b71710e8f6 100644
--- a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
+++ b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
@@ -99,6 +99,7 @@ static void sun4i_hdmi_enable(struct drm_encoder *encoder)
 {
 	struct drm_display_mode *mode = &encoder->crtc->state->adjusted_mode;
 	struct sun4i_hdmi *hdmi = drm_encoder_to_sun4i_hdmi(encoder);
+	struct drm_display_info *display = &hdmi->connector.display_info;
 	u32 val = 0;
 
 	DRM_DEBUG_DRIVER("Enabling the HDMI Output\n");
@@ -111,7 +112,7 @@ static void sun4i_hdmi_enable(struct drm_encoder *encoder)
 	writel(val, hdmi->base + SUN4I_HDMI_PKT_CTRL_REG(0));
 
 	val = SUN4I_HDMI_VID_CTRL_ENABLE;
-	if (hdmi->hdmi_monitor)
+	if (display->is_hdmi)
 		val |= SUN4I_HDMI_VID_CTRL_HDMI_MODE;
 
 	writel(val, hdmi->base + SUN4I_HDMI_VID_CTRL_REG);
@@ -215,9 +216,8 @@ static int sun4i_hdmi_get_modes(struct drm_connector *connector)
 	if (!edid)
 		return 0;
 
-	hdmi->hdmi_monitor = drm_detect_hdmi_monitor(edid);
 	DRM_DEBUG_DRIVER("Monitor is %s monitor\n",
-			 hdmi->hdmi_monitor ? "an HDMI" : "a DVI");
+			 connector->display_info.is_hdmi ? "an HDMI" : "a DVI");
 
 	drm_connector_update_edid_property(connector, edid);
 	cec_s_phys_addr_from_edid(hdmi->cec_adap, edid);
-- 
2.25.1

