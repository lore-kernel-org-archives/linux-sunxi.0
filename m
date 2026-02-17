Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F9A0223DD6
	for <linux-sunxi@lists.linux.dev>; Tue, 17 Feb 2026 06:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771310498; cv=none; b=ChN70rMPBOrSbY1KZ6b5CXCx1oNER5ILt4I4rRy3he7wo1YrFgd0a5Y4mtD4PCk7llNw/o+aMZ2Ok1+g0aaUIl0X/HNF52ZtlDNZi4OHJ+JcXCBy3XeBAvUo15BfwYoHUMCCzvyOG4PdpTcWzkRrPWOD/tc8vqO5Fzar5p7Qov4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771310498; c=relaxed/simple;
	bh=bWO18VWhl/lJIVX1nAvqa2U827Ja5osKWLe4Ii6PMOU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YM8A8tZkCuLVu6DJrgTcw8UcS98R3YNzInjux6UR74hkvoI5bouze7qgA4VdmTt0NR6E6xWmaRBJw69Y8D5WDrolgmZSgD8Btjpiuu0npg07BC5hmJbsPDqhvhpoCPQyFPjWu5VdDHOH6kp90J+s5fMzT2pSkODbGHbT4qiH/ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hASvOmko; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hASvOmko"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4833115090dso34721575e9.3
        for <linux-sunxi@lists.linux.dev>; Mon, 16 Feb 2026 22:41:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771310496; x=1771915296; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6hnMRVHPJNRuy6Y1rMEFRl1cpDiZ6JR5YGvfIe2PEtM=;
        b=hASvOmkosECmZoVwkLraqZgpzd+2GbXGUtkT4IbgfdvT22kaLbKFtKbr6GRm5BKWy/
         AGMMKsFy8oedNs08GYMEImisj0z9wkylJYDSezLALtkvxtQBDWA67T+xRLNxJXM4Np5q
         rC0lkzm1ja9Z/k01cPV4YZoeXm//dqx+2dzHmv9/YIdHaozclp1Pyvnw7BzUtge7Tjyq
         g+4BpRZ0irSm5NfOHgY3mR13w29UpVa1+gwapBnoN89Wu/Tt8WKU/mc0aj188Qs/MSgU
         B79e+3vTnoMc2Bf/wsbHnixdmG8QJ5ELUBJWbELvIIOHBtsZX82CVbBWASUUEtKqrtx8
         NH9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771310496; x=1771915296;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6hnMRVHPJNRuy6Y1rMEFRl1cpDiZ6JR5YGvfIe2PEtM=;
        b=Xy1XExlZyJv+FGIZXduapfS3uzNfqiUC39ABBtUxfBh6ZxgUKyHxESSN7dUrGhXcE7
         v0OaQ9Kzc59bNlRYS5mV48K3ly+GjrDJeOsu4ABBh3uJ5Mmc0xrlUJqxe1kvRO1oI4lz
         vUSf2O94eFM+P4DZdt4cGMvH2yfQ9Y4JBiYXF8BFM3j94U0jiCRVgpdA+5PtihUbRyG3
         tDKvVwVvUWw8Q/HH45J+I087IejO2geE4J1gqRWR9BK3j4f8BUNnPQZiAsBnO5gXXjsj
         To4A8NZ1UChqx9Eczw34jPQlATqa3wGJUqfTz6v0CFSxy+EzppkMWbRXX9HcFjNOFdp4
         8LgA==
X-Forwarded-Encrypted: i=1; AJvYcCW3AxT6en3QyjdVVtVBqaGd2HoMFmiThQVpAb7y/EYr3fIK6vUmxLyrCrOz3rnq1X+u3CTY70mxkwG12g==@lists.linux.dev
X-Gm-Message-State: AOJu0YzVUpD8y60DBmirFuTaJszrof9kE9kIMyKjEWVl8We6isir8Krz
	RqIL5FKOuu3xkEWXd6PR/jUHU++IebyUVb9nCa/CsUxxQhmaAltAzX8j
X-Gm-Gg: AZuq6aKYPgHQPFW6IGTPK2qUekaiuq2bXIT9ojGul++laS2zQQesNrzU/K9MjBvhSYm
	bLOje2oYy32ORhOR9ewqTDBwm3bb1zdZObZkWHYGnXrk3EmgfMFhvXN2fYBW8Ypvevg0SOIhjOz
	l/9HS3bjG/Z5tt0Zq/w3wiQ9VmP3PGBZdGcjHFIrqrqayI4oJkwy4ScAOSDotKHLZtyh4mQ0bY2
	7F3Z1EbwfM2cIriHVj4clCJJuPSIXf5P1vsrS7Fm3Itcdd/Qxogb4zCHgiWQrPffMeAwk+c5RuG
	2ZFEFv7MgxSy2cd/4ZARTdkgyXM43cbo2sOa1y2EMzlpVLlzgQxTKN4AAp0dl7bpHHDFSWeqofv
	iLhySYcyXljBc1RCztIoCwLKhmKceGGx96KMep6JjVgbgnpaQ2Z6GhkbWUgOk65oKMT91Hvs6QH
	kyWDGp5AKndYwB1Xy6QAok9ijMaKbJyML5h0S6Q+LgR+H0m2kY+hAP2OdvMvYDRKV5HjZlXaw1B
	BhaqeuniQ==
X-Received: by 2002:a05:600c:524d:b0:483:4807:210c with SMTP id 5b1f17b1804b1-48373a5d7a0mr259850485e9.24.1771310495620;
        Mon, 16 Feb 2026 22:41:35 -0800 (PST)
Received: from thinkpad ([204.18.30.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796ac9d77sm29438376f8f.33.2026.02.16.22.41.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 22:41:35 -0800 (PST)
From: Arash Golgol <arash.golgol@gmail.com>
To: linux-media@vger.kernel.org
Cc: yong.deng@magewell.com,
	paulk@sys-base.io,
	mchehab@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	laurent.pinchart@ideasonboard.com,
	linux-sunxi@lists.linux.dev,
	Arash Golgol <arash.golgol@gmail.com>
Subject: [PATCH v1 3/3] media: sun6i-csi: capture: Support MC-centric format enumeration
Date: Tue, 17 Feb 2026 10:10:50 +0330
Message-Id: <20260217064050.18388-4-arash.golgol@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260217064050.18388-1-arash.golgol@gmail.com>
References: <20260217064050.18388-1-arash.golgol@gmail.com>
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
---
 .../sunxi/sun6i-csi/sun6i_csi_capture.c       | 38 +++++++++++++++++--
 1 file changed, 35 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
index dd06d4c116e0..f54d7a6397be 100644
--- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
@@ -327,6 +327,21 @@ static bool sun6i_csi_capture_format_match(u32 pixelformat, u32 mbus_code)
 	return false;
 }
 
+static const u32 *sun6i_csi_capture_pixelformat_find(u32 mbus_code)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(sun6i_csi_capture_format_matches); i++) {
+		const struct sun6i_csi_capture_format_match *match =
+			&sun6i_csi_capture_format_matches[i];
+
+		if (match->mbus_code == mbus_code)
+			return &match->pixelformat;
+	}
+
+	return NULL;
+}
+
 /* Capture */
 
 static void
@@ -729,11 +744,27 @@ static int sun6i_csi_capture_enum_fmt(struct file *file, void *priv,
 				      struct v4l2_fmtdesc *fmtdesc)
 {
 	u32 index = fmtdesc->index;
+	u32 mbus_code = fmtdesc->mbus_code;
+	const u32 *pixelformat;
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
+		pixelformat = &sun6i_csi_capture_formats[index].pixelformat;
+	}
 
-	if (index >= ARRAY_SIZE(sun6i_csi_capture_formats))
+	if (!pixelformat)
 		return -EINVAL;
 
-	fmtdesc->pixelformat = sun6i_csi_capture_formats[index].pixelformat;
+	fmtdesc->pixelformat = *pixelformat;
 
 	return 0;
 }
@@ -1065,7 +1096,8 @@ int sun6i_csi_capture_setup(struct sun6i_csi_device *csi_dev)
 
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

