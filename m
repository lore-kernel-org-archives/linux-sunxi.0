Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 930C27FF
	for <linux-sunxi@lists.linux.dev>; Thu,  3 Nov 2022 16:32:24 +0000 (UTC)
Received: (Authenticated sender: paul.kocialkowski@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 98546240010;
	Thu,  3 Nov 2022 16:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1667493143;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0pIjq7cv/w3kCEqoFSm0K7eHodbnGe7pMwLov1o/wy4=;
	b=IyvfAxGuXWnZ1ZlBMuws0G0MSqSPCVtBhbPQP2r8YFYVk+HFo1NkWBJTtrv4FdeDe/+Xcz
	/X+a3vnAPXmdofRa5gFtjnO2KjVRiUrVE9OpBWQwtg8IWlR684qG8JszZIlJ99QCxAcWD9
	KLWDmrbOaFGAa2VcLUWy19Jm6/Hl/qzg4CJuK/n7kyXEOCIE7/ZuVJHb0Qyuk3xHOyOB3c
	kyJU8TV0PvN1EHyJCvSfR6/jgA+lCLlT7bJEW0NvuCr7UuBLmCvHXi0KzItmKma5gclDrn
	kIB8ShYLt9MQ4syknWzsjFNSeL/KIZ066mlhK2S2bdXTzyN0O8Ow5iwYaYKDcQ==
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Cc: Yong Deng <yong.deng@magewell.com>,
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH v7 27/28] media: sun6i-csi: Request a shared interrupt
Date: Thu,  3 Nov 2022 17:31:12 +0100
Message-Id: <20221103163113.245462-28-paul.kocialkowski@bootlin.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221103163113.245462-1-paul.kocialkowski@bootlin.com>
References: <20221103163113.245462-1-paul.kocialkowski@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Request our interrupt shared since it is typically shared with the isp
block. The interrupt routine looks good to go for shared irq.

Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
index 46c5f98702e1..00521f966cee 100644
--- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
@@ -248,8 +248,8 @@ static int sun6i_csi_resources_setup(struct sun6i_csi_device *csi_dev,
 		goto error_clock_rate_exclusive;
 	}
 
-	ret = devm_request_irq(dev, irq, sun6i_csi_interrupt, 0, SUN6I_CSI_NAME,
-			       csi_dev);
+	ret = devm_request_irq(dev, irq, sun6i_csi_interrupt, IRQF_SHARED,
+			       SUN6I_CSI_NAME, csi_dev);
 	if (ret) {
 		dev_err(dev, "failed to request interrupt\n");
 		goto error_clock_rate_exclusive;
-- 
2.38.1

