Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94F352FB0
	for <linux-sunxi@lists.linux.dev>; Tue, 17 Aug 2021 16:36:27 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id qk33so39759336ejc.12
        for <linux-sunxi@lists.linux.dev>; Tue, 17 Aug 2021 09:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lUvwlKWhGLRCmR/vgTBa/y/Y0LZjj+6hoHG51z0UIpA=;
        b=ItwJNR6dZAWtE5x5L9P9DwShoDVmdWsgbe889cJQMar4e577WNkGJTLeHstF+UZp4B
         V6MHN60I03tqUGVlwFIF31Qn+gzfrWRtC2zwT2YJgZmortO9kI4aUt1gw2PMPC9L8362
         StM1AdvyuQbbL7kJ6StSoXAp6yXw0bf1ivkviKZ+/XAhru2ZhK39whKdC5Bxez5PMMld
         dV7QcIuscG3exs8DGYRXKlE7l2GlYrdaW3QUYFS5I4fiGQSiFT3EfzGjiSb9sQzB/5/o
         /C9jBPfPr5iPsbMhttnmcnSIIxHcQQ7Px8EZhtTGFbcgyuKjJeoM80Cex3+EjtYLSQun
         ILeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lUvwlKWhGLRCmR/vgTBa/y/Y0LZjj+6hoHG51z0UIpA=;
        b=d3RRWGink38JrlbXuNwbKbdHIf8xobiGWoSE480nOjZJkZIALx7uZM5z0YUbMbBcGc
         5Tlhhqm+i9ZtDqsjwVz27JzLsClh+v+ry29Z2jtCs+IddK4bpugnHKlxFv7bmUbKy6XF
         wMvN1cdlb/VMNghj1ihdiQh4Ez6EU+nhkOzhXLudMQ9bQuqH3JAcABNop0KP6sGrSDW9
         LglecbT/fTBI5Dt/VboPcU3KnMb07r9XDHxCINMNGzFNLO5PtZCiPiPWzwyNgJSZxSx8
         iIJBAoH4njonlYeKMS5cCmYehOBzh1s9iy6XPRv6ucurXAmoaiuhsZ/6fOsDcIf1rNal
         bERg==
X-Gm-Message-State: AOAM530xituhAfRnXHdqxUHqhL4Vg6DLUsftLT1yWmT4hmN/k72GxVnT
	BPqWF1WdxezT9ylRpEiihSc=
X-Google-Smtp-Source: ABdhPJzlvdE3sEZ6wE4mp1nxuzzLEnBAbGmHvdl/VEt9bm4Ec7nGWqd9jyXG4yFjbClRdrDPxTVCbg==
X-Received: by 2002:a17:906:b18e:: with SMTP id w14mr4954643ejy.63.1629218185929;
        Tue, 17 Aug 2021 09:36:25 -0700 (PDT)
Received: from localhost.localdomain ([213.91.86.150])
        by smtp.googlemail.com with ESMTPSA id r2sm1313795edv.78.2021.08.17.09.36.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Aug 2021 09:36:25 -0700 (PDT)
From: Nikola Pavlica <pavlica.nikola@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: thierry.reding@gmail.com,
	sam@ravnborg.org,
	airlied@linux.ie,
	daniel@ffwll.ch,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@googlegroups.com,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Nikola Pavlica <pavlica.nikola@gmail.com>
Subject: [PATCH] drm/panel-simple: Add Vivax TPC-9150 panel v3
Date: Tue, 17 Aug 2021 18:36:05 +0200
Message-Id: <20210817163605.1077257-1-pavlica.nikola@gmail.com>
X-Mailer: git-send-email 2.32.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The model and make of the LCD panel of the Vivax TPC-9150 is unknown,
hence the panel settings that were retrieved with a FEX dump are named
after the device NOT the actual panel.

The LCD in question is a 50 pin MISO TFT LCD panel of the resolution
1024x600 used by the aforementioned device.

Version 2, as Thierry kindly suggested that I fix the order in which the
panel was ordered compared to others.

Version 3, filling in the required info suggested by Sam. Plus some
factual issues that I've corrected myself (tested working)

Thanks,
Nikola

Signed-off-by: Nikola Pavlica <pavlica.nikola@gmail.com>
---
 drivers/gpu/drm/panel/panel-simple.c | 29 ++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 4e2dad314c79..f6b3e58c162b 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -3989,6 +3989,32 @@ static const struct panel_desc urt_umsh_8596md_parallel = {
 	.bus_format = MEDIA_BUS_FMT_RGB666_1X18,
 };
 
+static const struct drm_display_mode vivax_tpc9150_panel_mode = {
+	.clock = 60000,
+	.hdisplay = 1024,
+	.hsync_start = 1024 + 160,
+	.hsync_end = 1024 + 160 + 100,
+	.htotal = 1024 + 160 + 100 + 60,
+	.vdisplay = 600,
+	.vsync_start = 600 + 12,
+	.vsync_end = 600 + 12 + 10,
+	.vtotal = 600 + 12 + 10 + 13,
+};
+
+static const struct panel_desc vivax_tpc9150_panel = {
+	.modes = &vivax_tpc9150_panel_mode,
+	.num_modes = 1,
+	.size = {
+		.width = 200,
+		.height = 115,
+	},
+	.bpc = 6,
+	.bus_format = MEDIA_BUS_FMT_RGB666_1X24,
+	.bus_flags = DRM_BUS_FLAG_DE_HIGH,
+	.connector_type = DRM_MODE_CONNECTOR_LVDS,
+};
+
+
 static const struct drm_display_mode vl050_8048nt_c01_mode = {
 	.clock = 33333,
 	.hdisplay = 800,
@@ -4490,6 +4516,9 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "urt,umsh-8596md-20t",
 		.data = &urt_umsh_8596md_parallel,
+	}, {
+		.compatible = "vivax,tpc9150-panel",
+		.data = &vivax_tpc9150_panel,
 	}, {
 		.compatible = "vxt,vl050-8048nt-c01",
 		.data = &vl050_8048nt_c01,
-- 
2.32.0

