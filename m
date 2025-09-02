Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A89FD2EBDF0
	for <linux-sunxi@lists.linux.dev>; Tue,  2 Sep 2025 09:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756805797; cv=none; b=hqVQN8LvDhQ3qA3Lo4sjRDeuLqJsgXtdlOrBNqqKSu7yNPH1PDAgoH3EnkJ1FWChzk09zwr0j++6H5USMU4pRmT6sWg2x7H6EpYd3W6e2oUL5T2+7fS4GUd+k1BddvBxCw9uy134RQA764110TqgX+40G343AaoOv6i53UDXT8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756805797; c=relaxed/simple;
	bh=yeV0poUu8BpAChQWv/I5vQlXdhS+Z6/XZIvD0gaRtQ0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VVm9VBXjbbRQ/zrGVCM7oc0OFTnVcfHIQ8SXZx3fzrWayy7AZGXGTHt7p7RLyzEhU6xMk2yuk0LvwocOqPHqnXR8zPsunaYmc2AwHNck39RH/whO5Ay9bD+Yvl0Nye9mjE5AE6hBGTNX43MwU0vEFdUxj4uYIbMDWTtoyFLPBb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jtXYjA6M; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jtXYjA6M"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38A8EC4CEF9;
	Tue,  2 Sep 2025 09:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756805797;
	bh=yeV0poUu8BpAChQWv/I5vQlXdhS+Z6/XZIvD0gaRtQ0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=jtXYjA6Mt2mntpHJqul9Kp8BOBmB2EU11UR9iEkDM6GvzT5R/sL8Ve0KJoo+jHHL6
	 sDgX6XkC3xGr6IR/reU1RljhzjsI73Bwwb6VFs3tXFDNFf3HesvqwwvYNMOuCeQEnb
	 TnlEAoQWGZTlbl/oFCJHwjyDXdrGaKOdwlOLTLPneCTjhQPppxTWmPZwOia67ONwsP
	 A4hIZQ5Cj4kQ79AaohnqLZ/juDvjOvmAypOno1bEKhCqZIsMjHNN7m9CAr/DBCjltM
	 Pubhrr28xjcwBZctk9wB9wu99P6FxZCKsJ3c1ID2f6djwVtpCt2sEwy6LcndYAHUe0
	 q4waFiMRYKCqw==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 02 Sep 2025 11:35:26 +0200
Subject: [PATCH v2 27/37] drm/sun4i: Switch to
 drm_atomic_get_new_crtc_state()
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-drm-no-more-existing-state-v2-27-de98fc5f6d66@kernel.org>
References: <20250902-drm-no-more-existing-state-v2-0-de98fc5f6d66@kernel.org>
In-Reply-To: <20250902-drm-no-more-existing-state-v2-0-de98fc5f6d66@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2246; i=mripard@kernel.org;
 h=from:subject:message-id; bh=yeV0poUu8BpAChQWv/I5vQlXdhS+Z6/XZIvD0gaRtQ0=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBnbdoV7lkjwHP+rvEF/U9XP5Xfesbteif//VTnAfNX7c
 8FbdBm/d0xlYRDmZJAVU2R5IhN2enn74ioH+5U/YOawMoEMYeDiFICJfP/MWM0ybfNxs1XJ/bO2
 1P+c3qi7I47tkqz3yufzn+xiOs35/EPTya1rT27gd5u0//KEtqVF/n6MDUub+MqnpvZy1Kqv47q
 oIbgz+T/38/srhW/OFGy0ubahx/6jp/Q712DvHbe5nzNW7Fc3AQA=
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The sun4i atomic_check implementation uses the deprecated
drm_atomic_get_existing_crtc_state() helper.

This hook is called as part of the global atomic_check, thus before the
states are swapped. The existing state thus points to the new state, and
we can use drm_atomic_get_new_crtc_state() instead.

Signed-off-by: Maxime Ripard <mripard@kernel.org>

---
To: Maxime Ripard <mripard@kernel.org>
To: Chen-Yu Tsai <wens@csie.org>
To: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Samuel Holland <samuel@sholland.org>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-sunxi@lists.linux.dev
---
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c | 3 +--
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
index f97be0040aab29cb4e138fcceb20e90c72db0252..94ac6ad6f30688a048e594811d2ae72aaa44376d 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
@@ -204,12 +204,11 @@ static int sun8i_ui_layer_atomic_check(struct drm_plane *plane,
 	int min_scale, max_scale;
 
 	if (!crtc)
 		return 0;
 
-	crtc_state = drm_atomic_get_existing_crtc_state(state,
-							crtc);
+	crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
 	if (WARN_ON(!crtc_state))
 		return -EINVAL;
 
 	min_scale = DRM_PLANE_NO_SCALING;
 	max_scale = DRM_PLANE_NO_SCALING;
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index a09ee4097537fca8b653f34a833b36b69e343ea5..1f77e1d2984548e746805f8323f537f3b4d93198 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -325,12 +325,11 @@ static int sun8i_vi_layer_atomic_check(struct drm_plane *plane,
 	int min_scale, max_scale;
 
 	if (!crtc)
 		return 0;
 
-	crtc_state = drm_atomic_get_existing_crtc_state(state,
-							crtc);
+	crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
 	if (WARN_ON(!crtc_state))
 		return -EINVAL;
 
 	min_scale = DRM_PLANE_NO_SCALING;
 	max_scale = DRM_PLANE_NO_SCALING;

-- 
2.50.1

