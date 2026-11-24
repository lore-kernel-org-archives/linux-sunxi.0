Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795506078;
	b=K3bKGTf9k5hUASJDIzlL8+N0mtpa/SKHib8fp8vTwUXd+VCdZw6xfdB9sDT4Z7xofW+0
	 4LsWnS0aZtQOi0OVpdWDB8X7XGEBP0rzIIDPmq/MPh2Fctw7KDecTFRuPSRtYB6Qbx8m3
	 HUOviWmXP3xxtiV7j9ir2q+BJ8YWU+I4vASI1yXSbf5iDNnK1H2Js78mAwLPgvppqcxpK
	 grqumay0lmMPCSpk//GhugnX/raNpv32JTct5YPacBiZgUF4OwEyCYUF/4n9ZdT/NKNvJ
	 2Pd8O7RnabT6Upe2VzsT153lV5hJjp2HIdFKBgmW1Wy9QzPvhhGgwmGrxIpUE8qEzoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795506078;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=74TXVSiLNJEh4EdaGe7nzkm4UiqpR2QLi5goWWiHysE=;
	b=jVx5yrqOk9D8CQl5j36GxhAbAw2zTCzbb4QfSSI6K7+ojYIYHSnezJ8Gj1uIN9GGvV69
	 C8B1G0iGslCpznIWpTlSXX56RdWVA9nhQ+2oVoMn6RKz33m++v/wk0NlWpUo/WtwUwhOQ
	 u5k/4JJk+rU0Jsezhq7n6NLc4IJ+K4L2IbyDBTc97U/HkYZHj9ZTfahHFWhYFgdoyRFQa
	 KwApIT92M1ih6ZKeE+Y32a8QJ4ETUVHE7mSqiCQ4QuFI+nMuo40M3pPDu5+g6MM2qsHwT
	 4pjoiFcUbWKTeKQ174ZOqUZ4S7ofzZv9P7nJj2HrTyS1s4IuogkPW80yPZDgRKUcEzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=gB4VboDy;
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 737D3606A322
	for <linux-sunxi@lists.linux.dev>; Tue, 24 Nov 2026 07:41:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 737D3606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=gB4VboDy
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3b40f4d4b5dso1732357a91.1
        for <linux-sunxi@lists.linux.dev>; Mon, 23 Nov 2026 23:41:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795506077; x=1796110877; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=74TXVSiLNJEh4EdaGe7nzkm4UiqpR2QLi5goWWiHysE=;
        b=gB4VboDykbp7/xNrB+IFqXw8SKkyewE/AyeYiz0kyLCAqoFGXaOBfn2kfPYmX36T7E
         9lD0Mc8p+cvXccLfD3/efWSdihw/HGtUT8B/Dnz7+fRNU7hYO8TKE1oQOqCrXpoFF/1D
         kbVBA9GzE9nBuyX+VGo6+Uvm3MBfl+uQKyFZk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795506077; x=1796110877;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=74TXVSiLNJEh4EdaGe7nzkm4UiqpR2QLi5goWWiHysE=;
        b=e5P8K3iT/nydtPD3fDz2dBGBQjYzyKhie7gfnCymncBl3kx19lDL5Kv77jGL5ItMTv
         rEhPb6Wm/AXbvpRBGIojmNLqTcDVPq8GfvfMex8gNWYTQDCi5jCb/RuEnud1k7udLdCs
         +/rmSeCFAytYd2lv1/uySV8zNA9c15CKgbyd/ZFBlJBjJUch/G7euQ3v5HO9jRZthez5
         uEx6IbJmV/v2GVcG7FW3qay3w5g3hSmBcDOCxnqXF4mtqE7ESSpSDYswwppC92UQJjvm
         n1NvO/GJ/JBJ78dzM6cHvQ8M8W0oUNecWRuipIDMgGqyWWqD8MQvfNr+7OMuSbUGMJm7
         L/dg==
X-Forwarded-Encrypted: i=1; AL+hErEjzalQNX2UAL+W0jllC1XTloZ6oUViCyAtoujg2OOtQZ9+GSg1pJdFUoo8q6dBTqtpRy6MqJjYq59MMg==@lists.linux.dev
X-Gm-Message-State: APuU4Z9lIaydyPOBEu/aOuIRivumRwRHIszx2V6Zu44BUQS2Veb3wAEZ
	42TqkA3m+YAkp9pi80pZgTXOwqXuK4Hr+FKQwIcvm2Wp972cmsumCiaW+Q1DLNvPxA==
X-Gm-Gg: AZFdTZeRFXOA38kaB/0E1BgZX+vkl1Y5tpWsJSQLx8oIgV27IDVqgPAJoeAEZDkAGyf
	6e+uLOYFdFU6bJeU9O1hoKf+WZxfk/Pa7XXTIqgruhvQbHlslu7I/7FD5skTnnUu/MRrXe1o+Ju
	EjXQWkLDA2mSpNWeacdeFB6rX7Hqgh8FMvrSeSUz2ePt6bt7hoy5tzE3JoNM349hLh9LcfRpGvs
	YXAuyMO6Y0isV4M6YaVurG04fPKFIDT5vV6BdNtNRCa0H+C3mFwX/k0grkjAWZjXmQrfPClA/Bw
	cq8+fA/CCyiOd7uY8YQs9G/pL6+0b522W4NUNsJpxUyk/eASskVw5bHDAx/JBIJrx+EpjKHl+lC
	t1JGEZnZ3Lpj8AKPxC6gEQ6Rm8MtpiM2hY6uawRBMu8Hqw8MKt5nf8G/IQOvPBhRLSKr2ab3WO4
	tbJyGLg1LqBu1z9LRRKWRgVajifMYh4OJZwQ3pQ40tmOAIvj2FCaXDndkdNmp6c7llB9OPXRWuy
	O9cnXImeZ4+/jDLE1vP4BFdwFTB5E7xjhrnC2cA+1TMcFjjHawEwi4kmHo0/9es4/aV5EH+RQP8
	2PWDSs4wdJXkrOn5CXSy/Eiv41NrXPNGGqFdU5P3ZJDxHpEFMJ92gwuqN95G
X-Received: by 2002:a17:90b:3d90:b0:3b3:ff70:4d0d with SMTP id 98e67ed59e1d1-3b41c8d49b7mr11902997a91.14.1795506076825;
        Mon, 23 Nov 2026 23:41:16 -0800 (PST)
Received: from localhost ([2a00:79e0:203d:7:8f32:8910:4727:ea03])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-3b44b7a8c64sm9100767a91.3.2026.11.23.23.41.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 23:41:16 -0800 (PST)
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
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH RFT v3 4/5] drm/imx/dc: plane: Switch to drm_fb_dma_get_gem_clipped_addr()
Date: Tue, 24 Nov 2026 15:39:32 +0800
Message-ID: <20261124074041.115251-5-wenst@chromium.org>
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
In-Reply-To: <20261124074041.115251-1-wenst@chromium.org>
References: <20261124074041.115251-1-wenst@chromium.org>
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

The hardware is programmed with clipped source and destination dimensions,
but the framebuffer address is calculated using drm_fb_dma_get_gem_addr(),
which uses the full source dimensions. This will not match the source
offset if the top and/or left sides are clipped.

Switch to the new drm_fb_dma_get_gem_clipped_addr(), which provides the
buffer address starting at the clipped boundary.

Fixes: 711a3b878366 ("drm/imx: Add i.MX8qxp Display Controller KMS")
Cc: <stable@vger.kernel.org> # Needs drm_fb_dma_get_gem_clipped_addr()
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/gpu/drm/imx/dc/dc-plane.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/imx/dc/dc-plane.c b/drivers/gpu/drm/imx/dc/dc-plane.c
index 62dd0576fadc..35eb5039f5ac 100644
--- a/drivers/gpu/drm/imx/dc/dc-plane.c
+++ b/drivers/gpu/drm/imx/dc/dc-plane.c
@@ -65,7 +65,7 @@ static int dc_plane_check_max_source_resolution(struct drm_plane_state *state)
 static int dc_plane_check_fb(struct drm_plane_state *state)
 {
 	struct drm_framebuffer *fb = state->fb;
-	dma_addr_t baseaddr = drm_fb_dma_get_gem_addr(fb, state, 0);
+	dma_addr_t baseaddr = drm_fb_dma_get_gem_clipped_addr(fb, state, 0);
 
 	/* base address alignment */
 	if (baseaddr & 0x3) {
@@ -146,7 +146,7 @@ dc_plane_atomic_update(struct drm_plane *plane, struct drm_atomic_commit *state)
 	src_w = drm_rect_width(&new_state->src) >> 16;
 	src_h = drm_rect_height(&new_state->src) >> 16;
 
-	baseaddr = drm_fb_dma_get_gem_addr(fb, new_state, 0);
+	baseaddr = drm_fb_dma_get_gem_clipped_addr(fb, new_state, 0);
 
 	fu_ops = dc_fu_get_ops(dplane->fu);
 
-- 
2.56.1.809.ga0b61035b5-goog

