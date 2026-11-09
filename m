Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794246674;
	b=puFqbwYutWB/zbHa6HoJqpROekiPBs1E4HJzpUvEBzcewimlKIbWh+laY/wvjtRt2Lvg
	 +OEEZcWvn7kn4HMsJFnuuuIqpZSkuwRgwhMNeEyS9f19aD3abl0afwkMptSOSR5l9z5l5
	 n/eV/JY7wC6LofM6Wj9xxtM6SCIjzOKKENvt3hU+b6hJEuMxjieZha5htmKDTKVySZ9Si
	 BrTTZbIzaZG8TY1fNomjWzs9MwDEmUlYWkcRhCohdSkzGpb7eAPo3dC4SXjSqJi2Eghfw
	 Nv4XIh4i2FVPJJssAZmNEM1kYb1WoP8aJoMl+sC30tgOPyq8xFHqqOTXFUVCQdoLp/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794246674;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=EMH3OXraqN/u0b7tImF7Qn3xU7G/zv7ZwqiQdfYEX2U=;
	b=Pn/GcmJs7tPAf36EJlgrwnwCUni9aL/x5H2xWh1c0FamWRXKX0Px4qNRSvTwVyJ+gqZS
	 nA5L13+eEYf2pqJKOSFAsQ3ydiyi/wEGLx9RKSSgNr0JHU7raVwR2Dwtd6V1hokLP3gVJ
	 inFslk0Qr1kluDer/lv1VDSdT295jfKf+eol26ZYIA9He6b0PtEEWlnN2hiF6/tVYK/1Q
	 x3cm+hYIIxGXXtE6K85cXHbPeHr3+NESOsq3B/uE6lAb8llElzq6/s0/Juq1za5djEOO8
	 VJPiPG/lguRktkPVjLMjvHS6oD1sMNFs/I1mGPwDwizyji4aTDJagedEVt09IZUXc7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="G5erAmE/";
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFC1960A381F
	for <linux-sunxi@lists.linux.dev>; Mon,  9 Nov 2026 17:51:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BFC1960A381F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G5erAmE/
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4ba013938d7so1609605e9.2
        for <linux-sunxi@lists.linux.dev>; Mon, 09 Nov 2026 09:51:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794246672; x=1794851472; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EMH3OXraqN/u0b7tImF7Qn3xU7G/zv7ZwqiQdfYEX2U=;
        b=G5erAmE/4tI8WG7l7OgsB8U+BNJ7yP2bCFXMKTcPNTr/oRooB4QyPcV++VZNSszLpD
         4WoWGuvxBn0IIjJpu5MiSdaCVLsgFdAAaJXxhqYdN5cZFHfDtDssYNLpsx+5M2GHTh9N
         Ra6bNz+MBKAtpQ4RQXcoDaC3hDFSFSYB5Mmgv0QjkoWhVeSlhRbxnbHryl5LFUM38It9
         EBPZ6DqnDwztyjyrNJxdbooqGwhLC13Ahx/+AhklrVwaDHSs5CEEantUFhyyYXxbr47m
         O3ux8Mw9y1rN4mAdevtUSGpqG0GYGimVYY55m02CyC3u7L6/0NBi8JnWXKyg2pL1hGeL
         V8ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794246672; x=1794851472;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EMH3OXraqN/u0b7tImF7Qn3xU7G/zv7ZwqiQdfYEX2U=;
        b=DxXD435a6i9VRLNTEZ3sU4DZaBXjIVaB4oSmzTMn8EE2RdWBLGxBtvzCfT2vVxerGY
         oKtbefdbu866IpzYGLHGB5KU8qiq5krcLwi4X4r02S1ZDW7yflSeN+M7wHlMnKNkL7x+
         y9CynjYXzKkAsQQq9m0ol/65Yuy+5/ZZhfvyKx3SYFtjJXwpxoR2N5yUMmc+n3T4j7ot
         x1y87HvrJheFa3O1/ek/V4pOOoTfpe7qfnncmhX5amxmO7tBe3dWWAIAhUSMPjVB9GB0
         6pkXw26C0L5nU2BCajLJmFHYz6vJGKDpcg+gekLRTj0WZP/vXKBg4oAbbTufujC/e2/9
         4QGA==
X-Forwarded-Encrypted: i=1; AL+hErGBIyZ+EQ6t99DwWm55tTfWMhpYMTyRwQpW5bBT9fSh4XP6xELk/Q7bFssqsptoCIMX6OSAn36+FDvKzw==@lists.linux.dev
X-Gm-Message-State: APuU4Z+/Bw//fejV4Z9C5VzM7401OUtwR5OonycuonPffrLNZDyAAghf
	tJyHPKKD/w8QGv/kwJZD+XfuZDXc2RrZmESiQwBFl1gyfwH7GqPgjbyOHgypvw==
X-Gm-Gg: AYBFou1u9IJIGWqZwtEydnA7haxlOA7zV23vOM3sA2EFfXTZa5E5W9PT6OjJxrP78hj
	kR7MU5tjF5V6cBRD3OhEleewc/NNGuZnh0lXWcBJRgUMWalKniDZ1+edyFQ6BgK6iqjrI8n95dp
	9w8bex7T3gqC+KpDXF/vcPAbnecCJHU8ATBqDMHMy+MoWcaGN5f1Eu1Fj4fUMf4z8VJqzz7SXpm
	8Xq8vrwNZSsolwokT4Q5OZIFWuA3YiV8uctG301cPlX8lrPmNyBwVXYuDFBrKuNGZzHruMM8YUE
	nbYQtqesjVBptYgafGviQ4HfE75ibTcjpjUTSBFTT9wJia/6uNQ6EYVGmtYiP689GW99Wl68YGO
	zIYALDPqHKbQzZMFY4j2mste7Ndf14Z7xty3ViAVQNZji/Dhr4rLUpkdGTTHKmHEHUenQ5l3pSv
	XopTPIUstOLRf5jq33E3SyuKW/bpdSnZc5iUWQN1onsImD06/lxnJqu4ZUtbQGQWjq1URnCCuK5
	VHvP+ZfXgBLyQmHX0ggQTMDNZuqeWGZBkofWngtyhleA9hO5lF2RND49aJFZdk9EVXB2pUO9KWz
	zv/olJ1S1GWhb6cLt2L/TOGfylvFfiwmw2NtHBUuyN0OJOexL+WH3J3WJdbAc4mann7aZpKVauF
	+hyOQc5avZ80Sm97S60JRPN1jycMepi9/+OQDQQ/J4ETS7Gdo27bcFEc6ZZYma5HH6XelWUfbJM
	EH602vuPklJ1d4L3zvTJKCHF4+Pc7OtrP7d+pj0nFF0SnxqtZta07I57wZ/bwrrmjqwfFZ4OqD6
	+JDVhsfjEYtQ+wx3mvUUuWpSLtL4jGCigVapQx01XHsOoG4gfI=
X-Received: by 2002:a05:600c:4ec7:b0:4a1:ddaa:571e with SMTP id 5b1f17b1804b1-4b963c8591bmr96421945e9.15.1794246672153;
        Mon, 09 Nov 2026 09:51:12 -0800 (PST)
Received: from jernej-laptop (86-58-12-36.dynamic.telemach.net. [86.58.12.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498369a4238sm200717f8f.54.2026.11.09.09.51.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 09:51:11 -0800 (PST)
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
Subject: [PATCH v2 05/11] staging: media: cedrus: mpeg2: derive the field order of field pictures
Date: Mon,  9 Nov 2026 18:50:10 +0100
Message-ID: <20261109175016.42061-6-jernej.skrabec@gmail.com>
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

The hardware uses the top field first bit of the picture header to tell
the first field of a frame from the second one. However,
top_field_first is always 0 in field pictures, so userspace passes
V4L2_MPEG2_PIC_FLAG_TOP_FIELD_FIRST cleared, and the second field of
every top field first pair is predicted from the wrong reference.

Detect the second field in the driver instead: it has the opposite
parity of the previous field and is decoded into the same capture
buffer. This works with unmodified userspace.

Fixes: 50e761516f2b ("media: platform: Add Cedrus VPU decoder driver")
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus.h   |  5 +++
 .../staging/media/sunxi/cedrus/cedrus_mpeg2.c | 32 +++++++++++++++++--
 2 files changed, 35 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.h b/drivers/staging/media/sunxi/cedrus/cedrus.h
index c2318521d7e5..572e70a94b3f 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.h
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.h
@@ -144,6 +144,11 @@ struct cedrus_ctx {
 			void		*entry_points_buf;
 			dma_addr_t	entry_points_buf_addr;
 		} h265;
+		struct {
+			bool		pair_pending;
+			unsigned int	pair_dst;
+			u8		pair_structure;
+		} mpeg2;
 		struct {
 			unsigned int	last_frame_p_type;
 			unsigned int	last_filter_type;
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c b/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c
index 8252a47994aa..315b0e5b3c88 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c
@@ -58,7 +58,7 @@ static int cedrus_mpeg2_setup(struct cedrus_ctx *ctx, struct cedrus_run *run)
 	struct vb2_queue *vq;
 	const u8 *matrix;
 	unsigned int i;
-	bool field;
+	bool field, tff;
 	u32 reg;
 
 	seq = run->mpeg2.sequence;
@@ -87,6 +87,26 @@ static int cedrus_mpeg2_setup(struct cedrus_ctx *ctx, struct cedrus_run *run)
 		cedrus_write(dev, VE_DEC_MPEG_IQMINPUT, reg);
 	}
 
+	/*
+	 * top_field_first is always 0 in field pictures, but the hardware
+	 * uses this bit to tell the first field of a frame from the second.
+	 * A field is the second one when it has the opposite parity of the
+	 * previous field and is decoded into the same capture buffer.
+	 */
+	if (pic->picture_structure == V4L2_MPEG2_PIC_FRAME) {
+		tff = !!(pic->flags & V4L2_MPEG2_PIC_FLAG_TOP_FIELD_FIRST);
+		ctx->codec.mpeg2.pair_pending = false;
+	} else {
+		bool second = ctx->codec.mpeg2.pair_pending &&
+			      ctx->codec.mpeg2.pair_structure != pic->picture_structure &&
+			      ctx->codec.mpeg2.pair_dst == run->dst->vb2_buf.index;
+
+		tff = (pic->picture_structure == V4L2_MPEG2_PIC_TOP_FIELD) != second;
+		ctx->codec.mpeg2.pair_pending = !second;
+		ctx->codec.mpeg2.pair_structure = pic->picture_structure;
+		ctx->codec.mpeg2.pair_dst = run->dst->vb2_buf.index;
+	}
+
 	/* Set MPEG picture header. */
 
 	reg = VE_DEC_MPEG_MP12HDR_SLICE_TYPE(pic->picture_coding_type);
@@ -96,7 +116,7 @@ static int cedrus_mpeg2_setup(struct cedrus_ctx *ctx, struct cedrus_run *run)
 	reg |= VE_DEC_MPEG_MP12HDR_F_CODE(1, 1, pic->f_code[1][1]);
 	reg |= VE_DEC_MPEG_MP12HDR_INTRA_DC_PRECISION(pic->intra_dc_precision);
 	reg |= VE_DEC_MPEG_MP12HDR_INTRA_PICTURE_STRUCTURE(pic->picture_structure);
-	reg |= VE_DEC_MPEG_MP12HDR_TOP_FIELD_FIRST(pic->flags & V4L2_MPEG2_PIC_FLAG_TOP_FIELD_FIRST);
+	reg |= VE_DEC_MPEG_MP12HDR_TOP_FIELD_FIRST(tff);
 	reg |= VE_DEC_MPEG_MP12HDR_FRAME_PRED_FRAME_DCT(pic->flags & V4L2_MPEG2_PIC_FLAG_FRAME_PRED_DCT);
 	reg |= VE_DEC_MPEG_MP12HDR_CONCEALMENT_MOTION_VECTORS(pic->flags & V4L2_MPEG2_PIC_FLAG_CONCEALMENT_MV);
 	reg |= VE_DEC_MPEG_MP12HDR_Q_SCALE_TYPE(pic->flags & V4L2_MPEG2_PIC_FLAG_Q_SCALE_TYPE);
@@ -188,6 +208,13 @@ static int cedrus_mpeg2_setup(struct cedrus_ctx *ctx, struct cedrus_run *run)
 	return 0;
 }
 
+static int cedrus_mpeg2_start(struct cedrus_ctx *ctx)
+{
+	memset(&ctx->codec.mpeg2, 0, sizeof(ctx->codec.mpeg2));
+
+	return 0;
+}
+
 static void cedrus_mpeg2_trigger(struct cedrus_ctx *ctx)
 {
 	struct cedrus_dev *dev = ctx->dev;
@@ -205,5 +232,6 @@ struct cedrus_dec_ops cedrus_dec_ops_mpeg2 = {
 	.irq_disable	= cedrus_mpeg2_irq_disable,
 	.irq_status	= cedrus_mpeg2_irq_status,
 	.setup		= cedrus_mpeg2_setup,
+	.start		= cedrus_mpeg2_start,
 	.trigger	= cedrus_mpeg2_trigger,
 };
-- 
2.43.0

