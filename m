Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793565250;
	b=xzF5BpLejamHPbgtNaFtidVF9o6WtQ7WXEBz7z7dR/Y3GJjub6gFtaC521aLIL+ZhmKd
	 i8dvhi2N4DYk5jUX0yOjQKBlEpEvuFZRtP9bEK7px4uVVAfASpDIz6lTkOLbagNdatzLL
	 B+ntVOu3U00tCEHyyWIPDmljeBjbHKwtVF/2ns+GDQkqLMx7gckmO0DeTf+5XK2FDIq6g
	 V7JD4oOJUk4p1yz5d6wu0f0TtHg4/fO6lNXHRzpJiQ6BkzUDW5Ub2oj+J/ElOVCZX1EPH
	 CI5do/zRuAjgqliQhB3mo8Un/ptJnXpwht1fs6df7xRmtJV3iAfwo4hci/HXyx6O8yQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793565250;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=F89725KkjE+kUI5LXBxmdgLNt89Tfm7tC84mMjTHCkI=;
	b=Klgr2ZYaqBXqe8ngY42T1992Ig3pGoj7sVBgHC86136/w/VGJ4LEjX+l1tBa4C3MAqYe
	 0HgwAGKxAqUSExNh6tgFVC0VA30/KV9BuCC4T7V9jdzcmRK7M2Qi7cBsnA9rNJFHaDbKz
	 3L7CORMEqtLbi3K1Tvp5f3hbljF/+66bWJc6SfTC59g6y9SzFaLYPGkgGCmyCvHKZxrAu
	 +UwxPG1YeXwUsexcHyr0MS8wGPkEe9BIk1L2EzeEPTs+j/vq7/Kx00i5OJh6xmRDU1R0Y
	 sbhnMQMKq754gRwJrzLDny+J2tsjmvquTWTZkb3w9n+pEc1SXipMpHt4/2gtp2EIJ/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FSR6XuCr;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7ECB606A326
	for <linux-sunxi@lists.linux.dev>; Sun,  1 Nov 2026 20:34:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7ECB606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FSR6XuCr
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a210470b49so18506155e9.2
        for <linux-sunxi@lists.linux.dev>; Sun, 01 Nov 2026 12:34:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793565248; x=1794170048; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=F89725KkjE+kUI5LXBxmdgLNt89Tfm7tC84mMjTHCkI=;
        b=FSR6XuCrgDAmTHoBkoFAyYnqM78RNwGIRz0nHlzqWBqSsnlbvADPFrXEY0yN6j/MgX
         Xh2ksvEvIS0nHsaZx0ZWPDhhdgJr2ElGkELY1M+w1uHvWEz8pD1SFCW7ShjTQwvj+ga7
         M+shJ2o+PvT1meEzBK0nSluNRchp8FDedte76TbYZ4JXD+5132pwWOPw4kDnX5AK7eHF
         AtsvZr+0dSIx3Li6WyGDL9ttPdRH23iTmsWAZjuFYiqDsKWFhBtoZd4Nrq4RBbpTpWPE
         Z8iP3o9UAHWv33AMO7QsSLjfkT62jRzaPeFgbHRcng+276P5sHu334x4xDV2NG9MPKgz
         /iQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793565248; x=1794170048;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F89725KkjE+kUI5LXBxmdgLNt89Tfm7tC84mMjTHCkI=;
        b=pLIdW64ZhSsjMPZgdcMZNPSkNFSnaW7MALakXv2WRK31SoPZRChph6HG/6h+Wc3xjr
         hVKhN5Ip3Bms0ZPMvvp+FxrQizOy3Y6Qu57/fhXocsK0eb/pwv0nrF4Yo/Ri6DibOr3K
         HI29dzUz8B8er41LHS8dR8gI9l8JdsvSzU8mcErPnOvhxzJBeXy52WcEqE7AFSQeKyAX
         tbitjzV7R+NGoA5M2Lgflgalz8AOtFtQa3ggzmdV2mARm1kWimd0cFrdJ6Ebul3HyOo9
         kM3z/aZIrOumqlKNz2p6h7gpDJV30xs6lKm4OZnpkWJ5sGGLZuVUq96Z/DvtdJbCTIOV
         Wljw==
X-Forwarded-Encrypted: i=1; AKwUvBynyzhQ5F/SLeM07EpV/AbBJ7LzZu7b1294Sw8LLtMARbPYF7zijTFq5pCY5So4UBXw8tHXpXOPQjEO2g==@lists.linux.dev
X-Gm-Message-State: AFq9FYLddJXp1qEvQn4ILkRjtYwLt8TAdRdQ8Y/v/ovPJcIvvyMzyKsR
	0d0BTDIUIjuSDCKwbaSxciUiPWl27ArlhKg0EI5NzT2AYRrGFtoSdmLr
X-Gm-Gg: AYBFou3PyKVP+lo+BGU5IZDAuDD2KCODBx34gyuDOLWEJ/FmOe2g0n2ylKd50NvdrXc
	pf8iCuOFIlFO3jsa+IEdzyxIt8akmNaznL+virglL6PJ13UtxhXLCkqKPwPCarMTGljQyepC3pO
	HhOah7VdJb+biEowaW1nYYkEVoifJDKey5gLjkJ3YvfWFRu6rLXZ3lOqwzvbiG9g7t0g0biEBiy
	LqHCC+7GxWqxR9CpEjoq381/sy+rw2EmXXzPZ64fWJOjxisye2GGMEnyuwJcXzkeHkfOYWdY+tH
	5Qxx3KzQdQgO9WncbD6QrJMdvS+ViIgPXtwvqTdw50oDNxis0JA5p+stm9PTCk9CtM5UtSoXm/5
	fLzNEjU1pDOcc4ye5pj/alIXgP63yNjQs9AozAjA11e4X5iBx6y4e5CotSBCDQ0PxCTsn0S0VjU
	Af4AOAALsCoRASywtAyJ9ltXBKzZwdB3HYw1OQdaZTc9+8QbyqFGUOmDyDsu52qH//zggrGMy+x
	7xUwctp/T7dkmbONbAF0JLbrkCTN62hWgwHrft736cJyYPGeLDTaB28yKm4i/hffeTX6kWv2xbS
	7H/VGNVTM30IyEcAllv1lha5JlELlohwsuFGvvWwbPTs75DHXANT4xJVb6ATFSPgscI61/OB9+9
	2ExYZ2GLeiKAbOE9WoFjQ4iDVx1DkOZYLo3yhP+4scmsc/A==
X-Received: by 2002:a05:600c:1d07:b0:4a2:18d4:f9e0 with SMTP id 5b1f17b1804b1-4ac18c735b3mr192334605e9.25.1793565247854;
        Sun, 01 Nov 2026 12:34:07 -0800 (PST)
Received: from romain-ThinkPad-P14s-Gen-5-AMD.tail433d9c.ts.net ([2001:861:39c2:e340:849f:a468:4121:a85])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ab61d8b9f4sm263946675e9.12.2026.11.01.12.34.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 12:34:07 -0800 (PST)
From: Romain TISSERAND <romain.tisserand@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	sashiko-reviews@lists.linux.dev
Subject: [PATCH] drm/sun4i: dsi: set the connector orientation from the panel node
Date: Sun,  1 Nov 2026 21:34:06 +0100
Message-ID: <20261101203406.1360656-1-romain.tisserand@gmail.com>
X-Mailer: git-send-email 2.43.0
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

sun6i_dsi_attach() only accepts the panel once the DRM device is
registered, and returns -EPROBE_DEFER until then. By that time the
connector can no longer get a "panel orientation" property: it has to be
attached before registration. The fbdev emulation is also set up from the
hotplug event of the attach, so it gets no rotation hint either.

As a result the rotation property of a DSI panel on these SoCs is ignored:
on the PocketGo S30 (A33, 320x480 panel mounted for landscape use,
rotation = <270>) the console and the boot splash stay in portrait.

The panel is a child node of the DSI host, so read its orientation from
the device tree when binding, before the device is registered, and set it
on the connector then.

Signed-off-by: Romain TISSERAND <romain.tisserand@gmail.com>
---
Notes:
- Testing: built with W=1 for arm (multi_v7_defconfig, DRM_SUN6I_DSI=y
  and =m) and arm64 (defconfig, =m), no warnings. Tested on a PocketGo
  S30 (A33, ILI9488 DSI panel, rotation = <270>): on 6.18.54 with the same
  change (6.18 still calls the helper of_drm_get_panel_orientation()) the
  console and plymouth come up in landscape, where they were in portrait;
  on 7.3.1 with this patch the DSI connector reports "panel orientation"
  = "Left Side Up".
  Not tested on other boards; boards without a rotation property keep the
  current behaviour (no property is attached).
- Tool disclosure: this patch was prepared with Claude Opus 5.5
  (Anthropic) as a coding assistant, in an interactive session where I
  asked it to fix the console orientation on the PocketGo S30. It traced
  why the connector never got the orientation, wrote the change and the
  message. I reviewed and understand it, and tested it as described.

 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c | 28 ++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
index d504ae5832..1eb8a4cde0 100644
--- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
+++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
@@ -22,6 +22,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_encoder.h>
 #include <drm/drm_mipi_dsi.h>
+#include <drm/drm_of.h>
 #include <drm/drm_panel.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
@@ -1055,6 +1056,31 @@ static const struct regmap_config sun6i_dsi_regmap_config = {
 	.name		= "mipi-dsi",
 };
 
+/*
+ * The panel only attaches once the DRM device is registered, too late to
+ * give the connector its orientation (the property cannot be added after
+ * registration), so fbcon and the boot splash would not rotate. Read the
+ * orientation from the panel node, a child of the DSI node, at bind time.
+ */
+static void sun6i_dsi_set_panel_orientation(struct sun6i_dsi *dsi)
+{
+	enum drm_panel_orientation orientation;
+	struct device_node *np;
+
+	for_each_available_child_of_node(dsi->dev->of_node, np) {
+		if (of_node_name_eq(np, "port") || of_node_name_eq(np, "ports"))
+			continue;
+
+		if (!drm_of_get_panel_orientation(np, &orientation) &&
+		    orientation != DRM_MODE_PANEL_ORIENTATION_UNKNOWN) {
+			drm_connector_set_panel_orientation(&dsi->connector,
+							    orientation);
+			of_node_put(np);
+			return;
+		}
+	}
+}
+
 static int sun6i_dsi_bind(struct device *dev, struct device *master,
 			 void *data)
 {
@@ -1085,6 +1111,8 @@ static int sun6i_dsi_bind(struct device *dev, struct device *master,
 
 	drm_connector_attach_encoder(&dsi->connector, &dsi->encoder);
 
+	sun6i_dsi_set_panel_orientation(dsi);
+
 	dsi->drm = drm;
 
 	return 0;

base-commit: a1e63ab695ad76850ab9787b9eb6aab695dc2965
-- 
2.43.0

