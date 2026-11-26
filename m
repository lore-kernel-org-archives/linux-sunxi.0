Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795729485;
	b=dpKhf0uNi0zlnP3N4V5r+1W70CgDkwS2XwlgTl6UP1rvd6ehpzsWX5VwUlp1JnNEwX84
	 wZ3FjTtZCYQDqvsRcv8AAdnxM29V8iRmlRH5bNQUEv9fCRjUSmZr13V1F7JYEIUtd16aw
	 g8nBCnOqpvk1N2iDuILCZUyAs0p1MGuYkWBEfIoUygLlqKt+jxBAx4BHxXPQU4KZyzSYz
	 Cj+KRjs08xqjPJ3YU3wKcmdmyvo9mvbNMySiYqMqAt+m2Tp7b588YKFuIOP40aG/oL7yB
	 21c9NNRxPE8+SzDxCcSo0ib21geO2RCALKimDST0PPO/YxT2KrMlYg4joGs/mbaNY3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795729485;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Rthem334wkm2a7wmTCRGlWmB/Wf3+iH9fn3pLKOROFg=;
	b=1PjqVV2aTwKqZcS3x4E9dlhbzO23XyEoWAIIaMTkTMTdsCHuUWpqE0kFvrmYpbDgK+xX
	 C/YJHtNt7Romn9k9Qx0wSxYgBCvwF4M6BdWGt0yTByRWcdPLook5m0kV5iMWsTVSRTmiH
	 8ND/NDG65Fd3MmhLNrSWZqVahtFkDOROWURoYySdwkMRGYpLdF6ZH5qiJhINFAvzTDZ/3
	 ngrLKRmox0ofMsKfKpm4j1/vXJhyWJQI4RiiPZaROPynFPLtbQytEXuV2KWLIrfFfdjMH
	 RrTWTCvua+4qGPKkD2EcK90zEZT/B4+LVGxSz6HDcebdGpl6nwwcNmFGbq+bA4ixIvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gxGOjkb2;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5A0460A263C
	for <linux-sunxi@lists.linux.dev>; Thu, 26 Nov 2026 21:44:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5A0460A263C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gxGOjkb2
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4ac109a8a12so4424968f8f.3
        for <linux-sunxi@lists.linux.dev>; Thu, 26 Nov 2026 13:44:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795729483; x=1796334283; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rthem334wkm2a7wmTCRGlWmB/Wf3+iH9fn3pLKOROFg=;
        b=gxGOjkb2bHu46IJNh/sJE4L1Xw39d76XJvisT7i2R6D+Bi26p0HQn6kR8IFF69j6ZX
         JNIZ9WeIsURzroRwYe3Ect9YSI0EaAcwKfbucowaqNIlwXJ8x2s9rPchWP7UQz5m+ggn
         7pA4SHvLdheMi1qG1WGqZaLWLJZsy6DdBbpXs1xrisVJ/UUzndztMJ2SusE64DuC/dm5
         nxYyzjUk0zNnMZZjcJ61KxhxC+sv4Ob1RjTy4XcEBZrn0PYCBPaOOZRSgRykaxoZpuYy
         +2dhX5Jm6rIaX16AYAhUC4UPvQRAg9x8vXyi15natT9AJO2G7H+aIIMya9mzV4s1yO8U
         smwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795729483; x=1796334283;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Rthem334wkm2a7wmTCRGlWmB/Wf3+iH9fn3pLKOROFg=;
        b=RgWpySspbprB1DGvsUSDT/3aeEneMCDhcO4Puj2r+J5y0/3Ej2xYqlxxGXKUwg1gDL
         4h9NuS8v45S5YU6ahwVxiCz+hUs8kZlFC1+V4EFdCgQyeqmLIw9C5BFCAwQAr6B8vfwD
         qiHeDendynA4vn41222rXWhPP6uJA8Yxeh/Q3vJ7/gMQVPwCjlS0w0hVS3h/wPCfruC1
         450JHdAPUbmy9COBwyR37ANoV8lmXxc7zMKCSiNRVhfKUaqiS5wbujHbiifKjsDL3Tsz
         X8rIXG4n1pWs86EhcAzgTILcymO4W3qz/bJbAuwKUzTuzjQrvTQ3ohCLfIB4lXutIpTM
         yGBQ==
X-Forwarded-Encrypted: i=1; AL+hErG0LRpwYSh8qR2WYDuo+1NSfq7j6MuQO8wHv4a3T83t5Od6b9gwRR5FAU7zxUgcZsvk6Y+6+4BqgIX1EA==@lists.linux.dev
X-Gm-Message-State: APuU4Z8v+1YdCqOG97i2gJBuMRFGuzWiA7UyA2Vmte5Ukjk8jQR1QDK+
	SsIRDSdaIxleogv7BrTRz38opeInfzB4NlHPQyy3s0Ql/0XBOjLE77Om
X-Gm-Gg: AZFdTZcQdcm2SNY5KeCbmOTrerqBnTPidoUTwT+oiITn98EHWJ+LyK7C3qFVUpfGG+X
	qz4ck/LvvEdBrSrznyQ3KYLuf6+dY8AURfkqNVmx9ap5TiVH87WGqZ/SQCOvoATE6eZhr3Aqoae
	05Q2QkFMStGsW2jrLDM7zqXetHW0z+OL6h+KVpj/v9fYrnPrZtoldo5/EC6IAOtcIlzg9mAPmPw
	h6qFyKoSlK0jG/wQNlqt+LoZH+Wa20h1tkZ7VR6jYpiWHNODkodUqRZFVDXDMFVutJ1NkVIujxL
	6aWpUt/cc1cc7Gat26QPX/v/w6nvAaku1mHMa3rekr+rYzU6RUJ9kCE9Gu18viAhMKRGyFTyASz
	ktXKGsPFk+mKFweyVESLharL0zm28cGu3cm7WYGE7OJOfa0SKOBR/K581AvXnUbRZY3Z8hgfvYd
	9v5X7K7NK1aexFYNMLCiFG54e5xltPIPtmpUvHIO4th+v5gciUGEMQ1tzF/VinELToFtLXZ4cJ1
	zHeTXu98jPG+iftYf6asTway/oBghWYWACqdwTpElKtnPeQw5W8jrjEIy1YrtzjI3MKEKyDxTOf
	uSDsJ3rdM97viIRGJoAIzozKf99MQ55QpO/X62fy8fsHNx8PWhlz9phDwwqlk7gZu4jwoasbYxW
	gXAlMay9VLGaoHZ6Mjp91eKdm0Iecg1ww+SrTkxcmrThIkj4eTz5WHtX3MpBMLDbmtmNjaW3K5x
	Mv2kOfH1HvQcOV0Ue/eH4FMr5F5bvbTblMWwAbD1xg15mvHrCwpweAfAjfleT0P9FBd26p16L0m
	b0DsyGCspP+uKuguw+McTMvMu3j22TIGfbhu8ZSQA==
X-Received: by 2002:a05:600c:5303:b0:4a2:1a:a11d with SMTP id 5b1f17b1804b1-4bb88785d24mr434400835e9.0.1795729483289;
        Thu, 26 Nov 2026 13:44:43 -0800 (PST)
Received: from jernej-laptop (77-38-7-250.dynamic.telemach.net. [77.38.7.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4abbd84e661sm40403963f8f.18.2026.11.26.13.44.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 13:44:42 -0800 (PST)
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
Subject: [PATCH 03/11] drm/sun4i: Add support for H616 TCON TOP
Date: Thu, 26 Nov 2026 22:44:25 +0100
Message-ID: <20261126214433.3562326-4-jernej.skrabec@gmail.com>
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

TCON TOP in H616 is similar to R40, with the exception of missing DSI
and a different position of the TCON TV1 clock gate, which sits right
after the TCON TV0 gate (bit 21 instead of bit 24).

Make the TCON TV1 gate position a quirk and add support for H616.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_tcon_top.c | 13 ++++++++++++-
 drivers/gpu/drm/sun4i/sun8i_tcon_top.h |  3 ++-
 2 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_tcon_top.c b/drivers/gpu/drm/sun4i/sun8i_tcon_top.c
index 86e1e8fed03a..5ea55a2844a7 100644
--- a/drivers/gpu/drm/sun4i/sun8i_tcon_top.c
+++ b/drivers/gpu/drm/sun4i/sun8i_tcon_top.c
@@ -18,6 +18,7 @@
 struct sun8i_tcon_top_quirks {
 	bool has_tcon_tv1;
 	bool has_dsi;
+	u8 tcon_tv1_gate;
 };
 
 static bool sun8i_tcon_top_node_is_tcon_top(struct device_node *node)
@@ -246,7 +247,7 @@ static int sun8i_tcon_top_bind(struct device *dev, struct device *master,
 		clk_data->hws[CLK_TCON_TOP_TV1] =
 			sun8i_tcon_top_register_gate(dev, "tcon-tv1", regs,
 						     &tcon_top->reg_lock,
-						     TCON_TOP_TCON_TV1_GATE, i++);
+						     quirks->tcon_tv1_gate, i++);
 
 	if (quirks->has_dsi)
 		clk_data->hws[CLK_TCON_TOP_DSI] =
@@ -314,6 +315,7 @@ static void sun8i_tcon_top_remove(struct platform_device *pdev)
 static const struct sun8i_tcon_top_quirks sun8i_r40_tcon_top_quirks = {
 	.has_tcon_tv1	= true,
 	.has_dsi	= true,
+	.tcon_tv1_gate	= TCON_TOP_R40_TCON_TV1_GATE,
 };
 
 static const struct sun8i_tcon_top_quirks sun20i_d1_tcon_top_quirks = {
@@ -324,6 +326,11 @@ static const struct sun8i_tcon_top_quirks sun50i_h6_tcon_top_quirks = {
 	/* Nothing special */
 };
 
+static const struct sun8i_tcon_top_quirks sun50i_h616_tcon_top_quirks = {
+	.has_tcon_tv1	= true,
+	.tcon_tv1_gate	= TCON_TOP_H616_TCON_TV1_GATE,
+};
+
 /* sun4i_drv uses this list to check if a device node is a TCON TOP */
 const struct of_device_id sun8i_tcon_top_of_table[] = {
 	{
@@ -338,6 +345,10 @@ const struct of_device_id sun8i_tcon_top_of_table[] = {
 		.compatible = "allwinner,sun50i-h6-tcon-top",
 		.data = &sun50i_h6_tcon_top_quirks
 	},
+	{
+		.compatible = "allwinner,sun50i-h616-tcon-top",
+		.data = &sun50i_h616_tcon_top_quirks
+	},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, sun8i_tcon_top_of_table);
diff --git a/drivers/gpu/drm/sun4i/sun8i_tcon_top.h b/drivers/gpu/drm/sun4i/sun8i_tcon_top.h
index 2b887470a49f..e775737e69ae 100644
--- a/drivers/gpu/drm/sun4i/sun8i_tcon_top.h
+++ b/drivers/gpu/drm/sun4i/sun8i_tcon_top.h
@@ -21,7 +21,8 @@
 
 #define TCON_TOP_GATE_SRC_REG		0x20
 #define TCON_TOP_HDMI_SRC_MSK			GENMASK(29, 28)
-#define TCON_TOP_TCON_TV1_GATE			24
+#define TCON_TOP_R40_TCON_TV1_GATE		24
+#define TCON_TOP_H616_TCON_TV1_GATE		21
 #define TCON_TOP_TCON_TV0_GATE			20
 #define TCON_TOP_TCON_DSI_GATE			16
 
-- 
2.43.0

