Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A3EF40FD93;
	Fri, 27 Feb 2026 13:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772200796; cv=none; b=GGE22e21qYWXWQWWHZK6LGgWnhhULfu2yoidUo7Kt3x3wyAzAIQ7fm5JOwm0yqtmU5/FFAJXdlYwBR6CK9SG0f5BRwnfyvQ+T+jyL/YDK0dda3S4uPTSv3IzbLPMnI3Zny7yoVni2HuQrzJwdRE0/HFvRRZ0E+KCt7qA9kefl6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772200796; c=relaxed/simple;
	bh=bX9QJj7nm/3ODg83RWxpi2YWivQFXsF3bfJaIfIyKF8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=PZTwgQSz6m2sl9vS0YX60s/IBXXvLIcEvZuph+45XxmR663b6bFcYYLldxDkZJhyMIkAgMLXV0E1Xb40tgMVxcI9pWjttuY/iimYS4YWNSZm9ZInXqpo4ZVR34RLRyke9Q6U8d2exjP9FJ/Z/wph+37kr1ks/y+F9PCdbRha2Rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dApXazeX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dApXazeX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86A2BC19423;
	Fri, 27 Feb 2026 13:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772200796;
	bh=bX9QJj7nm/3ODg83RWxpi2YWivQFXsF3bfJaIfIyKF8=;
	h=From:Subject:Date:To:Cc:From;
	b=dApXazeXUsyUfX1rjtTU7uOQLzGmbIVTH4Uay0lRtlpLseAUbxRwbXDgzrAYfM7rI
	 rytvjxm+0apTIzp6fVWLY9e+VO9YSironaw9iqw5Q+UJQFRAI7xyP4LKGGo4SwdHl0
	 xKdARIUhjXmaJVZilNnpz1aw8NfFWQ6bc5rKtTZunhuESbI6F1hUOc/bX9b7RTNWxa
	 H1Nn/KFfYw7mtl827RuVE8RdoI8hxDjsdopHgmTnnQsUIizEfJxiGGs42NiKCfAks9
	 GwuTjB8t3UYpk/50VV+TSVqeS99/U2tQGfDreCoHYHZGVvZslXnncPuvzGB/2lCJYv
	 F4iueILuH7PUg==
From: Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v2 00/14] drm: Create drm_output_color_format enum
Date: Fri, 27 Feb 2026 14:59:44 +0100
Message-Id: <20260227-drm-rework-color-formats-v2-0-8bd278e2af9d@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42NTQ6CMBCFr0Jm7Zi2EjSuvIdhUdoBGn6GTAlqS
 O9u5QS+3feS970dIkmgCPdiB6EtxMBzBnMqwPV27giDzwxGmUoZU6KXCYVeLAM6HlmwZZnsGvF
 mvMvRF6c15Pki1Ib3oX7WmfsQV5bP8bTpX/uHdNOosKHGXatKldbbx0Ay03hm6aBOKX0BR4NOS
 MEAAAA=
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3689; i=mripard@kernel.org;
 h=from:subject:message-id; bh=bX9QJj7nm/3ODg83RWxpi2YWivQFXsF3bfJaIfIyKF8=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDJkLFwevmjp5q9SF0KnlD/f+0L+bFLkutFDr+brdc6Pmy
 DE9FGoI6ZjKwiDMySArpsjyRCbs9PL2xVUO9it/wMxhZQIZwsDFKQATWWbFWKcRVR7LlrviSdnp
 6Ir/QZ9vBb+Znzljapjk/F3Mstvknui07r/wYl9jtECkwJ4DhsLb0xkbdkk8DEubvWh/m4augYb
 e5gsvji3U1T/l7hd24jBbf9iF1i7BAwoRS5mPBP6M/PLGX/4LAA==
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
 include/drm/bridge/dw_hdmi_qp.h                    |   2 +-
 include/drm/display/drm_hdmi_helper.h              |   3 +-
 include/drm/drm_connector.h                        |  46 ++++--
 30 files changed, 329 insertions(+), 281 deletions(-)
---
base-commit: 2622649ad6cdbb3e77bfafc8c0fe686090b77f70
change-id: 20260224-drm-rework-color-formats-82dcccc13c11

Best regards,
-- 
Maxime Ripard <mripard@kernel.org>

