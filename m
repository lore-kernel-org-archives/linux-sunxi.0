Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA7F53C3F67
	for <linux-sunxi@lists.linux.dev>; Fri, 16 Oct 2026 11:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792150710; cv=none; b=EiDHRxgDOA0c78Hu8UWMTimoOeszo4L8KsoqeCFlHqNegwciWOZQbNIkO4Cwk3gSNQCjMiI4RH5E0WToLE6utShN2xvRw2JmLnoTNbGlFSNTord9UDAt+kUjptWS8eRjEt2SAP8C6i8CQWt785VaV1aq4L1M4MtwyXoN2a/L16k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792150710; c=relaxed/simple;
	bh=l1Yvh7rzxmJFQNQ6JrhSj6hapxpZPGneRByCd1HbvAQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=s+5FRJnMxVgyS3eRFZaoMvwqDAJz+OZXuckKxy2UaG060ieuJDl/TR672V8rf841xkq1IMzphdyuJT1QAZYG0onSBDk9Srqtn9ZVp3RWgvPGBTjFCqddKHnJXEQBWiwMDpD4TSbI+vVsriN9ajs4vI5JEx3tJV+gpYZGnX+nGJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WY8QIfVd; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WY8QIfVd"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a022fee0caso59399495e9.1
        for <linux-sunxi@lists.linux.dev>; Fri, 16 Oct 2026 04:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792150707; x=1792755507; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hgmnL8mkzlZYj6mWZA/tchnETE3V3TFCY3ed+26L7nQ=;
        b=WY8QIfVdAwnc5aY4NhaIQsqo5NXOn/qWcTiOvnYxHJUp8bZukOLX+62/4vZfKcelOW
         YwbC/Za7eRB0+lxCaTchGaBmn8JbBOfdUePrlg6D11kHMnNxfnna85SImdaP1t6IULtX
         +WbvJuQ0cG4rV1rezKQh9j865AkaqTkShA/GIFBcXASehAxBKItEEO/ft/DiDQOn8m1S
         PTsgPSY8HD8hp+FXe1ikqLrcPBHYdpiNWH3kyUxS/f9XWhdEmZXsxE4vPX+tnZynlasK
         oksExdwP6rQC6X28uYecL0+4Y+sWnsd5stPkvFi4hAhHbxRO0MnMbV0y2vjSFh6obfHs
         chOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792150707; x=1792755507;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hgmnL8mkzlZYj6mWZA/tchnETE3V3TFCY3ed+26L7nQ=;
        b=aO6hesTrUaBehzF38aL+Rm90gg4tSAdNjpBvYPzrfPFgVUpvXLazEDeXBSpnBTKJl/
         Qsrv0Qw68Xl8gaIZjdMt7vn3/5twxqfKKGLZfXo0fKqO3p+R43Fq1ol+k/zPTszZqzVv
         Lj1z5KKgxYoQobItdEWoomcvLijIjj7ZBeEadA4OPhgRjeKZVA5/oDslBviFWUY5kSjI
         67tLaezZqnee5GIaitswd/3LV74t3JAF6b5N0tSOq0c0PgUTZZAtfkxhVVIF5bhKfhQG
         2sRf4ScqQzWRiZDky14JJjwcHm1tFaL45pUsnOshHp0hQZF9/snG86FQccLyVKCBf7YQ
         9EiA==
X-Forwarded-Encrypted: i=1; AKwUvBynM8xm5dKJawbdZZlqwqF/E5IYrl76jmTowR0HAvWpVbYlADdJyRAdY2RxXYSbgL+8Ef7XbPqyf+/gZg==@lists.linux.dev
X-Gm-Message-State: AFq9FYISlHfoCGR3t/l4B5j+ujMWf78mzrUFHhP+IizEqs8JH6l+dIeI
	BElxdTzoPGU04rV+12d/ayg6ScCscnpXQApK4J+zXiSfGILcLht8Aeic
X-Gm-Gg: AYBFou0NpzZ61GXGNC5SrjYD0XHqrw/mPJXTEf61G5ziKAhlpADnAk1sHsnXrnuSMRH
	+sVO2i+wrChwx1xuUNZQRc8wdZh/CJyHC/n05qVGNeDSC1AgnLfdcj+b1immDUtXw+DPpX99jYm
	9tfjhtZex4wUMBls69sbA3ZCi5BK0mhUnH3o0d5rUQgdS5tkoxTM4JV6GDREEfe5myfPY9nUETc
	BaXjwE33sa6O0JpDXXbf1H71XSx4SN8oHONELWQiJsYYBrk9zeocIMZyijpT/vfvtIHxmLxguUd
	U7Ez0Di5AgGyUCF7yD+H8Y6MEBDtYt4M20vHYxfLhRnaS1b2qm9xU9NpnuxMt7+FIgMh/ji8s9V
	U/1AUGgHWLRcm43uapq5wSh9t2+7dNmYyotHVH9ZNZbsiITQCX7YYOXGg3Cd2xApKJ3ktCCTlVU
	3Rq2CoExuA3iZEu+gUdjvgxctYiL9/OiF15OhCOez3sOs+JpbQyT/6kyHgtZfwv3F5Sjr36GbQa
	cifM2Vezhrj42sbs6kD8PFDE2cfVLp573MWHw7/tVTjhSRIdVh6cfNwTQ==
X-Received: by 2002:a05:600c:8184:b0:49f:ffd0:4039 with SMTP id 5b1f17b1804b1-4a18e4f2221mr418624145e9.32.1792150706893;
        Fri, 16 Oct 2026 04:38:26 -0700 (PDT)
Received: from thinkpad ([2.176.196.112])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1ce33ad3fsm36169855e9.5.2026.10.16.04.38.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 04:38:26 -0700 (PDT)
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
Subject: [PATCH v1 3/3] media: sun6i-csi: bridge: Remove duplicate mbus format entries
Date: Fri, 16 Oct 2026 15:08:46 +0330
Message-Id: <20261016113846.8602-4-arash.golgol@gmail.com>
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

The driver reports MEDIA_BUS_FMT_UYVY8_2X8 and
MEDIA_BUS_FMT_UYVY8_1X16 twice when enumerating supported media bus
codes.

Remove the duplicated entries from sun6i_csi_bridge_formats[].

Signed-off-by: Arash Golgol <arash.golgol@gmail.com>
Reviewed-by: Paul Kocialkowski <paulk@sys-base.io>
---
 .../platform/sunxi/sun6i-csi/sun6i_csi_bridge.c      | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c
index f9ee94fc1293..0331b55f489a 100644
--- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c
@@ -93,12 +93,6 @@ static const struct sun6i_csi_bridge_format sun6i_csi_bridge_formats[] = {
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
@@ -123,12 +117,6 @@ static const struct sun6i_csi_bridge_format sun6i_csi_bridge_formats[] = {
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

