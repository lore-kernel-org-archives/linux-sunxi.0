Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE9C2459ADE
	for <linux-sunxi@lists.linux.dev>; Fri, 31 Jul 2026 16:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785514794; cv=none; b=dbkUONKEExrLqYU6CBQlOzVVzKAsJRZCZ0V8kb/3QoAb6g37rwiVVyVyN+IqnZZ3xuRXwOg21mJlaETlggfnCFm6raEVgLyJNmV61poncH2wV/9aXtW/nFey/VbeIksnPgaxOMp+fmD6PStXv+X3g1xddQBmusUtf9Q0PmodNg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785514794; c=relaxed/simple;
	bh=8Oq1JKZ+6aISjMBfW/rB+bCdiIclZbkZhtUTs+Enj9E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ux43L1TtORUx08nX/ejQBogEcpeEPwHYoRbX/IOaXTN5gYX0/6+AxUBf4w4hpPX/qQrDo8xAcbOT3IQrvOxErNGtQaMzXmbO7bAAj2DMzt7L/Q7MJjQHROoIv+AGx4vzVLTSs0DZe+jVJYfKM0GUg+gyElbSqSLL9FQEDVcCR44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Y9mo1MSS; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Y9mo1MSS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1785514773;
	bh=8Oq1JKZ+6aISjMBfW/rB+bCdiIclZbkZhtUTs+Enj9E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Y9mo1MSSugUDTQ7PYBx1WjuXhx5EsAdDS9RCFSO+TcQkTsD7kaDAorFb/idNuTTqT
	 U5Cshp4VcWU/CvEndyCPYEHpth0a5w8p+CffpAVvJXhFpqEIr0BeFfZJKRHWANpxiN
	 IekxEFY4dpNbJ53B6YtAwvTGGeIriDSi2fdiJouNZlH8/opyk2EXajafw5FKnS/Saa
	 B7AhaDRlplu5gwR+92ObMQY2YB3sGtrauPrXddbqgjX5Patak82VOf5+/pAREbypKY
	 JTmmPUAFyYZA3UFRKz1ljTOErR2rJ0sD7aodIIyNoG6KEsq29lB/qQbOL4EdGWLluF
	 a4cM28tR/16tg==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7306517E095A;
	Fri, 31 Jul 2026 18:19:33 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Fri, 31 Jul 2026 19:19:33 +0300
Subject: [PATCH v10 26/69] drm/bridge: dw-hdmi-qp: Remove unused workqueue
 include and define
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-dw-hdmi-qp-scramb-v10-26-294364b2cf15@collabora.com>
References: <20260731-dw-hdmi-qp-scramb-v10-0-294364b2cf15@collabora.com>
In-Reply-To: <20260731-dw-hdmi-qp-scramb-v10-0-294364b2cf15@collabora.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Chen-Yu Tsai <wens@kernel.org>, Samuel Holland <samuel@sholland.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, Algea Cao <algea.cao@rock-chips.com>, 
 Daniel Stone <daniels@collabora.com>, Liu Ying <victor.liu@nxp.com>, 
 Phong LE <ple@baylibre.com>
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-rockchip@lists.infradead.org
X-Mailer: b4 0.15.2

linux/workqueue.h is no longer needed, and SCRAMB_POLL_DELAY_MS is
unused.

Remove them.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
index a0613f0d2ebc..246c4161e627 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
@@ -15,7 +15,6 @@
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/of.h>
-#include <linux/workqueue.h>
 
 #include <drm/bridge/dw_hdmi_qp.h>
 #include <drm/display/drm_hdmi_helper.h>
@@ -38,8 +37,6 @@
 #define DDC_CI_ADDR		0x37
 #define DDC_SEGMENT_ADDR	0x30
 
-#define SCRAMB_POLL_DELAY_MS	3000
-
 /*
  * Unless otherwise noted, entries in this table are 100% optimization.
  * Values can be obtained from dw_hdmi_qp_compute_n() but that function is

-- 
2.55.0

