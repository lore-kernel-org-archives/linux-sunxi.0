Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C34DB194A6C;
	Fri, 20 Mar 2026 16:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774024047; cv=none; b=Frc0kdLkHkjlBp5ScfNMgf6d6J0Cz4MshnEctr94RgKw1Ia0X7lt/lECmdkm6qQlGerO+qtneMdnhJRou3d/zUIBUT+5FwGk0Hom+T7TJup34a44ZilRmxnLLQrS6KA2Mxi8kJE1rrYCguqW3axZWSQr7OVeJ2RkBPXnXn5YU/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774024047; c=relaxed/simple;
	bh=tVGzG2OoAve6wdaEm6yQngdh47mMTYpnqYs26HoJiNs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=JkuOPiHGXTnSTODPSbPPML6KL0w6/D0C0UBVTtYOZgTDPWcmVeAmw2psexkMyCvWa1x1e7jisQQsHTJ0ioOx5R/2SrfhpfXw33jl1Io3Di6d7COC7PqHQqvmNNcNc8MkZJMIQ8D9kmJO7U6eP04tQ6y7qxcD762xpG6o11vERZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lqm+YStX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lqm+YStX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D21B9C4CEF7;
	Fri, 20 Mar 2026 16:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774024047;
	bh=tVGzG2OoAve6wdaEm6yQngdh47mMTYpnqYs26HoJiNs=;
	h=From:Subject:Date:To:Cc:From;
	b=lqm+YStX5mvlt9/t3+JcPdjEZF9aZVQbBV98Nbb4Z1n/8nd/dUIwZ5L+iuTF2Zz9v
	 L18yH8q16XltXwTEvnjJPLgUAQ2Lvm1hqjJkCM6HE7cSLsu4RmDYA96eZUFUh+WFHQ
	 Ku6EHuDAfr6LcLOND7f2hr33dT7PGfRiVHmvZatzstK14iDXEYFioEKZT2tyjx7Ior
	 fUJTD6izzSi/AZy7ebw9aqjqJufLtX4ZR0a0C8Pi52o1o4Vl08v0+tFBbjGbc/eTRu
	 gnJdmEQqm0jOyVHnvfMZB/tnHD7/GS9hQwPeUKpjriN38MgcIMT8iVtGjD6PBHMeUz
	 RJj5P/G5C5AHQ==
From: Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v2 00/20] drm/atomic: Rework initial state allocation
Date: Fri, 20 Mar 2026 17:27:07 +0100
Message-Id: <20260320-drm-mode-config-init-v2-0-c63f1134e76c@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32PsW7DMAxEf8XgXBaSHFepp/xHkUG2aYdtLaWUK
 qQI/O+VlaVTJ+JI8N3dHSIJU4S+uYNQ5sjBF2GeGhgvzi+EPBUNRpkX1WqFk6y4holwDH7mBdl
 zQk167sxgD92koLxehWa+Vezb+aGFvr4LPT2WMLi4I9aVU99UJscRPd0S7lao2jLhb4oSSplOK
 3WsGa7C2SXCMLyjUKSEjjQZe9DKWNfnDnbjC8cU5KfWy7o6/98kaywXsu2rHY+kx/n0QeLp8zn
 IAudt234BvXY1zjIBAAA=
X-Change-ID: 20260310-drm-mode-config-init-1e1f52b745d0
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Jyri Sarha <jyri.sarha@iki.fi>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Simon Ser <contact@emersion.fr>, Harry Wentland <harry.wentland@amd.com>, 
 Melissa Wen <mwen@igalia.com>, Sebastian Wick <sebastian.wick@redhat.com>, 
 Alex Hung <alex.hung@amd.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, Chen-Yu Tsai <wens@kernel.org>, 
 Samuel Holland <samuel@sholland.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Daniel Stone <daniels@collabora.com>, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 Maxime Ripard <mripard@kernel.org>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4691; i=mripard@kernel.org;
 h=from:subject:message-id; bh=tVGzG2OoAve6wdaEm6yQngdh47mMTYpnqYs26HoJiNs=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDJl7S5PvXGyV/PqC5WJcaIH+/K4C7WX5y4odH2/+/a4qc
 2Wl/Oz2jqksDMKcDLJiiixPZMJOL29fXOVgv/IHzBxWJpAhDFycAjCRmZaMdbYqLyv/yF1oPtwl
 of93y4yavyuXrxMSTq56Z3OwdJno2YpVIrIWqt7HTt1iVQ5vnbeRl7Hh+aWuo3IuK0rCXjJUv82
 ReWqjGlvrMWfmpOMp9h015YvU+iK93hl5FPt4Fm/+dU/v9DMA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

Hi,

This series started from my work on the hardware state readout[1], and
more specifically a discussion with Thomas[2].

This series expands the work that has been merged recently to make
drm_private_obj and drm_private_state allocation a bit more consistent
and ended up creating a new atomic_create_state callback to allocate a
new state with no side effect.

The first patches are a documentation of the existing behaviour and some
random cleanups.

Then, we add the new atomic_create_state callback to every other DRM
object. Next, we leverage those new callbacks to create a new helper,
drm_mode_config_create_state() to create the initial state for all the
objects of a driver.

Finally, we hook that new helper in drm_dev_register and start
converting a few drivers.

This was tested on a TI SK-AM62, with the tidss driver.

Let me know what you think,
Maxime

1: https://lore.kernel.org/dri-devel/20250902-drm-state-readout-v1-0-14ad5315da3f@kernel.org/
2: https://lore.kernel.org/dri-devel/5920ffe5-b6b1-484b-b320-332b9eb9db82@suse.de/

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
Changes in v2:
- Change the _state_reset function names to _state_init
- Change the colorop too
- Various doc improvements
- Link to v1: https://lore.kernel.org/r/20260310-drm-mode-config-init-v1-0-de7397c8e1cf@kernel.org

---
Maxime Ripard (20):
      drm/colorop: Fix typos in the doc
      drm/atomic: Drop drm_private_state.obj assignment from create_state
      drm/mode-config: Mention drm_mode_config_reset() culprits
      drm/colorop: Rename __drm_colorop_state_reset()
      drm/colorop: Create drm_atomic_helper_colorop_create_state()
      drm/atomic-state-helper: Fix __drm_atomic_helper_plane_reset() doc typo
      drm/atomic-state-helper: Rename __drm_atomic_helper_plane_state_reset()
      drm/plane: Add new atomic_create_state callback
      drm/atomic-state-helper: Rename __drm_atomic_helper_crtc_state_reset()
      drm/crtc: Add new atomic_create_state callback
      drm/atomic-state-helper: Rename __drm_atomic_helper_connector_state_reset()
      drm/hdmi: Rename __drm_atomic_helper_connector_hdmi_reset()
      drm/connector: Add new atomic_create_state callback
      drm/mode-config: Create drm_mode_config_create_state()
      drm/drv: Call drm_mode_config_create_state() by default
      drm/atomic: Drop private obj state allocation
      drm/drv: Drop drm_mode_config_reset() from our skeleton
      drm/tidss: Drop call to drm_mode_config_reset at probe time
      drm/tidss: Convert to atomic_create_state
      drm/bridge_connector: Convert to atomic_create_state

 drivers/gpu/drm/display/drm_bridge_connector.c     |  17 ++-
 drivers/gpu/drm/display/drm_hdmi_state_helper.c    |  14 +-
 drivers/gpu/drm/drm_atomic.c                       |  19 +--
 drivers/gpu/drm/drm_atomic_state_helper.c          | 170 ++++++++++++++++++---
 drivers/gpu/drm/drm_colorop.c                      |  41 +++--
 drivers/gpu/drm/drm_drv.c                          |   6 +-
 drivers/gpu/drm/drm_mode_config.c                  | 154 ++++++++++++++++++-
 drivers/gpu/drm/i915/display/intel_crtc.c          |   2 +-
 drivers/gpu/drm/i915/display/intel_plane.c         |   2 +-
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c             |   2 +-
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c |   2 +-
 drivers/gpu/drm/tidss/tidss_crtc.c                 |  17 +--
 drivers/gpu/drm/tidss/tidss_drv.c                  |   2 -
 drivers/gpu/drm/tidss/tidss_kms.c                  |   2 -
 drivers/gpu/drm/tidss/tidss_plane.c                |   2 +-
 drivers/gpu/drm/vc4/vc4_hdmi.c                     |   2 +-
 include/drm/display/drm_hdmi_state_helper.h        |   4 +-
 include/drm/drm_atomic_state_helper.h              |  18 ++-
 include/drm/drm_colorop.h                          |   2 +
 include/drm/drm_connector.h                        |  13 ++
 include/drm/drm_crtc.h                             |  13 ++
 include/drm/drm_mode_config.h                      |   1 +
 include/drm/drm_plane.h                            |  13 ++
 23 files changed, 441 insertions(+), 77 deletions(-)
---
base-commit: cd5c40f745f10f082f75520ebc9deae3ea37b185
change-id: 20260310-drm-mode-config-init-1e1f52b745d0
prerequisite-change-id: 20251008-drm-private-obj-reset-ae1e2741027a:v5
prerequisite-patch-id: 9684f0ca4b16455c1340409561e8fb32f98b327a
prerequisite-patch-id: e177eb92b269436a94d7ef603d44436799be7469
prerequisite-patch-id: fef6d20ab33358c1db6cd9d21aa8ec0990cae758
prerequisite-patch-id: 2dcc96d43f34d8f6237829ed29d0087c092954d1

Best regards,
-- 
Maxime Ripard <mripard@kernel.org>

