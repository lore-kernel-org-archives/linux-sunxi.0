Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91C0F37B3F4;
	Fri, 24 Apr 2026 10:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777025989; cv=none; b=XMTGSM0OCw+iNVBrbhTdckLdHINDgOOlD98n4rGjEnN5T559vwM2yqjorF8mrs7gH00JswXIErsSf9RXANzJlPZAdavitMo2+2UtCmmRvbEBR/q1YqyQd/93EI6SJPl26jDB+xoTH2zFd9SPJdeqvATStCk48aquDMC0DM2Wqus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777025989; c=relaxed/simple;
	bh=r8iCVvbjhwlTQWPJs/wShGMSU9DSc+CbT8to6voKBbo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JXk8q+dKqE2eaDo8O4sVVo/KelaZl5yLszxdVYCBx+LxniKwoqUBWEOegKT1ibtbedvPlaBpqVKmB3xHO1bOd53UdhyXYnjdhu86MwRsUURuWnKFe+QyBsEMUsHMMqaUgE2MzCOEvelIaMu7IaZ55DYfEFrYBzfyKgREJgpM9VA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CzeJKGyL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CzeJKGyL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99B2FC2BCB5;
	Fri, 24 Apr 2026 10:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777025989;
	bh=r8iCVvbjhwlTQWPJs/wShGMSU9DSc+CbT8to6voKBbo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=CzeJKGyLvp3ygJdwmcdqShuI9sq2JW8uAHYHgS2qnM36/R5O71KrPv/Kp9E2PJat1
	 7bKI/AxkZ4pyeoLV3aLNducPlSArv3WUTBDLZEuNw/7D01pZzvYJlF6ZarCsBpniAa
	 KwkJx5lMFgWOtf6n5ZsXPgWLOeR6lByqp5ajN17ZeO8h7s4vNaMO4uqb18AMQKOCl9
	 55OxcjT/iMNfk0d/OV235Q2CWjo7l13gJO3vmeC4++c9KXaW0ZmKc9W6y5qhrWF37K
	 DafKiNIN5VU9fUoUhYymxmt3R4X6biPL1vjaMGkqXtnBTPoi5gmw7ekGGjsiYRMEfT
	 3jNi4UOg4EHSg==
From: Maxime Ripard <mripard@kernel.org>
Date: Fri, 24 Apr 2026 12:18:57 +0200
Subject: [PATCH v3 17/20] drm/drv: Switch skeleton to
 drm_mode_config_create_initial_state()
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260424-drm-mode-config-init-v3-17-8b68d9db0d8b@kernel.org>
References: <20260424-drm-mode-config-init-v3-0-8b68d9db0d8b@kernel.org>
In-Reply-To: <20260424-drm-mode-config-init-v3-0-8b68d9db0d8b@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=997; i=mripard@kernel.org;
 h=from:subject:message-id; bh=r8iCVvbjhwlTQWPJs/wShGMSU9DSc+CbT8to6voKBbo=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDJmvnSeknyrNYUr5c2HnJdlZ7CEKcZPOMrq8v5mStf2Nw
 aYfy2v3dUxlYRDmZJAVU2R5IhN2enn74ioH+5U/YOawMoEMYeDiFICJeMcy1vB992561CWyULg1
 +/Hr2wnrjVKjVXvMi88VONy8KeeyeUfK1bAfbMtTDivFPKhaWtgpzljNNif92JaKfAnpk/kXJ8x
 KFGaKbozo3fmxxOD3addsnWNParbLzH+xpsWu0nB/XtRWBQUA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The driver skeleton currently recommends calling
drm_mode_config_reset() at probe time to create the initial state.

Now that drm_mode_config_create_initial_state() exists to handle
initial state allocation without hardware side effects, update the
skeleton to recommend it instead.

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
2.53.0

