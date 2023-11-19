Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37E1AE540
	for <linux-sunxi@lists.linux.dev>; Sun, 19 Nov 2023 11:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k03fE4aN"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-53e04b17132so4911121a12.0
        for <linux-sunxi@lists.linux.dev>; Sun, 19 Nov 2023 03:28:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700393313; x=1700998113; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UFS8KKprIzFM0zE+Ai6M4ORed6sy7M8DbezDgWX5KRQ=;
        b=k03fE4aN+223VrUBnuX6hUl2kFOlt0+As8aIHGK/yv33PML+nOibhZ7uvHG/LHtSoZ
         AkMD9ayWeLQ4fFrx+kCO2BTW5pm9MR6BvQNHZ1+NNJlSh5htjYBGyY2YUWoD/485oaoe
         TBUnYkXI22n4cCAG2kUtBtPNXnjIUXU0v9px8Z06qXfn/ii/X/htHK4xMbAQafb2iqOD
         MI0dUyzGExGmxyLszWcFymcBp5n1YqY9mo9fkLNiblwfouceelM6xVJXDRswc6P1yp4J
         2pFaNzczh2LIlPB6z8GdKp/HPP5kNY+VQBDGzN2/uhtODaOiTr678zVxhTTqd0foaLZE
         RJ0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700393313; x=1700998113;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UFS8KKprIzFM0zE+Ai6M4ORed6sy7M8DbezDgWX5KRQ=;
        b=irDluc1DEJaxCt1sRktoDd7zXI//uDyn5yFGERxIzyp5NVWvwbJQv9mgH2WX5oYMXd
         /dFaZlTN5rFsUWbaUK6KN24q5Py134T9kvchWc6m9R3G6ndBHwViQ2qRhvBm2EYe8+Bl
         BnX6fRqyAl7gDk2Bv9VKgFad/GeqQhNS6PWJqKVmvuO0CgTQPDA/diyP8TAJu2EmIr+m
         9SG5JXjxqL5yaxcj5tvNLa/RBZ7z/uSDLlFGfrfyj4J+j0236cp4+cgXHJ7w0q9587Uz
         jJzA8dSDIkPZ5Vv2YRu1RC1l4jA93YqK7XpK32M4de+gAGTHvJWgpIUMEkJiVsnq0HgP
         H01A==
X-Gm-Message-State: AOJu0YyQqswnkQ9C4R4TbqiKFf8QGVPCIny9KzhvaOPN4/GAp5qAcONi
	2tW26T5daEMBkI8ZIdEgC40=
X-Google-Smtp-Source: AGHT+IGsco/wc6xKX5vo5lzmFcA2w842hBPgh5O17c6HmrxwSBPZRu/jKD563TwiQ42AUE9ZznEjpw==
X-Received: by 2002:a17:907:8b93:b0:9c7:6087:49a7 with SMTP id tb19-20020a1709078b9300b009c7608749a7mr3289054ejc.43.1700393313184;
        Sun, 19 Nov 2023 03:28:33 -0800 (PST)
Received: from zotac.lan. (dynamic-2a01-0c23-bde4-3e00-2223-08ff-fe18-0310.c23.pool.telefonica.de. [2a01:c23:bde4:3e00:2223:8ff:fe18:310])
        by smtp.gmail.com with ESMTPSA id k22-20020a1709063fd600b009f8af454d0dsm2420378ejj.112.2023.11.19.03.28.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 03:28:32 -0800 (PST)
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
Date: Sun, 19 Nov 2023 12:28:09 +0100
Message-ID: <20231119112826.5115-5-hkallweit1@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231119112826.5115-1-hkallweit1@gmail.com>
References: <20231119112826.5115-1-hkallweit1@gmail.com>
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

