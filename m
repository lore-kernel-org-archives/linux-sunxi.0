Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2295814A0AA
	for <linux-sunxi@lists.linux.dev>; Sat, 30 Nov 2024 01:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732931578; cv=none; b=NY36CgYwvRm9K1Krvj3ZCrBUIVttBWVpeAD5niSE8biUPjY12QPgnYJ5vQkMdSC2oDNsUYoL81n7+GVI9bO0YxYEWS7dYnLKR2uVY69p2bvDwyJjTKA6gGSOxL3qLgsEupgeWAzLORk0M8HXwRGdFeJwKDMgPqdJ0LzkNyvadmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732931578; c=relaxed/simple;
	bh=CHPPIcbOk/4oF+oFDkgVgA19LBW1SDNLoLgjIjG3wi4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UVljZiKxeXt2E5A5niaTtlY6LclVjhRDMajLH+Acpz+33768NBl25F01N5i2mc/uJ2bC+/3vhs0nh5CW9bVh6jdFfi82R9yaRUjFPN81iKAoD9OxqlEDfmx3fwDcXmJLYcA0pI5BCiXzFvfU7BGHIdzy+wwk+YXD3u8nqGhcB/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wKnPpudv; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wKnPpudv"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-53de035ea13so2446678e87.0
        for <linux-sunxi@lists.linux.dev>; Fri, 29 Nov 2024 17:52:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732931575; x=1733536375; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+hHECBYEofE1LVFfISufmiOFENr43Xg+pptUAkUKUyA=;
        b=wKnPpudvMTCiBWFxgybtlScUjV5NL+KLy+1dxKlkgX42PoVj6UWwSK5O/ZIuwEF95G
         Ntn0DoAN4pQ8xnimTeljm+TkOZP0wfosYExR6iXFvn3eI8e7oImlxya8c/av8J0WY1VD
         GGGlkBeodce405UdwqNnHca/GwQmnoP6OBp7uRl/iuCFBDTPa9K7JYY+1xvtpqSAReaV
         ZDI4lQmJfQNebaqrgEUU+Iz9f7lzjuPRu5iHv0oUow6y4wAZWzf2DlqhjaCODu70Nl2b
         G9WGzIoZG0lOkty694NyJaZ/mfb7ob21uoNy6jTjHO9WtpEknqDX0YgpZbtTroaeb0w+
         CzXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732931575; x=1733536375;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+hHECBYEofE1LVFfISufmiOFENr43Xg+pptUAkUKUyA=;
        b=uQzIUqdScxsGv52Xd/K2OtMgJGsGoNQYZT+QDlnQ+OKKmYoWaWSS86HapDGCBgtWu4
         Cli48ikiz0PdBoHqcA6hqRaGUGi+yYBps+LVAcAcKcuNnhAq1YN4e5KlTDh8ZstwHH0r
         dmSqX9FATuTfzgq74kb6h1YAzY3quYwC3ZHaZjzQ/+02tX1ek8ioUvQ02cjvedOEFhUc
         1Uhv9uXMajndxlawksKJi/zGeHatd0Tf4kyi+6SpTq4drnDb4hoe1Dlwf6F1c7EUjHW7
         5/ef4C/w8f9XmGc/BvpNGm6P60ucFTuxmxS8Y0XcI761ESQ7St+TarUWkVByWsVflvQ7
         JlrQ==
X-Forwarded-Encrypted: i=1; AJvYcCX8vrxvq/oTw+JvJ67XZMF6jJhwkEgByYqvDiNzIotxECVxdu/tE/FqaBgoRIT6VUkINFemwaCS3TA2Zg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxc/4hTMXQCRVCQPHJoWNV09Ee1XrFfwy53xLRj39FdNPurmfG/
	mQoJmQ0igEUAuf22SmHup+iIucnN8HOrG4VWb54KkE1JbzlX0aYkdMXEhss4Dps=
X-Gm-Gg: ASbGncuBluhNz7vUBNd/I63euDENzjI3tlMHX4ZeM9BRQvhW+cWotOCkrJcawKMExQJ
	6SHlbYxxgFlco20fbLoK/M2RVVFTyAtD/7UF4lqr8JX1IDTFaAivLQYsr+m7z//OFfAgqrKV5Dv
	tX3R4UXxLBtysE48SQ9ZTMMDPC6fg7C0qyu2ON8zoQBGEfPZD9hCJOq4ngjLX94h8jlYE4LHlv0
	upXQI+vwzaRtKr9ZK++CgNiqf+x2GDQrNV2NWP6mvTO2SDPAqzjThOMOA==
X-Google-Smtp-Source: AGHT+IGpbKPr0jDpuxGiDeE7FvrQMAmAyXEng/ZnD9YgSk62wmodTKnHm1As1pVrSEzDd0Rvi+mmbQ==
X-Received: by 2002:a05:6512:3b25:b0:53d:ed08:5712 with SMTP id 2adb3069b0e04-53df00d3c8bmr8073919e87.23.1732931575393;
        Fri, 29 Nov 2024 17:52:55 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53df6443172sm636408e87.84.2024.11.29.17.52.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Nov 2024 17:52:54 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 30 Nov 2024 03:52:33 +0200
Subject: [PATCH v5 08/10] drm/bridge: lontium-lt9611: drop TMDS char rate
 check in mode_valid
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241130-hdmi-mode-valid-v5-8-742644ec3b1f@linaro.org>
References: <20241130-hdmi-mode-valid-v5-0-742644ec3b1f@linaro.org>
In-Reply-To: <20241130-hdmi-mode-valid-v5-0-742644ec3b1f@linaro.org>
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
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnSm/gZYVRxsPvBuVk2hROVkIaUSrjCIe8xd0oY
 EGWuQDCOl2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ0pv4AAKCRCLPIo+Aiko
 1TwnB/95gm5vag8iFN5M1sSaLORbtyefXMqgXK+UYyOyMGH3WsrGBMV3zrqFa3hOpYrpMOPCJ0p
 2qpzknExme8zQHyG/cCZzlAZZ0eO6hM0CQ4/s+rxguRsevb95fQ5hLPrn9R2wyESwkIQNRYRb3a
 2aXx6WQ49NUOzerBIcauDv7aYjXAkWdIRA7hLYiNDTUg5XaxsEmn/6wFvWpYIa8jK6QejHWd7y4
 sTqgUxNX89KPdleAyprS2KSf4PwrAVlhpqMiALo1t+TdddoHZRFuKOltrZOe72vM5ukHKooMl5i
 xPpLai8cV0tXWnmKjXAfd+Ca/6CUJ/aMT3RViERTh2qn2xln
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

