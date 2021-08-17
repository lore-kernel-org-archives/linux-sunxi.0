Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8DB62F80
	for <linux-sunxi@lists.linux.dev>; Tue, 17 Aug 2021 08:32:21 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id d11so37061670eja.8
        for <linux-sunxi@lists.linux.dev>; Tue, 17 Aug 2021 01:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=McC8S/bFHuSwRDT9VMEJP32+dSnc9rWytA/mVOlvx/s=;
        b=AIA3jon3fcIEdq7TSD0sgFmfbyrXMgjw5dWIMmxO8hDjibdmLplXn3aTJuYjYcGkg9
         Lx29sA2LQM4NKRhLaBlBZpyCycxDyg2ZoIjZdVvBWjYEQkH+bYa8ZtnKv1TvJWgE1nFA
         rJf0qohjLDPp3pUkTZn84rzH+filXNXRAPz8RCdTKmiMaDaY4/N3q+xVXsm0t1sf7t5b
         RSkC/zcxzrV5yOoh4D+c9+2K+1dSLRVj4E4ICtYFohxsjiDYcpTZGd/j40ClKqB+AtHo
         n5hbOwAf0Y/OXLFQ6LBKukW0DWrmrOBYqG7J9eZ5+mpN4lr3fvdZIluAYafW+hwUypOf
         UnUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=McC8S/bFHuSwRDT9VMEJP32+dSnc9rWytA/mVOlvx/s=;
        b=JIl87n+eUCKVmQgXLhm/4zirjpG9oR/Om4bBew+OkaiUVzaWVijCuMI7hpvodaWyoS
         ul4R1h/ZbvXvlW4BvNlVYvTxknMOfmhVlR4mdg0Kvzms009eX2TIHd8undtvQr5yobLV
         4J8iU5OZZPmJE/UTcLc8cEK2HbDIkHtTNUPWHLCd6Pg2H5uLFNxoV76v5BiF9jVRS9LO
         fZtSdpMPwuYYnYx1k0kuH+W96gXj31Sd3Te4G7I8FDgYJJzC4KT4978N09gSrL6iaNwq
         9p2H1cVGdtIuIfbxt1UqVMrUysMhLgfhOR47dBkr3bmzC5YNd1qTXVlyR0XiLUDeFVXP
         2pyQ==
X-Gm-Message-State: AOAM532G6YT2c0QfhMAJVxjHLJci0yovAj13OmZeBS1BIDmlFW5Uesr4
	zY6CL07BbnvxeVD2SJimMn8=
X-Google-Smtp-Source: ABdhPJx9ULim+GbyMepEG7BJqpc7mloIkbJBf2opDUr1KyybekscBrNW+WTqvS4do7tk1DbPcyO0oA==
X-Received: by 2002:a17:906:dc4:: with SMTP id p4mr171310eji.66.1629189140375;
        Tue, 17 Aug 2021 01:32:20 -0700 (PDT)
Received: from localhost.localdomain (neth7.eastcode.net. [79.143.160.90])
        by smtp.googlemail.com with ESMTPSA id e22sm675850eds.45.2021.08.17.01.32.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Aug 2021 01:32:19 -0700 (PDT)
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
Subject: [PATCH] drm/panel-simple: Add Vivax TPC-9150 panel
Date: Tue, 17 Aug 2021 10:32:01 +0200
Message-Id: <20210817083201.675133-1-pavlica.nikola@gmail.com>
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

Signed-off-by: Nikola Pavlica <pavlica.nikola@gmail.com>
---
 drivers/gpu/drm/panel/panel-simple.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 4e2dad314c79..97fc3c5740bb 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -4090,6 +4090,29 @@ static const struct panel_desc arm_rtsm = {
 	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
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
+		.width = 223,
+		.height = 125,
+	},
+	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
+	.bus_flags = DRM_BUS_FLAG_DE_HIGH,
+};
+
 static const struct of_device_id platform_of_match[] = {
 	{
 		.compatible = "ampire,am-1280800n3tzqw-t00h",
@@ -4103,6 +4126,9 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "arm,rtsm-display",
 		.data = &arm_rtsm,
+	}, {
+		.compatible = "vivax,tpc9150-panel",
+		.data = &vivax_tpc9150_panel,
 	}, {
 		.compatible = "armadeus,st0700-adapt",
 		.data = &armadeus_st0700_adapt,
-- 
2.32.0

