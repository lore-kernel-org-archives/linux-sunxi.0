Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B3D328ECF4
	for <linux-sunxi@lists.linux.dev>; Wed,  7 May 2025 20:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746649360; cv=none; b=GHzixQSvaQTiHl9aTGV8B15GCVlrn76v05FiHWDp0YnV2F9pUhZd8df6K4kECAYtw3UIfK+DU2gOSowIZD1USV65ZPqyrkfAyOVym1bSFKCMzU81G32rZMYCjuA3afQhHC4+nBjSPbrSW3lVVyMX6JL7pL8GOliICjOKklVIqp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746649360; c=relaxed/simple;
	bh=3jBDFCQbAgO97/OKa/61A175wN0Waxqcr5J2XffU1Cw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n2Bl/jnTra/eUT9z9zgY9zCGDHfW1l4Yw0ugqi0FdLp38jiL18rK6uRaL58RJidRg1E91YByu4pYSdpRVhGtDhL7oUkWVwq1vV8ObAsbTTyRAxA87SwKGFsZ2/+d4DlpsXkccSUOTVL2EIV71UF6D3EH1ZuvoMHsYQFps89/M+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fbRR1HAU; arc=none smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fbRR1HAU"
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-72ecb4d9a10so146867a34.3
        for <linux-sunxi@lists.linux.dev>; Wed, 07 May 2025 13:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746649357; x=1747254157; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9sbHd8gUlvuYnzn7gA8PnML99Gdixf1hIAz0N6qS0P4=;
        b=fbRR1HAUHEvNC8aNgBy0BhLyOHpAFOCIyr36okW3Kf43opQPyc5Z3+CvMMQYpF2chY
         y4Km0cxGwryPC3+ZgkjFKjWKpp9TroRmXuW8NcxqrlZw/7YFPIC64Vw9gRys3bpyj6WX
         7XnG6y6+ykgSwlbHW37cxnP0P+RUaeQjZPMJGIfOCpJ4YbDDXRQ0+SPv2uG/TrpLhlRY
         xsxgzN6YlUGPyH75r5Xx8RAfUyMD7YiN0saXgLOiKg47CZ1yWAg1CkiA6WbRpBqH/Y64
         rkXcDaSTpWSh/JCtfp4uLfx9ZlNLheubN/MeYWNwJqTieakU2feiTXjGrHlAYy7Lx4so
         RLUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746649357; x=1747254157;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9sbHd8gUlvuYnzn7gA8PnML99Gdixf1hIAz0N6qS0P4=;
        b=S9NaW+bnodSqoiXHWyrTkdhsbpnfk/arRvsldJA4x2iMAPgioZQnFVKyHZlFL7mjtA
         VNjvrD0qeXL+vTDDFzHc6ES1mIRS4WRoUKn6+gNqMemYC6lEqH7+fnvxyWrb5AmZuHCX
         8oLqDnowtGN3NcGcBVvQJ6c1hxuDcFM0xZulKzGfMwrVTwLhxy6L6Ap5r8RY6DkDyO1L
         fYnbvppFWONWutaoOnT8KxHkmaw9DRNRM+V1kHiObB8uGoEjd7ZQAYVzZmIKheeuCWll
         aukUaujP/ZBObviePXSd+mOvZIa8NaFbcPmi7xnllwVY+juGI5O7yb3dsyFja/ThG/gr
         DdzQ==
X-Gm-Message-State: AOJu0Yytg3S9W1dtQdmITb9VrIk1Dorh6nvKl272VOXQgcAruPf4oGUt
	Yr3GdWUV9MQyu9NFYOSQrQw2hDnl5JLga07OWOJKXqmYYxLnUk2znbyStA==
X-Gm-Gg: ASbGncsyUDUKP4+TVMdtlqClTtwjiQ+jVAyThPiY7lVHW1UmEuvY3arnpppsSWCOvc8
	i+fPbIjtOMPhBCyobFqBsUqSl9hOxrBxMKmZj8MBLbOM6z46xK8myZekBIMoijve5PHH9kyWG1m
	eKN39qS2zwJtSDvLpDDLUGqVXkmc3dJNMjOrVL7cSJlFdiq8D/FDuM6wsgZDhTWYFNDhTkojQwz
	g8Lt0GargXsn2EcqrdWNoVUdzJJApL99aHE57isyLBpzXi5qUiPOaDMwfkX++868e1SiQvz/M9s
	BbMIEEYrQdiJREKPh4+UNmMQdceuy9/TvaCUsNn/8/pS6M2t4usOJXv6eWDQ
X-Google-Smtp-Source: AGHT+IGe5N0nyCvS6qJkMbvSVFVtMjpTu1pefglJ9Uyewgv0lTh7SnRx1w9QVAtXhBd2yib+n33BeA==
X-Received: by 2002:a05:6830:368d:b0:72b:9506:8db1 with SMTP id 46e09a7af769-73210a6952cmr3059070a34.4.1746649357459;
        Wed, 07 May 2025 13:22:37 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bcf:e46c:46ba:cecd:a52c])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-732109df2dcsm725945a34.9.2025.05.07.13.22.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 13:22:37 -0700 (PDT)
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
Subject: [PATCH V9 13/24] drm: sun4i: de33: mixer: add mixer configuration for the H616
Date: Wed,  7 May 2025 15:19:32 -0500
Message-ID: <20250507201943.330111-14-macroalpha82@gmail.com>
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

The H616 (and related SoC packages sharing the same die) carry the new
DE33 display engine.

Add the mixer configuration and a compatible string for the H616 to the
mixer.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Ryan Walklin <ryan@testtoast.com>
Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
Changelog v7..v8:
- Separate DE33 support and H616 enablement in the mixer.
---
 drivers/gpu/drm/sun4i/sun8i_mixer.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
index 0d4695132dae..f774b693634d 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
@@ -799,6 +799,17 @@ static const struct sun8i_mixer_cfg sun50i_h6_mixer0_cfg = {
 	.vi_num		= 1,
 };
 
+static const struct sun8i_mixer_cfg sun50i_h616_mixer0_cfg = {
+	.ccsc		= CCSC_MIXER0_LAYOUT,
+	.de_type	= sun8i_mixer_de33,
+	.mod_rate	= 600000000,
+	.scaler_mask	= 0xf,
+	.scanline_yuv	= 4096,
+	.ui_num		= 3,
+	.vi_num		= 1,
+	.map		= {0, 6, 7, 8},
+};
+
 static const struct of_device_id sun8i_mixer_of_table[] = {
 	{
 		.compatible = "allwinner,sun8i-a83t-de2-mixer-0",
@@ -844,6 +855,10 @@ static const struct of_device_id sun8i_mixer_of_table[] = {
 		.compatible = "allwinner,sun50i-h6-de3-mixer-0",
 		.data = &sun50i_h6_mixer0_cfg,
 	},
+	{
+		.compatible = "allwinner,sun50i-h616-de33-mixer-0",
+		.data = &sun50i_h616_mixer0_cfg,
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, sun8i_mixer_of_table);
-- 
2.43.0

