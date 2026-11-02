Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793639009;
	b=nqqIkPEx4zvcuCfMRHsOhfQ906BbkeMVb2lZFoWRFrG1YxqHvim7cSYEpnbiPZLzDrOu
	 P5kEx+aiCDMf+udvNpcBKxG1D5DfIr/sg41bvNdxSrX7JppewoQyUBaSnNPeKK4/AllT0
	 Jcl8HsifOmeQAyu55dQpa/McHivhF3UkEnlp9UDTfA+LkUXfy/5EFNlM7/dyUH+j3/z1W
	 l0xuOR+2tNPyGNPo4yBMXxnf9dfiVIqe9pcvC8hBrJjpmROnKlRJoZSbpTv5CJx8OoYUv
	 Z86K4E/vh3KGmmciDMxwAw/sBVwrFIt6jnFrHlHqAUvk1YSpaIczgIjmh651L+RB7/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793639009;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=DB2KcGsKCTwj0N32grxyHjYPqw3VEDsJ25BOlOdNqgk=;
	b=yR19ivImRbrAFeHi1H5RxV4XXgxax1PaJElbjD3F0SkOZMjO3TDo+E2UGTGEl5QP60ge
	 cBZiHcI57JGWMe9nKR6SK4BKf63aBAYCmdFjnZ997Rqx3FS3ssiTAD7ApGgEA66bZSrgy
	 6rpqQ8a4M5L5oCuMPDingazZFPjC5RxzbKYL++R4hQVvn430JnN0C2fRDIP/vywuLkaL/
	 y4zgGftoVgjPHnk6QJ2888CQMi46e6cI+IntXZ11/v1sfLldTLLeQQsQ4rkC6uENwb9xB
	 tmNLGNC4i5eXUF0mmWKkVNuJT0aU9g0ntp+D3EoHHrjNoarmAlhmaTZ2lXZbS7MvYuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KCL3Mwq8;
	arc=none smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A18BE607038D
	for <linux-sunxi@lists.linux.dev>; Mon,  2 Nov 2026 17:03:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A18BE607038D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KCL3Mwq8
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c4203bbb1e9so523911466b.3
        for <linux-sunxi@lists.linux.dev>; Mon, 02 Nov 2026 09:03:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793639007; x=1794243807; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DB2KcGsKCTwj0N32grxyHjYPqw3VEDsJ25BOlOdNqgk=;
        b=KCL3Mwq8UkLAxCHfpo2k0X7U5kA/LPaflNY5kGoBHgHB1/LSAGkFFL4e2sKKDNQHSR
         OALxbI58OWc0R64yR8hTKwqjkoPUnOFwWDKGrlzSD84r3pwbpF3DZehAqsScTy3tdZ+W
         X7bT3ChJQXOaR0Hvgt9FlpB5jbmJRJMmIwwOPpHY+CozNrYyPXxU8tUOOICozmsOe0/W
         TXzrCWBupIN6d+Mh3G7J49Uzsa5Z0WH+RaSp99YrRb6g5UHUy7CEkYmNu1hYijIYfIIB
         mremis2Jf9KTPB+qGf830eANds5VZIiTr/G2+/1pPSWmrzIGkQmo3ee1SG3Swyxy1E2T
         DU4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793639007; x=1794243807;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DB2KcGsKCTwj0N32grxyHjYPqw3VEDsJ25BOlOdNqgk=;
        b=Dzaq5ea8t7GEv/RKE+oxnsff1kpKl3ohd4JygS+Vmqo2DA9HLqPbg73jj7zVNo9ufc
         6pAxXSTo2OB/oYK/MVMX5dqU74C6IB2N4Eu6VIIQhopnRFaUePumhwvIcj27NZH9djgi
         NATVCGZxsEOvYVH9auAl5u8y32ODs2+hhxK6X26J3c7X7ZCYz9YZEufYVwNj5K1pgQea
         8tMCocC3yoEJasZiH0dmom3WGvsvwJ9Pv+RTutpI+Rx/TmYV588A4+v4M2qsAXhAzTEa
         d3ZaJYR1nuCRjZtWZLMNJmXPWcY664BypinCCEskM0TIE6oJwZ9DAN639yBrpTQhTwFr
         0KGg==
X-Forwarded-Encrypted: i=1; AKwUvBx765eqQ8A0KZmofNUK9d9IU0ESIDOV7i9AdcrKyQTLCOn1yCFTSCb7UweTecKdfkcGovliKE4KkimIYg==@lists.linux.dev
X-Gm-Message-State: APuU4Z+3/8g/r/r0XsZPC7Gd1DLYFVWQmIC8X6i+syyHOlCh33OpbDpo
	l8CqQiXTrj5+e4pXinfqEmxTwXJhjF4f6UYKAcf3vkTF+lQqoMQMYywR
X-Gm-Gg: AYBFou2iRqEt755QQD3xQxXcbStHZOcilOQtY9SNFJ0PogvK/BeERDubhIg9YVxiAOF
	vYkrBPx3RX2i1bJJOjWsFmcRZL7Li3NcsiKaQwCpu5Nps4uM/D135+RF3gD4tFxkizGqlnz5KoB
	C2WLhQj+GIIRXoMMp7iOdhSzrHieu9yAV9A2TG2l8U1nkDZ9zSdRHEt+zKLIcZQbLBVh6pSLb84
	MLu1TVnCCCvZJz6i2i8zO7wJNmz+sSjX+tEkV5mLXaOs3mFXq4neNWH9XTFqdVwPNqqPKutOZY/
	zsKL6wRloH+Y5DyJhj52RqQTPdeQY9XIKfbaYViP+igMn5frShrL7y3rM0VZq57DfNeSOX7GZDL
	q9BzqkajQhfVBNf0wXMC+FUyM/00QfKvrTxIhTGLFIcdRg4TX2CXRKEwxcS9gmCqjfOZiXtXgG9
	h45f1J7H8fyQYpYOYDAVbTd3BtX02tnKcDnXVqa28kojdJo6mhy0kimLC2/o6Wlo1I3e0CKZtK4
	Q4aQFJm/FEXsM6MdLRbUD915xmRxP22Q+DFPQ9dsw4W+mHhSzCcyUilKalKUaRtcyDUJs2vmSTZ
	+hFFHTr9m8HnXBaOtuhZGtRygm6Zi7/dWKAk2KVu90m22u5WABpS7N/re02DXjyJoEbNQ6Vs0Xi
	DaD/lmYT6agb1pjLxb5DmuBipXqatX4uQ0Dbbg434SHtTHsEsuQZZDkKHCefO8ZEQkpvhjdnUh9
	SajBlxFSXdVad+8IZbN5Y4Fl55Sb9byG46+aqi5sf2rObkCCtAaitMwBvkFE1lLUuHjyAA4wOl4
	LajAyRjt9fWcEWsghUAy3r36nr4jKI3vY7kmGWMLXcL+akxXA==
X-Received: by 2002:a17:906:ef0a:b0:c3e:cb50:b7c8 with SMTP id a640c23a62f3a-c4ca7a1997amr921711866b.12.1793639006912;
        Mon, 02 Nov 2026 09:03:26 -0800 (PST)
Received: from jernej-laptop (194-152-27-116.dynamic.telemach.net. [194.152.27.116])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d3cesm23362309f8f.7.2026.11.02.09.03.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 09:03:26 -0800 (PST)
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
Subject: [PATCH 06/10] staging: media: cedrus: mpeg2: fix the references of field pictures
Date: Mon,  2 Nov 2026 18:02:59 +0100
Message-ID: <20261102170303.1973892-7-jernej.skrabec@gmail.com>
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

The second field of an I or P frame can be predicted from the first
field of the same frame, which the hardware takes from the backward
reference. The driver programs the backward reference passed by
userspace instead, which doesn't point to the frame being decoded, so
the second field is predicted from the wrong picture.

Use the current frame as the backward reference of I and P pictures,
like the vendor library does. Also fall back to the current frame
instead of address 0 when a reference buffer is missing, so the
hardware never reads from an invalid address.

Fixes: 50e761516f2b ("media: platform: Add Cedrus VPU decoder driver")
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 .../staging/media/sunxi/cedrus/cedrus_mpeg2.c | 29 ++++++++++++++-----
 1 file changed, 22 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c b/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c
index 4c8accee5389..0a2f8e77fb29 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c
@@ -56,6 +56,7 @@ static int cedrus_mpeg2_setup(struct cedrus_ctx *ctx, struct cedrus_run *run)
 	dma_addr_t src_buf_addr, dst_luma_addr, dst_chroma_addr;
 	struct cedrus_dev *dev = ctx->dev;
 	struct vb2_queue *vq;
+	struct vb2_buffer *fwd, *bwd;
 	const u8 *matrix;
 	unsigned int i;
 	bool field, tff;
@@ -147,15 +148,29 @@ static int cedrus_mpeg2_setup(struct cedrus_ctx *ctx, struct cedrus_run *run)
 
 	cedrus_write(dev, VE_DEC_MPEG_PICBOUNDSIZE, reg);
 
-	/* Forward and backward prediction reference buffers. */
+	/*
+	 * Forward and backward prediction reference buffers. As the vendor
+	 * library does, I and P pictures use the current frame as backward
+	 * reference: the second field of a frame predicts from the first one.
+	 * Missing references also fall back to the current frame.
+	 */
 	vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE);
 
-	cedrus_write_ref_buf_addr(ctx, vq, pic->forward_ref_ts,
-				  VE_DEC_MPEG_FWD_REF_LUMA_ADDR,
-				  VE_DEC_MPEG_FWD_REF_CHROMA_ADDR);
-	cedrus_write_ref_buf_addr(ctx, vq, pic->backward_ref_ts,
-				  VE_DEC_MPEG_BWD_REF_LUMA_ADDR,
-				  VE_DEC_MPEG_BWD_REF_CHROMA_ADDR);
+	fwd = vb2_find_buffer(vq, pic->forward_ref_ts) ?: &run->dst->vb2_buf;
+	if (pic->picture_coding_type == V4L2_MPEG2_PIC_CODING_TYPE_B)
+		bwd = vb2_find_buffer(vq, pic->backward_ref_ts) ?:
+		      &run->dst->vb2_buf;
+	else
+		bwd = &run->dst->vb2_buf;
+
+	cedrus_write(dev, VE_DEC_MPEG_FWD_REF_LUMA_ADDR,
+		     cedrus_dst_buf_addr(ctx, fwd, 0));
+	cedrus_write(dev, VE_DEC_MPEG_FWD_REF_CHROMA_ADDR,
+		     cedrus_dst_buf_addr(ctx, fwd, 1));
+	cedrus_write(dev, VE_DEC_MPEG_BWD_REF_LUMA_ADDR,
+		     cedrus_dst_buf_addr(ctx, bwd, 0));
+	cedrus_write(dev, VE_DEC_MPEG_BWD_REF_CHROMA_ADDR,
+		     cedrus_dst_buf_addr(ctx, bwd, 1));
 
 	/* Destination luma and chroma buffers. */
 
-- 
2.43.0

