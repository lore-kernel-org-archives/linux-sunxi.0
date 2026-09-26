Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57BCE395AF0
	for <linux-sunxi@lists.linux.dev>; Sat, 26 Sep 2026 09:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790413541; cv=none; b=A5jJIOLGEvzHahswDM4C5Wl6mcM220OZTYsE17vxc/OSraaBC/IyKSi+OVRD0uzSiWEHUS2+TL0P5j7P+cPwpnT6MdstEbHiygfrVeVuTWE3onDQz379mtsBsnLg0edVFsqMR0bfZ6J9c/HRtPYOBOoK1TA2eKVphHvHKCfv9Vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790413541; c=relaxed/simple;
	bh=bOq/KC7QV2tvJFM35jOsgBb72IHn6gw8K6n9ZJ4bhiQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=mgCL0HASnRcqfQA/IqbdG7pqrpz8c1VM6YYHXlINym4EZBwKwqnyB1uMy1/LGEEYb8L57ptIIS3QRixeONtf8EW1CB7vHnNsB8HFl5KNGef3dTZEpAWcUfAUVqQ6sR5qV/PbV8r3q2OV2TWGyvGsA0OzfzrYrNas6eOEsQQPcMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=embeddedlinux.blog; spf=pass smtp.mailfrom=embeddedlinux.blog; dkim=pass (2048-bit key) header.d=embeddedlinux.blog header.i=@embeddedlinux.blog header.b=yDb/8Wvp; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=embeddedlinux.blog
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=embeddedlinux.blog
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=embeddedlinux.blog header.i=@embeddedlinux.blog header.b="yDb/8Wvp"
Received: by mail-pj2-f43.google.com with SMTP id d9443c01a7336-2db1ca069c8so7462845ad.3
        for <linux-sunxi@lists.linux.dev>; Sat, 26 Sep 2026 02:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=embeddedlinux.blog; s=google; t=1790413540; x=1791018340; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=poyGQFhxfjPpwyIrTQh0fZ+JdUzuLojhwNaxF0pNYJE=;
        b=yDb/8WvpOuVV3ZpIPiOX3q6Htrqw21vQs9EdNjMfKKYaTP9Mz/S0FFZiTTJ3ZPRgHe
         B1mluXLq2FsxPGPiTJlmlt8OsYnc+VTXIj6AcaS/syl85d+Pit2i25EiZBvegIyCtfbN
         UkJWOcnEnYcM+rcLsmAOg+gih5MvdlOuvJK4WPUXaPMadgoK744Bdz0lLPnsJ0DNhUgV
         uYOodTkGqPORE6PCHRWeGOxbK8Fg1VAI89IkIZ6Wg9/EnKX4n2td5b4wQhJaDSklwS7Z
         9JMprGFsKTQtzg15nuF3uDQ+omVUYORJwFRTG30+UuINJR2jFZmnfBes5MTI527N65lu
         tW7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790413540; x=1791018340;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=poyGQFhxfjPpwyIrTQh0fZ+JdUzuLojhwNaxF0pNYJE=;
        b=qCIMdgLnTp5wR0KbheaV65n96xI6CJxa+Ru06yeFjyDGjnRHPR6QPiT8vU8EAndj+B
         kvGpPiGLeFG7n2oAD6Wrdw2dONVRQuOwndkSDY/ou6ITrDzp/ZL6kIqJUF14/gpRkfC4
         AHCO1unlNjUL0rrV7jeYFL5Er+NvcRWuVD0RoL146SEgOG0NpLbIJPf6SC/3hTos3RL0
         umo3xN59s5EZjldsEpCCVzpcyt+6iypSqTeri3v2+GGfyQ1ZFpTDVNxiLjA3i64cil+K
         9Sq45U70j4TIvdZD3GC7HbztK1/aAjidMuiPS1fn/9Dxzb7sgIZ/4mgInxI4PyRmu7hN
         hrVw==
X-Forwarded-Encrypted: i=1; AKwUvBz/OFOQoFuKjLUOE6sF+iFXDTsM5IOqY74AoMALQPt+ZOOEZFET86wO6/u96kBVLC7f4CTlP76nVgRM3g==@lists.linux.dev
X-Gm-Message-State: AFq9FYKwDEeCcikrUBEhtJJ2kLdIzQHkVZ6kWzi+qJ/jrNk/Xd4Wbrqg
	u8MJyB1np1gvaAQR/TGOlI170mgYAQ9ajnHVSEKlwnkWKNicJMVjatIqVtVy1W8uY9oS
X-Gm-Gg: AYBFou1sq1H9m3OhwX5vZEzhfUA90jfjlbp+TFBwHCI5s1/XftUhr91TmKHb73+7raC
	cfhVuDmM/TfDkEGrIerJMfuhQTRj+M2eYHOI1BwSspYyipot7k6yoGfKlufTRvie2CSXxWiHo+U
	CR0gDRSGOpH/0DQj4V5/yPdD/uBSTsZ4PM0aQAXRYzAFHED1sdSmWd1zXQI17oXoz+7GEgib8dT
	LVXQpWUjlt7hmTH9XZudhWQq2OPLGFvTVpF/L69F7M3fcWQzWHFIowHFrvgfS1exLRpLx6TScsn
	Q/oJ16RaUYxv46I42NvTXB9LQbkQMixkxXWUHHsKyvXlwM9O+27T6oDtvcf2h+GApGo9GxDuUbb
	xkelUaYrr1WcL0vrK1LbQCb4hxFwXmfvolunpNBeGwglbkXTCuKp3P8+t4v9ZKB5IlrNz2jD6nB
	8YVweyQcbAz/QLIpW0GrFqMSWR4RYZoimA3kqNtCCDJlXzHN4J1+GLXB9P9SMMmxK0tA==
X-Received: by 2002:a17:90b:3b90:b0:3a0:cbe2:9e00 with SMTP id 98e67ed59e1d1-3a0cbe2a110mr2426179a91.42.1790413539584;
        Sat, 26 Sep 2026 02:05:39 -0700 (PDT)
Received: from ltu.. ([171.245.4.151])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc787959599sm2299078a12.26.2026.09.26.02.05.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 02:05:39 -0700 (PDT)
From: Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	tien.nguyenminh@embeddedlinux.blog
Subject: [PATCH] drm/sun4i: dsi: Get the A100 mod clock at bind time
Date: Sat, 26 Sep 2026 16:05:32 +0700
Message-Id: <20260926090532.126025-1-tien.nguyenminh@embeddedlinux.blog>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The A100 variant gets its module clock from the TCON TOP, which only
registers its clocks when it is bound. Requesting the clock in probe
defers the DSI forever, so the display never comes up on the D1 and
T113, which use this variant:

  sun6i-mipi-dsi 5450000.dsi: Couldn't get the DSI mod clock

Request the clock at bind time instead, as the TCON driver does.

Tested on a T113-S3 with a DSI panel.

Fixes: 4b71e269f5a5 ("drm/sun4i: dsi: Add the A100 variant")
Signed-off-by: Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>
---
 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
index d504ae583..69987bb5b 100644
--- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
+++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
@@ -1062,6 +1062,17 @@ static int sun6i_dsi_bind(struct device *dev, struct device *master,
 	struct sun6i_dsi *dsi = dev_get_drvdata(dev);
 	int ret;
 
+	/*
+	 * This module clock comes from the TCON TOP, which registers it only
+	 * when it is bound, so it cannot be requested in probe.
+	 */
+	if (dsi->variant->has_mod_clk && !dsi->variant->set_mod_clk) {
+		dsi->mod_clk = devm_clk_get(dev, "mod");
+		if (IS_ERR(dsi->mod_clk))
+			return dev_err_probe(dev, PTR_ERR(dsi->mod_clk),
+					     "Couldn't get the DSI mod clock\n");
+	}
+
 	drm_encoder_helper_add(&dsi->encoder,
 			       &sun6i_dsi_enc_helper_funcs);
 	ret = drm_encoder_init(drm, &dsi->encoder, &sun6i_dsi_enc_funcs,
@@ -1160,7 +1171,7 @@ static int sun6i_dsi_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	if (variant->has_mod_clk) {
+	if (variant->has_mod_clk && variant->set_mod_clk) {
 		dsi->mod_clk = devm_clk_get(dev, "mod");
 		if (IS_ERR(dsi->mod_clk)) {
 			dev_err(dev, "Couldn't get the DSI mod clock\n");
-- 
2.34.1

