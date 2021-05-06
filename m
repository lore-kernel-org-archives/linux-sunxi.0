Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 441CA70
	for <linux-sunxi@lists.linux.dev>; Thu,  6 May 2021 15:26:24 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id AFC9661949;
	Thu,  6 May 2021 15:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1620314783;
	bh=Q1WsziPcbnwAb2cpqQFZbO8zttZnZQq1oIpn6yJZI+I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jT90qvx9MfzcfeyIFJE9XCz0ywhiU67cPZEcnlRwVlGDFG9a8ewKY9V51EKUNXG+2
	 BdJVo7PwOoiytmgZMVJUHIBCpohFHG6YiK91yncEC64KY3sXsGyTbQRdMC0MuTyfd8
	 7YM4Wlijpvt9hWWoVKXnHlgkvWSO+MkNObkN3nTek6WJ7iRcTuYgye5lRhD48l+jyL
	 Eujpj+4df+zxARV22IYjr1Bhs40d2s7K9EM7K/vgdT0baf7JmOCutac1dnVBiYIwnW
	 idg8hAzIYWz7eTVbHIPo4jQn8NeRfofLPrc0SI4K4D359Kqv/4YQJKPPzMz/niYS4I
	 2OmVXfmIx1ONA==
Received: by mail.kernel.org with local (Exim 4.94.2)
	(envelope-from <mchehab@kernel.org>)
	id 1left8-000SCN-B5; Thu, 06 May 2021 17:26:06 +0200
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
	linux-sunxi@lists.linux.dev
Subject: [PATCH v5 21/25] media: sunxi: use pm_runtime_resume_and_get()
Date: Thu,  6 May 2021 17:25:59 +0200
Message-Id: <24d9a9a7010b155fd5cc23566b158b9cee0a66a3.1620314616.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1620314616.git.mchehab+huawei@kernel.org>
References: <cover.1620314616.git.mchehab+huawei@kernel.org>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>

Commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to deal with usage counter")
added pm_runtime_resume_and_get() in order to automatically handle
dev->power.usage_count decrement on errors.

Use the new API, in order to cleanup the error check logic.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/platform/sunxi/sun4i-csi/sun4i_v4l2.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/sunxi/sun4i-csi/sun4i_v4l2.c b/drivers/media/platform/sunxi/sun4i-csi/sun4i_v4l2.c
index 4785faddf630..54b909987caa 100644
--- a/drivers/media/platform/sunxi/sun4i-csi/sun4i_v4l2.c
+++ b/drivers/media/platform/sunxi/sun4i-csi/sun4i_v4l2.c
@@ -206,9 +206,9 @@ static int sun4i_csi_open(struct file *file)
 	if (ret)
 		return ret;
 
-	ret = pm_runtime_get_sync(csi->dev);
+	ret = pm_runtime_resume_and_get(csi->dev);
 	if (ret < 0)
-		goto err_pm_put;
+		goto err_unlock;
 
 	ret = v4l2_pipeline_pm_get(&csi->vdev.entity);
 	if (ret)
@@ -227,6 +227,8 @@ static int sun4i_csi_open(struct file *file)
 
 err_pm_put:
 	pm_runtime_put(csi->dev);
+
+err_unlock:
 	mutex_unlock(&csi->lock);
 
 	return ret;
-- 
2.30.2

