Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F064E372066
	for <linux-sunxi@lists.linux.dev>; Fri, 17 Jul 2026 16:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784304373; cv=none; b=Y3gZssEEZg2E6TrydL0vvl0QN1E9pjNxfkQMFdViMwMse4YcD9T1lJM/1c5FExNumWBMIA3Y4KJpWsc/7FvojrTK70ImwIPiL+nc3eyvpx/ng2rberxw7uuCR1dJPVUBLQENUNCLerCckSFcTykVdsfWoJ8HSM57wRrBpq9csKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784304373; c=relaxed/simple;
	bh=H1k0d5nueQY2kXWjFqFdXAC+193REXYAdbNl4ofy6dQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JXg2qMbHUa6QgKy/6183aZQUOIdUsBUTcm4PfzhXABWdpaitvq30mk8vycL6WlgCGYF+aHLwBeo2tcDlbS7jn473VDLOgD491O/TmIXJdl1DHPcU86RDqzbzu5Vj6Q+2r3/CmKQlKGO5IM3jWdbGNesRrV5ltpAnim0dVxaBSjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I4lsbDwr; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I4lsbDwr"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5aeba09900bso3570932e87.2
        for <linux-sunxi@lists.linux.dev>; Fri, 17 Jul 2026 09:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784304370; x=1784909170; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=toQ9yiBWtG+Up1Zylcu9tHLCyoLfcGQvSFRzIedvl6s=;
        b=I4lsbDwrVFwl63itlAJOYTbT0AgMv2oj2kfLDx8KVp53RieMKq387VC41qPjwKwJJp
         hbhxgrX4JSS3kobj22fde7r6vTe8N5OttY7GTV+2hykMHCyqetg506TkXkWdIdmBB2Zm
         SoK/97pKRXZoKU0+vL8dx0hLp5VKYZgZKSalohQWAnhyA/AtLRI3ZQ9xIbBQ73n04Hab
         dcZaKV4l1Gctzd42RDA94UozLXk4NDN86p7Qzaow42A1fj09XxQd2JSv9Fyg4QSsKaK4
         gBfWjRCYWfkh4XN163dFBYThGU8yDmgzJ0rGgQwe0SvsfFXCc7TXemCHV1Agi74TzhLG
         nWwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784304370; x=1784909170;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=toQ9yiBWtG+Up1Zylcu9tHLCyoLfcGQvSFRzIedvl6s=;
        b=FUCmNdNinQYnzMYdUdc6IfADHRXqXAtzTPyNBkGB4g0zkcRuoNsXyedMFml7/FKXIY
         s2I1x67vwr7D6YwNsj0vjnEhJQQGQiugANgutcQ1d4ZnoXtgGNi3kQPYpGOjnRTV5vGu
         hYyVsXpliXux2khyQmUUsg4PqFHWf8GXR1CRwTEdXH04ocRhzaRdQhG940wRI8+PtOWd
         ryYJxGa61oVfIw4SaUnsLlZXLlEBUkDQZl2ZngAygDK050rC5DKbdq6Ujql+NOC2V9wW
         +jwFWmYnwO4yfNVcgGA0DmdHfH/KI+ldWaST2nOXs/EukOx4CMl5mqX31mH0jbMq6pje
         k59g==
X-Forwarded-Encrypted: i=1; AHgh+Rq063Diq/a8Sg5snldoNyXo3ea1wqj2H82hVO81791gp19CokSz8p/pBLy7zPNncMYIBG9+XwHz5P+R6Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YwP0+IeGrSNj8Dr1RjR8Darty4jTYX3PTOQ2OUNDvTnXNRSoArn
	5dmCHRSZc4bf4nhY9604ql/pPodPGgdImean/6y+rksY3+4LJHS1QkfU
X-Gm-Gg: AfdE7ckynEZT1W2nPHJJkrfWie44TtyAqmtQD6D66EkkXrcPpi0C35iZcgSan11EuY/
	Ma8wpISk2xOD9O2Jz6Hd8jT3kvHji89f0xzyPVoC8qouwYXJ+B8FGV55so2ro3tDz2pm6nD5C/j
	k01kbUf4DfZd9QweNf+imaooBkP74OvJnHZrZdVz03yHg/tlhvmRpN4gNxVkjbVNEA09VvhYn0N
	TdffxjD2Ke+txFmNfUDsfacoWSV6pRRduuHcff1y2hsmesv0oMSQu5z+lKaBdvyg8GEnWfKEAVL
	35uWIeo+Ti473c0cblmsts49+HdgjbVimBNLLZm7deNAYs5TzJnHMaydUV4gkhHvDUYnOxUVKlz
	rEbs/PVnL6bNjp2KMmHFFTAyNgfLBarakYxZVziETH7zfrYd9N7Oz2f7qd0eHNko23xA0V6RN7Q
	xfvxyMjvfdKQlNTUtheuezCi+zziM4+RqGBowN1S7JluvXLZMuukJjFdJrrTSf
X-Received: by 2002:a05:6512:15a3:b0:5ae:c27b:f7a0 with SMTP id 2adb3069b0e04-5b28f8551f1mr764576e87.11.1784304369207;
        Fri, 17 Jul 2026 09:06:09 -0700 (PDT)
Received: from thinkpad ([5.215.185.239])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b291daf111sm454996e87.37.2026.07.17.09.06.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 09:06:08 -0700 (PDT)
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
Subject: [PATCH v4 2/2] media: sun6i-csi: capture: Implement vidioc_enum_framesizes
Date: Fri, 17 Jul 2026 19:35:47 +0330
Message-Id: <20260717160547.44460-3-arash.golgol@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260717160547.44460-1-arash.golgol@gmail.com>
References: <20260717160547.44460-1-arash.golgol@gmail.com>
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
 .../sunxi/sun6i-csi/sun6i_csi_capture.c       | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
index d90abba21309..f788b4234673 100644
--- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
@@ -738,6 +738,27 @@ static int sun6i_csi_capture_enum_fmt(struct file *file, void *priv,
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

