Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA8C2344DAC
	for <linux-sunxi@lists.linux.dev>; Wed, 18 Feb 2026 18:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771439705; cv=none; b=N3raKddA5L82GSpXRD0ZvmXOqNwGIGYhD1kro2Q0P5Hi5aVJh+4dpfSnzH/1TY0oQnyjWYqfyHXSZpp38GBehc45wGw+EgsHGK3IVVFwss3QIS262KCeVGWFsHqd/3J05pC6irzRKhMwUfHXYrjv2n9cYFGWZNGluOS45XKakNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771439705; c=relaxed/simple;
	bh=NCsgmnWEYo7xxZEJIPfVWaJ9JvJJumQ642pGQRdWy8U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bnV/kdct4xcthoLVaR0ueuI3a9kF0i/aIGN9QMzv69bpYKdYGx/L4S8fGrUm4RyoZ/deSaMg1zPCCawfrL3cztZcj2Jxrkcw5W3IAe5AjF1ytBZeZn9NuMPtvS3fqGrpsyRxypFWCFPDM61JymFaVBr79SWpJ3o39xzBQCyrrmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jcr8Kltv; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jcr8Kltv"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-48374014a77so1409175e9.3
        for <linux-sunxi@lists.linux.dev>; Wed, 18 Feb 2026 10:35:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771439702; x=1772044502; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0uK3LnBVqJtacrpaTeNsmEDEPVfCDtIQ6jE7L3gZNMs=;
        b=jcr8Kltvyyu2ugBXQJ7qpo+0IB7wF8G5yA2mstxoQXs5JPPRfHTzODIpo345cHPGBU
         +Nabguv2ZOKYtNgXGuJTDgghqQGai4Jx/oYQosounYb+oOOguIiwI1xiOxx0Tivrd1D3
         TToRjNr7rfu6H4o4Jp0hxaaluzChPypSccQTGhqFDuFmmwPdtVS7xFxca6nxsmWbthZR
         UYwBgSQxRSSK+fvlkmIkj/VuktFU9ziAUnVsZ17h436aNTCXcQ/OHXJ9kasQJcpB/hSv
         pdOAd+ep4C6tmsW9Q/Wvg3TRBRcWlC8mb7dWqHnzvPTEevlAYJjWTBuFwP028O2rqCLc
         0AxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771439702; x=1772044502;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0uK3LnBVqJtacrpaTeNsmEDEPVfCDtIQ6jE7L3gZNMs=;
        b=d9uUJuZbdoNfyLGu5fOUXI7WkVNIELQ1YNsVltW6CI0c3Lb10XdQ/Uu0ZGg/5YBV/e
         2R3KjUDDqdu9zRog3PU3z9gOikS4l7+lHF8lAIgRYIlTv19citVTY7yZKNv8unUxBft4
         q2UKqv07gPEryqi64ieNI/RLvcRpgKZSagB0i7KCwKngW2kNV+9kDlis5rvuZKSfuNWd
         EnnziAGdonwPXanoJ7cBGt1Shr3Lm9n88jUcWnP82eA1Fg/6PDb4h/sI+uFNSifTkiY8
         ysQjGLtSaCWRA0iP5nQElFFpbpXgyx+3i0KNvrUX36ZowppyuSi00EMefxpekWBn7yDy
         Ueew==
X-Forwarded-Encrypted: i=1; AJvYcCV588yiRFqLazzLYcTQIqHm7suYOwzYv8yiiYna8lsEOSrzpRjJ0rNxWQY9tJ+isk77bEsWNyX4YCur5A==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz3fO2ZXpDKK8iwshxTK7Cd3g9XxWU2d93cWocP4zH2+XFbi9R6
	eW8dYFBZXGamo94Azvp53ti6YMKs46r8grj+IvxTotZNXrl9Yt908Xp/
X-Gm-Gg: AZuq6aLUFSZ2tWiTAuhRslv8MY91vd2m8x1ES0OOtRJLG08cJPFjZy/mDsKGRiM/O8a
	95Z2zGwTqzBMqgj1XsOcvajUtowBebn0EsjDTDBaOZHNIzWOnboGxasD36bfWPAEdONeYzmFE6n
	6XUoGVZ2kyM7W3F/uV18pZvNP7kSiTolxvs7hR7fSWiB5uX39OMR2CoeNsp5idzt5y1Rxm2wwJA
	a+d5l5pGvNj7P5Gah3b4uDyELJYTShNMGa3ZlXxxIAvPf3cQpXJJxDBQoklMGScW0r7b9Vr6TJU
	jU44a4AhtZyMWWwN/gAQU82vx97QdaYMOsBuHYxMTRlvlqCm34nA0wwfEx64NiO/Lg6oT+XXuN9
	RELodam3nbiNn97HMMdZkb2fcb1DrO2R206e/CWPLVQA2iQ/Tkiq9RivRCstml7YZUk1Gk1h3LE
	9yesNR8bodoU/yiLVhzq6rsnUHbeEg6s3wKlMIAoHdWyJ36MVmWufbOsX681EicM5LQyt7Z5kQt
	2ItNj53VX0T5EIC
X-Received: by 2002:a05:600c:458a:b0:483:6f37:1b33 with SMTP id 5b1f17b1804b1-48373a58babmr277783835e9.30.1771439702159;
        Wed, 18 Feb 2026 10:35:02 -0800 (PST)
Received: from jernej-laptop (86-58-126-118.dynamic.telemach.net. [86.58.126.118])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4834d482480sm640635785e9.0.2026.02.18.10.35.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 10:35:01 -0800 (PST)
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
Subject: [PATCH] drm/sun4i: mixer: Fix layer init code
Date: Wed, 18 Feb 2026 19:34:54 +0100
Message-ID: <20260218183454.7881-1-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Code refactoring dropped extra NULL sentinel entry at the end of the drm
planes array.

Add it back.

Reported-by: Chen-Yu Tsai <wens@kernel.org>
Closes: https://lore.kernel.org/linux-sunxi/CAGb2v65wY2pF6sR+0JgnpLa4ysvjght5hAKDa1RUyo=zEKXreg@mail.gmail.com/
Fixes: 5fd711adc0ba ("drm/sun4i: layer: move num of planes calc out of layer code")
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_mixer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
index ce9c155bfad7..02acc7cbdb97 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
@@ -321,7 +321,7 @@ static struct drm_plane **sun8i_layers_init(struct drm_device *drm,
 	unsigned int phy_index;
 	int i;
 
-	planes = devm_kcalloc(drm->dev, plane_cnt, sizeof(*planes), GFP_KERNEL);
+	planes = devm_kcalloc(drm->dev, plane_cnt + 1, sizeof(*planes), GFP_KERNEL);
 	if (!planes)
 		return ERR_PTR(-ENOMEM);
 
-- 
2.53.0

