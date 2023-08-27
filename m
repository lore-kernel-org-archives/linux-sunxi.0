Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85FB62F3A
	for <linux-sunxi@lists.linux.dev>; Sun, 27 Aug 2023 22:17:11 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (unknown [217.70.183.196])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id 4A623CC186
	for <linux-sunxi@lists.linux.dev>; Sun, 27 Aug 2023 22:17:04 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DEE05E0002;
	Sun, 27 Aug 2023 22:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1693174616;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=IEBggQJcGAS2ZTc+gnah+Y1oXvRlQWb/y/kodguClMc=;
	b=Aa6BsT7BThDBVLPQsE4BoCEmWtZeyLWKR2IXiOyVlGRZ9GjobAqglzXF9I6NaC0LNQyuYn
	NwU2gaJ+f0Y9iBOt6B1Fx3ZsNZ3n975TeuLkzUy62M6eT0y70lKObV9qViXtiWLWFhQnGa
	nNfP5+z/k1iBMGM6YwglepBtLozr6dDI1SE7T7Q79zOVuSw6fYGIslo4uKqVxz6lYD7kTx
	1zxG3cOkwXZoBmErMO43HsVYhnAdyBeyQh+AzbA74CiaP3KYqDf2KHy5l1easYKjQfCC+M
	hVuthTm4BMrjDOg4LRDszeQLvK52tfxNjaOObqU+uFXPdivU+hMLHCg81t508Q==
From: alexandre.belloni@bootlin.com
To: Alessandro Zummo <a.zummo@towertech.it>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-rtc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] rtc: sun6i: remove unnecessary message
Date: Mon, 28 Aug 2023 00:16:40 +0200
Message-ID: <20230827221643.544259-1-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.41.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: alexandre.belloni@bootlin.com

From: Alexandre Belloni <alexandre.belloni@bootlin.com>

The core already print a message once the rtc is successfully registered,
it is not necessary to print an other one.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-sun6i.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/rtc/rtc-sun6i.c b/drivers/rtc/rtc-sun6i.c
index 753a2d9c8a17..8e0c66906103 100644
--- a/drivers/rtc/rtc-sun6i.c
+++ b/drivers/rtc/rtc-sun6i.c
@@ -846,8 +846,6 @@ static int sun6i_rtc_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	dev_info(&pdev->dev, "RTC enabled\n");
-
 	return 0;
 }
 
-- 
2.41.0

