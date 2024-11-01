Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F1DF1BC2A
	for <linux-sunxi@lists.linux.dev>; Fri,  1 Nov 2024 00:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730420721; cv=none; b=VteT234d44J5cqmNFnLeceOcqmOMt0erTtQrhLpCy9IblyRaGQmTud7kF7yQj2twFGX48n/TI61VK1CW9BMxJ0BA9RK5lI/0PWdoOzkPCCWO74v34jcdpfCVwK5pipTzCt9J0N94K2LAv8dKM5tDx4bUAeaO7jG41tW+oYPhst8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730420721; c=relaxed/simple;
	bh=7WdeDK9PVMnPHS0xN6wrfKPJv4ESCzGwmvZnGPcMZ/4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CjhKtGg5OH6KcKrdnuVnYIioiqdIVe6sdXS69RMoA9px+GfhqLBZ9inbA4pzcwthv5Xm1EAwnQfzZU0qBj5x4Xp4XZPP9ETlQqf8JmO4z8SFvrogpmcefK2h1L7kThitHF1zM/GWqzYio2ZIEowbs/fqMVxTcjtFDrVZbCPfGts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YlrJ42Df; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YlrJ42Df"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-539f58c68c5so2812241e87.3
        for <linux-sunxi@lists.linux.dev>; Thu, 31 Oct 2024 17:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730420713; x=1731025513; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YdWiUnW6vTgN40+31xk3R74ZtFvE1HPhsssihDLePE8=;
        b=YlrJ42Df7p/TseuEEFmEtVDVQu19utbC7ogdxIisSCUhLwfYSNb9MufT9bJAg1Vtdp
         JjRvqx37pqMtrHtvg9WXKvEbgUuo4ACD/53EisZIBoOaOCaU1AVNNEPHoQjdeUPywZWJ
         ob+jVHu4hyiaE1N6JZdwwEBhj7QOy157fdDsxoUh01Us3dAV+dkDinoREXhP9Edt3gMD
         ivcc7QuCuD53nhdkDWgTNNIbm0cgTrX0o0Oee/pILK4uFKdstYD+iXuNsQc4KHzeL63S
         phWnKljj9vjBdf3afMIGlZ8lGU7DRNtPOlCfNlQVjWDv1onlHQFsXoNoas8XzOUmyoID
         +itQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730420713; x=1731025513;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YdWiUnW6vTgN40+31xk3R74ZtFvE1HPhsssihDLePE8=;
        b=Xw74zSpTBZIk94PKt2b2UG0PyVY4X+27qBfsWhZ28ULajAsIXMNX+C7Z+DrUMXQTYu
         y6Z1au3hXNUBEG4LQ6QqRVOQjXeHmpLGZuFAlWRwJpO6jN4Pw4aNu0rOJDvOtyybmGNk
         xiL475SZ+PxYpm5rjW9ztF5MwWusZ22c1TjhesT6n4aqR5+pFT1P0VqB5T2/YOuwlCvu
         o12KyxPX3yEKYtjGzpIJzyw6pLQe0nqW8Cqh9DmRjGmlzwrZzZqJuTufvB2+v5GvRina
         PAuduXAeEHm2AG+V6iVihINF0mRLv1Ou2hz1GZACHWrqV38XAvarEh0xwGmRREzEc299
         29Pg==
X-Forwarded-Encrypted: i=1; AJvYcCViSE6F6jR6Bqa6oFj2kyjoNwBt9gpuFW3UqF6pWGDdcuS6OcUARb6LjWOg35j1PENjkd2kqE29CvbwRw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyZQNyrBYN58K4XdU6lPuIv5mjGF3vZqQ2x9xtVkY+kXFyBa1nO
	6vf2KD/NyzMB/Sw/E4JlkmK/RGkGZF7BQlpgmk5FSHwUtpZOjopIEKMU9MZKci+C7MFoDDGZ8P9
	Q
X-Google-Smtp-Source: AGHT+IGbq8fCpRY1c1bmmg92095C0kqytUrIWwSrZUXkLxY5mzg2koxLARty7zdJQk9WrWqL2+9CxQ==
X-Received: by 2002:a05:6512:ba0:b0:53c:74a7:43de with SMTP id 2adb3069b0e04-53d65df2488mr1464938e87.29.1730420713436;
        Thu, 31 Oct 2024 17:25:13 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53c7bcce489sm371153e87.127.2024.10.31.17.25.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 17:25:12 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 01 Nov 2024 02:25:05 +0200
Subject: [PATCH v2 2/6] drm/sun4i: use drm_hdmi_connector_mode_valid()
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241101-hdmi-mode-valid-v2-2-a6478fd20fa6@linaro.org>
References: <20241101-hdmi-mode-valid-v2-0-a6478fd20fa6@linaro.org>
In-Reply-To: <20241101-hdmi-mode-valid-v2-0-a6478fd20fa6@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1574;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=7WdeDK9PVMnPHS0xN6wrfKPJv4ESCzGwmvZnGPcMZ/4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnJB/hVs8ck2mIuOojDf5BsZyDpCAOCNbvDgTjB
 eEdeVyvSe6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZyQf4QAKCRCLPIo+Aiko
 1bLuB/9NYYP+2gWguXV7p7pxvci6OEsal/Vmy8LRfAO4mZDqwSPpZaLvK3tQVnCC2tplz45RV62
 KH7xpFWZe4L9XV8JIyduCPu3BEZe8cdEHSNio4pUw2nXKz8fuaj/73N0DEwpQF87bixbIKyB11p
 EjmlZKOFvHTJ7yeuUgUUiKM6X+RDLGiXX/Qof/VMIgQjhJT0Q4qmUg2B351WDikp1lpmyRxfTpd
 eX0xqtaokT6BLTm64axs7FFb8od8hvVrsfpfiH3FuPtsW6Ca6XVMAIb4t7YNGUs/h7Ob4NcwJJ8
 xbghQayNSZROF+m19E/pCBd8Dbmht0Ig9PpLzYlQ1LJDdDRt
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Use new drm_hdmi_connector_mode_valid() helper instead of a
module-specific copy.

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
index b3649449de3026784ae2f3466906403a0b6e3b47..54b72fe220afacc208b3fd48d5160031127ea14a 100644
--- a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
+++ b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
@@ -205,16 +205,6 @@ static int sun4i_hdmi_connector_atomic_check(struct drm_connector *connector,
 	return 0;
 }
 
-static enum drm_mode_status
-sun4i_hdmi_connector_mode_valid(struct drm_connector *connector,
-				struct drm_display_mode *mode)
-{
-	unsigned long long rate = drm_hdmi_compute_mode_clock(mode, 8,
-							      HDMI_COLORSPACE_RGB);
-
-	return sun4i_hdmi_connector_clock_valid(connector, mode, rate);
-}
-
 static int sun4i_hdmi_get_modes(struct drm_connector *connector)
 {
 	struct sun4i_hdmi *hdmi = drm_connector_to_sun4i_hdmi(connector);
@@ -269,7 +259,7 @@ static const struct drm_connector_hdmi_funcs sun4i_hdmi_hdmi_connector_funcs = {
 
 static const struct drm_connector_helper_funcs sun4i_hdmi_connector_helper_funcs = {
 	.atomic_check	= sun4i_hdmi_connector_atomic_check,
-	.mode_valid	= sun4i_hdmi_connector_mode_valid,
+	.mode_valid	= drm_hdmi_connector_mode_valid,
 	.get_modes	= sun4i_hdmi_get_modes,
 };
 

-- 
2.39.5

