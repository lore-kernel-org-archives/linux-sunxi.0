Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794957524;
	b=E/+9ZrGke0/W3k6tAiPtj3l1kI0MNFNVL6IWFVjryNFduoVfNIw6T1H9cDElUxLtBTux
	 5HQvIZJRYtuvbAChINf4mJwUsW5uBWYAeL4pVUHid3khzXlgDo9SW6h/cEt4Hi3RBt2sU
	 q+PMJn7Vt2I7Z51S5m0D/Y1oeTCUVIt74aHboJvJxqJ5u9yyspfn+Reqw5L0tknf0/pcT
	 TKA9t6pe7QUplr6Iyqrzpm4cnezcyedsyCdSQvmnRrM9LG6U6vhUmrwv0Pc5kG1D1pz7p
	 3a19VLi9np6M+8e1DZiTrz+nhP9nl1hF8SE9eHQN0XTCsnhmLkkE3s806mCqAHRopAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794957524;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-Originating-IP:X-CM-SenderInfo;
	bh=OFZbREjsf49enuS/73KTBKoLcystcrUdilFE3iKgq+A=;
	b=IudjMR86OaHlBJPd51bxVLVdz3P6rlL+ZitxoGfW97/shADFifhNT8ygYfDC+sbzFaeC
	 hTCh0VeCsstiHeQFO9cFc4mJHT4P7cWCmi6yXfOgJIiXRTEDLPSH5w0Tr9JM39pdJZUw1
	 AH0kK8gk++HIA9o6TFX7MSthPwzEXq2GhDzM83U24vOFd3Z+k+68LoUBHnS/QbRO7YMYG
	 Ehwfo1UOn6F1hyk1V8g3nkyjd1TjnsHpEjTWZHYQMiSawVN9z8M2yZuP7KXEIt4OsuP05
	 U7uD01u9A2TBTPcuu1ACfrJHE2ZD3AJyke2haqS3tD685tI/M8QCqTcq3eK1M69Rlxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=Nu++3NeI;
	arc=none smtp.remote-ip=220.197.31.4
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94D91606A31C
	for <linux-sunxi@lists.linux.dev>; Tue, 17 Nov 2026 23:18:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94D91606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=Nu++3NeI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=OF
	ZbREjsf49enuS/73KTBKoLcystcrUdilFE3iKgq+A=; b=Nu++3NeI1PVbPdurBW
	WEtwwZw69UEXY4csT3e9BSE0/sh+pFE+WT8iAyYiNZ74LIudSI7rIYAeFi+Nqdn+
	FjqiXl/FrjwyJiNn8Sm/05ySW9xelpjxUBgJLyz73BvVaupopga+NGlMoFiUz0fo
	ntbc7ehklf3h+k3h8Q68fRdIk=
Received: from SYPC (unknown [])
	by gzsmtp2 (Coremail) with SMTP id PSgvCgCXyQiu4Pxq15exGA--.55935S3;
	Wed, 18 Nov 2026 07:18:08 +0800 (CST)
From: Yang Siyuan <hsyysy@163.com>
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
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] drm/sun4i: mixer: report coverage blending for alpha-capable planes
Date: Wed, 18 Nov 2026 07:17:50 +0800
Message-ID: <20261117231751.264258-2-hsyysy@163.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261117231751.264258-1-hsyysy@163.com>
References: <20261117091932.12063-1-hsyysy@163.com>
 <20261117231751.264258-1-hsyysy@163.com>
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
X-CM-TRANSID:PSgvCgCXyQiu4Pxq15exGA--.55935S3
X-Coremail-Antispam: 1Uf129KBjvJXoWxWryktrWkCFy8CrW3JFWkWFg_yoW5Jw45pF
	4rGFy5K34UGrWYva43Ary8ZF13Wa10gFy8Kry7J3sxXr1qqF9Ik3s8K3ya9ryUArWxCr42
	gw4UGF4q9FsFkw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jcsqJUUUUU=
X-CM-SenderInfo: 5kv152r16rljoofrz/xtbC7hA+cmr84LADwwAA30

Linux 7.3 added validate_blend_mode_for_alpha_formats(), which warns once
per plane that exposes a pixel format with an alpha channel but has no
blend mode property:

  sun4i-drm display-engine: [drm] [PLANE:35:plane-0] pixel format with
  alpha exposed but blend mode not setup. Please fix.

The mixer blends a layer using its own alpha channel: ALPHA_MODE is set
to PIXEL when plane alpha is opaque and to COMBINED otherwise, while
BLEND_PREMULTIPLY keeps its reset value.  That is straight alpha, i.e. the
DRM "coverage" blending equation.

Advertise exactly DRM_MODE_BLEND_COVERAGE on every mixer layer that can
expose an alpha format (UI always, VI on DE3 and later).  This matches the
existing register programming, keeps userspace behaviour unchanged and
satisfies the validation.  Premultiplied blending would require driving
BLEND_PREMULTIPLY and is left as a follow-up.

The DE1 backend planes are handled by the next patch.

Signed-off-by: Yang Siyuan <hsyysy@163.com>
---
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c | 7 +++++++
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 9 +++++++++
 2 files changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
index 00756ab..57bc603 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
@@ -283,6 +283,13 @@ struct sun8i_layer *sun8i_ui_layer_init_one(struct drm_device *drm,
 		return ERR_PTR(ret);
 	}
 
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
index 09f668c..ab95c55 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -436,6 +436,15 @@ struct sun8i_layer *sun8i_vi_layer_init_one(struct drm_device *drm,
 		}
 	}
 
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
-- 
2.56.1

