Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793639011;
	b=r49n5SFQyHtogFuV+3iEFvwKgsN6HU6BBNru5fpBaB6Ujyva9eaPU9kf+Zr/9Qy+PQg/
	 YvZKAvL18VWsi3xVHnzdSllj2Vy7hhN11w1gYpTYTPZBB+WkpL0tggUVbHuzjWHRcLRH+
	 ymL+Db7Xu/oDoyRluGjBu8UZPYz+KmAgLpDIlfHVW9WoE4WMR8VxAHZwy9Cx3HxryIn7Y
	 w8CkOfchGZy3J2enYTa/Fu8HtaoLYZAG+UYCzEahkmGju8ig7Kt9waypJ3oA6bH7P75w7
	 VYGYHl+IZFOPI4XAXWNArbdYB8s/7aSu2ayVGyuSCxz+7wrp4pKlophIT+6X7vcZMvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793639011;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=NKzzwtKTgXz6R9jTvzKIhg/OY56xKISF3o/pTEJt26A=;
	b=2g21WR9Yyvw3bI6LTxcet1bHWePPqHj0gLxjr4rA31rRayHoTYkLDF/N1BWDT8TF1ale
	 cYgq2mHjUkJBBMGOHHqw0ds8sn+rW6xRiykfQadXFpQUaZnzHwchHtQi2HDvnQuO7s1bF
	 RQhFlWdWxfINTx5GA2Z99az8wQtdck3eYBJeodiSwA/V3E34pBNzI+9f3Chn5B8w+VppT
	 ZEOMhbujNdYA/Qen+XMTy0tWw1oDgPCUN0aWw3Lbru/3SjPHnfxFxlZgE2tltC8q1I6Ov
	 yEh1euNvVt8DFnVK22e1+G56IZ19SpaE2uo83I0ZTDSJm6ZnfOKi9F+ZzumXnkzbv4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XN8FETN4;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F545607BDD7
	for <linux-sunxi@lists.linux.dev>; Mon,  2 Nov 2026 17:03:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F545607BDD7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XN8FETN4
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a215e64962so29299445e9.1
        for <linux-sunxi@lists.linux.dev>; Mon, 02 Nov 2026 09:03:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793639008; x=1794243808; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NKzzwtKTgXz6R9jTvzKIhg/OY56xKISF3o/pTEJt26A=;
        b=XN8FETN47UdQi0w+N+yGgxnd11rJ+OwJ2lgP8KCOV7YN0AaC02gk1E7E5kX4oczrg9
         /sa5vH6uZcGcZyRB4qTQeJYnDdFp8kzPCK1YZBbhSc68vgjH73kDdoxRj/WKeJJVRpJM
         E+tWcFsWk5uKv3fmbiCyB8AfRSCB4o8m2Gs4b/R2yac4iJdGUj77moK772izvr2doog0
         MFRpMDgiyKPy1LQto4iqSBhP5xLkjfHyf/WcxkWpP6muildB+AlgdXh9/MY4Ag+FVIBp
         lY7TQZTYhdFbnmZTLv2nupakY9ccasnSY/v3+9A136jt+HxdEv8j9TjY5o7g/ePc0aXt
         BdTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793639008; x=1794243808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NKzzwtKTgXz6R9jTvzKIhg/OY56xKISF3o/pTEJt26A=;
        b=oLw4/RoDWyuZ4/1B4V4yVTSHCqh44btIFde7/b+zXeAB+2wCcupuJ6t1aMeRMUczM1
         8FHZZXh+/T8FwYRGBU4Ld9RiqYqfDEizH/W1n4E48FCdvtFS4z5wajEdsVHiRFpBaRQf
         OxBDk++FBaMrD+wHCao7CqPT2e268bQg4kSQfjtRXaUsuqNjiVnKUZMZHstM8tTrd/2b
         sryTBSCEYrL6KUL9rQDkwpKHqJau+1KjQQUNsyyb6CMu6cVsWGXVhVZmc2qR3di4pC7+
         t6RYZWhDyqlgvNFOJi8rqRhOCwwKOTqM7DAAerkDkz1mFPd2k1CchinaEAOiLQBmpsMu
         gw0w==
X-Forwarded-Encrypted: i=1; AKwUvBzkGb4tZtxZmO+xGNIep+7GdkY+5Q6a+xZdd6Dgf0RL8TI3a1/EKcpSgzJD8JEE2oYKw78lBsOPTNUhBQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYL+ZEa7I0wjokcsvVuZeTBt9k+/d9gd9kgH+1q0Jvp4ZjQobag6
	xOMG8NOV+Jngo9N7ZdCmQpcQeu0QpE04A+I0DhIW6842jBiOjYccBMy+
X-Gm-Gg: AYBFou3A3Tuq7HKuc6PMKKZHbMiZE/2z7/QdqmH9BNZhwaApVD3lllvUGIIhXWMw31Y
	a+KRm0EKAXQO3rv0ANXXKdGQAP6RuA2RUUuxXg2xMuWtuFJ3q2I6NvCD3zdYF7TfOCm8tOfBSMt
	QtGiomqvncGEnaITk9GHb63KSo+5lVbo0HHop1oTo09eeiw7aeyAA70XOxmDekXjjW9v7ORepWD
	BG2FeFPYUtTSZWZGeIffW7KDQZhXOIO0Ts0wuwITulCvBFrNlklZs9cJ+LcR9vExwts78g0cof/
	P9Tv2AvKaSlyIa3j+3etUyvIx6eYrKkTEBM8dSvhGY8ZmY9voT5EBuYpuiTbTiHlZSRiuLNLpDN
	kL92LHnXiF5XSYKV11FLR5Pm//LFyRfhG8R8366aL1jWVGGg2irgfeN4enWno5HNPAmparHA5OP
	kUtLOc8g6sT1fCj0CYKTOWxb6kxrEASVgxrvhL6fujYzK748D657K8/aKzoKnzDuzP7tFM3+wQW
	9NgMqE2wcjZrI2I+2ACfj4AfQjgdQOZTDYmgxpkAz6iIj+F3fR4jYMEwkaDqDcWhxF+zaNqg8eu
	uQzm41Fwpi7z9GdhKpqPXvQyy8gq/pWrE+5raZHleGypTsp0iJMhsCKqGUAjXonPXUPlucPcdcL
	tZG84qroORTGI8UqbwZmb5QHW81JaGJEsTnwLpmNRT8kHVSS1l3cVcV2vuR3VaHVo86sxVpFwbV
	qVm1Y82zsGhV+WCFE2nH/SkjjLQ9ngkWah2jOVG1M3ao+XW7pXvQulpJrFobeBu6WCrTsif2yq7
	DExEgRnnRZR65lQMA0Wzw6EwSD9R7xbO5npoCacF9rHGlf09A==
X-Received: by 2002:a05:600c:1385:b0:4a3:5991:718 with SMTP id 5b1f17b1804b1-4ac182dc0a1mr261716365e9.16.1793639008306;
        Mon, 02 Nov 2026 09:03:28 -0800 (PST)
Received: from jernej-laptop (194-152-27-116.dynamic.telemach.net. [194.152.27.116])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d3cesm23362309f8f.7.2026.11.02.09.03.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 09:03:27 -0800 (PST)
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
Subject: [PATCH 07/10] staging: media: cedrus: validate VP8 frame size
Date: Mon,  2 Nov 2026 18:03:00 +0100
Message-ID: <20261102170303.1973892-8-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261102170303.1973892-1-jernej.skrabec@gmail.com>
References: <20261102170303.1973892-1-jernej.skrabec@gmail.com>
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

Check the frame size in try_ctrl, like for the H.264 and HEVC SPS.

Fixes: 3c39a16d30d8 ("media: cedrus: Add support for VP8 decoding")
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/staging/media/sunxi/cedrus/cedrus.c
index 45deebddb630..756243795de8 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
@@ -77,6 +77,11 @@ static int cedrus_try_ctrl(struct v4l2_ctrl *ctrl)
 					  (sps->pic_width_in_mbs_minus1 + 1) * 16,
 					  height))
 			return -EINVAL;
+	} else if (ctrl->id == V4L2_CID_STATELESS_VP8_FRAME) {
+		const struct v4l2_ctrl_vp8_frame *frame = ctrl->p_new.p_vp8_frame;
+
+		if (cedrus_check_pic_size(ctx, frame->width, frame->height))
+			return -EINVAL;
 	} else if (ctrl->id == V4L2_CID_STATELESS_HEVC_SPS) {
 		const struct v4l2_ctrl_hevc_sps *sps = ctrl->p_new.p_hevc_sps;
 		unsigned int bit_depth, max_depth;
@@ -270,6 +275,7 @@ static const struct cedrus_control cedrus_controls[] = {
 	{
 		.cfg = {
 			.id	= V4L2_CID_STATELESS_VP8_FRAME,
+			.ops	= &cedrus_ctrl_ops,
 		},
 		.capabilities	= CEDRUS_CAPABILITY_VP8_DEC,
 	},
-- 
2.43.0

