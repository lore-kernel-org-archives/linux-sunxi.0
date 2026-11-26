Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795729488;
	b=PRKE4jGaeAHAqUvJyUjsN0Jer9Zwx4e02v1U6CTUGyzc/3N6Rk9DgtxMzyYijeCR77sm
	 J8UgGTzewr8i4WrOHphhI7WOTKm/AWIlF9kOAgYhVHVOJUwbqhQuMntHsq+PmW29Si3KM
	 jcLUK0VUyqftZCTzsKOxrp/FQ9tvYhia5SfNKi9iUFxhsyU9eZoTghXaXCWRjAeJOOtg3
	 CuL+iuSx4u7Tr3YryL0HcJlJXUweITAjqGuch2wUJ1bJQG7RTiJrUTO44/PniixwIUHMt
	 +ikhsufjUX7X0YmqTVG1inPZmjSMCV2+XSMA6qYLi5n6z1vMkWTIiGE3YcmFWB/k6Ig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795729488;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=5TOaY7Fgq8X9NRdZ+s6yjIa1AaIRWGcVdRqEFaeVeKY=;
	b=C+R9NMmXsVKyyt0OIZsL2GnX4SnCiAsBf2cGt7d9+kALs8ByDymJkL3aMXhSUjYb7Wv8
	 FU8tXAaVuzWfV5WxNpEZYp4+/kyLCoLj8iDd8KrpeYORSJIvclKdwR/7aKIyoqLR/Jdjh
	 3RGvZ+acvkTzPtOcX9RPwKRS9NjuV5RtvZ3EltuTajGSbtW+Cwy7QBmVkbQxA2RGzfsHv
	 JvT/5oEkrTKCtDbylwPH0NhVSyA2dH9gQzH/XPElMgUJTg1z6oudcj+lNmmO4YZ7KHFsK
	 n6ImoZQYFeswtq+GfuA+kfrY9JOcJrfUPQ6ORCln++5NF6QyJzuGGSXo/8axGM+o3bQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GavAdow5;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AE8860A2603
	for <linux-sunxi@lists.linux.dev>; Thu, 26 Nov 2026 21:44:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3AE8860A2603
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GavAdow5
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-492fcbfaa88so5041305f8f.3
        for <linux-sunxi@lists.linux.dev>; Thu, 26 Nov 2026 13:44:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795729487; x=1796334287; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5TOaY7Fgq8X9NRdZ+s6yjIa1AaIRWGcVdRqEFaeVeKY=;
        b=GavAdow5zLAT/Cw/3CxmiwhgmddA1dF5YEhwY92sTzMTxBrr2l/mcIdf1Ro+xG7YDZ
         XrFNbff0h27FqaOV686JBU+5ujn8uG3hLkpMcsyjB6FVJQq06nkCUbAN/Dh3USyN0flY
         CPGEaxeiXPZa4pJqGace89UEmR1eIg/C7Sq0XZ41Y7vGUBxxJWbeO32tgsEZSgnyKONN
         k6FbMybsc7TUHJn0UYCa2r3aWtYCBbFoNJ94hqpfo++X3Lwb2Gfs4HoF5b/ib9LnXfK2
         Lhfd3IKyYn6wkyCHK4nbLCXoNNH9Oo6jhWxvAGQ5GkFwtGLxFLXtLB2cWAj4vp6SgaQR
         +Ogw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795729487; x=1796334287;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5TOaY7Fgq8X9NRdZ+s6yjIa1AaIRWGcVdRqEFaeVeKY=;
        b=JfQD8oCPRQrPSwTg65aDBplEULsR5vKb8Ezu272jRRhB8cFe1+QTMAMagWGXBMCHME
         7bndK77xsxgxbRJohkULKFQfyOoNg7gz4fPYu5hP9dDBQdkytPsIvTh2Uyr2pYo7rRGc
         VIoCVHaqzHJ3l12HDwXR+MGvzIvEhb1ntxyywR2RmYtCvFBfPYvl0MhDFsf5MumaOCxk
         c2lKp08IB7y2DgyJZUooMazHNdodlI71+R3gJ83KSLxGf6k60tqEYdA8jGLKr7+S3Vhb
         TqIyYUjVYXGAKAPkhtBZkPOz2YMPswkW2TciwHywgQech/w9Yae37zKk7wHUQjnrFXJu
         B+6g==
X-Forwarded-Encrypted: i=1; AL+hErHub01I/NqVLFWmrvi3kTShXlIPQ4XVdM5eOpD7MYRPV5ZW45AmvunF0r/DGeln5MTo9UxNGCYSQrwJjQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z9xFHVG5rlodZuolpjjLleKeO77Yk3t6EY0xSpFzahsZ3ZSv+Hh
	EKYZG6FouKHPAE5Mnsv4iJbZjg9xzy7PehwCzdCP1n+HVkvEfYJkns9K
X-Gm-Gg: AZFdTZcJg7Lp2ufutuu4+QzG162FUAmZDCCWKcF4G+idNu1SoOTZL5eSjWSj7St3mk+
	1R2Fj+wFFkBFDiLrocqhpwhdNFvG8AQj1a4kzC+woidSbFRwq0Ixh1EQ4alF6lZ+p/D1k+6svA1
	zTbH5W1lB7BsJs4XFT8grfoTo+o6r3G4Pon3ztjkz0I4MP1ItYxEUzFLzyS3NW78kMfPs7r5Bl/
	13XrljcUjzPrA1lTniBf6LnMSkINHqw35eR+18eJrG/xtLPl9LoH1sthjLqRr/uGtBlynGmah0w
	l9sg+xmrUtwaEokx7lOxMLS6EwtdqWxOH/fRW7hrvN9WLRzCxlp8HqXQ+fWNK26MRV2Z8fEbvng
	kxpWtfGZYkmEa4w4U+k/vZQzNWrhDaIH3cWxN0hLFMoQpX7KCvOmTRgyPBtA7zI/gjrNKIpROyw
	XIOLBJAKMiO+MbfB3XweovgXoqCI6/46O63ayWmWVEXGzoT9aAhno0561wQ1zDf+kovH176v4nC
	5fheMnMUb2QI4ZmXPXIxbZUDsE+YWLJUF7wT1jTRDB/sIzXiO3JQjV2iDZzOeI08sowwO8ukDMI
	v613H0CFGW6jGht6KoAyzaKuh4n+M9/9uhR3Lw1mwuZCaN9ek/u8ukqEVXC7zWJQFWtIOKPw3CT
	8RgndptI2S8a+m9y2LdU06dnDNciHgkajVregaBqkc0Hfj9ozoDv0jNjFlPPYWYKpbH6I/ZW4I9
	8i2O+M2tD810aI0rUi6EvjRFfXGDAYn5wpFhbRDOnnK93aRtRagQUu8ki8ErIUOF7Sf2SZVkesB
	DmZgJ+Ar/+FTOnEpdBpNCVLknAJNYqrnyN/WGwtdw==
X-Received: by 2002:adf:e189:0:b0:4b7:6a63:89b2 with SMTP id ffacd0b85a97d-4b76a638a20mr20363316f8f.20.1795729486620;
        Thu, 26 Nov 2026 13:44:46 -0800 (PST)
Received: from jernej-laptop (77-38-7-250.dynamic.telemach.net. [77.38.7.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4abbd84e661sm40403963f8f.18.2026.11.26.13.44.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 13:44:46 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	jernej.skrabec@gmail.com,
	p.zabel@pengutronix.de,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Andre Przywara <andre.przywara@arm.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 05/11] drm/sun4i: tcon-top: Route LCD TCONs to the LCD pins
Date: Thu, 26 Nov 2026 22:44:27 +0100
Message-ID: <20261126214433.3562326-6-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126214433.3562326-1-jernej.skrabec@gmail.com>
References: <20261126214433.3562326-1-jernej.skrabec@gmail.com>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

TCON TOP selects whether the LCD pins are driven by TCON LCD or TCON TV.
The driver never programs that and relies on the reset value, which
selects TCON LCD. Since the reset is only deasserted, a different value
set by the bootloader would survive and LCD output wouldn't reach the
pins.

Select TCON LCD explicitly, like the vendor driver does. Nothing in the
driver uses TCON TV for the LCD pins.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_tcon_top.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sun8i_tcon_top.c b/drivers/gpu/drm/sun4i/sun8i_tcon_top.c
index 5ea55a2844a7..c7d03c37fd6e 100644
--- a/drivers/gpu/drm/sun4i/sun8i_tcon_top.c
+++ b/drivers/gpu/drm/sun4i/sun8i_tcon_top.c
@@ -226,6 +226,8 @@ static int sun8i_tcon_top_bind(struct device *dev, struct device *master,
 		goto err_assert_reset;
 	}
 
+	/* Route LCD TCONs, not TV TCONs, to the LCD pins */
+	writel(0, regs + TCON_TOP_TCON_TV_SETUP_REG);
 	writel(0, regs + TCON_TOP_PORT_SEL_REG);
 	writel(0, regs + TCON_TOP_GATE_SRC_REG);
 
-- 
2.43.0

