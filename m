Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59CB93793A5;
	Thu,  5 Mar 2026 09:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772701538; cv=none; b=uzEcxAYos6b/SwqOOm05yfGL6sTtaw4V8uuT2WQOD4cysh1yPg4jYEWdCVH8KRlVAOyIAvpkWcX/mNcsQB90DVj9WPGrb7B7weJ//XNvvFKpqNclPT99SQBcDe+tYVCS1hHPb1n0yFgTvfyJcelA46zvjSTML3GkzWd9ZzS9FAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772701538; c=relaxed/simple;
	bh=uP3ezNFnJxO2oGz8kzraRalxMbsjayeIpXlAa0HLzJU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fzYEBYN9VTAN7K2QOZK7S868hPwew1xwPZ/PY2x63e7jiT/j2q/cWguBvDJsiBywQAP3HQRBwFS/5apK1y93rSWqYh+JioKAh6LsdYYTY1n6dAHCqsQASb5ojU4PcHPeee9D98hAy6GZr/cDhbu7JbzJ5pSpsxDNVT+BH5mqe+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mi+CmIBz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mi+CmIBz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6838DC2BC9E;
	Thu,  5 Mar 2026 09:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772701537;
	bh=uP3ezNFnJxO2oGz8kzraRalxMbsjayeIpXlAa0HLzJU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Mi+CmIBzbKeQdabEIDe4sqxkKLNPn7IbpoCDNPNi+xxlv89Zv4SZwkQqXjC1ZRjVi
	 W/4+W4CdxEcQiK9zsdr7n3u8Q+kObc0cTt47zrbkOi4GPhXNkc5j7Ni4Sq9t20h1Eb
	 1QHn5Jns8P++/SvucsbzXAGInb6R5G4UNKf6izIJByaD1CBFHK8F3VxWm3zjh9Gn8U
	 jh3eLS3jGPZ7eQ0JBQtUFJEZMFzRqYGCkjfntmUEMylhUhZwTVBzMBdHQJNxQkSmy+
	 mkgK3g78mzilKqZGDz0zBqlT5yY/EUWKZ+TPPyVSspwJ6MAKL4e+QHx+jleqLRZ2B3
	 Psq3n5XBiwskQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Thu, 05 Mar 2026 10:05:04 +0100
Subject: [PATCH v3 12/14] drm/rockchip: analogix: Convert to
 drm_output_color_format
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-drm-rework-color-formats-v3-12-f3935f6db579@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1938; i=mripard@kernel.org;
 h=from:subject:message-id; bh=uP3ezNFnJxO2oGz8kzraRalxMbsjayeIpXlAa0HLzJU=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDJkr3a1P2TEnX7XTmTdDSe2K0W07LyvZW1fFQlsr3J5km
 Kw7q7+yYyoLgzAng6yYIssTmbDTy9sXVznYr/wBM4eVCWQIAxenAEzkkThjvY/UOpf+3uy9efsv
 RofOPqZfM79V+ll//nGDmB3HZv2LLTILTihYazGFRSPV2SPpwrntjA0TmwUUdzFafM2czcX0ni/
 SZoKmyPXqeXyRZVlbqjR/PLM0r6uep8aXnBMsf5ml2an4MQA=
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

Acked-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/rockchip/analogix_dp-rockchip.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
index fdab71d51e2a71d644f128b1bf1c39429b4ad52a..96bd3dd239d251af3d5a7d0fbd4dd74942d44f2d 100644
--- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
@@ -169,16 +169,16 @@ static int rockchip_dp_powerdown(struct analogix_dp_plat_data *plat_data)
 static int rockchip_dp_get_modes(struct analogix_dp_plat_data *plat_data,
 				 struct drm_connector *connector)
 {
 	struct drm_display_info *di = &connector->display_info;
 	/* VOP couldn't output YUV video format for eDP rightly */
-	u32 mask = DRM_COLOR_FORMAT_YCBCR444 | DRM_COLOR_FORMAT_YCBCR422;
+	u32 mask = BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR444) | BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR422);
 
 	if ((di->color_formats & mask)) {
 		DRM_DEBUG_KMS("Swapping display color format from YUV to RGB\n");
 		di->color_formats &= ~mask;
-		di->color_formats |= DRM_COLOR_FORMAT_RGB444;
+		di->color_formats |= BIT(DRM_OUTPUT_COLOR_FORMAT_RGB444);
 		di->bpc = 8;
 	}
 
 	return 0;
 }

-- 
2.53.0

