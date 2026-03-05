Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85741376BD0;
	Thu,  5 Mar 2026 09:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772701532; cv=none; b=ggPnfiE3rGDMo6aHrL30Po7P6XBXlXtEF6EjvZizivmcfhtDMtxTaxduVofBeGVTQfzoz4SLZlhnuExOO1/YUtpnoi5yn+wligtHgZAEwWLRXc0U5wdvKpCZgxXE4mnATgjuUnkTTw8TsPI83/oLuGZkJF332l/F+AUEAFwyxSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772701532; c=relaxed/simple;
	bh=UOPw4lyjLgO8th4KVe5p6838LUE8j5nBPpQHE2tj2aA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QXaMWRMeviboeAxKlxHzjWV5uKTv2wbdG6X6HdbYc4lnnCqy/bBMRPd9V25wIDjZ/D0ZRvUD4AeJnGFkN4IWv5cjC1OGvX0Dv02E4m/bmsjEdWCqZtT+jSGoW9zlRuM7CgVgKVOKpVTOfCrSLT/XX5Xyuod0kb5oFho9mZLJynU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oxXcjh1E; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oxXcjh1E"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6091C19423;
	Thu,  5 Mar 2026 09:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772701532;
	bh=UOPw4lyjLgO8th4KVe5p6838LUE8j5nBPpQHE2tj2aA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=oxXcjh1E7AHB4pzmQyzC0aCcZFUVaswymWC0qjjAkz8/kiUX6dX4yhfE2oND2mRh4
	 UIBoXEdyU3zSU8whjodAYgBYr69ZyqnYhvojtJEIHoODsIETL4W3mOkERpxKL/DVMy
	 ZjDcLGh/82UXeVNiCslaFmdrh/FQhXg0mTkmPWNcFWzRqmbxS/NLiX9qtqBM4Ac5Xu
	 uUOyR0Jtnbf/WBqQScrWIAiTX6vOo+Ux6pyCwerpzwLpJC6PzwnOZQyBeG+7h1gJIR
	 6wAS8SoUS97I93A+bVr7Xh//H98I41LMI7ofm0FoMAODJVhZzofwfr5eHIjci7pJIp
	 mNiu7duxt0ztg==
From: Maxime Ripard <mripard@kernel.org>
Date: Thu, 05 Mar 2026 10:05:02 +0100
Subject: [PATCH v3 10/14] drm/arm: komeda: Convert to
 drm_output_color_format
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-drm-rework-color-formats-v3-10-f3935f6db579@kernel.org>
References: <20260305-drm-rework-color-formats-v3-0-f3935f6db579@kernel.org>
In-Reply-To: <20260305-drm-rework-color-formats-v3-0-f3935f6db579@kernel.org>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <siqueira@igalia.com>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Andy Yan <andy.yan@rock-chips.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Liu Ying <victor.liu@nxp.com>, Chen-Yu Tsai <wens@kernel.org>, 
 Samuel Holland <samuel@sholland.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 amd-gfx@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, Jani Nikula <jani.nikula@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5568; i=mripard@kernel.org;
 h=from:subject:message-id; bh=UOPw4lyjLgO8th4KVe5p6838LUE8j5nBPpQHE2tj2aA=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDJkr3a0clsl8SFsevO5gyuvw6LnWr+4vsFD7Grd07evYo
 Ehu7qSqjqksDMKcDLJiiixPZMJOL29fXOVgv/IHzBxWJpAhDFycAjCRA08ZGz6+OOuSln8572bn
 csZLC2fsjhe01Vppy9squbK4gl/c1Secc1mmU6LBo1L+BLXmzf1/GWuFDrN/kqr/sXfL59fH7sy
 1nZH6p2X7yttiN3J6f57sSGfq37y+bmXAs11HDxYl9eQ7aN0FAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

Now that we introduced a new drm_output_color_format enum to represent
what DRM_COLOR_FORMAT_* bits were representing, we can switch to the new
enum.

The main difference is that while DRM_COLOR_FORMAT_ was a bitmask,
drm_output_color_format is a proper enum. However, the enum was done is
such a way than DRM_COLOR_FORMAT_X = BIT(DRM_OUTPUT_COLOR_FORMAT_X) so
the transitition is easier.

The only thing we need to consider is if the original code meant to use
that value as a bitmask, in which case we do need to keep the bit shift,
or as a discriminant in which case we don't.

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
Acked-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/arm/display/komeda/d71/d71_component.c     | 14 +++++++-------
 drivers/gpu/drm/arm/display/komeda/komeda_crtc.c           |  2 +-
 drivers/gpu/drm/arm/display/komeda/komeda_pipeline.h       |  5 +++--
 drivers/gpu/drm/arm/display/komeda/komeda_pipeline_state.c |  2 +-
 4 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/arm/display/komeda/d71/d71_component.c b/drivers/gpu/drm/arm/display/komeda/d71/d71_component.c
index 67e5d3b4190f62549bc8da700deb4b15e138b515..27ca2930cdac6e76a058102ea2c1d8306d85e751 100644
--- a/drivers/gpu/drm/arm/display/komeda/d71/d71_component.c
+++ b/drivers/gpu/drm/arm/display/komeda/d71/d71_component.c
@@ -1078,15 +1078,15 @@ static void d71_improc_update(struct komeda_component *c,
 	}
 
 	mask |= IPS_CTRL_YUV | IPS_CTRL_CHD422 | IPS_CTRL_CHD420;
 
 	/* config color format */
-	if (st->color_format == DRM_COLOR_FORMAT_YCBCR420)
+	if (st->color_format == DRM_OUTPUT_COLOR_FORMAT_YCBCR420)
 		ctrl |= IPS_CTRL_YUV | IPS_CTRL_CHD422 | IPS_CTRL_CHD420;
-	else if (st->color_format == DRM_COLOR_FORMAT_YCBCR422)
+	else if (st->color_format == DRM_OUTPUT_COLOR_FORMAT_YCBCR422)
 		ctrl |= IPS_CTRL_YUV | IPS_CTRL_CHD422;
-	else if (st->color_format == DRM_COLOR_FORMAT_YCBCR444)
+	else if (st->color_format == DRM_OUTPUT_COLOR_FORMAT_YCBCR444)
 		ctrl |= IPS_CTRL_YUV;
 
 	malidp_write32_mask(reg, BLK_CONTROL, mask, ctrl);
 }
 
@@ -1143,16 +1143,16 @@ static int d71_improc_init(struct d71_dev *d71,
 		return PTR_ERR(c);
 	}
 
 	improc = to_improc(c);
 	improc->supported_color_depths = BIT(8) | BIT(10);
-	improc->supported_color_formats = DRM_COLOR_FORMAT_RGB444 |
-					  DRM_COLOR_FORMAT_YCBCR444 |
-					  DRM_COLOR_FORMAT_YCBCR422;
+	improc->supported_color_formats = BIT(DRM_OUTPUT_COLOR_FORMAT_RGB444) |
+					  BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR444) |
+					  BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR422);
 	value = malidp_read32(reg, BLK_INFO);
 	if (value & IPS_INFO_CHD420)
-		improc->supported_color_formats |= DRM_COLOR_FORMAT_YCBCR420;
+		improc->supported_color_formats |= BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR420);
 
 	improc->supports_csc = true;
 	improc->supports_gamma = true;
 
 	return 0;
diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c b/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
index 9c8b8da531a7f169cb55f0daba3a898d29cdfdf9..714af5c889d742144113f6d86c79b009d6a19384 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
@@ -38,11 +38,11 @@ void komeda_crtc_get_color_config(struct drm_crtc_state *crtc_st,
 			min_bpc = conn_bpc;
 	}
 
 	/* connector doesn't config any color_format, use RGB444 as default */
 	if (!conn_color_formats)
-		conn_color_formats = DRM_COLOR_FORMAT_RGB444;
+		conn_color_formats = BIT(DRM_OUTPUT_COLOR_FORMAT_RGB444);
 
 	*color_depths = GENMASK(min_bpc, 0);
 	*color_formats = conn_color_formats;
 }
 
diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_pipeline.h b/drivers/gpu/drm/arm/display/komeda/komeda_pipeline.h
index 37b9e92202443cc72adc0666ed047d4f77d79782..bbee6da43164f7cc32340ff4479d99609c18db7e 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_pipeline.h
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_pipeline.h
@@ -317,20 +317,21 @@ struct komeda_splitter_state {
 	u16 overlap;
 };
 
 struct komeda_improc {
 	struct komeda_component base;
-	u32 supported_color_formats;  /* DRM_RGB/YUV444/YUV420*/
+	u32 supported_color_formats;  /* BIT(DRM_OUTPUT_COLOR_FORMAT_RGB444/YUV444/YUV420) */
 	u32 supported_color_depths; /* BIT(8) | BIT(10)*/
 	u8 supports_degamma : 1;
 	u8 supports_csc : 1;
 	u8 supports_gamma : 1;
 };
 
 struct komeda_improc_state {
 	struct komeda_component_state base;
-	u8 color_format, color_depth;
+	enum drm_output_color_format color_format;
+	u8 color_depth;
 	u16 hsize, vsize;
 	u32 fgamma_coeffs[KOMEDA_N_GAMMA_COEFFS];
 	u32 ctm_coeffs[KOMEDA_N_CTM_COEFFS];
 };
 
diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_pipeline_state.c b/drivers/gpu/drm/arm/display/komeda/komeda_pipeline_state.c
index f4e76b46ca327a1c5db9bdbdd9550b45190b30d8..6f9b10cc831ff748296b9ed30b6de398c90c4786 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_pipeline_state.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_pipeline_state.c
@@ -797,11 +797,11 @@ komeda_improc_validate(struct komeda_improc *improc,
 					 improc->supported_color_formats);
 			return -EINVAL;
 		}
 
 		st->color_depth = __fls(avail_depths);
-		st->color_format = BIT(__ffs(avail_formats));
+		st->color_format = __ffs(avail_formats);
 	}
 
 	if (kcrtc_st->base.color_mgmt_changed) {
 		drm_lut_to_fgamma_coeffs(kcrtc_st->base.gamma_lut,
 					 st->fgamma_coeffs);

-- 
2.53.0

