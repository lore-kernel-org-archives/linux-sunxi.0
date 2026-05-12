Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E75003B440F;
	Tue, 12 May 2026 13:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778591223; cv=none; b=uEF6RFwa25FJsBbhiS3W355qgALqXZeEc96biuIoX61+FWkaRyy7D/omFrxeEHSlch4Za8xup9Vd0Qt3ShtVLDoODLvC1w+PW14J3NyVMnYMhXOI7hpBtf18TXmyTT9RUeEQb8deTk40M1MTNRdbI4a2sPGRmc5jZHnnnYZnZtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778591223; c=relaxed/simple;
	bh=FGCqhfXKq37ObBfvHzfst4BF+DfJNKqHOHC/ClHMucs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ClTc5Mh7svNedrbUWsGARUdFz4+q1AtTMQIO6BPvvYzNbtCmplTUFsZ48cGRWTh7B4C8vMXNFnsrwUIv6S/xxFjXFzmNed3um/4NleqXbcsAcpNrtHLbbv8LT6yqlCdASxJAHFyvExGG/VN2XGbrEFlhwR2Nzvl6ylJPZUaWWYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cMluvZJR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cMluvZJR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3052AC4AF0B;
	Tue, 12 May 2026 13:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778591222;
	bh=FGCqhfXKq37ObBfvHzfst4BF+DfJNKqHOHC/ClHMucs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=cMluvZJRqw7j9BxTGDPezyQENd0Kcq2mAJEnXyR41wG1HhIjQa1f6HmEpu2xoDlDL
	 0W1xcmmrnymiPFg+w3tibqK/K3yk1n7N0zak+jzmoXxtY+c/H/IPmCvLChKDD9YAWd
	 XiY04umPT4MHhionGKv+3y3btuQ3Wb6KPr/vJ9mCltYiC6eulmdKN5Bhj6eBtiFP1s
	 xLKE0Lc0jfAEE4BlGQygTMeFRsqZIEV8EVTlycoDwCvzjQObj1+lN1POAAQt+jjc7U
	 OYzYgoPBFGlPhHY3LfdTXmBiA7B/S4wh9XwqkSmJ8B/w8NmSnZenlffWEJxMJmeiVF
	 Fac4Ox/qxUpzg==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 12 May 2026 15:06:15 +0200
Subject: [PATCH v4 17/20] drm/drv: Switch skeleton to
 drm_mode_config_create_initial_state()
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-drm-mode-config-init-v4-17-591dfdcc1bf9@kernel.org>
References: <20260512-drm-mode-config-init-v4-0-591dfdcc1bf9@kernel.org>
In-Reply-To: <20260512-drm-mode-config-init-v4-0-591dfdcc1bf9@kernel.org>
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
 h=from:subject:message-id; bh=FGCqhfXKq37ObBfvHzfst4BF+DfJNKqHOHC/ClHMucs=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFnMqofuSnH4C1QI7P7Pe/frixR7k+tPxG2mG3y1aov8v
 Ve32u9gx1QWBmFOBlkxRZYnMmGnl7cvrnKwX/kDZg4rE8gQBi5OAZjIq1TGhtk6URtE7YuTHtyd
 e/XMqVczbX9fMRabsvNJZVtMny/X9J4274/K19eIZb6qPNSyVvXvY8aGOSKz8n8KNiW9/3Xu9zb
 WVPvXXw/87ZefXMPSs6hu79bpntZyf/UVp17/FbzQ3fXLRpnvAA==
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
2.54.0

