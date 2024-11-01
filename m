Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 589703B796
	for <linux-sunxi@lists.linux.dev>; Fri,  1 Nov 2024 00:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730420729; cv=none; b=GCfV/lxZArAmkL9UimZ7cK45f6zYYTaur9B6qqUS0p4JV3Jsinzlv85p7A2SXueOORPV4NOmtIimA23EbEg+1uFHqan/uPHc31EPk2yp1mpetx4eMkaodovH/Jnt5GxqK+X+ScCIt0dlbanZ2dU+RipKkNrBRitNaMsQ0rEP0qA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730420729; c=relaxed/simple;
	bh=2cAY9yTx7ywPgJgHfm9Yb5s7i+clqrcNRhwPtafGQxY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RcuORYfR3uWhhGOMejzSjDgwVOor1uM9nZGARyfNWKTIWN4Qf/atuBPdbXcH48FvaYrLxBIEJJEjRry4afv7J/LeVEBnGC5YjRGP04tn73JV072YGeGIOR3qBKEncN6HXosmLpDffiZeq0O8nvnur4FKIT8zsH6dTop8j/NfiGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EtZIqAJW; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EtZIqAJW"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-539ebb5a20aso1574412e87.2
        for <linux-sunxi@lists.linux.dev>; Thu, 31 Oct 2024 17:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730420721; x=1731025521; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L5YSV0GHN6tODKa+I9kvPXfXQWz+eBBIeCxWrWSu71k=;
        b=EtZIqAJWS4PZcKNDi/papSw383bjhL0lqukSunEkM6Uq/EWi3tl4pCcCNgJZYQMi/K
         leOGvQ1ZL6AfPKB3nu5owHJN5W70SkvwiJYmk8zZdwkb5CKllYHSZnhoBVViqSPuk6yP
         zWZmrVx2B+lkQ1WNYLmdGuScjklHtM1JB44GQoH99+GM38UTVWA5OxgWukNarVv9NIml
         ioOt08jMXCqNCBzYB0QQ6BssW+PeOvXPt1u34DIAfh+anwDtntDzDVnlJ3jz1tdg6OoV
         zVOR0nlUeritbfK3X24KfdpUp4s1GUfG+Wozya3Rv/bMiq6ERhZ8jqGIQ/Qru5XrqZLC
         ik5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730420721; x=1731025521;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L5YSV0GHN6tODKa+I9kvPXfXQWz+eBBIeCxWrWSu71k=;
        b=BLucf0Kg4SAInnFlDVUiKpjc6aXkSCHipBH+SR9cW3YWTJ1h3d0xszqFQL0khMw2Ix
         Rg5HLP2cmubL5twVEvf/oKWUS0NtXjOfkRt+xlveoqAjjpMhjKMFG8fi06ky7nekIaJH
         ac037MORj5S37ecsXQH9dHH/LSoG9uTxY8yXp93IiVezOyhloBHV9t8Gcra+XdjviKvk
         qAg2pkzoo+MG0MztQuhvXYAmnzfRtJUYU2eZ+PeSbGgckjuFYo1XOZZrx4E8ew+xc3Um
         gMrWc3G1wicA39dOd+v/3qR4ce5o9vyYFHjy88uipZxaEwlv90wjJ91uqd9qFb3os8Mn
         N9HQ==
X-Forwarded-Encrypted: i=1; AJvYcCVLYuBj+zf/oJ8xpJ5+ulaIZJ0bGcR9mdh+0DG132gmTHsWfkIfawNjMPqIx6yqgO6/LWzN1UmGQgbztg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzOjhLYBylp4EyaGIIaHPXnbNQ8RUQn/A+1r5McyN6Y0hzpAwVI
	edIxp4HnCDjELtpLMF169MnPb8ef1Ymi7otqV5bl2Ydkn7tzeOAbrO8TtUK/xqQ=
X-Google-Smtp-Source: AGHT+IH+Z352s483KbHjtU5VVJ6ZByUM9w51iqApUCzupb2q+5C0iuOE0kUGC7cK9WZXbJJqsjEwvg==
X-Received: by 2002:a05:6512:31cb:b0:539:e436:f1cd with SMTP id 2adb3069b0e04-53d65de60eamr1039132e87.16.1730420721328;
        Thu, 31 Oct 2024 17:25:21 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53c7bcce489sm371153e87.127.2024.10.31.17.25.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 17:25:20 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 01 Nov 2024 02:25:08 +0200
Subject: [PATCH v2 5/6] drm/bridge: lontium-lt9611: drop TMDS char rate
 check in mode_valid
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241101-hdmi-mode-valid-v2-5-a6478fd20fa6@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1344;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=2cAY9yTx7ywPgJgHfm9Yb5s7i+clqrcNRhwPtafGQxY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnJB/igzsmQyIppH1aHxewnBY4Uhlduz4k+yAau
 9lDSDvbvv6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZyQf4gAKCRCLPIo+Aiko
 1RyvB/9WSZ4mNeqd6GCGzKzlegONFJkuLiNKth6QBGTxQ//vKPOg3+AtwZwoekG8i/XcF3v32K4
 65STYUOFY1I/FgP221HjXjV3D9ECFQLDGGeKhm7aLPml3ejppcxSFCoSMIczoSfyYm5k1G2xoKr
 fCCE4IU+aSG01lp6cHyXCQG6y9YHZs864O0vGh0SgHH1N6SeLGRb4NG2Fe3MKhnXwjYwEcYpOyU
 J2lEr7q8KPfcvWjBZZzLDqwPmQ9c8C5h1xKOssI4DO3MY56kui4eN8trJfFkVfWm0Fg46xuPxrQ
 6aBgbPv0pAwW/CBUvWVI6roTVlburpPQoWsR3WuP+sPFeVDU
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Drop manual check of the TMDS char rate in the mode_valid callback. This
check is now being performed by the core.

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/bridge/lontium-lt9611.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
index 1b31fdebe164063e6f3972fdf8a5801ef4c35c4e..b8ccffdf515ade6e3bf863edbedc41e6f2030f29 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
@@ -757,7 +757,6 @@ static enum drm_mode_status lt9611_bridge_mode_valid(struct drm_bridge *bridge,
 						     const struct drm_display_mode *mode)
 {
 	struct lt9611 *lt9611 = bridge_to_lt9611(bridge);
-	unsigned long long rate;
 
 	if (mode->hdisplay > 3840)
 		return MODE_BAD_HVALUE;
@@ -765,8 +764,7 @@ static enum drm_mode_status lt9611_bridge_mode_valid(struct drm_bridge *bridge,
 	if (mode->hdisplay > 2000 && !lt9611->dsi1_node)
 		return MODE_PANEL;
 
-	rate = drm_hdmi_compute_mode_clock(mode, 8, HDMI_COLORSPACE_RGB);
-	return bridge->funcs->hdmi_tmds_char_rate_valid(bridge, mode, rate);
+	return MODE_OK;
 }
 
 static int lt9611_bridge_atomic_check(struct drm_bridge *bridge,

-- 
2.39.5

