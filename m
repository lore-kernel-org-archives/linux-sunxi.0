Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4316572
	for <linux-sunxi@lists.linux.dev>; Sun,  4 Jul 2021 23:08:19 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3428D61364;
	Sun,  4 Jul 2021 23:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1625440099;
	bh=VvBNWVfKMUPM1hXDvZqcj89kC+byaY2wtn0l6MzVFvM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HrD39GFe0mT81xwQnU1Lxm4Jf+W11VwhPRtmBanaRpSr1/lHg/W47VzwuC41L/mYt
	 99noPrZDFNi2b4hXF3ATto4QoGRpoy5xQCnt2p5LfabLrGvpoWGFBGaw8doEPJ/cb/
	 pMlGe92k8Wh/uosp40ndUMTIQcc56Qq3Pba7HlDW1TOzutZ7DzAlkexgDN3RUTBBrw
	 ztPz5/EJJLDr8NksmBcBtA4BjkG8/vWxFsqVvC19iF6iA2FG2SD0yzf7B3uxwe5+xi
	 zGL2HGsJ+NH1N47D2eOM8/yWIjkdH9BixpR21KmT76nN0KJA9CJSmG/cItlCuh1yEO
	 7MOsQywCmysRA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Sasha Levin <sashal@kernel.org>,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH AUTOSEL 5.10 11/70] media: sunxi: fix pm_runtime_get_sync() usage count
Date: Sun,  4 Jul 2021 19:07:04 -0400
Message-Id: <20210704230804.1490078-11-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210704230804.1490078-1-sashal@kernel.org>
References: <20210704230804.1490078-1-sashal@kernel.org>
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

