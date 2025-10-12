Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 895DB2FC01F
	for <linux-sunxi@lists.linux.dev>; Sun, 12 Oct 2025 19:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760297056; cv=none; b=AniPWV5ZMiz+1vjCJWTPq/cDQdhDs+bhhWmX79qRiV8O42lvfZydYL2fBKgvdsV+A9xtXo3lD7ovmrGF0RfFBooLG3OqTc/dKZHhVmmieewKh4g38hsP2EISpfsKcXa1epbkiAdcib+nyOSJW/1FhLRYIC7945njDTSt5qxMm8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760297056; c=relaxed/simple;
	bh=8tfH0Ct8eBgAlzgTHkf8CSVQ9Upjl7jIzKw/OuBxCZ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WttUQmgjzEQ3kasguoZxb0w/t/AeurXDTfObljHahVrs7nvxhDXqSuPKVnsmDwQWsEkEEStK7zRQd2Bxqr72Ysm8luoZGoaVk8VRHklAMJv+EFvFlTqDxWchkL4m+i+8rTB2skVT7oJMnaSGpFqEaQrNxT8uU6Aa7OMVT3y3jz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q1wRUcFQ; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q1wRUcFQ"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-62fa062a1abso6536884a12.2
        for <linux-sunxi@lists.linux.dev>; Sun, 12 Oct 2025 12:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760297051; x=1760901851; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XtfZqtpuShLv1nU1aubYkk3yFU+GUfrCfqGs419v49U=;
        b=Q1wRUcFQZRiChul/D8pDHFOQihKOG4CdXBLM99GI4PwTU5tLmetWOexW/lRjVQZoOi
         aAbqpgkm5QbMNVH2wnJwV5abQ1VGQKIryzU96bGgbtqPghBOqO3fL6hX6J1FhJYkogCB
         Hd4cyMt5q9pG/2MAfTphSP/WphtLLaDRNSSuxf6ktI2iu2reJD3raq3w5Zc2cUa3MeTU
         7mVJQQmz691JQxJusiRSlz04siiYseFx1JSScJVj3P186GcasNXzTTeYs7BzkoUlsWni
         Kp5lduit3pt18Ya/5oWyo0e46Ls2g+TIUnHpOdWCcBjX66fUwBMXrGtTt7DpJtj4kKKD
         QPHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760297051; x=1760901851;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XtfZqtpuShLv1nU1aubYkk3yFU+GUfrCfqGs419v49U=;
        b=kjl5m2eciQAyzwziV8x2MHvsy1jQt+z0JaivUVvWDpFEd6j+DfVDY4K3kTciw4eqay
         hgSg8uN2auXEiLsYQ5X4jSk3BsoExf4czsrVDjtIi53k15l5mGV0/FTV9Wawy/xY4l3o
         jVQ0ACehoMyM6CsxaqVDoKNcxbQznx4+OQeGc4XD675XtVe1IQ+nVPmym+rALpdQKEMB
         COmpDic2D+jX2Ux2eOLn9L6tU5/z+vRlNb1JglJZTXlolclIplAUv1yq0CTatYYobqLG
         HO3jv+5R3K+xEqzauaV1lXfHr86ITY1jPg5Ty3hNe5WOjXGgxvaBalnmdrDYjovhFJsL
         zzXA==
X-Forwarded-Encrypted: i=1; AJvYcCX0ehXQY/nAwiaCSL2yjn49aoCuY3HRnXxZwFxGGb/xrwXrB6AkSnmsiqzIPosWk9IEMxh1VOzCRDRvzQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwpW4eUWSC/dZc+AnXUy1329LJ5Da37mQpqylAOnPtZg8rSM462
	aLqoZV0geSqpBEi+HShECsTbN4Y9+uCz4KYqAhpoPUVLIkYg1UquVbHq
X-Gm-Gg: ASbGncujicSyGyCo/vo52gT0Nw8RFBivZdDz4E6o7UGPNIXNMY58LbbTSs378iMd9bh
	30QfekG8e6jhYcP1exJ4Eg1dGonFN+dgg7QYn0tZMK62q4Ecud9sdUCw1HnNcwmpu9ygUSk1iBC
	Ca3i39bt1qLe8mj8fc99XZXoh5m8V7AwhkaFcGaVEKnsSQEChkXQ4iHxT7X3HzDcK1JwYadyszv
	2r67OUlYt+45ts9UpDD5t621z1PNUDfUJbekraDcnJ+AcDMLYR9pjviejXsKY4mkllIUag9/APr
	ahM78cOi5E4CwxUVjsby0/Js067QJ2YttRCdB7GFxmY8K8/rdpXgNcrxFwLj1RY4o8stmGIpE5a
	9FWOCSknLVO425zM747uOj4J9pifmLdbsrAObz3rU499tixlWGzifK/4JU72EM2W5/psbeeB1dY
	XUSjbA8EKyf9YO28J6A9l9tc0HuzYWNZA=
X-Google-Smtp-Source: AGHT+IHB34QQqDlmEWSULWlkvhSNkqtePImbxaBbIAD1Quq/9BnRqWHi2Xd84ZFnczeko4HHUeU2JA==
X-Received: by 2002:a17:907:2689:b0:b3e:bb87:772c with SMTP id a640c23a62f3a-b50aab9c912mr2070025566b.17.1760297050626;
        Sun, 12 Oct 2025 12:24:10 -0700 (PDT)
Received: from jernej-laptop (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d67d8283sm760176466b.38.2025.10.12.12.24.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 12:24:10 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: mripard@kernel.org,
	wens@csie.org
Cc: maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	samuel@sholland.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 26/30] drm/sun4i: mixer: Add quirk for number of VI scalers
Date: Sun, 12 Oct 2025 21:23:26 +0200
Message-ID: <20251012192330.6903-27-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251012192330.6903-1-jernej.skrabec@gmail.com>
References: <20251012192330.6903-1-jernej.skrabec@gmail.com>
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

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_mixer.c     | 11 +++++++++++
 drivers/gpu/drm/sun4i/sun8i_mixer.h     |  2 ++
 drivers/gpu/drm/sun4i/sun8i_ui_scaler.c | 10 +++++-----
 3 files changed, 18 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
index 78bbfbe62833..f9131396f22f 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
@@ -708,6 +708,7 @@ static const struct sun8i_mixer_cfg sun8i_a83t_mixer0_cfg = {
 	.scaler_mask	= 0xf,
 	.scanline_yuv	= 2048,
 	.de2_fcc_alpha	= 1,
+	.vi_scaler_num	= 1,
 	.ui_num		= 3,
 	.vi_num		= 1,
 };
@@ -718,6 +719,7 @@ static const struct sun8i_mixer_cfg sun8i_a83t_mixer1_cfg = {
 	.scaler_mask	= 0x3,
 	.scanline_yuv	= 2048,
 	.de2_fcc_alpha	= 1,
+	.vi_scaler_num	= 1,
 	.ui_num		= 1,
 	.vi_num		= 1,
 };
@@ -729,6 +731,7 @@ static const struct sun8i_mixer_cfg sun8i_h3_mixer0_cfg = {
 	.scaler_mask	= 0xf,
 	.scanline_yuv	= 2048,
 	.de2_fcc_alpha	= 1,
+	.vi_scaler_num	= 1,
 	.ui_num		= 3,
 	.vi_num		= 1,
 };
@@ -740,6 +743,7 @@ static const struct sun8i_mixer_cfg sun8i_r40_mixer0_cfg = {
 	.scaler_mask	= 0xf,
 	.scanline_yuv	= 2048,
 	.de2_fcc_alpha	= 1,
+	.vi_scaler_num	= 1,
 	.ui_num		= 3,
 	.vi_num		= 1,
 };
@@ -751,6 +755,7 @@ static const struct sun8i_mixer_cfg sun8i_r40_mixer1_cfg = {
 	.scaler_mask	= 0x3,
 	.scanline_yuv	= 2048,
 	.de2_fcc_alpha	= 1,
+	.vi_scaler_num	= 1,
 	.ui_num		= 1,
 	.vi_num		= 1,
 };
@@ -761,6 +766,7 @@ static const struct sun8i_mixer_cfg sun8i_v3s_mixer_cfg = {
 	.ui_num = 1,
 	.scaler_mask = 0x3,
 	.scanline_yuv = 2048,
+	.vi_scaler_num	= 2,
 	.ccsc = CCSC_MIXER0_LAYOUT,
 	.mod_rate = 150000000,
 };
@@ -772,6 +778,7 @@ static const struct sun8i_mixer_cfg sun20i_d1_mixer0_cfg = {
 	.scaler_mask	= 0x3,
 	.scanline_yuv	= 2048,
 	.de2_fcc_alpha	= 1,
+	.vi_scaler_num	= 1,
 	.ui_num		= 1,
 	.vi_num		= 1,
 };
@@ -783,6 +790,7 @@ static const struct sun8i_mixer_cfg sun20i_d1_mixer1_cfg = {
 	.scaler_mask	= 0x1,
 	.scanline_yuv	= 1024,
 	.de2_fcc_alpha	= 1,
+	.vi_scaler_num	= 1,
 	.ui_num		= 0,
 	.vi_num		= 1,
 };
@@ -794,6 +802,7 @@ static const struct sun8i_mixer_cfg sun50i_a64_mixer0_cfg = {
 	.scaler_mask	= 0xf,
 	.scanline_yuv	= 4096,
 	.de2_fcc_alpha	= 1,
+	.vi_scaler_num	= 1,
 	.ui_num		= 3,
 	.vi_num		= 1,
 };
@@ -805,6 +814,7 @@ static const struct sun8i_mixer_cfg sun50i_a64_mixer1_cfg = {
 	.scaler_mask	= 0x3,
 	.scanline_yuv	= 2048,
 	.de2_fcc_alpha	= 1,
+	.vi_scaler_num	= 1,
 	.ui_num		= 1,
 	.vi_num		= 1,
 };
@@ -814,6 +824,7 @@ static const struct sun8i_mixer_cfg sun50i_h6_mixer0_cfg = {
 	.mod_rate	= 600000000,
 	.scaler_mask	= 0xf,
 	.scanline_yuv	= 4096,
+	.vi_scaler_num	= 1,
 	.ui_num		= 3,
 	.vi_num		= 1,
 };
diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.h b/drivers/gpu/drm/sun4i/sun8i_mixer.h
index def07afd37e1..40b800022237 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.h
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.h
@@ -178,6 +178,7 @@ enum sun8i_mixer_type {
  * @scaline_yuv: size of a scanline for VI scaler for YUV formats.
  * @de2_fcc_alpha: use FCC for missing DE2 VI alpha capability
  *	Most DE2 cores has FCC. If number of VI planes is one, enable this.
+ * @vi_scaler_num: Number of VI scalers. Used on DE2 and DE3.
  * @map: channel map for DE variants processing YUV separately (DE33)
  */
 struct sun8i_mixer_cfg {
@@ -189,6 +190,7 @@ struct sun8i_mixer_cfg {
 	unsigned int	de_type;
 	unsigned int	scanline_yuv;
 	unsigned int	de2_fcc_alpha : 1;
+	unsigned int	vi_scaler_num;
 	unsigned int	map[6];
 };
 
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
2.51.0

