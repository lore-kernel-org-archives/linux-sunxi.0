Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793373339;
	b=w9n4BlJO3m9s7T2QEFuQUIOTvhl3srdsGEt0wy9v56IJfp1zsxQIv7DLzwQZNgvgtjTK
	 A395JQhEkkRuxT/wnk6Wj5N9PihD5v41k8cJmUpcDKb8Uir1sgyONUuk00NgBfSuCp62+
	 eGkPhni0kTKeyOskwxy8Ku2VSUkX5dj3VIdyhpBI2LM4T6n0dgaY79Zes1n2RCkSwZYJv
	 EkU7yQlXQoGbUswLVBClGBIT7AdVnFnLbmombs3sWkY1kAgH6cyODn2ckqd7AnBzkohF+
	 JRzDEwn7cvuc9qDRzC8ASZGrZHji8PLHFLA8bSYVMVoDLUtSyufLWBvmpWXztKqSKYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793373339;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=iift74J2BcJLjOmAJCEOfXrZiV7cQ7a8CkgROfOHGRw=;
	b=qtCAUx8pw37D3ZfxRBwmVV9mM2PSxB46AfvFR7NutwGJ24lIhEBDG6mdzg0+ofjUG1UR
	 WuW0zxfAL73mVILvuOVtsrE9mhkegve1BjonbT6cJeBA0io0FJof0LGH6vYgmJQV/7Kxw
	 CLooSgHIA+EcMr/oUBc2XfXJHaOrVT3SEGWVmUF4zbcyLdbettgVZRQGCP9y1z7YC53p3
	 1fo3nHhPDV/XP/EM2yN4+6nKSVmdjVK1+0mPiT9vqruHtty6cFbq2W8Q/HMdNHme6gOSO
	 PSAMxbMGY0RJjkTXL2/VopoZo+hJ0reWmXClmTZwZ8qlKTG2XgNERAZnKHZy6KXldEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="NqGP/3Xr";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FFA6606A31D
	for <linux-sunxi@lists.linux.dev>; Fri, 30 Oct 2026 15:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NqGP/3Xr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61AF81F000C1;
	Fri, 30 Oct 2026 15:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793373338;
	bh=iift74J2BcJLjOmAJCEOfXrZiV7cQ7a8CkgROfOHGRw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=NqGP/3XrBSU9mKjAtTmo0ON2DKayBmXx4vLc6QAZZbMKMAz28k8LsP0JszZAa9Qxk
	 E1q/8rnjbCPGmwdDHNl1SFCMBbwSBCw0lA6Dy5zes5v+UFoa0vjXRcgdX3sqxcY9rM
	 5yOv7PXmZwRRVbErvYr6UhZWfKntduy9Pau/zS0Qr7CiDtOzkiUoflqnJm3yJmJGzu
	 TAmIXxaKhck+or7vSk5UCpqh+A2lf8/IXq1EtC9X1q1QOfDAkkj9zix/9pGJjj/B7c
	 6RQUDtv7R/ayLdgVXY1juhY+n7o2wuCQRBU7RmJ/QEFQ7fGFGcVeWhl95YXI0djo2L
	 QbAzQTt1qswSQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Fri, 30 Oct 2026 16:13:59 +0100
Subject: [PATCH v3 29/37] drm/sun4i: tv: Convert to atomic_create_state
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
Message-Id: <20261030-drm-no-more-connector-reset-v3-29-30e71d92c327@kernel.org>
References: <20261030-drm-no-more-connector-reset-v3-0-30e71d92c327@kernel.org>
In-Reply-To: <20261030-drm-no-more-connector-reset-v3-0-30e71d92c327@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Samuel Holland <samuel@sholland.org>, 
 linux-sunxi@lists.linux.dev
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1967; i=mripard@kernel.org;
 h=from:subject:message-id; bh=kGTs0Nop/pM8g/eLbAmv9j8gKg2hgWhBLCx8ej3AHWQ=;
 b=kA0DAAkTJ1/OGaI9vnYByyZiAGrktCrI7xROyP1Qk2kr5n2CkA50TbX+KBTIlrWzHoeys1z9C
 4iVBAATCQAdFiEE5BxWy6eHo3pAP6n4J1/OGaI9vnYFAmrktCoACgkQJ1/OGaI9vnbdKgGA8hwS
 AK5zkzXRBiAaF5hpTRehUIRBE7Z18gV+6JzV508fFaVrHwwc/lb2vEEfuRjTAX9B6gQwN/Q9cPr
 DmpP2GNZF0ikQonjDsKry41Vbvi5vxPkPnTDROVSWj90xWOX71Xc=
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

