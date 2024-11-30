Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22C2B6CDAF
	for <linux-sunxi@lists.linux.dev>; Sat, 30 Nov 2024 01:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732931563; cv=none; b=g6YaeU/FmSMXKB5xCn0Kpc3kMqbvXWC5XZzpgy0NkFr312EVUHb2vF1oAWszE25JHyyPmVH9sVcNkVxcGsQlNFm+TCzQXnsvz432FwcApr7T/hk+lwPWGIVCidGaIE5fiRuaE280dbneYfbpIIRDQeBV6w+6CP5zFIVlF7AVqu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732931563; c=relaxed/simple;
	bh=rXzXs1LIiHZL8UtREKepdy9gjR2Nvrl9SsrJH4c2YZQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZKwgqfdP32Th8/IXf4pd8ZEPdQDMvnAhpRVcJzPvnQGQjeJfTjNCYlvYIlgh8JKA9aPU2meI/jjzRIzfI7GEEnH+RqFLmc9z34ouicrlBq02hscGdzvZUMWND2tj/SxCHV0dbremaPuA35cU6U1yJ8nQHCBYEsRmSwgcYlXpkQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SHeSPoyr; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SHeSPoyr"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-53de8ecb39bso2868142e87.2
        for <linux-sunxi@lists.linux.dev>; Fri, 29 Nov 2024 17:52:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732931558; x=1733536358; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rL+Q+A1E5WdeyWGlnmxBrdioN3F1q14QakvZcTSmWyI=;
        b=SHeSPoyrDThgGwf6rjDGFutnET85DNrnofQ4r2nbNbCdoselB1fEbxQzURjGBg5svL
         Ao1/wp+7/+k5bIWzde/V6H/j40rwqwusQ58Q0GJinZVjGmRRmJtDcxOJTaCt3999TBzX
         V/IhbP1X/NtOIgEcozGWZXHIsg4j7OPnA29QoccrqTxmMvfcfse3AS0EjFTvilmPoT7u
         8fepck3k1VhpevJ8+tKR1KZ0kST20q9DNFQq8WBobrEWZG2lheU55ehJWfD1GsAU6f7m
         uVEXkzvXTraSbh4yp5ALlJ3/cWKc37SQqRx5i1yrtcS0Q0AkXuB1FKODgYMFSwDZz5eO
         cDgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732931558; x=1733536358;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rL+Q+A1E5WdeyWGlnmxBrdioN3F1q14QakvZcTSmWyI=;
        b=iGQt8fBwrOTYvfHdXYvQuUt3LOZCVHcU2dZdfigVgPPIrFtnryUF5MOTT6XK3/e6R6
         qeQyQ5YFn/nfnYF1Hf2E8iq5xJJpYl6xxf8oH7PN7z2Nf2ClZdYbC7Wuxjg5IUWvkJQV
         P1e0pfMcfA/gSMUHINWgMnOdofVSLYUT8W/F0uJTmPeo6S4fYSpLVbqUkKc3cV+SRgF8
         QtxpqqCs2HYiX/4XOK8u1qe66D45+5DRvSUljYW27k1TRR5IwlTm20dqLVDL6zuJjX4q
         FahJ5kdKZBSf4TMBaTRCo5SNstsU5vvaepJ9NzVYPfy54zAU9z78u6/rhRlXgOpaPtXN
         iOFw==
X-Forwarded-Encrypted: i=1; AJvYcCWUeWzwcy04VazQCmSfT6YXKGuE0DKGUr4aSyEdypXzlfUpVvGcrPshfHXjKTevDaZxmaDkwVT6a5RtUg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzn5k7msBX6GjMmqyBdP40Cm+QAofgOiRuPGKFymb0UUmQ2ofKo
	Y/8XEYabf4OIdjV69hXTI98UeP490Cj8R/+JNhmeEcCK+2IguLHaYz7nJbyG89U=
X-Gm-Gg: ASbGncvi4u//RuJzhkRAS1ZX7nhNqy40rwwEqJW9j93DZEtMhf325V6Tswp1JSDLosP
	oavmnMzTvyLStP6acRaD9rnSHJdkfIeFnpl0Ng2CqgsPkX/1bHnpPmKDUgO6zh33NIPlO1EoowR
	X65q2AoZ1bgAz/20v9jn21KjB7jQTAnJrLJ1JSwHLq2pEmfRhDhtg4Poi8epKZqQacpUWweeyPb
	BQFMMTbN2KmpvA2I93A1BFqQ3pkEQi9uzu2VgD3fDVKXcl0HWNXLTmeaw==
X-Google-Smtp-Source: AGHT+IGVvdf1lO5fwuFWw9xeRiergMVxDBWPVsqq8kgBU3WEnEIe51FT1/PQjZaCSi/PMkMqSKbTIQ==
X-Received: by 2002:a05:6512:2822:b0:539:da76:c77e with SMTP id 2adb3069b0e04-53df00aa234mr9021742e87.5.1732931558219;
        Fri, 29 Nov 2024 17:52:38 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53df6443172sm636408e87.84.2024.11.29.17.52.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Nov 2024 17:52:36 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 30 Nov 2024 03:52:26 +0200
Subject: [PATCH v5 01/10] drm/tests: hdmi: handle empty modes in
 find_preferred_mode()
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241130-hdmi-mode-valid-v5-1-742644ec3b1f@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1196;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=rXzXs1LIiHZL8UtREKepdy9gjR2Nvrl9SsrJH4c2YZQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnSm/fBLnvkUW9qRbw575QavDrP72LTHBm1NxMz
 85M4Ziti7uJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ0pv3wAKCRCLPIo+Aiko
 1dv7CACoQI2bC+09l2FHVrI7eITxhbdZjhlH6ypKucApGgA2wGe3crPMsMfJbwgJSJY1noUUULK
 YusunI4AlPgsBei8HxSGMe41Mk0z8AcWabq+XcdFbHG9aaY7Q+myFSq3c3F2ErXzjv0yWu8DFBA
 8oR967KFGvjLLSa7noPp/Moe5zrDoJaVD7HriBced36KzyqZLROp652AKv+6CpC+rsOt/T1NK4L
 CNXvVqRyV1Adpa4JZASWt/Yj/xDR+/FMfqRCCdFJLQPyN9uG1m4rChL+TjewMB99voI2nIaImHt
 /oXkkNBHtWoZFXDTAnJws5tJU/s1zd70ka0C29pX++CTpwbp
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

If the connector->modes list is empty, then list_first_entry() returns a
bogus entry. Change that to use list_first_entry_or_null().

Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
index 294773342e710dc56772f839c2db9c2e487bbc1e..1e77689af6549f162eb3026c7bd2bbd59516ed98 100644
--- a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
@@ -46,7 +46,7 @@ static struct drm_display_mode *find_preferred_mode(struct drm_connector *connec
 	struct drm_display_mode *mode, *preferred;
 
 	mutex_lock(&drm->mode_config.mutex);
-	preferred = list_first_entry(&connector->modes, struct drm_display_mode, head);
+	preferred = list_first_entry_or_null(&connector->modes, struct drm_display_mode, head);
 	list_for_each_entry(mode, &connector->modes, head)
 		if (mode->type & DRM_MODE_TYPE_PREFERRED)
 			preferred = mode;

-- 
2.39.5

