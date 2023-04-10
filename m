Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 914262598
	for <linux-sunxi@lists.linux.dev>; Mon, 10 Apr 2023 08:52:10 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-504718a2265so2283915a12.2
        for <linux-sunxi@lists.linux.dev>; Mon, 10 Apr 2023 01:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1681116729; x=1683708729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qCvx4T7aanPiUqpFl/M0cMKkdvIDQFWcCiUFxZeM/NU=;
        b=Y/dl73ECeQJmxGjfNGFXGoj+tH3jDlPFyNtkQbgPt8AGF/iCm+V3lt8qgzwpYsWWQl
         wBHBNEH6FPMOWum5niMWUFshrjNYbyWkAfFqnqBwNR6SU0IOERdQPagVi6odqzeOjOQU
         whQYjImi9JeZaGl8e3AFT197+L4iOOkPhsyq+7sVrAorYzbmmXXGG9n9MbXBgSHeoYyq
         z82tM8UGSbFqUermTYc8JIH/T1BBIg7mlSpio1NEcsquv6gZzA+L/vHSkKf1IbS//v+h
         DZgXthrfsyELJywaonFiGARS6cuv/z8C3d5DMbN1qUQajV8vb0goOsA9kHN4xSFsDMGC
         SoUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681116729; x=1683708729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qCvx4T7aanPiUqpFl/M0cMKkdvIDQFWcCiUFxZeM/NU=;
        b=Dn8d7wVF9aC0fjwop3J09hnOBJgphpJuExvST+K3yrSJVAkHynY60az5iAZUhAqxl9
         TgCwBGdKhGFNbE2aYH9GypglfJUAjCGfmL0sDj/pLdAGc5udnXzn5nQY+cc49el1x0Jp
         aiCCFqOzzvXabl4ov1cO6Rvgx6biMdODgDqlG/xXFLdkmdCCf6nEJ+P71wAxOAqKhP/f
         jBfo6Kq5f3ASdKe2smH7wfsA6gENOD+v+CbDHGJfqiIVm9QBST9+lRypEdaHlwvnQuPA
         q6Ux03kk60cB3f1dFJpJ+r44WPAfoP2TAiV06xG4yku3XVJgdjJZ0xysy3oIWalDq9G9
         wwRw==
X-Gm-Message-State: AAQBX9df44AKKVUXZj727ziapLOQvqcfFGJ//yrblMc3ssU4kFySwiqg
	WqKRi3udKvNfKTIteCflwN0ahqHGvjYk8YE9
X-Google-Smtp-Source: AKy350b+eqHkqWt2X3cAZ+ksESIZiHh0LCjG8NmoiClTQLYlCGhrNn9z1ont5uVVtrkNnozW62+qaA==
X-Received: by 2002:a05:6402:138e:b0:504:8c4a:d1e with SMTP id b14-20020a056402138e00b005048c4a0d1emr5611231edv.8.1681116728661;
        Mon, 10 Apr 2023 01:52:08 -0700 (PDT)
Received: from localhost.localdomain ([154.72.161.184])
        by smtp.gmail.com with ESMTPSA id v13-20020a50954d000000b004fc649481basm4709962eda.58.2023.04.10.01.51.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Apr 2023 01:52:08 -0700 (PDT)
From: Brandon Cheo Fusi <fusibrandon13@gmail.com>
To: maxime@cerno.tech
Cc: airlied@gmail.com,
	andrzej.hajda@intel.com,
	daniel@ffwll.ch,
	dave.stevenson@raspberrypi.com,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	jagan@amarulasolutions.com,
	jernej.skrabec@gmail.com,
	krzysztof.kozlowski+dt@linaro.org,
	linux-amarula@amarulasolutions.com,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	maarten.lankhorst@linux.intel.com,
	marex@denx.de,
	neil.armstrong@linaro.org,
	rfoss@kernel.org,
	robh+dt@kernel.org,
	sam@ravnborg.org,
	samuel@sholland.org,
	tzimmermann@suse.de,
	wens@csie.org,
	Brandon Cheo Fusi <fusibrandon13@gmail.com>
Subject: [PATCH 2/2] drm: sun4i: tie DSI PHY Poweron/off to crtc enable/disable
Date: Mon, 10 Apr 2023 09:47:50 +0100
Message-Id: <20230410084750.164016-3-fusibrandon13@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230410084750.164016-1-fusibrandon13@gmail.com>
References: <20230410084750.164016-1-fusibrandon13@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Poweron/off the DSI PHY when the crtc is enabled/disabled. This allows the modeset
helpers to manage the DSI sink while preserving the old drm_panel_<prepare,enable>
and drm_panel_<disable,unprepare> sequences.

Signed-off-by: Brandon Cheo Fusi <fusibrandon13@gmail.com>
---
 drivers/gpu/drm/sun4i/sun4i_tcon.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/sun4i_tcon.c
index 523a6d787..6f50dc66a 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
+++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
@@ -190,7 +190,7 @@ void sun4i_tcon_set_status(struct sun4i_tcon *tcon,
 			   const struct drm_encoder *encoder,
 			   bool enabled)
 {
-	bool is_lvds = false;
+	bool is_lvds = false, is_dsi = false;
 	int channel;
 
 	switch (encoder->encoder_type) {
@@ -198,6 +198,8 @@ void sun4i_tcon_set_status(struct sun4i_tcon *tcon,
 		is_lvds = true;
 		fallthrough;
 	case DRM_MODE_ENCODER_DSI:
+		is_dsi = true;
+		fallthrough;
 	case DRM_MODE_ENCODER_NONE:
 		channel = 0;
 		break;
@@ -221,6 +223,12 @@ void sun4i_tcon_set_status(struct sun4i_tcon *tcon,
 		sun4i_tcon_lvds_set_status(tcon, encoder, true);
 
 	sun4i_tcon_channel_set_status(tcon, channel, enabled);
+
+	if (is_dsi) {
+		/* turn DSI phy on or off */
+		(enabled) ? sun6i_dsi_phy_power_on(encoder)
+				  : sun6i_dsi_phy_power_off(encoder);
+	}
 }
 
 void sun4i_tcon_enable_vblank(struct sun4i_tcon *tcon, bool enable)
-- 
2.30.2

