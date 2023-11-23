Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5277F21352
	for <linux-sunxi@lists.linux.dev>; Thu, 23 Nov 2023 09:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MgBYOLOi"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a0064353af8so344411966b.0
        for <linux-sunxi@lists.linux.dev>; Thu, 23 Nov 2023 01:40:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700732448; x=1701337248; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SLxIO8jymMsGgax9WMIUOf53Q8UCr/7PCCK8+C8vDXQ=;
        b=MgBYOLOiAOuJ5vU0fmaFa06Z2jjy3i/CI0oixpoc4YTvwipjdK9ntLG1azEJtaTFuM
         MzCXXnzikVMCQoejWmKYXO/IP16PRWL/Oz9RdxiypzThEiAcFHMkpAnxc0Dul79c1F4h
         ewUSj3nldRWTEP6jFMdXN71v/aR3y0jW91YqULXhy3bPJ5FdbDfzs9c6AHPugYHROEDS
         soVLqSYKoqisBI/Lx9YWaBDIZEfTNlySmfiHsYhT3+PIo/oHHP5uzmBOU6//DfO+glhO
         +JwFRlirH27VQINettG/XYy+luv2RLpnTldiIMx3yHfoEY6ZuZeeVQY94Rg6NIob55tP
         QHFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700732448; x=1701337248;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SLxIO8jymMsGgax9WMIUOf53Q8UCr/7PCCK8+C8vDXQ=;
        b=SIvICTNnUGfFj5z9rRxRJUlonEMQWJ4LjUaQqz3qn9VRoK9XjZ53R8rB14gAjQF/Ei
         mAqOtl/hbkVcOkbkHCzTu9Oh4Vtr9+vmZydaLfMnbBt+FRWXAZBFbFeS+dhkivGQf4Ha
         P44rsUYDA/E4nwrx09X/SK8Gep9vWULklvklEg2XYavnugEfrHq8HnV6O1p8BIxPkTIs
         dZP+wTQHO8IplVvt0nA1/qCJRNfhHvNVL7KEzvebl7Fnfwk10qRTJF2PqiA175ATqRZG
         /SLeLcMJ48dzoH8yV7joq1TxCsPY26NtfV2Cjy81aLvzF1RUANk0kCRYYUc7GdqiklBZ
         aKgQ==
X-Gm-Message-State: AOJu0YyIGdDLCSRmkeb/t0mZvVO8GiDc9Bpgj1V3YFmsqzDAnFberw1w
	FOkQzW1e+693ht3ndsGpqqA=
X-Google-Smtp-Source: AGHT+IHAAgtMNPgGG8plHKbnTsqENUj/FChwDuBx+Jt1UJ0zF6uKp2U1sG6bXy9dBnLTJPdZkoeP/A==
X-Received: by 2002:a17:906:78c:b0:a04:e1e7:d14c with SMTP id l12-20020a170906078c00b00a04e1e7d14cmr1773863ejc.32.1700732448312;
        Thu, 23 Nov 2023 01:40:48 -0800 (PST)
Received: from zotac.lan. (dynamic-2a01-0c23-c0f2-3200-2223-08ff-fe18-0310.c23.pool.telefonica.de. [2a01:c23:c0f2:3200:2223:8ff:fe18:310])
        by smtp.gmail.com with ESMTPSA id s9-20020a1709066c8900b009e5ce1acb01sm546199ejr.103.2023.11.23.01.40.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 01:40:47 -0800 (PST)
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
Subject: [PATCH v5 04/20] drivers/gpu/drm/sun4i/sun4i_hdmi_i2c.c: remove I2C_CLASS_DDC support
Date: Thu, 23 Nov 2023 10:40:24 +0100
Message-ID: <20231123094040.592-5-hkallweit1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231123094040.592-1-hkallweit1@gmail.com>
References: <20231123094040.592-1-hkallweit1@gmail.com>
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
Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
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

