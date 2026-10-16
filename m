Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 496D644AB68
	for <linux-sunxi@lists.linux.dev>; Fri, 16 Oct 2026 11:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792150704; cv=none; b=Xi0neH++QNW1M1gtO4IEJVnCHsVdJJjdj6FMSZyFrXkMAnGEmmf0BnbQbOUOrXUVOpgiiOz55N8uAMHckIjeggxXTckRqZwVnoZs0HZFb5BTXK/XJ7ionBFY13LpfnegvNsRUtBcsJYT0bxRIbJy6QYTWX7NIJfmRJuyj48DKJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792150704; c=relaxed/simple;
	bh=u12a3ffdWSavn8fNOGG7iWoAKs0u1jgbl02dvxJqvRg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Qe7u00vwJaietZ+PmeYSO1OWk1WApH69QtakOn+A3LOrH7b7V37dj4mLTUWzGFGY3Pox1Fmbn7ixSv1HUe9uupERgu54THy2DpkgfXsPUgsk30ZpHo5rzvm4Si8wseKht+1AyyTM1w55FyV58mJ1p16iFpvNyTNSetzmjlBltOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y8Bq1O71; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y8Bq1O71"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a19cba5c14so57806075e9.3
        for <linux-sunxi@lists.linux.dev>; Fri, 16 Oct 2026 04:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792150701; x=1792755501; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RpfLOWvwn4Sw81+kUb+I/pmHrcilS6w6yVVATPuvlIc=;
        b=Y8Bq1O712b7KT7Pe8AAYlKQqqyY27N6Nxwprj7wWDQwUzXS3fHbEazAspKszW9VnR6
         GsrRTXgT1SV62oIsOL7h5UJHK5j6a2wC1CvrK6DikxHyga3DObatUuoRgbZf+zCpLWix
         P6jRi5D4UELJc7liS5CS0GUGEm6o5/tGFSSwcKTpbLINF79sW7/99Hbhp2bQTbjDpkOS
         M6cljkW/p8uUnBV4kyZO/4WNO67tQ30kxN+yBJt4bpAWNG2Kgy7phYi9AhGWqjqzNQl1
         B7VrWpFNZ8/h1sfoo1+UnmZUFkAhXMxdczLiw3cy4vmLPdTzACDyax1+daVXLC/AuTaA
         FJvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792150701; x=1792755501;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RpfLOWvwn4Sw81+kUb+I/pmHrcilS6w6yVVATPuvlIc=;
        b=p5RMAnXG5WOzBZ34YABWLKaA1t7XphOfAe8Py2WKrbn4tNL0Et5zJnKTqjWR4thief
         Waax/8HnuN9JSlys/L8GSotoX4qth6A+gNCKZVSnkeGQO/2GcPUPTvtligqR7ujaG+JW
         4VIwQq2WRDnfs8wKLqkqM9w66eCXErmI9zFosnNqorsfKcmkq6/cetXcXtjiiqrsmegS
         irMxIx82o/V5AWGHIshmGBUFYbr/za6ntNpAto9g6bHgBAMsmMpquHKhlRIN4yKpnMqv
         TUfCJsab+D1nP+z3NcW+Wn9yJf0Vv/+GvWBtouBmTpQUOthQ+K3JJZv9zCaocxqweoeT
         ocWQ==
X-Forwarded-Encrypted: i=1; AKwUvBxfbgacxcharAYlsmauhL0U3otxBEr6pLuqupg08cE5jVwB+Zf0h37R0j3K3oqi9OwALXHWnw8pvluO6g==@lists.linux.dev
X-Gm-Message-State: AFq9FYKYwwhDJVvP6iAA6HlLyhZvnuXL0gcFH7IP6WRC8XhRk+YH6ftU
	Q9LinUG0+5xCEvcP1YtYxWPOaOHKh85majHvRDjy3PR3qBPRb01WqLqy
X-Gm-Gg: AYBFou0ZHVLGo+c/qmwr9eu7f0uGtF9KbdbTOSzjoYdr4q3K9dIFRDT9HfoEyUKj8H+
	1F8nLVubonwBWW3DjAhNI4kDjqm5alLhWguXYgFi68qrI4Mn61P88QIahodUnKKMWPu8OIipVIy
	K7gsvPfiQhqb+5WdfHL0mxYFPkRrdUGgR0/MDcr65yTHDT4KIGD+S33bFuiLxZolqJW5OONwo7u
	rGfgi/xFQFzWt0U771ZnGAlDs/YbUBj9pPGSMuG3a0O8y2F1R/yyXEwyBZwJt/uTPrm5Ag01jZ3
	ueiKK15FhYhqkzKDdrX2bnokvvbefaz+/tWkVTQUn7YVJwhYl5Hx52+DZep/B8kpFCIvIE0wLKU
	729SGZM+qW/xudDrypevxRRUi4gVHMXvZBubMEcyA9LWVIJMHjYboyx6ID4gGZfi+be7kxGwDxO
	gtpzWX0H+tyXe/WVNyGfrBLUdAu8k1goy46i1iteO1suguy4TPKcDu5zdSYPgUYzb//QvHftiNZ
	h+AUF785Fj/cDVxgK6nU3NR++nSVtZqU4r8BQr/DPvkE6yhKlsrMOAGGg==
X-Received: by 2002:a05:600c:4f89:b0:4a1:acaa:9d4c with SMTP id 5b1f17b1804b1-4a1acaa9f79mr226601125e9.25.1792150701481;
        Fri, 16 Oct 2026 04:38:21 -0700 (PDT)
Received: from thinkpad ([2.176.196.112])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfe4d2321sm4363551f8f.19.2026.10.16.04.38.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 04:38:21 -0700 (PDT)
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
Subject: [PATCH v1 2/3] media: sun6i-csi: capture: Add enum_framesizes support
Date: Fri, 16 Oct 2026 15:08:45 +0330
Message-Id: <20261016113846.8602-3-arash.golgol@gmail.com>
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

Implement VIDIOC_ENUM_FRAMESIZES as a stepwise range from the minimum
and maximum sizes supported by the hardware. The step follows the
alignment enforced by try_fmt: 16 for NV12_16L16 and 2 otherwise.

Assisted-by: Claude:claude-sonnet-5-5
Signed-off-by: Arash Golgol <arash.golgol@gmail.com>
---
 .../sunxi/sun6i-csi/sun6i_csi_capture.c       | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
index f55edfd0b174..3adb10b62857 100644
--- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
@@ -746,6 +746,30 @@ static int sun6i_csi_capture_enum_fmt(struct file *file, void *priv,
 	return 0;
 }
 
+static int sun6i_csi_capture_enum_framesizes(struct file *file, void *priv,
+					     struct v4l2_frmsizeenum *fsize)
+{
+	unsigned int step;
+
+	if (fsize->index != 0)
+		return -EINVAL;
+
+	if (!sun6i_csi_capture_format_find(fsize->pixel_format))
+		return -EINVAL;
+
+	step = 1U << sun6i_csi_capture_format_align(fsize->pixel_format);
+
+	fsize->type = V4L2_FRMSIZE_TYPE_STEPWISE;
+	fsize->stepwise.min_width  = SUN6I_CSI_CAPTURE_WIDTH_MIN;
+	fsize->stepwise.max_width  = SUN6I_CSI_CAPTURE_WIDTH_MAX;
+	fsize->stepwise.step_width = step;
+	fsize->stepwise.min_height = SUN6I_CSI_CAPTURE_HEIGHT_MIN;
+	fsize->stepwise.max_height = SUN6I_CSI_CAPTURE_HEIGHT_MAX;
+	fsize->stepwise.step_height = step;
+
+	return 0;
+}
+
 static int sun6i_csi_capture_g_fmt(struct file *file, void *priv,
 				   struct v4l2_format *format)
 {
@@ -813,6 +837,7 @@ static const struct v4l2_ioctl_ops sun6i_csi_capture_ioctl_ops = {
 	.vidioc_querycap		= sun6i_csi_capture_querycap,
 
 	.vidioc_enum_fmt_vid_cap	= sun6i_csi_capture_enum_fmt,
+	.vidioc_enum_framesizes		= sun6i_csi_capture_enum_framesizes,
 	.vidioc_g_fmt_vid_cap		= sun6i_csi_capture_g_fmt,
 	.vidioc_s_fmt_vid_cap		= sun6i_csi_capture_s_fmt,
 	.vidioc_try_fmt_vid_cap		= sun6i_csi_capture_try_fmt,
-- 
2.34.1

