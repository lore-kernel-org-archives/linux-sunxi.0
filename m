Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAA992F28
	for <linux-sunxi@lists.linux.dev>; Sat, 21 May 2022 13:35:02 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id w3so2826665plp.13
        for <linux-sunxi@lists.linux.dev>; Sat, 21 May 2022 06:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=X/1JoYU2eaaPdYWTtHptPizgGXOiJfqbRsxQiijvcnU=;
        b=hJ2wZiz43Q7G5xoR7vAK2HSUyHGSdRL6QM5wOn5ffWmh5k2Q9I5pqiRe4xddjEhY8e
         IGx3dW2owdGd6n7HP8V94tSJYcKWxXNF0wiB3hZ5KvoEBtuViuVj3SRjC1qO0uau/WCB
         S30vyXiWvOWLqj/mj66JfAe6myrcD66UJh/gEwv1GpzVDZJ+SsT3VdoObIg7449Qjasc
         yipS888I4w66zXrKuPCsk6JY9czhevexTSnd7nwSpnYuKonJ5ncBXahUxoxsgLX4Jtnu
         QYIAmB1QvxnvWoxkCg9VBammHApWcTg8J1eP7nWuRnLEYPtoqB5MFCQkxkBLn2i3M7XI
         CfYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=X/1JoYU2eaaPdYWTtHptPizgGXOiJfqbRsxQiijvcnU=;
        b=hQfkzqs/gLI6UUGRM+8nv0uRflC3b02/RftJbQp5/z5P4gdof+zzgNzcd/2EcYr3wH
         D/rrbCVoi133Fh2QfAvf6vefH79eyDmJoF8OwD3ED7ACPk1A8rZ7GZYbmZJpXcEfv/Jw
         +deXqRuuO52aAcioQLjIgfL1DSB5LWhwo/3w8kWVlgswb/FbXrpzkB0cGNrL3pJVMDdV
         PKgwYRxMMOcx3Vp5AApMXsocj0SzFaC+MVqSL5orU3BJw5eoZLtkkR67wemDPwBvrdBq
         FC+KQEXyyXOEwR+7QqFUSjJXAjJlzYF7PFDvSGXu8aMhZA1QTcB4dgoGVIWsWOm803EO
         lMBg==
X-Gm-Message-State: AOAM533lw7Wxqm2ysEBfUUv/uFdaawSO7V1DVmuC7OJr8hIqJs48jve/
	v59FJnArn/6NtR9JU1j+lQw=
X-Google-Smtp-Source: ABdhPJx0zCLwUiyeASotOlJEzSqtjfEA3r1zvU8fue4LcCU1odSzkqoq62UrwvZajtLu0Z/RriA9jA==
X-Received: by 2002:a17:90b:3889:b0:1dc:cac6:f03e with SMTP id mu9-20020a17090b388900b001dccac6f03emr16537918pjb.23.1653140102261;
        Sat, 21 May 2022 06:35:02 -0700 (PDT)
Received: from benly-pc.localdomain ([58.100.171.250])
        by smtp.gmail.com with ESMTPSA id jb15-20020a170903258f00b0015e8d4eb256sm1597765plb.160.2022.05.21.06.34.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 May 2022 06:35:02 -0700 (PDT)
From: Genfu Pan <benlypan@gmail.com>
To: mripard@kernel.org,
	wens@csie.org,
	jernej.skrabec@gmail.com
Cc: airlied@linux.ie,
	daniel@ffwll.ch,
	samuel@sholland.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Genfu Pan <benlypan@gmail.com>
Subject: [PATCH] drm/sun4i: mixer: fix scanline for V3s and D1
Date: Sat, 21 May 2022 21:34:43 +0800
Message-Id: <20220521133443.1114749-1-benlypan@gmail.com>
X-Mailer: git-send-email 2.36.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Accrording the SDK from Allwinner, the scanline value of yuv and rgb for
V3s are both 1024. The is also the same for mixer 1 of D1. Currently the
scanline value of rgb is hardcoded to 2048 for all SOCs.

Change the scanline_yuv property of V3s to 1024. Add the scanline_rgb
property to the mixer config and replace the hardcoded value with it before
scaling.

Signed-off-by: Genfu Pan <benlypan@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_mixer.c    | 13 ++++++++++++-
 drivers/gpu/drm/sun4i/sun8i_mixer.h    |  1 +
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c |  3 +--
 3 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
index 875a1156c..e64e08207 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
@@ -567,6 +567,7 @@ static const struct sun8i_mixer_cfg sun8i_a83t_mixer0_cfg = {
 	.ccsc		= CCSC_MIXER0_LAYOUT,
 	.scaler_mask	= 0xf,
 	.scanline_yuv	= 2048,
+	.scanline_rgb	= 2048,
 	.ui_num		= 3,
 	.vi_num		= 1,
 };
@@ -575,6 +576,7 @@ static const struct sun8i_mixer_cfg sun8i_a83t_mixer1_cfg = {
 	.ccsc		= CCSC_MIXER1_LAYOUT,
 	.scaler_mask	= 0x3,
 	.scanline_yuv	= 2048,
+	.scanline_rgb	= 2048,
 	.ui_num		= 1,
 	.vi_num		= 1,
 };
@@ -584,6 +586,7 @@ static const struct sun8i_mixer_cfg sun8i_h3_mixer0_cfg = {
 	.mod_rate	= 432000000,
 	.scaler_mask	= 0xf,
 	.scanline_yuv	= 2048,
+	.scanline_rgb	= 2048,
 	.ui_num		= 3,
 	.vi_num		= 1,
 };
@@ -593,6 +596,7 @@ static const struct sun8i_mixer_cfg sun8i_r40_mixer0_cfg = {
 	.mod_rate	= 297000000,
 	.scaler_mask	= 0xf,
 	.scanline_yuv	= 2048,
+	.scanline_rgb	= 2048,
 	.ui_num		= 3,
 	.vi_num		= 1,
 };
@@ -602,6 +606,7 @@ static const struct sun8i_mixer_cfg sun8i_r40_mixer1_cfg = {
 	.mod_rate	= 297000000,
 	.scaler_mask	= 0x3,
 	.scanline_yuv	= 2048,
+	.scanline_rgb	= 2048,
 	.ui_num		= 1,
 	.vi_num		= 1,
 };
@@ -610,7 +615,8 @@ static const struct sun8i_mixer_cfg sun8i_v3s_mixer_cfg = {
 	.vi_num = 2,
 	.ui_num = 1,
 	.scaler_mask = 0x3,
-	.scanline_yuv = 2048,
+	.scanline_yuv = 1024,
+	.scanline_rgb = 1024,
 	.ccsc = CCSC_MIXER0_LAYOUT,
 	.mod_rate = 150000000,
 };
@@ -620,6 +626,7 @@ static const struct sun8i_mixer_cfg sun20i_d1_mixer0_cfg = {
 	.mod_rate	= 297000000,
 	.scaler_mask	= 0x3,
 	.scanline_yuv	= 2048,
+	.scanline_rgb	= 2048,
 	.ui_num		= 1,
 	.vi_num		= 1,
 };
@@ -629,6 +636,7 @@ static const struct sun8i_mixer_cfg sun20i_d1_mixer1_cfg = {
 	.mod_rate	= 297000000,
 	.scaler_mask	= 0x1,
 	.scanline_yuv	= 1024,
+	.scanline_rgb	= 1024,
 	.ui_num		= 0,
 	.vi_num		= 1,
 };
@@ -638,6 +646,7 @@ static const struct sun8i_mixer_cfg sun50i_a64_mixer0_cfg = {
 	.mod_rate	= 297000000,
 	.scaler_mask	= 0xf,
 	.scanline_yuv	= 4096,
+	.scanline_rgb	= 2048,
 	.ui_num		= 3,
 	.vi_num		= 1,
 };
@@ -647,6 +656,7 @@ static const struct sun8i_mixer_cfg sun50i_a64_mixer1_cfg = {
 	.mod_rate	= 297000000,
 	.scaler_mask	= 0x3,
 	.scanline_yuv	= 2048,
+	.scanline_rgb	= 2048,
 	.ui_num		= 1,
 	.vi_num		= 1,
 };
@@ -657,6 +667,7 @@ static const struct sun8i_mixer_cfg sun50i_h6_mixer0_cfg = {
 	.mod_rate	= 600000000,
 	.scaler_mask	= 0xf,
 	.scanline_yuv	= 4096,
+	.scanline_rgb	= 2048,
 	.ui_num		= 3,
 	.vi_num		= 1,
 };
diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.h b/drivers/gpu/drm/sun4i/sun8i_mixer.h
index 85c94884f..c01b3e9d6 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.h
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.h
@@ -172,6 +172,7 @@ struct sun8i_mixer_cfg {
 	unsigned long	mod_rate;
 	unsigned int	is_de3 : 1;
 	unsigned int	scanline_yuv;
+	unsigned int	scanline_rgb;
 };
 
 struct sun8i_mixer {
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index f7d0b082d..30e6bde92 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -188,8 +188,7 @@ static int sun8i_vi_layer_update_coord(struct sun8i_mixer *mixer, int channel,
 			src_h = vn;
 		}
 
-		/* it seems that every RGB scaler has buffer for 2048 pixels */
-		scanline = subsampled ? mixer->cfg->scanline_yuv : 2048;
+		scanline = subsampled ? mixer->cfg->scanline_yuv : mixer->cfg->scanline_rgb;
 
 		if (src_w > scanline) {
 			DRM_DEBUG_DRIVER("Using horizontal coarse scaling\n");
-- 
2.36.0

