Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16EAC44D02F
	for <linux-sunxi@lists.linux.dev>; Wed,  6 May 2026 12:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778071292; cv=none; b=ohZzcVJt8ubVKes43xWLhoNvWl5aLIY2nZu5+vtea2AsaFEM2SPnsfjKAYrH/17jTuMeebgmTNdaE2fwC0gUtplnzxrofp8Rc3jfOnJss7rnOA4SGePz1h2y8n0U9QenGUlodxIR8d+NOiWqRhT2rY0GFWfjgeEgRO3dsRkITCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778071292; c=relaxed/simple;
	bh=OinERmBbACIBYleiV1Zs0L/VJbZMb7jzEBvebOjGfjs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VoTIqJ1ZLB8d+hEc59QJnFf6h0Y8KpEXMdYKIikPW8s9kQKTSGDtXOeepzItmLo+KY1EVjOlRyWatWdXzBnLbD2ytmclbexrDJSQ0WqTFIJpS9FJO2ZpInaUg6RZJbBRvMPTVP5DuENoZ+VgKNcow6DKof4AuCQkVxnjy9efm58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OLrXPEN/; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OLrXPEN/"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8296d553142so4976617b3a.3
        for <linux-sunxi@lists.linux.dev>; Wed, 06 May 2026 05:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778071290; x=1778676090; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0IlqU8VwEU2SI0FZdxgow47FUylG/UcOkwWktFbacV4=;
        b=OLrXPEN/9HiBCXoGpuQ9/MDYs/61oeNjnkJpgqpH0sjq+tAXy/Vll4KAwHZfUSPtu6
         I/8pISxkBSxiTEi1l7MInZnr8cgovUW3qGa7VFH8z48ruSKlfECxRd4VybF5dtJRMjT+
         fLPvZ4mVq1UfXfD35aPNQcMNWojLsg525TSlm/bMoe8qFGSC/WxUxSymnz82yROJGq+x
         efqfotXevP1wI+nk/sz8LncA3/LeRU89ZSOPRbSKKtWvCT/VwS34KUK2SktKmvLnAKnG
         /GdbXfzLDYVirpbczzIB2tzGWMZJ8DZF7tSHcj0MWVrmUSFVBClzQ0ZrfqVunJvIrC37
         WSMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778071290; x=1778676090;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0IlqU8VwEU2SI0FZdxgow47FUylG/UcOkwWktFbacV4=;
        b=AGtQY1UakSairYMYeiuePdt4ufC4SUNJ08yyTKOcOWsSTRYW11GneP9fK0RigdP5Mr
         nj4dhin/1z4NRo16TZjMk85CsJm5ocOS8RJkAG2IEjb02CpM/vQlDYq6YzsWiY6Z8pZ7
         haYAUrV3MFgLfIXk2TXs+q8eWDdrQfUtVbO+744/Wg5LkS+m7H8Hm47kjZSJ0WjnwrXN
         Nh4ZUKbaODTdHSt2O1HlkN0C/meSmq3Ac0uPd9e9HmacP6csDItVahH/2++I5cqLSoZf
         JbS4oq2jHXffgvgTtlOCaeQy7cck4ZXVY+8p6NnravAVofs/Yp/ozMF/CQ3ubVqQa93a
         6BDg==
X-Forwarded-Encrypted: i=1; AFNElJ8IhWNjGLKH0mQkxl8eEcZMCsoljhLVqHqB9Hhk9VNslTiMI9TdtEaJKzM2xThZTdHLV4LSgjlszKBJQQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxBRjL7QUZaj9Yp7M9b9TSpTm6bxpnwVM+K8Mo1tY/XlFyNH4OS
	EfkbMwrVHsmwZBzpW3BCK9hit2DZg8sSXqPlja0JtVLnaiecdqJ9a8c=
X-Gm-Gg: AeBDiesX3pmQd++MbhoBAmQPtsXeNl8vlffq2pJGI2k9VHQMb9zO36R3C8UfwPdQr5w
	7wQarASBmecA7DY74oRD1xWOYJ0Qd64EUCDqghSRrljDa9IDowDG3gaQqUCm8H7oDXGJ/l60I5c
	jGv00onIETosQkMuifGZWka3Av/xCyJZXUootv0EbAgsQP6ggCjzvnVMnbP8pcW/YOwXrViTkBT
	KXdw5opB8+JkcgdGjH2Ci4QhMXW3v4xTaXvRgtIZf0+lkQWrgPkGM5lyn84dUZaaPsVz57bVD2r
	/iFF+7HTpFugWZ6TETsbsLi1mi2L0IlyE/55Q+JpurPpQjKYJ74H+ndJuZ7OyrmfcWiaWI0ZYgk
	+vbfHtwihTEuqQbmJxwI2m/UanbhOYLlmD1l8eeS6yT4gVH/rK9bi4XkViYCdJ0XIKYDT13Ba75
	LxjY+dCAAvbb2ZulXW1fZVfS0lxiSUKGdCXk35Oxzx5oyr/2TWTEljLS5Dyisj1+SP4tpLfiN9K
	2yWEODdDw==
X-Received: by 2002:a05:6a00:4193:b0:781:2291:1045 with SMTP id d2e1a72fcca58-83a5b2d34damr3232862b3a.8.1778071290350;
        Wed, 06 May 2026 05:41:30 -0700 (PDT)
Received: from localhost.localdomain ([1.226.165.54])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839679c7ba9sm5494056b3a.35.2026.05.06.05.41.27
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 06 May 2026 05:41:29 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
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
Subject: [PATCH v3] media: cedrus: clean up media device on probe failure
Date: Wed,  6 May 2026 21:41:16 +0900
Message-ID: <20260506124124.27802-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

cedrus_probe() initializes the media device before registering the video
device, the media controller, and the media device. If any of those later
steps fails, probe returns without calling media_device_cleanup(), so the
media device internals initialized by media_device_init() are left behind.

Add a media-device cleanup label to the probe unwind path and route video
registration failures through it as well.

Fixes: 50e761516f2b8c ("media: platform: Add Cedrus VPU decoder driver")
Cc: stable@vger.kernel.org
Reviewed-by: Paul Kocialkowski <paulk@sys-base.io>
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
Changes in v3:
- Rename the media cleanup label to err_media.
- Add Paul's Reviewed-by tag.

Changes in v2:
- Drop the now-unused err_m2m label.

 drivers/staging/media/sunxi/cedrus/cedrus.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/staging/media/sunxi/cedrus/cedrus.c
index 6600245dff..7cb1f110d6 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
@@ -507,7 +507,7 @@ static int cedrus_probe(struct platform_device *pdev)
 	ret = video_register_device(vfd, VFL_TYPE_VIDEO, 0);
 	if (ret) {
 		v4l2_err(&dev->v4l2_dev, "Failed to register video device\n");
-		goto err_m2m;
+		goto err_media;
 	}
 
 	v4l2_info(&dev->v4l2_dev,
@@ -533,7 +533,8 @@ static int cedrus_probe(struct platform_device *pdev)
 	v4l2_m2m_unregister_media_controller(dev->m2m_dev);
 err_video:
 	video_unregister_device(&dev->vfd);
-err_m2m:
+err_media:
+	media_device_cleanup(&dev->mdev);
 	v4l2_m2m_release(dev->m2m_dev);
 err_v4l2:
 	v4l2_device_unregister(&dev->v4l2_dev);
-- 
2.47.1
