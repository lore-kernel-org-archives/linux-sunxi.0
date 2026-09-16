Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B235F35A39D
	for <linux-sunxi@lists.linux.dev>; Wed, 16 Sep 2026 03:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789529619; cv=none; b=G/oj2XydZoiyg+qBTHEJ/KwW+M1VLBhyD5qUcJe9M1cxdC0ZWAgoAMUrzEXqeppdGhnea86DsBKYZPHU0RC4p//mK2VuvAiEAJuxngQUK5yt6/AJDjkBAmuyAv9S9w6gkcZYlVlnR8Ybfod2yb1u6UpdOHar/yUUZtTYpI1MX7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789529619; c=relaxed/simple;
	bh=s5XVTbQ1oqig9WAX+D6K/Dw3nnCGDh9w9eKsg9hj0nc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SputVVCwje6158isB1ZW90u3LUSVClxLKOF5YY46Fwo4bv+aB2tEKQ59qCKA5a+WxLLYJEYH2M7Bq28jGYTSNVwa7twmAfypZKxuSjmp8ExXk1MYgqSsHuM4UWh29BsIydhVkLCVN4/bpRD25P5wjMhLVH95jeKNzz2UQMVrpc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=NZ3t0Vze; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="NZ3t0Vze"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-39b2ad83dc6so418657a91.0
        for <linux-sunxi@lists.linux.dev>; Tue, 15 Sep 2026 20:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1789529617; x=1790134417; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WW23/p8j1VrlcRbF/FlA+rOMTRyOj5YVS3I8yZ6IEcE=;
        b=NZ3t0VzePR4iRhHhSgKLsR7n+ktUbFPmuubMjworhQ/TceDgBTOVq7gQ5vsmVjE4sR
         WqlwKAbj4R0xrHCfjHatfYFKWWDlQG/qq/Z31lwv8mBUP//B/g2t2z6jqUlm0xoEnpOU
         HODpVenEZKaBIfDrUX8Dg0r5U1jYGAuJzqAuo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789529617; x=1790134417;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WW23/p8j1VrlcRbF/FlA+rOMTRyOj5YVS3I8yZ6IEcE=;
        b=s3CAie+wWnPaZylFOU1OkChFZG8E6Afqq3JKwG1NKCAIz4c03t1Ez70MS9L9xHLLBL
         VgFefTUXGhi1vHZpSHkuAvDLztIkIJjoM6Io9kaiu6Vf41ZWDuTk8vgHweC/yjbUq8L2
         L0dpdD3IBzzf/o1HSDLkSS5gGKgAMUo+iUIhntdNStIE+jz6S9u7jyxbC+uOG4S/ihDs
         Af8Zj94Wh6tBhdNiIkjWPtOWBKVOdxvlCSVdMtZvn6yRaoMSA8geIMohvv18tjFgK9BG
         7Mz6WPJfOAn9Ahzj2GHKv78Aw4jfw9wbVyFThUVqyBRhrm7VNIrAoyV6SrlSuQy0BqNB
         o1QA==
X-Forwarded-Encrypted: i=1; AKwUvBy5EuBxcufOWnRJN7qQy93Mn67nScQxIL1f+ABCBuPVG/6MvqgsRkMudAxXbJNSujORl0YCFWWPs1ov3Q==@lists.linux.dev
X-Gm-Message-State: AFuF++kVwLLjo+UtN4wTPNDdKNPJMYHBxTGX0tIvsnq8ROCU58X/wdI6
	Y8cZYGTKsCCVPt7leP/ahWyjr8CSUbGA6goZghsUqTM5GcKUhbVmy6Kym7msUIrNuQ==
X-Gm-Gg: AYBFou0VJl/+/U+8rQhV7D3I0WoSjzp8ODlDG9XVs7AYTvi+qiERF6ZOGL7Vh5s0yKP
	8N8/QoC48/pAUybbF2A2cQVPWU1G9M4miBkJe1sh3E6qJ2IPd87HBgq3izF4WUSbi+M/VeYtWTg
	VXIDu/H5P20ageceWH+YMAkG34GHApnISkDUKo/IPWm/z8a3OXTfYRlnm1IUlfMhKKbxmsvoPqD
	tVD12wnt2DJZw77ZcdBnvSjzoEE/wyb4pas/coQQfdn/b5s2H1w5TmjCbTG+EAKI3lLq6FtlUAd
	dZ/pGEVyPaTa7C0d7Qy7BmOJqqN7JY3HkF6ERrz+2sZ4Xhy3UnnJuj6CrLaySllUa+kgaazjf/t
	VYeo6qUpo+BdtFYzltQqbhgnjGyo6yTUDXQgo70CKCPiYMARCaWqlVnAA3E5Vu3vffsXfNWCMFp
	EeR1TJUQXNuZ0dyFTitzwMSnH/v5EniWOnYH4lD+3MWWqWJRHBB3rGQO2xmhRrSgWuo77Rn7wYo
	TBnzBSUvLirguH8rZAOq9n/Z/L9zKONkh3lY+Ls6f+dhbumwxUv0PcsXg==
X-Received: by 2002:a17:90b:224b:b0:38e:57a3:f218 with SMTP id 98e67ed59e1d1-39e1e4246f7mr2337951a91.13.1789529616959;
        Tue, 15 Sep 2026 20:33:36 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:203d:7:1f62:7622:5d61:2578])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e1bbe3e62sm1833477a91.10.2026.09.15.20.33.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 20:33:36 -0700 (PDT)
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
Subject: [PATCH RFT v2 0/5] drm: Add and use drm_fb_dma_get_gem_clipped_addr() helper
Date: Wed, 16 Sep 2026 11:33:21 +0800
Message-ID: <20260916033327.3054126-1-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.1032.g73a4cd73de-goog
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This is v2 of my drm_fb_dma_get_gem_clipped_addr() series.

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
was adopted. The imx/dcss changes should not have any behavioral
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
 drivers/gpu/drm/drm_framebuffer.c      | 45 +++++++++++++++++++
 drivers/gpu/drm/imx/dc/dc-plane.c      |  4 +-
 drivers/gpu/drm/imx/dcss/dcss-plane.c  | 34 ++++++--------
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c |  2 +-
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 16 ++++++-
 include/drm/drm_fb_dma_helper.h        |  4 ++
 include/drm/drm_framebuffer.h          |  3 ++
 8 files changed, 118 insertions(+), 51 deletions(-)

-- 
2.55.0.1032.g73a4cd73de-goog

