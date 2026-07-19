Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 183BC346ADC
	for <linux-sunxi@lists.linux.dev>; Sun, 19 Jul 2026 07:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784447861; cv=none; b=qH/XhC0zynLd08xZYuhlAWmg37z+To4pvZDuA4bRwVf/zB+uGs//g9z7syHZZ2w6aWGG2DHUGq/fMdI7IfII4IhO7zlIhdqYMMDhfa6imKF6csCWPY6m6aBGdtunsO0mF8oPjlGH6f8+AmBU6lD+Gst1SaQgUi8p1/3SzxBU7VI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784447861; c=relaxed/simple;
	bh=ZHRVZhPzlyp+x7ruhcCcGaCk7KkIkLpi8O5C2Fboo1M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eM3G3Gd8dpOgOajrCafujQqIJk+2+2x28lEndRjMwTs0WFN98chmrOFjc7qOYKBJVUYBeUP4amx+l8fKQMxGTt5jS7q3X/sENy4TUIiq0jijjbNOHDanGZlaJvyu8qqo/i3WWpx+kPTHZBpm9oLMAB6Vd8HgU0tT7kpoAv2+Nd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WydQgQUz; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WydQgQUz"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5b28c91fba5so3254348e87.1
        for <linux-sunxi@lists.linux.dev>; Sun, 19 Jul 2026 00:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784447858; x=1785052658; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9QbUYJZtIOWTqXjFT0yqfZhtKIKPSa7W9f9Fx5FbY2Q=;
        b=WydQgQUz3NT1qzl3flyewjJVdkNL2FUNnTiqrO0e/xmuXo0MkFIpRondplWJ2ehIYd
         xsD4lw53+jU2SMrWdle9mrZWevcPbBZum2FLSi8B3MgE7NoqDmVAILAIx/CO+fucQktK
         PCM1hYV57ZehFIZAEZvpE/D7alLqlx8LHpTqBosatcrScSpKKiGbgq1ssWVGNI+7Zoqk
         l9Ro0M02iSGrJmv/3N+1c7ITcNAnuNmJtXmUWsTuhYuDEAs2ZIImhS5PUPTF52wi9CmT
         YdXGFF++Ufdrc1knF4Gvk1hLtQNfoLclaD5ePjibB+76dDWJx0D3tFQlI5akOHFgBkBU
         gKxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784447858; x=1785052658;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9QbUYJZtIOWTqXjFT0yqfZhtKIKPSa7W9f9Fx5FbY2Q=;
        b=q7gDfSYLshptvvYO7nHJpnZm8RpbDdRSLioHR8B+iBFNM+YQDiXbwprvFYGJfmTja0
         /x6253FKtQwXlBC1Vq6dyUxBAz2SB6VQe+Ab8OpfiwL5X5qmgtjAnmP0Kiy0Q+lBwlZQ
         cwU78I4/oz6ZCVFSruxwCZ/YMx8CiHQx5K57Ux5ATESkY/9X/RdEbIsnVSvlKigMCcYs
         DoxOFm1FJAnwVERWPc4yYZgI+lxNpR8cci0mhkFZ5CsJULZkpUdAs+R/B5YXp91wIaSo
         pxFpnZmxQUrzfaMpLIN2ZNCBxSlb3Q76pD+GEIhSuvK9E1Ljf28t+qg73NykPz+MToO/
         plZA==
X-Forwarded-Encrypted: i=1; AHgh+RpRXwH+2hs85v1uT6DrSQ2kCCUhW85YgpqzLu8ORB+A2VAAINgfguU/hRAWX178hRCNMcxlSGZLzd/hGw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxMVJ1Th8IJhiD0y7dW4qDUWoutRThneSHuwoBKz2s3mkS1hjmT
	sERGNeGxmOyjEOjPfF6V2vRi963E6Mvrv8EcA6win61SFXI7gjZKMkns
X-Gm-Gg: AfdE7cmwwt34fS7jDAQv9WoScx8aSmNU0rX2VFeo7PeT9R1x0vaimqhMcIdw4m7kXyU
	ooeoC4rCL47BtgTmZ0mt+g8dBipOTlVPDjKVCxaKyTOwDtyxlOGxr/z1VwxrSj2zDUAYsiyaX+5
	pK5s3M8mq0f1jdtLC3VDZm96XwYQX0LPl6PQxwGFQ8Kds0W+RvQYx2JMjg1nmcpPeSNKZouvzlf
	jblxEQDSjRB64+M7JKSj0rA75A4Wc8FYWSMDw9+6hGzBwjXPIhHJbFBjROg1JBZ51234juJngO4
	Sq2UywDf3Rpdij89d0fwePGXlrkkDpimvohsz1C48ARA+Sazo+zLbESuiXxdA9OfItz5ly4O4FG
	3sF3wKls63MTDQqqQBtJ/s808QdK7DM0tTxe+ghK4LTa9p77xTcWWONL7fSxWogcM2ROuFDCBdj
	pScg4wLzPzMLqaAnGCGn3qHX9LSMZ4lL5sijqEig+/YTznik53R7NfhMvkFxg=
X-Received: by 2002:a05:6512:6412:b0:5b1:5e19:c496 with SMTP id 2adb3069b0e04-5b28a17760bmr2314551e87.14.1784447857959;
        Sun, 19 Jul 2026 00:57:37 -0700 (PDT)
Received: from thinkpad ([5.212.61.200])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b291e0e926sm1604207e87.54.2026.07.19.00.57.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 00:57:36 -0700 (PDT)
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
Subject: [PATCH v5 2/2] media: sun6i-csi: capture: Implement vidioc_enum_framesizes
Date: Sun, 19 Jul 2026 14:57:14 +0330
Message-Id: <20260719112714.72802-3-arash.golgol@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260719112714.72802-1-arash.golgol@gmail.com>
References: <20260719112714.72802-1-arash.golgol@gmail.com>
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
 .../sunxi/sun6i-csi/sun6i_csi_capture.c       | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
index d90abba21309..e17c7f82ff47 100644
--- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
@@ -738,6 +738,33 @@ static int sun6i_csi_capture_enum_fmt(struct file *file, void *priv,
 	return 0;
 }
 
+static int sun6i_csi_capture_enum_framesize(struct file *file, void *fh,
+					    struct v4l2_frmsizeenum *fsize)
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
+
+	if (fsize->pixel_format == V4L2_PIX_FMT_NV12_16L16) {
+		fsize->stepwise.step_width = 16;
+		fsize->stepwise.step_height = 16;
+	} else {
+		fsize->stepwise.step_width = 2;
+		fsize->stepwise.step_height = 2;
+	}
+
+	return 0;
+}
+
 static int sun6i_csi_capture_g_fmt(struct file *file, void *priv,
 				   struct v4l2_format *format)
 {
@@ -805,6 +832,7 @@ static const struct v4l2_ioctl_ops sun6i_csi_capture_ioctl_ops = {
 	.vidioc_querycap		= sun6i_csi_capture_querycap,
 
 	.vidioc_enum_fmt_vid_cap	= sun6i_csi_capture_enum_fmt,
+	.vidioc_enum_framesizes		= sun6i_csi_capture_enum_framesize,
 	.vidioc_g_fmt_vid_cap		= sun6i_csi_capture_g_fmt,
 	.vidioc_s_fmt_vid_cap		= sun6i_csi_capture_s_fmt,
 	.vidioc_try_fmt_vid_cap		= sun6i_csi_capture_try_fmt,
-- 
2.34.1

