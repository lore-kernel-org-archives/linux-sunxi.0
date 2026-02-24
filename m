Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 581B436BCD5;
	Tue, 24 Feb 2026 10:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771930751; cv=none; b=sbCZFyeVN/mB2QXFA/2Uk+MnsXBegYkX75CFszex6djSzPzaI2IH80E43awmvkQRbpBU9obr4a1FZ04o2tmYmpRYqGVYH5HrGm4BGrbE1TjWT1e1XR6rwlqNbvyegJweIy/M6Izqm50GwU7U7p4A5yUan/hDMxSg24PXEMyIt+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771930751; c=relaxed/simple;
	bh=7/KtWhJvQ/TOu86ebmUf7alrWS4a3MapBsuureVCDek=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n8kqhQl4K/UnmU1RZJC/FAuS3onrd28AD0QbAXQrYQ2qmUl9Omv0LgOA58NhDzQ0QcjBhoSijTz3W3Cl9ND2Umt5idjGUcnP4NGmxUYGF+XNE+KaqyyrDEhPX38YCPUJCrY53xeoicFR/ypvyoezhWmJL7bax4tUMjJpHrhdlsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jjTdEcYc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jjTdEcYc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63CC1C2BCB0;
	Tue, 24 Feb 2026 10:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771930751;
	bh=7/KtWhJvQ/TOu86ebmUf7alrWS4a3MapBsuureVCDek=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=jjTdEcYc2y8QjBhTIAcmHOfH7uUQfaKrr5eJrJdR3mkul0pRDVGfZhYQ+9p5vtdwX
	 a8ZSXNFZzbZnIYaOFtSq0fRtV/pYAfOXXw0wF67geJ3CeMtgdbME85HGacHn5grciE
	 0/6/mD1bhPdfTrA9/QxFYCa/mEiD6ZHEG/lpQjeTunUUnmbMjIC2IPxoTiP6Nkgux9
	 4NryiZgXsZKWC7YNMYn4j8IHt+WRJjHuY2SIUSN4/95mrKnf/G53SWAGqWJz92aFbk
	 eRs6/o/7E+AfXFxp07LmknW7LJFy41lguZjMdf8HgQq6brhAPJtGvUvWUy+y82E2ac
	 YV7ciKXz25Nhg==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 24 Feb 2026 11:58:45 +0100
Subject: [PATCH 06/14] drm/bridge: analogix: Convert to
 drm_output_color_format
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260224-drm-rework-color-formats-v1-6-bebc76604ada@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1699; i=mripard@kernel.org;
 h=from:subject:message-id; bh=7/KtWhJvQ/TOu86ebmUf7alrWS4a3MapBsuureVCDek=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDJlzW1LbOFWTVyl2bH7J+tRpefv6NSGCOaazBDyD93MLd
 55+eC6/YyoLgzAng6yYIssTmbDTy9sXVznYr/wBM4eVCWQIAxenAExERISxYX71B8MjpY0vYqMO
 dPEJeGVNnz6r/uS94NknY53fXVU8K2I8xyqZ9+CB19tPuF1RmCFixNiw9uXxc8w2HTNNfqnsePL
 Uc09K3BvJnLIOEebWRz9D2Sy2yD9veXl8vUwrp9cd+yf6E3YDAA==
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
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index efe534977d12de3383390fb3040bbfa4a99064cc..71e3d2426ab013218ff1bdda70e299a7e5229eec 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -1341,13 +1341,13 @@ static void analogix_dp_bridge_mode_set(struct drm_bridge *bridge,
 		break;
 	default:
 		video->color_depth = COLOR_8;
 		break;
 	}
-	if (display_info->color_formats & DRM_COLOR_FORMAT_YCBCR444)
+	if (display_info->color_formats & BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR444))
 		video->color_space = COLOR_YCBCR444;
-	else if (display_info->color_formats & DRM_COLOR_FORMAT_YCBCR422)
+	else if (display_info->color_formats & BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR422))
 		video->color_space = COLOR_YCBCR422;
 	else
 		video->color_space = COLOR_RGB;
 
 	/*

-- 
2.52.0

