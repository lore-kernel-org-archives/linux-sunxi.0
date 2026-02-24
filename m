Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CD03E555;
	Tue, 24 Feb 2026 10:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771930741; cv=none; b=HF6Zw6k01IBvCZhkZ5ilnQJ6Xlk/cJxaqjGWzSMDhzylBbkpc8G5jY2iLnEPg78XYKYQn8sHo2X7l/b1p7tqWVrLl+Mh4ne1IDwaw9+YFT1zJGlU5YQ8LybaJvUZb0G/yFb7jQ3Y9H+kUqjRBX9eHcufBJx0HXoYijLktU1Qp4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771930741; c=relaxed/simple;
	bh=ZKvkBnB3xt/CIOWr+ipu8RatkK00ap/ffk+JJeo3yXA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kUZiqj16jpHgUUqcsGx5iueLlF5MlG8TnW7AljiSJj5sqtCMhQFvN/AixZ/Z02aiVM8Suu2LvQepG/g8xWIhfdga/8lgx/2dccRiD9U5YZuGaEqYUuOIcvSSrQg6cbA4sGkg5Z/24imtHDADbsx7ZHlwSTwvIhB93To97MmvPhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V4ugw3a/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V4ugw3a/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD70CC2BC9E;
	Tue, 24 Feb 2026 10:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771930741;
	bh=ZKvkBnB3xt/CIOWr+ipu8RatkK00ap/ffk+JJeo3yXA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=V4ugw3a/3zTzo9WcKfqnnYxb9Dh/rIzqOhW9iIKpY9N+Qd68rqkT1P2rYXLGvNeOp
	 VArmC9k4TRJzZVkZWy/yPe0cwi80jDQmcJuZC5Ru6CqRwwo5RgchkoGeEqSS/sFhSZ
	 WfrwrinzIQY129CWn1M9WIe+HOgONovWAUI4nIZK0aQOvfLa/C+p/6EdabDrPXd+Ol
	 4BprtPKSfx5xw1opfmlXhDFjOg7LdSgkq56hmyjLN+O3n8SW948BdSaXH8Rj9qDM4R
	 R2dWTy7vLFv7KlAZPbsXAM4gphhNsyO15MbKwLfodyMbfVGx1f6qfjFZ0koU+U5+tj
	 jh0JG0Szbmysw==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 24 Feb 2026 11:58:42 +0100
Subject: [PATCH 03/14] drm/display: hdmi: Convert to
 drm_output_color_format
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260224-drm-rework-color-formats-v1-3-bebc76604ada@kernel.org>
References: <20260224-drm-rework-color-formats-v1-0-bebc76604ada@kernel.org>
In-Reply-To: <20260224-drm-rework-color-formats-v1-0-bebc76604ada@kernel.org>
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
 linux-sunxi@lists.linux.dev
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3208; i=mripard@kernel.org;
 h=from:subject:message-id; bh=ZKvkBnB3xt/CIOWr+ipu8RatkK00ap/ffk+JJeo3yXA=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDJlzW5JzZb1uNXla55+N4Tf5vPSV+Kwft7p1JjtuOc0TZ
 juBSYi7YyoLgzAng6yYIssTmbDTy9sXVznYr/wBM4eVCWQIAxenAEwk/x1jvXutst2ki3fdLruY
 fZnE6jol/sCCC8/b9GcnhB3y+idXukBtWdyhpcd1j68+qK0/b6nKNcaGF41b56ww/jlzUcvOhzd
 +MsWGctXEzDmdIsel4Dxt/pp9D3ce1rJ26bQrN5H6kiD4N30LAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

Now that we introduced a new drm_output_color_format enum to represent
what DRM_COLOR_FORMAT_* bits were representing, we can switch to the new
enum.

The main different is that while DRM_COLOR_FORMAT_ was a bitmask,
drm_output_color_format is a proper enum. However, the enum was done is
such a way than DRM_COLOR_FORMAT_X = BIT(DRM_OUTPUT_COLOR_FORMAT_X) so
the transitition is easier.

The only thing we need to consider is if the original code meant to use
that value as a bitmask, in which case we do need to keep the bit shift,
or as a discriminant in which case we don't.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/display/drm_hdmi_state_helper.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
index a1d16762ac7a9ebdc48f081c5d2f5e200d406099..f2aec6f65e7a374cea9a1e3adafb4f1cc4d6ab9a 100644
--- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
@@ -426,11 +426,11 @@ sink_supports_format_bpc(const struct drm_connector *connector,
 		 * color_formats field will be blank and not report any
 		 * format supported. In such a case, assume that RGB is
 		 * supported so we can keep things going and light up
 		 * the display.
 		 */
-		if (!(info->color_formats & DRM_COLOR_FORMAT_RGB444))
+		if (!(info->color_formats & BIT(DRM_OUTPUT_COLOR_FORMAT_RGB444)))
 			drm_warn(dev, "HDMI Sink doesn't support RGB, something's wrong.\n");
 
 		if (bpc == 10 && !(info->edid_hdmi_rgb444_dc_modes & DRM_EDID_HDMI_DC_30)) {
 			drm_dbg_kms(dev, "10 BPC but sink doesn't support Deep Color 30.\n");
 			return false;
@@ -446,11 +446,11 @@ sink_supports_format_bpc(const struct drm_connector *connector,
 		return true;
 
 	case HDMI_COLORSPACE_YUV420:
 		drm_dbg_kms(dev, "YUV420 format, checking the constraints.\n");
 
-		if (!(info->color_formats & DRM_COLOR_FORMAT_YCBCR420)) {
+		if (!(info->color_formats & BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR420))) {
 			drm_dbg_kms(dev, "Sink doesn't support YUV420.\n");
 			return false;
 		}
 
 		if (!drm_mode_is_420(info, mode)) {
@@ -478,11 +478,11 @@ sink_supports_format_bpc(const struct drm_connector *connector,
 		return true;
 
 	case HDMI_COLORSPACE_YUV422:
 		drm_dbg_kms(dev, "YUV422 format, checking the constraints.\n");
 
-		if (!(info->color_formats & DRM_COLOR_FORMAT_YCBCR422)) {
+		if (!(info->color_formats & BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR422))) {
 			drm_dbg_kms(dev, "Sink doesn't support YUV422.\n");
 			return false;
 		}
 
 		if (bpc > 12) {
@@ -501,11 +501,11 @@ sink_supports_format_bpc(const struct drm_connector *connector,
 		return true;
 
 	case HDMI_COLORSPACE_YUV444:
 		drm_dbg_kms(dev, "YUV444 format, checking the constraints.\n");
 
-		if (!(info->color_formats & DRM_COLOR_FORMAT_YCBCR444)) {
+		if (!(info->color_formats & BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR444))) {
 			drm_dbg_kms(dev, "Sink doesn't support YUV444.\n");
 			return false;
 		}
 
 		if (bpc == 10 && !(info->edid_hdmi_ycbcr444_dc_modes & DRM_EDID_HDMI_DC_30)) {

-- 
2.52.0

