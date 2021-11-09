Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50C9A2C85
	for <linux-sunxi@lists.linux.dev>; Tue,  9 Nov 2021 03:23:54 +0000 (UTC)
Received: by mail-qv1-f44.google.com with SMTP id s9so13318799qvk.12
        for <linux-sunxi@lists.linux.dev>; Mon, 08 Nov 2021 19:23:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2V3HogjR6tzeLasoYLzy6we6u4i3vWdwDzTcRieWiEM=;
        b=LKmalwKErazJJMZDAs8oZwXA/te5qGZYGXTxMEHcmVJf+XS9M8wT0fh3k0hmf/XDZ0
         yi6id+IP38VRYUwbGNeq4MlUgDwU6N9MtCw1q1yYh3c6N0FV1jJbo4WOxtjzaZtrryUS
         NFWk0a96iyu6mjMc260jlsndn+BUXvcJjLP5KXc1Nl0vksgTp8IIAEQ4GuzXrRJ8+Hi5
         SM021kwP48z1A77N3qqpuKy2P0XXTXHnFSTvBr8VmJ/Jt7CClHTX47WUh1yw15J51bu+
         9NHvn3fWf/R0o/blQpqIr2amky3axROrIpPPoeDiU+gOAQXGZhygjP9eTO9tFM20Lcjx
         ZPcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=2V3HogjR6tzeLasoYLzy6we6u4i3vWdwDzTcRieWiEM=;
        b=7UtN8Y73MVidPhThwMU+P17J1Fb2hqOlNCAiZOUGK+Er0YmTORtNN2olNoUEqMRwb7
         ytDRoyDmvx9RfKR7WHtHTqlm7WIjZGhbHS56Rcm4mA/c4PwElGU3SnHemugUUjHsXg66
         MYrIoT97A21cdjktm2dcvcrvfWUNtb2N6ZDzowKN1HFrgmYP5iWL8LyT9kHlRQhy5HPZ
         VITePMDmvCTR+o3O248ACWQTU84ToLKDJ+CIFhWwc5GZXzzrvdtH6ZnZLAaMwYtpjoB2
         OHgP6y7Dv33asXND4Trvym+1+lE1/JmGo7eHYsxNiBHD7NHSu86fcT4e49l/PbtCPWG6
         gGWA==
X-Gm-Message-State: AOAM532pR4uJabWZtm35/SGzKTtF+GiY6HB3Iv19Ge6rClKGYxyUO5rX
	RpF8aO/K7XfsM0j62HdpgX0=
X-Google-Smtp-Source: ABdhPJx/A45jDBxyjJp26aQ17KId/KksS/DEix+3w66MMwl/WrSdu8dJIgKKzsVCzb8Z0GoWSqPLkg==
X-Received: by 2002:a05:6214:411d:: with SMTP id kc29mr4253736qvb.22.1636428233263;
        Mon, 08 Nov 2021 19:23:53 -0800 (PST)
Received: from localhost.localdomain ([67.8.38.84])
        by smtp.gmail.com with ESMTPSA id f7sm11032327qkp.107.2021.11.08.19.23.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Nov 2021 19:23:52 -0800 (PST)
Sender: Julian Braha <julian.braha@gmail.com>
From: Julian Braha <julianbraha@gmail.com>
To: airlied@linux.ie,
	daniel@ffwll.ch,
	jernej.skrabec@gmail.com,
	wens@csie.org,
	mripard@kernel.org
Cc: dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	fazilyildiran@gmail.com
Subject: [PATCH] [PATCH v2] drm/sun4i: fix unmet dependency on RESET_CONTROLLER for PHY_SUN6I_MIPI_DPHY
Date: Mon,  8 Nov 2021 22:23:51 -0500
Message-Id: <20211109032351.43322-1-julianbraha@gmail.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
---
 drivers/gpu/drm/sun4i/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/sun4i/Kconfig b/drivers/gpu/drm/sun4i/Kconfig
index 5755f0432e77..8c796de53222 100644
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
2.30.2

