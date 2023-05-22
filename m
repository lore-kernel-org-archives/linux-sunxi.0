Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D45315480
	for <linux-sunxi@lists.linux.dev>; Mon, 22 May 2023 15:53:35 +0000 (UTC)
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-331333e6bf1so15202095ab.3
        for <linux-sunxi@lists.linux.dev>; Mon, 22 May 2023 08:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684770814; x=1687362814;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GcASE1OrQyQi7q41P2SNchLMQc2DgftSxURxly3Px4M=;
        b=NB4tWHOjxmpjqH1CavStoHfHO7gwuRZAoxBoRJ1E77Kjapa/DvQ2f3G50SC2sEyA0v
         E3SHK90R8Jh4Bqsvbzudu/ufN9eGMDq8jaUjs/jfryNSvLFZfdJ34axmzRExKCLFocnb
         2hyXX536tpiSEK9nfyyZVbWky6Ta4VVNjhusop+i3pXs0s/bhgv2yJeYpSQE2mMiWgNd
         SoldQsemhEvJNDeyuk0F0uPU4hu8Qb0+zbrZPpP7ZyM+snhYQGDtDC7q016J6Prp29DQ
         U4hvFTRUQ5BKMU1pN2ZTLHsSQj7sm9d1+9Cy3sM2x4D8m1e5DBXo/lbVaIk/X22E7omc
         nZ6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684770814; x=1687362814;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GcASE1OrQyQi7q41P2SNchLMQc2DgftSxURxly3Px4M=;
        b=F03BN7aqoIQcZ533SfcZlV9xMHv7ucWUYY/0CCnHbh10Us5wPnM8Wx2yWqH48X5jnu
         VPthOivHcnCeklOAdVqodiSYxB1gs/esmqf8IHxJfAcd6/N+WLVmP/yNVCVqDs5BBF4H
         QxjueQ6Dph05KynCZeN6T/aXjWV/Wl9R4uWhKGBX+GzmsyR4SieZuyI3QKWiXsXZm7TY
         3bVACzhHOETDywrWE/raTJdt/6Kh4zbgSgMjb6EPD65TjPiSIBxfWoPEAUWhbYtOS6bo
         ywAyYPH2SFOPtykmDVJhOVvTVdXyYFSYQ5ci3XX2vrJVKA60ppGmhOnTf8B8MLXpi9nA
         Flrg==
X-Gm-Message-State: AC+VfDwvA4bCRuMie8Bn5dlTL5JVQ7KkbdJn0tk8XSOQg1eJH1D1POyh
	Hf/nhn7zIu0ZycPHb9MXCmg=
X-Google-Smtp-Source: ACHHUZ7ooSC2UtbAlM8vlneO+IMFO5YP+L0irn37IABBL9D6o/vm+eTQElmw15bt80zcMfBWO5nZ4w==
X-Received: by 2002:a92:da8b:0:b0:33a:6a9:6568 with SMTP id u11-20020a92da8b000000b0033a06a96568mr2007278iln.30.1684770814344;
        Mon, 22 May 2023 08:53:34 -0700 (PDT)
Received: from azeems-kspp.c.googlers.com.com (54.70.188.35.bc.googleusercontent.com. [35.188.70.54])
        by smtp.gmail.com with ESMTPSA id cn6-20020a0566383a0600b004141ce991aesm1787491jab.179.2023.05.22.08.53.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 May 2023 08:53:33 -0700 (PDT)
From: Azeem Shaikh <azeemshaikh38@gmail.com>
To: Maxime Ripard <mripard@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>
Cc: linux-hardening@vger.kernel.org,
	Azeem Shaikh <azeemshaikh38@gmail.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH] drm/sun4i: hdmi: Replace all non-returning strlcpy with strscpy
Date: Mon, 22 May 2023 15:53:31 +0000
Message-ID: <20230522155331.2336966-1-azeemshaikh38@gmail.com>
X-Mailer: git-send-email 2.40.1.698.g37aff9b760-goog
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

strlcpy() reads the entire source buffer first.
This read may exceed the destination size limit.
This is both inefficient and can lead to linear read
overflows if a source string is not NUL-terminated [1].
In an effort to remove strlcpy() completely [2], replace
strlcpy() here with strscpy().
No return values were used, so direct replacement is safe.

[1] https://www.kernel.org/doc/html/latest/process/deprecated.html#strlcpy
[2] https://github.com/KSPP/linux/issues/89

Signed-off-by: Azeem Shaikh <azeemshaikh38@gmail.com>
---
 drivers/gpu/drm/sun4i/sun4i_hdmi_i2c.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_i2c.c b/drivers/gpu/drm/sun4i/sun4i_hdmi_i2c.c
index c7d7e9fff91c..d1a65a921f5a 100644
--- a/drivers/gpu/drm/sun4i/sun4i_hdmi_i2c.c
+++ b/drivers/gpu/drm/sun4i/sun4i_hdmi_i2c.c
@@ -304,7 +304,7 @@ int sun4i_hdmi_i2c_create(struct device *dev, struct sun4i_hdmi *hdmi)
 	adap->owner = THIS_MODULE;
 	adap->class = I2C_CLASS_DDC;
 	adap->algo = &sun4i_hdmi_i2c_algorithm;
-	strlcpy(adap->name, "sun4i_hdmi_i2c adapter", sizeof(adap->name));
+	strscpy(adap->name, "sun4i_hdmi_i2c adapter", sizeof(adap->name));
 	i2c_set_adapdata(adap, hdmi);
 
 	ret = i2c_add_adapter(adap);

