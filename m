Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794246676;
	b=FF0JlufJ0Zc9ha/Q5NJSE0WPynfimu1pSxV2K3Qd++zizeVejPjpDZEhkg50eqy35SAU
	 eRYakycOnCtvnF5AhZdDMqOthxOi/pbpU3qkWHBJPpiSowi/zVm4YMkpvfe88uUsXJbPE
	 wLS0snPFbDyYpNub6dYptRfM9SgZ5BreAjAGzxxw6v8s3FRrihz42X0KmjwduIMBp2ZRp
	 2PQaAzwtPoAU5jOsTTvOxj2raQ1raSpBJesq1KmmIN70IueTQQbSbe9cK8NJ9dvrxZVA9
	 cnoZxwip+SC9UT3TUoyUG237ZcUY8/96hnC/p07pGdtIZqd2QI4J9ASBaDKDvJpg9TA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794246676;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=TdLeBYk5l0qracH7zm/PgUIBOPpvvVlqRb/gtdQ+yJ4=;
	b=L4ihzCTt3lWrnRgSeWf+WedCfJ+5A2PfMLpa+xMDiVZ9CeJq5J+QFNL8ILm9hgjCcwKb
	 UBHBX+dau7SXMLBTFQgMau32FGSxHDcVjSucRIdNqB8kGWSKzi/hPIRwEXmYy01n1gvCp
	 WnNHsP7R86vILJuZ2vJhnM9gATx215zHo7jxFSjIzL+l6dRzBhGKmjxjVwczbxIBL6kqZ
	 b12bSzsZDp1yaKkj+G7oOGZYxDT1WHWv33VXskP6NRZYqxpwvKVXUpi/ma+S8Odpio6So
	 OKRQhYdUAbQ2MeSIiDNr4atQbE7+hPUbpVTrS7SeNIl9WAz1rWchCqRkJYKtaFZrPjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nh0pC3a9;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34DBD60A5BCE
	for <linux-sunxi@lists.linux.dev>; Mon,  9 Nov 2026 17:51:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34DBD60A5BCE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nh0pC3a9
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso9747395e9.3
        for <linux-sunxi@lists.linux.dev>; Mon, 09 Nov 2026 09:51:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794246675; x=1794851475; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TdLeBYk5l0qracH7zm/PgUIBOPpvvVlqRb/gtdQ+yJ4=;
        b=nh0pC3a9TDlypb6X3q5xZvNF3wApy0w/9e2Lm86SpXbhDpEUG+hf95EmFZb+1UI5Qk
         zRYAQwSPzcBQgfDUhs6WRooepBqxqiMg/KeYsTdbRcfG3Skn8Qt6ITilcHI66zHVvVq6
         3fRT3FcseXIZzCao9wp3S6oNWQdL81AmpBWIRpsQiiORVVhS/i8GbZfnpSlxmaIqei4x
         tp6IYqKr1ucAiC93K1tO2L1XK2FhsP8IbRnshl1HOXmnGcyXr41jPI+cogUW/Nrx2SGN
         QOrM4g7I+bwW9UpzjBtzF+ky21zo+wMxKC59c4RYHeTP2/ubhL+gluJH1RrGGnwXX9eU
         VYTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794246675; x=1794851475;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TdLeBYk5l0qracH7zm/PgUIBOPpvvVlqRb/gtdQ+yJ4=;
        b=0FA7uSkPa/IZheg3haQKe2qjI12IM+fkwDedJBnrqQXAkX9kpRjR+lp1TdgicN/2+e
         Czuv/KqXKmi7hfLAe4YxQB0mJjFC8/MCysI08bprJLDR+sUt3pIc51y4QnRIUqfYL/PL
         UdWv4FYez9esytWlI5lZq4Hj/V82RHZ/WnNPceM5kZgtbLzwd0WSMuJ43u7LOBQlZPUP
         9d+xld3z1htCruQzo+gIc/amI2N7h+9BdKMQ4K1mS4kYCgCSPcR38I7E3g9GHwXo6ynS
         VfQ2rJVO8qgt1Dp5pgil2+Sv3hXBMbsdTPrkxJ+aJujeQV/EYRgSeIWfb0/RybB2y2L8
         hCMw==
X-Forwarded-Encrypted: i=1; AL+hErG7bvPKJIwSmAJIn/5LxCiag3/2QCfc66zMYux/1/eFU6EU6wsw4JFIrZrqWivJSsDUty0JHVNWLWp5Kw==@lists.linux.dev
X-Gm-Message-State: APuU4Z9RUHMuOmd8g/vHjzwwOKNSmx3eBY8sm6ZuqYOsVf3noQmVNVUK
	X6GJPi3qToP8FCX7rBWr80qK3iZherzlh+P9JnjDEhn9i4KuCbLdy7Pu
X-Gm-Gg: AYBFou2PE7E0kTgb/2RrwdcxvwNgN5Xb5HrNTbo2Vz6GmjaUjCyzmu31W49vgYvj4oW
	PI5dxtixZc4cZaf9V51fcdY6IbXT8D0WAUjiazkynBV6Qz8LCefObhSspeyWtGldVp7tqU3GFAW
	bba9gl5bonQcCN2YXxINliqxDtMiOD0rDkXtsrNCTjS61b9IyJK4dITbltZy1y6l/Q/r3F2gNwJ
	qVNWgCddeuXp6JMeCWdQRRTjCoGaQo4bcSrM8X6g7OVHh2CyABQFQc6Msr8P4NsK+MGuuDhKPqt
	Yaex1kI/oXR8FxluaSUfsye9DaOAV0WSeqT5b6IaJqnz9rSun/l3tIRic3zG9BR7wfZs1vQuOlW
	7mzB70qow9IavNzfWfko3YVhVyYEVpRIkbdW5tpi7kEFqbTqGkzv2kIQhkswraKjRVT7IX1a94B
	IIjre1S319Uc5EJgK2MwEai1FR4gpmWYX2AVHzQng8ATpLNefZXX4VT5+QRWQgdx22umZVUj+pR
	FbWhF3WC6vXxBLxpHpiT7BYmv/7uTDJCPGgZC6E7Bx/K9/sZeJJeFJwyzaN08mZKwWNoCBuigAc
	cXMwJT/xFk+ufhiPEozF7OcP/aSKVDBYywGzyD2nR/0L5TgrZwi2LZU8gX2uqtXvMcr5FA5G2n4
	sj/QVLv0ug8EoqfuYFgCKD3B/D4dEZDMRx7FykS75BEAvKP0DTs5jOllNuUs2FwyWztc9WprPe/
	7NJAX407UQYDsmSzqMOP/LMQf7Ijf44tzaq7jxsUP0LY6TZ1/JTJSOsMc8tT2/bbQzHnB6baEbv
	+CFmf2DkHxLvSrhEJUx5NaqkcbEW38WzkBdxHAgrHFJYc8Uq5M=
X-Received: by 2002:a05:600c:1d08:b0:4b7:6942:39bf with SMTP id 5b1f17b1804b1-4b963c8156fmr85596545e9.28.1794246674551;
        Mon, 09 Nov 2026 09:51:14 -0800 (PST)
Received: from jernej-laptop (86-58-12-36.dynamic.telemach.net. [86.58.12.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498369a4238sm200717f8f.54.2026.11.09.09.51.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 09:51:14 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v2 07/11] staging: media: cedrus: validate VP8 frame size
Date: Mon,  9 Nov 2026 18:50:12 +0100
Message-ID: <20261109175016.42061-8-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261109175016.42061-1-jernej.skrabec@gmail.com>
References: <20261109175016.42061-1-jernej.skrabec@gmail.com>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A VP8 key frame can change the frame size. If userspace doesn't
reallocate the capture buffers, the hardware writes and reads past the
buffers, which shows up as IOMMU page faults and decode timeouts.

Like for the H.264 and HEVC SPS, reject frames beyond the hardware
limits in try_ctrl, and fail the job in the setup callback if the frame
doesn't fit the buffers. The VP8 frame size register holds the size in
8-bit macroblock counts, so VP8 frames are limited to 4080 pixels in
width.

Fixes: 3c39a16d30d8 ("media: cedrus: Add support for VP8 decoding")
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus.c     | 10 ++++++++++
 drivers/staging/media/sunxi/cedrus/cedrus_vp8.c |  3 +++
 2 files changed, 13 insertions(+)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/staging/media/sunxi/cedrus/cedrus.c
index 197213911bf7..6c6aa45f5f96 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
@@ -28,6 +28,8 @@
 #include "cedrus_dec.h"
 #include "cedrus_hw.h"
 
+#define CEDRUS_VP8_MAX_WIDTH	4080U
+
 /*
  * Reject picture sizes beyond the hardware limits. Whether the picture fits
  * the buffers is checked when a job is set up, see cedrus_check_pic_size().
@@ -54,6 +56,13 @@ static int cedrus_try_ctrl(struct v4l2_ctrl *ctrl)
 		if (!cedrus_pic_size_supported(cedrus_h264_sps_width(sps),
 					       cedrus_h264_sps_height(sps)))
 			return -EINVAL;
+	} else if (ctrl->id == V4L2_CID_STATELESS_VP8_FRAME) {
+		const struct v4l2_ctrl_vp8_frame *frame = ctrl->p_new.p_vp8_frame;
+
+		/* The VP8 frame size register holds 8-bit macroblock counts. */
+		if (!cedrus_pic_size_supported(frame->width, frame->height) ||
+		    frame->width > CEDRUS_VP8_MAX_WIDTH)
+			return -EINVAL;
 	} else if (ctrl->id == V4L2_CID_STATELESS_HEVC_SPS) {
 		const struct v4l2_ctrl_hevc_sps *sps = ctrl->p_new.p_hevc_sps;
 		struct cedrus_ctx *ctx = container_of(ctrl->handler, struct cedrus_ctx, hdl);
@@ -248,6 +257,7 @@ static const struct cedrus_control cedrus_controls[] = {
 	{
 		.cfg = {
 			.id	= V4L2_CID_STATELESS_VP8_FRAME,
+			.ops	= &cedrus_ctrl_ops,
 		},
 		.capabilities	= CEDRUS_CAPABILITY_VP8_DEC,
 	},
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_vp8.c b/drivers/staging/media/sunxi/cedrus/cedrus_vp8.c
index 969677a3bbf9..fecca343bd92 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_vp8.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_vp8.c
@@ -662,6 +662,9 @@ static int cedrus_vp8_setup(struct cedrus_ctx *ctx, struct cedrus_run *run)
 	int header_size;
 	u32 reg;
 
+	if (cedrus_check_pic_size(ctx, slice->width, slice->height))
+		return -EINVAL;
+
 	cedrus_engine_enable(ctx);
 
 	cedrus_write(dev, VE_H264_CTRL, VE_H264_CTRL_VP8);
-- 
2.43.0

