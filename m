Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0D3F198853
	for <linux-sunxi@lists.linux.dev>; Sat,  9 Nov 2024 12:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731155733; cv=none; b=ey9q3Pfm3vgBRI2dtMJ/DvfZ/BXNwwDfrFjHo2cXmDWFngk50GzQREla0bPtbReAZErd2J33PM0RD2CKBO++7sCPsnyd8Rh/Yoy0DjqhF6lnCqT+VBHOEFuI6FQCc66cPn7I95EEhLAeJEiofUy0OusvrF78mKc72gDHWOLwSm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731155733; c=relaxed/simple;
	bh=UjNMLqX51SwfyB+kbUbjnJt95fAbmRoKvLYOPQ8ek9c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KesbrLRh7mbpP6nrYpqIwdMP8s0ZpFsyxldQ4ZRzIex4/+uITntKZ3YWkmlc+jloWNG6z/VC4U9K5Hfu2oy1mV80dNzUuucDlXq6LV7yE/zx3bGXF2CTUV+AJ2ucTZF5esbkd8VsbOfUOhH5SjQFKyQfxQnSGkGzbqPJ/IwcHv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=N6G3ZVKP; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="N6G3ZVKP"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-539e63c8678so3732016e87.0
        for <linux-sunxi@lists.linux.dev>; Sat, 09 Nov 2024 04:35:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731155730; x=1731760530; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n9wxCYXwjuFpbEm8J6hnlc7LqgHEUz/bPD6SI90IVR0=;
        b=N6G3ZVKPm5rxIPyNxwJ2Ckfyt+lrFbWgWG4R7d7VIO8wTxim1Yji4oz1twWWvqlQ7N
         sco121S/Fg6u2dchfXIu6wMAvRzl8J+uoYZ5jfF7uwAT/AnkC0sq5B8DehPOJ8NvtP1J
         SGyoNYQoHE8DMZk5uUMAtQ9nX6dDl+1EXBfuUzMgpc9PLEZTXaDoC0SSW8JzbFiB/2N4
         PXw/MblvvT+SW8rKXiHQsZyCato6UCIrNwYA73YzNk9qOQ74mmZrdW/1ipib5HyrDTi+
         Y8RCY6E9Fov3WZxP++2mhHxSBzdNXq56ntlz9qd0g+boxYDwhpaKIT1mBOZFrDkxWfNy
         qQrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731155730; x=1731760530;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n9wxCYXwjuFpbEm8J6hnlc7LqgHEUz/bPD6SI90IVR0=;
        b=U/oRTHiM12rMmB0SDO8WeSz02Mazkf9VQ++KGk2mliUJ5w3Q9dwlkeVNez/F+shWya
         cDf7I2knTk0Bi9X5HAjmD5Yj12lidof6s9Egp/hfmJifPFY7nW06RQh+Seka7d4GFDFx
         tRH/iOUcj4JKgjRh8HyV98Ymp4GtlQ+5Yqe/mEzHqjm/6N2qG/bCT/0nxTr3S50Gm/z7
         wN7qhfZanSFR++p6J6rhZvZ0E7HHpvkPTvv20NGASzawYUEG4QkVUBcvQSzxMw424/kM
         DH2M+hrx4+Vdw/9RM0jXC/T7LAMiKVWu/J40X3+ZPzTQYE+jKBRgkCX9gyyf2XjOOCkS
         8YXA==
X-Forwarded-Encrypted: i=1; AJvYcCVCKqeVWyDJL/TeOLgOZ7c8HoKSpmkzC4xeZqydqu6TgaOPJd3Phi4dPxiXCyITUZCgAq+XCs6zbAlNZQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzpUKJkgfjgbG4J//vdZuzTs94Bzg/YyaDHilU8ygQUXwOg0NhX
	AA2Psg7CKvfR20PNfaIjdvxhKS4usSUA9F9bpeSBYEoqtiCNVSaHc85ixMuCOEA=
X-Google-Smtp-Source: AGHT+IExWCGWwweJ3/2iRfeNRk4AonxFSRBohmS9iN1pZjqL1Hm83HHjYVjbPTXo/ZRFzwelKC8tdQ==
X-Received: by 2002:ac2:4c4f:0:b0:539:8a9a:4e63 with SMTP id 2adb3069b0e04-53d862fded1mr3117421e87.42.1731155729899;
        Sat, 09 Nov 2024 04:35:29 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53d826784dbsm922899e87.15.2024.11.09.04.35.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Nov 2024 04:35:28 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 09 Nov 2024 14:35:10 +0200
Subject: [PATCH v3 6/7] drm/bridge: dw-hdmi-qp: replace mode_valid with
 tmds_char_rate
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241109-hdmi-mode-valid-v3-6-5348c2368076@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2092;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=UjNMLqX51SwfyB+kbUbjnJt95fAbmRoKvLYOPQ8ek9c=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnL1b/mNQQcFqCkzuMTFi21MgL+ClfX6zdxYmOE
 WDmYH96sASJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZy9W/wAKCRCLPIo+Aiko
 1b1cB/4saVmbA16c6Z2bnXMNH/2b3oJllF/7OUdQvKCnntWfx23Ah8wjwzFSaoqoFc+jrad4IuM
 GUO4DHOvHv2lRiN/dW3NjaYzf/4Fs6FTemzc2Tetv9JJ6dc6DKLv0dHR+kawu93qS4TSwCbpduz
 bQJDOP0pZK/UbBjbJl2jUUGcMHS8CWn2EgZc0Y+aej2d1R87ogJebwR3Yik2NciCNDbX4INzayI
 AjmNHAq/LOOrLHcgLBbd15aEsGcw8q47AiX1jSh39Q7NHyX78ZfMpSIOQ68OnoI84bRbaz8Mx2S
 zjDUhci0ay3ohdizDU96iTYRPo+tGSq9Sxzlpty6qOenFpKs
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Replace .mode_valid() callback with .hdmi_tmds_char_rate_valid(). It is
more generic and is used in other mode validation paths. The rate
validation for .mode_valid() will be performed by the
drm_bridge_connector code.

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
index 181c5164b23192f0b557624d73c6223032b90ec6..c686671e4850a1af75b82995185ffc3cbb22a447 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
@@ -442,16 +442,14 @@ dw_hdmi_qp_bridge_edid_read(struct drm_bridge *bridge,
 }
 
 static enum drm_mode_status
-dw_hdmi_qp_bridge_mode_valid(struct drm_bridge *bridge,
-			     const struct drm_display_info *info,
-			     const struct drm_display_mode *mode)
+dw_hdmi_qp_bridge_tmds_char_rate_valid(const struct drm_bridge *bridge,
+				       const struct drm_display_mode *mode,
+				       unsigned long long rate)
 {
 	struct dw_hdmi_qp *hdmi = bridge->driver_private;
-	unsigned long long rate;
 
-	rate = drm_hdmi_compute_mode_clock(mode, 8, HDMI_COLORSPACE_RGB);
 	if (rate > HDMI14_MAX_TMDSCLK) {
-		dev_dbg(hdmi->dev, "Unsupported mode clock: %d\n", mode->clock);
+		dev_dbg(hdmi->dev, "Unsupported TMDS char rate: %lld\n", rate);
 		return MODE_CLOCK_HIGH;
 	}
 
@@ -510,7 +508,7 @@ static const struct drm_bridge_funcs dw_hdmi_qp_bridge_funcs = {
 	.atomic_disable = dw_hdmi_qp_bridge_atomic_disable,
 	.detect = dw_hdmi_qp_bridge_detect,
 	.edid_read = dw_hdmi_qp_bridge_edid_read,
-	.mode_valid = dw_hdmi_qp_bridge_mode_valid,
+	.hdmi_tmds_char_rate_valid = dw_hdmi_qp_bridge_tmds_char_rate_valid,
 	.hdmi_clear_infoframe = dw_hdmi_qp_bridge_clear_infoframe,
 	.hdmi_write_infoframe = dw_hdmi_qp_bridge_write_infoframe,
 };

-- 
2.39.5

