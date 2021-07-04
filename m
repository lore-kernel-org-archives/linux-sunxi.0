Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDD2B72
	for <linux-sunxi@lists.linux.dev>; Sun,  4 Jul 2021 23:04:37 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9C57961283;
	Sun,  4 Jul 2021 23:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1625439877;
	bh=VvBNWVfKMUPM1hXDvZqcj89kC+byaY2wtn0l6MzVFvM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CRQc3VBO6+e3uKNkyTt4PT9iiC3oIAbjOguQWlYPtlIWWbYskQIkQdNnmKD71LGHh
	 Z/ojjSu2DANP7IYcOX9WlixMbj1aCWwQZnprpNgxxlVed3Ix0a2vSc9QRP1w0rRIKz
	 8GUOKm3jBKYjFY/XesCuvoDl7/oAR+G97bnbTHLFsQwGMpPWE5as5gljakmYG7XpI4
	 v1JS3wo6aHIZuvOxyaVts2dmsWngkGc3DJ34kwkzZhKLJ8mXejre4zOYzL+jw6tAZn
	 GhXo/tZ4zororHS6Z1+pG00V/VmvZnHcTJFpFU6+hW17sfLZLr6AXR+X7cfxxwOjFp
	 cvhmYZ1M0h+IA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Sasha Levin <sashal@kernel.org>,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH AUTOSEL 5.13 12/85] media: sunxi: fix pm_runtime_get_sync() usage count
Date: Sun,  4 Jul 2021 19:03:07 -0400
Message-Id: <20210704230420.1488358-12-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210704230420.1488358-1-sashal@kernel.org>
References: <20210704230420.1488358-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit

From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

[ Upstream commit 9c298f82d8392f799a0595f50076afa1d91e9092 ]

The pm_runtime_get_sync() internally increments the
dev->power.usage_count without decrementing it, even on errors.
Replace it by the new pm_runtime_resume_and_get(), introduced by:
commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to deal with usage counter")
in order to properly decrement the usage counter, avoiding
a potential PM usage counter leak.

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
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

