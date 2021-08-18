Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E9962FAD
	for <linux-sunxi@lists.linux.dev>; Wed, 18 Aug 2021 14:47:02 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id bq25so5531183ejb.11
        for <linux-sunxi@lists.linux.dev>; Wed, 18 Aug 2021 07:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HQ+SRnnm5XJPlQZM6OIpSav/h3nKkAs0Le4aeSpFCXA=;
        b=Ni7orkw/le15lYw5vCMDy4GHQSmgE9WZ4CUrCjjj4+NZVJakJD2ijy6HsbopsTnj0m
         Bf//m3e0+UDyYAiWhsoR1lUxOzbJIrQviug1Rr4T97HJXbXl2wxlQc75BcA6VqWcJ6L4
         Ie0JzBOu+b6PBIYjbNrojs06cmBIEiePhlnT8u2GWuL4mVHbxBZ1Arw6+xog5fVy3FDP
         94bJ3vY6ztMIcoE7+hP0oJH9wu85nIOA7yEV8CX9NTDImXvidhfT7XzHHJb7wZncUw6n
         q5fcVrHSyW9mnE2RlU1Jif3y4dqtHvxLQNDvOdyseMQeHESH4lXFHcNyP7c5l7wsvh82
         6eAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HQ+SRnnm5XJPlQZM6OIpSav/h3nKkAs0Le4aeSpFCXA=;
        b=jFbqWEGmnwHsNFO/dsiX0+W4dNV2qdv9LsKALwRIuvE0GyoSYKbfX3AUQ07/6t92vO
         v9CaUVuse6sEu7zukNY3xkLv9E34drrSsuguO+NnLqy1A5xdz3doqNyfx6umlOgAEVH4
         FZ+rGRNaYD43Gol/Fts5tyB2vJWLnGRnvDwmTlhPGR82bWIXK+mFKTIwqEtLqTG7nBzK
         tHHm+z9TAVqjCeT8+RedkeTjfwOWJZyjmkrY80J7Jem/RnDAJT247FKlzCV9jSOuk0RO
         X3TbpjnynagUkG92uOGOPQJ+/Rd2SMPi5g1S5xVBk98TdSpMul0lUpu05YZA1Ef4oPnG
         rltQ==
X-Gm-Message-State: AOAM5330Obg0o6RYsZNKcp8BwQ1X1r9XuhHHe/dFwt3MRwxDlxYJxYNM
	Y8fWXKYdRpFuNXVzsFtVlQM=
X-Google-Smtp-Source: ABdhPJwLeErQ/Dftz4tZkbzpAElWSCWqNwGHJoaGRngb7u9Pfi29mdZrz9e5NfvT8AznHd+n7xTsGg==
X-Received: by 2002:a17:906:a14b:: with SMTP id bu11mr10212811ejb.260.1629298020386;
        Wed, 18 Aug 2021 07:47:00 -0700 (PDT)
Received: from localhost.localdomain (neth7.eastcode.net. [79.143.160.90])
        by smtp.googlemail.com with ESMTPSA id x17sm2152808ejj.58.2021.08.18.07.46.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 07:46:59 -0700 (PDT)
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
Subject: [PATCH 1/3] drm/panel-simple: Add Vivax TPC-9150 panel v4
Date: Wed, 18 Aug 2021 16:46:46 +0200
Message-Id: <20210818144648.72665-1-pavlica.nikola@gmail.com>
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

Version 4, rearranged the display parameters and fix invalid bit format
issue. (Thanks Sam)

Thanks,
Nikola

Signed-off-by: Nikola Pavlica <pavlica.nikola@gmail.com>
---
 drivers/gpu/drm/panel/panel-simple.c | 29 ++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 4e2dad314c79..9e06c375f8a0 100644
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
+	.bpc = 6,
+	.size = {
+		.width = 200,
+		.height = 115,
+	},
+	.bus_format = MEDIA_BUS_FMT_RGB666_1X18,
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

