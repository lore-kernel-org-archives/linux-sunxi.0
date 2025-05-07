Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCD7128EA68
	for <linux-sunxi@lists.linux.dev>; Wed,  7 May 2025 20:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746649353; cv=none; b=rGn1vMUrvm9t+UINFU4DW4DpDUyWZsCftECi7y3jWeaYXv87+ztFuWYLXldkivk+axeVFn5d2W+0nj8t1Ruoa9GBStA1SlnC/RuXYXtAopP5QcAmo/sYQSp9kROty9yZUm1SboZZJ4lNHh51EMTSdtS/U78jvQQEEiqEsZMcynY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746649353; c=relaxed/simple;
	bh=aE+44eaEhFoEmPEBWxm3CnBBIL5z0Mws6Wyjwk7GFfA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O096PO0GRXIey6yrNwMmF3pQyglPW2l1el9kQZOQIPAr+Dd+cm9bMSmX9kJvN07qet9O3b0eTcUqXAst0SuPeaTOsKYCW3zwYfcsQ/U4yJ7bZul98v8cTmJenthVlm+wgk05JDvGgWiQuk7/ClEcjItG6HabvftBB32JuN6VpS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LRL7TQIR; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LRL7TQIR"
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-7311a8bb581so159563a34.0
        for <linux-sunxi@lists.linux.dev>; Wed, 07 May 2025 13:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746649350; x=1747254150; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6ECm4vsoW+32S8jcl8nf2NLWmke5G4xraIMQjtb0TqM=;
        b=LRL7TQIRRcfCjpVimtTbS6grUecqC8/izZH/QZ9A8UGYoC7ITMvUn1JUm1C4MR4mM8
         E8egrxmK0WrdC1vg4iO0BkLjMPBUbp9JxkjF2qFQSJ9WnRIfMBrUgOgS9JxhqrJre5Le
         WnFJlzmpKb904xT6npm9al28TNkxmOoGk3mdnieQc8S0ngWNCMuh0/SC8828YA336Yw6
         Q6F+Ttj/KPRgLlr96R10iLI9s6eN6PqLWze8brv6/J9Qt/4nCdhVNJuzVkJmZ5itKdee
         9cKp7xn36ghTeUpOsZPsfOVVCCPro4D6qx9Sy/T1Neu2kcJTEhyKDi7vY4fCssyNgEAI
         pBKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746649350; x=1747254150;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6ECm4vsoW+32S8jcl8nf2NLWmke5G4xraIMQjtb0TqM=;
        b=kS3vvNBxA5O9cKqGOB2NApMdNkAF+uYI/e9CuoYgbFzNepeZzvmt3HgVSyq/OUxEXV
         9JHI27kqHTHqB8ppk0UNGBn/l5gskKuz+cBnNiuNzT3HYJtz8D1K5AFAMg6OeLPTWjJy
         Vl/fN+HI/rG1hyhjozn6eiPCAhSiBOXRmUe01f0W8fkFpYmxkOPg5V+9I3TUgn8V2HVD
         VQ6ErPEw38SCDjLmthQRxdo7chToowQEoKgKv8ei5OhYXMHHHTp/FA5wlDuDb5RmAuuQ
         8fXL6JIzeoV/gZRzKdUElRfW9Z5HoCi+j97KGBg81CKixM+rh76UJZf+uGXMng8dsIpT
         GoSw==
X-Gm-Message-State: AOJu0YyVagUq++iBzn31ByEbzf7ekH8IXvsgd5B7EUwAMZuM5XwpJAWg
	I6YNhdSU9PXUa4V6dZcpe5LgGrm8he+cIo+tN+/2nQwAfngwG2sa2NwQqw==
X-Gm-Gg: ASbGnctHJjHhYQflhf9KoVjJgb9nFeDh6u3uyyXEl4bhEYUlyo1aIUTs86ETHjgtFzb
	LD1xWbI8mTwE5L5h0TZT3+Qmk3B5fTHYRkoYhwWhBTDjJ0pkKNuzB7KzC2gNsbvo2A8uibOg4T9
	t3uzcdaDXi0vndYi5MgYAYbsdEaqLqUi2UcQMXnWx+WgYCVPLRN9TYQEjtHCEat8Na4KM5+/dyr
	LYV3jHVtdsLpCsVFxBkzLTbE0iA74+6VYBH5XUn/fpNs4gbZHZHY+x6okW8WEX2tZJEblK4dEoA
	IAQV3C5ovpsQMZIP6J96Nr+6xNA5mF9R5qsJAAXU7hOIW3v0kThsP1t2T42cnVKJuVW8W7E=
X-Google-Smtp-Source: AGHT+IFNYiTe2ivxn2BpZru44Mz+Cbpuh5GShVyQbiTzaZin9SYSI0N+J6lKKB11hGqcKOTRI24Jlw==
X-Received: by 2002:a05:6830:3c8c:b0:72b:9bac:c044 with SMTP id 46e09a7af769-7321b9dc5dcmr559263a34.0.1746649350502;
        Wed, 07 May 2025 13:22:30 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bcf:e46c:46ba:cecd:a52c])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-732109df2dcsm725945a34.9.2025.05.07.13.22.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 13:22:30 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	ryan@testtoast.com,
	macromorgan@hotmail.com,
	p.zabel@pengutronix.de,
	tzimmermann@suse.de,
	maarten.lankhorst@linux.intel.com,
	simona@ffwll.ch,
	airlied@gmail.com,
	mripard@kernel.org,
	samuel@sholland.org,
	jernej.skrabec@gmail.com,
	wens@csie.org,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	Andre Przywara <andre.przywara@arm.com>
Subject: [PATCH V9 04/24] drm: sun4i: de2/de3: refactor mixer initialisation
Date: Wed,  7 May 2025 15:19:23 -0500
Message-ID: <20250507201943.330111-5-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250507201943.330111-1-macroalpha82@gmail.com>
References: <20250507201943.330111-1-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

Now that the DE variant can be selected by enum, take the oppportunity
to factor out some common initialisation code to a separate function.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Ryan Walklin <ryan@testtoast.com>
Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
Reviewed-by: Andre Przywara <andre.przywara@arm.com>
---
Changelog v1..v2:
- Combine base register allocation and initialisation in
  sun8i_mixer_init
- Whitespace fix

Changelog v4..v5:
- Remove trailing whitespace

Changelog v7..v8:
- Remove CSC configuration changes (logically better placed with future
  YUV support) making this the first patch in the series.
---
 drivers/gpu/drm/sun4i/sun8i_mixer.c | 64 +++++++++++++++--------------
 1 file changed, 34 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
index 2252bef19597..41815b42d6d2 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
@@ -425,6 +425,38 @@ static int sun8i_mixer_of_get_id(struct device_node *node)
 	return of_ep.id;
 }
 
+static void sun8i_mixer_init(struct sun8i_mixer *mixer)
+{
+	unsigned int base = sun8i_blender_base(mixer);
+	int plane_cnt, i;
+
+	/* Enable the mixer */
+	regmap_write(mixer->engine.regs, SUN8I_MIXER_GLOBAL_CTL,
+		     SUN8I_MIXER_GLOBAL_CTL_RT_EN);
+
+	/* Set background color to black */
+	regmap_write(mixer->engine.regs, SUN8I_MIXER_BLEND_BKCOLOR(base),
+		     SUN8I_MIXER_BLEND_COLOR_BLACK);
+
+	/*
+	 * Set fill color of bottom plane to black. Generally not needed
+	 * except when VI plane is at bottom (zpos = 0) and enabled.
+	 */
+	regmap_write(mixer->engine.regs, SUN8I_MIXER_BLEND_PIPE_CTL(base),
+		     SUN8I_MIXER_BLEND_PIPE_CTL_FC_EN(0));
+	regmap_write(mixer->engine.regs, SUN8I_MIXER_BLEND_ATTR_FCOLOR(base, 0),
+		     SUN8I_MIXER_BLEND_COLOR_BLACK);
+
+	plane_cnt = mixer->cfg->vi_num + mixer->cfg->ui_num;
+	for (i = 0; i < plane_cnt; i++)
+		regmap_write(mixer->engine.regs,
+			     SUN8I_MIXER_BLEND_MODE(base, i),
+			     SUN8I_MIXER_BLEND_MODE_DEF);
+
+	regmap_update_bits(mixer->engine.regs, SUN8I_MIXER_BLEND_PIPE_CTL(base),
+			   SUN8I_MIXER_BLEND_PIPE_CTL_EN_MSK, 0);
+}
+
 static int sun8i_mixer_bind(struct device *dev, struct device *master,
 			      void *data)
 {
@@ -433,8 +465,6 @@ static int sun8i_mixer_bind(struct device *dev, struct device *master,
 	struct sun4i_drv *drv = drm->dev_private;
 	struct sun8i_mixer *mixer;
 	void __iomem *regs;
-	unsigned int base;
-	int plane_cnt;
 	int i, ret;
 
 	/*
@@ -534,8 +564,6 @@ static int sun8i_mixer_bind(struct device *dev, struct device *master,
 
 	list_add_tail(&mixer->engine.list, &drv->engine_list);
 
-	base = sun8i_blender_base(mixer);
-
 	/* Reset registers and disable unused sub-engines */
 	if (mixer->cfg->de_type == sun8i_mixer_de3) {
 		for (i = 0; i < DE3_MIXER_UNIT_SIZE; i += 4)
@@ -551,7 +579,7 @@ static int sun8i_mixer_bind(struct device *dev, struct device *master,
 		regmap_write(mixer->engine.regs, SUN50I_MIXER_FMT_EN, 0);
 		regmap_write(mixer->engine.regs, SUN50I_MIXER_CDC0_EN, 0);
 		regmap_write(mixer->engine.regs, SUN50I_MIXER_CDC1_EN, 0);
-	} else {
+	} else if (mixer->cfg->de_type == sun8i_mixer_de2) {
 		for (i = 0; i < DE2_MIXER_UNIT_SIZE; i += 4)
 			regmap_write(mixer->engine.regs, i, 0);
 
@@ -564,31 +592,7 @@ static int sun8i_mixer_bind(struct device *dev, struct device *master,
 		regmap_write(mixer->engine.regs, SUN8I_MIXER_DCSC_EN, 0);
 	}
 
-	/* Enable the mixer */
-	regmap_write(mixer->engine.regs, SUN8I_MIXER_GLOBAL_CTL,
-		     SUN8I_MIXER_GLOBAL_CTL_RT_EN);
-
-	/* Set background color to black */
-	regmap_write(mixer->engine.regs, SUN8I_MIXER_BLEND_BKCOLOR(base),
-		     SUN8I_MIXER_BLEND_COLOR_BLACK);
-
-	/*
-	 * Set fill color of bottom plane to black. Generally not needed
-	 * except when VI plane is at bottom (zpos = 0) and enabled.
-	 */
-	regmap_write(mixer->engine.regs, SUN8I_MIXER_BLEND_PIPE_CTL(base),
-		     SUN8I_MIXER_BLEND_PIPE_CTL_FC_EN(0));
-	regmap_write(mixer->engine.regs, SUN8I_MIXER_BLEND_ATTR_FCOLOR(base, 0),
-		     SUN8I_MIXER_BLEND_COLOR_BLACK);
-
-	plane_cnt = mixer->cfg->vi_num + mixer->cfg->ui_num;
-	for (i = 0; i < plane_cnt; i++)
-		regmap_write(mixer->engine.regs,
-			     SUN8I_MIXER_BLEND_MODE(base, i),
-			     SUN8I_MIXER_BLEND_MODE_DEF);
-
-	regmap_update_bits(mixer->engine.regs, SUN8I_MIXER_BLEND_PIPE_CTL(base),
-			   SUN8I_MIXER_BLEND_PIPE_CTL_EN_MSK, 0);
+	sun8i_mixer_init(mixer);
 
 	return 0;
 
-- 
2.43.0

