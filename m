Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4634D33BBAD
	for <linux-sunxi@lists.linux.dev>; Sat,  9 May 2026 05:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778303362; cv=none; b=IsUmssLCYvdTHiCcTGIgKpdW2amaRwdw8zYSItelPu7dsSHT6jVNUMzi7KuGE3+EsRDWfKIyjaAb0E55oWktKus+rvdSAnyWIxFbGfxO015R3/qmkk1MWFZR7v683HNySbT6s/v/x06lA50VhqkyJ1FgQ0xHn7/9z9sY2HEmpz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778303362; c=relaxed/simple;
	bh=l2h49IBJQQJeRXIpnECLHnQqhjjLmf/4MI621awvlys=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GhgHQz44SUFTDQjq3LveKCsBWhdto2lDVokGEtEWZunt5bZ9EBQXtcJecmBjCRedl+TQuVaJh/h/MjxnSjB3GfiwYlvIa4LuoWH10PI83sLQdRq3ub23BaCnVMLuPiiTmBuPKdNsbiMFqcM1Q6vZDnJaYlixH0vzxPLAOxHR8qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XGHSPNfq; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XGHSPNfq"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-488b3f8fa2bso35754595e9.1
        for <linux-sunxi@lists.linux.dev>; Fri, 08 May 2026 22:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778303360; x=1778908160; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g5bmiBt/UaAj8FYk6z1JEgvnehBBxvzIZjMWnqTHpn8=;
        b=XGHSPNfqSOlmZKMmnP9V8FtdxCzp9qDb0F5gE6qymYJ7bc8A0rkh62koJumVIe1UIe
         EAdV0DCP16GKNAvRhj9wTN5nrMkfH+gZZdG5Pc13iJeb/vNuhb4dl5Tq9SeCNzRm5Q6i
         OItI/S5ugGUJYFu/aHKjlid8IBL3X1u+9iupZa+NLeqZyzl+bel1S9HD5KbkaxBS+3GR
         e4wNo8ATeJuO5s+KTScwsuK2t+eQGEAzuVdUPBiqS4gopbWy3QUYPZzLAbXUzH2uC7Bn
         c9Zr4zB8uVJaHYb4MiJX3izQHk24n8GJN5yvoaO8+41Zpds4uzUWlpE9/Hu9wWzlqrlv
         V6pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778303360; x=1778908160;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g5bmiBt/UaAj8FYk6z1JEgvnehBBxvzIZjMWnqTHpn8=;
        b=WPfB+REmTXPMy/kSiYkGy/+u8BPqGQ/HCg4qyeoHtDWbAOW9WWvWBbjRcQQPx1EP36
         GZtclXXoccWfAz0M47Mc7z+0Yu/EvhA8ow/WCbC2+9higix2IGTtnp5bUd6GFsgfrFNk
         WwkEMv6RT9R1YWV5+stzCND0m4+gZyLY7iAK6VKoQz8DJMf4c+GNc7FOdePJ/vVvh2XO
         F6/wvWbyzHZMDm66XcgVxVOB3jmmpf6FIeGlpG4LNhuyezSKcheMgbNYrU0HCUuibQpm
         yc7Er7Pi1+Df2PiWT0Zr/VOgSjrIJS1TR9tenSZBWs0ip1/HfHD+YFFeebP8VdslWNwg
         v+Ow==
X-Forwarded-Encrypted: i=1; AFNElJ+XI46Z+8WGb0hGdJ6vywwFGthF/7tl10GifPP1PAQhGoJAKc82PCRzlWbp4MLb9eGZtV7rzAnO5fYWkQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyhtl8fgp0xsGutTs+VGTQraFcvGkk29i9UJkRBfxH1pTo5opyV
	pydx/Oxv3lKkG1qlBNi+yPLfQDQgngHnlpTz3xKCvCm6cOdFwGDPxFCu
X-Gm-Gg: AeBDiesykFtMkDN3H3wez7Czn1+CLe67BLCPLRNzLT6s/7qzr6zr4UFoC4KfNXx4Hv8
	oL61fABlwHLzZCGB7EShkdC4GINxNpTwDuzbple/dildY71NRYuFvWNEAhHYF43f1zc5S9Ujrgu
	+hPDK2tNaLghMhDu3W7VapjsPEPnMd/C23zt/+yVcn95CoboRyqMSHKg5DahGvo6Amf1t/uZYIn
	HU8mag0h5gWgQ0OKD3oppF5g0nLsxB7CqqF88+ir1ZOEr9oDCTGabDzKyqRrbrIsm6lgnfWWQ7U
	1elPxHV6kNlzrsPCcpNqSn8AG8fBItS4yPSFFP2v4j6GR6MvOKvn0oRhuSXPb6e5th/7GKUBaYn
	66nqOUqkM00vim1T2gvb9IrRltaV9VsT/IPJulRyQTp7xRJPmOczfM8zvvbsyLEjD+FymqlEo4b
	89pemQ8hVMpfgMwi8BawlhUn8tXlONbCdhFfBjOqoakP8kohuWoRzgzSXz5qDkzITDzcTNcx+gf
	BGxctF00QScio532jnU
X-Received: by 2002:a05:600c:c4a5:b0:489:1abb:5559 with SMTP id 5b1f17b1804b1-48e6cbd6c10mr61082785e9.5.1778303359626;
        Fri, 08 May 2026 22:09:19 -0700 (PDT)
Received: from thinkpad ([46.164.106.90])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e702f407asm23776455e9.13.2026.05.08.22.09.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 22:09:19 -0700 (PDT)
From: Arash Golgol <arash.golgol@gmail.com>
To: linux-media@vger.kernel.org
Cc: yong.deng@magewell.com,
	paulk@sys-base.io,
	mchehab@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	laurent.pinchart@ideasonboard.com,
	sakari.ailus@linux.intel.com,
	Arash Golgol <arash.golgol@gmail.com>
Subject: [PATCH v3 3/3] media: sun6i-csi: capture: Support MC-centric format enumeration
Date: Sat,  9 May 2026 08:39:21 +0330
Message-Id: <20260509050921.22158-4-arash.golgol@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260509050921.22158-1-arash.golgol@gmail.com>
References: <20260509050921.22158-1-arash.golgol@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Extend vidioc_enum_fmt to support MC-centric enumeration by filtering
pixel formats based on the provided mbus code. Advertise MC I/O support
on the video device to reflect its intended usage within a media graph.

Signed-off-by: Arash Golgol <arash.golgol@gmail.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
Changes in v3:
 - No change
 - Link to v2: https://patchwork.kernel.org/project/linux-media/patch/20260508161721.94285-4-arash.golgol@gmail.com/

Changes in v2:
 - Return pixelformat directly instead of a pointer
 - Link to v1: https://patchwork.kernel.org/project/linux-media/patch/20260217064050.18388-4-arash.golgol@gmail.com/

 .../sunxi/sun6i-csi/sun6i_csi_capture.c       | 39 +++++++++++++++++--
 1 file changed, 36 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
index f788b4234673..5737ebaa7297 100644
--- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
@@ -327,6 +327,22 @@ static bool sun6i_csi_capture_format_match(u32 pixelformat, u32 mbus_code)
 	return false;
 }
 
+static u32 sun6i_csi_capture_pixelformat_find(u32 mbus_code)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(sun6i_csi_capture_format_matches); i++) {
+		const struct sun6i_csi_capture_format_match *match =
+			&sun6i_csi_capture_format_matches[i];
+
+		if (match->mbus_code == mbus_code)
+			return match->pixelformat;
+	}
+
+	/* Valid fourcc is non-zero. */
+	return 0;
+}
+
 /* Capture */
 
 static void
@@ -729,11 +745,27 @@ static int sun6i_csi_capture_enum_fmt(struct file *file, void *priv,
 				      struct v4l2_fmtdesc *fmtdesc)
 {
 	u32 index = fmtdesc->index;
+	u32 mbus_code = fmtdesc->mbus_code;
+	u32 pixelformat;
+
+	/* MC-centric or Video-node-centric */
+	if (mbus_code) {
+		/* There is only one pixelformat for a mbus_code. */
+		if (index)
+			return -EINVAL;
+
+		pixelformat = sun6i_csi_capture_pixelformat_find(mbus_code);
+	} else {
+		if (index >= ARRAY_SIZE(sun6i_csi_capture_formats))
+			return -EINVAL;
+
+		pixelformat = sun6i_csi_capture_formats[index].pixelformat;
+	}
 
-	if (index >= ARRAY_SIZE(sun6i_csi_capture_formats))
+	if (!pixelformat)
 		return -EINVAL;
 
-	fmtdesc->pixelformat = sun6i_csi_capture_formats[index].pixelformat;
+	fmtdesc->pixelformat = pixelformat;
 
 	return 0;
 }
@@ -1065,7 +1097,8 @@ int sun6i_csi_capture_setup(struct sun6i_csi_device *csi_dev)
 
 	strscpy(video_dev->name, SUN6I_CSI_CAPTURE_NAME,
 		sizeof(video_dev->name));
-	video_dev->device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING;
+	video_dev->device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING |
+				 V4L2_CAP_IO_MC;
 	video_dev->vfl_dir = VFL_DIR_RX;
 	video_dev->release = video_device_release_empty;
 	video_dev->fops = &sun6i_csi_capture_fops;
-- 
2.34.1

