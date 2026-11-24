Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795506055;
	b=2ccJLKoeziMysvLS+Chzk51vOgNlaLVUcXMNm3iPBgHJBYX7CPv7Lhitu0KwN1jzeyd0
	 RsHEfNIQGj2j+4P4BMHe9HmzA4w0WFOlq7hvbVGbOa4FIhS/HTrRrqsDPO3usGu7z688O
	 4iUbLUPJ/fIh+3Q38V7lX6v+4bHVTjzs1PVyp/ns9eePs/X05t2T1yS3AejFXKv9FOB8Y
	 wUtG1sRaSvgiFbqS5qKaYaWTaJcrScod7njLnjRV7b+syBzXBiT7Lh1Wyy9JZPA5sY4PE
	 5+cIakqIZkPK70sPfbouCe4ZktNmWqimh3g2HqMtagnqYqOP4wLdQmK0a5ZtXI3jV1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795506055;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=yq9KtC/Vr6jX4nQrqLEI9ETBwLEZhdEPTg6w69t4M3Q=;
	b=blOwP0U9tfdVrErmd3Q2PBMENGgMl9qMjoNYb4iwdjRklGKUM5zHAugLVQJS8hIUp+v5
	 1dcXG8BWXVDaOddmyi71+krTyfg0+REHkMyuOshOobqKo/EQtpIlRUZ7e7QgHDu9Viyvw
	 Ek8ctmSrZ6Fdy2JTNl3PTSEK2nO9g/YZSsTcXFX/Z2hFcWrDYrLpPQfrZjKmiE0a1saJL
	 PKs2I8H+Tx3FOHkHmbsLu9xcoGZPWo+S1B20svGIDg5XNGmAIU1Ihyt+hxPD5mAEGYSI7
	 D6eG+Xlkx6oEwVaa07a1N5MfVGzG+R5g4GbQlAa6n+lFu9dU/5A45wqWuqxtTRMFKgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=irIQYn8I;
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BE20606A321
	for <linux-sunxi@lists.linux.dev>; Tue, 24 Nov 2026 07:40:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BE20606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=irIQYn8I
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3b08cf16decso2441752a91.0
        for <linux-sunxi@lists.linux.dev>; Mon, 23 Nov 2026 23:40:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795506054; x=1796110854; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yq9KtC/Vr6jX4nQrqLEI9ETBwLEZhdEPTg6w69t4M3Q=;
        b=irIQYn8IHaHV3ZhOkzpXNyvE7Yf4yoUelb9AvSpWnCuCVa7B0o8wX6CTkkOvA9yguJ
         ywmHrCCrZe+QORLvOS1EU1gs5t3Z7aawcm4L0S7w/1uYvWJvipv7nA1p2dCrcMTs9Sou
         58y9dwtICmZ1WR2CjsV/aIXUVFIDR72WufNL4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795506054; x=1796110854;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yq9KtC/Vr6jX4nQrqLEI9ETBwLEZhdEPTg6w69t4M3Q=;
        b=ShRyfCEgQLjQkVCVBgiauB9T+Nf84mYut8BlFjyOZ5v/hM7oczGr4edpu55riFnNT4
         6iZO0wk0Dy2SCrFVjjww0Isp7JQx4iuOWN0xArLZeCpwd/dk7UmEuEbAU4w30yACnJ//
         deYjsp2TaAJrgZ8+XkF+SraKwidEV4N5ovMDIpc/PO/vuzU+CBU/yvl16CbZAjmI1eJQ
         vSf6Q8ZZFc/etzmkesezyBe/+sOqpJ92QzJEtZbRRjZixy9mMegkqpAxmLSGLFyDpCh5
         cV9DjJYXPfW8IE7bRJMu9n4/phOJlCo7toowFz7xh2l4rFWzgziex6Rpz/YHYh1vJoW3
         PRug==
X-Forwarded-Encrypted: i=1; AL+hErEc23tiMXufGGZY3FM8603s2BBczAH/wIuUVGVgtZ5o3Xuq1GQbmyiHNJDpMhi2jxhk+m3qxBxTsvNO5g==@lists.linux.dev
X-Gm-Message-State: APuU4Z9WxVCPhFr147QzR8MdpLgQX6xWBECdkaj4ZLu7agJHOPsGbYID
	wod9s5Ks74Pbnq3kpOMF9AZ4tHTYFJVV3E+TzWY2+UqLgo8veKKDMYFpSVjnve2gPA==
X-Gm-Gg: AZFdTZcalgzWedzAUuk9LxFa4myxqXW/yR/6iIfkpeiajD2+hFmlCOKsQ/SIR9wb4/F
	HTZr8xrYcYSSQlImeHWuayIzQkkpcL6NqKwiop3N6IRpkCCZ4N+9XPhui4KZUKgWsieyqRs+seh
	y41gMBXMk58GdZkoksK0VxUOD98PpCg3zwgAxvtm2VrzfZo4RMi5FsaFIoK60n9PJJDxR6qBp4+
	gL2Rn9b2jChMKWp27GYdA3WcnCArkbm1na7NwCGp0rdBkGagAyeb2WZ6MNYeUQDU2s5VN6X3wZN
	3u36yVi4WuQHRcUd8PHqa0lqDWh/czUafiXg6aNluxZn4yU0K7LpATbxJ8hDSKO+1OGMK6xWBSA
	LJ/8iQ8AA2Fyo5isk9l2pG2UbHSUjAHNRaagk6QoWps1eX7hIXepQPQKhDmGn7dpHf0cHHFUjZd
	X84iB4wjLRX0etwsIy5tzJEaAm6OTAL+N5osm2Bq6uHCFGuSWsIwBWAavkl+rioSuJRfdrhS5go
	CkJ3ztILymhohShX4qXqT/vjD2M6adHvAKk4hM5H94l8X7V97LlRJd3rzILm9rKJPb3tkt+o+pW
	xwS58mPlaeRB9/tIDhTXhLOSdufaberW5qkwP1toa/fl/utpzToHfwg67KEz
X-Received: by 2002:a17:90b:5289:b0:3b3:8094:321d with SMTP id 98e67ed59e1d1-3b41c9080bamr13617140a91.32.1795506053661;
        Mon, 23 Nov 2026 23:40:53 -0800 (PST)
Received: from localhost ([2a00:79e0:203d:7:8f32:8910:4727:ea03])
        by smtp.gmail.com with UTF8SMTPSA id 41be03b00d2f7-cde84cd5ed8sm3771777a12.10.2026.11.23.23.40.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 23:40:53 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Liu Ying <victor.liu@nxp.com>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-sunxi@lists.linux.dev,
	imx@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RFT v3 0/5] drm: Add and use drm_fb_dma_get_gem_clipped_addr() helper
Date: Tue, 24 Nov 2026 15:39:28 +0800
Message-ID: <20261124074041.115251-1-wenst@chromium.org>
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
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

Hi,

This is v3 of my drm_fb_dma_get_gem_clipped_addr() series.

Changes since v2:
- Change drm_framebuffer_get_block_offset() offset variable and return
  type to u64, and use mul_u32_u32() to avoid 32-bit overflow (Thomas)

Changes since v1:
- Add and use new drm_framebuffer_get_block_offset() helper (Thomas)


This series adds a helper to retrieve the buffer starting address of a
"clipped" framebuffer. This contrasts with drm_fb_dma_get_gem_addr(),
which gives the address of the full buffer.

Some drivers program their hardware with clipped dimensions, so they
should be using the clipped buffer address as well, unless the hardware
can advance the scanout directly. (Side note: many drivers still use
the non-clipped dimensions.)

While at it, also pull out the offset calculation of drm_fb_dma_get_gem_addr()
into a separate helper in drm_framebuffer.[ch], thereby separating
responsibilities.

The sun4i driver was recently incorrectly converted to use the unclipped
drm_fb_dma_get_gem_addr() helper. This broke offsets into subsampled
pixel groups, but also exposed the mismatch between the dimensions used
vs the buffer address. Two other drivers were also touched.


Patch 1 adds a new helper to return the byte offset into a framebuffer
for the start of the pixel block of the given pixel coordinates.

Patch 2 adds the new helper to return the buffer address based on
clipped coordinates.

Patch 3 switches the sun4i driver to the new helper, and fixes the
luma plane buffer address offset for subsampled YUV formats.

Patch 4 converts the imx/dc driver to use the new helper. This fixes a
mismatch between the programmed coordinates and the buffer address.

Patch 5 replaces the open coded buffer address calculation in the
imx/dcss driver with the new helper. Existing behavior, which might be
wrong, is preserved.


Please help test. The series is only compile tested on my end. The sun4i
changes should revert its behavior to before the drm_fb_dma_get_gem_addr()
helper was adopted. The imx/dcss changes should not have any behavioral
difference.


Thanks
ChenYu

Chen-Yu Tsai (5):
  drm: Split framebuffer pixel offset calculation from
    drm_fb_dma_get_gem_addr()
  drm/fb-dma-helper: Add drm_fb_dma_get_gem_clipped_addr()
  drm/sun4i: layers: Fix VI buffer address for clipped offsets
  drm/imx/dc: plane: Switch to drm_fb_dma_get_gem_clipped_addr()
  drm/imx/dcss: plane: Switch to drm_fb_dma_get_gem_clipped_addr()

 drivers/gpu/drm/drm_fb_dma_helper.c    | 61 ++++++++++++++------------
 drivers/gpu/drm/drm_framebuffer.c      | 46 +++++++++++++++++++
 drivers/gpu/drm/imx/dc/dc-plane.c      |  4 +-
 drivers/gpu/drm/imx/dcss/dcss-plane.c  | 34 ++++++--------
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c |  2 +-
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 16 ++++++-
 include/drm/drm_fb_dma_helper.h        |  4 ++
 include/drm/drm_framebuffer.h          |  3 ++
 8 files changed, 119 insertions(+), 51 deletions(-)

-- 
2.56.1.809.ga0b61035b5-goog

