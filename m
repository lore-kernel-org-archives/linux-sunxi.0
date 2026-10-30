Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793373336;
	b=tg4FaDz+Fb5l/96qkR4YlYChhfY6rKzWSaQI9WEfBHoHLVno9m3md76cBrFI9z1gfMxf
	 8vQ8bOM2VacPeIG5TtYFIGFXSFHsiqEgPx3CHA3JLT8it7rP1EFRDYTUF+3mt/ppguEbI
	 0+9StNfRKxAy+bUKwWc0aCoYr6y9NQGF2ZPRPukuHzZfNzspylK1gEL0VN48oYM2J3Hp5
	 qq+S5H/jYnK2tM53rjR7iZKrj3G2oDxETcYdQE9/NiRf55heIKA5s29sGddNlnePJW1aE
	 VzQLe0aieoM2KODabffOr5kaakyNXTskukAIjcPF+l9GdcdZJfcOwp4F0CUM4w0uIRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793373336;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=LUcl12gwkN8B7VfualkhTFi3SbBn5mj0wBC5eClpxhE=;
	b=X+7m84GORO/SF4zQsOPK/wqWWE8WggA1AiNMYipZDEVJ/139+JTl5cQDmyKkm4PpGUqe
	 rHAZRHnxgAPIqW6qtSgnPiWddfTALE69Ksh4+/sDaXaAZRVav0k6qJDx84YACe+vV/R1E
	 LL4lADmnE2v9lI4kHHE+s73N4WPplYlTMsQXmXJ+p8HNDXCZ2PhusKE/AUEPFhr4PTDne
	 m2L8eOKwAD053L1EpbC28J2Z5OzOjlKvSsvogNrtCpy7/713DKp/3apLStgHwTQOhAlYl
	 T1+rSr2Nef+wmcsNU2q+qMlabkekkuSO0IJxfZpLANzBXmq4Qo7jmk5H6iA8EfRhurg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="iD/Ne4uY";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC8B4606A31E
	for <linux-sunxi@lists.linux.dev>; Fri, 30 Oct 2026 15:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iD/Ne4uY
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1F301F000C1;
	Fri, 30 Oct 2026 15:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793373335;
	bh=LUcl12gwkN8B7VfualkhTFi3SbBn5mj0wBC5eClpxhE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=iD/Ne4uY7v+U5YAr0XbBd5Qow1l2PqW8dAcGe5ay+ik+lnKV/MS4S5GoYojyZesgq
	 YQHZJftdOBS+Xm/xprD9O9tUTYoJWYX80nLQd0IODJqD1luIShfl3gNnwvKSc9Ovbe
	 /7IxTGsPWmbAeg9ELNmhphsEsGTfBniMEBYAvmKgoeDZrMRhWEkxwJUa83YCt1wJgq
	 4SqBHSyQDxrpS+nPV8DPrWQOVBCHudtOk1iLWJOWw5Ko5UBQr/4YRGsAKOlQaEPH86
	 uqVsm5QNo6osujXLkCuISRm5/mgR9Nkg2NXsmgVVArjKjXn5ttPeVnp5f8LuSVuQfU
	 3Efaqwy0c80oQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Fri, 30 Oct 2026 16:13:58 +0100
Subject: [PATCH v3 28/37] drm/sun4i: hdmi: Convert to atomic_create_state
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261030-drm-no-more-connector-reset-v3-28-30e71d92c327@kernel.org>
References: <20261030-drm-no-more-connector-reset-v3-0-30e71d92c327@kernel.org>
In-Reply-To: <20261030-drm-no-more-connector-reset-v3-0-30e71d92c327@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Samuel Holland <samuel@sholland.org>, 
 linux-sunxi@lists.linux.dev
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2001; i=mripard@kernel.org;
 h=from:subject:message-id; bh=w9nESPjYXbVij1sc0qXET6/o4C+Z94CFJROMxWaY4s4=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFlPtmh+X31hf9opsy+PGFm/MskJrL0UzT79le/fB7+/F
 6t3/Jkb1DGVhUGYk0FWTJHliUzY6eXti6sc7Ff+gJnDygQyhIGLUwAmciSAsVbWPrFHf7dFzpIk
 xsC09L6uA9tSRZL/3im/Zn7Darr9kUsyj6xereKRYlvA0/1wxRvbAsb6wPM5v9RiTuhEP03d/G3
 j7/3ucyp14nRuPNZe/vObmfK0O/PFplt/FpJI6/c/0xMqGrIXAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The sun4i HDMI connector reset implementation creates a pristine
state and initializes the HDMI state. It does not perform any
hardware reset.

Since this is equivalent to what atomic_create_state expects, convert
the reset function to an atomic_create_state hook that returns the
initialized state.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
Cc: Chen-Yu Tsai <wens@kernel.org>
Cc: Samuel Holland <samuel@sholland.org>
Cc: linux-sunxi@lists.linux.dev
---
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
index 3084f6570c29..58626d0562ae 100644
--- a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
+++ b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
@@ -291,9 +291,17 @@ sun4i_hdmi_connector_detect(struct drm_connector *connector, bool force)
 }
 
-static void sun4i_hdmi_connector_reset(struct drm_connector *connector)
+static struct drm_connector_state *
+sun4i_hdmi_connector_create_state(struct drm_connector *connector)
 {
-	drm_atomic_helper_connector_reset(connector);
-	__drm_atomic_helper_connector_hdmi_state_init(connector->state,
+	struct drm_connector_state *connector_state;
+
+	connector_state = drm_atomic_helper_connector_create_state(connector);
+	if (IS_ERR(connector_state))
+		return connector_state;
+
+	__drm_atomic_helper_connector_hdmi_state_init(connector_state,
 						      connector);
+
+	return connector_state;
 }
 
@@ -302,5 +310,5 @@ static const struct drm_connector_funcs sun4i_hdmi_connector_funcs = {
 	.detect			= sun4i_hdmi_connector_detect,
 	.fill_modes		= drm_helper_probe_single_connector_modes,
-	.reset			= sun4i_hdmi_connector_reset,
+	.atomic_create_state	= sun4i_hdmi_connector_create_state,
 	.atomic_duplicate_state	= drm_atomic_helper_connector_duplicate_state,
 	.atomic_destroy_state	= drm_atomic_helper_connector_destroy_state,

-- 
2.55.0

