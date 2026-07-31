Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C56944C4F8
	for <linux-sunxi@lists.linux.dev>; Fri, 31 Jul 2026 16:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785514776; cv=none; b=XMAkx18ttbpZFiiVn45s9mj4OkOgVhpM3UaQeGnWYdUO9scYAdJFeM9R8EM5j34kwQGV/JQaagCHxLDWPuuf5WGUT3/w2JoMCccJcbXsVs4WJZunziIgIuziMcRRTzXV9ZyASfT0OvEr0iz6KJDyRrqcvWLAAYbXPFDXOU9Hz3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785514776; c=relaxed/simple;
	bh=LoKeK7pz3tUS/HI4nQVJBEnI7or53/FZb/3CkVSEbPw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IFrQW01cB707lbV6J6qYG71e1QlEiJzo4E03M5cSfa66vnb5t6E37Ny7o8CViFG6sXT7r43BVoxdFfK61bFVUepl/4HH+o3TsGLSiqC5eVPmDE8Cqiya6m0aphQe+ajh0ZakaZCbaGbhXHJy1u3uRRFRKE1JyPFIh2JoFhdg9wI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=QQM1/ODC; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="QQM1/ODC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1785514756;
	bh=LoKeK7pz3tUS/HI4nQVJBEnI7or53/FZb/3CkVSEbPw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=QQM1/ODCZaPF1EY3Nxc7TDsGlmIpqDCOp1EloFd/Dg0nSRCI8T0Yua4Xa6iFFl0EQ
	 93L0dJXf4MvpSKPTrnZAoSll5FcXHffJWev2kM+iUT1VIky+BM8eqQjKbboK/cBqCD
	 v8jvuh5ULLoPfn4lFhAgNl7UfCwyLP+KTMafOUsQ/RwnfXG09kVG58/P/P8SfV3oIo
	 9Z2r0DVtmbO2ReeYVgWBLAMST73ftdx792z/gqpaqAzHBKjzaDb7hDh7Pnbl/gDVi6
	 krHJpbQkBGyYr5MQlQ+ouHuzD48rdOhbnsZzKc4qyUjQfnlowx83kkaJ2/dk31XZ5J
	 p5w1n8oDumsmg==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 34FF117E0700;
	Fri, 31 Jul 2026 18:19:16 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Fri, 31 Jul 2026 19:19:09 +0300
Subject: [PATCH v10 02/69] drm/connector: hdmi: Handle reset() state
 allocation failure
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-dw-hdmi-qp-scramb-v10-2-294364b2cf15@collabora.com>
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
 linux-sunxi@lists.linux.dev, linux-rockchip@lists.infradead.org, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.15.2

In drmm_connector_hdmi_init(), if the reset callback fails to allocate
memory, e.g. inside drm_atomic_helper_connector_reset(),
connector->state will remain NULL.  This is unconditionally passed to
drm_connector_attach_max_bpc_property(), leading to a NULL pointer
dereference.

Bail out with -ENOMEM if the reset callback leaves connector->state
unset.

Fixes: aadb3e16b8f3 ("drm/connector: hdmi: Add output BPC to the connector state")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260723015306.C94241F000E9@smtp.kernel.org/
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/drm_connector.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 8b4baed060f3..0e39431e85b2 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -628,6 +628,8 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
 		connector->state = state;
 	} else if (connector->funcs->reset) {
 		connector->funcs->reset(connector);
+		if (!connector->state)
+			return -ENOMEM;
 	}
 
 	drm_connector_attach_max_bpc_property(connector, 8, max_bpc);

-- 
2.55.0

