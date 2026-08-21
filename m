Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33679426D0A
	for <linux-sunxi@lists.linux.dev>; Fri, 21 Aug 2026 14:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787323236; cv=none; b=kHAtSIz0sU8Nlllzi+FM/UG1Zqm+uDEn13fqADed7sjjygLplaT6i08zQWkG4bXsJ3sKunLac4UQS4sn44psLN+m8wUWL7r8xT4BQtScyH9G+7mzqHC/Uv2+TR1dVvgUeVHo/27o5QhoJIiqvOhGf42Fzh6J7kwmjlzoJWhVRj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787323236; c=relaxed/simple;
	bh=sOBE/NqLg89J72OrT5VTjGJSmwr8Ot7FxDEp35N+fso=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cBBh2CN5vpFElGjlp3yd6sUJbG6Q8GtU9n943/KDQ6KHqq41mpgDiZKK6NQoKyEw6Yshaa6YQ9yikdNihPK5bqXOBdEapQc5H5PLFCtePGLz15KTdJsH/xZ0o7TUS1PwiaXJ9J2gAuD7a+/nalqjlCY+QoTtP5jwEtQdme4DT2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=irxxiFLb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="irxxiFLb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 247831F000E9;
	Fri, 21 Aug 2026 14:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787323227;
	bh=8u6at7JrEk3SxnlIhICtJY1at8iMK+8btWc6GgP9LXo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=irxxiFLbHnmDx99DZpQSNLB7miXeJUl66NzlZxzGVYPejRbo/5P4ZwZtSIvobPeX2
	 GeAtTK38h7IGkKkHi7NapqFLDectyMc1LP9VxJTEBaAoURM6u7IZZiEs8plXPPEeRx
	 IjZHng39W55f0xq5lqlw0kthvb7Zee1jWkl4j6G2MzAoltDe3UG331Ifj8J3/Z4QQQ
	 UdJi3JXZmd1NG0MWytyuDASZDVsTKtNONeeD89Wdlmu4iVYi5c6quyl3d0ap/3FkRt
	 ZWvJfczwDdFrK1uXz9F2evq9wv0Aqg5R6qJzLGeMo4Pepq/QtRwUkIcvAUVmXq+2Nl
	 hDArxNghwFPBg==
From: Maxime Ripard <mripard@kernel.org>
Date: Fri, 21 Aug 2026 16:39:03 +0200
Subject: [PATCH 27/70] drm/sun4i: Switch to
 drm_atomic_helper_crtc_create_state
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-drm-no-more-crtc-reset-v1-27-fb793475c05a@kernel.org>
References: <20260821-drm-no-more-crtc-reset-v1-0-fb793475c05a@kernel.org>
In-Reply-To: <20260821-drm-no-more-crtc-reset-v1-0-fb793475c05a@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Samuel Holland <samuel@sholland.org>, 
 linux-sunxi@lists.linux.dev
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1270; i=mripard@kernel.org;
 h=from:subject:message-id; bh=sOBE/NqLg89J72OrT5VTjGJSmwr8Ot7FxDEp35N+fso=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFkdySx/PlcE7AtR0052/Ln28F22D6vaYvV/ejhvvPJP6
 XSO0DfJjqksDMKcDLJiiixPZMJOL29fXOVgv/IHzBxWJpAhDFycAjCRCeKM9WEWNm7Z08/0XXe/
 qbanL2r12qM5C/SUdL0Xf6jdtcalMFr2+P8b3gtWmRgJb3BSa19VxFinP7Nz1rVmPQNdT5Ec59u
 JMn3VP16+2WWwm8+k8locW7550eZLZ6cXvd6Qk8/87kfgymsA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The sun4i crtc implementation uses the deprecated
drm_atomic_helper_crtc_reset() as its reset hook.

Switch to drm_atomic_helper_crtc_create_state() instead.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
Cc: Chen-Yu Tsai <wens@kernel.org>
Cc: Samuel Holland <samuel@sholland.org>
Cc: linux-sunxi@lists.linux.dev
---
 drivers/gpu/drm/sun4i/sun4i_crtc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_crtc.c b/drivers/gpu/drm/sun4i/sun4i_crtc.c
index 3fa1f4fda0f0..e6a20e2f0ade 100644
--- a/drivers/gpu/drm/sun4i/sun4i_crtc.c
+++ b/drivers/gpu/drm/sun4i/sun4i_crtc.c
@@ -181,11 +181,11 @@ static void sun4i_crtc_disable_vblank(struct drm_crtc *crtc)
 static const struct drm_crtc_funcs sun4i_crtc_funcs = {
 	.atomic_destroy_state	= drm_atomic_helper_crtc_destroy_state,
 	.atomic_duplicate_state	= drm_atomic_helper_crtc_duplicate_state,
 	.destroy		= drm_crtc_cleanup,
 	.page_flip		= drm_atomic_helper_page_flip,
-	.reset			= drm_atomic_helper_crtc_reset,
+	.atomic_create_state = drm_atomic_helper_crtc_create_state,
 	.set_config		= drm_atomic_helper_set_config,
 	.enable_vblank		= sun4i_crtc_enable_vblank,
 	.disable_vblank		= sun4i_crtc_disable_vblank,
 };
 

-- 
2.55.0

