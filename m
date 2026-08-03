Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1647637755A
	for <linux-sunxi@lists.linux.dev>; Mon,  3 Aug 2026 16:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785773494; cv=none; b=V9ysoh0Gf8DD1ohHvXp1v3qd+uIWqnQ8yJ2i+BemvD8RQygovAF/TNbJux0rblZDulaWOI5H8xtG95FGTz+3b9txOWosh3bNsERhniNMLq0cteg+jxniFMalTh9IH6KOCTYMPeYjFkvx+yYAkgSzJw6FzCJut/lCWpRhYHOmxKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785773494; c=relaxed/simple;
	bh=tMAQFxPXIx7PAQxYZjLH9+dSz17NuOukCvxxyeC2GsQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fzs3VT0b1rbBwP53ixH6EVnSvFLaSsQaM6t7TxO8+OeeTJy2TEPLM+0X8Cu2NBXm/VuW39HJu84VorXCkI4LY4+20pNZwkuw0cFhGmIrrw8GYEUFUDKZOWDgZnyByDRuXzOIHc9aG0ErlRAjIwa0x1I0eBMvgY8XzD5onBasTYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VM9yuT9/; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VM9yuT9/"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4953e04ef16so23378315e9.2
        for <linux-sunxi@lists.linux.dev>; Mon, 03 Aug 2026 09:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785773487; x=1786378287; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WnZE5eYLucvHUcpEznH4hSEo3d2Mtfchio0f8Z2eXVU=;
        b=VM9yuT9/O3hhtF4QxHzCSVVBiqB3csLhD/x1V/NgUldNB/6acazBG7qdka6R998Nun
         r3goBBKMhWoNNs2lkRRU+rh/X81aVibHBzpLPRBjjvJx9bSuANyxOm3x7TvVKjDnP8b2
         E5On0xhdY0k3D+1rYSuzAy8jVIy+fODqZ1LQ8nFDUY316j6bUU7n6BRe6Mwz5hTan2XF
         bO6KNIrLNaVi7dJ8+eCQiM3haqVsrNTwSsBMEfdQh+QbAkyCPGRBaOOprl/j7c5xgVx0
         XUv3WIlLYjRfYxB3xluoPYpk8+6CxZDfFVKQvt7JltlYcBQcZq3jKlfjgcQf2k8InqYI
         pZDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785773487; x=1786378287;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WnZE5eYLucvHUcpEznH4hSEo3d2Mtfchio0f8Z2eXVU=;
        b=M3KPREw+TQ6O1ahfX+WCTuByd68MGRVkpfLQcALqjNbBycGkcmn2y0DUZXC9DhClsJ
         O5o41Uv4Mh3xk+Vrs+tCaU9F1Nsg34X7cDyyaDqxspnk+P/r0AusXP45OE3W3p3DeCPQ
         VOcu0V/voEdiD9Bf65XtfM56XW8GF5/LM5GT6tN4Mn/9Wb0LOeGch1Y0Nk35O+CpDcCW
         aS3+JbP2f4y8R461uV65YPAx/iT3xWsLphcsSP77HpQiFbr8hnrhpraRKf6+UXCrfn3S
         +L5frnJYEeV9bXtc0uiYjR5rz8DrNKHpi4DSBovSynkkUJlWxqgXKdBsoVTn7xTE40rO
         nzFA==
X-Forwarded-Encrypted: i=1; AHgh+RpoDzhvDXMlYEAUWJBPNJnLLxqsuC1u8G9Si6EGP7kQNRlzFYGvGre4dhTses5P1MSsORb1/GCx92xF8w==@lists.linux.dev
X-Gm-Message-State: AOJu0YwkMoDIKLmkOb4GPFkA4Kxkz65p9THKKEzFNbk3P/FrIaCSbJJ+
	68kd3KR7VyHzIYtDDg6DZlidoKRyRmEYMJIRGd4E8BjN8gUYAn4H2TaR
X-Gm-Gg: AR+sD13Vec6c7pVS3qKDrbNgB0USsGtC98AHZoZgW42xJOI06W6ITBA017f5BixEsiJ
	HW1s/mpcVIeOp1CKpRLEdR89vP+5lY1e/vXKCSSGJO+Ct4H+siBDOgw7pAcZRlt+PF38tOwUHfP
	xMY697tij2o8dF8/Kv+9ogh3If2SqsNGnmjipZQN4OLlV9obwwySSnqP9V6ctgdss8VDfsybVBK
	tIBiTfLbSnzhLJ39mjNHPd5gpglVWCzsSZzU5YT/lia69NWEqHDbKPus3OkswkgWTs3ok2K+BM8
	NQBShXQXEydK9KTk5BoE4x8w50ZjRsF/HIi0yWg/8qq1AIepB0bHKD5sSQirpG+pr3XMCxhlyBX
	3TGgA8hBIAWRCXNDnVVAAyz+tZOlEUZK6f/TGn2xMasH+8gTOmA3HWPdkpgukcnm0D73lWlJHCr
	rNv7a1/ktS8Tw9LZQ9QvhJLvvZBYKMwwxgiYiChf3B+yfPZcsic7QqPfj5e4nzfxrDlDiccH+RS
	J1A8jyrlsh9gcc8Eph+nmNe0x5S81lQgN8WTyxdWqpk74i8WDwCokYKXvI4eZYMwkCv+5OTDXzV
	6GRLGOHDQwDrY4PweHZPtHKsbqySfUcBqqMlfLBfX1kR4//6oSZE34o+sdaNiwXN2bDnKslBClR
	LU/UFaI/Bj8FER7zWgVefAO1r2q0jHI2qjOpU/VJpujE2Japn6Emtl+prgfuTcU8Gi9lKBXuCim
	0Wo6DOPT+rLHl2lg==
X-Received: by 2002:a05:600c:4f87:b0:490:c6c2:52 with SMTP id 5b1f17b1804b1-4980c66c7d9mr217127655e9.3.1785773487184;
        Mon, 03 Aug 2026 09:11:27 -0700 (PDT)
Received: from jernej-laptop (APN-122-100-117-gprs.simobil.net. [46.122.100.117])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49949fc2da2sm3363735e9.3.2026.08.03.09.11.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 09:11:26 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: wens@kernel.org
Cc: maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	samuel@sholland.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 06/13] drm/sun4i: tcon: Drop TCON TOP device reference
Date: Mon,  3 Aug 2026 18:10:44 +0200
Message-ID: <871a3108086c15a483eef23301984c8d2254dfa7.1785772659.git.jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1785772659.git.jernej.skrabec@gmail.com>
References: <cover.1785772659.git.jernej.skrabec@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

of_find_device_by_node() takes a device reference. Drop it after mux
configuration succeeds.

Fixes: 0305189afb32 ("drm/sun4i: tcon: Add support for R40 TCON")
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun4i_tcon.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/sun4i_tcon.c
index ea7c90fef316..de2d66623f7a 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
+++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
@@ -1409,7 +1409,7 @@ static int sun8i_r40_tcon_tv_set_mux(struct sun4i_tcon *tcon,
 {
 	struct device_node *port, *remote;
 	struct platform_device *pdev;
-	int id, ret;
+	int id, ret = 0;
 
 	/* find TCON TOP platform device and TCON id */
 
@@ -1432,21 +1432,20 @@ static int sun8i_r40_tcon_tv_set_mux(struct sun4i_tcon *tcon,
 	if (IS_ENABLED(CONFIG_DRM_SUN8I_TCON_TOP) &&
 	    encoder->encoder_type == DRM_MODE_ENCODER_TMDS) {
 		ret = sun8i_tcon_top_set_hdmi_src(&pdev->dev, id);
-		if (ret) {
-			put_device(&pdev->dev);
-			return ret;
-		}
+		if (ret)
+			goto out_put_device;
 	}
 
 	if (IS_ENABLED(CONFIG_DRM_SUN8I_TCON_TOP)) {
 		ret = sun8i_tcon_top_de_config(&pdev->dev, tcon->id, id);
-		if (ret) {
-			put_device(&pdev->dev);
-			return ret;
-		}
+		if (ret)
+			goto out_put_device;
 	}
 
-	return 0;
+out_put_device:
+	put_device(&pdev->dev);
+
+	return ret;
 }
 
 static const struct sun4i_tcon_quirks sun4i_a10_quirks = {
-- 
2.43.0

