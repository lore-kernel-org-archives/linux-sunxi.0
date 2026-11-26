Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795729490;
	b=IT9DxKCj9JFJsD5pMV7skVvmV8ER0kTp2d7MSvsP9dslbpeSorrL2YqWylDCOZtfHSWM
	 6D6O9UUZJoAk2gw7gcqcCkvn9RvFQklvB6N2hsbFdCL0rhQAfEjPjlRCyCRqQS43Lwxuq
	 DUkrGK3OXqhfmKz0Xuxmx45dNkaxX8lsm68p0Wrf8H297Gj99z/sSZw9qzuqo6gHnKXjw
	 SjUXb3hzeXr88FnZtAkqHVvfdcdGbe/7BnFO+d8N8NKitnNeyLpqT3N/woHTw/E4xOX5L
	 jfnooYY+odACwDlKUbw97XbX0wfFJvIeqvseVvL2jIQzCiYRGc5+NzDPS5eImGQ5aGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795729490;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=acaXZc4OKei2F0ZgQ8y8R54n527Bro3xiFkohRD4bNk=;
	b=mu0IrnAz7VYLLHeTWLx8R6pWe7gpJ9Hk93sif8xyQotrBX2d77NFEcuJjNl475TYIRaN
	 aUxhV+g0RGmoRwFYZnxwIIAtxSSydxdZampJFZzVKOhvYDLT4snY6VcJsHygjApEDFQCl
	 WU1m9OLrGYVsrdBedi07WEmWdaG0fsPIgKJlpkihMFMUUusyqoiAqaZlVgHF+2eZp805j
	 12wn6KK1lfleu49J9EGmXnPwpm4COCcJ84TIlUJ+I4Esz4IwSsysmRno7tZRXgoQJuB12
	 iWQopI5LVmlY11F1nace8RmxNEYL+9o2IUd65MVZnWl1FUk0+J3UyqmcnZhFYpTYQ6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GNgQCA1W;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1AFB606A6BC
	for <linux-sunxi@lists.linux.dev>; Thu, 26 Nov 2026 21:44:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1AFB606A6BC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GNgQCA1W
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4aa5833c263so7192081f8f.2
        for <linux-sunxi@lists.linux.dev>; Thu, 26 Nov 2026 13:44:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795729488; x=1796334288; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=acaXZc4OKei2F0ZgQ8y8R54n527Bro3xiFkohRD4bNk=;
        b=GNgQCA1WdzYuutPD0o6I8cdzNZKQCVWicYUaBtJj02f84CuFE/XD3Bp2HdyHdKMCyi
         mgHyrunOvyY3zoyg6U0rkRi6n8UN3pC8ygbUqfVOf4LZ5i/vYrzzHOsC93JgvILHFKfl
         /mQQkeXuMQVJQGRsETrc2hiG8ycLSG1K3dYX3H4s3dnrHpBUuU+eSzDNocSRoi/I4F4k
         yMOj+/QSFa+ZqLxKihAQwxhnM3QDthPlMpkTTk48LoNBX5gG3X0rubjDFeWjDFf6krQj
         whixcbYpJ1rmmGx0gppyA8GoXNviKMk18EP0/Jf3jO8UHa4lm9S7VlwKuZ76xF8AZi3W
         TJMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795729488; x=1796334288;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=acaXZc4OKei2F0ZgQ8y8R54n527Bro3xiFkohRD4bNk=;
        b=XwdD7m7Px/7prt3/64nSBGrm++l/fYX3df0ZmKmoAOaARz8UQ7eAb/zStznhWOjsxQ
         ucEFIRr0suSFEMRxXI7ryfEVII22i0JACh4IDnDR7Tryu65Ec1Mu/TJwAU5YAwIWDTeX
         Pu7OGgzVI3q6rmPuwd97q6sMM/GT5tPAua+uABqVVT0yOtr+h8dc/I1SWq2l04uxs1bz
         mRir5BhmYEy4HVDPq5YraTeDO+0tWF4vSWeyaK/oVjqWk+eQSaviBitd2DgVSTBLrZuy
         46ruzm7E+y0mHVYroyCXcR50jSry8OaINyRdLiEB+IZJxGz3MiUKWmbjhHf46Uoz/C48
         zhzw==
X-Forwarded-Encrypted: i=1; AL+hErG8R4gQdlgRnxZo1cnT3XyqORHCxOmAGh7gWql+zb+De8FAm4wPhXCgyt/aGeT9GWhNRPZoiNIlCi9F6g==@lists.linux.dev
X-Gm-Message-State: APuU4Z+dE+/Ta4vK0pzOBJmXuNvkTTjSaHbRg9RkSLH7BIgZQwNkKey6
	2H2QsdC9BbMFz5FEU/foqHzXSKU5nEOiKMHRIqvOtOHf1BCffQcEemEu
X-Gm-Gg: AZFdTZfIyzbOWuXPaKowZ+FiwDbAiUy0eSn3EUvy5PcjebbXH8yzCGTtUtsMebf+3Ie
	UeEc8fHqqpsrhSKE0KvZQ6NCYGixDyrVKIorW6vXKJBair8gAH75Wjgtj+wXgXEofIqgWwlda/m
	bpHvorBAHNGAT0R3MxlyEwBHW6445y7gB571utVflpoHwVcnT2UHyIKai2hipCtUFNqoxZ8Md0i
	AgUdxDKoEN6k8jjiunofxkOmbxczqJfiiVvvYnXoWsi7G7Ohoke85Invi4+FPkEriDaI98ZQGDk
	DzsQUlT6w2w3Q7OCl/lH/9sgotrwChk+4qh4rs57l2WemFNxile9B8OARjpqHNGqPPvsw2OysoX
	+IqDs3e+DKPqlDdG1/ebb3eupzmV8zHwSw7qnDx4qsLgGhoRNGWKdNemhVFFQ4jjDTu3cHjxaYH
	47vdInUJiLOJn7oQnTIlD4ErqP1rfYeLn1kSTroXmy+gempugQOheZqjU71ld6SaZ14dpiuyVB4
	7gPuzpt1xJoYTAhzgiruPqZieHj+b49XdfeCP05a6MDsNYZGZWZP0bYLz5FkKgYhGvivIzXwEAF
	sPJGLWgR9DrPwDhZYBjEVNA2974ATTwpCB5mwdF+PpJ7/23A6ql1+VOgmKiVdW429Ye9sjiGH13
	yHy0tUXrqGS/PiJ51hBtweLL96WSP9433ON+lgzTskmezw7nqLaIvpaGNsuUk71+6Y6q5v8GjXQ
	+0Qkp3jhVx0xE/7ftmeXguXxY8pIXSSoAbV+sArb24YEVEdJ+VY4Xopr+/MtuyY3B91O1W9NeDV
	daK+hFKase0L86fSpHxt57i0vIWt5FMrY6poEbDkg==
X-Received: by 2002:a05:6000:2c13:b0:4a7:9630:7b57 with SMTP id ffacd0b85a97d-4abb43dece6mr43971087f8f.44.1795729488089;
        Thu, 26 Nov 2026 13:44:48 -0800 (PST)
Received: from jernej-laptop (77-38-7-250.dynamic.telemach.net. [77.38.7.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4abbd84e661sm40403963f8f.18.2026.11.26.13.44.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 13:44:47 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	jernej.skrabec@gmail.com,
	p.zabel@pengutronix.de,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Andre Przywara <andre.przywara@arm.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 06/11] drm/sun4i: tcon: Add support for R40 LCD
Date: Thu, 26 Nov 2026 22:44:28 +0100
Message-ID: <20261126214433.3562326-7-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126214433.3562326-1-jernej.skrabec@gmail.com>
References: <20261126214433.3562326-1-jernej.skrabec@gmail.com>
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

R40 TCON LCD supports LVDS output. It shares the mux function with
TCON TV, so use the same set_mux callback.

Each TCON LCD has analog registers for both LVDS PHYs. TCON LCD1 drives
the second PHY, so in single link mode it has to program the second
analog register instead of the first one. Add a LVDS PHY setup callback
which selects the register based on the TCON index.

Add support for it.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun4i_tcon.c | 49 ++++++++++++++++++++++++++----
 1 file changed, 43 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/sun4i_tcon.c
index 77b6026bc895..0cbd6ae66c4e 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
+++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
@@ -139,24 +139,25 @@ static void sun4i_tcon_setup_lvds_phy(struct sun4i_tcon *tcon,
 			   SUN4I_TCON0_LVDS_ANA0_EN_MB);
 }
 
-static void sun6i_tcon_setup_lvds_phy(struct sun4i_tcon *tcon,
-				      const struct drm_encoder *encoder)
+static void sun6i_tcon_setup_lvds_phy_reg(struct sun4i_tcon *tcon,
+					  const struct drm_encoder *encoder,
+					  unsigned int reg)
 {
 	u8 val;
 
-	regmap_write(tcon->regs, SUN4I_TCON0_LVDS_ANA0_REG,
+	regmap_write(tcon->regs, reg,
 		     SUN6I_TCON0_LVDS_ANA0_C(2) |
 		     SUN6I_TCON0_LVDS_ANA0_V(3) |
 		     SUN6I_TCON0_LVDS_ANA0_PD(2) |
 		     SUN6I_TCON0_LVDS_ANA0_EN_LDO);
 	udelay(2);
 
-	regmap_update_bits(tcon->regs, SUN4I_TCON0_LVDS_ANA0_REG,
+	regmap_update_bits(tcon->regs, reg,
 			   SUN6I_TCON0_LVDS_ANA0_EN_MB,
 			   SUN6I_TCON0_LVDS_ANA0_EN_MB);
 	udelay(2);
 
-	regmap_update_bits(tcon->regs, SUN4I_TCON0_LVDS_ANA0_REG,
+	regmap_update_bits(tcon->regs, reg,
 			   SUN6I_TCON0_LVDS_ANA0_EN_DRVC,
 			   SUN6I_TCON0_LVDS_ANA0_EN_DRVC);
 
@@ -165,11 +166,17 @@ static void sun6i_tcon_setup_lvds_phy(struct sun4i_tcon *tcon,
 	else
 		val = 0xf;
 
-	regmap_write_bits(tcon->regs, SUN4I_TCON0_LVDS_ANA0_REG,
+	regmap_write_bits(tcon->regs, reg,
 			  SUN6I_TCON0_LVDS_ANA0_EN_DRVD(0xf),
 			  SUN6I_TCON0_LVDS_ANA0_EN_DRVD(val));
 }
 
+static void sun6i_tcon_setup_lvds_phy(struct sun4i_tcon *tcon,
+				      const struct drm_encoder *encoder)
+{
+	sun6i_tcon_setup_lvds_phy_reg(tcon, encoder, SUN4I_TCON0_LVDS_ANA0_REG);
+}
+
 static void sun4i_tcon_lvds_set_status(struct sun4i_tcon *tcon,
 				       const struct drm_encoder *encoder,
 				       bool enabled)
@@ -1410,6 +1417,27 @@ static int sun6i_tcon_set_mux(struct sun4i_tcon *tcon,
 	return 0;
 }
 
+static void sun8i_r40_tcon_setup_lvds_phy(struct sun4i_tcon *tcon,
+					  const struct drm_encoder *encoder)
+{
+	unsigned int reg = SUN4I_TCON0_LVDS_ANA0_REG;
+	struct device_node *port;
+
+	/*
+	 * Each TCON LCD has analog registers for both LVDS PHYs. TCON LCD1
+	 * drives the second LVDS PHY (LVDS1 pins), so in single link mode
+	 * it has to configure its second analog register.
+	 */
+	port = of_graph_get_port_by_id(tcon->dev->of_node, 0);
+	if (port) {
+		if (sun4i_tcon_of_get_id_from_port(port) == 1)
+			reg = SUN4I_TCON0_LVDS_ANA1_REG;
+		of_node_put(port);
+	}
+
+	sun6i_tcon_setup_lvds_phy_reg(tcon, encoder, reg);
+}
+
 static int sun8i_r40_tcon_tv_set_mux(struct sun4i_tcon *tcon,
 				     const struct drm_encoder *encoder)
 {
@@ -1521,6 +1549,14 @@ static const struct sun4i_tcon_quirks sun8i_a83t_tv_quirks = {
 	.has_channel_1		= true,
 };
 
+static const struct sun4i_tcon_quirks sun8i_r40_lcd_quirks = {
+	.supports_lvds		= true,
+	.has_channel_0		= true,
+	.set_mux		= sun8i_r40_tcon_tv_set_mux,
+	.dclk_min_div		= 1,
+	.setup_lvds_phy		= sun8i_r40_tcon_setup_lvds_phy,
+};
+
 static const struct sun4i_tcon_quirks sun8i_r40_tv_quirks = {
 	.has_channel_1		= true,
 	.polarity_in_ch0	= true,
@@ -1562,6 +1598,7 @@ const struct of_device_id sun4i_tcon_of_table[] = {
 	{ .compatible = "allwinner,sun8i-a33-tcon", .data = &sun8i_a33_quirks },
 	{ .compatible = "allwinner,sun8i-a83t-tcon-lcd", .data = &sun8i_a83t_lcd_quirks },
 	{ .compatible = "allwinner,sun8i-a83t-tcon-tv", .data = &sun8i_a83t_tv_quirks },
+	{ .compatible = "allwinner,sun8i-r40-tcon-lcd", .data = &sun8i_r40_lcd_quirks },
 	{ .compatible = "allwinner,sun8i-r40-tcon-tv", .data = &sun8i_r40_tv_quirks },
 	{ .compatible = "allwinner,sun8i-v3s-tcon", .data = &sun8i_v3s_quirks },
 	{ .compatible = "allwinner,sun9i-a80-tcon-lcd", .data = &sun9i_a80_tcon_lcd_quirks },
-- 
2.43.0

