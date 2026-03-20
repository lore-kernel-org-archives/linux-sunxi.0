Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4E9B3D47A5;
	Fri, 20 Mar 2026 16:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774024056; cv=none; b=fQQwg1U4Tazfe6PPAKrcJUKoqoxKtaStdxxYNpvLqH2xnqt6fIw01Xx8TVvO7/nKaC1rQ3+HEnJbZ69IpVS3TdoMDQBmDNogAOS7EUytGdiUM7s/UE5gua+0N18A+xSlJRB4XVHME7vhn8zM/wdQgSXgdtg0UbJNZqkzCm3R1jE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774024056; c=relaxed/simple;
	bh=wsgH+JigiQfeFcxwGD7t3o9+hIxvZid3TubvDqbfQKQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gkrgFGpWqWUKfAikWESinz1XVH7TkrCjjj6S2OF1HCOWiSVj3BGM/NwruETtDBsSvxeOF1whTAvvx3S89ZXK2/CIYUxXvf6vgqkjqa/4lXfvEuCZ94Q0KV1Xh9ahCYUJfcFuAzyz9z1kVuhl5xpbmgly95C57zg7h0FWkQ8qT2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MnyukRsd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MnyukRsd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD29FC2BCB2;
	Fri, 20 Mar 2026 16:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774024056;
	bh=wsgH+JigiQfeFcxwGD7t3o9+hIxvZid3TubvDqbfQKQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=MnyukRsdGM5tALWWow4wXrFdo8tSbj4j8ni/3V46UYr2109ahtsTjO+b8xdEUcYWI
	 B5FJMYYjNoRgcIgBsRxF8+csBoBgS+6LqeDii30a02TOaLREFHylNG/b0do5OgulRX
	 uk/em3q56XPAJnJWUwicAA8LpnyY5y0NwTJ4AcO2XVPr4V0DKDVcERDl+tuHpGEfc3
	 rK0kS7xWscWDuSxaqOLPIN4F20FcZCis+xH8gNQyPqRGTFvMfi0CrnDdvcdJ1wwHSr
	 GaxwAsRBHzUahnvinIQJekLn9N0AWZdRYeJEctKdrz8xQ24iXt3keg8QHNdSXsHSuI
	 n8e5iAnbkY+TQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Fri, 20 Mar 2026 17:27:10 +0100
Subject: [PATCH v2 03/20] drm/mode-config: Mention drm_mode_config_reset()
 culprits
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260320-drm-mode-config-init-v2-3-c63f1134e76c@kernel.org>
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
 Maxime Ripard <mripard@kernel.org>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1447; i=mripard@kernel.org;
 h=from:subject:message-id; bh=wsgH+JigiQfeFcxwGD7t3o9+hIxvZid3TubvDqbfQKQ=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDJl7S1Nstz3decpi2d3w+dyr5Sep10g8NjdLdNj4TvVkR
 dCc3sVbOqayMAhzMsiKKbI8kQk7vbx9cZWD/cofMHNYmUCGMHBxCsBE+vUYa3iSZ4dmqL/Xb0pU
 aF57vk5KrffSjgPs3nUaSq8YoldPLlV6o/bufc2bR9+75RnYukOmMjY8v2TSmPH1tu5y5rSOaW+
 /3hGa0P4geHpjnTp3SDDXjcVf9XfxtOklnQ559/qG3ITr7+cCAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

drm_mode_config_reset() does not reset drm_private_states by design.

This is especially significant for the DP MST and tunneling code that
expect to be preserved across a suspend/resume cycle, where
drm_mode_config_reset() is also used.

Let's document this expectation.

Link: https://lore.kernel.org/dri-devel/aOaQLx-7EpsHRwkH@ideak-desk/
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_mode_config.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode_config.c
index 66f7dc37b5970c0a08f8dde008aef56376c59f37..cba527571ca66d3aa6dc652c87e03a19815d1d41 100644
--- a/drivers/gpu/drm/drm_mode_config.c
+++ b/drivers/gpu/drm/drm_mode_config.c
@@ -187,10 +187,14 @@ int drm_mode_getresources(struct drm_device *dev, void *data,
  * @dev: drm device
  *
  * This functions calls all the crtc's, encoder's and connector's ->reset
  * callback. Drivers can use this in e.g. their driver load or resume code to
  * reset hardware and software state.
+ *
+ * Note that @drm_private_obj structures are expected to be stable across
+ * suspend/resume cycles, and @drm_mode_config_reset() does not affect these
+ * structures.
  */
 void drm_mode_config_reset(struct drm_device *dev)
 {
 	struct drm_crtc *crtc;
 	struct drm_colorop *colorop;

-- 
2.53.0

