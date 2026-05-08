Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 801043101B9
	for <linux-sunxi@lists.linux.dev>; Fri,  8 May 2026 16:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778257067; cv=none; b=APoYLg6Z0kee3e99/JzPzFsT6agXaqSchcE5Hs+I3To/JKlHjyfMeevWWCXqVS3XtXz5bWRAyO3y0RBSti7Ig38YesFbGD/mWdsXHrDgW+TDetCqKH7AyP6Pni2pAdfPHKejZuUfLZQEd4KVMl1+WhiJM9nOJK5hTAg9Q1pvL0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778257067; c=relaxed/simple;
	bh=/Eqe5iU44ry/gzPo+lsa36VWQqG8Zp8mFC8GsAoSEgs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=p8CKcmQ/wC/DFKEmqlPptUHu+PhGvdtqq1l/yEExRkb1cvfrYI7GIRygOWZcecfs7KW0ay59tDRFYkNhBjeGpx+NyguKk34f5jlEA3hKtKqhkkQG4JsTC7CfKNLMTSaoTuj1LYdhh0LeXERDmNsRGtiLnPXOs1zuvkJHfxXWYfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QzwcVlkj; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QzwcVlkj"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-45297094718so1759914f8f.3
        for <linux-sunxi@lists.linux.dev>; Fri, 08 May 2026 09:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778257065; x=1778861865; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aFzpvNnAmypkJr1Nj81ekibmeUXSe5xhjPOVIP2fg5s=;
        b=QzwcVlkjqIiV4kQru413iK2JJhuYGH2yX8Re87CBPCg7w+AVnYgLlS+mQjTd0M/l8j
         h1QWlu2O9DCnaSBYCHdX3K7wxnY0fNwHZe47EwL0Qcrc6Bt8aIfc9rh+h06M9ygtihES
         OwfImaNhAPcIpePVzOw+Hvbn5Uq+clTPYPS1xbbEiFiC4Md2ViybCjegIwBLq1D9W3BB
         CHKdMXVojoF/jl/jUZmoz+X9Fejw1PVSrBzHIhd8cuVfHBxtqLn3RhjkMI6rhS/X6KlW
         mdpZUA9HE1+Dkh9gnKZsvbeBHB2uZv5elwL8SK8b2gk4QeVutLyXM5gOy3VB5MiB1gqY
         6EnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778257065; x=1778861865;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aFzpvNnAmypkJr1Nj81ekibmeUXSe5xhjPOVIP2fg5s=;
        b=RH7RbC6kmCvXw7DE6EXsBiNiu407+FFRoO7D6h0U/2bkPL6Eeg3gVB+573bDe1viJR
         e/HR53Xf0u4J9/Gh2XCCUytbdtF9rL32+dfJ7wFZJHW73VHQlYwnyRiJmaHdtENTs/Bm
         1HEfY/mO8eiSzvf11HTZSYqmumPPilUskit+tmcmtVeTf5Vmn8vNGz6bwaXtHSkAHKBq
         XeOR2UI21gRveupOXWAN2CcaHZ6H5X0fUS3wYif/NmFmylVFkvNTHoX+PH+ZhrSjkNKS
         0H96/yCFKGaIa8d28ecA/boGsBUv+q3+jhfke/qoszg9EY2SO6gBiSgWS53iR6J85vvt
         FJgg==
X-Forwarded-Encrypted: i=1; AFNElJ+NzS782GchMddJQKywM4pBHuYSwsGL2dgqlljYZgZPtQnVN0ACgKkzk0mfn6XfvVqdrvE5zAkUl4J8eQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwCRx9CtjWg9qEr7qvQ24/BD0q0cAwZ46UzquyLSkuB5BtKjBD+
	/DuqBAZk/HkNGKfasPjcUY6oSVEBo2KXc91mLkurzoPFyKxuilUc7Bc1
X-Gm-Gg: Acq92OGpv1lO1OiPihH9nIyfN2YNTIR0190rXjfN5Hqb8gvyaXbfyVyNqNfPPorEG/t
	8l9AAq7ZuaFjcdw1xHYgLL28QtAq1myaRffuSvOtynzn7O7z886vlEbf2QwU4Kt3/FfDf7FXpCX
	kdjXpFjw1xiNinWbahBYhaOY0eXNfSlBokmtve0O0ARqXHHzxS4PV0dGT4EFVNnm2Q5p5K+6I/1
	xxZ99GlvMxdHw4fCE45VHj0ZXshWuk7dG8+fJ+UD+FXuON8JjEuOBq1owzWB+3d1OpCIIlcj4eZ
	tG6/DkL6LAaBkZBSS+UQ2VKEmsBfiMxPLBB6W3R/mHnIQBn3plDw51KB8pXW+a5NDfd4hF+h0fV
	Ue4A2vYvS3oGgs0e92OlQfJyCZvMhfWjcI351dIs7tnfzmqbUi8Qs2FQE9J4rc2gK6fCy+0IZRU
	dYe4Jrlj5zhK58IIF5IncVf9W1wAT18dpXi4x8ynCCvM3ANy5eYDMohFCvOjeLT1WIrPR3DVy8w
	MELpiFa5w==
X-Received: by 2002:a05:6000:186b:b0:43c:f1a5:56f6 with SMTP id ffacd0b85a97d-4515e245b31mr19758647f8f.43.1778257064705;
        Fri, 08 May 2026 09:17:44 -0700 (PDT)
Received: from thinkpad ([46.164.92.151])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548ec6b071sm5276653f8f.14.2026.05.08.09.17.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 09:17:44 -0700 (PDT)
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
Subject: [PATCH v2 3/3] media: sun6i-csi: capture: Support MC-centric format enumeration
Date: Fri,  8 May 2026 19:47:21 +0330
Message-Id: <20260508161721.94285-4-arash.golgol@gmail.com>
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

Extend vidioc_enum_fmt to support MC-centric enumeration by filtering
pixel formats based on the provided mbus code. Advertise MC I/O support
on the video device to reflect its intended usage within a media graph.

Signed-off-by: Arash Golgol <arash.golgol@gmail.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
Changes in v2:
 - Return pixelformat directly instead of a pointer
 - Link to v1: https://patchwork.kernel.org/project/linux-media/patch/20260217064050.18388-4-arash.golgol@gmail.com/

 .../sunxi/sun6i-csi/sun6i_csi_capture.c       | 39 +++++++++++++++++--
 1 file changed, 36 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
index 375ea6745eed..2db96ee19d8b 100644
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

