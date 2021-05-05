Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D41652F83
	for <linux-sunxi@lists.linux.dev>; Wed,  5 May 2021 09:42:20 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7452861441;
	Wed,  5 May 2021 09:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1620207739;
	bh=364y8EHJw+K9cWcJ3TfK59fyAMvbTh2YZ4HqAVyg8A8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KndRsQn6wUyNi6eN7k33M1w7kqzJ24+MX/2EQ0eQjTL8hFb+QvTYQcVyx3lu26OZz
	 /6e553NH+Go/bMLU3TXK+Y3rjWMtO0RryzewWuUkbMjKDIwFPpi7sfyrBUJs6ny0hC
	 /6HGkeImhGk8ixnl0PFf4rJe+zxn6hmgeZbk2MKJpZTXhUn6M25A/DNR4/iaJIYue7
	 8cf/K3YZ8ysnQpz04o8qVWiibQ+Hhu5zWH7ec9xHyjTbVCG3qoHupemmTLNl2SmGtr
	 PavTMKvW4zjUj74wRAztvZkpXYiA+ykl0dZxxlTxhhcKse87GIQiPyPryZfwfueTep
	 3Pp+Z6bLFeeSA==
Received: by mail.kernel.org with local (Exim 4.94)
	(envelope-from <mchehab@kernel.org>)
	id 1leE2r-00AHwp-G3; Wed, 05 May 2021 11:42:17 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: 
Cc: linuxarm@huawei.com,
	mauro.chehab@huawei.com,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@siol.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [PATCH 21/25] media: sunxi: fix pm_runtime_get_sync() usage count
Date: Wed,  5 May 2021 11:42:11 +0200
Message-Id: <0dea9a799700efd0f3ceaf9d25ded282295e2db9.1620207353.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1620207353.git.mchehab+huawei@kernel.org>
References: <cover.1620207353.git.mchehab+huawei@kernel.org>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>

The pm_runtime_get_sync() internally increments the
dev->power.usage_count without decrementing it, even on errors.
Replace it by the new pm_runtime_resume_and_get(), introduced by:
commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to deal with usage counter")
in order to properly decrement the usage counter, avoiding
a potential PM usage counter leak.

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/platform/sunxi/sun8i-rotate/sun8i_rotate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/sunxi/sun8i-rotate/sun8i_rotate.c b/drivers/media/platform/sunxi/sun8i-rotate/sun8i_rotate.c
index 3f81dd17755c..fbcca59a0517 100644
--- a/drivers/media/platform/sunxi/sun8i-rotate/sun8i_rotate.c
+++ b/drivers/media/platform/sunxi/sun8i-rotate/sun8i_rotate.c
@@ -494,7 +494,7 @@ static int rotate_start_streaming(struct vb2_queue *vq, unsigned int count)
 		struct device *dev = ctx->dev->dev;
 		int ret;
 
-		ret = pm_runtime_get_sync(dev);
+		ret = pm_runtime_resume_and_get(dev);
 		if (ret < 0) {
 			dev_err(dev, "Failed to enable module\n");
 
-- 
2.30.2

