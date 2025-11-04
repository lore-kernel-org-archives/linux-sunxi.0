Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4697033E358
	for <linux-sunxi@lists.linux.dev>; Tue,  4 Nov 2025 18:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762279809; cv=none; b=SY0KoHWF1Ru59Wn4uu9Se3Guxe1yBOvGqrpfVPiuHJfebRcS5MH7urTQy1BgUxVk6r0oXqKyTdyRCY85+zLR7mil5y/a+Um7LVsMz9HT/RQ36Z/DkKkaZblIpnAuO07+q7E3ryNsRtbv0WdgLulCPxDG6bcM1oqRQXWheqr4j94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762279809; c=relaxed/simple;
	bh=EhvcCC5M8Ffhpn9lWdXwL6pO1wy+yi3roBXaKFO/oSE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c7xC3csR0vQiuJnEvtJ4XoqGi9Ac+aQmkNgkek2m0AtnjV3ogZ6HGGdD2tNF/rXeB6REURVuNW804KmdHzrMprQhcp6R4bqkq9vXl96WF+sKbW+zfL1BlVc7d56hCD3A5/k4hkigv/F7lBKV+7Qq92S/OsuQEUw0+kEDWsLf80Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y5AuC8MM; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y5AuC8MM"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-47117f92e32so47876815e9.1
        for <linux-sunxi@lists.linux.dev>; Tue, 04 Nov 2025 10:10:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762279805; x=1762884605; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dL+KOGGetvWAx0akok8/ovUlD3VF5A+umltWwuLE0k8=;
        b=Y5AuC8MMtsrGppfrAJxbVU297vMeI8xSkJrKc46yvxyOj4fW4blMXI1/GDAzLLwgct
         fcSCmJ7aUSGqPzUOWxRmAsEOPOFQEeRYb5AsbtD1lluSAMud8Qp+/4IBJxTTtNw40Arq
         nReVhrhfIQWoUXLrsEwAedtMgZWt7AChhmgzmJwIkyTmxvk6q9MBUyVPVYhH3cHm6MLu
         iy/xIr1lCUIVIR94F6LmxTF7RpLZho2H5o9m3ickRwGZgRbvmuBtQr3QwUodJJ+FwXYk
         GU42dncsiAt8QK+SGwQOE4G4XRgAsjs+H7/Y6+JPShVoiDlfQbSZ9P/XnUhIr7GgbR1o
         nIMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762279805; x=1762884605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dL+KOGGetvWAx0akok8/ovUlD3VF5A+umltWwuLE0k8=;
        b=SlcR5TGMBCi3cJpMnI2mIF+eV6hutNbmWq58dJDCMBXYDgsM7IDiFFSY+RAcwv0p9o
         x6Xiso+8yolZtOEal9Z3BKER/l5COdKgf7q3FgIhRrQbHuK24nkyHJManh6YkFOmQJg8
         ipnA8oEDhmYa63cgls6iS6DVK2jrvN+vpEQMvafv5GfzjSMubYpy1SQ57dFKInsugoyw
         k4f4dirLSe3R4grlAHS4vjyHPv/MGdW3lmpW7A4/7B7/urWg9VQiPmoYbblVotMZsbF6
         bg2cEOTmfNKWYtRYZxdGhNt2D/9pm16WjPYom+xn/o+5MybQg1LnIXhWaLrZP0V9jteP
         pHzg==
X-Forwarded-Encrypted: i=1; AJvYcCVbiPvMFKL6Hvoav832OWDDNv8vFgfWQPlHUmTeAFS9EqvFBUsKNOSMUb7gpaWfIAY57MOTKh8JT46c9A==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzw5kWNvGk6Exq+tqKDF8vAFh3eDnRXxWVYIo13s4OkOGrDvVh7
	oHYqXTwSaMQw51SUln0xCLGsuf73XUODXGH2EK+61NhDVyoqf7R1SNJk
X-Gm-Gg: ASbGnct8Y2mpAOSyhcXJSz5QUq7DshJStVj+v3lrt0tUwQCnzoc1fOS6SlX2f/q+vcj
	jrp5c9kqh1I1Qpd1YrOIo/oN8btb5LJn80emckyOA3I0GNv6v+OmyNdzbpCNQ/+gQ0OBEZuNtg/
	vm8gEz0RORporQf3K0CU9dWdbO7HRtJfA/BywESO+D0z1+p9FUjAQaDj8fBXIK+f4AQwP8/n5ph
	akd6qgF4UIi8qmQif1FKAm1OjU4L/OxslDhJ+AuuJkwQJN+tgCFfNt0wiMmLe5M8s2n/KCFBmS/
	5Upo+OJd2gNbGi4P9uWMGepeNan0WJyt6LndhnQMKdbO4hlMXpy9k3zjcIFzjQmGWc2cRBKkIlj
	pS1elRhSHIHycUMFPpA+gOPz/T0A2fIhmNL6JDWYg0rsHAmaJyx35ghvDKRyTkFDhWfhIyDuSyB
	lqgEuFD1BteOMgh9KVpw==
X-Google-Smtp-Source: AGHT+IFE1Vnf7zp2knUPF6yAEnxj56xkN0ItjqfzEh1DT7fbSwSU9DzT/Mss/kHxDSruSnpGcPcZVA==
X-Received: by 2002:a05:600c:699a:b0:46e:32f7:98fc with SMTP id 5b1f17b1804b1-4775cdf46b2mr2500505e9.21.1762279805418;
        Tue, 04 Nov 2025 10:10:05 -0800 (PST)
Received: from jernej-laptop ([178.79.73.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477558c1a03sm24688685e9.2.2025.11.04.10.10.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 10:10:05 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: wens@csie.org
Cc: mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	samuel@sholland.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Ryan Walklin <ryan@testtoast.com>
Subject: [PATCH v2 03/30] drm/sun4i: de2: Initialize layer fields earlier
Date: Tue,  4 Nov 2025 19:09:15 +0100
Message-ID: <20251104180942.61538-4-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251104180942.61538-1-jernej.skrabec@gmail.com>
References: <20251104180942.61538-1-jernej.skrabec@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

drm_universal_plane_init() can already call some callbacks, like
format_mod_supported, during initialization. Because of that, fields
should be initialized beforehand.

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
Tested-by: Ryan Walklin <ryan@testtoast.com>
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c | 9 +++++----
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 9 +++++----
 2 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
index f97be0040aab..9b786e5c7f3c 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
@@ -304,6 +304,11 @@ struct sun8i_layer *sun8i_ui_layer_init_one(struct drm_device *drm,
 	if (!layer)
 		return ERR_PTR(-ENOMEM);
 
+	layer->mixer = mixer;
+	layer->type = SUN8I_LAYER_TYPE_UI;
+	layer->channel = channel;
+	layer->overlay = 0;
+
 	if (index == 0)
 		type = DRM_PLANE_TYPE_PRIMARY;
 
@@ -334,10 +339,6 @@ struct sun8i_layer *sun8i_ui_layer_init_one(struct drm_device *drm,
 	}
 
 	drm_plane_helper_add(&layer->plane, &sun8i_ui_layer_helper_funcs);
-	layer->mixer = mixer;
-	layer->type = SUN8I_LAYER_TYPE_UI;
-	layer->channel = channel;
-	layer->overlay = 0;
 
 	return layer;
 }
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index a09ee4097537..bd6c7915bbc4 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -485,6 +485,11 @@ struct sun8i_layer *sun8i_vi_layer_init_one(struct drm_device *drm,
 	if (!layer)
 		return ERR_PTR(-ENOMEM);
 
+	layer->mixer = mixer;
+	layer->type = SUN8I_LAYER_TYPE_VI;
+	layer->channel = index;
+	layer->overlay = 0;
+
 	if (mixer->cfg->de_type >= SUN8I_MIXER_DE3) {
 		formats = sun8i_vi_layer_de3_formats;
 		format_count = ARRAY_SIZE(sun8i_vi_layer_de3_formats);
@@ -543,10 +548,6 @@ struct sun8i_layer *sun8i_vi_layer_init_one(struct drm_device *drm,
 	}
 
 	drm_plane_helper_add(&layer->plane, &sun8i_vi_layer_helper_funcs);
-	layer->mixer = mixer;
-	layer->type = SUN8I_LAYER_TYPE_VI;
-	layer->channel = index;
-	layer->overlay = 0;
 
 	return layer;
 }
-- 
2.51.2

