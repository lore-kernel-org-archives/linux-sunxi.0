Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794246672;
	b=H3mLXRB96C3mjTbfFUqdC1AyOGM0FrYpYrR87ukX0UULaes0b8fQwMzywWASAo1heAlS
	 hz9MmOd1H7vC6lzGvrjN4LBIAPqEV1otnHM3wEJkumyhYEsGm3SC2s+h7g31xKTY/r91e
	 4Z7pOC6VIJFg0Oe2rIAHsE1ZQNfTk6EqymyFM7uJzSUmCsllpI9ytYO7OuVl5VSs3eZ6X
	 tVyeY7ObuQ2mGvAe2HaQWoU8s+sS1ni5aj09kENriI/Xfjenghr8ueByyqIrc7dZBKSKZ
	 dHNPlCI/3FkR+/vt+TbmvIXwTNUeEVjNB5TvPfklLknPc7tEtztFk0IG49KB4sCY0Tg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794246672;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=dRPAaRbuPiDQoNbXSXuTf0QKQZLyeuwtHbl0ZEG8jNI=;
	b=0y3Povar+oC0GspykWsBJiKq62B0Q9EjTpjee3MXLH2C8hZaFEqe1OPK903u2HxDPrrd
	 m6LfPS2haUeF597v5TyonN6FkZC/UULFFfWoAH2UujSapA9tbaPPJrbX7hQBr01vsbWNh
	 mCYSTNj+PC2bhBKpRg14Z3FHqQyRlNaNpOIku16ktoohx9hvMXInDksfMuibFcZPuwl1+
	 G0QCrpZLfoZuDrNmXvGiZgxY9ayrGfAlag3EgBZSZJ97RwCrO0aFdz3AUPyTr+zKv9ER7
	 xjBqJ+VP9z6YDoAajqUwrgB3DNhTIMOlDvhSD92u6ZeJdoGJxNOiVBiOnltyvwHvg1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H5rcFrQ1;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6867160A263E
	for <linux-sunxi@lists.linux.dev>; Mon,  9 Nov 2026 17:51:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6867160A263E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H5rcFrQ1
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48e1d0e5dafso806946f8f.1
        for <linux-sunxi@lists.linux.dev>; Mon, 09 Nov 2026 09:51:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794246670; x=1794851470; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dRPAaRbuPiDQoNbXSXuTf0QKQZLyeuwtHbl0ZEG8jNI=;
        b=H5rcFrQ1WtL+NBo1kGIp4ghCzVIzMninnNrjHSTzQiXsWEI6XPFBPQjetNVZ+DNrpi
         AWmimF1XZHY/xMfNc5HDwssKzWSwIFZhe5ZBk+pyowXePoiFUE5azjshFRiDc4BivFsd
         9k4MmEDIJpbWUqa85K+5slBe150tzY4RFRkbMfRpNNafoZhrbHdcxJqMQNpwffQRuR1x
         qgBfwwdAQ4gCU/fjJWEM6jgI1I+FyHGeB/MTLOgChIxPLC6xzclGxFEFMN1dINLjlbs1
         jgtWu/y3RcJtkI0VCkhiYPnIpo1sm1dLrmsD4TYwjBJjFT7EgApIwBgvcTVmYJTsvdkM
         bPww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794246670; x=1794851470;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dRPAaRbuPiDQoNbXSXuTf0QKQZLyeuwtHbl0ZEG8jNI=;
        b=XEUN58Uwa8k2ivlU5JiESkvBamW7R6sFkg5ONKuN+L3IO/lhd1o/D1goy/EX2O/ixv
         +pRxGN9lRNx49MXKeToRliUdwgn+d4Op8OFyqkG3xFf3lsUH5gJLp/iU+T06y1U3GOhK
         qBsRi/qNvnLNs+heB5OkQjaGVlyHB9nGjsAMnX3AFmYCcpBHyL3NscO96gJR87wSDm4t
         l2wD2FLPls7GGIXfBUbeVK5S9UsVbgXZXVwcGdDRAVSRnGtVWTAOBqwFm9S+qjSjvZt/
         /HR+61CPu8pt688orkf4IAbyo+ziLf4NgMHzx4R9G7FA7m4bJJ4tFuV/0MLcw5s/szPS
         AbUw==
X-Forwarded-Encrypted: i=1; AL+hErFGaWACZAbm6BKFRHiKHMNmtNssXWEDMheCCqVP9YZrGAPbGJNyj7397jQiFZA31vxs24lp7irS4XywHg==@lists.linux.dev
X-Gm-Message-State: APuU4Z8cTEv9YIqKJsNWSJpYCuHrME//toqnlLL4pwYvHYdGEnFFiIYh
	65Ijw3uvVd1lOpiHSsehgLGxBAGKwiC6893Rz99nwcu0M9in2zuOxJTf
X-Gm-Gg: AYBFou3uag0YZB1JEP+XPmQD5f+yEnsQPy2fkC0ZbgrEQVmVH3jD2oS+o2s0KlChtko
	y5umjLNWKw59NyvAzP4WXLQt3DbiYGOjMSQExTAHuGbXf8UP+Y0PvzExBKOgG40d9AnNjLATeQO
	OfTjrTg95svHQHDwhZUNmBUKsHz0qgo8DB1L84Hzq9Sb9wnr9+sx4TQ0hmCH2LoGxUjVXcFkHO/
	TjiwSDt5EXBFrPAKBbE5bn4B2XVbl+4ylmlAOUN6KLMd+A2mfenuJMWSRlpTlWSJaCMe8rDJE5Q
	iawUIEtk+IZ9dLjafCpraJjzxRsDGS1dy/ioBY3052Upembn3dFBamt2TL8cuSZD84Lh7R/LAW7
	4tEwaiwC6wis9mVLek6ocvBKEfjrtQK8nXy5YAibcV8bHItKuX9r6ok3El25L5Jpy/tpmdyYu46
	euavuxoObnqzuRyK4hdSjq5VC4zlI1I0neweLxzqw5Ju3nlFHS6209BJyTIGQE9KaoNAXEtnSI9
	6W9PxwrqJMDXEWqYAH/QqlVCRIiVLhywnrA1N+ubh07Ws6+BJP+jO/jts7rq9GcHnbgrW3pb89t
	CBAaeSzp/l1EPmtMt27myP42aiq5TJqgJpTUyuIeoMftBCXlnv6pGJ7VNl4B/rDwobcqsgSB8Lr
	58sWD85SVNf5KO865Mx/XmRhwiQS5R0GXj7AhltFe3lnWwsoy71Pj2O7Jp+GnTvuvMQexFTo/6R
	Bdrol0idd4QJUjx9LAMza8xsKYuL9FwMdAKRC/1QdL1bnyEeurXJPFArnKYXmxBiT7Wyi+VBjks
	4vfYkNRyKHZOV7AgfAkpFD4OsmS/vFIg2xmt6z7mixzdVM72mc=
X-Received: by 2002:adf:e184:0:b0:495:b427:1e6f with SMTP id ffacd0b85a97d-4982e920d55mr359034f8f.0.1794246669666;
        Mon, 09 Nov 2026 09:51:09 -0800 (PST)
Received: from jernej-laptop (86-58-12-36.dynamic.telemach.net. [86.58.12.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498369a4238sm200717f8f.54.2026.11.09.09.51.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 09:51:09 -0800 (PST)
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
Subject: [PATCH v2 03/11] staging: media: cedrus: h264: mark long-term references in the frame info
Date: Mon,  9 Nov 2026 18:50:08 +0100
Message-ID: <20261109175016.42061-4-jernej.skrabec@gmail.com>
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

The frame info of a reference has a reference type for each field, in
bits 1:0 for the top field and 5:4 for the bottom one, which is 1 for a
long-term reference. The driver never sets it, so the hardware handles
long-term references like short-term ones, also where they differ, like
in temporal direct and implicit weighted prediction. The vendor library
sets it.

Set it from the DPB entry of each reference. When the second field of a
pair is decoded into the buffer of the first one, the entry of the
output buffer keeps the reference type of the first field.

This fixes MR8_BT_B and MR9_BT_B of the H.264 conformance suite.

Fixes: 6eb9b758e307 ("media: cedrus: Add H264 decoding support")
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 .../staging/media/sunxi/cedrus/cedrus_h264.c  | 24 ++++++++++++++++++-
 .../staging/media/sunxi/cedrus/cedrus_regs.h  |  8 +++++++
 2 files changed, 31 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
index e8229c60d3f5..97958ceee8d1 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
@@ -69,13 +69,19 @@ static void cedrus_fill_ref_pic(struct cedrus_ctx *ctx,
 				struct cedrus_buffer *buf,
 				unsigned int top_field_order_cnt,
 				unsigned int bottom_field_order_cnt,
+				u32 ref_type,
 				struct cedrus_h264_sram_ref_pic *pic)
 {
 	struct vb2_buffer *vbuf = &buf->m2m_buf.vb.vb2_buf;
+	u32 frame_info;
 
 	pic->top_field_order_cnt = cpu_to_le32(top_field_order_cnt);
 	pic->bottom_field_order_cnt = cpu_to_le32(bottom_field_order_cnt);
-	pic->frame_info = cpu_to_le32(buf->codec.h264.pic_type << 8);
+
+	frame_info = VE_H264_FRAME_INFO_TOP_REF_TYPE(ref_type) |
+		     VE_H264_FRAME_INFO_BOT_REF_TYPE(ref_type) |
+		     VE_H264_FRAME_INFO_PIC_TYPE(buf->codec.h264.pic_type);
+	pic->frame_info = cpu_to_le32(frame_info);
 
 	pic->luma_ptr = cpu_to_le32(cedrus_buf_addr(vbuf, &ctx->dst_fmt, 0));
 	pic->chroma_ptr = cpu_to_le32(cedrus_buf_addr(vbuf, &ctx->dst_fmt, 1));
@@ -83,12 +89,21 @@ static void cedrus_fill_ref_pic(struct cedrus_ctx *ctx,
 	pic->mv_col_bot_ptr = cpu_to_le32(cedrus_h264_mv_col_buf_addr(buf, 1));
 }
 
+static u32 cedrus_h264_ref_type(const struct v4l2_h264_dpb_entry *dpb)
+{
+	if (dpb->flags & V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM)
+		return VE_H264_FRAME_INFO_REF_TYPE_LONG_TERM;
+
+	return VE_H264_FRAME_INFO_REF_TYPE_SHORT_TERM;
+}
+
 static int cedrus_write_frame_list(struct cedrus_ctx *ctx,
 				   struct cedrus_run *run)
 {
 	struct cedrus_h264_sram_ref_pic pic_list[CEDRUS_H264_FRAME_NUM];
 	const struct v4l2_ctrl_h264_decode_params *decode = run->h264.decode_params;
 	const struct v4l2_ctrl_h264_sps *sps = run->h264.sps;
+	u32 output_ref_type = VE_H264_FRAME_INFO_REF_TYPE_SHORT_TERM;
 	struct vb2_queue *cap_q;
 	struct cedrus_buffer *output_buf;
 	struct cedrus_dev *dev = ctx->dev;
@@ -117,8 +132,13 @@ static int cedrus_write_frame_list(struct cedrus_ctx *ctx,
 		position = cedrus_buf->codec.h264.position;
 		used_dpbs |= BIT(position);
 
+		/*
+		 * The second field of a pair is decoded into the buffer of the
+		 * first one, which keeps its reference type.
+		 */
 		if (run->dst->vb2_buf.timestamp == dpb->reference_ts) {
 			output = position;
+			output_ref_type = cedrus_h264_ref_type(dpb);
 			continue;
 		}
 
@@ -128,6 +148,7 @@ static int cedrus_write_frame_list(struct cedrus_ctx *ctx,
 		cedrus_fill_ref_pic(ctx, cedrus_buf,
 				    dpb->top_field_order_cnt,
 				    dpb->bottom_field_order_cnt,
+				    cedrus_h264_ref_type(dpb),
 				    &pic_list[position]);
 	}
 
@@ -174,6 +195,7 @@ static int cedrus_write_frame_list(struct cedrus_ctx *ctx,
 	cedrus_fill_ref_pic(ctx, output_buf,
 			    decode->top_field_order_cnt,
 			    decode->bottom_field_order_cnt,
+			    output_ref_type,
 			    &pic_list[position]);
 
 	cedrus_h264_write_sram(dev, CEDRUS_SRAM_H264_FRAMEBUFFER_LIST,
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_regs.h b/drivers/staging/media/sunxi/cedrus/cedrus_regs.h
index 05e6cbc548ab..961fe023bb43 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_regs.h
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_regs.h
@@ -616,6 +616,14 @@
 #define VE_AVC_SRAM_PORT_OFFSET		0x2e0
 #define VE_AVC_SRAM_PORT_DATA		0x2e4
 
+/* Frame info word of a frame buffer list entry in the AVC SRAM */
+#define VE_H264_FRAME_INFO_PIC_TYPE(v)		SHIFT_AND_MASK_BITS(v, 9, 8)
+#define VE_H264_FRAME_INFO_BOT_REF_TYPE(v)	SHIFT_AND_MASK_BITS(v, 5, 4)
+#define VE_H264_FRAME_INFO_TOP_REF_TYPE(v)	SHIFT_AND_MASK_BITS(v, 1, 0)
+
+#define VE_H264_FRAME_INFO_REF_TYPE_SHORT_TERM	0
+#define VE_H264_FRAME_INFO_REF_TYPE_LONG_TERM	1
+
 #define VE_VP8_PPS			0x214
 #define VE_VP8_PPS_PIC_TYPE_P_FRAME		BIT(31)
 #define VE_VP8_PPS_LAST_SHARPNESS_LEVEL(v)	SHIFT_AND_MASK_BITS(v, 30, 28)
-- 
2.43.0

