Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1872A4A3D
	for <linux-sunxi@lists.linux.dev>; Fri, 12 Aug 2022 22:01:09 +0000 (UTC)
Received: (Authenticated sender: paul.kocialkowski@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 89E10C0006;
	Fri, 12 Aug 2022 22:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1660341668;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ICxRmg8LColIPirnJ+I1Csx9CqwGjKG1Bxfn6DihTrw=;
	b=IncgV2D56x0S6njXdfc/p0CdrXphM5OkJWdSGqsM6/pavl0OANresD6EasK68ue0DhrIKk
	BHnKNuBOdVeqM5xWVcBhF55b2uX672x49aWkJf7w2FA3ClpsGUEI5DZhhdUNbO0QDSLhrZ
	tlik/8TcykIAejQ+fjfv4vwO4XBwRPYgmTDYZMSsUnrJV+JSEAI10guPOkBc7QMrizoc6s
	wEOKn0h1D/5SsTzd19bH1hNhWJY1v2sPCYH/U0Mao1Rh4sUi1JJkB+Sh3w44y/oEbcMyFP
	spVoS8BVQOAlj/XFf94dGWKmgV4C/UMx1M15Hf1/uLtteUFx4KOJtuO5GHmGjA==
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To: linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Maxime Ripard <mripard@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH 5/6] media: sun8i-di: Add a Kconfig dependency on RESET_CONTROLLER
Date: Sat, 13 Aug 2022 00:00:44 +0200
Message-Id: <20220812220045.800820-5-paul.kocialkowski@bootlin.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220812220045.800820-1-paul.kocialkowski@bootlin.com>
References: <20220812220045.800820-1-paul.kocialkowski@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver relies on the reset controller API to work, so add
RESET_CONTROLLER as one of its Kconfig dependencies.

Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
---
 drivers/media/platform/sunxi/sun8i-di/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/sunxi/sun8i-di/Kconfig b/drivers/media/platform/sunxi/sun8i-di/Kconfig
index ff71e06ee2df..f688396913b7 100644
--- a/drivers/media/platform/sunxi/sun8i-di/Kconfig
+++ b/drivers/media/platform/sunxi/sun8i-di/Kconfig
@@ -4,7 +4,7 @@ config VIDEO_SUN8I_DEINTERLACE
 	depends on V4L_MEM2MEM_DRIVERS
 	depends on VIDEO_DEV
 	depends on ARCH_SUNXI || COMPILE_TEST
-	depends on COMMON_CLK && OF
+	depends on COMMON_CLK && RESET_CONTROLLER && OF
 	depends on PM
 	select VIDEOBUF2_DMA_CONTIG
 	select V4L2_MEM2MEM_DEV
-- 
2.37.1

