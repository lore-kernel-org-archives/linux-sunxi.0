Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20522187C
	for <linux-sunxi@lists.linux.dev>; Wed, 29 Mar 2023 13:18:26 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id gp15-20020a17090adf0f00b0023d1bbd9f9eso18572469pjb.0
        for <linux-sunxi@lists.linux.dev>; Wed, 29 Mar 2023 06:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1680095906;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O2tcpLeWl99rVNnc/BvvLtZEsLOgUmupjkNUsxeTVcU=;
        b=UdCHrE7/F4LUh7hQ2PmcZsobbVhzz88QVAURCF04bdOUcixNytJMVbyBR/3Rw8N12x
         MVxl5we+vHJftN0y2JnudLK2tnLlZax9Sbw+5Oot89CpJUDrLdG8XFnbedNYOmo9FXDB
         oIduaHar12yN2QSMpZ8CpRYroeFZ6UkiA65Rw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680095906;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O2tcpLeWl99rVNnc/BvvLtZEsLOgUmupjkNUsxeTVcU=;
        b=sWay8bBkmq88vGR4qNMieyiiuCKmEImy669BJwcxLRgKvlDgOIcZOkbWi7BHqsR4ii
         Bm0MkXvGfeFYSZoa/9MSHqwtyriY06I5pTV4m0ktDAvjIMTmDM54ET0ScsS0NM77mSWB
         jE3ydIUL3ftmFeHteiiPhzeDg23XZOV0nJ8rodHnK1ZX2FR9BMm+zIHKi2RGNFO1gYK5
         wvzzwBqTlDIQoeXlGUdPqTK9mfbmyeXBcGXGrTc1krejiYPj8YbjZVpL2hiH2fiH4zmw
         aRmIF+AAHnkuxI2KDAfwhaFeXVCHcQ0Xtj5lsQK0bhGWz+kfMWjE3I+nX02x/q/C++gQ
         i8dg==
X-Gm-Message-State: AAQBX9cmf8Pur2rGqRdkr0BmV9VMZzzVy49EasWE/JCPwpq4qzK9stfV
	wcp9Z5rwd2qCJS/giCKdR5fIeg==
X-Google-Smtp-Source: AKy350aezuMjKTTjFyH6/gyzvMVWaT+9pmv5Ms2TGgIoeYwTtKj6D8+d21S+PexByXuy9cf7MOK6Yw==
X-Received: by 2002:a17:90b:4acf:b0:236:99c4:6096 with SMTP id mh15-20020a17090b4acf00b0023699c46096mr20503031pjb.35.1680095905750;
        Wed, 29 Mar 2023 06:18:25 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00a:a047:206d:4722:c4fa:e845])
        by smtp.gmail.com with ESMTPSA id s16-20020a17090b071000b0023f5c867f82sm1400192pjz.41.2023.03.29.06.18.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Mar 2023 06:18:25 -0700 (PDT)
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
	Icenowy Zheng <icenowy@aosc.io>
Subject: [PATCH v7 06/12] drm: panel: feixin-k101-im2ba02: Enable prepare_prev_first flag
Date: Wed, 29 Mar 2023 18:46:12 +0530
Message-Id: <20230329131615.1328366-7-jagan@amarulasolutions.com>
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

Enable the drm panel prepare_prev_first flag for feixin-k101-im2ba02
so-that the previous controller should be prepared first before the
prepare for the panel is called.
                   
This makes sure that the previous controller(sun6i-mipi-dsi), likely to
be a DSI host controller should be initialized to LP-11 before the panel
is powered up.

Cc: Icenowy Zheng <icenowy@aosc.io>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v7:
- new patch

 drivers/gpu/drm/panel/panel-feixin-k101-im2ba02.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-feixin-k101-im2ba02.c b/drivers/gpu/drm/panel/panel-feixin-k101-im2ba02.c
index 76572c922983..77c936496eef 100644
--- a/drivers/gpu/drm/panel/panel-feixin-k101-im2ba02.c
+++ b/drivers/gpu/drm/panel/panel-feixin-k101-im2ba02.c
@@ -466,6 +466,7 @@ static int k101_im2ba02_dsi_probe(struct mipi_dsi_device *dsi)
 
 	drm_panel_init(&ctx->panel, &dsi->dev, &k101_im2ba02_funcs,
 		       DRM_MODE_CONNECTOR_DSI);
+	ctx->panel.prepare_prev_first = true;
 
 	ret = drm_panel_of_backlight(&ctx->panel);
 	if (ret)
-- 
2.25.1

