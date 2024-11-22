Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66E5518BBA0
	for <linux-sunxi@lists.linux.dev>; Fri, 22 Nov 2024 09:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732266793; cv=none; b=HsQAOkiaGSynzYwHhx2Sf9kRkjhnDea/8U5hA86mzJvubiVjYuevOwxh0EK5O7tXLodg03/dzzLo/ZzmtQy5X+wL55X3XwKsW2jb2N0Owf/0BfQIuZosugA29najhJUv2RJ4TdKPuzIf97m9bJhgbTyPeLIuUlQ24k44eN4Ai8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732266793; c=relaxed/simple;
	bh=dAGoBfBZPrQ28ollGsFDqICLzpx3eGynrKY+liYfcfc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Ds8E6GNof8tnMBcvDr2VToVPM9Iq1l5Mx7oM70IUc2wmXt21HVLUOczJdf17iOrYfG9FkelVjvEtl3Hk36/6tGlf+4+Tr/N44DgDcJTGBDvavJ8mnpOXQ2/xo12fXiLjy52M7e2YpVBGx/iZFIj+eRNGytNZKTCBZJzmtLTkHdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jW7xNwUZ; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jW7xNwUZ"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-539f6e1f756so2050622e87.0
        for <linux-sunxi@lists.linux.dev>; Fri, 22 Nov 2024 01:13:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732266789; x=1732871589; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yPJBOfYSV90IcFVSxfOZG/ZLElTJvS62cOj1dS8TNSc=;
        b=jW7xNwUZoKrpnu5uxcVz0G7j844lsKJecsLCwUZJjqh8WjkwwsGR3V3qw3vgngdbUZ
         uVPaIiVIymenC+Uh8uIEICeVLNyRcoQyW7pQMwWaTa69mkk9RrBBsccpx7Ki7mY80XwH
         SZgJNmIYQA54JiaiZ2XL9P3dwdCw9JMqDmg+soo91eKCSYdUvkvNJEM20QFTDgyXaGIe
         fsMhr9fbbKSsJZIpHhg6j6+TOYKB8n9mHx30lHkoK7K/qKufBn9dBEmwHZRu79BTl3JP
         8eNmWlzsVWRiKVZj5dm2Vt5kri6Cid6ztyftCPckVcbgy9M24s7wI8jj+/sViARB9Ktd
         29WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732266789; x=1732871589;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yPJBOfYSV90IcFVSxfOZG/ZLElTJvS62cOj1dS8TNSc=;
        b=ktEEXusfAaHJleWTXwstdJPqHY41WB+Dq8c5YZ+eFlQZqhml7jivfsX5c2viBoiFsZ
         amwiGfCEfoSXWdoz7A8wefWSEFwJDLeSAqWbPn+q1xvWXTikUhIcbhyS8/LYtxFkUNmb
         TeE4T8XhDs8wio0IOQurfKyvwAerdtX5suWCklhHQTYxHzYVG4DRBxkbZwJNkDysItSh
         n1hz6cUaA4kdovqDhAxbuNayJfaI6Py7u64qNVJC1xmJi33oYye2f2yoSIUTRY4AXl0D
         /NUhgLNAOXHagvVaZVtJE9PH11qmcIfY95hw7Nm7Y9UyussHD16ofJloAby1E1P9vWxe
         +j6w==
X-Forwarded-Encrypted: i=1; AJvYcCUssM+ZwnXtvFnnjQ5KosucdYCjjq4gu4EhOtt3fo7yqfIKmUwtw4Srzg1ADzZ17htbbUekKHHju9rVuQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyzudt8L7DTlYf+bMhItZt9S7TsBExA/p1sRkzsqs2H3cfn4kAA
	b90oVxonROu9XqSauDBY3svpMCGS14L8bK3WQtuuDnJfoXTEKvYx9oG9oBW9uxU=
X-Gm-Gg: ASbGncvGR9dnLY3cQgzZ8szVFnJPWYPoD2FNUxOULLBrrJtq+Cg7vx1S8h6GEFMGtj8
	fyo/0/+b/PYet+rc9BJpuSBU+GAgWCQ/H00lJn3q6ouKTiRInawO9gC95++FtbG8A3HmG3Z8lMw
	H796AJR+ET0ogN+S0BWG3kTp65yjuV7fJFZRmnYbt395VuvdfbT8x1s400cwNQkgJgLnT97YnR1
	jNxHYbgpH4TXELBIrwDRT1TJaWM5L4dQl/+HZ2ak0s36nCLNGPNaiwUdQ==
X-Google-Smtp-Source: AGHT+IGEb5tRInMFtVE9GZficnUTiVO1xCATodroM7GK3ZevvdEIuIB/MI+jMs/pCyFMTD+eeIO8JQ==
X-Received: by 2002:a05:6512:10ca:b0:53d:a9b9:fdc0 with SMTP id 2adb3069b0e04-53dd389d8a1mr1112818e87.31.1732266789361;
        Fri, 22 Nov 2024 01:13:09 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53dd2451386sm299530e87.77.2024.11.22.01.13.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 01:13:08 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v4 00/10] drm/display: hdmi: add
 drm_hdmi_connector_mode_valid()
Date: Fri, 22 Nov 2024 11:12:56 +0200
Message-Id: <20241122-hdmi-mode-valid-v4-0-2fee4a83ab79@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABhLQGcC/3XNTQrCMBCG4auUrI3kr2l05T3ERUim7UDbSCJBK
 b27aTcqxeX7wTwzkwQRIZFzNZMIGROGqYQ6VMT1duqAoi9NBBOKM25o70ekY/BAsx3QU2vBKSV
 Mzbgj5eoeocXnJl5vpXtMjxBf24PM1/W/lTllVIM6WVCG8ba5DDjZGI4hdmTFsvgARdgDogBWq
 8a0XrDW6h0gv4HTHpAFqKUyTkhtWPMLLMvyBlx47n8xAQAA
X-Change-ID: 20241018-hdmi-mode-valid-aaec4428501c
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3023;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=dAGoBfBZPrQ28ollGsFDqICLzpx3eGynrKY+liYfcfc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnQEsh97cY2ewxrd1QdOkVWNxJCVibvExTdRJp9
 9bHLnJ6vOeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ0BLIQAKCRCLPIo+Aiko
 1aIBB/9UOalIiiDyCESbhN5VK1zX78Q2v5Cu6GR9StRIoyHvHhPD2SZblaTT0rK2OUduQIaCzil
 e43PDFRCRm4oTpATivZAvHM+yi203AUBJiwIOMAe3JA+lhIvMk3+ifawcrw9Cl72SEbVds3dBNt
 BIFRNdKbfHdX7wqjMVc2sNYXaGiXlxNEvRrur+Q56Z5uoO+XYx/CdGPi1clyXilpj3fMjPiIs5o
 dtyVnROt60CnOjUDof0ueLHTqnMk2Ydx3ZhtWbgLtC5avyxhU0xLPgjLAqQDjkW3BXf65sD++Ux
 wdtO/dYUJ6BFYYLwt4PattfJC/Uz53ohOyAbm08X1xxiSoWn
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Several HDMI drivers have common code pice in the .mode_valid function
that validates RGB / 8bpc rate using the TMDS char rate callbacks.

Move this code piece to the common helper and remove the need to perform
this check manually. In case of DRM_BRIDGE_OP_HDMI bridges, they can
skip the check in favour of performing it in drm_bridge_connector.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v4:
- Fixed build warning in VC4 driver by adding .mode_valid to
  vc4_hdmi_connector_helper_funcs (LKP)
- Reworked HDMI test helpers (Maxime)
- Expanded test descriptions and comments (Maxime)
- Added new EDID to test info.max_tmds_clock filtering (Maxime)
- Link to v3: https://lore.kernel.org/r/20241109-hdmi-mode-valid-v3-0-5348c2368076@linaro.org

Changes in v3:
- Moved drm_hdmi_connector_mode_valid() to drm_hdmi_state_helper.c
  (Maxime)
- Added commnt next to the preferred = list_first_entry() assignment
  (Maxime)
- Added comments to new tests, describing what is being tested (Maxime)
- Replaced sun4i_hdmi_connector_atomic_check() with
  drm_atomic_helper_connector_hdmi_check() (Maxime)
- Link to v2: https://lore.kernel.org/r/20241101-hdmi-mode-valid-v2-0-a6478fd20fa6@linaro.org

Changes in v2:
- Switched drm_hdmi_connector_mode_valid() to use common helper
  (ex-hdmi_clock_valid()) (Maxime)
- Added simple unit tests for drm_hdmi_connector_mode_valid().
- Link to v1: https://lore.kernel.org/r/20241018-hdmi-mode-valid-v1-0-6e49ae4801f7@linaro.org

---
Dmitry Baryshkov (10):
      drm/tests: hdmi: handle empty modes in find_preferred_mode()
      drm/tests: hdmi: rename connector creation function
      drm/tests: hdmi: return meaningful value from set_connector_edid()
      drm/display: hdmi: add generic mode_valid helper
      drm/sun4i: use drm_hdmi_connector_mode_valid()
      drm/vc4: use drm_hdmi_connector_mode_valid()
      drm/display: bridge_connector: use drm_bridge_connector_mode_valid()
      drm/bridge: lontium-lt9611: drop TMDS char rate check in mode_valid
      drm/bridge: dw-hdmi-qp: replace mode_valid with tmds_char_rate
      drm/sun4i: use drm_atomic_helper_connector_hdmi_check()

 drivers/gpu/drm/bridge/lontium-lt9611.c            |   4 +-
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c       |  12 +-
 drivers/gpu/drm/display/drm_bridge_connector.c     |  16 +-
 drivers/gpu/drm/display/drm_hdmi_state_helper.c    |  21 ++
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c             |  32 +--
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 269 +++++++++++++++++----
 drivers/gpu/drm/tests/drm_kunit_edid.h             | 102 ++++++++
 drivers/gpu/drm/vc4/vc4_hdmi.c                     |   5 +-
 include/drm/display/drm_hdmi_state_helper.h        |   4 +
 9 files changed, 371 insertions(+), 94 deletions(-)
---
base-commit: d80b5c5b9be6b2e1cdeaaeaa8259523b63cae292
change-id: 20241018-hdmi-mode-valid-aaec4428501c

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

