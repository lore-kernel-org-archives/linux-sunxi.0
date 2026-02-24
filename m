Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 670FCE555;
	Tue, 24 Feb 2026 10:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771930732; cv=none; b=bEKqwwuYwDp6ogiV0UJiKcV31cceJTpMxtsGoCVR3hanLtGbD713WZEIDw6qvdWs+g6WzhRQ2Q6wJY7Ld3NLZrsaHbSzE/GV0joPUiHmIeg7V2f06A5oInxdmFYr9YW/GSSeBShqYLGNwWpu1YaJ0xyRwrybgWW4WYxCWLBP23E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771930732; c=relaxed/simple;
	bh=4lUO/V6PMTwBVuKtBzHhWs/9Z6o8abbgH7ftoV2jBig=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=XMVpVqMqJhlOn240fmGFLX75h48d8AbQPYYJ43laWV9pn2JgkRnuG/ovKyiWFCeeQYmM++JedBnOpZEaCEKOp5J1nH4N5JZP9Y5rOTZBlWCNC6AK6g+uFMjmQE+QOvCcy9/lmM8JLNqeQjHhsjS5dm/C8blAnwjmw810SAnfM1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mq5Eemht; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mq5Eemht"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BDBEC116D0;
	Tue, 24 Feb 2026 10:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771930732;
	bh=4lUO/V6PMTwBVuKtBzHhWs/9Z6o8abbgH7ftoV2jBig=;
	h=From:Subject:Date:To:Cc:From;
	b=Mq5EemhtxP4fdcnHfwI6OPiBN1gV0ecp0xd5f2KaC09It8FK32pITZ1xHILSp51C6
	 YSaWpuQYY6HhCHr1MPzfOb6w9UXIbx4/Z35HAq/g8gK/kPb1TfUj+eIw5kfWpIksn8
	 T+ataYqh5wLl+NMyxJ45rRvqFJe0KXBGpoGPDbatkTon3oE5/9faLHnIG2/j9VaGct
	 /GIasKVO33Y2yrnXXY1DM6fxhSl/7lLU9IkFD+vdGqLWsAP664+xa4qsoCAcEgih6h
	 SATWacBLav7lvkNRDE99gvw4oXTI1TRFqiO6PKk3OW1BzMuQyKvHX8vRQWb47dGt36
	 Krdz57DzbwK1g==
From: Maxime Ripard <mripard@kernel.org>
Subject: [PATCH 00/14] drm: Create drm_output_color_format enum
Date: Tue, 24 Feb 2026 11:58:39 +0100
Message-Id: <20260224-drm-rework-color-formats-v1-0-bebc76604ada@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MQQqDMBAAvxL23IVkW0T6ldKDJKsummzZFBXEv
 zd0bnOYOaGyCVd4uhOMN6mipUm4OYjzUCZGSc2BPHWe6IHJMhrvagtGXdVwVMvDt2JPKTbCPYY
 ALf8Yj3L816/3df0AC+cZM2oAAAA=
X-Change-ID: 20260224-drm-rework-color-formats-82dcccc13c11
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <siqueira@igalia.com>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Andy Yan <andy.yan@rock-chips.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Liu Ying <victor.liu@nxp.com>, Chen-Yu Tsai <wens@kernel.org>, 
 Samuel Holland <samuel@sholland.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 amd-gfx@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-sunxi@lists.linux.dev
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3233; i=mripard@kernel.org;
 h=from:subject:message-id; bh=4lUO/V6PMTwBVuKtBzHhWs/9Z6o8abbgH7ftoV2jBig=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDJlzW5JkRFb27W20sL9ZF2ngdULgz41fK/Yvd8qrkaw/8
 eaZh29Ax1QWBmFOBlkxRZYnMmGnl7cvrnKwX/kDZg4rE8gQBi5OAZhIqh9jQ2/6Z9UFAqost5nu
 N/4wnZ62KYzp5+s9bfm8Jmu94jlEP8TtY5P/ZWVVkj5r4i2j7G3ejA0vX/zKdV75/mUMT+LBOP0
 tHm9Lb70MZuetVWm3P+7OwqJtfHEhY0/xhXWiMW9bZGyiVgMA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

Hi,

This series creates an enum to represent the output color format as an
enum instead of a bitmask, and consolidate the HDMI helpers to use the
new enum.

This should make Nicolas' work easier.

It has been build tested, and passes kunit tests.

Let me know what you think,
Maxime

---
Maxime Ripard (14):
      drm/connector: Introduce drm_output_color_format enum
      drm/edid: Convert to drm_output_color_format enum
      drm/display: hdmi: Convert to drm_output_color_format
      drm/amdgpu: display: Convert to drm_output_color_format
      drm/bridge: adv7511: Convert to drm_output_color_format
      drm/bridge: analogix: Convert to drm_output_color_format
      drm/bridge: cadence: Convert to drm_output_color_format
      drm/bridge: synopsys: dw-dp: Convert to drm_output_color_format
      drm/bridge: synopsys: dw-hdmi: Convert to drm_output_color_format
      drm/arm: komeda: Convert to drm_output_color_format
      drm/mediatek: dp: Convert to drm_output_color_format
      drm/rockchip: analogix: Convert to drm_output_color_format
      drm/connector: Remove DRM_COLOR_FORMAT defines
      drm/display: hdmi: Use drm_output_color_format instead of hdmi_colorspace

 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |   4 +-
 .../gpu/drm/arm/display/komeda/d71/d71_component.c |  14 +-
 drivers/gpu/drm/arm/display/komeda/komeda_crtc.c   |   2 +-
 .../gpu/drm/arm/display/komeda/komeda_pipeline.h   |   5 +-
 .../drm/arm/display/komeda/komeda_pipeline_state.c |   2 +-
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c       |   2 +-
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c |   4 +-
 .../gpu/drm/bridge/cadence/cdns-mhdp8546-core.c    |  24 +--
 .../gpu/drm/bridge/cadence/cdns-mhdp8546-core.h    |   2 +-
 drivers/gpu/drm/bridge/inno-hdmi.c                 |   6 +-
 drivers/gpu/drm/bridge/ite-it6263.c                |   2 +-
 drivers/gpu/drm/bridge/synopsys/dw-dp.c            |  71 ++++----
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c          |  16 +-
 drivers/gpu/drm/display/drm_hdmi_helper.c          |   7 +-
 drivers/gpu/drm/display/drm_hdmi_state_helper.c    |  60 ++++---
 drivers/gpu/drm/drm_bridge.c                       |   2 +-
 drivers/gpu/drm/drm_connector.c                    |  14 +-
 drivers/gpu/drm/drm_edid.c                         |  18 +-
 drivers/gpu/drm/mediatek/mtk_dp.c                  |   4 +-
 drivers/gpu/drm/mediatek/mtk_hdmi_v2.c             |   8 +-
 drivers/gpu/drm/rockchip/analogix_dp-rockchip.c    |   4 +-
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c             |   2 +-
 drivers/gpu/drm/tests/drm_connector_test.c         |  80 ++++-----
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 182 ++++++++++-----------
 drivers/gpu/drm/vc4/vc4_hdmi.c                     |  18 +-
 drivers/gpu/drm/vc4/vc4_hdmi.h                     |   2 +-
 include/drm/display/drm_hdmi_helper.h              |   3 +-
 include/drm/drm_connector.h                        |  46 ++++--
 28 files changed, 326 insertions(+), 278 deletions(-)
---
base-commit: 3a2ffb469faa8240fe87e7d5f3533d14fdcc69f3
change-id: 20260224-drm-rework-color-formats-82dcccc13c11

Best regards,
-- 
Maxime Ripard <mripard@kernel.org>

