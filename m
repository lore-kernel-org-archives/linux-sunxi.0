Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FEDF2C83
	for <linux-sunxi@lists.linux.dev>; Mon, 11 Oct 2021 21:27:57 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id z20so72660251edc.13
        for <linux-sunxi@lists.linux.dev>; Mon, 11 Oct 2021 14:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2WEpb5+0lxyk6hnVC3SBbE6DsWb5LPKn+Auyj5EqhHY=;
        b=CNrwenvZGG/CuX/oHqi7m5qGcFLmvm57aFtuBvrsrlTN/PCWeh9lDF6NX45ucziUz7
         FzixhruN3chaDRPOrmJRB2Nl8v1fNtBvK326JSvvfNfiYiHj0WTanNq828Lw3BjhouRA
         Is/9nzZE69rzQcJ42uJgP3Ztane474A0/4IG66doupyODczTB+dafEy2t6ZD++DuraGn
         j8st3VPG8r03eWK5/ao1+PeSHgBlfrKmVq1nH6CpL+3A02ka2Pzj4Pu+OVmB1hLpMDW/
         tZERlLMEVdUsSpDZo/qk/6QrDRiX5hx0BTpN8f42o8XUKpwA0DqWEjVEYu+JQ1JzvwYC
         JhYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2WEpb5+0lxyk6hnVC3SBbE6DsWb5LPKn+Auyj5EqhHY=;
        b=o/8U6eXBShh/AaxsA1kwH2E9WCv98az5Od5Shw5o9pH3ZHmUyC5wmlf5jAQ2enMkEf
         0qoiTCAhr+5d+kUlA3nlqHUNb/+2GKRKlGAyc0MT3QnR9mL6JDSD8Fo2Q/UMtsd93doy
         hBvaccsDKZxHbhVezuaI+0ALxyiXFtr2/wfbbchPZS51mAzUu21hDOrm3ZbAYrUvs630
         9N7yUfL33guKCZB7h7SiWlm9Fha9WYyWHMluyTZBhL0d1cij7Y2g7Oj1BGTXxBYLxZ+7
         ZlIoJEEmq13ZYjqErnXQVbxcASnAuQnKmgEVo2HyN9EyMj1LFVN27bAkwQI3l/ghq+Cs
         ne7w==
X-Gm-Message-State: AOAM530qtzPwSUTxXcf0w4TCd+EKn7EGFv44nDAiQmbMsQjGPfDIkvk6
	n8o2VV/E0+qqN4YYzD2LlJ4fkFQLuXnRwQ==
X-Google-Smtp-Source: ABdhPJz8g4Ojnh+8a4B+M1I5+PnUpyGplOSBNL4HDUr7T6vPkb61n/Xv8ukjcWMSuz73WgNGfmIOHA==
X-Received: by 2002:a05:6402:2022:: with SMTP id ay2mr22426708edb.344.1633987675973;
        Mon, 11 Oct 2021 14:27:55 -0700 (PDT)
Received: from localhost.localdomain ([213.91.86.150])
        by smtp.gmail.com with ESMTPSA id y19sm3779437edd.39.2021.10.11.14.27.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Oct 2021 14:27:55 -0700 (PDT)
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
Subject: [PATCH] drm/panel-simple: Add Vivax TPC-9150 panel v6
Date: Mon, 11 Oct 2021 23:27:31 +0200
Message-Id: <20211011212731.77763-1-pavlica.nikola@gmail.com>
X-Mailer: git-send-email 2.33.0
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

Version 5, referred to FEX file instead of manual debugging for
information.

Version 6, same as above. This time, it'll be documented.

A bit of context first: I experimented with this a long time ago whilst
I was first learning how to get Linux running on Allwinner boards, I
didn't have many resources at hand so this was quite slow. Anyways, I
stumbled upon this guide (https://linux-sunxi.org/LCD) and was reading
about how to setup the LCD for my tablet. Since I was able to make a
proper FEX dump, I was also able to read the correct parameters for
myself without relying on leaked documents or part numbers and whatnot.

In the FEX dump the value lcd_frm IS SET to 1, which means, at least
according to the document, that this display is INDEED an 18 bit per
pixel panel. Compiling U-Boot and seeing the tux in proper colors
confirmed this. As per Sam Ravnborg's suggestion, I've changed the panel
to his format "MEDIA_BUS_FMT_RGB666_1X7X3_SPWG", however this does not
lead to any actual change in regards to the functionality since the sunxi
panel driver just ignores this value. However, hopefully this clears up
any errors down the road as either the driver becomes advanced enough to
not ignore this value or that some other piece of software relies on
this value being known. PS: Apologies to the maintainers that have to
endure my misjudgement about how these things work.

As for the concerns about a single patch series, I wasn't sure where to
send the patches as they clearly aren't dt-bindings related and my
previous patches have ended up in drm-misc-fixes anyway. So I'm guessing
I'll be fine if I just post them in the list from last time???

Sorry, am a noobie here, as you could imagine.

Thanks,
Nikola

Signed-off-by: Nikola Pavlica <pavlica.nikola@gmail.com>
---
 drivers/gpu/drm/panel/panel-simple.c | 29 ++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 9b6c4e6c3..548bce290 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -4363,6 +4363,32 @@ static const struct panel_desc urt_umsh_8596md_parallel = {
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
+	.bus_format = MEDIA_BUS_FMT_RGB666_1X7X3_SPWG,
+	.bus_flags = DRM_BUS_FLAG_DE_HIGH,
+	.connector_type = DRM_MODE_CONNECTOR_LVDS,
+};
+
+
 static const struct drm_display_mode vl050_8048nt_c01_mode = {
 	.clock = 33333,
 	.hdisplay = 800,
@@ -4891,6 +4917,9 @@ static const struct of_device_id platform_of_match[] = {
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
2.33.0

