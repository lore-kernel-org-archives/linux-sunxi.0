Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F0A33B27D7
	for <linux-sunxi@lists.linux.dev>; Mon, 27 Apr 2026 10:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777284059; cv=none; b=Smldhpge+PNpttEV1o6kfzGojjVCEVZtqtlQfAOLWr9rFGUAVBpv+XJQiIQKlT633JRxngqFNq/Pfe98ncARwIoP4SSE9qac7PXAts7L7nUSTBsDQtdx8Vmze2phE6t+oO3Pa5XhigGH0q5bArT+nb/8riKStgkb3y/974n06/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777284059; c=relaxed/simple;
	bh=ZI6ZwXlG1e5ACFzhDMQRxll59Q4E3kZhbdsX1UNQ54c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NH6wQsLFb2FbW9OQtN32N/6YHiLop0UET0x5XV0o3y9Vn+nl2dYO1coP+GU4ZP98EtZ4fT4XNPBAbot61tISwUF1lzxhI3s9xFMfGBereI7BAA3h2VodyUwvzg4aNFzxN7zgZROl0+zyYoxkXopc0Ci8sL339lNsHC5NmeO625M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gql2NRY3; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gql2NRY3"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2b23fcf90b2so95104945ad.3
        for <linux-sunxi@lists.linux.dev>; Mon, 27 Apr 2026 03:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777284057; x=1777888857; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0EvvvHNzTOaXmxdzFUeL0y2A0j/j9spluGpaFZP3FMU=;
        b=gql2NRY30OJLLeOobf4hSGkCc5WqR6XXXPbGgg6JsyyKl6eVta6fyE1+vX5So30UlO
         sEePuHQM+OFebI43KFZcGmnivO8+HsCnJIFgJqct6n6aUWJK/91LthqUJ67sb1Tvjn42
         ZzxixEWh6az1IxRwBMl7GqEA/6xdhF5acJdMiQbH4zAv2wskfXgoEmzgutt15QKi1pOf
         aWMqlXxo6n49YM55cHFa3+r9DKQA+ffW0gZBUbKDZM4efgRQE0bAbzaYyID67DbtAVz+
         +i3dYCuN2pRKiTnpAOdAowt3oZppKtgZCh7PdhMRXKyT6k0ML2bte4zoCHLEkYiKP/Bt
         OhyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777284057; x=1777888857;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0EvvvHNzTOaXmxdzFUeL0y2A0j/j9spluGpaFZP3FMU=;
        b=dx/ErRAe2GEMie5SKtEKqVpQXGUjHlk0AF9c5B9wOX5XTJyX4zaFyCWLB8jawVgAih
         C+dE4RjYeMB/KqKbhru3ZrvhzX+wHKPsP7xPmVti6ucuMlctM0kHTGMzqv9nSO7sLvK/
         +g5UXxmh/NR/WBIpQXAunA5OsrZiFEaLoiox2kBPSNXrwdkQYX2pgBVfwumeb8ORiSVg
         VbwESKdAei6iR+EFPid3/z13kZk/AD/MRHBLyS4wLP8LdEuE5SQ/QwLeEB8rHWRqh2U9
         8wM3M7uPIzEl5VQQ46wd6EgzBqOrs6/+czK/pQjWzXaPASL+HxdC/eYVPiBjOLunW+RU
         N0DA==
X-Forwarded-Encrypted: i=1; AFNElJ8smx9xlqFjAiM4Drv/NxwNwHWH1Z4aIHouIT4tusJ/kQdSkdSWpcCBQEEi1WxKgTizKGJ3AW2PwgMpWg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy/Vi5zMewwU1F+O6pcVNjiGRshPica8Shi1kUeEcKRUpUcQ684
	oMM+ykEzYrtZ9RjlPtNFUVwSTZqQSd2G+IXID9RL0H0N7t/mIa50XBk=
X-Gm-Gg: AeBDies4J0i5ehyB1xJ4nKavoAxAZ5Yzd+QxyRhxYGVX3YoLiI72T0jzeD7xwXFYqI4
	O18yYPK0kZ2LgLi+/J8LNGdwD8bdE6ypUbTDTDNx1vda3J/bn/pPoeJYo+2TtTjRv1zZ7/Cw8gc
	u+coQqwVaMSPtqwoNaJW0Whgn6Jy3zzzEc2IYM6aL3WAoohSjbpE9DUoe8JbaVGoMWGYymYNAoO
	bxegXO98I4sm19qxA339FIbbMh0npkZxaGBObkBFd0AVqxIOALZCbpLJ62RTYrnKYL4hOhX20rp
	Oe/5YlNCqwk98ljuvG0/lymP4f3D6cA8YvuMVTZH8ygVNFxduDBIEkKIXaHHqQ0oWhVA6pBYHOv
	oDkFRCHZ47irCI4Sb6GGa3EsyV9U1yWkftLowUMFVKK5mabojsWGbg9iyOsAD3PxRvXliOFOBW2
	mMzwZCaCrONBvRdwEuy8tEOTvjfhX5uwqUnrkWJTt57LR0M6/aMThqBi27XtFeb+iJu0zPFa7OF
	hRQNCag6m7h0I24wAoayf3+k8e4SOcX1949cfHNDIAPXpA=
X-Received: by 2002:a17:902:e54e:b0:2ae:ce35:2686 with SMTP id d9443c01a7336-2b5f9e64c77mr424633395ad.5.1777284057141;
        Mon, 27 Apr 2026 03:00:57 -0700 (PDT)
Received: from localhost.localdomain ([1.226.165.54])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fa9ff713sm304240245ad.5.2026.04.27.03.00.53
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 27 Apr 2026 03:00:56 -0700 (PDT)
From: "=?UTF-8?q?=EB=B0=95=EB=AA=85=ED=9B=88?=" <mhun512@gmail.com>
X-Google-Original-From: =?UTF-8?q?=EB=B0=95=EB=AA=85=ED=9B=88?= <pakmyeonghun@bagmyeonghun-ui-MacBookPro.local>
To: Maxime Ripard <mripard@kernel.org>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Myeonghun Pak <mhun512@gmail.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] media: cedrus: clean up media device on probe failure
Date: Mon, 27 Apr 2026 19:00:10 +0900
Message-ID: <20260427100049.29034-1-pakmyeonghun@bagmyeonghun-ui-MacBookPro.local>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Myeonghun Pak <mhun512@gmail.com>

cedrus_probe() initializes the media device before registering the video
device, the media controller, and the media device. If any of those later
steps fails, probe returns without calling media_device_cleanup(), so the
media device internals initialized by media_device_init() are left behind.

Add a media-device cleanup label to the probe unwind path and route video
registration failures through it as well.

Fixes: 50e761516f2b8c ("media: platform: Add Cedrus VPU decoder driver")
Cc: stable@vger.kernel.org
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/staging/media/sunxi/cedrus/cedrus.c
index 6600245dff..2c25654640 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
@@ -507,7 +507,7 @@ static int cedrus_probe(struct platform_device *pdev)
 	ret = video_register_device(vfd, VFL_TYPE_VIDEO, 0);
 	if (ret) {
 		v4l2_err(&dev->v4l2_dev, "Failed to register video device\n");
-		goto err_m2m;
+		goto err_media_cleanup;
 	}
 
 	v4l2_info(&dev->v4l2_dev,
@@ -533,6 +533,8 @@ static int cedrus_probe(struct platform_device *pdev)
 	v4l2_m2m_unregister_media_controller(dev->m2m_dev);
 err_video:
 	video_unregister_device(&dev->vfd);
+err_media_cleanup:
+	media_device_cleanup(&dev->mdev);
 err_m2m:
 	v4l2_m2m_release(dev->m2m_dev);
 err_v4l2:
-- 
2.50.1
