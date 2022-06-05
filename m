Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D3AC46B0
	for <linux-sunxi@lists.linux.dev>; Sun,  5 Jun 2022 09:41:02 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id m20so23684886ejj.10
        for <linux-sunxi@lists.linux.dev>; Sun, 05 Jun 2022 02:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DhfJ8Vbs3H5rmwl9R/OPOQbDlu4cgubnQOXlVvnJ8XM=;
        b=mOQkSwye820r1FKdsZutlM9eSUJKpNAnIeEW3h1hw3pJpNQkcIX7WmhcZ7L9p/yk1B
         G8OJN4NdgfFi1sixdvbKsmjP4yuJcurJFlpD3c1O8JNC7NHV8jWo337y7dm5+5p7NbAy
         xjjLdat36kRx29QbdBP7GfoRX0HyMy72rpam+ZNaVbBI0hdhdCTPTrm2YL2ZEcrKge8u
         fzQOpaL/JwnB59Sh+O5T6LMtd5hnptqEtG7fdJII0sfDioFtC7UUdBYgwvl2KwGbMe9l
         81HZ05saCykmbY7k0z29JnhVz4cf5xyxvxMJZLe3P0sdBYyW9T5micD6xgbQp4NXZmfM
         otQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DhfJ8Vbs3H5rmwl9R/OPOQbDlu4cgubnQOXlVvnJ8XM=;
        b=1WOQYbMFKd++5fJHsLg4RjBxyfw6+ukvdZluruXPsH/KTluuLNaTLCrGYw8Nj7ArVw
         w4+4Xs0oaJZ11dCw4zk+MCMYNoi3OS3a+BbQaqedWoHNnK+NVFmjVHYPnlze/yiRnkud
         sEwn7xUPfyCJV32iIJC+VJsAAvY8+Jf+5EFx89LYoL7BBR0W+pR1b0XdTl6Kl1URLK2s
         sZnnxEQMrrU1qG6ZAqaAokOh4H2zkfLXsvND/0d24U/iuyi6xnq0IksxbB1FViTVsXmP
         Bs4FhWPTuPcWdfdv2QYfSKBIWMnxyR7rCWxVJkUHnwQymQhCAZ8WL7e9l7OEfxJWAy6S
         Ei/Q==
X-Gm-Message-State: AOAM531BIuEcO1gmZTR1lGASo089Tgf/Z0v1GHeakmq0+LuY9VAWa+Zc
	S+o+3MZ7GWX/1Ekb6ltvrKE=
X-Google-Smtp-Source: ABdhPJxndU5trzyMzutaIfO7WYpzqjFkxUDj+CyOBND1p38sWX2rvYJITyUyDqp31HpwKS/1znQpzQ==
X-Received: by 2002:a17:906:4fc4:b0:6da:b4c6:fadb with SMTP id i4-20020a1709064fc400b006dab4c6fadbmr17175123ejw.282.1654422060788;
        Sun, 05 Jun 2022 02:41:00 -0700 (PDT)
Received: from orangepi3.mydomain.example ([195.234.74.2])
        by smtp.gmail.com with ESMTPSA id kl10-20020a170907994a00b006fec69a3978sm4970837ejc.207.2022.06.05.02.40.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jun 2022 02:41:00 -0700 (PDT)
From: Roman Stratiienko <r.stratiienko@gmail.com>
To: mripard@kernel.org,
	wens@csie.org,
	jernej.skrabec@gmail.com,
	airlied@linux.ie,
	daniel@ffwll.ch,
	samuel@sholland.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	megi@xff.cz
Cc: Roman Stratiienko <r.stratiienko@gmail.com>
Subject: [PATCH v2] drm/sun4i: Enable output signal premultiplication for DE2/DE3
Date: Sun,  5 Jun 2022 09:40:18 +0000
Message-Id: <20220605094018.9782-1-r.stratiienko@gmail.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Otherwise alpha value is discarded, resulting incorrect pixel
apperance on the display.

This also fixes missing transparency for the most bottom layer.

Test applications and videos w/ w/o this patch are available at [1].

[1]: https://github.com/GloDroid/glodroid_tests/issues/1
Signed-off-by: Roman Stratiienko <r.stratiienko@gmail.com>

---
Changelog:

V2: Added code hunk missing in v1
---
 drivers/gpu/drm/sun4i/sun8i_mixer.c | 5 +++--
 drivers/gpu/drm/sun4i/sun8i_mixer.h | 1 +
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
index 6b1711a9a71f..ba2932aaed08 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
@@ -320,8 +320,9 @@ static void sun8i_mixer_mode_set(struct sunxi_engine *engine,
 	else
 		val = 0;
 
-	regmap_update_bits(engine->regs, SUN8I_MIXER_BLEND_OUTCTL(bld_base),
-			   SUN8I_MIXER_BLEND_OUTCTL_INTERLACED, val);
+	val |= SUN8I_MIXER_BLEND_OUTCTL_PREMULTIPLY;
+
+	regmap_write(engine->regs, SUN8I_MIXER_BLEND_OUTCTL(bld_base), val);
 
 	DRM_DEBUG_DRIVER("Switching display mixer interlaced mode %s\n",
 			 interlaced ? "on" : "off");
diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.h b/drivers/gpu/drm/sun4i/sun8i_mixer.h
index ebfc276b2464..bc12c95af6f3 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.h
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.h
@@ -65,6 +65,7 @@
 #define SUN8I_MIXER_BLEND_ROUTE_PIPE_MSK(n)	(0xf << ((n) << 2))
 #define SUN8I_MIXER_BLEND_ROUTE_PIPE_SHIFT(n)	((n) << 2)
 
+#define SUN8I_MIXER_BLEND_OUTCTL_PREMULTIPLY	BIT(0)
 #define SUN8I_MIXER_BLEND_OUTCTL_INTERLACED	BIT(1)
 
 #define SUN50I_MIXER_BLEND_CSC_CTL_EN(ch)	BIT(ch)
-- 
2.30.2

