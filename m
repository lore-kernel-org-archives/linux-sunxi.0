Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0D933D5246;
	Tue, 26 May 2026 16:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779814002; cv=none; b=BuXsAwEGVXmVekPNSnIcJc7/jISykFHDBHncqQUV6aFxybLM1lbKtzLAm7OG4A5Wc3qM1W5c9hUkSwEAxR2+y9zwm2nQ9aNWJ098RHAgRDmMuF7WXr6WE5287OHIytAT1SBf/rgEAOqsJPCJ0c8ygmYexR6brvSWWpPB2Lo767g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779814002; c=relaxed/simple;
	bh=n/67GQpj0Ru2mlwt0tlSurG9lxXxNQPovYWI32eOrM4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UPudzrD70PHhrU5E0tG/ZEmMiXmrvoDonz+lGGoMLuZXBcZITGwRq4i99ygbKLsdZiiZm9dNeESYwuVzxKVUTKZ0tweA8eSEqnFuSADqmAusV+4o1L6OrgoTRfXGP1Ld5NzHMlGkVpM4sZgooW+kNoJKZdfAkqeY4caZei67qWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FKmn1x8y; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FKmn1x8y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5F1E1F00A3C;
	Tue, 26 May 2026 16:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779813997;
	bh=4/rknBNr70r45if1QwPBArgyzcEF7A8MyP7dbsi2SYA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=FKmn1x8yq/bfAFI7Fj7fiincoLAsfTL3wwRPaGECMnMXoy5wP47rCWjrZu2cJ2khM
	 KAlZPOyBZvQBAP/1tK75tnd9c80a4OHxBMqxkYRv4QpMLISI+A9/l7uXcR4f6evcKc
	 dfQNu6owihUzXsq1yNDbDMPqLbrcHzX420WiMBYQ65MciWBt42srQxMjw+LbPfvawL
	 u9ZQHZIjagKcgNzElR4iQViyKogmHeZneAEREbqNzpnYV9rykV+7G97G7VSATIba/1
	 2t5Mq6WHiE6SGtZAdkgQujSff2x3K0kgz/2VLPUyi0RsHF+DyVL3Mc4LMMlWpVU7Y5
	 XMe4+HgbjeDiA==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 26 May 2026 18:46:16 +0200
Subject: [PATCH v6 04/19] drm/atomic: Expand atomic_create_state
 expectations for drm_private_obj
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-drm-mode-config-init-v6-4-852346394200@kernel.org>
References: <20260526-drm-mode-config-init-v6-0-852346394200@kernel.org>
In-Reply-To: <20260526-drm-mode-config-init-v6-0-852346394200@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1358; i=mripard@kernel.org;
 h=from:subject:message-id; bh=n/67GQpj0Ru2mlwt0tlSurG9lxXxNQPovYWI32eOrM4=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFmi5yJ2tyjZc8RMj/+xfcGkDE1t70dzDrAuf7fnoJPqi
 UyRwvxFHVNZGIQ5GWTFFFmeyISdXt6+uMrBfuUPmDmsTCBDGLg4BWAi3fcYG/oiO/Ybtd/kTs/b
 +TQ3T/P0or5lp+Z9MUm9nVx3Js0joWP+XN2DVyRnv98TY3tQbJblQcaGF/u4//hcaLc3U1XjDAy
 y7Lh56fp5vYl2f28e4DP62cAYF1CWFOP7/ZWO5+a9VhtYw1gA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The atomic_create_state callback documentation for planes, CRTCs, and
connectors explicitly states the expected behaviour: the returned
state must not be assigned to the object's state pointer, and hardware
must not be touched.

The drm_private_state_funcs.atomic_create_state documentation is
missing this clarification. Add it for consistency.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
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

