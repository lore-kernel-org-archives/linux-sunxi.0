Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE865275B1A
	for <linux-sunxi@lists.linux.dev>; Tue, 17 Feb 2026 06:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771310489; cv=none; b=tTY8FwpeGO8/8wdnEmqc1GDJWjj/9UyijfATWZADwv4p16MqHcMEIn3h+twz8w7iLgtGVLEoYfngwGewnO+7yB7mAXLs8yaJa/vMraRlbgZuKzKUpn0+OtorAlLcXXYSliXMCujJCwplK/qByKRgKa5r7jRWMKm0CqmbQYow6zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771310489; c=relaxed/simple;
	bh=6QAaRCbkp2RPgmmp0U5tXx6iD0Q42olMqYXmxNetrCY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=H93qOeKWWQrtCTG9eDmSVzuchCul2eG0GfLyvrKWltr4B9HaViFctuHPu86y0rqPEjbaCscmAKIfYB0UTsxqtz5OuoHQdyerJIVfU0PLK9XFEDy8HQChjvD7Mo3N3k6lP4PulkgDDO0TXUJeZxUzgKeMnpZ80A01nOw/dv5+8ZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f7C6nMdq; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f7C6nMdq"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4362507f0feso2499126f8f.0
        for <linux-sunxi@lists.linux.dev>; Mon, 16 Feb 2026 22:41:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771310486; x=1771915286; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=coylU+9YFK5E+sqrx3pjXggNhPG4ewWmS2RRAiRWKNw=;
        b=f7C6nMdqAH+XUsrPOcryo87548HBNSmxjwxvY1YNRvfu4haBtFzbBQZ5wmdOYB2PTK
         +gPHqjiNcq7k/GW5F0uSCd/aDp2wHpmWsSM4nJ4VrUPRCTrQpFrmEmSMmF24M+kNV5mB
         CUCCCN7rHU1XYbEbIkhMjnXqXF1Vw3IXWSCzdodyBFY/yvLerFP2XMdtNlaWMERhM5Ep
         2TCCSLjrWuuIO/euL8AxQPx4PkhKtyzg6j8+X0rS/K5GgEsgflk01OfkZIiYEBNtefdb
         znDtaCBiNZQUMlqnfThlNlq0VeFzX8T8ckB24gPDIqIVbeKt6Z143jwnzaPqdxwPIKnW
         WbQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771310486; x=1771915286;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=coylU+9YFK5E+sqrx3pjXggNhPG4ewWmS2RRAiRWKNw=;
        b=V9xyoO0Ju0WCEi2irL9nkapFPWm87+4aeOSI4ImuQjoImn5c4QI0uPNyrAxjZMw3tl
         U9UoGibUxyFPDEQpQdRWyKM2+DYJ98oPfFswR41B6D6uVlbBa6jMphRlPjBaeVwv+r2U
         B7w+W1Wak2RKuYdqWrm2/Gnq24CE87/5zkQWCgwURe8nfOANH5YREoqgJpJnV4CYvl2M
         jn+kKIxjz6Xmp4OY4uWFDAtCdei9c7tmFU8jAzjScsQM94R48vzL80eirIEdOX85bUkv
         mEOuOQYPdBcazqbPVgyZOnwW0Lr7TMsGR6lIE6W5uzyjzsTf1iDuR/Bu1g0A56W6AcgH
         1e7w==
X-Forwarded-Encrypted: i=1; AJvYcCVRid+RSE1CVjWKNixVQmBwGmfHQImHebw0r/+jtzvdi0TSiCbvzMbYljkguGnhsch6Wl63b15mNYu2UQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwFWThUpxduYsfewE9f8xHnDUTy/nk+3qc6TOgU596OM9nQ37sh
	zdSnYMtPCCcsDBNiiTirlqfDM1tNDGXwonAqGqQUN+FVeVhAQjP4RpTc
X-Gm-Gg: AZuq6aIWHPSFW9dPKudJUo0y+WcS6HoezOTx5mHOgONmHRcSGGHXvaMxQb+oSKJZ07O
	5AATlA2GmmwIpNhF0YreDmE/iThkqzy4B0EipFhe0FpSOfKRLpz31+U7MA1db6CiTUaMFeO55xk
	LrvncjXH8Yk8y3T0hFQBCQ1ipovdcJR2HEtzB3WK962Mtc0Sy96o/BWw1NL3fZ5wnHmlaw+6+E4
	EH9KXR8eue38XQwmINAhBfpZP74feRIzru8l2Y44/bghMEdf/vomVm/yOtAyrVoY7Yr2hcqgQgJ
	+pOBzJ0gHhMYgKE7HFBURz9BH1PeQQBrF9uJpE8NI3ShQxfM9Rcn9DxQKfMY9ma/SsEsgMxyPwB
	lbtcTo3GCDTnQFNBOadd4F8Nl4s6hSKQmjaOg24vj9TARnXCWdGKs/+rkR38Kaig0AhR+l3xVzY
	9vIVcHItZudDAgRIWGAk2gqY+MR39GvC8Bm4K2QwIa9yQmVQiSupqQDBSIvMlsQd89OIgEDV0UX
	D7ZMLA9Lw==
X-Received: by 2002:a05:600c:8b4c:b0:480:5678:1fdd with SMTP id 5b1f17b1804b1-4837105240amr217898335e9.12.1771310485987;
        Mon, 16 Feb 2026 22:41:25 -0800 (PST)
Received: from thinkpad ([204.18.30.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4834d7e50casm480575605e9.8.2026.02.16.22.41.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 22:41:25 -0800 (PST)
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
Subject: [PATCH v1 2/3] media: sun6i-csi: capture: Implement vidioc_enum_framesizes
Date: Tue, 17 Feb 2026 10:10:49 +0330
Message-Id: <20260217064050.18388-3-arash.golgol@gmail.com>
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

Report the stepwise frame size range supported by the CSI capture
hardware for the pixel formats exposed by the driver.

The hardware does not perform scaling and accepts any even width and
height within the reported limits.

Signed-off-by: Arash Golgol <arash.golgol@gmail.com>
---
 .../sunxi/sun6i-csi/sun6i_csi_capture.c       | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
index a21a146fb02a..dd06d4c116e0 100644
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

