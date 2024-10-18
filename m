Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B8FB20820A
	for <linux-sunxi@lists.linux.dev>; Fri, 18 Oct 2024 20:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729283679; cv=none; b=PJb3OuesF9K2d4JiRGl5LRokaE+1OG3mWJGvh10JNIf5/o7ooKJvUGzUKN53G12rS40vCWUPnEYGYi2ULpF0p8aZmUDijwspilXOZ5ShQRxh8AacYFHcFddh2K9R3unQIego4nvccaFfYHvhz8LmnUojTL+u/ocXJXjt0qnFn8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729283679; c=relaxed/simple;
	bh=MtW4rEaw3z2JqlmFrdNRTkI3k9zk4GSQZjrxwP7bYGo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Cdj5Esd5nz9TH6cZm2Gxk6sWiYLK4r9iIQkxcZGzB2U+kGnzABn+sI+RpU0P45xiMeZByc9RsSHwjY+C3ywEvpYO2xIKCMrd1h8eSnhr+yZtM/E1scW+VOEQa03+ohe7Dw4p716BBOm9X4TRCv8Xh/M1S5pojrvhNoGW2zEgntI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oBYLkWOO; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oBYLkWOO"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-539f7606199so3019773e87.0
        for <linux-sunxi@lists.linux.dev>; Fri, 18 Oct 2024 13:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729283675; x=1729888475; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/m0kHi0t1totPQ3PzKzLk6eKNQU+IyYcKKk3sgyVyJI=;
        b=oBYLkWOOR1+dsT//0PcIrYuqmZivyF5W8K00bMi+5URbHimk57aJ09/lidYpztHFKO
         GPE0BfNclH6JTwV3QCJQkXI/CBJQ62/N4HhZrRZhO7UhweXp0V9FLu3tBbnAVNXo3pHd
         WFKnkDZUnSVdu1OHzde0sjrdC85Xo/i/9Q6FI+//CqbsqW7Iqa+2/xa9bLwsWJXyZ7VR
         5nNrrU3vOJEYnDW5roQ2vni1tc3YbIlHrALhWmIZn8JPRYGLcYmdMZg0WwFD6Gf9ezjn
         R7A4aFAdsRS/xxOOWxdKQZDLFMO0W/TXH9OM1QmmcFk8k/04F4S0NqjQYwWLDZLcwIvk
         WsJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729283675; x=1729888475;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/m0kHi0t1totPQ3PzKzLk6eKNQU+IyYcKKk3sgyVyJI=;
        b=hp698IoWRAVnaoq3fOEADjQEm7UXYfFzorPCJk5I2Oohuw8d7baz4WzUTz6sDn/hkS
         8zGrrF/MiCOdSVf/yP+CVN62rVjHwWxU2gRrtBm5Ln5uCGZwha/SxvjFlZxjVPg8MzdT
         vjGKW5oVW6kVtZHFsufK6AtbhDiuXAmLvdGG0J8V0+Dk2m17WHOY5frn8V9ReP2j50Hs
         nT+P6yK8uzKPUkO4ycxo17S3g6YbMOQO7DRebbEgzt+fncb92YYviZJdeL1mGNf3nzCp
         aJ63kwN4YzAAVUagmyb9CCHATWUMReruCPV95rbj00+xCFfQ1frnGkAQTXt19DYJoLmq
         opVg==
X-Forwarded-Encrypted: i=1; AJvYcCUETnLS8HOTpndXU1W/TiObKgnPBaL7LNw3bOc2LX7a9mFrNYSYpQLiaRcjthBLpu5gGZJLQEliXNPcbg==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywb8fD0+5MNI6uF4LWgToq0g3YTelj4oZKKP7Qc9uciIsvBvHjO
	9Nhpm2XYHfV1A3TDT3qzZn2Blijcza1QwhPKZlQpTkNhtg1BzMFXBhHYojoOkAKDTl+CVWXsf+A
	5RCs=
X-Google-Smtp-Source: AGHT+IE8teJd2ZASdpn1PLVXXJ8Z0lyW9kTdAysHgWEAGJu0SayFj+KAyRByYqJcMZXxWhWyPtS+1Q==
X-Received: by 2002:a05:6512:692:b0:539:8f4d:a7dd with SMTP id 2adb3069b0e04-53a154436dbmr2588171e87.42.1729283675244;
        Fri, 18 Oct 2024 13:34:35 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53a151f0e09sm314047e87.146.2024.10.18.13.34.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 13:34:34 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 18 Oct 2024 23:34:20 +0300
Subject: [PATCH 2/6] drm/sun4i: use drm_hdmi_connector_mode_valid()
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241018-hdmi-mode-valid-v1-2-6e49ae4801f7@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1475;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=MtW4rEaw3z2JqlmFrdNRTkI3k9zk4GSQZjrxwP7bYGo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnEsZWS7Xr6vqJfAnZJaxT8pE156T+ugvlMXDE3
 cWVO2I31JaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZxLGVgAKCRCLPIo+Aiko
 1RStCACcZGiWbJ6rwl1Z7TfhmYAv6dtF23Ul2Ba84Yg6T1vuXwq/cb/4fJJgxp0DdL2C34giGeM
 OX7nDtrcBG8ZwXo0GOsmJqZxtWzIiBAyCVGTmz+yx2Y+tR5Nhnu2zkJeXVuxV0n5G5uT9maCxns
 NKuL0ICAxfeQ+ICDoNDqNkgABXsNpo03+AUcDftdjzQDqqcQeaKnK9f5YiWI/97U/5ABstMbZ+K
 ceX6ul8ImmiIFu67jcbEl347B72uAN/TLXdutztOSkElYtI5UwIj/Sl4fJOiQQwobFAbw1CoNCD
 wN2I8yrwr3Tn99ueCn+aeGGPbo7vTkfjtwCWzxrkVIR9jctY
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Use new drm_hdmi_connector_mode_valid() helper instead of a
module-specific copy.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
index b3649449de30..54b72fe220af 100644
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

