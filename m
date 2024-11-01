Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D1C6EEC3
	for <linux-sunxi@lists.linux.dev>; Fri,  1 Nov 2024 00:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730420716; cv=none; b=VH8jVyOAi5bVYSuKuUTZUShVdtA+dePfzIU3xyNm1/pXY+wkNyQoCk/J9q68NVwaRNSCouED8/7hItec5BNEaghgvHxEVxULLJaoo6yC6nU4HLayr50AP9ApYk15PqjOrgn1fAFX+o3ipso4xXKmJZbKlcACtCksk563df4gvHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730420716; c=relaxed/simple;
	bh=2jBD0sl9KT2Qp/EDHaop9tjjGL1eeuSLdTvEobSlC2o=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=kBYFYkBEYDS8h7O4iUjRc68HveIF1jR6mtlxphWvm+YiFvTzhxlaOsvOC25CI+brv59jn6ci++0gU4EGu6uqqhXE6tFFTv9z2XWA5xdRt8pNMmGOXRfCjP0sZGGTkMushiA/GXm1RV5RQTVngyZO2Huvt+QC7bpjRzAR5yUrD+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SaZM5kvm; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SaZM5kvm"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-539f72c8fc1so2460954e87.1
        for <linux-sunxi@lists.linux.dev>; Thu, 31 Oct 2024 17:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730420708; x=1731025508; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LPWl0EhL6KI0Pyg9VIPJdMDq/EwgacWWrQ4ao+PcFsU=;
        b=SaZM5kvmSoQLcXHSHlbQTFLjmxR7Z3gY1hf2BFR2QejC8LglZJposawPDGUO4l/59r
         e2mdyfGg3762Bv+8AreWlm7T2CGP6dF7UOzRla4HFE9yqsf/Ec+FNP/nZQvE4rrnwf3a
         fBWCLi/FSUAxicNCgeTcbB+UDZLrplKb836w7j46mVLr0hkRPOd3jblASK51HnJdQeK1
         DGYbjDeHoCEm89hxwwXy30aqVzUyO9VCp07QU1j/rDQwT04hFF/meLSmcsPnsL9xN37T
         rHbylTovIeDb0UU4kjBm3sbJATP0J0ibAb5DJ7SRnXxA92tlf1mKAAXfLicfZA8A7QT/
         O2zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730420708; x=1731025508;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LPWl0EhL6KI0Pyg9VIPJdMDq/EwgacWWrQ4ao+PcFsU=;
        b=BzVelQAW9jBbovNUeNwKq5mpboCA434bi/oholtNb2MRKv5c7Y+N1K+TGLPDn2BC5a
         wRrX0xJjcY3suuxanI7ey0qf8S9EHPCQg0MGkvtYZNG0p7OvyuJcpTnqKhEz69u5JMoB
         3e4spaElV9JCllzQeXksJRgiFJ619p0zi7cx3p348/5SajlrvF9e221MEFuY6f7UrTpT
         avrBueIh+sr1lVKFMdRAtZpCN0DtG1+/FdOrUnESZtf0fDuGsNCR+o8e1e2uZUBHVYrC
         QccjxQDERAqaP3q6jflnCE+60MnX8zQWSdVTgBFm5feDUYy9QhRXi1YZ926w/ZcuY+l6
         0rLg==
X-Forwarded-Encrypted: i=1; AJvYcCUaXZT2LzJqxECn3ZTVLxLnEQc84X2J9k1dLnL8RvVqU3LJ/bC9PiEJVngI7Ghm8ZK300fKO/f9pUIzvQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyYZhrSzsCC1bop2UuBlYH7yqUZM04lPuQ/TrhcgwkZbb5oy9/U
	DjKhKgMvIpTP2+IJ14O4ZAKgPsBtaWCbSK3BbOhAl60WZMSXzIauGn/+1NFpz88=
X-Google-Smtp-Source: AGHT+IGzQdvR9n9N5nsIKtK9Qhx1FHQRUlJs7sw78abE6mZx2jxTi9cQ9DuYKZQZysqMNCy1gebATA==
X-Received: by 2002:a05:6512:130f:b0:539:fbf7:38d1 with SMTP id 2adb3069b0e04-53b7ecd5970mr5312335e87.2.1730420708098;
        Thu, 31 Oct 2024 17:25:08 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53c7bcce489sm371153e87.127.2024.10.31.17.25.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 17:25:07 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v2 0/6] drm/display: hdmi: add
 drm_hdmi_connector_mode_valid()
Date: Fri, 01 Nov 2024 02:25:03 +0200
Message-Id: <20241101-hdmi-mode-valid-v2-0-a6478fd20fa6@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAN8fJGcC/3WNQQ7CIBBFr9LM2jFAUNGV9zBdEJiWSVowYIim4
 e5i9y7fS/77GxTKTAVuwwaZKhdOsYM6DOCCjTMh+86ghNJSSIPBr4xr8oTVLuzRWnJaK3MS0kF
 fPTNN/N6Lj7Fz4PJK+bMfVPmz/1tVosAz6aslbYScLveFo83pmPIMY2vtCz+UD4OvAAAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1994;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=2jBD0sl9KT2Qp/EDHaop9tjjGL1eeuSLdTvEobSlC2o=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnJB/hvEH2fbu10syN0kMJjljMx5W/ESzQUVOsw
 TIFkNSzP9aJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZyQf4QAKCRCLPIo+Aiko
 1aH1B/wOZhTNhYOTk6Qqu7BncZn5jLCtS2Yc3ZKRtmLY2SPPxUlQSH3BJufcG08aT9tcaRJtvzH
 dLiSvu7kKRrptx8XXTTAowIe+PjKHNcvJt6f/DS+Xq09ujGERYNsYJKUmENNauW7tCtInm5iWTi
 FP0Pg2y/9Ekcqir7E+h+S+AvNfXY2PP8cS9krf3a7/mfkI9ZQ08L+YSu7emXZzSvoK8lFP2Xb8q
 zKLnQq9TISsrTJHx/nO3Ex/qPCXDdG0yzSTjb/7JmE5it/eN5z2GMuhJxiw7KOzsWYVeKpTf13D
 dJTT2kruCf1H+YrwsP3YdsqRpFJvq9psMttgI+8Wl1fHfwEO
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Several HDMI drivers have common code pice in the .mode_valid function
that validates RGB / 8bpc rate using the TMDS char rate callbacks.

Move this code piece to the common helper and remove the need to perform
this check manually. In case of DRM_BRIDGE_OP_HDMI bridges, they can
skip the check in favour of performing it in drm_bridge_connector.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v2:
- Switched drm_hdmi_connector_mode_valid() to use common helper
  (ex-hdmi_clock_valid()) (Maxime)
- Added simple unit tests for drm_hdmi_connector_mode_valid().
- Link to v1: https://lore.kernel.org/r/20241018-hdmi-mode-valid-v1-0-6e49ae4801f7@linaro.org

---
Dmitry Baryshkov (6):
      drm/display: hdmi: add generic mode_valid helper
      drm/sun4i: use drm_hdmi_connector_mode_valid()
      drm/vc4: use drm_hdmi_connector_mode_valid()
      drm/display: bridge_connector: use drm_bridge_connector_mode_valid()
      drm/bridge: lontium-lt9611: drop TMDS char rate check in mode_valid
      drm/bridge: dw-hdmi-qp: replace mode_valid with tmds_char_rate

 drivers/gpu/drm/bridge/lontium-lt9611.c            |   4 +-
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c       |  12 +-
 drivers/gpu/drm/display/drm_bridge_connector.c     |  16 +-
 drivers/gpu/drm/display/drm_hdmi_helper.c          |  45 ++++++
 drivers/gpu/drm/display/drm_hdmi_helper_internal.h |  11 ++
 drivers/gpu/drm/display/drm_hdmi_state_helper.c    |  26 +---
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c             |  12 +-
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 168 ++++++++++++++++++++-
 drivers/gpu/drm/vc4/vc4_hdmi.c                     |   4 +-
 include/drm/display/drm_hdmi_helper.h              |   4 +
 10 files changed, 252 insertions(+), 50 deletions(-)
---
base-commit: 623b1e4d2eace0958996995f9f88cb659a6f69dd
change-id: 20241018-hdmi-mode-valid-aaec4428501c

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

