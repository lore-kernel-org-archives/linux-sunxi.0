Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794957528;
	b=XW0QDCVst8w7qykMXTQbj0HtIX7BAIURVOuim6ct3xM/Xzua14fXOIxxUskpK3b9vmDj
	 BihX23F2nZUmroF5UwRpRLaPp0kdS6IviqP5RTVXhgRNkCy2w54MiiJ1+y8MGY3sT0d1x
	 A0otzc6L4p0bAtuUT17Aqf6rHRLGp3Wlk1q2LVAHjnuYcvwT2wiQadAtZMsMYUg1hYL32
	 sGz82kjtMMkV0MkMD66zHeMsvssVHVwe+s1K2FOkqIbtanGyavDDihPTxyJ6q+GYlWIPS
	 eBgJpHpdXkzdPrqJ+7bp6PfIHwWXOPm32r7f/NC74qfqBG8uC12XTM5czEgH4JdNLZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794957528;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-Originating-IP:X-CM-SenderInfo;
	bh=2XiawxssXXv44CNWTaqQT2qKQdjrgp5aUYtmWBVrWtk=;
	b=Q6DjohfhgmqDgPCwdzn9jiX7cA8DTkXwOgQtkVycfcX2wdU+05qqu6dVaJItCVFx5vLL
	 +KR7nVNI/aew5r2dm05js5TqXE9+4aR3vGsqdAHZybvz2Cwb49z9LXQ6ZPe7V65lA7KKE
	 xIoQjJxCCyxYS4RXHmmI6XbRqjEypUU/oTISS9yW2XfKzsov0Ve88qEtBv4/G15oyYvYg
	 c6JVI5OB1ehbpoK8uagOQlgpgBn2+bliHipX/vLMDZfmU4qw25uVkJZHNHgfCpppNfoTl
	 tfYET1yspVjN3UlXq6+VsCKD90MzEkkk7huUaU/rj1TOVe85ut9xRtRcFRKRqZ1MN1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b="OYt6b6/D";
	arc=none smtp.remote-ip=220.197.31.3
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BAA0606A31C
	for <linux-sunxi@lists.linux.dev>; Tue, 17 Nov 2026 23:18:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8BAA0606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=OYt6b6/D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=2X
	iawxssXXv44CNWTaqQT2qKQdjrgp5aUYtmWBVrWtk=; b=OYt6b6/DZuxN9m65Wz
	xbjsou0Q3LqRlvdSX5wGjdw1+9zP57hawgwifC6iUat0xlRH+0ThedclIchtfhrt
	4zV5/HG6GTid5BjPlVPcCRFMrIHEtZxmdFlElvpOJfouw1rGLU3N52r1JgYG89Sm
	LXxmbSyqWwRrL3F1T1qKklOj4=
Received: from SYPC (unknown [])
	by gzsmtp2 (Coremail) with SMTP id PSgvCgCXyQiu4Pxq15exGA--.55935S4;
	Wed, 18 Nov 2026 07:18:09 +0800 (CST)
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
Subject: [PATCH v2 2/2] drm/sun4i: backend: report coverage blending for alpha-capable planes
Date: Wed, 18 Nov 2026 07:17:51 +0800
Message-ID: <20261117231751.264258-3-hsyysy@163.com>
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
X-CM-TRANSID:PSgvCgCXyQiu4Pxq15exGA--.55935S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7Aw4DWFyrGF1xuFWrKr1Utrb_yoW8GrykpF
	4kGayUK3W8Crs0qayxAa4UZr13Wa1rGFyIgF9xX3s3Xwn0qFnxC3s8G3Wa9FyUJrs7Cr4U
	tw15WFZF9FnrC3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j4_M3UUUUU=
X-CM-SenderInfo: 5kv152r16rljoofrz/xtbC7hE+cmr84LED1AAA3j

The DE1 backend planes expose ARGB8888, ARGB4444 and ARGB1555, but the
driver does not create a blend mode property for them, so the new
validate_blend_mode_for_alpha_formats() also warns on A10, A20, A31 and
A33:

  sun4i-drm display-engine: [drm] [PLANE:31:plane-0] pixel format with
  alpha exposed but blend mode not setup. Please fix.

The backend blends a layer onto the pipe below with the layer's own alpha
channel and has no premultiply control, which is the DRM "coverage"
equation.  Advertise DRM_MODE_BLEND_COVERAGE for these planes as well.

Signed-off-by: Yang Siyuan <hsyysy@163.com>
---
 drivers/gpu/drm/sun4i/sun4i_layer.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sun4i_layer.c b/drivers/gpu/drm/sun4i/sun4i_layer.c
index d65587d..0e6e0d1 100644
--- a/drivers/gpu/drm/sun4i/sun4i_layer.c
+++ b/drivers/gpu/drm/sun4i/sun4i_layer.c
@@ -228,6 +228,13 @@ static struct sun4i_layer *sun4i_layer_init_one(struct drm_device *drm,
 	drm_plane_create_zpos_property(&layer->plane, layer->id,
 				       0, SUN4I_BACKEND_NUM_LAYERS - 1);
 
+	ret = drm_plane_create_blend_mode_property(&layer->plane,
+						   BIT(DRM_MODE_BLEND_COVERAGE));
+	if (ret) {
+		dev_err(drm->dev, "Couldn't add blend mode property\n");
+		return ERR_PTR(ret);
+	}
+
 	return layer;
 }
 
-- 
2.56.1

