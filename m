Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0CE63B4436;
	Tue, 12 May 2026 13:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778591225; cv=none; b=F14+tYFlUYvAUp903zk4mEhKiL0EIUaR0hf6R+YLT9KLlRBJklaTZnBN1ial/QW1lH6OreexKrz1o2Cx88uSul5xGE6azgdXHNIgPIEWhNa9rtG+hlysnSiCbKtgF7RuHDheMTU/b8BgBIHZU5EhPtNIXhPlb+adNXfMgSECaOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778591225; c=relaxed/simple;
	bh=qozUUf1AFqeMjnP70GJi9v3pouWkBGxz0M1HZ1nk+wY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oqfDKLwi7G46rginZ5oClceM7S38y8SBeJRmWffCfGSPMXmi5bdqanUGTiM3yDy/eDPpozg4GjoW8QkmV+F8ld84jBIxJ73kG7vfxCb9PrjBzG35wZY1LxElhs0abbTdJhtnixORf6WAvLfTCs/0jJionlDz3zHmOAZtoVcU8cA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lBMCkCJN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lBMCkCJN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14830C2BCF7;
	Tue, 12 May 2026 13:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778591225;
	bh=qozUUf1AFqeMjnP70GJi9v3pouWkBGxz0M1HZ1nk+wY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=lBMCkCJNgoAyO3K9JvDsOPMAHOsW7b8evS75Oy8H+9SOvR1TTSY5zzYFhkexSMrKb
	 wKaFVyTCRKTWJqgd53O4rCJ482uQtX3gNa7sHBe/AUygf7hZrPpRWpNyEzNVaN3AYS
	 +uL96+gXyE4UTeKXAEG7zvTfthbYfhgfU1nWKQJCeK8MouktRkcQnvpUjylHDIdAWK
	 eehQZf7M66E+WvVbDN2FURPNdVZkznANZ6xc9M8M6iXr10E5tMbEd6cRjDft2py/5E
	 wYWN5WguALo/lGPDVUIXA/NHhAulVZnOPj3SV7TNqYtAJ/AfVegb2OCPJ//7n8eYg0
	 SoCQtoS/YKCJw==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 12 May 2026 15:06:16 +0200
Subject: [PATCH v4 18/20] drm/tidss: Switch to
 drm_mode_config_create_initial_state()
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-drm-mode-config-init-v4-18-591dfdcc1bf9@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1009; i=mripard@kernel.org;
 h=from:subject:message-id; bh=qozUUf1AFqeMjnP70GJi9v3pouWkBGxz0M1HZ1nk+wY=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFnMqocimp5mplcJ+e5tuW60l1tznk7zvkW7rq0P8Tk9I
 ajtXY5Wx1QWBmFOBlkxRZYnMmGnl7cvrnKwX/kDZg4rE8gQBi5OAZjI7FDGhlfaqY6rd7GmXv4r
 6ZW2uc7rJ/ddfommvZO3dB6891uKSW+dmG3ZicdNwiWbbWuvm4e+ZWzo37e7+AUPg8SRJxH/Lu7
 ZtvTzsdKN0wxu+P9ocqw5tG7v47khHMp8ny+GlK3Zw7ZAUNMHAA==
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
2.54.0

