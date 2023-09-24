Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93ED0DDDC
	for <linux-sunxi@lists.linux.dev>; Sun, 24 Sep 2023 19:26:15 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-9b275afb6abso281652166b.1
        for <linux-sunxi@lists.linux.dev>; Sun, 24 Sep 2023 12:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695583574; x=1696188374; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d66F58Zyq56V9Vs4Hyo0TkmljKT89gyNoM7Khlph/EE=;
        b=mB6YQSTPBmzsAZNYpz1xg1AGlGCsDY3+QyTp0LEuz/ol3CV6oEu9+R4rK3Joxujjnn
         gK5E5SzT/QRnpI1qowt3u7I23P6Q2qcbcujw8k1TukFB/LGjxcLVcPilFMYAEUE/q1K3
         UB6fV7LDHX64QSyxIrNLG65aHgOdV3a0Pl0XRGhl0YhK5gu4FvH0j41aUnfNgRlidsiY
         rIwhncBCzXpn/Wcjit20mKzL3yos6ZYVF1Me2O47aYfSXbRuNGWFlf6aCVFMjsaYqzxI
         3dubskQRjIcrLGhyTjRGP/WlIxBYDVIUDR+RZ2vPu8nCaI5JmPwKclGYpa3v/5rMZnnT
         66rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695583574; x=1696188374;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d66F58Zyq56V9Vs4Hyo0TkmljKT89gyNoM7Khlph/EE=;
        b=XuKUnXGH221QvwdCB2BIfKfL1UvGBb2BXvsn+l52VBhqmNuMM/+1QYMCFvOfK4WIGF
         N8fBr1ZnhrzwNruWI1g/ngJ+STXYaRuzmDXLIXHuh7qhxbMOqYVle75eDmJYvk4Uhk2P
         I6dT2KZvV+695Oj1oxw0jI/wmghVjllsrG3WuoQ8uhBN64SWO7xrPdDNNSd72HjkbnJx
         oYpJ2CGLi3m5Zp1WBhdkPPInYN8vflflTtwEuu/R8AyK2B8VxvZuTS3MGQsLqqxcLIrp
         sZgOAHUu4h7Vjlujjrc4MybHS2xc+nN7eV8MGFgm2huwHn7eUXveFpJ3WLfWDfncUpvH
         B09w==
X-Gm-Message-State: AOJu0YxRi4wuSnZMjDkn0diQKauTZwgu2c7Sd1oDPXpovxn8Kejqycey
	0v0Nr29hx4L7K37m24M+hTw=
X-Google-Smtp-Source: AGHT+IGtAxBgqINvPVkn897Kub7Z+3KXI91OPf9r4wroQNRiKNPXXt+0g0rub6eEA+V8/peXL8DyGw==
X-Received: by 2002:a17:906:74d3:b0:9ae:614e:4560 with SMTP id z19-20020a17090674d300b009ae614e4560mr7802850ejl.29.1695583573619;
        Sun, 24 Sep 2023 12:26:13 -0700 (PDT)
Received: from localhost.localdomain (82-149-12-148.dynamic.telemach.net. [82.149.12.148])
        by smtp.gmail.com with ESMTPSA id z21-20020a1709063a1500b0099d0c0bb92bsm5317632eje.80.2023.09.24.12.26.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Sep 2023 12:26:13 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: mripard@kernel.org,
	wens@csie.org
Cc: airlied@gmail.com,
	daniel@ffwll.ch,
	samuel@sholland.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 1/7] drm/sun4i: dw-hdmi: Deinit PHY in fail path
Date: Sun, 24 Sep 2023 21:25:58 +0200
Message-ID: <20230924192604.3262187-2-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230924192604.3262187-1-jernej.skrabec@gmail.com>
References: <20230924192604.3262187-1-jernej.skrabec@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 9bf3797796f5 ("drm/sun4i: dw-hdmi: Make HDMI PHY into a platform
device") removed code for PHY deinitialization in fail path.

Add it back.

Fixes: 9bf3797796f5 ("drm/sun4i: dw-hdmi: Make HDMI PHY into a platform device")
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
index 4727dfaa8fb9..0b647b030b15 100644
--- a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
+++ b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
@@ -203,6 +203,7 @@ static int sun8i_dw_hdmi_bind(struct device *dev, struct device *master,
 
 cleanup_encoder:
 	drm_encoder_cleanup(encoder);
+	sun8i_hdmi_phy_deinit(hdmi->phy);
 err_disable_clk_tmds:
 	clk_disable_unprepare(hdmi->clk_tmds);
 err_assert_ctrl_reset:
-- 
2.42.0

