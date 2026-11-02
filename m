Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793639008;
	b=xaIcX+ZgFipMbG0dg2T/360IBswASDvN3G/VhWOMiZ0Zv43e1KNt5orU2/+LBAWcZNDo
	 NNGHiiERBdA5Z9ekLDzpkgbVRc+vuG1mfgB26D1SP42LRhpJVeR23vEU8No/FFdm8UN7b
	 JrLWRAuxo40CVVqdczILa9/iLH2xZsNUpMzfTKyX5fjzaQyPKaaOGFWVxPe+ZMmzg1gfR
	 MExOPP95k1D45VOsw0MIKwmPnZ9vR0pPPi4zG6zBgccc44d0GvdA+sOnXJWazjpmh86XD
	 FBskdMwRS0+PY+VmGGvRkeU41DtrGTuNRaPp2j0SYlUFWr9aDggD1MfCna99k1/EMGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793639008;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ifkMz93jDcWFK+TugNjNJ0UJbkiZmfoGYcbnJzIO7y8=;
	b=zqxFCGN95WdBIjMCE564GFhY5qmE90PzocohCrRyggNsJcbQvvBqCgmezgy7vE24tCZn
	 gGZ2qVo1Ea8sfUduST1fV2Fg1s0EnrcM6xTdKVnZuiGJBcum6gRcGmvCWhjDne8aNawm8
	 Jv8g5V7w7pqQXryoD0T5+2AFjI6RWl/PlL+7Hh2jE46COIWXJJxtW3zYFox55Sy9bF5Xq
	 gKk2Tb8TR/A0T+5TUYMryLdersK+Y8bPo9emXtr0eRaXLoEcqDxvMi7l5ypq7qqm/gEEr
	 684cbhdJz/OUPU4/mO2oCO/XyyON1l/Vxbm88GpI9HQcxtTZm6MKZZNmYatiV0tvd4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zFHDkv1h;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DDC6606F3EE
	for <linux-sunxi@lists.linux.dev>; Mon,  2 Nov 2026 17:03:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DDC6606F3EE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zFHDkv1h
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48c4d99c32bso2255552f8f.1
        for <linux-sunxi@lists.linux.dev>; Mon, 02 Nov 2026 09:03:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793639006; x=1794243806; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ifkMz93jDcWFK+TugNjNJ0UJbkiZmfoGYcbnJzIO7y8=;
        b=zFHDkv1h7d7lUtX8hfMlkLimS7F9pEmAHiBJJvkRkz3WXGCvKufuQUdF3UnZrFfHk6
         dCBWX8dDLQRaeVHb6JWN4w7PDy6lwUMdrEPmlQmWPZwL8vnq9Rt/5yBcwLxqQ3/Urn9/
         fa4Q/cgwRWkGfL1Iny6GvFMtWNmL8heM5MlPOrczT96U7HhvUo+H6+rRqbBg1F1wge+E
         SWYG+3++W1M5vlazOQTDlTdI41g8lIUU+LmD9kdQ3K0Vn5l4ZuWpN9qRF2C0nYCoOETc
         Juzzj4j2f8WLptq3Fx7qufBncpwuxMIfuD1EaPF+cRyUjXbHxxRpxhRdASjW91nBl4Kg
         TKTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793639006; x=1794243806;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ifkMz93jDcWFK+TugNjNJ0UJbkiZmfoGYcbnJzIO7y8=;
        b=Gpv+rMeMcYAionF+jhIWDjgmWisOb4vJ1t/UNCzEtOEUWijFuP27xvBhURMYUHn7oa
         ghpjHAlz4dvlT1//r6G/2oua+sX6GS+0xQik6NTK55KJyVRv0pCiYRL/PJ1UvLMVEQg9
         zB9aozXVA+Wx48ly3r5lYLeG3yNgHzDVZyBp0/jlsAPwg28YaL1SZZYn7Afy1NJPfp9x
         e8EoP7OgmQOTSP0m+HYAz7XN/+IRZIfVLFfGD/W/Ya7+GDLgG8r5y6FShQK7GXULrxaY
         8JnATQetkO3nIRhr/WbbbiUBWilSpzNbVYHJCWlDjz1y3FltqzJmgWmc71EsHbGkWPOX
         6s/Q==
X-Forwarded-Encrypted: i=1; AKwUvByqfTOl/WKKI0O5U0L+LUNuQSi/22E6dUbeha1rLJzyz0zgfWUVBXLiz36Dzgxkvm93icx0/e1ZC8g7wQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z8xkKCNP0MArz9M0sGECBVoGC25GL3VY2jlQvBb5fDNL2qv1LNb
	rO+yH49tUgKfmllQWOg2cnp0LnsWwCD1OzHyW1G9hl8mW6JOrkLcXHAS
X-Gm-Gg: AYBFou3bnhtMz32qks4KB6ih9oz1IIDRegzgia505X2ePNjBfP+A7FV+gfhweNdbz3H
	BohiM9ftg8uEBCfwpAh3hc68cMOrFL0zBQWPeOqcaRHmYcrXpdnhxZ3xL0083DUBOVI/sIvuERl
	BepueOIUiCvyQAA+TdjfM0jn/WTtyH3Ig8iR6Eip96ZQT1gXP0x0PTsPzMk7MdnPqzYUEy1L0Tp
	0kN9XPFy8Isx0s8SQg2Yc9xRHsp8tPepIEIuG3bCY0tf71IjDLwuv2RMXMJszR5uRbMOFgNR3L4
	6j+PZp+tT1tbtvmwt3oVa9XeMdHWB/jWz3PhNDWuxNF/zJUjN1tUuMbQTWGPTiIRexn151gYM2e
	Fp4RKR6RpTBT+jxuNf5g1oPhtjfpqbXAPVkEFVgyWdX7EqovGl4dK0ttnE3G24SMFhgEu3rayjp
	xu27QWwEh1LfaA2pDEimWcx5VSqDlmGbcC/G7GvoS8APbE7P4+1Os0/S+b6X8VHwmexltqbgn4Z
	BZx/CuaBVdRZ8dMwEotQUWbPTjHFrtDItHS8xSqMX8G8bvTUa3jVnoQalaQZ4EtjX4rtpsEAWB2
	vhz75mkuWSIKf7+klAHD7RYzSRqT5V7IGlc7RtYoNiK6H79H2zb40JW59GTV7z3ogdHJYwiR1ch
	pri5CP8YtpnEFcjso7WVx9LwfRtbdq2aIdfSel2Gs82sx+rD+n/lrkStxphDo/0hYaqcma3+o2U
	EC5yhkhoADjRpF5IBxBujMv8PvSAC8BqlrMPtGrCvlap+LqRgcXi9HyIn/EJbZyMTdksc1DUR9H
	rSMEO65wlcVhmWeDA4xkAiC0q3gdgQ0rZ/Zu6czB6P76c05Og==
X-Received: by 2002:a5d:5f84:0:b0:48d:eec6:308b with SMTP id ffacd0b85a97d-48e6e4f561bmr25233093f8f.21.1793639005534;
        Mon, 02 Nov 2026 09:03:25 -0800 (PST)
Received: from jernej-laptop (194-152-27-116.dynamic.telemach.net. [194.152.27.116])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d3cesm23362309f8f.7.2026.11.02.09.03.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 09:03:25 -0800 (PST)
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
Subject: [PATCH 05/10] staging: media: cedrus: mpeg2: derive the field order of field pictures
Date: Mon,  2 Nov 2026 18:02:58 +0100
Message-ID: <20261102170303.1973892-6-jernej.skrabec@gmail.com>
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

The hardware uses the top field first bit of the picture header to tell
the first field of a frame from the second one. However,
top_field_first is always 0 in field pictures, so userspace passes
V4L2_MPEG2_PIC_FLAG_TOP_FIELD_FIRST cleared, and the second field of
every top field first pair is predicted from the wrong reference.

Detect the second field in the driver instead: it has the opposite
parity of the previous field and is decoded into the same capture
buffer. This works with unmodified userspace.

Fixes: 50e761516f2b ("media: platform: Add Cedrus VPU decoder driver")
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus.h   |  5 +++
 .../staging/media/sunxi/cedrus/cedrus_mpeg2.c | 32 +++++++++++++++++--
 2 files changed, 35 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.h b/drivers/staging/media/sunxi/cedrus/cedrus.h
index 54f867949fba..a523b56a9b8c 100644
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
index ca66a3c6b830..4c8accee5389 100644
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
@@ -186,6 +206,13 @@ static int cedrus_mpeg2_setup(struct cedrus_ctx *ctx, struct cedrus_run *run)
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
@@ -203,5 +230,6 @@ struct cedrus_dec_ops cedrus_dec_ops_mpeg2 = {
 	.irq_disable	= cedrus_mpeg2_irq_disable,
 	.irq_status	= cedrus_mpeg2_irq_status,
 	.setup		= cedrus_mpeg2_setup,
+	.start		= cedrus_mpeg2_start,
 	.trigger	= cedrus_mpeg2_trigger,
 };
-- 
2.43.0

