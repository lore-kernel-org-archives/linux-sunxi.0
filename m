Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2028C3FD141
	for <linux-sunxi@lists.linux.dev>; Thu, 30 Apr 2026 14:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777559142; cv=none; b=VbEhf1Xqg2XMVCRbOoztLXRXfteOsu9obQwaIxKidjK0/n1vSZE1PqrKvmUqvwxZQa03TYYFcPWvUgsVYRqXaBpaHH9v9fULQWAl+ODst8kaDGs22yxYoOrbA3hKWJOnoIRzpZPfEwWeCgGKo6TjGBjlx4TEtQEeb1NSQ4tkgBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777559142; c=relaxed/simple;
	bh=SsB3fVBmTDjC/TDn0evKIsstRQxjanBDMF1KqALO2L0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cYLz6B68HeVOa9goEofKHDN15Kd25PZ38BjfxUwocQjfj+d6dqpd84zyEbX3p0f1HS532tqE3lEGcer6Sk1v+NlDtrQ6Ix9FNU8+yJFUuafRzSFb5D7NGhw/YMC+OLYl5KEixqhCmkfnJNzfter619KubOIYFmtNzjYrS8chsNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qd8d9soR; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qd8d9soR"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2ab46931cf1so14482965ad.0
        for <linux-sunxi@lists.linux.dev>; Thu, 30 Apr 2026 07:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777559140; x=1778163940; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SxQQAfFaaiRvrhNuhc/nEMGhJjTGCuoSHZosD17X3GQ=;
        b=qd8d9soRbniI7agVCt4vpy82lh0hTQYALL3l+UICxEIDotYNsxlofHgdHBLhV/iM9Q
         Akbk1S6N0wz2STH5NSP9JHDU5bgPI1oZ+QCOR4sLuVh8rquUPxsrWshAPL8G4RC9+gMZ
         Zwyf7or3E7PP8OcwPFZdEM2htV+GLlJiGH4na7Pn1Qu3PJVHVB26o/GzXERpKUb74u+2
         YS80jFfMzhgB0m2SqGvXpRlp6ilpjjHqqAqNPRVEyPtHBQiJo2m7QQwpDsHtk23YeR/S
         2GFP+qBESxZ3ePanZocRrffd8DcV2B1NOO2VUMyUp81Dn57f3ZntxW0qyJd/d/nHGA8q
         zHSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777559140; x=1778163940;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SxQQAfFaaiRvrhNuhc/nEMGhJjTGCuoSHZosD17X3GQ=;
        b=h3weoYPsc2xXIl3tIG05XTbOznSSNL/beCOYBH78klckqdrxpbf/uI7aOBWfWCirC+
         /Qgugp9fcLWo5v/zla0Ysd/W3v6Arebj6pYb7Nhuer58TmJmfdG3O7Egsf+CF4geleMI
         2NU5+rYAsnwGTrFs+swM4HzWMp9g/rs2kY/TDrAe1AxseXzjB4ROWQK3w8B4OvNnF2At
         uj716X/Fq0OdWL0lfWiBlh32Zj6kDAb+RL3XUprEmkk9K5nzluLATbzjY7a9/Sn+9THW
         PVugtF2YeBmHtG7ccxgBpQlpRCSIQnO5JmqyJTQuvXBN+9hQT4y3xF9veCN7BFspEG+j
         q3wg==
X-Forwarded-Encrypted: i=1; AFNElJ+bJNC6fTFZtYF3pWcG7aGAX3yuHaODkqTT/MX/RVPVVRcyy3AAzREj4muaDDXv0JH2EHZkP3qKRtFFqg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzvIZjMxBK5vl+nGY8FasZ7x7QybpBqvXYew5DkPExI0hPykYs2
	KeYf+8VTFU6XdOXztFa2ZS/E5ZXMPYo5M7reZCBIUYoFap62GpwujhY=
X-Gm-Gg: AeBDiet2baFXo9M4UkP+N/bYM7icltC+CNiv2KOGyBIYcnKNh/RA2AClta+UeuV73Og
	G0lWOHHEb0CNRSZFgHqqkEFAVjmhYP6GdjRyAp660z/dDS97ZfD9H7x9KQKmV9ZIxgAcVcd6vLV
	GYb/u3qtITm1HQ9DFH+u0CnBBBtyuzCtXqyugc6DNmIbJu+z2jcNtW6P9o8b1VMKSSQvfYcl6e3
	KQDuuKchiMbM0cFEDSFddAoxqQ6FGZ/fVgKNQbOGY6yEHhq7sJhnmEsc0XRjO2k7U2QjRflOZYd
	BeLMFFa0y5FivU8/gKK/b8iCopPTdTUJpt8UEjUrxmegNa1EZrYE3qXSSszirVhaLoECCgn7Zys
	71jlFqgK52ZtdnfXP7N5cfQWWboyT9sp71N4vmBPcR5pvqsTrqAe4y4T3RuVzjOeCTQHVGJ4WFm
	we95XF0nepLUlGUfU5MQrjMYo2x6vXYlTGgRyZghyBCbWcRC6Auk8bWritmLLLq9OS+oCiL9GHG
	RHYqYdNQhjqx/tn13ldFvJ7b6q+xADwF1z3lsJRCVOwVlVOwior21e3NQY95Wg=
X-Received: by 2002:a17:903:3b86:b0:2b2:ec33:cf15 with SMTP id d9443c01a7336-2b9a42dc3b8mr23951415ad.7.1777559140212;
        Thu, 30 Apr 2026 07:25:40 -0700 (PDT)
Received: from localhost.localdomain ([1.226.165.54])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b98897edefsm54194885ad.74.2026.04.30.07.25.37
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 30 Apr 2026 07:25:39 -0700 (PDT)
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
Subject: [PATCH v2] media: cedrus: clean up media device on probe failure
Date: Thu, 30 Apr 2026 23:25:29 +0900
Message-ID: <20260430142534.12928-1-pakmyeonghun@bagmyeonghun-ui-MacBookPro.local>
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
Changes in v2:
- Drop the now-unused err_m2m label.

 drivers/staging/media/sunxi/cedrus/cedrus.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

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
@@ -533,6 +533,7 @@ static int cedrus_probe(struct platform_device *pdev)
 	v4l2_m2m_unregister_media_controller(dev->m2m_dev);
 err_video:
 	video_unregister_device(&dev->vfd);
-err_m2m:
+err_media_cleanup:
+	media_device_cleanup(&dev->mdev);
 	v4l2_m2m_release(dev->m2m_dev);
 err_v4l2:
-- 
2.50.1
