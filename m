Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793026129;
	b=j3WGI6prGQtdhB6kAd+TUXqFE5N31ph6tnN17PoEFCvHiEw4pZ8NGvz2sqDFmZIMEb8O
	 2aJ+zPCAAqU8VcZ9AbwmIDYHiEzKnHXEJcXrgLxqLABSsmvWqQHsyvuT25ePGaYN6cdgG
	 LoUC2IfkGJlnrcQ9qK1Nkfrbud1US4rRi5w5WVGWKbRkYmXc2Ue1xLhzKTvHdGkdrHHgM
	 JwchnAWvHUSdPTYZp7TKBkj41C3kDHf1lWkSF1T3idvUGH8Us1cAzT1H3guJmoc2s564s
	 CvQgcOFKn7ZzEdaJLnuWccw7Z5rfZNlyz96aIgtIXalC4VpngYxL8G7QbMbNU0E/9LQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793026129;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=q1uPJJujBlQwMDVIEbVRHxhSYFea8SfgoWYItKkXDG8=;
	b=LISlcHn/qAZv3nhSNLLMn1W2crDNSaP6V8ptD8a6cb7PohD1w9MX5zk1osBvKZALScIL
	 sJPLLRHf+8KacNEz5ou6xEi7SD69iu81x9WnPg75qH8Z0r6KEwhCu2VvcBRcxYw2BVUap
	 GWwo/0S8N9Yto2SlUIPvn7d3b29/U0uI4CaJ3ojDNP23u3VUaCOuYcY4vl/pKo6g9DIzs
	 aAMcIiN2opFAun8Aff9+XjguzjTgAHuzOTR+BP0HKlZqxIx6YBxx2DggPPbG1E28JY3Da
	 sEVT6hN08FtcTtFwOdHgoRoR4Rn37rRzIan0nTCs3hQ+OCwbT/x80Rq8Wryebp1PCmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=puC9kj1L;
	arc=none smtp.remote-ip=220.197.31.3
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1109606A320
	for <linux-sunxi@lists.linux.dev>; Mon, 26 Oct 2026 14:48:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1109606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=puC9kj1L
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=q1
	uPJJujBlQwMDVIEbVRHxhSYFea8SfgoWYItKkXDG8=; b=puC9kj1LBRzDwPO2+K
	KrVZv1iCMDAqvE7ItxjUiJXBIF7cnYD65P+vsusW8BIMHBtEbA2BVf1grt2L1l1f
	ZpxEsWX//eaFZpJWWyOL0GrftKs3CmpBVhg03As4ltAYTr2kdEJVBnTKRJJpmizX
	BpSmCLfnE8092eznbbnCZwSQg=
Received: from SYPC (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wD3P6kmaN9qcCfOCw--.2131S2;
	Mon, 26 Oct 2026 22:48:07 +0800 (CST)
From: hsyysy@163.com
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Simona Vetter <simona@ffwll.ch>,
	Samuel Holland <samuel@sholland.org>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yang Siyuan <hsyysy@163.com>
Subject: [PATCH] drm/sun4i: report coverage pixel blending for alpha-capable planes
Date: Mon, 26 Oct 2026 22:47:42 +0800
Message-ID: <20261026144742.1392695-1-hsyysy@163.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3P6kmaN9qcCfOCw--.2131S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxWryktrWkCFy8CrWxtr4rGrg_yoW5Cw4rpF
	WrGFW5C34UCr4ava43ArW8ZF43Wa1FgFWFgry7J3s3Xr1qqF9ak3s8Caya9ryUArs7Ar42
	gw15WFsF9F4DCw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pEpVbDUUUUU=
X-CM-SenderInfo: 5kv152r16rljoofrz/xtbC7ge16WrfaCcAFgAA3Z

From: Yang Siyuan <hsyysy@163.com>

Linux 7.3 added validate_blend_mode_for_alpha_formats(), which warns once
per plane that exposes a pixel format with an alpha channel but has no
blend mode property:

  sun4i-drm display-engine: [drm] [PLANE:35:plane-0] pixel format with
  alpha exposed but blend mode not setup. Please fix.

The mixer blends a layer using its own alpha channel: ALPHA_MODE is set
to PIXEL when plane alpha is opaque and to COMBINED otherwise, while
BLEND_PREMULTIPLY keeps its reset value. That is straight alpha, i.e. the
DRM "coverage" blending equation.

Advertise exactly DRM_MODE_BLEND_COVERAGE on every layer that can expose
an alpha format (UI always, VI on DE3 and later). This matches the
existing register programming, keeps userspace behaviour unchanged and
satisfies the new validation. Premultiplied blending would require
driving BLEND_PREMULTIPLY and is left as a follow-up.

Fixes: 860e748bddcc ("drm: ensure blend mode supported if pixel format with alpha exposed")
Signed-off-by: Yang Siyuan <hsyysy@163.com>
---
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c | 13 +++++++++++++
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 14 ++++++++++++++
 2 files changed, 27 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
index 7d894e1eb..ef059ac47 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
@@ -283,6 +283,19 @@ struct sun8i_layer *sun8i_ui_layer_init_one(struct drm_device *drm,
 		return ERR_PTR(ret);
 	}
 
+	/*
+	 * The mixer blends the layer using its own alpha channel with the
+	 * pixels not premultiplied (BLEND_PREMULTIPLY keeps its reset value),
+	 * which is the DRM "coverage" equation. Report it so that the blend
+	 * mode validation in drm_mode_config_validate() is satisfied.
+	 */
+	ret = drm_plane_create_blend_mode_property(&layer->plane,
+						   BIT(DRM_MODE_BLEND_COVERAGE));
+	if (ret) {
+		dev_err(drm->dev, "Couldn't add blend mode property\n");
+		return ERR_PTR(ret);
+	}
+
 	ret = drm_plane_create_zpos_property(&layer->plane, index,
 					     0, plane_cnt - 1);
 	if (ret) {
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index 92dd5a97f..b6771576b 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -470,6 +470,20 @@ struct sun8i_layer *sun8i_vi_layer_init_one(struct drm_device *drm,
 		}
 	}
 
+	/*
+	 * Only DE3 and later expose pixel formats with an alpha channel, and
+	 * the mixer blends them with straight alpha (coverage), same as the UI
+	 * layer.
+	 */
+	if (layer->cfg->de_type >= SUN8I_MIXER_DE3) {
+		ret = drm_plane_create_blend_mode_property(&layer->plane,
+							   BIT(DRM_MODE_BLEND_COVERAGE));
+		if (ret) {
+			dev_err(drm->dev, "Couldn't add blend mode property\n");
+			return ERR_PTR(ret);
+		}
+	}
+
 	ret = drm_plane_create_zpos_property(&layer->plane, index,
 					     0, plane_cnt - 1);
 	if (ret) {
base-commit: 091b06388b117fefdcb63336ac09956a4914b961
-- 
2.56.0

