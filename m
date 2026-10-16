Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8811444AB68
	for <linux-sunxi@lists.linux.dev>; Fri, 16 Oct 2026 11:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792150698; cv=none; b=mTDuwJfbB69lIqrfJiYWyoMkAyspuPrFJuJu9I3r4oINTfDO0Qb8INclMxyf0glMa2IiSIlczCBObDVDwIKARwaF08qgZRv50/+Ar91KcSCDA79Shk93k4ISNG1RM+OmOi3hrWQdmrisMJrgVroR/Dq08vQPwelCuv426Dmm4yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792150698; c=relaxed/simple;
	bh=VoUuUGfUoUaoTTo2wGAmG1gaSD9/V0C+2aX5k0YX2Fc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cryhWKp0z1MuqZfNvUu2GzYibtr92YxA5t0wSVSVxBXQFb+sotB/nWmOrJ2FXyoqNZluE6Nlg2O+UnuBylR1TL0FhHJ7ioy62MgO8GXzhRLmvQjijVh3Zs9njbgz8XdAKQShPQY6hMqLMAtqpFI0/VohP1rX9zO+8tx0fkt5/R8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=etjUJrVi; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="etjUJrVi"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a180fbeef5so57438045e9.1
        for <linux-sunxi@lists.linux.dev>; Fri, 16 Oct 2026 04:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792150696; x=1792755496; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HE4aOaMM6rfgfLxamiGTUaP3vk+wjNz3+/pqgNF8zrA=;
        b=etjUJrViaxeuh6mCN0Y8nMU4RrNKo81HOUe1W8DM/XWRrsGurmwj5YyCYCpaF6RRCU
         PNpEeF9NWwC+tDBmwWMyGDA/mjREjpMj0KHoVPW3n+GvjQoNCH2aecIC3KtcQ9vc/ggY
         7zNvxjE9qb7/Fzgbs6xGRv688ogTCHNqE7b4eEGlmKec2QEWBRbwY96NiwcH1NYF4ABP
         4+J2lxa00k512cdZFHUPiVpncrsxXlJmqUM+OLOa3wAAYUtstQ180l3abmPWuJ6Ndlr7
         0f/eA0mlURTGtMVgYI6X06Uz0R0dUgsJtvtlq5aG7sREYUNN2tVbribots2yD5I7tIlc
         2bUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792150696; x=1792755496;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HE4aOaMM6rfgfLxamiGTUaP3vk+wjNz3+/pqgNF8zrA=;
        b=ZbRTAW9y2TqAcqEU8XQt+akJn/q8Ea8Jw43EkIusSr4tvcTXSUlxKyBiAjozH+c4hl
         8PwKaRQMpNpOLSs2LZhcYzKJqYTOaWDuAaoRyNR8y8lCHsqZsi9/icRPTV8adRfgtjBL
         H6jR6fq8jvik/TpfIBXG0jeKeGZguDmzwydRxOzjyzymQ5h5WbZM906Ij3MIup+4FWGl
         PjIUAMQqtuvASEgrNMsV6gW8nYLXyMc3/ROn2RbRwGqLR9jKEeTj6CE84arXJLi1ucXP
         X7VaHC2OPULVJBg5iz75qGMIzq/RzRzwq9UnAOB8AKS8hJUEc7Xa+fwDJBG5yegY7In2
         zA5A==
X-Forwarded-Encrypted: i=1; AKwUvBwWMBnES7z2u5ialvxf9QJVIEHMVtIckiqVMhfHthk0G8D45Vhpdt/2CyBIde0rn9rrOuErW0DCApZEIA==@lists.linux.dev
X-Gm-Message-State: AFq9FYLBrssx0+OdGAyeV8hIZF/mPqTe8Mr48FMOVc2VTFG8uFEUziN+
	B9f+ZmmJYQk5P/gqD97WQVYNdoPgRytaCwYsYUW49KcHo7InCI4x3YPD
X-Gm-Gg: AYBFou2nAY3x6yVSdlZEO5NQVMlOY5oQ6NePD12dZRtIJZec8enB0eE0PwCe+oVunJm
	IIl+obcShx8q+xu/DxByQILInf9Yo3INpnwz4cX/NfECdfpw+tq+eycuKZ6Y5OVGUr8KYZxUZIS
	r4B2KyG1QXxAXCRyKJKCPfF5pNcomx5doJuIwi9UH9VkddyAnM6v/qmkkKHNsA2m+TLnaFJ77R9
	RJfUzdQ7sKAALsiYnHoo1UjLMB6x02piKlkDyIiuCSIpyp0gp2YhpZpnZx/RChqWBkLObN7lJCT
	b4Y8Qpdz1cqzmMkNlDoNmiHSJ470g3IGaZHGQ7XB8ofUBMvR7mvLoVWCC7mqNPJ9ECKdm+PekNs
	m/4VqKLNVCrDieOW7uHvOjXYMu0k7YYMyFcFrD+JeZBt0Zy7IqkzeAb9sHJPnynm2OlSdrSETwR
	LO00+rIlqO7mF2eYrD1LtGAmG81Ym+S/jedPPu8acZRh3Dn2dRYGT7/hn4Odfkz5s4e0FrBoM2r
	0gU9hL1zHYkJ3LNlmXXVgpM8dw3a5PlS/LS6TSFINXe+eP4/8q19zy3ow==
X-Received: by 2002:a05:600c:4fcb:b0:4a1:811c:8083 with SMTP id 5b1f17b1804b1-4a18e4c3600mr448860065e9.33.1792150695791;
        Fri, 16 Oct 2026 04:38:15 -0700 (PDT)
Received: from thinkpad ([2.176.196.112])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1cdf2f0d1sm22383595e9.2.2026.10.16.04.38.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 04:38:15 -0700 (PDT)
From: Arash Golgol <arash.golgol@gmail.com>
To: linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Cc: yong.deng@magewell.com,
	paulk@sys-base.io,
	mchehab@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	laurent.pinchart@ideasonboard.com,
	Arash Golgol <arash.golgol@gmail.com>
Subject: [PATCH v1 1/3] media: sun6i-csi: capture: Align size to 16 for NV12_16L16
Date: Fri, 16 Oct 2026 15:08:44 +0330
Message-Id: <20261016113846.8602-2-arash.golgol@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261016113846.8602-1-arash.golgol@gmail.com>
References: <20261016113846.8602-1-arash.golgol@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The NV12_16L16 format is made of 16x16 tiles, so both the width and
the height must be a multiple of 16. The format preparation always
aligned dimensions to 2 pixels, whatever the pixel format, which
allowed sizes covering partial tiles.

Select the alignment from the pixel format, and do so after the
pixel format fallback so that the final format is the one used.

Assisted-by: Claude:claude-sonnet-5-5
Signed-off-by: Arash Golgol <arash.golgol@gmail.com>
---
 .../sunxi/sun6i-csi/sun6i_csi_capture.c       | 20 +++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
index d90abba21309..f55edfd0b174 100644
--- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
@@ -41,6 +41,12 @@ void sun6i_csi_capture_format(struct sun6i_csi_device *csi_dev,
 		*field = csi_dev->capture.format.fmt.pix.field;
 }
 
+static unsigned int sun6i_csi_capture_format_align(u32 pixelformat)
+{
+	/* Returns log2 of the required alignment. */
+	return pixelformat == V4L2_PIX_FMT_NV12_16L16 ? 4 : 1;
+}
+
 /* Format */
 
 static const struct sun6i_csi_capture_format sun6i_csi_capture_formats[] = {
@@ -665,17 +671,19 @@ static void sun6i_csi_capture_format_prepare(struct v4l2_format *format)
 {
 	struct v4l2_pix_format *pix_format = &format->fmt.pix;
 	const struct v4l2_format_info *info;
-	unsigned int width, height;
-
-	v4l_bound_align_image(&pix_format->width, SUN6I_CSI_CAPTURE_WIDTH_MIN,
-			      SUN6I_CSI_CAPTURE_WIDTH_MAX, 1,
-			      &pix_format->height, SUN6I_CSI_CAPTURE_HEIGHT_MIN,
-			      SUN6I_CSI_CAPTURE_HEIGHT_MAX, 1, 0);
+	unsigned int width, height, align;
 
 	if (!sun6i_csi_capture_format_find(pix_format->pixelformat))
 		pix_format->pixelformat =
 			sun6i_csi_capture_formats[0].pixelformat;
 
+	align = sun6i_csi_capture_format_align(pix_format->pixelformat);
+
+	v4l_bound_align_image(&pix_format->width, SUN6I_CSI_CAPTURE_WIDTH_MIN,
+			      SUN6I_CSI_CAPTURE_WIDTH_MAX, align,
+			      &pix_format->height, SUN6I_CSI_CAPTURE_HEIGHT_MIN,
+			      SUN6I_CSI_CAPTURE_HEIGHT_MAX, align, 0);
+
 	width = pix_format->width;
 	height = pix_format->height;
 
-- 
2.34.1

