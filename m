Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AFE21DE89D
	for <linux-sunxi@lists.linux.dev>; Fri, 22 Nov 2024 09:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732266813; cv=none; b=GCgH+6PhPEDEpIiTMDt8j9YQB61qWNTXa2Rb8aMroRQLUgolR2fwaTZ8StABuK+CzBiWGaZsTW16w4bZLeeKZpjO+03lcw3uTDuhRG1mhTTk3nJ45A14QAQRD238IGjQrjwhQ9DWjQCBm/RzC3J61yfdaaTQu9S+1eYxSG94HR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732266813; c=relaxed/simple;
	bh=CHPPIcbOk/4oF+oFDkgVgA19LBW1SDNLoLgjIjG3wi4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VG2q+DQnyFq4rJEdw2KG2HbA//3L2yvb0M5/GULhBpTWqjndwh0MsJengP/t6c+k/cJx8LxaTwt3MFMftnXmrlqjfWM4notXleDvkbTNQrUPx/eT6QXAo90NJWd/yThBh3XbCRIXoNZ0h2IYhf2ZYJHJt5icSiTv2ESBUQZAeyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lnDWgaXO; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lnDWgaXO"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-53a007743e7so2078570e87.1
        for <linux-sunxi@lists.linux.dev>; Fri, 22 Nov 2024 01:13:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732266809; x=1732871609; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+hHECBYEofE1LVFfISufmiOFENr43Xg+pptUAkUKUyA=;
        b=lnDWgaXOY87+EogKLxYOwm1tUyB9bCeu51YQEmVmu69VQQN0QSx4wtqMf+N+Gf07q8
         2UqO5EqmVAZwkLX9Nmpl18ZEbm4n2caxO8SLn75WxL8IYQlTWT2OVmE7na7dXNXUm0Yj
         hKWHnMepg7v0y3u3vtxEsZswnO8aWGZ3cGcuJ1TTikEy502VwWflX5b/CYwEsW1Iv9hn
         u3zK4rSJg7p4lNDZLgQ5lX0msIEXsBnaI8Oo5uBLvD2mbCfioEuM822OO/vD5Mbr4wZ1
         zgnrdiPtcJcUrpNexW7ykE68eAHNTX1z1c3q0CrmUFpms5dusEj07G3+5CMzXj+iyUph
         O+JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732266809; x=1732871609;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+hHECBYEofE1LVFfISufmiOFENr43Xg+pptUAkUKUyA=;
        b=tmyx7S1JKbVSGMUOC02KahKA/YVHuD/X3BYL0GVQWR4DbW2GLcs31Med962EJ7dHnp
         tyRWUi/Z8C5OOvrg2KugDHTY+kNyrNmN4yiK0rDdDu4FZuRjqcVKmIzUa/V2+8u10xlr
         zSmvbCDzPyZszleR8B7e8Zxu/j1o6thGy+i4BkGLRHuvmkAfmmhqlZisptpThaaTZN/d
         otf57Hyk+NDf+JkJ6RjPMrG7dJl5HvCcQWNu9RpvSK8zW9u0o7AqRfrxzSH+xIF7vYv5
         EbrmEvKYcP65NiAosEaKTlzjlhPaVEfDJkRWaFUCXwVHH2nZTuv/hF6/bOiKdoEKiyG+
         VNzA==
X-Forwarded-Encrypted: i=1; AJvYcCXLf/B/zkqC3vcu6KuExudIVni74GQvfhjQ8z0BvAI87r3Lc3+IHT6duyVQLFXdTnwOhunYWYOTMYL3rQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx0bB293xpexhSquaOneC4EUwOvqJdQa7AEmSlATQXS3OJ8EKNm
	eXLpMFg4rw1Hoh11ahvUHOVjcRSF4iHF8B87tdnqu2g61GpwB+B/WHzqx60AWNs=
X-Gm-Gg: ASbGnct25pF/eDn7oimePbk+I8wFuOCYCIZECIdVYARQXC+rzLUd+STPEZSk0ihc2UE
	ljKvedstnT7tuDz3nsDlLMJbo/5KLCVhuh9faezMF9g+ihGDDoLy5KDvYmzvS6DJ48rbo3UXAaE
	8JD2MN4UO6mTVNFMP1dflKkByVu3lgVefntnPBBndhLxiqABxZZvsLTkr1Fv20oMI3uPvuMdwOy
	YrI3SYA/Kg7gvsopO1WPEHjeXKsQOX+0oOS4N/cGYS6bpVPaU2iBf/jbw==
X-Google-Smtp-Source: AGHT+IEacF2R7IM1WOXDiiyEZw72yOQOODx70vgQAIsHBOvrbaiI7+vacg+XzA2nbeGhQv/5FVkoNw==
X-Received: by 2002:a05:6512:33d1:b0:53d:d661:ada with SMTP id 2adb3069b0e04-53dd6610bdcmr495351e87.8.1732266809396;
        Fri, 22 Nov 2024 01:13:29 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53dd2451386sm299530e87.77.2024.11.22.01.13.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 01:13:28 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 22 Nov 2024 11:13:04 +0200
Subject: [PATCH v4 08/10] drm/bridge: lontium-lt9611: drop TMDS char rate
 check in mode_valid
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241122-hdmi-mode-valid-v4-8-2fee4a83ab79@linaro.org>
References: <20241122-hdmi-mode-valid-v4-0-2fee4a83ab79@linaro.org>
In-Reply-To: <20241122-hdmi-mode-valid-v4-0-2fee4a83ab79@linaro.org>
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
 bh=CHPPIcbOk/4oF+oFDkgVgA19LBW1SDNLoLgjIjG3wi4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnQEsiedj1vWQXgZXcLJ02DcFxwDE5gszj18sAt
 X34dCGJZmKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ0BLIgAKCRCLPIo+Aiko
 1bSCB/9slyF05dGTP/R8bS3bpgFrC80+3aCli/HGX/hh9ZecB7M0/4Gtv1SuBYM+KdZhbrux6LE
 pczE2VQiA9zmyEtW0G5wbp1FeQvVBM8ruyAQIhmvjHQQTlnjC8Upiw/vuPynB4nUVZWHfhhYQmL
 zAEr0NKRnfHyVcsBRwxOdxyoVLnAqyl4aW9Ms616ITIiIb8MXaArqLlDxULPZrDRxxX17OEl0V6
 PCmq7Qc1dmPgMoaJfFSHCVIrgBet7swGVQ7Bft4pgEsIeljuwq+YPquR/XJM8bitfAaIpRNn1BX
 frUWcluAbmUtixwbfjgPP6l9mfVYq5tjcrdl+FwRNElIvckp
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
index 8f25b338a8d8f95dc0691735ac6343675098f7f7..1ffbe473e4103dfc315a8cd3571e9407bf518797 100644
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

