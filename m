Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCEBA1C29
	for <linux-sunxi@lists.linux.dev>; Wed, 29 Mar 2023 13:18:12 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id c18so14856866ple.11
        for <linux-sunxi@lists.linux.dev>; Wed, 29 Mar 2023 06:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1680095892;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d+PX9J3U7p5qZlBeWmtYaZVahtk7x+bKgv0zxDQ5NKg=;
        b=pNuu1Gkcpj7ou0/NxyX2OGB7HOgjlkfVVree1zpId6rRDygggKC/Odx+8t6UQxJCSH
         3K+nqLT4ETFZW5uFx2XJALuvcQQIRVGsHyk4MfHSsUCru8tigfcYVsv3aZkd0DLlIYg3
         n2HCEBT3mtN4hni20h9YKd5wzUcRPY5DNSsVU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680095892;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d+PX9J3U7p5qZlBeWmtYaZVahtk7x+bKgv0zxDQ5NKg=;
        b=IlFW+D3gZ7oSVzQ14pdOklXQsY/VCUnI8qDBsqXsIawJqSl5NAQksPc4BNFkW8xYUz
         Vp6xp/+D56Lvr2RuPyYKjX42XlP25ETwJuotkQiVzG6rB0pNbJrV5k6gU6tMdFGdawGv
         9C4zGQU7t9q1tUKUE5PW7i9gm29l1Ls+a4Qfio0UofS4JwSoM73MosNsAbxRP+ml/K1Q
         wnE10h2kIpEaOrHTobAEmYIO0nRQgMlxzdopimaYxyOCwkBE1sCxpYDWSr4VTv2F1HvU
         eKMF3RJLvaUxDgHWrBVyeXXO+9ehJ88KCELFamzHp3PKlFNRLWVIzuHDk0Y5Mc4KidaY
         1YsQ==
X-Gm-Message-State: AAQBX9e+7KqqscX7JchFbU0NlJ/mrY4MGTLoK49AFo+/ePAECfYsOAk+
	hsHqtFKuHLLC0xRS3xI2Yy36kw==
X-Google-Smtp-Source: AKy350bokE1By8nbjH4J86bI+d67CKIP38qBgLKevOIo/+cgjC0kVbu1W/gnjsNm0Xt8H7dXZUIQzg==
X-Received: by 2002:a17:90b:3b44:b0:23b:50ff:59ba with SMTP id ot4-20020a17090b3b4400b0023b50ff59bamr19952654pjb.21.1680095892216;
        Wed, 29 Mar 2023 06:18:12 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00a:a047:206d:4722:c4fa:e845])
        by smtp.gmail.com with ESMTPSA id s16-20020a17090b071000b0023f5c867f82sm1400192pjz.41.2023.03.29.06.18.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Mar 2023 06:18:11 -0700 (PDT)
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
	Jagan Teki <jagan@amarulasolutions.com>
Subject: [PATCH v7 04/12] drm: panel: sitronix-st7701: Enable prepare_prev_first for ts8550b
Date: Wed, 29 Mar 2023 18:46:10 +0530
Message-Id: <20230329131615.1328366-5-jagan@amarulasolutions.com>
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

Enable the drm panel prepare_prev_first flag for ts8550b panel so-that
the previous controller should be prepared first before the prepare for
the panel is called.
           
This makes sure that the previous controller(sun6i-mipi-dsi), likely to
be a DSI host controller should be initialized to LP-11 before the panel
is powered up.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v7:
- new patch

 drivers/gpu/drm/panel/panel-sitronix-st7701.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7701.c b/drivers/gpu/drm/panel/panel-sitronix-st7701.c
index 7eae83aa0ea1..dc7677412023 100644
--- a/drivers/gpu/drm/panel/panel-sitronix-st7701.c
+++ b/drivers/gpu/drm/panel/panel-sitronix-st7701.c
@@ -105,6 +105,7 @@ struct st7701_panel_desc {
 	unsigned int lanes;
 	enum mipi_dsi_pixel_format format;
 	unsigned int panel_sleep_delay;
+	bool prepare_prev_first;
 
 	/* TFT matrix driver configuration, panel specific. */
 	const u8	pv_gamma[16];	/* Positive voltage gamma control */
@@ -564,6 +565,7 @@ static const struct st7701_panel_desc ts8550b_desc = {
 	.lanes = 2,
 	.format = MIPI_DSI_FMT_RGB888,
 	.panel_sleep_delay = 80, /* panel need extra 80ms for sleep out cmd */
+	.prepare_prev_first = true,
 
 	.pv_gamma = {
 		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
@@ -875,6 +877,7 @@ static int st7701_dsi_probe(struct mipi_dsi_device *dsi)
 
 	drm_panel_init(&st7701->panel, &dsi->dev, &st7701_funcs,
 		       DRM_MODE_CONNECTOR_DSI);
+	st7701->panel.prepare_prev_first = desc->prepare_prev_first;
 
 	/**
 	 * Once sleep out has been issued, ST7701 IC required to wait 120ms
-- 
2.25.1

