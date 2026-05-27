Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D59F8401A25
	for <linux-sunxi@lists.linux.dev>; Wed, 27 May 2026 12:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779885981; cv=none; b=Gce++0ItI3P5SvX+dc9A7/XPLTqmS9WSckL8YVy5TwWYscWg5BeADamj0lU8cwuP8bDb4Klbv2m0/3KOccHnGW58PxdhNb+XkErsaWw0XP+aRxNJODV/wFg4ok80c79Fnat2N9LKgIOuBCPbREfKeytyEgOvsVpyfO1XdhnBizU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779885981; c=relaxed/simple;
	bh=xvgx2/ubLvj8V1fHXTIV61sVEuGf5eJ/cKDPMKcxfRQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=aLSxOA0wCOJTTgK4RtQKqy2P6JcgpScbQarhHsve9TmtvB/BVZA0x11UqHeX6oGbt8nr+DZmU8U0T4GNVqGVd7L2thXtMQM1MGgkUCymeh+FjLe6vix71DIrWHu4B6iey5B5qmEf3m5/zabc+EB44g90yiViV4XwWM5fR3mCofU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K/wnCc+Q; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K/wnCc+Q"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49040362e4aso61372155e9.0
        for <linux-sunxi@lists.linux.dev>; Wed, 27 May 2026 05:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779885977; x=1780490777; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EGOXaw4Q58N9Z3gZvFI/sYtzJpUodLKIK7TomFRymZY=;
        b=K/wnCc+QPXpSdY07UTsmvZHIViUpg+Ysm6a5FrDwgEgWS3keTrUXdcWXCXtHvaMj6+
         cVhVpsf2i0V6ZjLg8ay9RXFw8qYVeoSSXld45+Hl/HilARcZMAKxPI/G8QWiBQJoICy8
         4ohqq6dhMYAtjqqQ8aleR5t8mPUQ1oUV9Z2Ws86tOa4QMEzM/z2if8M0AGniQEw7yk57
         lZW3Mruo9pVyS1ksn12h5cOEaObDLn07L9eKXWFBTE0hhn+EooVYxE4znV6p/h7U5wua
         cH5FnLte46OrzLLAqOQHckkFUF/Oj2OwoeSa0BsjdGXYG5/ZHA8cP2ETxsXYPb06vZ02
         8T7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779885977; x=1780490777;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EGOXaw4Q58N9Z3gZvFI/sYtzJpUodLKIK7TomFRymZY=;
        b=P9JK1OrBBnYtZSnP1sXo+totlFKxZOz+4Ds1k43cDXFWwiHsTcZktum9Cp+71LmmId
         ZD0tFWct5g5YpHrCMhzwTMOQ03xwzlyamilTui6Rxrloi2c8VfL3JZatgDmhfYaTEJGm
         GMqex9ytUKGeUb9YA/olLWao57E19SbwPqf9xXHSaVb/x/Wfy2SpTwRWpvO0bYghXHTX
         HpeOgmtMBJPtJ9WCsBIjYu/Wtb0LF++Ef4eM++Dsinug9juy+jpLI5460isjb2Z/s/zX
         cGQ8nqphJSujP1FHfbgKpPv6/wexF7COTEb/2NOV8B8HG2l7C6xvpdtUtiPz5ItxuIcM
         RNoA==
X-Forwarded-Encrypted: i=1; AFNElJ97ZD5gziJqLfazGvAm0FG5GKi79pU0/MLRxSYGkTT57sS1YfL4GJpkw06BcGus8QMpL2ykQ0caP6EbfA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwbuJYEc+FWpKYB4jCbw38LwnRfbAJCFI93lqckWuvHZ+Hi1puT
	+oz6Ur7shxcU1Mio2Pn7oEneKYPZqRIfaotI4fi4OngO+gonZCVmdD3BjDVyR2CqTOA=
X-Gm-Gg: Acq92OGOe5dH/qkhBYgUD8OSL2+ICpiDsCt2nKe3hpebIXqvjex0gy1f3Ad2Z84NyRK
	Bdkb3UMCjrqmFVLJbRPCXiVIhtjAtpLeggsgI9O4XSrbBEArpNhEwIdqOnHIEq+9lvqewg3ZA1n
	/UlJr7FrSoJ24tpT6AR9Wvo8jjlthHfPCdyd2KJUp0R8v+6IzQxEbd83+wIzoNk8Y5IfDFuyl3a
	f7NYlAa+/47olrEJiKUeyNXvbUdktuBNXmeLfbSbc60WGu6dNgPpg589oHj76fLVciiy4oixpac
	/8NG1WA+28SVKw5UISHgzdJndcWeLZA9sJNh1sxwRV1arNqnZXiHqGRUh98ywOG9OgJQ/SdRhbZ
	leWB/gMdxakEEii4TgAN0aLB4rNSbszQIYs8Kbv8W3o/h4TKX1awxb+j5JK6vcIQKTEPIwTHR07
	vsA97ZuSbg5ubsb8M6PBNZvWOPitXvxKJ3Vg51UBwHnK9v+RnOGaA/gumAT7PzqDRc3Vp2bjQQk
	CFOR8vi
X-Received: by 2002:a05:600c:4510:b0:48f:d5d7:df63 with SMTP id 5b1f17b1804b1-490428dfd36mr365405095e9.27.1779885976875;
        Wed, 27 May 2026 05:46:16 -0700 (PDT)
Received: from thinkpad ([46.164.76.12])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4904561a198sm386092385e9.10.2026.05.27.05.46.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 05:46:16 -0700 (PDT)
From: Arash Golgol <arash.golgol@gmail.com>
To: linux-media@vger.kernel.org
Cc: paulk@sys-base.io,
	yong.deng@magewell.com,
	mchehab@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	laurent.pinchart@ideasonboard.com,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Arash Golgol <arash.golgol@gmail.com>
Subject: [PATCH] media: sun6i-csi: bridge: Remove duplicate mbus format entries
Date: Wed, 27 May 2026 16:15:52 +0330
Message-Id: <20260527124552.33815-1-arash.golgol@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver reports MEDIA_BUS_FMT_UYVY8_2X8 and
MEDIA_BUS_FMT_UYVY8_1X16 twice when enumerating supported media bus
codes.

Remove the duplicated entries from sun6i_csi_bridge_formats[].

Signed-off-by: Arash Golgol <arash.golgol@gmail.com>
---
 .../platform/sunxi/sun6i-csi/sun6i_csi_bridge.c      | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c
index d006d9dd0170..0bec0cd7620e 100644
--- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c
@@ -113,12 +113,6 @@ static const struct sun6i_csi_bridge_format sun6i_csi_bridge_formats[] = {
 		.input_yuv_seq		= SUN6I_CSI_INPUT_YUV_SEQ_YVYU,
 		.input_yuv_seq_invert	= SUN6I_CSI_INPUT_YUV_SEQ_YUYV,
 	},
-	{
-		.mbus_code		= MEDIA_BUS_FMT_UYVY8_2X8,
-		.input_format		= SUN6I_CSI_INPUT_FMT_YUV422,
-		.input_yuv_seq		= SUN6I_CSI_INPUT_YUV_SEQ_UYVY,
-		.input_yuv_seq_invert	= SUN6I_CSI_INPUT_YUV_SEQ_VYUY,
-	},
 	{
 		.mbus_code		= MEDIA_BUS_FMT_VYUY8_2X8,
 		.input_format		= SUN6I_CSI_INPUT_FMT_YUV422,
@@ -143,12 +137,6 @@ static const struct sun6i_csi_bridge_format sun6i_csi_bridge_formats[] = {
 		.input_yuv_seq		= SUN6I_CSI_INPUT_YUV_SEQ_YVYU,
 		.input_yuv_seq_invert	= SUN6I_CSI_INPUT_YUV_SEQ_YUYV,
 	},
-	{
-		.mbus_code		= MEDIA_BUS_FMT_UYVY8_1X16,
-		.input_format		= SUN6I_CSI_INPUT_FMT_YUV422,
-		.input_yuv_seq		= SUN6I_CSI_INPUT_YUV_SEQ_UYVY,
-		.input_yuv_seq_invert	= SUN6I_CSI_INPUT_YUV_SEQ_VYUY,
-	},
 	{
 		.mbus_code		= MEDIA_BUS_FMT_VYUY8_1X16,
 		.input_format		= SUN6I_CSI_INPUT_FMT_YUV422,
-- 
2.34.1

