Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43A441953BA
	for <linux-sunxi@lists.linux.dev>; Sat,  9 Nov 2024 12:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731155730; cv=none; b=A6nt7nJ8j3Ukmta8OQ8lYEvolJUvrhFphFJ+7J3c8sS8B9PEJiwAlL9KM7is4xoMeMeFlmLYeCaT89QDq+oOsJ+Le3AR96mOfar9w10G4wYzolJ2yqP9slQByvy3j15GErx16FkB9UkxJqTanUOgvUJTkeiuDq0o+VwzM/Bifv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731155730; c=relaxed/simple;
	bh=bVuetdndH1+H+sM8qub00TaR8PUlbIR46HTQjmQ2vjc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Dgbf+PAxfIM4KSo2abHtNpUMnAaxxYfbgr9vXpuCRs2PEVIYkcn4VQMhvCmLkr/NYvNl1uEuWZESzGYFSmmdBiyJMitZf7VbGGs6FTVXeSuPLY1eu6L0EVUWyrpf3BJZBcqyXPl3tnjDeBkcQhschpKANMoYNJSDuCdIUPMI9/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nhxWcMSg; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nhxWcMSg"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-539fe02c386so3998464e87.0
        for <linux-sunxi@lists.linux.dev>; Sat, 09 Nov 2024 04:35:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731155727; x=1731760527; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rhftGPVLtDhe2UTpRu1zgEjgWPv2gRVws0y4aDafrjo=;
        b=nhxWcMSgsg3Ogf63V33seM1l+OJ9XMdTfIm49gSe14tnc8qkr91bdOvuZya2eE2lMc
         ZFDprV45Om32XrIwd9a3HRe2lxGIrK+21m02wSCFvBvZtgvm1SpO5G0bHO5h0jFygdfW
         XC2AQA1aMD90K4z+Jkv2TbjfgCJH+bIHmLsNgnPCec0vT3r+zKzNnZ/0iyo3wpfeS4uH
         PnsqFWeL8k6Aw047sqA/+xJLgdFAnnDyW2SXC7NpeziSyhCnu5IG9nT10YC38gsJ8+N5
         bbFpAPAxlyUYNw2EZOppS/n2/XWmZIbEerRIjYWX5GBaKJE1FR2XM8Ko2BeqwNF9NI/2
         Vn0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731155727; x=1731760527;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rhftGPVLtDhe2UTpRu1zgEjgWPv2gRVws0y4aDafrjo=;
        b=engDkjQhaYQ8h+kdg6HAMJqJtU3IiPpBVVHqEUWNywoykxt1q0mhQ54eMX29a19eLR
         Ef9ML6yXT5gpN0XDyWwaOFuWiHJvqRx/3u9Zb7xHipWTBRrTw8tczmqeTc+vkcGcQOZa
         dn3i9iy5CSUrhkUh4FsBz1VFLNDiDgXZ7dLodPuASwFbz2yqmqrn+qSssITCzem9RmJF
         p1+DPpYHi3HeZFCi3q158ouU8PuaYzfSI6MFi7xxHXRKFoBqwvApv1qplojJO7f5eqhf
         Eb7gJZ1dXIgYVzFkHejYSbQrxNwQWIzaJ8mQwCqEWgPRgiVNsoU8pXuPr52emZv7XYE+
         I1PQ==
X-Forwarded-Encrypted: i=1; AJvYcCXFKWrSE4jJ1DajkDIOTiYEdDjd4J8IBnjfOHIdjP89oyUefU4vDWxowIMi5CBCfiyAdHGJvJgnOajPSw==@lists.linux.dev
X-Gm-Message-State: AOJu0YySjCMMu31uvEPujl5h8zHprFNxAq71FkTS/x2RO9na3oKa6Q1+
	zTOhn7rn/ZDGu/r5ridlhk8eh+nv9+iVYfvb4wGVsKcqzuZ/Tu4yTZ9mr3Weu2s=
X-Google-Smtp-Source: AGHT+IEigUfK1s5B1XhS9sfEmdo+maxC2U8AZO/uY92umN9wYkTsgVSKNmZyXdmp1QCMyrfV4W+TfA==
X-Received: by 2002:a05:6512:31cc:b0:539:e1a7:345d with SMTP id 2adb3069b0e04-53d866c94cbmr2232719e87.10.1731155727195;
        Sat, 09 Nov 2024 04:35:27 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53d826784dbsm922899e87.15.2024.11.09.04.35.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Nov 2024 04:35:25 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 09 Nov 2024 14:35:09 +0200
Subject: [PATCH v3 5/7] drm/bridge: lontium-lt9611: drop TMDS char rate
 check in mode_valid
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241109-hdmi-mode-valid-v3-5-5348c2368076@linaro.org>
References: <20241109-hdmi-mode-valid-v3-0-5348c2368076@linaro.org>
In-Reply-To: <20241109-hdmi-mode-valid-v3-0-5348c2368076@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1393;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=bVuetdndH1+H+sM8qub00TaR8PUlbIR46HTQjmQ2vjc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnL1b/ZfMsGkQ52uI+m656a0A3dgPEqlPCAieD6
 1QAsnoR/kuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZy9W/wAKCRCLPIo+Aiko
 1eNxB/wJULjX0l8Lz4aRPnuWR70dfZVJYrQkpc+zPAuribEC0F0j7hQNWkmczAezUyvVpgP+Fgh
 04j4uyP1p4ZjZjgOqT7vq+wr3pCtkA/QWAIopDvYotWFldcsgLXdYCtpZskcTOcaG5rGGFCyTyU
 eNJhP0NRQ+UKJrK/n9t+WRARtDE9xjju194IYz61poLEPBdhGQVMp2rdhYyF6My5hgikZ4N6oq+
 a4ut24LnuuY50GSMoRukcFdytXScvNZQgHpSrxvkTvQvMdx2jsx70hJE59nYLmCcQpNLcXQ3z4x
 JeLtLBiJCB09gw/tvJDQ6ZibiPFWU4BeltZf1zuT3eU5stU+
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Drop manual check of the TMDS char rate in the mode_valid callback. This
check is now being performed by the core.

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
Reviewed-by: Maxime Ripard <mripard@kernel.org>
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

