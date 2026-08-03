Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3841137AA61
	for <linux-sunxi@lists.linux.dev>; Mon,  3 Aug 2026 16:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785773481; cv=none; b=qMTpl/XhCJ6QMhRyt9uI2bYo32P6V0XW09VLJZ+vBwYgANrHt1yYbaMdYBOjlEJUSauBmZ+hfntPUGUGJirawSw5kgc58Sj/WJBGggmH5MnFAedYyNSO+9VYd4X4eVjwbXPFLXM+rg2pExUXQ2qz23FS8I1iJdl02LNd7HgCJGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785773481; c=relaxed/simple;
	bh=/eRwdE1Z4FBwCr+OJddXQexYanXlJrAc8dO/AUYg5cQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UXF8dDw4DzpjBPVpa3zaCJKnlcVKOWcRHu9onghqJZXYb2nan7c6c3v1x6OUGDDmcqTPfo2/Cj1rGAiGYXNMLMzZiPX6jUrpLlahBxNWJsSBy1bbZ7xW1b1fnXhURnfq407OlruF4sLGysanoSx07XTyP/4KHhEaUDJm3AosJbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VPEZatLM; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VPEZatLM"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4955de8797cso13815155e9.3
        for <linux-sunxi@lists.linux.dev>; Mon, 03 Aug 2026 09:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785773473; x=1786378273; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/c4A3W/yWJ8G63KpRNdKLfab7NwGTF+mRH1tOy5r8yk=;
        b=VPEZatLMADcFtxa3BngVNVF7Du5YPLe44A80zNMUt/2XJSAqKCkMonYlwmpWTU8p8J
         GFquUKHGcbcT01nhBQnHSLLNF9Ja7k+9oqrVh7V6MspqExfpwXlkTDgiqqijXILO4IHe
         P5oZW+AEZkvsz0uX99vEEgBJ+1mpdR29JLm1A8roNYe4o/eIqiwpxl02nP4jKIl8TX9N
         lsjOS803uSbe0maqqlO+NgNvecpdEKOueCCAbwiB3MZ9ld8JSeI7kZJ2jg/13Pe3Ygav
         xsfHFLiDltxZQWLrc8LKaR1ujE1CXrn2gMspXCM+ibbiZfasYf5bw+/PgBL02YvFyorP
         xTZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785773473; x=1786378273;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/c4A3W/yWJ8G63KpRNdKLfab7NwGTF+mRH1tOy5r8yk=;
        b=dSQIGyQLty6Tw727m8oLoI4ptTaggQGM4cp6319C+Gcu7vYEW8OPAtu+vUoRL4Qh0o
         z/c35NvbHhYwpA85Ojn9q8EGdPMNCD1dPdrmVa08fWvPr3pWZW9XRswSZPiOCrkclafx
         73QTr6pALP+IgB+/HpmGTp3NuCwtn4PmBB6wFJRAzRwS8Weso0e42RUPTvLKaQDumub7
         ENisEN+xsAS06NufUXUSNjYIMiiJqFygTbTGguTi3sBLQUTKsv8DufnSkYUlpiNUcsRY
         geJKGQjNfKc1lkCyBAVU/b43IcFeYwsuCWkDY0SLl7XMmSvMnj3rQQWgLFujuSKz/qJ7
         9BKA==
X-Forwarded-Encrypted: i=1; AHgh+RrPZMdMXAWI1xZWuzDGMFE28j93rkARNZn7OoNAVvFxZRwC822QoCkJJfnekNKInMyahpfGJtKYXZyByQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyAKKWfygA78PbTrpyl5ttczhLnuTDAkhgoEdbjx1Q6j0e5uU+B
	Qvw2e467CfRKh5Gg28iNLXNbMveLUy4H4uaeKBy69O/awDB0PDHAS16D
X-Gm-Gg: AR+sD112DZPilsOvxrc6mQL9m/pCr4PSg8YtrKliANHF4vdhIpOe6Jb3Ki9LtYQDOrr
	8XWClvoTOL4DrSg0ZKNIbyJbTosjK0ooe0hhatg1nXU2LPr41mWVcDCl/tU9o/iM4DCfj05gHqr
	7XN19EOgKv1oGQK+J3P6UebYE4gaNW8NyLqJil5oPevXM0nrGx+Miii6l+RtplH6yVw8nKxxueT
	BPa8axBFHdTNP1sXuUu/yPKQjqv96/cS+jNYk9WxzOfWvHRhmF/fxFbH5bpk4dw9RwZ/0rErqNc
	r1ozO+slv4HwNZDV06YW2ZUceU+7b4XHG8V2MjRJhEN7oc2sXZG6KkmQh0hjlx0XOxyvZ/F+CFd
	TeVwDUNfFcW0R+fJrcwcmBYgq4FAehzgTpspg0B6zxaJHyzOtyfBPA72RnySTeF/V36qSbL1YNm
	cnWCmxfK9rzKBGildrcxfDpy1kjqmr9Pht5rK2QMSGpZZL4vWNi18V2uiHd6aK1zg5n/sl31oA3
	2Ap58UdqQI4RXjH7vsJPquf4PkProYYh83TRjJPBpi8yJrD2GE/Xs3iBfSVj9hFmzFul9TRV5E4
	7QndhdO/fSIZvz5bOOzs4JQUxTtlWzTOVE3O7+NETapOtvn1rhdEcwCJpFHGv4U3UcEGbD0YDxe
	gddUqT8SOY5fvIVumm2jyJpV9O8HLEi7qJ/woIU4Zt5DPPSohxgszhQB1ck5jCc7qMHr4LzaIQL
	Ocrg==
X-Received: by 2002:a05:600c:4454:b0:493:bd2a:93bb with SMTP id 5b1f17b1804b1-4980c64b6cdmr249435305e9.3.1785773472786;
        Mon, 03 Aug 2026 09:11:12 -0700 (PDT)
Received: from jernej-laptop (APN-122-100-117-gprs.simobil.net. [46.122.100.117])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49949fc2da2sm3363735e9.3.2026.08.03.09.11.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 09:11:11 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: wens@kernel.org
Cc: maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	samuel@sholland.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 01/13] drm/sun4i: Fix V3s YUV scanline size
Date: Mon,  3 Aug 2026 18:10:39 +0200
Message-ID: <75ad4947981f2dc33fd42c05ae0b0cedda7647bd.1785772659.git.jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1785772659.git.jernej.skrabec@gmail.com>
References: <cover.1785772659.git.jernej.skrabec@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The VI scaler line buffer on V3s can hold 1024 pixels for subsampled
formats, not 2048 as currently claimed. Since coarse horizontal scaling
is engaged only once the source width exceeds that limit, YUV layers
wider than 1024 pixels are passed to the scaler unchanged and the
output is corrupted.

Use the value from the vendor driver.

Fixes: 2586de70c15c ("drm/sun4i: Add VI scaler line size quirk for DE2/DE3")
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_mixer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
index 4e4226295010..b6cd7352e76c 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
@@ -785,7 +785,7 @@ static const struct sun8i_mixer_cfg sun8i_v3s_mixer_cfg = {
 		.de_type	= SUN8I_MIXER_DE2,
 		.vi_scaler_num	= 2,
 		.scaler_mask	= 0x3,
-		.scanline_yuv	= 2048,
+		.scanline_yuv	= 1024,
 	},
 	.de_type	= SUN8I_MIXER_DE2,
 	.mod_rate	= 150000000,
-- 
2.43.0

