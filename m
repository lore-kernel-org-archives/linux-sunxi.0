Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20ECB3D62
	for <linux-sunxi@lists.linux.dev>; Wed, 14 Sep 2022 15:10:02 +0000 (UTC)
Received: from dimapc.. (109-252-122-187.nat.spd-mgts.ru [109.252.122.187])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dmitry.osipenko)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 0754A6600367;
	Wed, 14 Sep 2022 16:09:59 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1663168200;
	bh=uWfhIj94xNpIhpVyASAmYnEvUVFgfYgu4vMvd86qMK4=;
	h=From:To:Cc:Subject:Date:From;
	b=gmZ1Dzs/Bs7mPmuMnbAyGtg0QdhRaQgIF4nyYAPiaIlpuhIRaBUHTKChqY7puyQOE
	 SlE5mFgKW9c5WCyhJuOJFLuRhSaZbQ8PGTe2Epo47CZLaR2zGO1GtM9dX8+Hr622I4
	 pOi84l1h8n3jtxUXD9Mk+iUKTsPj80R+7PHXeBxS0W5Ox6IX3ps9YyIn3dJJpUKgfc
	 Bhunx1aGvppbRJmmlx9HyueJa6n4JK2WFBMoDe3Kw52euJtaZhXWZaxY8GH/TVuk9B
	 428GtEYjj0rdV2SQShDeFAGHkNtVzwYY9uZAdJx5lf9dRm36+powNN2T9AwEDoq7F7
	 5onuGU7ENympA==
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: Jernej Skrabec <jernej.skrabec@gmail.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] ARM: sunxi_defconfig: Enable display framebuffer
Date: Wed, 14 Sep 2022 18:09:33 +0300
Message-Id: <20220914150933.212182-1-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.37.3
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The display framebuffer config options changed in kernel awhile ago
and FB isn't enabled anymore using sunxi_defconfig. Add the missing
config options needed by display.

Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 arch/arm/configs/sunxi_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/configs/sunxi_defconfig b/arch/arm/configs/sunxi_defconfig
index 3d14827e0a31..2241e3d037b1 100644
--- a/arch/arm/configs/sunxi_defconfig
+++ b/arch/arm/configs/sunxi_defconfig
@@ -112,6 +112,8 @@ CONFIG_DRM_PANEL_EDP=y
 CONFIG_DRM_SIMPLE_BRIDGE=y
 CONFIG_DRM_LIMA=y
 CONFIG_FB_SIMPLE=y
+CONFIG_FB=y
+CONFIG_FRAMEBUFFER_CONSOLE=y
 CONFIG_BACKLIGHT_CLASS_DEVICE=y
 CONFIG_BACKLIGHT_PWM=y
 CONFIG_SOUND=y
-- 
2.37.3

