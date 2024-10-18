Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61F01212D27
	for <linux-sunxi@lists.linux.dev>; Fri, 18 Oct 2024 20:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729283684; cv=none; b=QMa3YDLq3yWbWBv21Khl0J6qs1kEL1bhsLdFSiMjfeg20PS2WyDpT4eoaEUeeZhYbKkSeH1bsVJEsq2fpKAzhCqZb0kxMzUjBh1xPZb95y1T9FBDm29yyKgHTZyVajy7wFeqcAfIerBYiBjJZJX2BQmywk9+WEFkaZhXq0shs6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729283684; c=relaxed/simple;
	bh=osIrL7yWr+4pmjn4TVjBTzhg7zx8VCnWZvSiQ2XJamw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mcRtZCkxODRVS9FN1j4PsAb47KwQUhD9ivy72+XyO3DgMrDvqrlJCJjcalH5z/lhnrcO4k8UtqfEmU1a8UPK943yaZLQEakAYslkgsKjITWG7UHJumBG3Nwwi5IEkDgfrfYw+8dp6SKt0b0Vq4hpv3p44t55/bywD22FPZbKPAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Wje8HYTu; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Wje8HYTu"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-539f6e1f756so3232806e87.0
        for <linux-sunxi@lists.linux.dev>; Fri, 18 Oct 2024 13:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729283680; x=1729888480; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jQVWVw/idsCMZK/QpoLkRhrGm63gf8m8ez6XsTKeLHM=;
        b=Wje8HYTuUCK/V/iZOlm+WRAr74B6bzOg+eG6RtO/wjvsKLlaoYw0bD0CgXhTyK0cla
         OFbWl8qCcZ1LHVbFFyVg97mpV2CkgDNHrDOyGcjZ7ic+lAGWksva5fnHl5cTNnCxKY/s
         Q1fBopfk8Djn0yJ0VY4rLElHitWiidRnsbt0wtNsOKi4wrybKs9v5a5Muc42MT5/EFcG
         lnRm0pF+0Jur/QzvpOTATb9c/bzdKOful9YtCmhaxw6w5HhJ7aEuGswS3El9gsB21ZM5
         JTVx1+MuZZGLagEqYOHKOU5xqGm2uWwDwVfQ1BhLteoMYWvYkJxduwRCZAoyMMTK7Ju6
         rS6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729283680; x=1729888480;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jQVWVw/idsCMZK/QpoLkRhrGm63gf8m8ez6XsTKeLHM=;
        b=fJ7txa86lw311o7uakBjOFZGDRQdRNbdPboquJkEpurvYA67eJ/zVGNrYAi9iv8gJs
         LI8DPpLR+nYwHM40QKADr9MQ3IaEMUmhB5wCFX2+56mdmeak6acpq319Pqftq0Y4Pm3C
         4au4l3rN7tlTCK4r+JIuL5YutUKCXDSwvuV4c9UkyiRCrgBK1LVQ2JdPRD+AoTSEEzuX
         JS3tTGJQI6xxoaeeZY0F2KwHQeoHTtPBVSFK0MX/mHrSxlQrLjymvbt16a4oYrrMgtHp
         Ox0eCn1sls5H/b1uV0eTNU0rvtnK4jSkyskfRgqeMh3UOMdFXcSB2KAPT8k4QBfqeH54
         vjFA==
X-Forwarded-Encrypted: i=1; AJvYcCWef5fS/FQ8gFaZItpi+tPOZkboqeaTa2ELteSRBE3GcDn18GvXCNwLf0zNPzH0ont2+bNj52SlICBpQQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz0mwnQvtm+gtp0MBt2P6B9Aq5/g/JAZy16zye2JLsJLbJSZrGq
	CxzsiWoY8neVWt4i1rQY/FIzaSsuN/7SeMrg8wuN+k+cFeoiGYNJW9qaYqtXgol2lPTZmp20QTe
	Wl5Y=
X-Google-Smtp-Source: AGHT+IGoSpeJeqVcn2bBpU1CDeVL7TbnH9BzbJ+fJdWG6AlVnAH1yvvW7YML8X25GofhaYelXl/hnA==
X-Received: by 2002:a05:6512:3ba6:b0:539:ea54:8d22 with SMTP id 2adb3069b0e04-53a15218aafmr2609863e87.18.1729283680110;
        Fri, 18 Oct 2024 13:34:40 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53a151f0e09sm314047e87.146.2024.10.18.13.34.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 13:34:39 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 18 Oct 2024 23:34:23 +0300
Subject: [PATCH 5/6] drm/bridge: lontium-lt9611: drop TMDS char rate check
 in mode_valid
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241018-hdmi-mode-valid-v1-5-6e49ae4801f7@linaro.org>
References: <20241018-hdmi-mode-valid-v1-0-6e49ae4801f7@linaro.org>
In-Reply-To: <20241018-hdmi-mode-valid-v1-0-6e49ae4801f7@linaro.org>
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
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1245;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=osIrL7yWr+4pmjn4TVjBTzhg7zx8VCnWZvSiQ2XJamw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnEsZX2CRSrVD6zRlV3sf79iOpwhz41ku4gX4qc
 tGYqxdPC/uJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZxLGVwAKCRCLPIo+Aiko
 1RyYB/9E+wiPd2wCJklbxNW0iDngze8b+l1vYstAn14YjudFSUOj7PzR+r+wuO8oBzGp30jLWxr
 2hv3hyWP7IHMsIgLkbUSkoabiCeCcw00YJ8pTNRNA03XEUYNPShaFGKncbTJjclO8N02NDuqbbG
 EVBl6Wn92lNxdYi1TseW2pacNmyCH3D+R8WRBF2OFFYKVx/lcV47U6CAT7vh4Oh9sdmiYQKg9+s
 nK5XOLg0lX2/m1gGOePKId5J4Sz18NrsoOXoEUXbeyUJynFaWCg8HwtmA1ZmeiqbEBu/DF1TVVo
 zuOH+2JIHO9gjlZ3jT4dd918nxB+waOmoaThOushOweRJPOs
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Drop manual check of the TMDS char rate in the mode_valid callback. This
check is now being performed by the core.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/bridge/lontium-lt9611.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
index 1b31fdebe164..b8ccffdf515a 100644
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

