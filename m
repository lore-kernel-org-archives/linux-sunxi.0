Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCC86345CA1
	for <linux-sunxi@lists.linux.dev>; Tue,  4 Nov 2025 18:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762279834; cv=none; b=JaCefWmSTVZh0pxnkUDweb4F3xKEjN1wUuh6PfzVVKmqmX8cvba36QXkCgWMLmZLGQ7vKtf+s+7E0icS17UJ8Iam1qMbULyvyPSO8E3gdgXXIiKmJdZOWviVnKIjhQemzbWGT8AHfb0CsQOizbykYGrkP+p1p5iyRAPUC/y+15A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762279834; c=relaxed/simple;
	bh=KowVKeJ70bqoIp+99jXhG6SP3UVn0OWkvuzyT/VB0wo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BDvNQ4DGeX7ATh658tqp8fDUa3bHiu0P9F8kd7A0hcrsLifdbw/YvSuIIQvVFy3ls7+O9YKrBOYr/tqZcYvVr3njxHUZwP1Eu10scwpNiSMgKZxM6ArasHKyMnd/A8UyHQDa5u0EcBTei4yO8Z37lvpKNgHzx0Euomz5GeOBbfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b0e0tNZa; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b0e0tNZa"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-47117f92e32so47880405e9.1
        for <linux-sunxi@lists.linux.dev>; Tue, 04 Nov 2025 10:10:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762279831; x=1762884631; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hJ4iKgm80T4FXqrGlRaNuAcAySKRsjOyr7WXu8sKn/8=;
        b=b0e0tNZaeMPp9ChRy02zPB6qLNJFPy1pv46coHvPcoGy/4dRHPY8bDSVss5/7bUx6M
         qk3qf2QSIQcNefV4PdK6BSdWe6bVKxcpdb+7xewVHih8ZG4BhN5LAbshyr745cZyysbF
         iNC9r/2wL3BduNFiRBgr4/1+HFErb9AE1mT+/Cjvy/010RY5ya5fNRQX2hNtWQ4Wx5pe
         0jyT1hCFXW/Pd3o/D+zWhnCYtCe/pq+FR0InwK8GVQBBpKPxK/9Xx7DST8Y9hXTbGTcc
         BuyH7jCZepJS275X/zp8f3uBq+ZIzPhXJ4MZO4joduTAm5Jc4y8tDjBSsyY6YU/5fUvl
         0Hjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762279831; x=1762884631;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hJ4iKgm80T4FXqrGlRaNuAcAySKRsjOyr7WXu8sKn/8=;
        b=q+oCbdbkhLvUnAQ+5Rg/S3FhNyzToThghUr7KorESTIygjqRWPyJ8/wCt2V06R2HDO
         NWLsnu5+PsPKqR64WkUch3y71bkNXqSSXOuEbp2fmRPta+eiTzjcJaLUfJ+9pk2hKSH9
         IO9c5wJ9NLivj28XnlAuMMJ6D1/c2p3c4LRg54fsrPThS1CQ5uM/9BWQiq5zdJ/CaHf6
         6odmXbPm2ShgGaxmlUAYqw/zLP7yqEGhaLW+wBo+/IGj2MAZp8FeOJl2GDbr7Ag+D4i8
         bE3LPEiuBegYf7mJM4oitb7p+33NaparguI4p7aePf5HPaGO3J9X29rCrDVOXDlZIJn1
         k3UA==
X-Forwarded-Encrypted: i=1; AJvYcCV38IYbdzRKLP8zxtcHfkskEXMvPoBiXkyHczLBrvnvLWdB36Xxxu+whd0T/S65Ii2dCC2PuTFp80Lg8A==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx6THeZ9OLCvA5z3axJ7mQ4fz+8bRJ+knCYtxCJAkYY8wp+KSBR
	voM4vtM/bCc3sj3x/jHXKPkyb+wkQq5dd2NXgZ07v/p15vgbVQDd9p+AmG3H8w==
X-Gm-Gg: ASbGncuyJ2VLf314GG605SIrMzp1ttm0Xsnk/67qu+8eLMAYTVxxEqq44dWEvcXwjLd
	mdrxa/JaWRbJCVg/kAHj+2HtWu2tYWYy0a+ZFc8ZQbPUtmQJPTTriJx6T13w+Emhko8jyEUkVcG
	GtqeNsIOEgd5iLPNxjX/yMNqcwEptwVEqv/St29VCL8qsXZhYc9bh8qBEbs/d59qub0PFZziHoQ
	uMR6OJyIK2wedQ9jxb48NdeTJ21gzwcox72ENB3ZXg6HmCup0w88/zR47J3Elh0yQEXpkjYxlg5
	/YyWlhW4/rFjHrR9YXIbofm3McACL6UUGOoy0v0RZ/9vi3xgrNooge4UBSGROGZ5Olbk5rHJ8uA
	jE0hvw+qub9zKMoH9sG0Vx/PxZWGx1r2/4ij3mN2PLRdGKigrPTx/ndRTBNs8iNdwH2NjbNknGy
	3LWXUdb7eKIOjhm+Dn34yEoZLtTloR
X-Google-Smtp-Source: AGHT+IHkpIC3aSMOHY0XvNH+UoXWk3HEri1Jf6ytHO5K5mDJ0+pJHIyqN7z61F+ww/rx9c/Kck19GA==
X-Received: by 2002:a05:600d:8381:b0:46e:376c:b1f0 with SMTP id 5b1f17b1804b1-4775ce9bc74mr1190495e9.7.1762279830853;
        Tue, 04 Nov 2025 10:10:30 -0800 (PST)
Received: from jernej-laptop ([178.79.73.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477558c1a03sm24688685e9.2.2025.11.04.10.10.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 10:10:30 -0800 (PST)
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
Subject: [PATCH v2 23/30] drm/sun4i: vi_scaler: Update DE33 base calculation
Date: Tue,  4 Nov 2025 19:09:35 +0100
Message-ID: <20251104180942.61538-24-jernej.skrabec@gmail.com>
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

Now that channel base calculation is straightforward, let's update VI
scaler base calculation to be simpler. At the same time, also introduce
macro to avoid magic numbers.

Note, reason why current magic value and new macro value isn't the same
is because sun8i_channel_base() already introduces offset to channel
registers. Previous value is just the difference to VI scaler registers.
However, new code calculates scaler base from channel base. This is also
easier to understand when looking into BSP driver. Macro value can be
easily found whereas old diff value was not.

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
Tested-by: Ryan Walklin <ryan@testtoast.com>
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_vi_scaler.c | 3 ++-
 drivers/gpu/drm/sun4i/sun8i_vi_scaler.h | 2 ++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_scaler.c b/drivers/gpu/drm/sun4i/sun8i_vi_scaler.c
index 0e308feb492a..fe0bb1de6f08 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_scaler.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_scaler.c
@@ -836,7 +836,8 @@ static const u32 bicubic4coefftab32[480] = {
 static u32 sun8i_vi_scaler_base(struct sun8i_mixer *mixer, int channel)
 {
 	if (mixer->cfg->de_type == SUN8I_MIXER_DE33)
-		return sun8i_channel_base(mixer, channel) + 0x3000;
+		return DE33_VI_SCALER_UNIT_BASE +
+		       DE33_CH_SIZE * channel;
 	else if (mixer->cfg->de_type == SUN8I_MIXER_DE3)
 		return DE3_VI_SCALER_UNIT_BASE +
 		       DE3_VI_SCALER_UNIT_SIZE * channel;
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_scaler.h b/drivers/gpu/drm/sun4i/sun8i_vi_scaler.h
index 73eecc4d1b1d..245fe2f431c3 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_scaler.h
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_scaler.h
@@ -18,6 +18,8 @@
 #define DE3_VI_SCALER_UNIT_BASE 0x20000
 #define DE3_VI_SCALER_UNIT_SIZE 0x08000
 
+#define DE33_VI_SCALER_UNIT_BASE 0x4000
+
 /* this two macros assumes 16 fractional bits which is standard in DRM */
 #define SUN8I_VI_SCALER_SCALE_MIN		1
 #define SUN8I_VI_SCALER_SCALE_MAX		((1UL << 20) - 1)
-- 
2.51.2

