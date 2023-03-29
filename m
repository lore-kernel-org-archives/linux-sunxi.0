Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA0AC1C2B
	for <linux-sunxi@lists.linux.dev>; Wed, 29 Mar 2023 13:18:19 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id le6so14853632plb.12
        for <linux-sunxi@lists.linux.dev>; Wed, 29 Mar 2023 06:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1680095899;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f+Jq4CQBAwZOjvBLdvikVzLpWjI0SGbxRpeBtUQtDcQ=;
        b=Ou/OtLmpNc78F/fwnqk1lzBgwyfUoX8VK7o4RpfnSYek0c6mzr55RafkbJPWpVDXEi
         eUvONb1/8WR9m/S+MqqA3BfxCALKIkNuYaZPDo/X4FFKOP2gHBDL14hZsB51ThK0gMCo
         E1irsVQt1JZisYTFF7Lfw1qND+3EgJ+bff+GA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680095899;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f+Jq4CQBAwZOjvBLdvikVzLpWjI0SGbxRpeBtUQtDcQ=;
        b=ovgSZH0iOAlD84h7tzDiLzFCx25dAt3XWHDMnJlS+voMtUWa1crIha+tVEq+jFcN+c
         CY8h4P0RpzSRTqGIL4RxMDMv9Sy+Dra8GJQK7S8f6QIfhf3868bQbYrzvCmMybKV+54Y
         qubdnlUVI5QqB9cOIoDZcJpWMMgVY0uVn/C0hb1uqZWL0jmSiJWat0LOnq/vhhQa9L+Y
         3JXfWU3hv7jaER6TebuSaghSODcdpW+7L+KAQFPgn1XuI23xgkjvkftbDPD2tXKnHxx9
         +GDIr+2v4ZreIc8MjWqMuUl9J6P4cOHVP6kSRelj9zqKT8/GvImzEbukYnVtiDyATUVF
         CaEA==
X-Gm-Message-State: AAQBX9eOAAiGGFTSxdc3/myfalUQ/G8RioO9hJCyAX+z4hQhe7wZZk6B
	oz9WMs65C3NRHybNALt37kXCow==
X-Google-Smtp-Source: AKy350YCiiWm/rDw6yILBFYbQ4o+gaIGsdINxQHWQbNw3orvvBWljZZZiHyHon7RGJ7hUl10VDOAFQ==
X-Received: by 2002:a17:90b:1e4f:b0:23b:4438:e9ee with SMTP id pi15-20020a17090b1e4f00b0023b4438e9eemr2098113pjb.12.1680095899302;
        Wed, 29 Mar 2023 06:18:19 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00a:a047:206d:4722:c4fa:e845])
        by smtp.gmail.com with ESMTPSA id s16-20020a17090b071000b0023f5c867f82sm1400192pjz.41.2023.03.29.06.18.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Mar 2023 06:18:18 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Maxime Ripard <mripard@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Sam Ravnborg <sam@ravnborg.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	Marek Vasut <marex@denx.de>,
	linux-amarula <linux-amarula@amarulasolutions.com>,
	Jagan Teki <jagan@amarulasolutions.com>,
	Ondrej Jirman <megous@megous.com>
Subject: [PATCH v7 05/12] drm: panel: sitronix-st7703: Enable prepare_prev_first for xbd599
Date: Wed, 29 Mar 2023 18:46:11 +0530
Message-Id: <20230329131615.1328366-6-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230329131615.1328366-1-jagan@amarulasolutions.com>
References: <20230329131615.1328366-1-jagan@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Enable the drm panel prepare_prev_first flag for xbd599 panel so-that
the previous controller should be prepared first before the prepare for
the panel is called.
               
This makes sure that the previous controller(sun6i-mipi-dsi), likely to
be a DSI host controller should be initialized to LP-11 before the panel
is powered up.

Cc: Ondrej Jirman <megous@megous.com>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v7:
- new patch

 drivers/gpu/drm/panel/panel-sitronix-st7703.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7703.c b/drivers/gpu/drm/panel/panel-sitronix-st7703.c
index 6747ca237ced..6e6112f5d971 100644
--- a/drivers/gpu/drm/panel/panel-sitronix-st7703.c
+++ b/drivers/gpu/drm/panel/panel-sitronix-st7703.c
@@ -65,6 +65,7 @@ struct st7703_panel_desc {
 	unsigned int lanes;
 	unsigned long mode_flags;
 	enum mipi_dsi_pixel_format format;
+	bool prepare_prev_first;
 	int (*init_sequence)(struct st7703 *ctx);
 };
 
@@ -335,6 +336,7 @@ static const struct st7703_panel_desc xbd599_desc = {
 	.lanes = 4,
 	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_SYNC_PULSE,
 	.format = MIPI_DSI_FMT_RGB888,
+	.prepare_prev_first = true,
 	.init_sequence = xbd599_init_sequence,
 };
 
@@ -544,6 +546,7 @@ static int st7703_probe(struct mipi_dsi_device *dsi)
 
 	drm_panel_init(&ctx->panel, dev, &st7703_drm_funcs,
 		       DRM_MODE_CONNECTOR_DSI);
+	ctx->panel.prepare_prev_first = ctx->desc->prepare_prev_first;
 
 	ret = drm_panel_of_backlight(&ctx->panel);
 	if (ret)
-- 
2.25.1

