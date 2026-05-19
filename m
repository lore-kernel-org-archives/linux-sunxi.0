Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2927D40C5B6;
	Tue, 19 May 2026 09:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779181338; cv=none; b=pC2b8OlBVidAfuTOG3q/NAPHKoJhlmYOQ49dbyfXpPfExuz38o83+qdDSQXRiUDY76tBICDN5GZFyFCiC2Zcuob9F+6EZR5jf3CHem4iSitMP80Z560d3J7fEf4ZEN8GfNsd960vZdzaliMVJCUyiJ6cfTAS8cwR4ndMtXEjxTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779181338; c=relaxed/simple;
	bh=fl6z0LfliVCc5jA4Pfmq25TAh8lEdW0hYIuxPKlSz3I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OzgV9BSYi0ICd7WkAOFv5BdzhPEs+5KMATOX4VNW7LPnZ1UGgLwb6prXkMEc0Gji6e9mFX4Zrs0DukxOgnDtagwiVAX39vmJMpSMJr+2K93JBBdBVjVqvJK9/ofgeLpKW/5xc0GKHbCbGqWILR6jqbk6YxErS+94yuoe2Qeqmys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B/6XRxVF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B/6XRxVF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C8F1C2BCC9;
	Tue, 19 May 2026 09:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779181338;
	bh=fl6z0LfliVCc5jA4Pfmq25TAh8lEdW0hYIuxPKlSz3I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=B/6XRxVF+FpXQgL8BoJZOxX6PVLvnqXcsrd7aLXxExAs8GRPQ9CLlfcqbTGi1aZgw
	 ZvZS5+LjJmcy49xtL4NJDuxDbrfdkZQCaP4NpBripws3Lo2v5CC+w8MCKumU3pA3gU
	 HWW/YgYYSojKyLA9pgVrpfYADIGvQq0NUvmepK08wkARd5aJqMSHhbfvVNOHApvsiU
	 vS+iA3n8Tq7QHsiPuIPwvOpqJrVEDPsnV9QatXFBid7F8dtNcHA415gx/iZC/yfu55
	 c01zMxgDbOd5jARw+tkOAbMkolUJc6qWDGm92ntPCZpl9McMRmQeVpzSKul5yFSV+p
	 hd6gBghJJ2fyQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 19 May 2026 11:01:46 +0200
Subject: [PATCH v5 04/19] drm/atomic: Expand atomic_create_state
 expectations for drm_private_obj
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-drm-mode-config-init-v5-4-388b03321e38@kernel.org>
References: <20260519-drm-mode-config-init-v5-0-388b03321e38@kernel.org>
In-Reply-To: <20260519-drm-mode-config-init-v5-0-388b03321e38@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Jyri Sarha <jyri.sarha@iki.fi>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Simon Ser <contact@emersion.fr>, Harry Wentland <harry.wentland@amd.com>, 
 Melissa Wen <mwen@igalia.com>, Sebastian Wick <sebastian.wick@redhat.com>, 
 Alex Hung <alex.hung@amd.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, Chen-Yu Tsai <wens@kernel.org>, 
 Samuel Holland <samuel@sholland.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Daniel Stone <daniels@collabora.com>, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 Maxime Ripard <mripard@kernel.org>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1304; i=mripard@kernel.org;
 h=from:subject:message-id; bh=fl6z0LfliVCc5jA4Pfmq25TAh8lEdW0hYIuxPKlSz3I=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFk8ar9MTkz7x6t9ZtrV2l9XAjkUQoTSGrxtGl4vmRXMZ
 SZeVazeMZWFQZiTQVZMkeWJTNjp5e2LqxzsV/6AmcPKBDKEgYtTACaimMhYX53Parrq6BOfv7fX
 Ktq2P53w6cuX+7pq+gr5kd+/WAifelDpoKAgICGme2belts22RJLGBs2W8owecovKa9rjDyWYT7
 37n2HyYtnlRe3P8y+teAOw5HMmO0PdisYf2brNO2+v3HdOjMA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The atomic_create_state callback documentation for planes, CRTCs, and
connectors explicitly states the expected behaviour: the returned
state must not be assigned to the object's state pointer, and hardware
must not be touched.

The drm_private_state_funcs.atomic_create_state documentation is
missing this clarification. Add it for consistency.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 include/drm/drm_atomic.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
index 1a80a8cdf269..88087910ab1a 100644
--- a/include/drm/drm_atomic.h
+++ b/include/drm/drm_atomic.h
@@ -263,11 +263,14 @@ struct drm_private_state;
 struct drm_private_state_funcs {
 	/**
 	 * @atomic_create_state:
 	 *
 	 * Allocates a pristine, initialized, state for the private
-	 * object and returns it.
+	 * object and returns it. This callback must have no side
+	 * effects: in particular, the returned state must not be
+	 * assigned to the object's state pointer and it must not affect
+	 * the hardware state.
 	 *
 	 * RETURNS:
 	 *
 	 * A new, pristine, private state instance or an error pointer
 	 * on failure.

-- 
2.54.0

