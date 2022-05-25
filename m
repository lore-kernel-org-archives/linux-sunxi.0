Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 941217C
	for <linux-sunxi@lists.linux.dev>; Wed, 25 May 2022 19:07:01 +0000 (UTC)
Received: (Authenticated sender: paul.kocialkowski@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id E45D61C0017;
	Wed, 25 May 2022 19:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1653505620;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AHgdAMr0VE5Oi91mHCt3ItrN9xcRdz72/1e6nhkDSwE=;
	b=E0x/t+PznpTJLrg0qAHK6krfeK5rQwjZ0JNlrvBE8ta7mYn6c4tGwSAKGdhbsuUN9/qs2/
	AYNEUqTWlZpRPU6nWwrbL9KMfqrIqK11aZD4f1ljo5plEr7EkGtVQne6mHg+TS2V+3g5ok
	kgJkoncXWkPDmpwIe5S/IRy8Pa2wINNqKpaInl1TzmPCPQp5rzajb3HVYpG5Py87u7bJ7O
	g2Tz4I/bTIBrsQCMOSTfqU6Xp/pY4HHv/8jdLYG8aYWl5sWAAMciqaWYC64w5raGMWO2IT
	XKWmY9vy3wM9WrEOWufVxpheozInBXeXPsXXKL8CKLkOIYCh+7zwOIEA9A9LYQ==
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
Subject: [PATCH v5 28/44] media: sun6i-csi: Add bridge dimensions and format helpers
Date: Wed, 25 May 2022 21:06:01 +0200
Message-Id: <20220525190617.696344-29-paul.kocialkowski@bootlin.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220525190617.696344-1-paul.kocialkowski@bootlin.com>
References: <20220525190617.696344-1-paul.kocialkowski@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce new helpers to ease getting information about the bridge.

Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 .../sunxi/sun6i-csi/sun6i_csi_bridge.c        | 20 +++++++++++++++++++
 .../sunxi/sun6i-csi/sun6i_csi_bridge.h        |  7 +++++++
 2 files changed, 27 insertions(+)

diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c
index bba825db8322..0c1e159537a7 100644
--- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c
@@ -12,6 +12,26 @@
 #include "sun6i_csi.h"
 #include "sun6i_csi_bridge.h"
 
+/* Helpers */
+
+void sun6i_csi_bridge_dimensions(struct sun6i_csi_device *csi_dev,
+				 unsigned int *width, unsigned int *height)
+{
+	if (width)
+		*width = csi_dev->bridge.mbus_format.width;
+	if (height)
+		*height = csi_dev->bridge.mbus_format.height;
+}
+
+void sun6i_csi_bridge_format(struct sun6i_csi_device *csi_dev,
+			     u32 *mbus_code, u32 *field)
+{
+	if (mbus_code)
+		*mbus_code = csi_dev->bridge.mbus_format.code;
+	if (field)
+		*field = csi_dev->bridge.mbus_format.field;
+}
+
 /* Format */
 
 static const u32 sun6i_csi_bridge_mbus_codes[] = {
diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.h b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.h
index f9bf87bf3667..5e6448aa522f 100644
--- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.h
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.h
@@ -41,6 +41,13 @@ struct sun6i_csi_bridge {
 	struct sun6i_csi_bridge_source	source_parallel;
 };
 
+/* Helpers */
+
+void sun6i_csi_bridge_dimensions(struct sun6i_csi_device *csi_dev,
+				 unsigned int *width, unsigned int *height);
+void sun6i_csi_bridge_format(struct sun6i_csi_device *csi_dev,
+			     u32 *mbus_code, u32 *field);
+
 /* Bridge */
 
 int sun6i_csi_bridge_setup(struct sun6i_csi_device *csi_dev);
-- 
2.36.1

