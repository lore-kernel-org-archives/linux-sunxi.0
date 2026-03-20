Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87C1D3D4106;
	Fri, 20 Mar 2026 16:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774024095; cv=none; b=Iv6xbbxpAZ/F820XCgpRx2NpVzpdjMiSaXaLVZJT+ENn1bvTmB0HBRJNR+Df22/+mqWBYWv/TsWccpc3j+BWx5LrDAWB40RO9Ahn+yuDIVnzkOHfN9835mfFEzyd0Ot5kUJ4CXYBs/GvWE7UnyCgJuDkJHfJkMzagyogRCm290M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774024095; c=relaxed/simple;
	bh=jrOhK6ywzWa7h0Q8vD7bhuiyhE6TZdHxkM63E2sT2zs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ezyNCnALOzEVfTIvykuj1MiQb9ZiKGxIsuQl/xYgkoM0bmCgvTOyJHRT62x1Km3ZJ+3hAlqRpCG9fFKBlJLZ5zITuVwGo80EV8H+yODy3kQ7XO2J07Xk4UCmKidIoUjNk3H8GO+EvWhEFYOKMR7kFX2IA3mSpfnkeANpRdL7flU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vno/VdoO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vno/VdoO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE695C2BC87;
	Fri, 20 Mar 2026 16:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774024095;
	bh=jrOhK6ywzWa7h0Q8vD7bhuiyhE6TZdHxkM63E2sT2zs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Vno/VdoO68EmlRZ+dVSxEkhau93ukVFgRb1T7DhihSfMQMCWHY3c8QVOXOSUpsqdg
	 8GDI2OEiIqi21P2F9SauDfpL5c5z0UQ9ED6JNSHaPAFgDEK6deMwE9VjbnzoPzJB5p
	 Sq1Pokx6aeStRFRCElmDuHLioEdfhDb8OJ9mvZKashx4vXR6jPydlAcTjXbI8+P4gF
	 zhgxlcOyxvQILHPLAQq2RmlhMBh/RKKxLNp/rEZfVp7e64C2v6xWHUSpQV/dJaMZr9
	 N8RtO0UEejCP2zdsQ6iKCI+QTUNPV8PKCtRWG4zXeHbOgbXQWZFstvjcaj/b+qG0nk
	 sfvy2BkILTAlg==
From: Maxime Ripard <mripard@kernel.org>
Date: Fri, 20 Mar 2026 17:27:24 +0100
Subject: [PATCH v2 17/20] drm/drv: Drop drm_mode_config_reset() from our
 skeleton
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260320-drm-mode-config-init-v2-17-c63f1134e76c@kernel.org>
References: <20260320-drm-mode-config-init-v2-0-c63f1134e76c@kernel.org>
In-Reply-To: <20260320-drm-mode-config-init-v2-0-c63f1134e76c@kernel.org>
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
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=918; i=mripard@kernel.org;
 h=from:subject:message-id; bh=jrOhK6ywzWa7h0Q8vD7bhuiyhE6TZdHxkM63E2sT2zs=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDJl7S7Nf1Fg1PZu0LOj1M8dJ+7kUKp6ozDzwz965RfB0a
 3PwzRsqHVNZGIQ5GWTFFFmeyISdXt6+uMrBfuUPmDmsTCBDGLg4BWAiGq6M9bU+sfkHUn66RRVe
 1TMMZjlzf3VFe6BmnuByviqrkHsr58tHPHK6/cqPy2eerG9l4I46xoYVO5d+nxu51GhFzb3+C7z
 8m7bcXF3zg+9B0bZZJmtebRf8v0nvbcWSnqqUq1Kn559InToLAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

Now that we have drm_mode_config_create_state() to create the initial
state called as part of drm_dev_register(), we can stop recommending
calling drm_mode_config_reset() to perform that initialization in our
skeleton.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_drv.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 820106d56ab399a39cac56d98662b5ddbcae8ded..83752725f7c63364880225ec1083f19bd00ddcef 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -339,12 +339,10 @@ void drm_minor_release(struct drm_minor *minor)
  *
  *		// Further setup, display pipeline etc
  *
  *		platform_set_drvdata(pdev, drm);
  *
- *		drm_mode_config_reset(drm);
- *
  *		ret = drm_dev_register(drm);
  *		if (ret)
  *			return ret;
  *
  *		drm_fbdev_{...}_setup(drm, 32);

-- 
2.53.0

