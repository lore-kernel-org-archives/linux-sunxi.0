Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7E4E24502D
	for <linux-sunxi@lists.linux.dev>; Thu, 12 Jun 2025 13:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749734125; cv=none; b=RVv/VvODhKzuvDpqLtWda0aRxVs/MQXqhl1AjDvHW8ZTHcZfWuoT9GZpV2O1xTFczBqzVgcH/mNOI9T9WZEKrQp4xzcqClxTFv8PqkN1imPCsOzCRFEyflp6WjbiR33cR6GEXaMqXNAqCBqaMrG4te/dT44eBEJOHRHI7KLFDD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749734125; c=relaxed/simple;
	bh=r0qYcU16DOOXB/L65/ELIol1UcVjLdmj6pz7lcDecA4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oX65ZIjx+lX3nN2eq3nrE2Rlmr/m6dep+78sZuYDmcy1vaWYXAnQ2CwbqzUoZPYhTjFbwcxpELbh7HPgSIhLy6g2H0tFsOaUBxQQO4GR6OcWb28psaG4FYmrt2UaQmv86Ot8OSJIP6UuP0wQTT7sKtuy3jiBJD/MJj3DZSIjpMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=O22PwNfp; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="O22PwNfp"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-450cf0120cdso7891235e9.2
        for <linux-sunxi@lists.linux.dev>; Thu, 12 Jun 2025 06:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749734122; x=1750338922; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zmZkKLxN2UmLakt+dPeotcVOQqoR98FTAzfeh6JlZVI=;
        b=O22PwNfphtBKDcsjbts9sPI/1I09EFNtAI1GTkcXrOMwzbyU1Ht4aghwN518/fWSyl
         d8GbWEd6Dw8gjd42HjFtVwOr8hFFd6tbsXKM2dGfVKjqoCyy9Ne0ENaYYvNNA/5I7rWF
         mNjEcmBWfnXVZmA1QLVTBy7NBL4ryCGXE+qOQ4ITstfnaqKE/XneP84Y5TCWe2AQI0pJ
         knJLp8RsYOUlqxSp5HzbQeBMmGjfvn43yiVtWqVSN3CB8cH8FkRBecGPngFpSjiymHsg
         EgSsEfZsp4mWHQQL7l4tOg07FG8aQgjXpdJaPcG9tdG67bTYynb+nGHP5EWIxqbjE464
         Zxng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749734122; x=1750338922;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zmZkKLxN2UmLakt+dPeotcVOQqoR98FTAzfeh6JlZVI=;
        b=H9AQuIve3Bp2lVMjMcPZ4Uu1JAVtnXJX5tHYhaGPbvxUDWOXJ9k+QuKU4lZmdKMPTU
         DSBoizGFBhCU1x0SrWHv9HivE2UGfrfbsTMgqtUbWc6aMO5hkABqgGObLgfh7TJHCApJ
         1dN21zj8wJGtAtQUvU/gw6FoCNTEtX8RSJyI3wuvE/0G7kq0ItPsOop97OkwoZbTfb/c
         z5crTFbvIeuRHBJgvf6Tio2v9wpLHcR/F8f4yd8llXKYKGTsMipAI5GV85bVa+AVL4w2
         aC6p5CwB8pf0LkpZbfIrV7tKB71QyqeLv+c/TKiirOHehhXEsdKWGX6NYy/1HEQVvWHz
         gpkQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZonJKrBoD7AxTvZZpZaITY/+lodu+Z6Bxnbb+Dk2xY3Oo89B9ZK/INyYYx7AdDL84hYvhsmV+WJUeew==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzbe7IEO5vsOuFcK1l+FG70dwfT+RTSdDUqLd8PZiZhMZ5AtBlE
	SNHN64edGkFoV4sBVEzfi3J/hjhOxlUad+TFQA3YDyUrsbu43dPCkIlXdMv1oKlrCVc=
X-Gm-Gg: ASbGnctqK6YLrSaBDo2YCZlb/LeB1gYPU+Dy0I659y/2wHQRXIefwndFJgDJclMWmYJ
	0sMvGpFvf+oL2mnKO6xO1IdzcF47LZ+vHlou360pNNcPZC10PVCL5Nf+jqXOC0w+FhEOd5cmSKO
	e38fNxnxersnvxajTdD9EDM0w7Tlv5GV7764yJ8LqXz9Ym8f61ff5dI+XoSMzbOD6G2glX16yhH
	6RRMzIU5D7inDn01H14L///ZlCTowt4Lp37IC7LuS1p9A0Uvxvl1n8XWXwlqmCbImrIZ/zAhsrV
	SztTu+k7Iq0Je2tHziF3eX3mAt/hkurn1k2uPNB/nYF+c599pY+C4iM=
X-Google-Smtp-Source: AGHT+IFdr6eiKmLNU1U7PCiAyyEcaNtod1q+PU6cBesinlO+7E1MRjBPyMho7YxEmPTyFNNlQJ5EIQ==
X-Received: by 2002:a05:600c:c16a:b0:450:d61f:dd45 with SMTP id 5b1f17b1804b1-4532d37700emr31586985e9.4.1749734122088;
        Thu, 12 Jun 2025 06:15:22 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8b99:9926:3892:5310])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532dea17d7sm20619795e9.10.2025.06.12.06.15.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 06:15:21 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 12 Jun 2025 15:15:10 +0200
Subject: [PATCH 01/16] pinctrl: sppctl: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-gpiochip-set-rv-pinctrl-remaining-v1-1-556b0a530cd4@linaro.org>
References: <20250612-gpiochip-set-rv-pinctrl-remaining-v1-0-556b0a530cd4@linaro.org>
In-Reply-To: <20250612-gpiochip-set-rv-pinctrl-remaining-v1-0-556b0a530cd4@linaro.org>
To: Dvorkin Dmitry <dvorkin@tibbo.com>, Wells Lu <wellslutw@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Patrice Chotard <patrice.chotard@foss.st.com>, 
 Support Opensource <support.opensource@diasemi.com>, 
 Baruch Siach <baruch@tkos.co.il>, Sven Peter <sven@kernel.org>, 
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Viresh Kumar <vireshk@kernel.org>, 
 Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev, soc@lists.linux.dev, 
 linux-sunxi@lists.linux.dev, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1728;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=LieHmje5ivI5luNfORERBIvPNT4Z77mh5n845VHvScA=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoStLk4RH7GPVp8SssQRxQJp6gzZ2YETuVm14Kq
 ofe5DUznf6JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaErS5AAKCRARpy6gFHHX
 cr/lEACI6ET2WlvZ9cyQDzGwOdmiCfZct2usLbI+rS53HlFtmhOQcNkSmaUGnwVPfPHX1OKG7u8
 dbqcNZIdDG6lrAjwrodXYH7a1vrgYl4fLrudzgfzXyx/pyT+4NJZvRWfprR4w4TraR6/W9iQzdO
 wP3bL6aoNjJQjxz3P0ey6wN/zPuvQJaxjAh+lJDMEFh8mz5P0UDMZ4D66yIKi2Cm6Ea0xZgGJyR
 KJOGz4mct+SIxm358x4VzGpQckl5dZF0hqK3CfjD+MAe595dVdFJ2m9NghpyjJV+xYYUrA/tl6T
 yHMxNVVaczWBNyvrynetjzEFh0LHJ1lK3woV+mzoiFeXT5PaWXJBhxTJeXBSdXAs1EdF5DWjeb3
 gf1xcSBfd9eqV2bTnSYtjsgobI3JYLTeFl7LT9h9GtJ4HfD39BuzyA0Ss0+ZAkP+0RbhARTf8Dd
 LNOqMPmFirJVka+ELdb1qNf56x2cFpRETLOdZ2OtNsAS151YAwJDiLLKBI8FLDvUqxbNK1sST+S
 4M6hYV9k3URKnrim10RgFTxPcQrCuW5q62+1mTRUjg7XxpIUlrSdX6TtvPqWmtMoY1zM71OwHl7
 f4ZCx+47It/Y0/pIQzZWm31bgsmNv2MW2oIhK/1QHFPK/JDVZtvJPYUtr8AXF+ZEHgJcPqFCZ8s
 MScuhzi/9MgLUwQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/sunplus/sppctl.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/sunplus/sppctl.c b/drivers/pinctrl/sunplus/sppctl.c
index ae156f779a16b8c4bb91c4cb0d5d4363ebd15d25..3c3357f80889a95c46557b3f8129882d2ce96f6e 100644
--- a/drivers/pinctrl/sunplus/sppctl.c
+++ b/drivers/pinctrl/sunplus/sppctl.c
@@ -461,13 +461,15 @@ static int sppctl_gpio_get(struct gpio_chip *chip, unsigned int offset)
 	return (reg & BIT(bit_off)) ? 1 : 0;
 }
 
-static void sppctl_gpio_set(struct gpio_chip *chip, unsigned int offset, int val)
+static int sppctl_gpio_set(struct gpio_chip *chip, unsigned int offset, int val)
 {
 	struct sppctl_gpio_chip *spp_gchip = gpiochip_get_data(chip);
 	u32 reg_off, reg;
 
 	reg = sppctl_prep_moon_reg_and_offset(offset, &reg_off, val);
 	sppctl_gpio_out_writel(spp_gchip, reg, reg_off);
+
+	return 0;
 }
 
 static int sppctl_gpio_set_config(struct gpio_chip *chip, unsigned int offset,
@@ -545,7 +547,7 @@ static int sppctl_gpio_new(struct platform_device *pdev, struct sppctl_pdata *pc
 	gchip->direction_input  = sppctl_gpio_direction_input;
 	gchip->direction_output = sppctl_gpio_direction_output;
 	gchip->get              = sppctl_gpio_get;
-	gchip->set              = sppctl_gpio_set;
+	gchip->set_rv           = sppctl_gpio_set;
 	gchip->set_config       = sppctl_gpio_set_config;
 	gchip->dbg_show         = IS_ENABLED(CONFIG_DEBUG_FS) ?
 				  sppctl_gpio_dbg_show : NULL;

-- 
2.48.1

