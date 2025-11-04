Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A19433F38D
	for <linux-sunxi@lists.linux.dev>; Tue,  4 Nov 2025 18:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762279838; cv=none; b=YM7ck27qbCovISsSiMSk/UhPxQ0ku//DtnOysWpj1Px0nONecAijsgVwWls4HbSXRwrlqiNnpumRqpXpeAoPNfw8DtlQ+5/B59FqArmRlHc865MQoFmFpH9qd4Pbq3EkjnmBB2jkxwCzvzEHtiHD1ZQDumIQMvo0jn1P9hosa8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762279838; c=relaxed/simple;
	bh=a6SqoW324qMegk6wjIIg/gIMshOekSORsRcCSwVN+8c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MQUXSSIJbgRKnpihA2oOXRxM55RE23ScKj1q02UURhmmHKz2d2XKIvxr99+T3CkpnqNwD3/+tSt9dyFrsaRAGudXeEbCsCSx+YEQR1QQU7V6CX7QX9UHeQl/LIlp5xKYzdZ2YWfPnDiWWH2aMX4tfp9A6Hx6UtvgTI1IUD2Im8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VYJy9b1g; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VYJy9b1g"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-471b80b994bso75237975e9.3
        for <linux-sunxi@lists.linux.dev>; Tue, 04 Nov 2025 10:10:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762279835; x=1762884635; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ejkL8TsFG1o5XiPy9Gcy/NzA7/ogTbLjmhfX6D7QHow=;
        b=VYJy9b1gMEx1bpa/cuIM7+WgojNUAtOb9HWLJcECBP+SYmHBZbAZRlvQDotvDGfnEo
         Tz+QaKLGiIvncQdNDR5jZyXSxix57xBuh3haJY6OgE8t/IFUgyWuALb+c8fOYtZCVYXe
         TVGDUH6ufOUn4gLQS9hn3A7LvT1vr/OkQsiGPC2SEVLmOS1crVUc9/QJigRiCGxHDWuS
         SfikCP+lbmllG9O6iWOuS6Y5I7uEkP8CWHuapVnGC4AHTyG5OOLGq8BonjGaz+K6XgiT
         In2XyNRNaeHzCJdJu5iOHWXIsmP6goeuwp4IpHtCOMmHzTUZ5iRaiuzyxnjuCypzVCVY
         NDSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762279835; x=1762884635;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ejkL8TsFG1o5XiPy9Gcy/NzA7/ogTbLjmhfX6D7QHow=;
        b=A3X4Nwkpc+ZOgIxlLW5T+2Iu1bhxWRiltOfwEPpOfJFTiXt/o8r0LBKSSJfNmmtWl3
         SyT097pMjUZ1r8oyjBFlCTCxVnxBPIT5J+mhTQ4mRKM21tvY8SqL9NKLWCb1gBatCNB/
         ggT2c5+gEef0Y4SUbVIjEcAwitV9uQh8RoJnWC6BbM3b+ssfNFlXnQIzO12fJSK06+NI
         9Q+VeSa+dGM5B2r+UxdWJM4iz020iO51Eln/Mg/tel8y3N3sXcjM0YpVYpNprRRSqeFq
         tCu8dEVgn/Wt0IZ5tXTD4kq8XEbg+v0u0k539BpF3HxeWf580OEy5uG21z5H8gJahMlP
         53aw==
X-Forwarded-Encrypted: i=1; AJvYcCVhEwa7kLEUl14iutpKawYxwSs1qYQXjz6l1/CaVjsriKP8fl4Ml/xkW7Xi43fH+SU/t5UT49SEo3kljQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwPS6T0E/e/2q0tIgw7ON9Ybz8A3qHZ1pT2oTviSRRX7ZyVp+it
	gtwEmJDDMmyTqh+/87Ghfz1oqAAN7dflCGf5fBqmowCrY7djZuyKoHSP
X-Gm-Gg: ASbGncskjzxicb76UhkSz/THvIbkq07sJc3XL0odnp/MLdEeWwWIkhVX6uwMs9D0G0T
	EgTlDK2zI5xghc2iLw2OftPE0huwQEhKuW1mI6prpoo2JUPoiEk7BROIlkv2xNSgWqjSv1vs8p7
	3yr8ueEr67U/4Z7QC7joBkd05QVO83YSOMXOX3hgaUCnFuTokLQzdO3A9LZLjMTagvLbvrzosRt
	NDiow/sdGOgVfT/jHUEpqkZxrnM8gE9L0JUqvDyNKnzXtL4YDvege/37uYSjkjt8Z/hZJGVQsLi
	/NsQIL3ofog+b8oUT6Au8UG3misDV7tft7/xWH/kXKA0+GlgcZHRo2Ua0hektvNKN10pQCP0fA+
	7xHD95VuMwtdAu4T0lbKZBv4APPvdRkARMJe1976sj6+dRewycd882ITWta0TdY8tNvu5fkZbWu
	nvHJbsDGyf+z56pzrL9Q==
X-Google-Smtp-Source: AGHT+IGULxezyFxQaS+IhExoUiRMdNFxErCJ8jQuxzUcsuWhQgiYwKFm3qElEomNCT+mnTz7K/5UIQ==
X-Received: by 2002:a05:600c:5488:b0:45b:9a46:69e9 with SMTP id 5b1f17b1804b1-4775ce14dd0mr2937075e9.31.1762279834562;
        Tue, 04 Nov 2025 10:10:34 -0800 (PST)
Received: from jernej-laptop ([178.79.73.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477558c1a03sm24688685e9.2.2025.11.04.10.10.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 10:10:34 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: wens@csie.org
Cc: mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	samuel@sholland.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Ryan Walklin <ryan@testtoast.com>
Subject: [PATCH v2 26/30] drm/sun4i: mixer: Add quirk for number of VI scalers
Date: Tue,  4 Nov 2025 19:09:38 +0100
Message-ID: <20251104180942.61538-27-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251104180942.61538-1-jernej.skrabec@gmail.com>
References: <20251104180942.61538-1-jernej.skrabec@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On DE2 and DE3, UI scalers are located right after VI scalers. So in
order to calculate proper UI scaler base address, number of VI scalers
must be known. In practice, it is same as number of VI channels, but it
doesn't need to be.

Let's make a quirk for this number. Code for configuring channels and
associated functions won't have access to vi_num quirk anymore after
rework for independent planes.

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
Tested-by: Ryan Walklin <ryan@testtoast.com>
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
Changes in v2:
- switched position of vi_scaler_num quirk

 drivers/gpu/drm/sun4i/sun8i_mixer.c     | 11 +++++++++++
 drivers/gpu/drm/sun4i/sun8i_mixer.h     |  2 ++
 drivers/gpu/drm/sun4i/sun8i_ui_scaler.c | 10 +++++-----
 3 files changed, 18 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
index 78bbfbe62833..da3148f42646 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
@@ -705,6 +705,7 @@ static void sun8i_mixer_remove(struct platform_device *pdev)
 static const struct sun8i_mixer_cfg sun8i_a83t_mixer0_cfg = {
 	.ccsc		= CCSC_MIXER0_LAYOUT,
 	.de_type	= SUN8I_MIXER_DE2,
+	.vi_scaler_num	= 1,
 	.scaler_mask	= 0xf,
 	.scanline_yuv	= 2048,
 	.de2_fcc_alpha	= 1,
@@ -715,6 +716,7 @@ static const struct sun8i_mixer_cfg sun8i_a83t_mixer0_cfg = {
 static const struct sun8i_mixer_cfg sun8i_a83t_mixer1_cfg = {
 	.ccsc		= CCSC_MIXER1_LAYOUT,
 	.de_type	= SUN8I_MIXER_DE2,
+	.vi_scaler_num	= 1,
 	.scaler_mask	= 0x3,
 	.scanline_yuv	= 2048,
 	.de2_fcc_alpha	= 1,
@@ -726,6 +728,7 @@ static const struct sun8i_mixer_cfg sun8i_h3_mixer0_cfg = {
 	.ccsc		= CCSC_MIXER0_LAYOUT,
 	.de_type	= SUN8I_MIXER_DE2,
 	.mod_rate	= 432000000,
+	.vi_scaler_num	= 1,
 	.scaler_mask	= 0xf,
 	.scanline_yuv	= 2048,
 	.de2_fcc_alpha	= 1,
@@ -737,6 +740,7 @@ static const struct sun8i_mixer_cfg sun8i_r40_mixer0_cfg = {
 	.ccsc		= CCSC_MIXER0_LAYOUT,
 	.de_type	= SUN8I_MIXER_DE2,
 	.mod_rate	= 297000000,
+	.vi_scaler_num	= 1,
 	.scaler_mask	= 0xf,
 	.scanline_yuv	= 2048,
 	.de2_fcc_alpha	= 1,
@@ -748,6 +752,7 @@ static const struct sun8i_mixer_cfg sun8i_r40_mixer1_cfg = {
 	.ccsc		= CCSC_MIXER1_LAYOUT,
 	.de_type	= SUN8I_MIXER_DE2,
 	.mod_rate	= 297000000,
+	.vi_scaler_num	= 1,
 	.scaler_mask	= 0x3,
 	.scanline_yuv	= 2048,
 	.de2_fcc_alpha	= 1,
@@ -759,6 +764,7 @@ static const struct sun8i_mixer_cfg sun8i_v3s_mixer_cfg = {
 	.de_type = SUN8I_MIXER_DE2,
 	.vi_num = 2,
 	.ui_num = 1,
+	.vi_scaler_num	= 2,
 	.scaler_mask = 0x3,
 	.scanline_yuv = 2048,
 	.ccsc = CCSC_MIXER0_LAYOUT,
@@ -769,6 +775,7 @@ static const struct sun8i_mixer_cfg sun20i_d1_mixer0_cfg = {
 	.ccsc		= CCSC_D1_MIXER0_LAYOUT,
 	.de_type	= SUN8I_MIXER_DE2,
 	.mod_rate	= 297000000,
+	.vi_scaler_num	= 1,
 	.scaler_mask	= 0x3,
 	.scanline_yuv	= 2048,
 	.de2_fcc_alpha	= 1,
@@ -780,6 +787,7 @@ static const struct sun8i_mixer_cfg sun20i_d1_mixer1_cfg = {
 	.ccsc		= CCSC_MIXER1_LAYOUT,
 	.de_type	= SUN8I_MIXER_DE2,
 	.mod_rate	= 297000000,
+	.vi_scaler_num	= 1,
 	.scaler_mask	= 0x1,
 	.scanline_yuv	= 1024,
 	.de2_fcc_alpha	= 1,
@@ -791,6 +799,7 @@ static const struct sun8i_mixer_cfg sun50i_a64_mixer0_cfg = {
 	.ccsc		= CCSC_MIXER0_LAYOUT,
 	.de_type	= SUN8I_MIXER_DE2,
 	.mod_rate	= 297000000,
+	.vi_scaler_num	= 1,
 	.scaler_mask	= 0xf,
 	.scanline_yuv	= 4096,
 	.de2_fcc_alpha	= 1,
@@ -802,6 +811,7 @@ static const struct sun8i_mixer_cfg sun50i_a64_mixer1_cfg = {
 	.ccsc		= CCSC_MIXER1_LAYOUT,
 	.de_type	= SUN8I_MIXER_DE2,
 	.mod_rate	= 297000000,
+	.vi_scaler_num	= 1,
 	.scaler_mask	= 0x3,
 	.scanline_yuv	= 2048,
 	.de2_fcc_alpha	= 1,
@@ -812,6 +822,7 @@ static const struct sun8i_mixer_cfg sun50i_a64_mixer1_cfg = {
 static const struct sun8i_mixer_cfg sun50i_h6_mixer0_cfg = {
 	.de_type	= SUN8I_MIXER_DE3,
 	.mod_rate	= 600000000,
+	.vi_scaler_num	= 1,
 	.scaler_mask	= 0xf,
 	.scanline_yuv	= 4096,
 	.ui_num		= 3,
diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.h b/drivers/gpu/drm/sun4i/sun8i_mixer.h
index def07afd37e1..8c2e8005fc5b 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.h
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.h
@@ -167,6 +167,7 @@ enum sun8i_mixer_type {
  * struct sun8i_mixer_cfg - mixer HW configuration
  * @vi_num: number of VI channels
  * @ui_num: number of UI channels
+ * @vi_scaler_num: Number of VI scalers. Used on DE2 and DE3.
  * @scaler_mask: bitmask which tells which channel supports scaling
  *	First, scaler supports for VI channels is defined and after that, scaler
  *	support for UI channels. For example, if mixer has 2 VI channels without
@@ -183,6 +184,7 @@ enum sun8i_mixer_type {
 struct sun8i_mixer_cfg {
 	int		vi_num;
 	int		ui_num;
+	unsigned int	vi_scaler_num;
 	int		scaler_mask;
 	int		ccsc;
 	unsigned long	mod_rate;
diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_scaler.c b/drivers/gpu/drm/sun4i/sun8i_ui_scaler.c
index c0947ccf675b..0ba1482688d7 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_scaler.c
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_scaler.c
@@ -91,16 +91,16 @@ static const u32 lan2coefftab16[240] = {
 
 static u32 sun8i_ui_scaler_base(struct sun8i_mixer *mixer, int channel)
 {
-	int vi_num = mixer->cfg->vi_num;
+	int offset = mixer->cfg->vi_scaler_num;
 
 	if (mixer->cfg->de_type == SUN8I_MIXER_DE3)
 		return DE3_VI_SCALER_UNIT_BASE +
-		       DE3_VI_SCALER_UNIT_SIZE * vi_num +
-		       DE3_UI_SCALER_UNIT_SIZE * (channel - vi_num);
+		       DE3_VI_SCALER_UNIT_SIZE * offset +
+		       DE3_UI_SCALER_UNIT_SIZE * (channel - offset);
 	else
 		return DE2_VI_SCALER_UNIT_BASE +
-		       DE2_VI_SCALER_UNIT_SIZE * vi_num +
-		       DE2_UI_SCALER_UNIT_SIZE * (channel - vi_num);
+		       DE2_VI_SCALER_UNIT_SIZE * offset +
+		       DE2_UI_SCALER_UNIT_SIZE * (channel - offset);
 }
 
 static int sun8i_ui_scaler_coef_index(unsigned int step)
-- 
2.51.2

