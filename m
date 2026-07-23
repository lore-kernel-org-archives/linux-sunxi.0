Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D3D2D73B6
	for <linux-sunxi@lists.linux.dev>; Thu, 23 Jul 2026 01:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784770505; cv=none; b=tDAhyDZ2zTpwlV6RPkPdgUlGsfLCs7Pw18lkHGFVG/ajg1Ppzkb7rmDb/U9jL8CyGFAt2kLHzr19rjoNn4aOOyIGu976Tdu9/t4C9tgQ6DemII4O0ouad3vB5bXIQ2DT8P/bJHMSAzmHZwUSySrzu1qr2UJUIDGveajCMKitZv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784770505; c=relaxed/simple;
	bh=D/Mo27GDMqgDFGKu/PHByp3WOMc3rGEVU+1xPyeAtoA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lO9+YCs1r05G+sbTCQYxOTrFnxVQhUhmSxEAL+bRdMI1Xow97geG6oA5sWudJUegwQnc4+tuPrCtUtxA8zFSevAIoKjq3OvPR1ytUAMmhf9EfE0kyJBfn4bDS18EtyxY0KVd1KpK3ATgoLmpSZ3Do6EjA8DKeFf/NRmIYEFxsUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=o876QeRC; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="o876QeRC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784770502;
	bh=D/Mo27GDMqgDFGKu/PHByp3WOMc3rGEVU+1xPyeAtoA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=o876QeRCxbHDF9CSaJHExc43JFcJYJ28pcHKGlcoCIX+XeaAXj7MWg7TDHVq8/0o9
	 Uoi3pMHxnJ2gp+FVqSK/BQPtPP0TtmpvcicVqs2N7nahwxd47w91b/HzQ2lVF3X6Qf
	 koOKswcV+0eQYFYUftQ8Blmp9LCLeFE5uRN4Df6lSjgNq7kWase/dvppRYBnyg6uTM
	 7l0Bls0tthTQmp/etsq13xn8aJPCQnsFXZcuhfr1dseJipd0JNO8Bnc2hkJOzMANv6
	 h7+0JDQc78REYnNGIS4Ub+lAUupqLaRQdQptXKJqq3pFmzLS/ksopwWSXCfnmooSZF
	 zxiSqROySkLZw==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B992B17E062C;
	Thu, 23 Jul 2026 03:35:02 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Thu, 23 Jul 2026 04:34:50 +0300
Subject: [PATCH v9 01/61] video/hdmi: Introduce HDMI version enum
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-dw-hdmi-qp-scramb-v9-1-4fb12ea22ac9@collabora.com>
References: <20260723-dw-hdmi-qp-scramb-v9-0-4fb12ea22ac9@collabora.com>
In-Reply-To: <20260723-dw-hdmi-qp-scramb-v9-0-4fb12ea22ac9@collabora.com>
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
 linux-sunxi@lists.linux.dev, linux-rockchip@lists.infradead.org, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2

Add an enum to represent HDMI specification versions.  This will be used
by upcoming changes to associate HDMI connectors and bridges with a
maximum supported version and to simplify handling of version-dependent
features.

Reviewed-by: Maxime Ripard <mripard@kernel.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 include/linux/hdmi.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/include/linux/hdmi.h b/include/linux/hdmi.h
index 8dab78e1f61b..b80a5ee63bb2 100644
--- a/include/linux/hdmi.h
+++ b/include/linux/hdmi.h
@@ -27,6 +27,18 @@
 #include <linux/types.h>
 #include <linux/device.h>
 
+enum hdmi_version {
+	HDMI_VERSION_UNKNOWN,
+	HDMI_VERSION_1_0,
+	HDMI_VERSION_1_1,
+	HDMI_VERSION_1_2,
+	HDMI_VERSION_1_3,
+	HDMI_VERSION_1_4,
+	HDMI_VERSION_2_0,
+	HDMI_VERSION_2_1,
+	HDMI_VERSION_2_2,
+};
+
 enum hdmi_packet_type {
 	HDMI_PACKET_TYPE_NULL = 0x00,
 	HDMI_PACKET_TYPE_AUDIO_CLOCK_REGEN = 0x01,

-- 
2.55.0

