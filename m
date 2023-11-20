Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41EED1DDFF
	for <linux-sunxi@lists.linux.dev>; Mon, 20 Nov 2023 21:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YM/H1k1d"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-32fadd4ad09so3655591f8f.1
        for <linux-sunxi@lists.linux.dev>; Mon, 20 Nov 2023 13:46:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700516791; x=1701121591; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UFS8KKprIzFM0zE+Ai6M4ORed6sy7M8DbezDgWX5KRQ=;
        b=YM/H1k1ddf1bqfd8nVq0a9gky6rTUnf31UO58RcASNM9R+Vv9yMYAtLZcwgY3Qasg4
         uZ9UUdjoA4+isR3vBp7w8mJsApKCa169ZiQlyjtGBnCzRk9HrTylVtzPfgJjyE85cuLl
         wBXELi57SuDC5Im6CJ9+IFIcRGCzGsPxMJ/TC9Ta6ZjEHXLNVMl7h94jFCAqQTcf+q9F
         44AITpBS0o2lYcIrvU3Hk07EoGxcxLcwY0LsRqeCSXHcHVdBxHqker47Vu7JDxLO0z7f
         crap7u2sQOMyYJcmLr95cQGAKrhKSe34wnhDxlHjkWlVxk/WyNfmgtNWrT4dtUsIMyUV
         0V/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700516791; x=1701121591;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UFS8KKprIzFM0zE+Ai6M4ORed6sy7M8DbezDgWX5KRQ=;
        b=GYNaDybk9nsmDy+3+WGZc6VKFxs4e1HpSWmZIB/11HPMTMlTBobcKK3wBpGqwbmZjb
         ZDLT9fcraoNNLwQuPw+SaYjOEPNUidcaPHRuw+Vc7FImwJ5/zuqqy8WzycbaXNDHWHvB
         iZC2V6Y7UHSdelghkKlLggGVssbIpcEsDyf2y6zfWGGXRHz+eUUkSKx1BCX0w9PDQsjV
         pN5S1gAVoaKtRelNe/UuHXTbdRy5UpmK6NRS4rdczbDyaABJBvwxAroRuL/q/l1hukgO
         8SEqzxzDOUcz53Xt4QLx4mVQQRVjYszTu2sb8wfFYXpeJAl0SrSAUZkSbVVV3xdDidVs
         gMgg==
X-Gm-Message-State: AOJu0YzlCtvBf7iW3zRfi4LnwjZweARmpMrhNMxufxcpA4lRqxRGpKQs
	YwxSl0vxZhU1bQ3qbxDT5Wo=
X-Google-Smtp-Source: AGHT+IGIRCD7UdLrZN9lSzHXmAgpmrQY5+HhoNLOuQvKT6vBAsOc+D+u9/DgXsMWlG54R5krCGbd6A==
X-Received: by 2002:a5d:4151:0:b0:332:ca69:2fb5 with SMTP id c17-20020a5d4151000000b00332ca692fb5mr1904733wrq.11.1700516791362;
        Mon, 20 Nov 2023 13:46:31 -0800 (PST)
Received: from zotac.lan. (dynamic-2a02-3100-9030-5a00-2223-08ff-fe18-0310.310.pool.telefonica.de. [2a02:3100:9030:5a00:2223:8ff:fe18:310])
        by smtp.gmail.com with ESMTPSA id i13-20020a5d584d000000b00332cb0937f4sm2667052wrf.33.2023.11.20.13.46.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 13:46:31 -0800 (PST)
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
Subject: [PATCH v4 04/20] drivers/gpu/drm/sun4i/sun4i_hdmi_i2c.c: remove I2C_CLASS_DDC support
Date: Mon, 20 Nov 2023 22:46:07 +0100
Message-ID: <20231120214624.9378-5-hkallweit1@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231120214624.9378-1-hkallweit1@gmail.com>
References: <20231120214624.9378-1-hkallweit1@gmail.com>
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

