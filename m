Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39D77246777
	for <linux-sunxi@lists.linux.dev>; Thu, 12 Jun 2025 13:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749734127; cv=none; b=kPY8LFGyoCsrEHjbC43+4AddSvDNVxXrH+qUyMPUtvOojzCFSiC/sePn74MBzPtQCnu9K2W/PF7Z+xvCrO+6g/A83RPLoniiwwji3ZwXchvmMGnTHc2MwdGmrgiO88e8XEjR479+RgT/FLdK9zlRKAu7Nw/GO5YVjkX+WgBgfNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749734127; c=relaxed/simple;
	bh=ouf2Msmzi8BBHjiroC26wEHH+x9bWRaKtDQmEzjftt4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TiThf5v8JccUtOZ947rO2Q7jL1JxwNa982+yQvDSe+a0Gr20WBaJIE8x/91yMawFQe0wUOzRn5k3Vok8AuJogvs6R6gMUkQqezSgI8ZyOZEP0kR1gCR8GB8RjyNXJXfNArhKWSBEFDS/feepCi5XGvpXtFxFC3UmiSFO+foji94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=bXBiT24M; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="bXBiT24M"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-453066fad06so7034335e9.2
        for <linux-sunxi@lists.linux.dev>; Thu, 12 Jun 2025 06:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749734123; x=1750338923; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=raLE52k1FOP5xc4vn5Fhz2KPLej0BIrS83cEFgVPEbo=;
        b=bXBiT24MTtXA8f7EIX3zYS6sFnpuLGDSIDngF2cYm++oZt5Q7wLIW/VrIbGRZAKeMo
         Cm+QtJt2y9zTzfFD3p39P/+bzGymPWYr8hPZ5GHNdCeFp5+9ItWx5zED0A/Shweo20TN
         mKGVhvd4OFmPm4Rn+u5tLldQU7DVD3UklTotUBB67amn+xPedV5YrOOpDhWlMRlcaubu
         ed6XWXOwXAqn7ivQNjxaWs8MhYWhdD5DcmmkdUBZ31PZzQZ9KfA40kXUqrEd43E/f2AV
         l6dneHhksLfIOcknzq/UPevXGYrEIbn3Yb1jQjIdw0UW5ZTO8BrfXE/hLe0Tuw40jnmX
         EQQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749734123; x=1750338923;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=raLE52k1FOP5xc4vn5Fhz2KPLej0BIrS83cEFgVPEbo=;
        b=OsMTpMDrKuK1NSApRfHXm/SPirIYLqYTFfB9LMuTb9sMTYM6lyxUmfszogR3usT+Ji
         y2Q33ylxfZEcueR9OisKxfCaP/GSPfDldhgTmlAM0Jko+RZHPxvfhRnQadFnA+yIi9Zg
         LAexFRXAR9/QeuTYm9jECF0EX/vM14I9skFbnuNgfoZEDU7ONsbdH28Jiy9aCkz/iKdN
         6bm7HJSe9rxJW+94PA4UNH2Tyh1/YNQA7TLnH6ZV7EoJ03QaBNbxjFJnvxRNNUHZIFXK
         1/eXCffSMWmwtZB2ZoWu+MyncZCTsAbcCHauhzKHlgFuWt2A8omZ4CAekiwufkH2vDrC
         Vrag==
X-Forwarded-Encrypted: i=1; AJvYcCVF7bB5fOyf5LgeDP6mnMHv3ac0Z6HBoAT8JvP1xTP/MW5g8yie04vBn/7Tpqh9N4Y4o22pXqEj47yeFw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwX38mIM2g/fZ6Q2xWueuquZoN0IkOw3QhNUL77HoPA69zFTA8P
	PriPLCKxvEgB7+HXrV0vRcLbkVZhCFESg5uyWCkabbalZ2JT70oSPOjB8zFaoP4xbVY=
X-Gm-Gg: ASbGncsT82HErAhe4+gERfZlRRAqwupYFM9avWuidkD6q+DI6qfgbgZxpMbPOi9C34r
	58BKzWriCLZ5361RYr9YOmoZZAhskMvUk5RZlAozDO2BHW4GaSEfbH04pDJ1F5Ed6S8WhuWdSju
	SJLfwycgCuEveneVUgzV60tzeAhvYPse+cCZod7hzCt2tjkHXbVl4jDrZdReghFNs3+yaz5rwBV
	B+2/iDuYgV6whPsDpvudomhnjAszwB1GHeHbdCwF1rTDUk7c4jvPptP59rnqczCDTSdWHAGW4hK
	RFel0lBjFX4oZ9e53dYzwWgaiYknNWVD3LY34KOtnBcDGjC72IsMCHcuEG6DLO3RqA==
X-Google-Smtp-Source: AGHT+IFhdHOEFkYRXt2aGfqR8yUbaKu71Wss7a74LOAwDEENbVsdkagshqU0KdML5k1g7zcI8+VF/w==
X-Received: by 2002:a05:600c:8719:b0:442:f482:c432 with SMTP id 5b1f17b1804b1-453248f9836mr73550665e9.18.1749734123425;
        Thu, 12 Jun 2025 06:15:23 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8b99:9926:3892:5310])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532dea17d7sm20619795e9.10.2025.06.12.06.15.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 06:15:22 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 12 Jun 2025 15:15:11 +0200
Subject: [PATCH 02/16] pinctrl: st: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-gpiochip-set-rv-pinctrl-remaining-v1-2-556b0a530cd4@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1451;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=5oB62agveNry6MooKoxev/dYplc8gqfDNeN0pMdLmAw=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoStLk2dgnIHTbMZddeUKxRSqft05VFU92x1VSm
 HYQEZ9FQymJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaErS5AAKCRARpy6gFHHX
 ci90D/4nF341GcBLvs7mN4+c32OAiw+FWYJXPAOuwi/EUKU0s3AT0CdFTJYUDtLgh4tTL1kGiOc
 0afStrGNH+AilQUqqVnZA54B4xB/xitGdZyKn1L2FMY95sTWY2DLazI9FaWGDJHzYr32Is4+/Od
 ApDWy89r3ZqJPsu/AqFA+u/WL1GS6eGHjsGaCqOJkJOxCd12CtopA1Sa9ykgrwOCvflKi35tefo
 c1EdnStWa+4dhBA2u4ImkGdepns6dNSsrR0sIlxPxCYbNjcxD3Cw12K4Kzh28PwDa+5M2rjPZLV
 HCn/H8EY5ZYroSn0pCawU/zDxL+JoWLupRE7O0mCGnMOV3L6bFSoydD3Y5hmzalmzvIDGwpG4Po
 daXmD8lwASgyWOmQdEnPotm7B+8+RK88tsKCp6fRHo6gvcWj8gFb/VqlGCxUU4ZGBWtI6ugA4ij
 1NELeINA4u8yjj7X3/a1UBo2cKr5zrP4WIqCQVR9Q29kLfEpOdoiGJz80VL03tcvUFTye2QsEdv
 +xncjx3Gsp+H9v6sMKbar5HUNDMfufe29u4+gPeU9LFwHb+MMQBz8jHlI1Qu4+zMgbO0dRqaYXF
 XLFoAR2ELXErj81QGwg+WTGD19Aoxi051lXMTTQ/eYD3HUrw2H4T0XHfaLFlBSW+sOOPBmL3S2V
 +yvayW/ehrmLRwQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/pinctrl-st.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-st.c b/drivers/pinctrl/pinctrl-st.c
index fe2d52e434db8cdc03d61ef3f4df95cbcc9c513e..fb5d72a6826ed730f5a10a817e9a46f9fe319b5b 100644
--- a/drivers/pinctrl/pinctrl-st.c
+++ b/drivers/pinctrl/pinctrl-st.c
@@ -711,10 +711,12 @@ static int st_gpio_get(struct gpio_chip *chip, unsigned offset)
 	return !!(readl(bank->base + REG_PIO_PIN) & BIT(offset));
 }
 
-static void st_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
+static int st_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
 {
 	struct st_gpio_bank *bank = gpiochip_get_data(chip);
 	__st_gpio_set(bank, offset, value);
+
+	return 0;
 }
 
 static int st_gpio_direction_output(struct gpio_chip *chip,
@@ -1470,7 +1472,7 @@ static const struct gpio_chip st_gpio_template = {
 	.request		= gpiochip_generic_request,
 	.free			= gpiochip_generic_free,
 	.get			= st_gpio_get,
-	.set			= st_gpio_set,
+	.set_rv			= st_gpio_set,
 	.direction_input	= pinctrl_gpio_direction_input,
 	.direction_output	= st_gpio_direction_output,
 	.get_direction		= st_gpio_get_direction,

-- 
2.48.1

