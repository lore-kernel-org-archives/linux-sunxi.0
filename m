Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4113B37FF74;
	Fri, 24 Apr 2026 10:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777025992; cv=none; b=oQyBXGYJObTQX3eM6M+aYjCoXGnAHpwgpDReJbUyC9cXb34kasATwJDzaoT3w1hj2D5kmKvW3QkiPL1r9LWzWUAfIGAVx9aoxl11D2AVlc7WAsvg+dkNxpsQMrj/rDZWhy20Lt2jdRRUXYJeg222GNMSQoiLiFz4rI5mFDkquMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777025992; c=relaxed/simple;
	bh=Euz7DdChlAIGYIv4MW9vjG7tVXHoxWupCrReeTOiaiE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Hm9+suFiNDgCJVMb2FovFP7HMf0rVDCOcbmMvYJgOxJwpPGNkovLvxc6SZpmGHYhtNp9oHI7SdDaTUljSWwPw6e0YBwzCouO6hqDvx9A5KoOcz+Uog2k/biKzYl/UQp2AVE5vpoklBcba3egdp+WtKNNLASio32+37y+k9L37is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rBK889Ty; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rBK889Ty"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81AE2C2BCB6;
	Fri, 24 Apr 2026 10:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777025992;
	bh=Euz7DdChlAIGYIv4MW9vjG7tVXHoxWupCrReeTOiaiE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=rBK889Tyc98Ux52s++5Ud4/5N3N84H5Xh0SpFE0/x0XJlqlgTfz3bzDxuaI8qSKyN
	 c0uay22m+GT7PXUTD5nEec4JMXJxunzIjfEgn+JpM/ZSPLYuziOpU6f7bUvRDHT79E
	 W0Y9B2JroJBpxZl/3c4y0w0V/y3OfB5d9UovpH3/q/WX37EZ9377QqH1qdozHZ/Xbm
	 GYTRkExTUG8w2AXRZANQNy7tWUK214yUDklSl1so3dhUbZIG96GDnq1EI+kLp3h8xT
	 gAzPS/811aN7Jq9r+j7FQHFXTH0JyRntqJeHPO2oL2g96wfsUsbxm7QmrNvOjnxuui
	 JfUQcEShdjfAA==
From: Maxime Ripard <mripard@kernel.org>
Date: Fri, 24 Apr 2026 12:18:58 +0200
Subject: [PATCH v3 18/20] drm/tidss: Switch to
 drm_mode_config_create_initial_state()
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260424-drm-mode-config-init-v3-18-8b68d9db0d8b@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1009; i=mripard@kernel.org;
 h=from:subject:message-id; bh=Euz7DdChlAIGYIv4MW9vjG7tVXHoxWupCrReeTOiaiE=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDJmvnSew1029JKK7fMLF3Z7863bOOqaa8zD7Yh9vxcybK
 w59upSu1zGVhUGYk0FWTJHliUzY6eXti6sc7Ff+gJnDygQyhIGLUwAmonGMsd5z5r7M8j6LWS4n
 jRM3VZ16WRvqtafPXt+yXVyGL5mpv+J+loJe6K/YUPM3gYvTtHgPMtZKJemZ7S+wes7Ws7BcKut
 YaaDvviD+IOP6ZZXnHvKdiBQIn5rgKJm58W/ZineqAUlCHQA=
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

Now that drm_mode_config_create_initial_state() exists to create the
initial state, use it instead of drm_mode_config_reset() during
driver probe.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/tidss/tidss_drv.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tidss/tidss_drv.c b/drivers/gpu/drm/tidss/tidss_drv.c
index 1c8cc18bc53c..f5099d5d6e32 100644
--- a/drivers/gpu/drm/tidss/tidss_drv.c
+++ b/drivers/gpu/drm/tidss/tidss_drv.c
@@ -169,11 +169,15 @@ static int tidss_probe(struct platform_device *pdev)
 		goto err_runtime_suspend;
 	}
 
 	drm_kms_helper_poll_init(ddev);
 
-	drm_mode_config_reset(ddev);
+	ret = drm_mode_config_create_initial_state(ddev);
+	if (ret) {
+		dev_err(dev, "failed to create initial state: %d\n", ret);
+		goto err_irq_uninstall;
+	}
 
 	ret = drm_dev_register(ddev, 0);
 	if (ret) {
 		dev_err(dev, "failed to register DRM device\n");
 		goto err_irq_uninstall;

-- 
2.53.0

