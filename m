Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32F3079F8
	for <linux-sunxi@lists.linux.dev>; Sun, 19 Nov 2023 10:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UFTdwAy+"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-53e04b17132so4862453a12.0
        for <linux-sunxi@lists.linux.dev>; Sun, 19 Nov 2023 02:14:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700388893; x=1700993693; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UFS8KKprIzFM0zE+Ai6M4ORed6sy7M8DbezDgWX5KRQ=;
        b=UFTdwAy+WTKhGvmxnvnbjkZhi5dxw8NkMSblgHmKmYhmjaHWSqtyQQq4hd/+KF/08x
         1coc5GP8IZyq97pe8rOOdjUNTuFpeExwhIBdEjI+D5iuAtrf+rxlaA5ha+NHuQe7uZB/
         jt4tQFMVrZbnsICIs8wsvzKb8N+vukv95hRZK9X3TyEUAyxHiqHYpx5Q3SMjbplAgK+v
         /AWxnXSR+JqqXEWwZTGMmiyXE/LL0+VkYBNy/+pZVvmzaAWKoFOXkqLPZKh5V5iNoYsS
         atlTia9hOJlzEYGR2MJvDivs6vjqq0WCX5hEMDoSzCOEtlwW/vcw7svWE6vSj80Bm5G0
         E2Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700388893; x=1700993693;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UFS8KKprIzFM0zE+Ai6M4ORed6sy7M8DbezDgWX5KRQ=;
        b=bzz9u5Pt62HrQmSl6YH3+NXUZ32YcaMtExM/B+17+m0FSomWrWasSgUQAKSeIAdIyv
         eUrXxy3yhkABYAsUZex3sv6tQoOxyxQWoxv0R9CpZYx6vTdQgdlRTGV6UxIzDbDLFtZD
         NX52zcNY2DOjGpSlQlN6M/ULN0vsL6UyTCsxWt1wrlIJvg1tWtqY29NeRDbz9m9x3zA7
         9mL5CQX/U9LxzU0VN3tJLxACgBHGWkRPfFJxsI+uP0Eml/NKvBRx83XvOKl/WOIS5Cie
         ITDqmObpXLaPm6R7dcKbdeNtNt5pSwh7QQ+hzVPVCTcUBxdLQepCkp6gAMH4vrUR/6Hh
         7iMQ==
X-Gm-Message-State: AOJu0YwBZ+rGbB0te0gwGaj/PvceWZXuHYabaWHLJIN8JM4Txl01YAFb
	SjQJ/C4MUToN7fuYPjX5TKo=
X-Google-Smtp-Source: AGHT+IFcb1Rra71IEq6JfJPC58ag489QhCbPNIPTSnf82g6F4cllHuVlGQs/WMup357oql3Lum0POQ==
X-Received: by 2002:a17:906:158:b0:9fd:a833:996e with SMTP id 24-20020a170906015800b009fda833996emr416969ejh.77.1700388893152;
        Sun, 19 Nov 2023 02:14:53 -0800 (PST)
Received: from zotac.lan. (dynamic-2a01-0c23-bde4-3e00-2223-08ff-fe18-0310.c23.pool.telefonica.de. [2a01:c23:bde4:3e00:2223:8ff:fe18:310])
        by smtp.gmail.com with ESMTPSA id p20-20020a17090628d400b009928b4e3b9fsm2743581ejd.114.2023.11.19.02.14.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 02:14:52 -0800 (PST)
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
Subject: [PATCH v3 04/20] drivers/gpu/drm/sun4i/sun4i_hdmi_i2c.c: remove I2C_CLASS_DDC support
Date: Sun, 19 Nov 2023 11:14:29 +0100
Message-ID: <20231119101445.4737-5-hkallweit1@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231119101445.4737-1-hkallweit1@gmail.com>
References: <20231119101445.4737-1-hkallweit1@gmail.com>
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

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
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

