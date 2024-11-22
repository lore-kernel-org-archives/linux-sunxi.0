Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A303C18BC32
	for <linux-sunxi@lists.linux.dev>; Fri, 22 Nov 2024 09:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732266795; cv=none; b=uW9l7TwNMnVryKmedNdqiuH0yzp+GnhLgWeiNYz64Hflb4C1lhCntHvOcK7Y44BBlwJUeeK14Stz77KTSy2+ALYot3mKi7NDppNIKImohCjhYyXWgSduWVSXOtr1pDq+w4vvGQZCyn027uv/ALk0NGrpAblm/gDiVxlViavkj3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732266795; c=relaxed/simple;
	bh=cHHtfh9y6/Xe5pWD0imwgSoaSzh5tOQpdFVxQZ5xP/s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WsqifhVyMJ5L/sX9AGQ5niY/m8zUcgqS9sGsx5CERbYyEeK1bDmAd8I1Dy3kIId/kBH0wggn36W0uLHpjCNcU+v5JEfB/Jq4ieVRvpRSg5P+sFguPeQmNO7X4JYjEsAemhIB6x76OTrHz/XZxiWSRTZ9CtjY4qDOQEkXCxkGSK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OmUWGxOK; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OmUWGxOK"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-53da3545908so2161247e87.1
        for <linux-sunxi@lists.linux.dev>; Fri, 22 Nov 2024 01:13:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732266792; x=1732871592; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6W3bqmSBPUsE+fVjxjecsCfWlJC1+mE/7mRAcZKJqvU=;
        b=OmUWGxOKNYRoM7ZeVOleScRBTcNuZ0xfZthQS5/nviBXYao0wOu38vuWYDcWOe8hnq
         W9VKuP6bu24JMJZksO8RHd+bpkhWXoO7jV64Sq7BDLXVR9FB2RxaHg9vQqsy32z5yDNu
         a2I77/AgQ5eIy/eNi0kHsGf5TDJIcHzSfrCOFF6/NRlEDesix6N3f58h3jPCWv8rt4J9
         q04uGEbFvvCif5HEYI1I8q18/Kmrv/d4pNWqbNLQ9m39Nl6C85s2Ou5mbKdh7k1YOADm
         X1jF0t6VAxBZWExZ6NfN2DBG4J+4mSlDZsvnLXQnIGwxP6WHmJ38d9vc5uF+ilV8TiV0
         IhNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732266792; x=1732871592;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6W3bqmSBPUsE+fVjxjecsCfWlJC1+mE/7mRAcZKJqvU=;
        b=KX3AB9a+jQ2gW+v3JEwF/RO3+hKZ+Se+P6TKmq0gm6EvvcGc4H1LCUnr6uB4NJ4V8M
         ACAH+lD9clTNMFN9RGc/goK46h+BvtXJAsFQ9J08ZNAzwdWCSRDmpet6fSgxRide3xY1
         WycGOgO+YuS5Gp5gpdJBrorAJ/46KD4YrfZLoC1RB4G1RV7MQz+PiLwULSJALXxGmUYu
         OXqvf9dFOFs7n3icuzQ17Vr8ek1p3L8bLjWXXswVAMPn5tFeDptX0mMUsJtADwq1fx3r
         C9iDfOrs7BZ/3OC+elNBBaDhgXqlAypoaYkpHTEf9QWxVw1yPmZtngdWHsqNPaUqHL0p
         3I+w==
X-Forwarded-Encrypted: i=1; AJvYcCWJWPPex4xRYBkFIrNFUg15MkCOOC8zDETB4xDJUoW1B6cWC4iAvJHCN0/1xE32LlfdQ42zPJhgmZ5/8g==@lists.linux.dev
X-Gm-Message-State: AOJu0YyQzYwJLMyw4wN3bOSehNcDSP24tThj59cV248qUDyL2O7z3yAT
	T7oMA8OazmDT7Ml+gzUilWnesEBCH/C5VLrrnhI0K9mZ5W/BCzxj+en1U+JEQ5k=
X-Gm-Gg: ASbGnctOXlxjRQTSPrQEi6q7JA6DBqCCVe8K7t+Bh91tYVyHF5Mohv0IzQNTuSQ1XhK
	csL+xJ3/w4t6sTgy/Y4qUbT0J8AEgSC7XkQDcRiwXJXfYoMy4YmxEHZl4CW/khi22mCUT3tjrXr
	a/fXMzaqU1xJNc3JtjYeXXSOv0Sqw8OcYf2V1cElh3tiFHamhcn+h7/ght9kr8jv8YmexOHIdVu
	X4OwE8IyTR5twAMWDcHpQnU/2XBPIcSpArRkwLIcjaaYZtVWFLL1Txqjw==
X-Google-Smtp-Source: AGHT+IF9ThfWnsEQI6UyED7pA9h6Wf7FpGWyg1saUJdib/WRVSKuqZ2ksQYV61QNiecHx3mAhZLedA==
X-Received: by 2002:ac2:568f:0:b0:53d:a024:ddb2 with SMTP id 2adb3069b0e04-53dd37a6c3bmr1142300e87.24.1732266791780;
        Fri, 22 Nov 2024 01:13:11 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53dd2451386sm299530e87.77.2024.11.22.01.13.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 01:13:10 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 22 Nov 2024 11:12:57 +0200
Subject: [PATCH v4 01/10] drm/tests: hdmi: handle empty modes in
 find_preferred_mode()
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241122-hdmi-mode-valid-v4-1-2fee4a83ab79@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1147;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=cHHtfh9y6/Xe5pWD0imwgSoaSzh5tOQpdFVxQZ5xP/s=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnQEshW4nqOdXL0T4IVeWcFtdcIU865J/geaZOs
 dJST3YPq1iJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ0BLIQAKCRCLPIo+Aiko
 1aCMB/4mAMbVULeSJaQKgD/thf0SdySNUWeV6CvGlRgfogZod1ZMqfju5iE0YiqI7xy28Ycv74E
 B0vuUvxyNt+MKQbKrGS8BTlEhjMqCpiI/CHQBw9F6k2HpfGFkrWHDIoMHaaoW5DaERqX6xacG/s
 DhPpiLyKV55OciJGf0cj7Okd9I+OzcIvE3aVDAo8uG6emEXX0UO2hya4rXHN74Rwop72ki1rJn+
 7Co2fSv5VYDWughxDBVCLzuLe6u6WeSCbhxlSg97MXogFyunITxmcV5RlLk5Z5TQWDhuX4634jq
 pnHjEf3jhAkLQer5IkvtUgJ1d8uMHBw5CJY0WH/gX/wWSOgj
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

If the connector->modes list is empty, then list_first_entry() returns a
bogus entry. Change that to use list_first_entry_or_null().

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

