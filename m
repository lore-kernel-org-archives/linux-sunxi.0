Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792672599;
	b=3KO2U5nw8bc1fku/o78auVFlox2AfROgXqE0sG+YCYFrAmL5knNtiWA2R/iG4H2TB2pk
	 zOpBgbvsCYdz/7vBVNaEZfOwGuxM7cRalJ8kyCK6z/YRZcp6TeqJXffbGi0fusmhXa3K5
	 LeziZOp6fz/ak0ZYhcUFNeDPcO4WMrkkEEKBLWW+bLJSP8Z03FPLkAFJhjzl5MaC9EbdI
	 2nG7I36lfFJtHGv2kYJ7TpcB9vPOCFmcGnicl80Y9eA/BhJEmWeAbUtpCBKZg7TaThaCq
	 T4IMbJkm65U9MrIae+jECuFxQjTbURzO82EzwOV637uVecumtjJQoYnQxpqr1O4V7Cw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792672599;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=iift74J2BcJLjOmAJCEOfXrZiV7cQ7a8CkgROfOHGRw=;
	b=vQbX5N0QYV+dD+qNyPo2sDf2qZOVFrH14BQhxVuea9WU5mIXg99qDQNKxRUtJreR66tm
	 VLM6OEc+mhygHmhTMaCCc2QYwIqk2p06CpfMnojQwF5IcBmNAgEbwrvvYCXhy0f9BNopP
	 ZLt1UBc+yOqNKGtZ/hw6YxlsN1jp4tq/waNxZ329U0+Jh5dZu4scTNi3ZOVQx671qfv9y
	 RCvVgZzLGbPpXIjE3jKN0lny8fnnWzh8o+H/V8cYvc6Q6ReJtCnZqCUaUmRwNcH33Op9N
	 +C3og0q3L0dmEM/odG4lz04Ky6cTMALXBgcF1B+JxAT264HRCMwpIkg2zu2hKdWrjNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LBCVytlP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89CDA606A319
	for <linux-sunxi@lists.linux.dev>; Thu, 22 Oct 2026 12:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LBCVytlP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A03191F000C1;
	Thu, 22 Oct 2026 12:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792672599;
	bh=iift74J2BcJLjOmAJCEOfXrZiV7cQ7a8CkgROfOHGRw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=LBCVytlPZLp9NTcJ1osQup2EPLx0c4fjVq+psH90YyFdkTSHc273LtfflcybyZgXl
	 VHKSEqhgX4G6pVzXgDhYTjk5B2dwiQ32GaXZsgCyGWDP2cgVxY8YKChdJCQAGL5m1M
	 yB930PgWb+Irmxw1vSCOJlqdlg9nbKhOfcsn6Mnp4nMMtdHhuAmpSzbtFDLRv3tdA7
	 hDNVplx7C/70ZrJ6rNUPHAgnjQgjV6CD48XpGga1oRQjNr958x0MwBsqo1YZ+xmDs5
	 UDwIq6eWeYUw+WuGomqZuhLjeC+TUU4bE2k3PAGD6auW8h/CwUAIqRXiaNa2m6Wtyp
	 rqn93UJgF6ugA==
From: Maxime Ripard <mripard@kernel.org>
Date: Thu, 22 Oct 2026 14:31:47 +0200
Subject: [PATCH v2 48/59] drm/sun4i: tv: Convert to atomic_create_state
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261022-drm-no-more-connector-reset-v2-48-0b7e4e85b1e8@kernel.org>
References: <20261022-drm-no-more-connector-reset-v2-0-0b7e4e85b1e8@kernel.org>
In-Reply-To: <20261022-drm-no-more-connector-reset-v2-0-0b7e4e85b1e8@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Samuel Holland <samuel@sholland.org>, 
 linux-sunxi@lists.linux.dev
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1967; i=mripard@kernel.org;
 h=from:subject:message-id; bh=kGTs0Nop/pM8g/eLbAmv9j8gKg2hgWhBLCx8ej3AHWQ=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFm3mBZFvz61VjRo4229FStbl1mnXXJ9t7itXvGK36udU
 7bMuWOwo2MqC4MwJ4OsmCLLE5mw08vbF1c52K/8ATOHlQlkCAMXpwBMpMKSsaFdwM9Y2f2fQPDH
 K4GVi3k+/nhynKFpxuPDl6f3fi1m3PafayFXZmPlgjpV70UsGtMUPBgbWm/+rHE/3XSp85Old09
 45IRVaW7XakTM1m6e+ibxteNDFaM3kxMOMCjUrXGSW79mxRoRAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The sun4i TV connector reset implementation creates a pristine state
and initializes the analog TV properties. It does not perform any
hardware reset.

Since this is equivalent to what atomic_create_state expects, convert
the reset function to an atomic_create_state hook that returns the
initialized state.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
Cc: Chen-Yu Tsai <wens@kernel.org>
Cc: Samuel Holland <samuel@sholland.org>
Cc: linux-sunxi@lists.linux.dev
---
 drivers/gpu/drm/sun4i/sun4i_tv.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_tv.c b/drivers/gpu/drm/sun4i/sun4i_tv.c
index ea86f8a6a35e..a68e5f7a03d2 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tv.c
+++ b/drivers/gpu/drm/sun4i/sun4i_tv.c
@@ -406,8 +406,16 @@ static const struct drm_connector_helper_funcs sun4i_tv_comp_connector_helper_fu
 };
 
-static void sun4i_tv_connector_reset(struct drm_connector *connector)
+static struct drm_connector_state *
+sun4i_tv_connector_create_state(struct drm_connector *connector)
 {
-	drm_atomic_helper_connector_reset(connector);
-	drm_atomic_helper_connector_tv_state_init(connector->state, connector);
+	struct drm_connector_state *connector_state;
+
+	connector_state = drm_atomic_helper_connector_create_state(connector);
+	if (IS_ERR(connector_state))
+		return connector_state;
+
+	drm_atomic_helper_connector_tv_state_init(connector_state, connector);
+
+	return connector_state;
 }
 
@@ -415,5 +423,5 @@ static const struct drm_connector_funcs sun4i_tv_comp_connector_funcs = {
 	.fill_modes		= drm_helper_probe_single_connector_modes,
 	.destroy		= drm_connector_cleanup,
-	.reset			= sun4i_tv_connector_reset,
+	.atomic_create_state	= sun4i_tv_connector_create_state,
 	.atomic_duplicate_state	= drm_atomic_helper_connector_duplicate_state,
 	.atomic_destroy_state	= drm_atomic_helper_connector_destroy_state,

-- 
2.55.0

