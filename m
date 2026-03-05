Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D71D374E64;
	Thu,  5 Mar 2026 09:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772701507; cv=none; b=hxfFLeULsGDs+8Ile7xZLbEvpRBhRQ537sY5wPQ1EE/lnJdisN/NAYpJzFTO1e6LP8Y5lpmBeW4/9VNFRCs2HPIQE02OTC4fvW7R1Vw84HppVcLdb7/utdH3w808VOPgFVpe2pTEXAnYTwuxyU0vaqBjogWjczhDluZXVBT7NMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772701507; c=relaxed/simple;
	bh=pALwRFzWIQKTpcLw9NIyZWrgGnwzLJRpPmwmiwUCRco=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uef4KSdXHiWJHCEoUMh6JLcue5sklKB4ANRd2DXBj0acfRcdprEOAzMxbq7tgxS7uoztPBClJtUNxcE4f0ow0mzhWfbvtbVBhoAQM9gSKx93az2Trw3GUr452SnQmjzc2c69hx8feZTJ9DBlstJY+VAHvDZs/pqjbzZFNNTt3HY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kOccXVVp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kOccXVVp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 303BAC116C6;
	Thu,  5 Mar 2026 09:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772701506;
	bh=pALwRFzWIQKTpcLw9NIyZWrgGnwzLJRpPmwmiwUCRco=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=kOccXVVpzQJcoK4ZH1qTKM3+cnAQeelrqtoUyy1JqsNlr1R8sMgpP0+IUjaLut8LB
	 STkK8FUuw4Joye8r5/jx8Xc87nLEzLulTTEVhwqKQ5Eae4xnZ4KUDH5DKkcFxPZwAx
	 tWME1d/v7hz/JPYdfurBhneA/DX/y4xz2wGTB9GifjSTu9hyT16AE8cd1lstlyZr5h
	 gwVga/FXeCeBhElapZ3OC8O5/ODOk+DPZbSr7z8ErgVEr3Q83GxhUd0FE9UgrR44c7
	 ukmVy0Kr30393ldmezE1vAZuvdnwer/hIO0bxScSIb/ethb3odHJuN/tkv7ebqyBsA
	 OYlH+Pbu5glHw==
From: Maxime Ripard <mripard@kernel.org>
Date: Thu, 05 Mar 2026 10:04:53 +0100
Subject: [PATCH v3 01/14] drm/connector: Introduce drm_output_color_format
 enum
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-drm-rework-color-formats-v3-1-f3935f6db579@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4252; i=mripard@kernel.org;
 h=from:subject:message-id; bh=pALwRFzWIQKTpcLw9NIyZWrgGnwzLJRpPmwmiwUCRco=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDJkr3c0uiehK3JxY4pAnEdi8pPXmK+NPb/WuJ7M5hL3m0
 BN7f+5Mx1QWBmFOBlkxRZYnMmGnl7cvrnKwX/kDZg4rE8gQBi5OAZhI0j/GhvdXVjaW/XFoMX7H
 edi2M87TwFpK/uwdt8uRi/pMeV47s2zJn7hs/seMzfVs/o65SpdSGWv4VlkkuLtYvVsT6KLmknY
 +s3dFYZVrXV3S8QzZs8ZmGbJbXNudVq3IT8iturXAIf09AwA=
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The EDID parsing code initially introduced the DRM_COLOR_FORMAT_*
defines to represent the sink capabilities. Since a given sink could
support multiple formats, it was first defined as a bitmask.

However, the core and drivers have since leveraged those defines to
represent both the supported formats but also the current format being
used.

Considering the latter case, the more natural, and consistent, thing to
do would be to create an enum of all the possible formats, and then list
the supported formats using a bitmask of the individual enum values.

Let's create a new enum following that pattern, drm_output_color_format,
while maintaining the DRM_COLOR_FORMAT_* compatibility to make the
transition easier.

Acked-by: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 include/drm/drm_connector.h | 42 ++++++++++++++++++++++++++++++++++--------
 1 file changed, 34 insertions(+), 8 deletions(-)

diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index c18be8c19de0ab1e02e7d7b1fcd9f2ab5ef1dd15..227f6190438679104f5336be088a73f4529c15fa 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -554,10 +554,35 @@ enum drm_colorspace {
 	DRM_MODE_COLORIMETRY_RGB_WIDE_FLOAT	= 14,
 	DRM_MODE_COLORIMETRY_BT601_YCC		= 15,
 	DRM_MODE_COLORIMETRY_COUNT
 };
 
+/**
+ * enum drm_output_color_format - Output Color Format
+ *
+ * This enum is a consolidated color format list supported by
+ * connectors. It's only ever really been used for HDMI and DP so far,
+ * so it's not exhaustive and can be extended to represent other formats
+ * in the future.
+ *
+ *
+ * @DRM_OUTPUT_COLOR_FORMAT_RGB444:
+ *   RGB output format
+ * @DRM_OUTPUT_COLOR_FORMAT_YCBCR444:
+ *   YCbCr 4:4:4 output format (ie. not subsampled)
+ * @DRM_OUTPUT_COLOR_FORMAT_YCBCR422:
+ *   YCbCr 4:2:2 output format (ie. with horizontal subsampling)
+ * @DRM_OUTPUT_COLOR_FORMAT_YCBCR420:
+ *   YCbCr 4:2:0 output format (ie. with horizontal and vertical subsampling)
+ */
+enum drm_output_color_format {
+	DRM_OUTPUT_COLOR_FORMAT_RGB444 = 0,
+	DRM_OUTPUT_COLOR_FORMAT_YCBCR444,
+	DRM_OUTPUT_COLOR_FORMAT_YCBCR422,
+	DRM_OUTPUT_COLOR_FORMAT_YCBCR420,
+};
+
 /**
  * enum drm_bus_flags - bus_flags info for &drm_display_info
  *
  * This enum defines signal polarities and clock edge information for signals on
  * a bus as bitmask flags.
@@ -697,14 +722,14 @@ struct drm_display_info {
 	/**
 	 * @subpixel_order: Subpixel order of LCD panels.
 	 */
 	enum subpixel_order subpixel_order;
 
-#define DRM_COLOR_FORMAT_RGB444		(1<<0)
-#define DRM_COLOR_FORMAT_YCBCR444	(1<<1)
-#define DRM_COLOR_FORMAT_YCBCR422	(1<<2)
-#define DRM_COLOR_FORMAT_YCBCR420	(1<<3)
+#define DRM_COLOR_FORMAT_RGB444		(1 << DRM_OUTPUT_COLOR_FORMAT_RGB444)
+#define DRM_COLOR_FORMAT_YCBCR444	(1 << DRM_OUTPUT_COLOR_FORMAT_YCBCR444)
+#define DRM_COLOR_FORMAT_YCBCR422	(1 << DRM_OUTPUT_COLOR_FORMAT_YCBCR422)
+#define DRM_COLOR_FORMAT_YCBCR420	(1 << DRM_OUTPUT_COLOR_FORMAT_YCBCR420)
 
 	/**
 	 * @panel_orientation: Read only connector property for built-in panels,
 	 * indicating the orientation of the panel vs the device's casing.
 	 * drm_connector_init() sets this to DRM_MODE_PANEL_ORIENTATION_UNKNOWN.
@@ -712,14 +737,15 @@ struct drm_display_info {
 	 * fb to compensate and gets exported as prop to userspace.
 	 */
 	int panel_orientation;
 
 	/**
-	 * @color_formats: HDMI Color formats, selects between RGB and YCrCb
-	 * modes. Used DRM_COLOR_FORMAT\_ defines, which are _not_ the same ones
-	 * as used to describe the pixel format in framebuffers, and also don't
-	 * match the formats in @bus_formats which are shared with v4l.
+	 * @color_formats: HDMI Color formats, selects between RGB and
+	 * YCbCr modes. Uses a bitmask of DRM_OUTPUT_COLOR_FORMAT\_
+	 * defines, which are _not_ the same ones as used to describe
+	 * the pixel format in framebuffers, and also don't match the
+	 * formats in @bus_formats which are shared with v4l.
 	 */
 	u32 color_formats;
 
 	/**
 	 * @bus_formats: Pixel data format on the wire, somewhat redundant with

-- 
2.53.0

