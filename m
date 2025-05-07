Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0657D28D83A
	for <linux-sunxi@lists.linux.dev>; Wed,  7 May 2025 20:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746649364; cv=none; b=J3A3lL7lIlqwZqQaPeQNdkeJpMgrcdhKv86cLa3BORbbN0SK4cD7SmULrB4JzUT8VfPJ6la9SxnK3a0ia73uQ7D4n3z/qEt1E0Y2FUZEF9q8EqGngCf31/sd7s1cjtyMwZg+ml+bGpow3d3IFKYxm3p+ph+Tzct27RciOjbDHU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746649364; c=relaxed/simple;
	bh=105MDarhqJaX0H3J6r3L38bq+RTGOwx1haSXsEHBquQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g6MyHDz9fXG44ae0T7NJYklRYUN1+Eyugpl1EiDK1uMK9fI+ZI/28MKMyjmJeNAt3x/SkF6c96vSGLVKmVLu7uvc1VANqkk+6lcmL2fGok/H7T0pF2F0z8G21/WyM6ju1TZc1FNI6UXi64u6YBZjTy6oC5JpSiRsLJJG+4hR5UQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZpwNiIOs; arc=none smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZpwNiIOs"
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-7301c227512so140073a34.2
        for <linux-sunxi@lists.linux.dev>; Wed, 07 May 2025 13:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746649362; x=1747254162; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NyxyGKOhdeBoSewax9mMg22YYljQWuA4ui8yO4vMooE=;
        b=ZpwNiIOsVtcBlVK+4J3Cs7K2MLx1H/uHPLLDRpZbfg3YOpUyYtG1AsgWunRaYAgixL
         +eGFIK7P0qLnqiJwNOaMFjDQ9qA/heezyfmX62hdkjl1rGBUct0+N1qpHrBYsq/aDyZb
         NMxrtpd64AKhuU3fEQEIZ7owf8rafRDLVLmNWRvFOLZ0Q+8lwE/Q/LYC3zTKNGRiuh2H
         muxF2wXpuoZKfOaqCTyrKw5+m5BpmJykZfB9LL8DU2c3eKh60fhFuVVPgkIVMUapheZ2
         +wOQXuQ03qPNj0yrL/IylFcNZTMgR4nLYG2hKxMjlehGfzN3IAnMwUm77LGqH7GtzeCq
         H8IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746649362; x=1747254162;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NyxyGKOhdeBoSewax9mMg22YYljQWuA4ui8yO4vMooE=;
        b=B+ZHCQpRvwpTAiwFLGNuWbFbLq65pgGyayO75uooLLaHDx3xtfCvzxH1hiVwxCs0Nu
         D4dWinUCKzZd4jsADfwx/LBWZAChAa1E1sbG7qOpPqE3A6Z3hcgFWiy6xOQ/YNOINt7A
         CtpxEhXyISzGDiSAohAaZoJBcO2I3etQTSMcdQ5cDbPNp2nDGbB6iL7GtFZGqYavN8Me
         CGHPutbep2WFRilPvB1knofL/+kx08LQKgQZamEUMGFSLrv4KY5/yyaDiQNYgJak+nXt
         iBiNf9/LIwBOlHZRH5qhLtBnN8AcySLiLY8cQZpTB9gySueDhrHtDp33NVu4yIf4urBr
         u4EA==
X-Gm-Message-State: AOJu0YzQF+InYFEtfnNK73I0VzUQBodtIk23HEjxFYqOqcFfLqAItKmV
	Wm5/M4N1dT1PrAvhg1sFDxNiCgAtWE/85sfdXRj+oXeepR3TBlF+mZytTw==
X-Gm-Gg: ASbGncsTnNMxy1DmqudKqUAS8yqMlnA6bkyDetN/o9h2NZa77RzP70BoKxfIi8X0xv+
	LX51prBFe3K+E7Dx0TRhWeOLhkkEv0RBnYFvLtGqgjXb9ndqPLUZkPNEzhSffP39gfF/dVSTDjF
	uUyHj8ddaeHHeQEfhoSBHy55m49Nb7Yg6Y6BXyzS+4AXV3t1DUxeUyyQEwymJspkqMEOj+J96nf
	R44TYSbvM50kNgV2YbPLd8Q2JOHG7DQLUw/eUO/VUAyJjpfusYltSXDljjxne/Bd4Y6gVQUYktM
	r+F7xvsosC60X9R3Lc2CkExeNSG6oZ4QvbKdr6HFhVS7xNFxRWRTg4siSh7HzKl2Tq2V74U=
X-Google-Smtp-Source: AGHT+IHjxCL4ilnBbhzBiVvVv0rtl3RMnbLX5YjwRMZiBzGEtkE2X44D+/p+uvnENdOwMRWrcTLoQA==
X-Received: by 2002:a05:6830:90b:b0:72a:d54:a780 with SMTP id 46e09a7af769-73210afb31dmr2552776a34.17.1746649361838;
        Wed, 07 May 2025 13:22:41 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bcf:e46c:46ba:cecd:a52c])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-732109df2dcsm725945a34.9.2025.05.07.13.22.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 13:22:41 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	ryan@testtoast.com,
	macromorgan@hotmail.com,
	p.zabel@pengutronix.de,
	tzimmermann@suse.de,
	maarten.lankhorst@linux.intel.com,
	simona@ffwll.ch,
	airlied@gmail.com,
	mripard@kernel.org,
	samuel@sholland.org,
	jernej.skrabec@gmail.com,
	wens@csie.org,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org
Subject: [PATCH V9 19/24] drm/sun4i: tcon: Add support for R40 LCD
Date: Wed,  7 May 2025 15:19:38 -0500
Message-ID: <20250507201943.330111-20-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250507201943.330111-1-macroalpha82@gmail.com>
References: <20250507201943.330111-1-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

The Allwinner H616 and related SOCs have an LCD timing controller
(TCON) which is compatible with the R40 SOC's controller and existing
sun4i driver. The H616 does not expose this controller but the H700 and
T507 (based on the same die) do. The controller supports LVDS and RGB
output.

Add quirks and compatible string to cover these SOCs.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Ryan Walklin <ryan@testtoast.com>
Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 drivers/gpu/drm/sun4i/sun4i_tcon.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/sun4i_tcon.c
index 960e83c8291d..8cc8488483ec 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
+++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
@@ -1514,6 +1514,14 @@ static const struct sun4i_tcon_quirks sun8i_a83t_tv_quirks = {
 	.has_channel_1		= true,
 };
 
+static const struct sun4i_tcon_quirks sun8i_r40_lcd_quirks = {
+	.supports_lvds		= true,
+	.has_channel_0		= true,
+	.set_mux		= sun8i_r40_tcon_tv_set_mux,
+	.dclk_min_div		= 1,
+	.setup_lvds_phy		= sun6i_tcon_setup_lvds_phy,
+};
+
 static const struct sun4i_tcon_quirks sun8i_r40_tv_quirks = {
 	.has_channel_1		= true,
 	.polarity_in_ch0	= true,
@@ -1555,6 +1563,7 @@ const struct of_device_id sun4i_tcon_of_table[] = {
 	{ .compatible = "allwinner,sun8i-a33-tcon", .data = &sun8i_a33_quirks },
 	{ .compatible = "allwinner,sun8i-a83t-tcon-lcd", .data = &sun8i_a83t_lcd_quirks },
 	{ .compatible = "allwinner,sun8i-a83t-tcon-tv", .data = &sun8i_a83t_tv_quirks },
+	{ .compatible = "allwinner,sun8i-r40-tcon-lcd", .data = &sun8i_r40_lcd_quirks },
 	{ .compatible = "allwinner,sun8i-r40-tcon-tv", .data = &sun8i_r40_tv_quirks },
 	{ .compatible = "allwinner,sun8i-v3s-tcon", .data = &sun8i_v3s_quirks },
 	{ .compatible = "allwinner,sun9i-a80-tcon-lcd", .data = &sun9i_a80_tcon_lcd_quirks },
-- 
2.43.0

