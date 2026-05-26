Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F9A63FF1D6;
	Tue, 26 May 2026 16:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779814036; cv=none; b=UbIgW62gAqdYDLOR+jv4ixP8ZwsPLrEBhLXegNFTocrgM+iywYAMYWcU98scIIR5zzLt5jFXHMbpNC3mfq1R7gJlp5h2s5MCVmFSKAYVtI9g1irIUiViPqX4jW3Idu9Ai3vGIMKhAS7qoiugNjdipsRjFMhWkVZC2Tb0CpuRX5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779814036; c=relaxed/simple;
	bh=WmauA4ImC2nbcn+CftLv1MhbrNpIe8tkS1j5DBJdNwc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lrbQHiHLAtq95A/2lEUFe8zStIbjObpbBEavv2G9d+lMaotFBymPfNXy+K6XC0qWd7mjZVZ67GxkLM4vCbyhg+P3IzD/Nh8xnnJj0m9jCfpikhc6I+K75LSicN7wDQoMDjSJK3TbizMdIODzHRPszQmhcXwZpKzaBWlHA5TPTMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=onwBKsNk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="onwBKsNk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1479F1F00A3A;
	Tue, 26 May 2026 16:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779814034;
	bh=0Aw+d7eOoT9y0W+BDNuVg38yyPiSFul3zqObROG+6r8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=onwBKsNk4+b8+rbyhlfHWtLPPsTz0QeC5KpIHSiVSs0BuoJo0lwTEQ3f3S8ZTtKQD
	 2wtAzJmi48gcWiUCMm0zZ4ifz1SiRr6whTJGt5dPlx2w2/Zo3fGUdeP/u2FMq/uMHm
	 eZL1KF9dWqNrSaKhvY/62VKnm9W3vfSHY6uaIIR8Tq6LYJlNXw48M7UmBfSFOSVctW
	 zuaK2oJv8MT6yEkmFtT7LvVk5lYEgdY5qHbHohOy5gmt5l8no0S3yZGv+YEfOxF08H
	 patUVvDz6WpCgU8hUuMX6kZ+KgPLh6k21T3oFim274RC6myUtBd7ABYcgxLHi+u4ne
	 JsuAgenHHKR6A==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 26 May 2026 18:46:29 +0200
Subject: [PATCH v6 17/19] drm/drv: Switch skeleton to
 drm_mode_config_create_initial_state()
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-drm-mode-config-init-v6-17-852346394200@kernel.org>
References: <20260526-drm-mode-config-init-v6-0-852346394200@kernel.org>
In-Reply-To: <20260526-drm-mode-config-init-v6-0-852346394200@kernel.org>
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
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1051; i=mripard@kernel.org;
 h=from:subject:message-id; bh=WmauA4ImC2nbcn+CftLv1MhbrNpIe8tkS1j5DBJdNwc=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFmi5+I2NbdunH51V/ibsrfLXpXbPzv6suGfy0mzr4qXX
 r7uyPiq2DGVhUGYk0FWTJHliUzY6eXti6sc7Ff+gJnDygQyhIGLUwAmopPP2PDWuWF28uuirccv
 Nsvctdfh5NxTLOQUekP4zoXMti+vS/Tlxdw37p907/KCp4fXbnX7GsfY8Cplx7SAzf/964+V36r
 ivPZ+0c/ndo++NloY8upZ1zYlG20vaZbg3ly4bbH1a5Fta2wrAQ==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The driver skeleton currently recommends calling
drm_mode_config_reset() at probe time to create the initial state.

Now that drm_mode_config_create_initial_state() exists to handle
initial state allocation without hardware side effects, update the
skeleton to recommend it instead.

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_drv.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 985c283cf59f..f537556b06a8 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -340,11 +340,13 @@ void drm_minor_release(struct drm_minor *minor)
  *
  *		// Further setup, display pipeline etc
  *
  *		platform_set_drvdata(pdev, drm);
  *
- *		drm_mode_config_reset(drm);
+ *		ret = drm_mode_config_create_initial_state(drm);
+ *		if (ret)
+ *			return ret;
  *
  *		ret = drm_dev_register(drm);
  *		if (ret)
  *			return ret;
  *

-- 
2.54.0

