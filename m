Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C495425CDB
	for <linux-sunxi@lists.linux.dev>; Thu, 26 Feb 2026 16:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772123937; cv=none; b=nJPn1TsgwKXertdQYXOPcSCBsHlb1TZEcsdypu2PizVyJmsOumJ5bwLPz31gA4DqIQWicNp1AhhJw2mzUDVCpCkN0gGGXvTox0Bnvi00CHUQusZbPVNKCgX/PPDvt4PvdpNQ5dJzVYMkKjAX+R7iQR7A4/3/hqHXaDzDhjjFBqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772123937; c=relaxed/simple;
	bh=3ZOUU2ErlWmNwDZe9kOOLOwTpgY9iXMrxZCheD02Nrc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=vCV2NmhGV0Wp44ds7rcFelWahCKuVqfOkhwBogTA3AoV0AcLTlEFcrQap6ulK/uc4SXWuqVdIIQ5DSUL6luCgPhvkQiabXrC0qifB8PuSEjaQOAThZVe4omrwdErRyAmzq56tFqzRpH1bc74KQ8fp/V/BuTaNy9efU3foyyttqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hw13NdIm; arc=none smtp.client-ip=74.125.224.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hw13NdIm"
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-64c9cabfe5dso1384742d50.0
        for <linux-sunxi@lists.linux.dev>; Thu, 26 Feb 2026 08:38:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772123935; x=1772728735; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VQsc8cJztTF76PG4R+gL+xvTB4Nt8EQAhsB9W1n8IoE=;
        b=hw13NdImi7hxTh0datPetJ8WdwiZILQf1UJ1tg+2bmic+Q5wLam18rwgO04zfQNB91
         GFvLNvrVxJvJaqKo3v5iBsUNO19imayzvDcl/8SCu/848JNqd646jjni5RBldl3AszrJ
         EZQiUW2fY8ZK6TMvzCJ1slbKyNKAWzU8Gt8Ob2CgyDlLlhudOOW4yUdS3JBrI7TWG5Pz
         NS+DRNFmGbOJ/c63r0vgK98olUqOMcyquE14uHvL9mCsU6JS3fEzzCFhh4iOkkVz5Nf2
         nrKvPSvPYAhg8t0gPMyZpTV5XFpoCGeQPRHRtX37T1VUG0uhQ5P2bEWJlEnp7/N7ZQYu
         WYnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772123935; x=1772728735;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VQsc8cJztTF76PG4R+gL+xvTB4Nt8EQAhsB9W1n8IoE=;
        b=q+Na1k0ge69TAAbB/3XKNvYGtqh5RP1mwxnf92OBLO+68WEP7IpSnfBHVbDU8hLP6p
         O8Ot7POfXrjziNV4pKwwe8Vi01yKUbyGpr1aTCwCCrxiZ2HHD9nmt/qcTLnPQ9NhtBjz
         6slLrLy0pfFH8waQPr/Cv/8RPd60gC9wAe1mS+9+UAcUJstgoERFE0y3sYZz3oYeiWlm
         gwomU+PEl9S3bycLU0rXCoCyKXTwFQn7IrpfWAqxkGFXUVTPZNL3SiSSp3obpdvYJyGO
         3U2eRVRLdECdF6IRMh07f20On4PZz2Ovz313I73EFBxpT5ia7ZL+U7OPkpK76hCvk+Zv
         NZSw==
X-Forwarded-Encrypted: i=1; AJvYcCWu0SBdZuGkM8/iaoT6gHo0U+yecNL9IYQ2SKNb/E3mDdqaqCqDtKFrsqJFKm3/kYf2ROwOgGRtNXQQlg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxIcFpBKUIrzQHa33WxSEHYlIgv8oWoUKRPpmOfcHxJv6RvUaZB
	e5zaei2V6RSF27AP+nwVngTMV6VMLdoraq21ZTW1dg1iDmuRHpF5IZXx
X-Gm-Gg: ATEYQzypbclYnY5hjK4QgWmRfNRFERZS9sWBP4eGumOkyAUlxVG+n/FwXRLFOsoq5vY
	9BISrP2jHJ406vtlHmp5IkiirmjZnTGJ5Rc8+v5a+DjfgsQxkvrmpT3ePriw4R9/Pvq6CwBhF4y
	E/wimewvtlTzb+05sXJx9PKhNArZBfmEWqTeK9VlpggRiA6cWCTw0lTdGwPOK0HhvK9VdU1QVH0
	tLwzA4EFZ+wd+qB8OmOVYhJeChggWDnum4dj99tAYJMG/Ra18Hig1voRSirzDXn8X0Xy0hjWKP5
	V+LtRzjpLHXptWDm0A3rLyF8FBEMQwdDi4xZ4/YXUjhzOESpQDthHW681hqtS2dlGvcd1GTTfJH
	8kRFqzByr6xK8wfgxi3NtE/r91H9gv8eaLi5GYGyU2Jo2oJAYVTuooqP92vNGXeXZv9tK1V8Y48
	sixvdrP7GpjgLsBK7MIqlh3LZd58iOObHzkHkfgRMZHjAHluId7DTSObilYSf4LRNS0fLZHF3To
	/A3AHqgzb/BzKpQKHWGp/kg
X-Received: by 2002:a05:690e:4492:b0:63f:96d7:a369 with SMTP id 956f58d0204a3-64cb6f19ad3mr2308595d50.28.1772123935319;
        Thu, 26 Feb 2026 08:38:55 -0800 (PST)
Received: from tux ([2601:7c0:c37c:4c00::5c0b])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64cb74b985asm1150803d50.0.2026.02.26.08.38.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 08:38:55 -0800 (PST)
From: Ethan Tidmore <ethantidmore06@gmail.com>
To: wens@kernel.org,
	mripard@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org
Cc: maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ethan Tidmore <ethantidmore06@gmail.com>
Subject: [PATCH] drm/sun4i: Fix resource leaks
Date: Thu, 26 Feb 2026 10:38:36 -0600
Message-ID: <20260226163836.10335-1-ethantidmore06@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Three clocks are not being released in devm_regmap_init_mmio() error
path.

Add proper goto and set ret to the error code.

Fixes: 8270249fbeaf0 ("drm/sun4i: backend: Create regmap after access is possible")
Signed-off-by: Ethan Tidmore <ethantidmore06@gmail.com>
---
 drivers/gpu/drm/sun4i/sun4i_backend.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_backend.c b/drivers/gpu/drm/sun4i/sun4i_backend.c
index 6391bdc94a5c..e989f75c09b7 100644
--- a/drivers/gpu/drm/sun4i/sun4i_backend.c
+++ b/drivers/gpu/drm/sun4i/sun4i_backend.c
@@ -881,7 +881,8 @@ static int sun4i_backend_bind(struct device *dev, struct device *master,
 						     &sun4i_backend_regmap_config);
 	if (IS_ERR(backend->engine.regs)) {
 		dev_err(dev, "Couldn't create the backend regmap\n");
-		return PTR_ERR(backend->engine.regs);
+		ret = PTR_ERR(backend->engine.regs);
+		goto err_disable_ram_clk;
 	}
 
 	list_add_tail(&backend->engine.list, &drv->engine_list);
-- 
2.53.0

