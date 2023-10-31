Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 141341DDD4;
	Tue, 31 Oct 2023 16:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iahrUcKq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CB9FC433C8;
	Tue, 31 Oct 2023 16:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698770951;
	bh=3urbyxJOhBJnxOpaqPUf/XFZGd3bz5XAd4Th75mEdek=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=iahrUcKqSV3lX4ZqGjGm7cIqAZc5HYlXXHqvrLMWIRS2//1OQFrnc80OMc/fLKTQU
	 4bucmEXFJcZeBxWpnDWS9T9m9gTPVV3TCUNLJE37XeLggA6Bi7EbDcUNc/GnsCZCiS
	 UnQY2OyxKw1dHDtqnIJMZ9ZU8JG0QJhOQwAaLjnHlMsOTjVoIBw94yzUR6Jzvdi+tC
	 7QxRkGr6ZgMpckTxXqItG3ByY3UHQ2SX22k/4Vll+N8ELjvzQozbCTKHnuTDiharJd
	 YiBwwDkRi6aNYL/8UsE25Y51koM1hAboO36vqtHTTiqx7gWDJs0Eq8h6WSlW9p7Pau
	 SINs4JdLMburg==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 31 Oct 2023 17:48:26 +0100
Subject: [PATCH RFC v3 13/37] drm/vc4: hdmi: Create destroy state
 implementation
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231031-kms-hdmi-connector-state-v3-13-328b0fae43a7@kernel.org>
References: <20231031-kms-hdmi-connector-state-v3-0-328b0fae43a7@kernel.org>
In-Reply-To: <20231031-kms-hdmi-connector-state-v3-0-328b0fae43a7@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Emma Anholt <emma@anholt.net>, 
 Jonathan Corbet <corbet@lwn.net>, Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1640; i=mripard@kernel.org;
 h=from:subject:message-id; bh=3urbyxJOhBJnxOpaqPUf/XFZGd3bz5XAd4Th75mEdek=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDKmO+veYFr399NOA4YHuhmZpjUCFe888Avc6K/vM4e34c
 OTCwTMrOkpZGMS4GGTFFFlihM2XxJ2a9bqTjW8ezBxWJpAhDFycAjCRAjuG/9lt+xbUHNaz/jBV
 53SRrxeT0Tvpy4LlzxoeqnKXFD4zamBkOOqrW/PjOeP/iZ8mX1y20c03l89duyHqSMFENi6+J24
 bOAA=
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

Even though we were rolling our own custom state for the vc4 HDMI
controller driver, we were still using the generic helper to destroy
that state.

It was mostly working since the underlying state is the first member of
our state so the pointers are probably equal in all relevant cases, but
it's still fragile so let's fix this properly.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 25c9c71256d3..f05e2c95a60d 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -672,11 +672,21 @@ vc4_hdmi_connector_duplicate_state(struct drm_connector *connector)
 	return &new_state->base;
 }
 
+static void vc4_hdmi_connector_destroy_state(struct drm_connector *connector,
+					     struct drm_connector_state *state)
+{
+	struct vc4_hdmi_connector_state *vc4_state =
+		conn_state_to_vc4_hdmi_conn_state(state);
+
+	__drm_atomic_helper_connector_destroy_state(state);
+	kfree(vc4_state);
+}
+
 static const struct drm_connector_funcs vc4_hdmi_connector_funcs = {
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.reset = vc4_hdmi_connector_reset,
 	.atomic_duplicate_state = vc4_hdmi_connector_duplicate_state,
-	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
+	.atomic_destroy_state = vc4_hdmi_connector_destroy_state,
 	.atomic_get_property = vc4_hdmi_connector_get_property,
 	.atomic_set_property = vc4_hdmi_connector_set_property,
 };

-- 
2.41.0

