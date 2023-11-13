Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF9621CABA
	for <linux-sunxi@lists.linux.dev>; Mon, 13 Nov 2023 11:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BT+/mGG7"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2c54c8934abso58711341fa.0
        for <linux-sunxi@lists.linux.dev>; Mon, 13 Nov 2023 03:24:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699874645; x=1700479445; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2A7KgJeMP1lI74vlMRztf0ZeAIQKlR0j/L1YwdkkguA=;
        b=BT+/mGG75Pz9UWB3vSVHukLQ+rBKgAqvbVnLBXDkOG8fAs1P3WbOojvGHal8Y8qJaT
         QbVvl3JP35O9InGbeiHiRusGBCPDgv23jiO9453dHWZR2ULZlZacCogGKa/FiiplOAHX
         0JnE/wdih7zo+6Bhb9ON4+cX+24f6RA6db9E44AWwRlRk5ciXzAZOOLmPhK4bmL+jtfo
         vqEV4l8WXJtp5ESL1DPyhNqTzvL9vF3SAAYbCLF0LbOrd+D8BBskkcG+c1MJvUiN9aPr
         B+wccUdW/8wogVoo8RT5TpNK9ctN2NnIw7gbuC3oPp2UGWggp2cYzeVkb/FM3P/u9BWT
         3f3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699874645; x=1700479445;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2A7KgJeMP1lI74vlMRztf0ZeAIQKlR0j/L1YwdkkguA=;
        b=lBPt7jMKKcPfRyuivvfFFDFtFfhHmFYjW56FcPB80HupiaSgUmXbC8ziKn06bI95Kj
         jHdjgBmj4r2dacwvlZ88x1lVczzE9MQyzZYVfKlgJ61Zg+7Nme4Y13ueOCqOG0zYxKKp
         nZ5KUWZ3DycJA2MinCniTjPWtvXi0FMAEK2931J96u/oeBNhX0VrfwoNZ5uWG7ZLVoSd
         2aEtBSjaiHZxm6KIRJ0cM0Tor7fDPVkhE7jaGx9IOQq7DmIEA2Z8KNXjzJYzRC59BXnt
         vDLqNFUVE+e6wYRj8i2dfYA5UFDH9dUV42912HmKD/JMoXKsyB8LiGWN797FBsg52IUw
         iKYQ==
X-Gm-Message-State: AOJu0Yx5yUSEFoXJQWZukaNhGslf+bHs/XD+ZkGq9ym+VS+Ud6tDWeoo
	244aKsYTBCM/JfZC1LWBZAY=
X-Google-Smtp-Source: AGHT+IE/vWt8sIluAJGbzp4DA3YgSD9QnVjHE9gZQVa6sNYXW8a/yNVaWFtAUhPLeeYxcoE+kXqeow==
X-Received: by 2002:a2e:8954:0:b0:2c7:7b65:60b5 with SMTP id b20-20020a2e8954000000b002c77b6560b5mr5041996ljk.30.1699874644560;
        Mon, 13 Nov 2023 03:24:04 -0800 (PST)
Received: from zotac.lan. (dynamic-2a01-0c22-6e16-fe00-2223-08ff-fe18-0310.c22.pool.telefonica.de. [2a01:c22:6e16:fe00:2223:8ff:fe18:310])
        by smtp.gmail.com with ESMTPSA id l19-20020a05600c4f1300b0040772138bb7sm13565787wmq.2.2023.11.13.03.24.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 03:24:04 -0800 (PST)
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
Subject: [PATCH 04/20] drivers/gpu/drm/sun4i/sun4i_hdmi_i2c.c: remove I2C_CLASS_DDC support
Date: Mon, 13 Nov 2023 12:23:28 +0100
Message-ID: <20231113112344.719-5-hkallweit1@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231113112344.719-1-hkallweit1@gmail.com>
References: <20231113112344.719-1-hkallweit1@gmail.com>
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

