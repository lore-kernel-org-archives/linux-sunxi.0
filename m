Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D77537702C
	for <linux-sunxi@lists.linux.dev>; Fri,  8 May 2026 16:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778257061; cv=none; b=tDOU3HUm/cGD/RJ/dbF+oRMGwViQWZ64B761DLJgIhKUNuK864mbNP+KJXhEW/cMf9as8ZeS9urlbVMdV6OfeOMKnLUF4Usbh4G6Jd/nLK2qpXZ6+20YBpFcpomVj6WTjCQZFwz63h/1rVLr7pmtm8FMMrSCvDCb91O99XPtGSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778257061; c=relaxed/simple;
	bh=+71xsN0zGjFdKKLBXrHVpGMS3qy0PWP98xKw22FV+fw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pDHBbjfY81RkGzlsis+VjX36zI9vz/c3Odl4y/RzEB0zqJgASm9eJ0RekCjCa9uhyoGemYi5e7V5XvdUjC231fjwn54UtD6gRT4IZvHHVl0MdfcgSuF0kLkQefe1hGjqHBW45AssdoFYEJ96/80ShLNZ8BiitgQz3vLI9NgSkMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lw6OjcNo; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lw6OjcNo"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-48d102471a4so22060345e9.2
        for <linux-sunxi@lists.linux.dev>; Fri, 08 May 2026 09:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778257058; x=1778861858; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H78OCHplUUKVx5qcGH4uj9YH7je8ck6bUjvltlSmym4=;
        b=lw6OjcNo7jJJJsUOyEuTMFbwNt8ZsPtj7B1yhVbIgoXMVkoeBFpaX9M4dw+nOuKL3y
         I17TBK/q0jrJkjBS56aI8sFYkJpASyLOYKMNOjtJh6o+WalJgrbBDmd07bGl4wWKxuMY
         6LxFTjfAaAnoJSZJ+zdsgvoM1yfeKqFkTnxaF8utZv1Fl2WP3Y8ss1aoYZ9RlsIpIIzT
         conNJFa87Fre+CBzHbxGcaGeO1Rj5BsjcRZEio/Vj2fX5rAp4v/RXPuJ4XR9RXUHiArt
         xsE8gJMsG5AGTzIuFth0GSULljKEz9XgLrI4wMsmvLG5B125q+VVb8cSH7wEw4XFgJLy
         /LSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778257058; x=1778861858;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=H78OCHplUUKVx5qcGH4uj9YH7je8ck6bUjvltlSmym4=;
        b=XRa8xuCtZ6Gs6oerpucoQWjrLQJK8Udnd700lPlMZmaYaS0t27CuLO/wSzBkTypshr
         KQVf6jxwFJzyzsibrl3ZguDGfBgV0M7NWOC7fBm+pA86mirboY/OeBSPbPnMc+XpCb0D
         mZifWxW4TCsd4sO09g/OlJQnJqtZHGLmHVaoKkUXm4RNiCI08pIo288a6KBJPIrE1jDN
         /z0IAiXOBW4ZswDeFT/iGy43Z2A6Ohew7B4Aj+mDz/R/2nJTsldYNHwM+EEMgApkHqpu
         SmT0pD0f1tcZyww5vz5FZE3Mcyf9sK+MvcDnD5mIcnCUVJ7ziGoY7U2yf1SNi85wJetu
         uQMA==
X-Forwarded-Encrypted: i=1; AFNElJ9BoYVoCwdYngNnGpTS2cAqq+18kaY8E6ML726fpxAK9GtAJQQOazWnCoYXRDkn4HtW2bwyc2aiI/8NIg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzXTH3rkmoC0zFc7yvp8M3BOcc6Rjdd7hR9Wy1aktUZimnc5uf2
	ebSk8hqyaCsvZfve5ICi7/5qme/swp5Krx6f/E1/IgtjtU+HKsZIz5Rr
X-Gm-Gg: AeBDieu/if3DfGOL+GBG5XxDXkhqTuVn/a/QDta6PHa+Lfojk9fOq7Q5QlUfSQvgeq8
	vHJEjVkBIn3whakh/dlllL/9HzrTK7OwblGf47Py1PP41xoiu+JBPs8g7IUF3sfjCc4vU90bmB/
	A3r1FNEnFTArEnHQ9OwuE5XWQCNNtLqmfhfjNCyanWTuN12gfg6Uivaz9YqeROGNAP01pnCV+Xu
	qQ3oNynq09aQkdWOmCV4ZEiSHaq8s8djTJTf+twQyw20THffPqyvtof19KXr5SPum17kHsxizcY
	my3cJdijNZVVhK5U2KjSUUODEEoJrpLgY06rv+zWTTx5EE4fbpiFo/mgaNfbBiSrLglzzC0F1kI
	VLzEj94cs5SG5U+zIySaHmDsG1w+7RXpc6wRl1fDp0exMuOnrwT13DGrM+PGnco0Pq2xDtQLo8B
	4Kbqfo4z+kojwAkeZT4ort1kCRJL+9YtydL2dLHj0q4AyWSCh7Mv1KOhLEsE369i+hVDrS5OTC3
	4IoIUY5y/9kpaz2Y53n
X-Received: by 2002:a05:600c:35d1:b0:48a:5821:5ff2 with SMTP id 5b1f17b1804b1-48e6767de04mr65948235e9.8.1778257057759;
        Fri, 08 May 2026 09:17:37 -0700 (PDT)
Received: from thinkpad ([46.164.92.151])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548e6a66bfsm4946697f8f.4.2026.05.08.09.17.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 09:17:37 -0700 (PDT)
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
Subject: [PATCH v2 2/3] media: sun6i-csi: capture: Implement vidioc_enum_framesizes
Date: Fri,  8 May 2026 19:47:20 +0330
Message-Id: <20260508161721.94285-3-arash.golgol@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260508161721.94285-1-arash.golgol@gmail.com>
References: <20260508161721.94285-1-arash.golgol@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Report the stepwise frame size range supported by the CSI capture
hardware for the pixel formats exposed by the driver.

The hardware does not perform scaling and accepts any even width and
height within the reported limits.

Signed-off-by: Arash Golgol <arash.golgol@gmail.com>
Reviewed-by: Paul Kocialkowski <paulk@sys-base.io>
Tested-by: Paul Kocialkowski <paulk@sys-base.io>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
Changes in v2:
 - No change
 - Link to v1: https://patchwork.kernel.org/project/linux-media/patch/20260217064050.18388-3-arash.golgol@gmail.com/

 .../sunxi/sun6i-csi/sun6i_csi_capture.c       | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
index d90abba21309..375ea6745eed 100644
--- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
@@ -738,6 +738,27 @@ static int sun6i_csi_capture_enum_fmt(struct file *file, void *priv,
 	return 0;
 }
 
+static int sun6i_csi_capture_enum_framesize(struct file *file, void *fh,
+					     struct v4l2_frmsizeenum *fsize)
+{
+	if (fsize->index)
+		return -EINVAL;
+
+	/* Only accept format in map table. */
+	if (!sun6i_csi_capture_format_find(fsize->pixel_format))
+		return -EINVAL;
+
+	fsize->type = V4L2_FRMSIZE_TYPE_STEPWISE;
+	fsize->stepwise.min_width = SUN6I_CSI_CAPTURE_WIDTH_MIN;
+	fsize->stepwise.max_width = SUN6I_CSI_CAPTURE_WIDTH_MAX;
+	fsize->stepwise.min_height = SUN6I_CSI_CAPTURE_HEIGHT_MIN;
+	fsize->stepwise.max_height = SUN6I_CSI_CAPTURE_HEIGHT_MAX;
+	fsize->stepwise.step_width = 2;
+	fsize->stepwise.step_height = 2;
+
+	return 0;
+}
+
 static int sun6i_csi_capture_g_fmt(struct file *file, void *priv,
 				   struct v4l2_format *format)
 {
@@ -805,6 +826,7 @@ static const struct v4l2_ioctl_ops sun6i_csi_capture_ioctl_ops = {
 	.vidioc_querycap		= sun6i_csi_capture_querycap,
 
 	.vidioc_enum_fmt_vid_cap	= sun6i_csi_capture_enum_fmt,
+	.vidioc_enum_framesizes		= sun6i_csi_capture_enum_framesize,
 	.vidioc_g_fmt_vid_cap		= sun6i_csi_capture_g_fmt,
 	.vidioc_s_fmt_vid_cap		= sun6i_csi_capture_s_fmt,
 	.vidioc_try_fmt_vid_cap		= sun6i_csi_capture_try_fmt,
-- 
2.34.1

