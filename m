Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 761A4143890
	for <linux-sunxi@lists.linux.dev>; Sat, 30 Nov 2024 01:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732931574; cv=none; b=CGxiGaOqnNEAToX7Ag6cQWYTGKppwfCWeJciHspBqhXfA0akiAqjF8Airsy8bIJxtogf0RHwV8/8ExC5trzk7k+rrXCrJoBH/IkLAAzmWvdmf7KuwjwfpLQ0N2CJg8KatWd/E7buP5apcrApgzRyG3DZ8MsrWcS3ryB3d2yR+Xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732931574; c=relaxed/simple;
	bh=At9SvTe5LA0QiGChV0O2Dfze46Fe9tZ8M4odvfGUE7I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OG1HXi+pshvopEbENKbsbGt1mm1qcGbbt5OdYItDe2VVhIrvVDFLU8NtU1oht83bclHN1GCdRFlEorIOL7oFpvKWAWBu8sRNjPOfVVAKphaiTerzSFpNtaTr/Df5KisOdu7OS3ftWZLCFyJ+OyNuTtgQvAyl7Q7Nk27P9Dv4xh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Z4kkk2fu; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Z4kkk2fu"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-53de92be287so3843788e87.1
        for <linux-sunxi@lists.linux.dev>; Fri, 29 Nov 2024 17:52:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732931571; x=1733536371; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rqzd45OJ/2bjI5cuXyLBaiv2D5kR3sXVh9d8XfqZ3RA=;
        b=Z4kkk2fuDjDFBUbg3lptrgKPWGOZsKXMAg/kwiLTIT2YxmFPh3lAeG23xAu71feTNz
         TkIU58WEMPwxhIA5J5GEVGMNXCGZSmWrdXVCtYUd3l+FBWWIxkz6JhnwFKG8JIdcgHeC
         eRWou/czbcY3en/4Trw9ud9GFDMCovktIl9Ww694SFM5dH1D0WM0FexmmDwpbTyVKe4X
         Q/vE2gQHUfsIqE0jIKcVYQXaOA3JN/lRLwDdgA3gikKdEFseJ8U86L9yVFAFeqnM6OBt
         kkRqlb0IsfJz26p8bCovRjhyUfXtmebfMSDwE/gRRoOemkiSE+eCo08/u6aUiTrCHE3g
         Qt1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732931571; x=1733536371;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rqzd45OJ/2bjI5cuXyLBaiv2D5kR3sXVh9d8XfqZ3RA=;
        b=hITEfAcgwoJ0UIeklj1g4Z7P+B4lK2chNT4q5uEvqf5Evg1fmoG/4DrY8VwnufI5ff
         Ar0oscE3JU+1Sm2VmJZ4yCNDsYKZunhc7YUKiH5TfqjJAieIgRg8Vnrz7M9eVlrasnQ0
         GM9BGvp5X8FEOYovww7umY92frNq1sa9BEvjL3GOlClKEoav+V2IY7fbRYzhV/3+U6cl
         YLj8B2txF3KMd2OcKIv/I1XOKx4WIAUqcujGj7jelGvzQYZyaofKg2fbelc/CfTlYzSf
         aPMw7pDuMz5YhUBc3QHxJKT4fuj67KRnvWj38CzcMNugpX0zdI7HKO/Ae6MDhwk9gtR8
         MGew==
X-Forwarded-Encrypted: i=1; AJvYcCXzdVpfb92oSIztT/JQY5jSTuMlm0KdcTKe8xGRAaHCTpNRsQT4AmCgaUkv9GTnvnq0fZOAn/MPrdM+GQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw+lsptd5/tenfytz9IVbN7bOEkekghapjoZqWygSB6IDt97Vse
	0yIWEPZ9ihtFYZSfPwXsj9/t+Z+UIdbSVn15w2D9rhDqku54/GCb0GOJAWGaT3g=
X-Gm-Gg: ASbGnctR4g2ZBsJv1fT0yskfjqlQWzOBQ7pR5iN0Ow9K7/iA9JoSzt7nMlWl971FEwl
	tVykeOXzw6HiywjzKNNfa0jiFcDx14FBD/whuUnyvCB2H7U6nrFV/ie6ZUK3fKskk0+e5zPLGF5
	UW47+QKc3p80RH10wQ39wD/wDrAqRTbxTaIgnsf/OBE//Z1O2ewTIGzeC5RaOsq/fK/qjWdJzd0
	Q+/LBRnIziJZet1lwBeIc8FJtV0l34KZnUEbCgklEMQY5uZs083NEyz9A==
X-Google-Smtp-Source: AGHT+IEm8Yb0TxS+eVr/75rrNhY8EmahWTK3d4I/qjVsct4VbSz/US+qIlExC4PPMtJ+C61FxhlMpw==
X-Received: by 2002:a05:6512:124f:b0:53d:ede3:3e0 with SMTP id 2adb3069b0e04-53df00a924emr13257471e87.11.1732931570640;
        Fri, 29 Nov 2024 17:52:50 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53df6443172sm636408e87.84.2024.11.29.17.52.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Nov 2024 17:52:49 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 30 Nov 2024 03:52:31 +0200
Subject: [PATCH v5 06/10] drm/vc4: use drm_hdmi_connector_mode_valid()
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241130-hdmi-mode-valid-v5-6-742644ec3b1f@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1740;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=At9SvTe5LA0QiGChV0O2Dfze46Fe9tZ8M4odvfGUE7I=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnSm/gUrzKupzPQSPNAvUfGl7XQ6IFP4Mjuc6k9
 OiwxKE8NgSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ0pv4AAKCRCLPIo+Aiko
 1UbOCACfmiglysJU/tIyjGlA11c+mgJ7cYK2eOEWh0ZSy72NW65KgY5a8FbZ9EVCQERqWc7dP90
 abFOIQdTPse1qE2HvCyMqVIHoKKywUEf4E5vhK1BOu4ArILzt6nstUi+E03GQUFjvM2cTgf7lZC
 edUwdUGA5Lm0pJq04VtA/+pg5wi6+qb33fd00ohAnTYmpBWYYRLGm6ytcdhJuewk6P3AOo7hT27
 VbGBcMiGZNp3E3P4Tvk6KoR0Nm7SOKWMpn6omYVsIhV19KKTtk2UPYZWDe45jm5te3OB0TScfc7
 HaKxP4L24nxyZtXeCB/cUIMb9RVM/dcHbcZ6lkb25qQPXzn4
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Use new drm_hdmi_connector_mode_valid() helper instead of a
module-specific copy.

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
Acked-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index b9fc4d981cf4d682bedd978795cf7284d2650e74..297afd89036ba8fba571379f5b6d63227eadb66e 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -580,6 +580,7 @@ static const struct drm_connector_helper_funcs vc4_hdmi_connector_helper_funcs =
 	.detect_ctx = vc4_hdmi_connector_detect_ctx,
 	.get_modes = vc4_hdmi_connector_get_modes,
 	.atomic_check = vc4_hdmi_connector_atomic_check,
+	.mode_valid = drm_hdmi_connector_mode_valid,
 };
 
 static const struct drm_connector_hdmi_funcs vc4_hdmi_hdmi_connector_funcs;
@@ -1765,7 +1766,6 @@ vc4_hdmi_encoder_mode_valid(struct drm_encoder *encoder,
 			    const struct drm_display_mode *mode)
 {
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
-	unsigned long long rate;
 
 	if (vc4_hdmi->variant->unsupported_odd_h_timings &&
 	    !(mode->flags & DRM_MODE_FLAG_DBLCLK) &&
@@ -1773,8 +1773,7 @@ vc4_hdmi_encoder_mode_valid(struct drm_encoder *encoder,
 	     (mode->hsync_end % 2) || (mode->htotal % 2)))
 		return MODE_H_ILLEGAL;
 
-	rate = drm_hdmi_compute_mode_clock(mode, 8, HDMI_COLORSPACE_RGB);
-	return vc4_hdmi_connector_clock_valid(&vc4_hdmi->connector, mode, rate);
+	return MODE_OK;
 }
 
 static const struct drm_encoder_helper_funcs vc4_hdmi_encoder_helper_funcs = {

-- 
2.39.5

