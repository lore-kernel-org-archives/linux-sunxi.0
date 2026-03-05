Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09C1A79DA;
	Thu,  5 Mar 2026 09:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772701504; cv=none; b=XAm5/30Je8eOJEBNirFXp5uasby8O8tTU6LPyEKkbgSxMrxnpPLN98kMbEQ7cKZu3tpzMvptcK91h5Fm16EXPAYpm4Hvy6E6vUV2TclWyZ3Ze+iyyE4rW1t7aICKG2mpFyiqZt02HJeJgnv+448X1w2yKAA5hgyiW4zeAi1DVlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772701504; c=relaxed/simple;
	bh=CCLpEYvlxoqg400L58JRWG0E8HGphV4/FeLFDSKOkYA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=dOlKHTtDVWBfV+eOkwRpGNQcp6bbosN9Keu2nTMRNBTEW00V5zNQnabDMK1FZBLexCAup/aLkqlXM5d4d70tFXc8ybqGChIyJjTBgVVkqcGKRXsE9SohxAkcozb1PKbXD10F3PFgD0GexA0otMB7Ed+AF8cWBQ8Fjk3hR0sxOUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bc/kGKJZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bc/kGKJZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B124C116C6;
	Thu,  5 Mar 2026 09:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772701503;
	bh=CCLpEYvlxoqg400L58JRWG0E8HGphV4/FeLFDSKOkYA=;
	h=From:Subject:Date:To:Cc:From;
	b=bc/kGKJZ0ibUi/NN9IxRD2uOMUgbhElzEWhdq7Y4QhXet3eELFJnQjV7FVnQcH9cu
	 Yig89dkNqgJewqPYmcYNRf2tGAJvH2Mh6uK3W28q9jIAnDQA9Qijxu1F0HYL8foRQd
	 V0qtN0rCewp335lvhThdcbZLjkDeqndIh2EcCt8tUq8NLzoCT/sNAAVjYfWlc0zPae
	 aNElAxT+P+IL2t319cj6xl6pm9VqgMqldnBbyZu36RxDrMa2l2MfjBzpX17heUJbk0
	 5WI0FB/Qn3w8HA14syv87Cuzu90uvLEqzwWQng/gA8q0MUQcBTgbgfZjAnLlnEiHtJ
	 L0VGn08pirZrA==
From: Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v3 00/14] drm: Create drm_output_color_format enum
Date: Thu, 05 Mar 2026 10:04:52 +0100
Message-Id: <20260305-drm-rework-color-formats-v3-0-f3935f6db579@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/43NzQ6CMAzA8VchO1vDCgH05HsYD2MrsPAx05GpI
 by7g5NejL39m/TXRXhiS16ck0UwBeutm2Jkh0ToTk0tgTWxBaZYpIg5GB6B6eG4B+0Gx9A4HtX
 soUKj48hMSyni+Z2psc+dvt5id9bPjl/7pyC37R9okJBCTbUuiyLNlVGXnnii4ei4FZsa8FMqf
 0gYpao2WFaEqjmZL2ld1zdtajFPCwEAAA==
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
 linux-sunxi@lists.linux.dev, Jani Nikula <jani.nikula@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3940; i=mripard@kernel.org;
 h=from:subject:message-id; bh=CCLpEYvlxoqg400L58JRWG0E8HGphV4/FeLFDSKOkYA=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDJkr3c1+T9owYXYw97NTTTkuk/c0eNgsWBrI47H5gpzlX
 0nbLebvOqayMAhzMsiKKbI8kQk7vbx9cZWD/cofMHNYmUCGMHBxCsBEkl4yNmxgXRFs7MjPe+za
 5SOvg3iCL7rHCLoY7bKNepXpGDhJrrl9gn/gfcc5XfennZzdWLNfm7HO8kFu1j3mpedmvJQ67C9
 guOHCImWNNP1X3uZXo4MFvvPfLfl96dV9lxvOczaYLtTLF0gDAA==
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
Changes in v3:
- Update more documentation
- Rebase on drm-misc-next-2026-03-05
- Link to v2: https://lore.kernel.org/r/20260227-drm-rework-color-formats-v2-0-8bd278e2af9d@kernel.org

Changes in v2:
- Add missing conversion from HDMI_COLORSPACE to DRM_OUTPUT_COLOR
- Do an enum forward declaration instead of including a header
- Fix typos in doc
- Collect tags
- Rebase on drm-misc-next-2026-02-26
- Link to v1: https://lore.kernel.org/r/20260224-drm-rework-color-formats-v1-0-bebc76604ada@kernel.org

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
 drivers/gpu/drm/display/drm_bridge_connector.c     |   4 +-
 drivers/gpu/drm/display/drm_hdmi_helper.c          |   7 +-
 drivers/gpu/drm/display/drm_hdmi_state_helper.c    |  60 ++++---
 drivers/gpu/drm/drm_bridge.c                       |   2 +-
 drivers/gpu/drm/drm_connector.c                    |  16 +-
 drivers/gpu/drm/drm_edid.c                         |  18 +-
 drivers/gpu/drm/mediatek/mtk_dp.c                  |   4 +-
 drivers/gpu/drm/mediatek/mtk_hdmi_v2.c             |   8 +-
 drivers/gpu/drm/rockchip/analogix_dp-rockchip.c    |   4 +-
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c             |   2 +-
 drivers/gpu/drm/tests/drm_connector_test.c         |  80 ++++-----
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 182 ++++++++++-----------
 drivers/gpu/drm/vc4/vc4_hdmi.c                     |  18 +-
 drivers/gpu/drm/vc4/vc4_hdmi.h                     |   2 +-
 include/drm/bridge/dw_hdmi_qp.h                    |   2 +-
 include/drm/display/drm_hdmi_helper.h              |   3 +-
 include/drm/drm_bridge.h                           |   5 +-
 include/drm/drm_connector.h                        |  48 ++++--
 31 files changed, 334 insertions(+), 285 deletions(-)
---
base-commit: d2e20c8951e4bb5f4a828aed39813599980353b6
change-id: 20260224-drm-rework-color-formats-82dcccc13c11

Best regards,
-- 
Maxime Ripard <mripard@kernel.org>

