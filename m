Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89C5D259A
	for <linux-sunxi@lists.linux.dev>; Fri,  9 Sep 2022 13:40:36 +0000 (UTC)
Received: (Authenticated sender: paul.kocialkowski@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id E01401C0003;
	Fri,  9 Sep 2022 13:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1662730829;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NzDRiNxlngXMkep4VlkVbmP7SB6g960sXKbI90dfLZ4=;
	b=hGtcLJPqM6oYiVcr1WZyCzBbTYzH6GqgwUSJpWEVhLJj54xhH2+gf6jNPZ5lhKogjzqxMz
	M4+Rh08pagsRVtaGzmKC/MmFVBOJsrUmg+6wDlc3QXZi2YNnFAXmkeg0gLLSUtUkBY/Gdn
	vLppwZCqwWJVX6DEQlRuFeHgpNx0Ovtgyx2292NAtRRO+Ycnhx0PbuGo3WRuqd/9ea8Jhp
	nIIAaMYBdHhhu+zsg0JExUKGfajlOgZqeBWyvDCIIEhDmQ78fEiaEV8T6aiND8FR5WQnir
	AIgZ1j2wJXmSYCu+1FaZqbzyK/eeaGPkkQhnMDbZzubKyFg1tD7NbBtPWNgFpQ==
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To: linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH 1/4] media: sun6i-mipi-csi2: Require both pads to be connected for streaming
Date: Fri,  9 Sep 2022 15:39:51 +0200
Message-Id: <20220909133954.97010-2-paul.kocialkowski@bootlin.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220909133954.97010-1-paul.kocialkowski@bootlin.com>
References: <20220909133954.97010-1-paul.kocialkowski@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The bridge needs both its pads connected to be able to stream data.
Enforcing this is useful to produce an error when no sensor is
connected.

Fixes: af54b4f4c17f ("media: sunxi: Add support for the A31 MIPI CSI-2 controller")
Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
---
 .../media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c  | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c b/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c
index 30d6c0c5161f..340380a5f66f 100644
--- a/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c
+++ b/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c
@@ -519,8 +519,10 @@ static int sun6i_mipi_csi2_bridge_setup(struct sun6i_mipi_csi2_device *csi2_dev)
 
 	/* Media Pads */
 
-	pads[SUN6I_MIPI_CSI2_PAD_SINK].flags = MEDIA_PAD_FL_SINK;
-	pads[SUN6I_MIPI_CSI2_PAD_SOURCE].flags = MEDIA_PAD_FL_SOURCE;
+	pads[SUN6I_MIPI_CSI2_PAD_SINK].flags = MEDIA_PAD_FL_SINK |
+					       MEDIA_PAD_FL_MUST_CONNECT;
+	pads[SUN6I_MIPI_CSI2_PAD_SOURCE].flags = MEDIA_PAD_FL_SOURCE |
+						 MEDIA_PAD_FL_MUST_CONNECT;
 
 	ret = media_entity_pads_init(&subdev->entity, SUN6I_MIPI_CSI2_PAD_COUNT,
 				     pads);
-- 
2.37.3

