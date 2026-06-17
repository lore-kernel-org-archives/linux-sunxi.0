Received: from out203-205-221-235.mail.qq.com (out203-205-221-235.mail.qq.com [203.205.221.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 657A32E6CC7
	for <linux-sunxi@lists.linux.dev>; Wed, 17 Jun 2026 03:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781666203; cv=none; b=acl8jrBIY+w8OkAuD5iDgPqfOOyesNlX7kPAzRQ9vwVNrVk1Hufw9UnDj9cN2f36aDpe66CEM3VOiZYF97aALnBkezxhx5k3tKS2ccVn39yg8BEjssld12ZEqm1sMsIodm5pRi3zGAVaNRYjjVEmfGyQNO/oblcH9NgO05MxvT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781666203; c=relaxed/simple;
	bh=hmyoSJ0V5hqJwQu/GQal32d6H/e0Rw9UIAusrzx+Dzc=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=C66v61fT6tyS+Fm3KsEQ3qpFwnndSYGafu4B0e2V0OQBgWiZ+g3uFQlESCzqycKf4s9P0TUkeISisBBajlJqf8+O3S5cIsa0F+NeJfxk/NywEfrrEG0eKqS5qWo078WfAb73b2LpA8ilnGM5glcPBNweAQTiFDvIufN4D2Pua9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com; spf=pass smtp.mailfrom=foxmail.com; dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b=HGK8RVqq; arc=none smtp.client-ip=203.205.221.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b="HGK8RVqq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1781666192;
	bh=voPZZPDKGy96YcSfqQY+Ty+WqcoQ+pWgwDXXjhOpYBE=;
	h=From:To:Cc:Subject:Date;
	b=HGK8RVqqARfxHkNYgVn4edYgrlArjkwb0aGQ55p6wrOPjQtzgFIX7AW8yd3xrJju3
	 si/WVtG9r7QfPldpTft7vHE410PBavrc0WRalFmN3PWHrdP+KPmcIm0C2tjUn1/0uS
	 XDuZCtFBv7o/mVmtA5v5Ii6e+P0FJulteY7Gp9kQ=
Received: from localhost.localdomain ([116.128.244.169])
	by newxmesmtplogicsvrsza63-0.qq.com (NewEsmtp) with SMTP
	id 41E2881F; Wed, 17 Jun 2026 11:16:30 +0800
X-QQ-mid: xmsmtpt1781666190t35bmdde9
Message-ID: <tencent_2C7697B076D53BBE62D99B7CD15E77A20C07@qq.com>
X-QQ-XMAILINFO: OEUhVsHQax4MM32vS78aLX1UrID9s8H7mfImQLTf6Gz8suyH8C92nduvQJulM1
	 F/2DBOw02nLzyGlwlFOg0igz/oMKwrdsOvgzGDLPbEcBl1cctzdMTLHQKqjyDnFLKX79fijodnJp
	 nDPIE/y9Lk2TiPPtybD63TlrqZQwnf7aKkUoUQXKE9F15o7f+WkAdacDAxGl1ieq6rFHksqhhvcM
	 6RWUBMtDovM/TNai9FFvL6ZJoGxmb9k/ZgxvuZlIfHHrddzoJaKfo+MRm0ZHtTBjS7ErTOCYEGlC
	 GByYix4rSAYG7k/LnFyHXolb39n9s9WP9eMlXRdqgZ7j/9i944ceeKYVoWKk4ZOjD7jAhbwGnti4
	 n9/aBQd/K5R2/r+4Nc/JunhO7/e56Xjn1nISanFMwguFS/wlMxFNtzm5AHSLGKx8AmaS8pI0T61O
	 K7fxRcUzPeO6xDUXWxPI0rhdcyBi2GSeD4qSp4iGhTsni0gRL6SmL5qpQz/YX221gkIHmATByFcU
	 UWgKoUoFiqqghjbqnIFFkqYy52p6az3IreeQNqJnmyzBVSAANJp8ibJlQnOJLJE8haLSGS0Y6nU1
	 C38hQHyegDF9d0evGH4VLLlhVOzCQcPB+zrQitPlGXC8s4vodCYlorwpd6LXLdPvLWgMt6hVpy4q
	 ZSpK2s+H55d2GOu97ZxcbTzi90gv7X8tNWc6bEZ6S0t9LmbgOLVZXepFVOQp1Ma1Qao856lPgcg9
	 C34xF65oKSrjN4Rwfo5++qMTYpsHlcE2A/DghjGj9K4B98F6NMWakV68yjXimotFulX/Dy6PSAhY
	 Hz1UgvMO0i698uXLqRioupfR4zdvmjoVsDLR83oqkHLttLQaHDvuAWrGYolBwhG8ucP+9xZZquBj
	 vaWFZh9zIBq9q1eqkE0aW/pXP+mxY1Iva7OCJKDUTGrfqGmA2F8G0/zha5qI8loRTiMopId92/9q
	 /lhx7Nu+kNpj69o/Na/d5rZbu3Guw2o75arPBpE8mIymk7mTl0Bfr33YgtuWmC7hiTuOPqtZlLfo
	 h3HVji9g==
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
From: Zhao Dongdong <winter91@foxmail.com>
To: p.zabel@pengutronix.de,
	wens@kernel.org,
	jernej.skrabec@gmail.com
Cc: linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Zhao Dongdong <zhaodongdong@kylinos.cn>,
	stable@vger.kernel.org
Subject: [PATCH] reset: sunxi: fix memory region leak on ioremap failure
Date: Wed, 17 Jun 2026 11:16:27 +0800
X-OQ-MSGID: <20260617031627.151885-1-winter91@foxmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Zhao Dongdong <zhaodongdong@kylinos.cn>

In sunxi_reset_init(), when ioremap() fails, the memory region obtained
via request_mem_region() is not released, leading to a resource leak.

Add an err_mem_region label to properly release the memory region before
freeing the data structure.

Fixes: 8f1ae77f4666 ("reset: Add Allwinner SoCs Reset Controller Driver")
Cc: stable@vger.kernel.org
Signed-off-by: Zhao Dongdong <zhaodongdong@kylinos.cn>
---
 drivers/reset/reset-sunxi.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/reset/reset-sunxi.c b/drivers/reset/reset-sunxi.c
index 2544de6576e4..2f6df7707cad 100644
--- a/drivers/reset/reset-sunxi.c
+++ b/drivers/reset/reset-sunxi.c
@@ -44,7 +44,7 @@ static int sunxi_reset_init(struct device_node *np)
 	data->membase = ioremap(res.start, size);
 	if (!data->membase) {
 		ret = -ENOMEM;
-		goto err_alloc;
+		goto err_mem_region;
 	}
 
 	spin_lock_init(&data->lock);
@@ -57,6 +57,8 @@ static int sunxi_reset_init(struct device_node *np)
 
 	return reset_controller_register(&data->rcdev);
 
+err_mem_region:
+	release_mem_region(res.start, size);
 err_alloc:
 	kfree(data);
 	return ret;
-- 
2.25.1

