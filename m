Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B61FB1944D
	for <linux-sunxi@lists.linux.dev>; Sat, 18 Nov 2023 17:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WSiGN8BO"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-40a46ea95f0so5326755e9.2
        for <linux-sunxi@lists.linux.dev>; Sat, 18 Nov 2023 09:42:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700329350; x=1700934150; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2A7KgJeMP1lI74vlMRztf0ZeAIQKlR0j/L1YwdkkguA=;
        b=WSiGN8BOQ3ux0CCT/KoSKKhtrVDDuXuAEn38+O7KmufLnKwrtCnpRAbBsxOlaxQYYf
         egBvroeckW5UHasnphTcnG+ZdGPSE95zlj6q6ENzfdW/0TOBlJGN3VWse8YJlqvUyi0v
         gE869c0CFfUFvMO2UHuACn0lMTSTwcn/ToBZq+InSFrcSI7Mc4C/i8GDwpgjzBp+4nOG
         SE4RrElVQYzfq+88H1Be+JsEBxCvQgD77Ll3gluTlrK9baAJl63XnzYBHd+pJPEax/MK
         7AazkSoecubLC1k8h6d3+6t70aTJLqYgS3OSDz5rlzmvFyAHBpPAbMZlHNfDI3ZPIMGQ
         J0+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700329350; x=1700934150;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2A7KgJeMP1lI74vlMRztf0ZeAIQKlR0j/L1YwdkkguA=;
        b=C1m8xtbRWju24YUCLaLNz6V9mEF132cCA4zxfdOgJIapBa+hbKb1FvArbcPPyV7F5C
         tEB6U6WB8bXDGn9tJQBvDHiGfXxRC1LBp6PHGmqxeWIkhNeLBLPsMwxrKY8LL75w/7K1
         z+vf6PaeoiE8wShXwD7DGp+SQOIfdiMFczHG1Sxc2ty5UgEenTRPPxAb5xb83tNe/Rpy
         3Wkb14z9dxMM63KmpbccTwPu1Jgog2YRFPlHyGmsU4gskae6l8ZvlqTwtFSfyTOmilMx
         rjd0zbDyL/oxtBC77EAjOo8GDlKf9K1O0zRmPIGfBb7IHBzTrwoL1OQgAis7d86eQv89
         AUFQ==
X-Gm-Message-State: AOJu0YziyGZEXo9/RtEowaEfzaAPry6f+b2WBWrjv3aZEk9nFnoanWLb
	WVjV9+UyXhfaL5fkkZGJQYvZf7t1uYI=
X-Google-Smtp-Source: AGHT+IFhcmh+HF8fxApZE0ppjzudwwON5aQtR0W323i40dvMUD5YGJYLj4L/jEO65VvDn1fpwc/WhA==
X-Received: by 2002:a7b:cd97:0:b0:408:3b8d:f7e8 with SMTP id y23-20020a7bcd97000000b004083b8df7e8mr2221493wmj.33.1700329349862;
        Sat, 18 Nov 2023 09:42:29 -0800 (PST)
Received: from zotac.lan. (dynamic-2a01-0c22-77bf-8300-2223-08ff-fe18-0310.c22.pool.telefonica.de. [2a01:c22:77bf:8300:2223:8ff:fe18:310])
        by smtp.gmail.com with ESMTPSA id y10-20020a05600c340a00b004068de50c64sm6964211wmp.46.2023.11.18.09.42.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Nov 2023 09:42:29 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	Maxime Ripard <mripard@kernel.org>
Cc: linux-i2c@vger.kernel.org,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 04/20] drivers/gpu/drm/sun4i/sun4i_hdmi_i2c.c: remove I2C_CLASS_DDC support
Date: Sat, 18 Nov 2023 18:42:04 +0100
Message-ID: <20231118174221.851-5-hkallweit1@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231118174221.851-1-hkallweit1@gmail.com>
References: <20231118174221.851-1-hkallweit1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After removal of the legacy EEPROM driver and I2C_CLASS_DDC support in
olpc_dcon there's no i2c client driver left supporting I2C_CLASS_DDC.
Class-based device auto-detection is a legacy mechanism and shouldn't
be used in new code. So we can remove this class completely now.

Preferably this series should be applied via the i2c tree.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

---
 drivers/gpu/drm/sun4i/sun4i_hdmi_i2c.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_i2c.c b/drivers/gpu/drm/sun4i/sun4i_hdmi_i2c.c
index d1a65a921..f5f62eb0e 100644
--- a/drivers/gpu/drm/sun4i/sun4i_hdmi_i2c.c
+++ b/drivers/gpu/drm/sun4i/sun4i_hdmi_i2c.c
@@ -302,7 +302,6 @@ int sun4i_hdmi_i2c_create(struct device *dev, struct sun4i_hdmi *hdmi)
 		return -ENOMEM;
 
 	adap->owner = THIS_MODULE;
-	adap->class = I2C_CLASS_DDC;
 	adap->algo = &sun4i_hdmi_i2c_algorithm;
 	strscpy(adap->name, "sun4i_hdmi_i2c adapter", sizeof(adap->name));
 	i2c_set_adapdata(adap, hdmi);

