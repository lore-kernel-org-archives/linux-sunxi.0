Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 500862C80
	for <linux-sunxi@lists.linux.dev>; Fri, 26 Nov 2021 02:32:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 93EC361183;
	Fri, 26 Nov 2021 02:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1637893926;
	bh=KWxXtW72Tj7fGimpSt36yqmxv90yxBqm44E4kmS6tPg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NX6l95a5iwdNnEHgFbFu6Xvl/p+YdoU7xxX2JI8yIr2nccRiYTricHIqKNpwXO9Zo
	 3awovS32Sn6vv2FNSOMjyezKursN4IBkAag9BcRuyrl5Jp75v+5ojFrMwyrPqFxxHT
	 muq6pP2FBm0bvMIhPAU+UgP6rqhIBWe+oJtafO19lEyYIwotZpzF5shrrMY7iKYIpM
	 +6peBgHF4SaWByiR69UZ/Us6yxvGqan/wfjvvuum11uPhCmnAZqPl4V4jUAF5vVCD7
	 g8YGZbIrYbdRfY5vfdfRLZBvuGLXjThlDh4gL+KJq7yAkcElNpziMFsgTFYMQHVwrl
	 DlXLUCJ4O0rYg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Julian Braha <julianbraha@gmail.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maxime Ripard <maxime@cerno.tech>,
	Sasha Levin <sashal@kernel.org>,
	mripard@kernel.org,
	wens@csie.org,
	airlied@linux.ie,
	daniel@ffwll.ch,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH AUTOSEL 5.15 05/39] drm/sun4i: fix unmet dependency on RESET_CONTROLLER for PHY_SUN6I_MIPI_DPHY
Date: Thu, 25 Nov 2021 21:31:22 -0500
Message-Id: <20211126023156.441292-5-sashal@kernel.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211126023156.441292-1-sashal@kernel.org>
References: <20211126023156.441292-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit

From: Julian Braha <julianbraha@gmail.com>

[ Upstream commit bb162bb2b4394108c8f055d1b115735331205e28 ]

When PHY_SUN6I_MIPI_DPHY is selected, and RESET_CONTROLLER
is not selected, Kbuild gives the following warning:

WARNING: unmet direct dependencies detected for PHY_SUN6I_MIPI_DPHY
  Depends on [n]: (ARCH_SUNXI [=n] || COMPILE_TEST [=y]) && HAS_IOMEM [=y] && COMMON_CLK [=y] && RESET_CONTROLLER [=n]
  Selected by [y]:
  - DRM_SUN6I_DSI [=y] && HAS_IOMEM [=y] && DRM_SUN4I [=y]

This is because DRM_SUN6I_DSI selects PHY_SUN6I_MIPI_DPHY
without selecting or depending on RESET_CONTROLLER, despite
PHY_SUN6I_MIPI_DPHY depending on RESET_CONTROLLER.

These unmet dependency bugs were detected by Kismet,
a static analysis tool for Kconfig. Please advise if this
is not the appropriate solution.

v2:
Fixed indentation to match the rest of the file.

Signed-off-by: Julian Braha <julianbraha@gmail.com>
Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
Link: https://patchwork.freedesktop.org/patch/msgid/20211109032351.43322-1-julianbraha@gmail.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/sun4i/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/sun4i/Kconfig b/drivers/gpu/drm/sun4i/Kconfig
index 5755f0432e774..8c796de53222c 100644
--- a/drivers/gpu/drm/sun4i/Kconfig
+++ b/drivers/gpu/drm/sun4i/Kconfig
@@ -46,6 +46,7 @@ config DRM_SUN6I_DSI
 	default MACH_SUN8I
 	select CRC_CCITT
 	select DRM_MIPI_DSI
+	select RESET_CONTROLLER
 	select PHY_SUN6I_MIPI_DPHY
 	help
 	  Choose this option if you want have an Allwinner SoC with
-- 
2.33.0

