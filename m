Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F4631946A1
	for <linux-sunxi@lists.linux.dev>; Sat,  9 Nov 2024 12:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731155723; cv=none; b=AaqCYUXJoYkrjYFUMX2nZdIIynDD2hJ1zYFj+LXXZxls9BB0N6L/x5nXCUlo2ANgsUz424fsbC1Am4M/xd8tQt5wXgSnkCiYYEwTHOhMSuTI6ZZ8aKzOC7X7Oj5+1FXSYWu9f/3EUsZQVaBVu5NpNKhMgxp9jSwQ/XF9+NURGbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731155723; c=relaxed/simple;
	bh=7WdeDK9PVMnPHS0xN6wrfKPJv4ESCzGwmvZnGPcMZ/4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lthBI5xN/a6uMIS8HwcNSxsQrLJeRndH0Xry8vmRM7SRVoXcY4pBPmYBLSb65csA0yyPml/4fmEm0xmiZ/+DuyceeAaL9W0qid/Zd3TX3HgKiKh0UiclAEfuKQ20ayOG7KP/RfZTdhWIR1u3k6rdREMyemgyk+XFiKyWMKLA8kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=A9a8obo2; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="A9a8obo2"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-539e13375d3so3656228e87.3
        for <linux-sunxi@lists.linux.dev>; Sat, 09 Nov 2024 04:35:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731155719; x=1731760519; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YdWiUnW6vTgN40+31xk3R74ZtFvE1HPhsssihDLePE8=;
        b=A9a8obo2I+tGsQwHpJ5aepD/0hGNewN7T1hEtJ1qkQsygavuZFW6I4HksJeVMUOfIS
         m0SEBx5ItLlLfgz6mepQ/EmS3ndobq4ptqVVBaIBd9a5mSlkVsTc/UpIaTaeDb+4MtC4
         +9EuLRg2LjGRYTLHBwvxO5CirgegCOOEdvT7Fj1aODmbRJSRu0NUkMtbRApcqsfJu+Jo
         FHUGMZRYzGo1VomsBeVni1pAIFJjXuKUakM90h7Kb2WRGBstTOLrhuil4ceDc4HOmmY3
         JQUWnzuIn+1ceNcU+0K43hEJ8bk2eG0zhL+XMzXt/sE6EvGHibdNIF8Eb5KcsiWWufC+
         vPtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731155719; x=1731760519;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YdWiUnW6vTgN40+31xk3R74ZtFvE1HPhsssihDLePE8=;
        b=ntt4shw9Ei6GWX05VY5fMYEQZqTMIgrDJOHvLB2XHdO+3nV+vflSxMMFCn21wwX8go
         Rd48LPmV1MBea9BQfuJ+th6BFut/IkZu7gkJM/YOd6fsBe+8wxtZd/VxSKP/RTlSnttr
         Hd9txG1c2W8dpuFOVTYhj4ntHuUEWaR0dADXLoBWVyVrTB9nJiWqYBrFc8mWcp7Nfnpg
         h9+i5ELWPDqYyvem1K7UefBOpQD3qJ4riE6hX24mY3SB5D6Bc9KXCmzI6MWvAavRb2PJ
         fFHSFBq1BVRNsIKNFEjjnaOZnN4nCGMNpDgklZet+NGX/8NSPe1A7u6dOBL9JetNMI9G
         vBRA==
X-Forwarded-Encrypted: i=1; AJvYcCVzmoMPGWL6lse/x7tsS80GcNEu9GvbbTE9HNBMvCdTFgpyUe/wlQleOKnn8FYFe5zNcOsw2CHBQ6oilw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxjBYCJWcvgMz+/ShLexAzFUVISEx1H6MraDUqY9znwIlhmWGfB
	4hdM2oPVEUebIwcmOHrgGXRy5av0kaO2gog3sNJPUTLWgzKik56ykaVUrt6bhm4=
X-Google-Smtp-Source: AGHT+IHHe97HVWISV0xTKEguhhmngXwM9bLbhKLyVT/NAPLE3XO/6gkuiT5st4Y4ibTD6FfB3h0HDw==
X-Received: by 2002:a05:6512:3e1b:b0:539:f7ab:e161 with SMTP id 2adb3069b0e04-53d8626c957mr3117386e87.45.1731155719467;
        Sat, 09 Nov 2024 04:35:19 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53d826784dbsm922899e87.15.2024.11.09.04.35.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Nov 2024 04:35:18 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 09 Nov 2024 14:35:06 +0200
Subject: [PATCH v3 2/7] drm/sun4i: use drm_hdmi_connector_mode_valid()
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241109-hdmi-mode-valid-v3-2-5348c2368076@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1574;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=7WdeDK9PVMnPHS0xN6wrfKPJv4ESCzGwmvZnGPcMZ/4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnL1b+FmOS76qswUke0aQoU7K0ppHTbndFvzZI6
 MVoqTsyvKOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZy9W/gAKCRCLPIo+Aiko
 1aR2B/4roqe2QGJN9o0utoGfn7qwXfuYWUFrCpESIf0EXmVpBVMUfNKMEQ901DyyYMa07vGh9sn
 +syhOWO4HrB8RfdT01cQmwKSSSN/AO7aYYYR4wflgexekMnpd5MYCONI8J8OubpJFAs5BK0Qhic
 rzUP3emr5T3rHYkxTNjg3uIE5RV0OGNR/H4BtdIlMfVvPPEeQQtRRSjV2bl1y4C8SFCTQVUcqg7
 OkAARZXrgEfv4AtOtHjIBY0tsHxg98BaVOY0T74qxX313GFfUSTD8IyJiF0vxudbOq14KYEtHng
 lq+8K2cePPLztOfA876jNFsQpFGyIDb/AVfVxOCSHr6+qdVY
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

