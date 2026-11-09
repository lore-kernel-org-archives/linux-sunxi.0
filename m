Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794246675;
	b=zelmYaBEn3KJxli+6UQtmAZ0b9LIrXho717QmX/XBy3aClWLIpr9/pKtyLidZNXwE0fw
	 /QBOMGOfYls6acp1G3K0jO5mwG/CoByX6cacrt4AF6scjQjew6UZ8prfz59o13pQgxWpb
	 38lpU5N5tLvHl4331JguvnIKr7or5WFRG29mMaCT1K8K43LMlTnQDHbwwLnKVgtKdJvR4
	 YicolZ7Arc1iIxHQ8pFb+qThzmKF6blrHZbR1tNtREnSKIR/wBPsBTLux8qFYrwCVZ/2A
	 aKqj3GE5Mygs4UAI8zv06XrJb8mjBBQ3NpXrwqL+AbCkFOuDWBaH2jTYncbxHADJEDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794246675;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=FShHtA5huvecuLISmJ2FgG/a5CACMUaXA0BmdO97r3U=;
	b=RmWWD9SWaeOmdtV8ig1B2nq/LkAyugxszod4sn+YA+yQew5yiPD3MYR6Pf9FkuW0mnev
	 om9GvYzKNtnoJyKvvocPG9ayncnkKSMqsw12DH7RTFmSZ5fKpOxEURARGVev+ORJKTaCO
	 EieHEXVojYqYcc0RoTnQto/zzSsQ4oK44Jn479N+C6yc1d6C5Rsc+LBGXS6+l8kT0J9jz
	 nQ1Vy5+99uy5mzMgHffEItqgyoAwgGeIVua9921nn+QGMxaVixtck34b8uyX1UoAlaLlc
	 jUVKzoPcUw67rsbnhzGJBcXXzFUu9t0GEI8XYeXXkxr5Z8kLjI8yZeFtH8hBiig5FqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DcAimGOv;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0745660A383C
	for <linux-sunxi@lists.linux.dev>; Mon,  9 Nov 2026 17:51:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0745660A383C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DcAimGOv
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4919a880834so756008f8f.0
        for <linux-sunxi@lists.linux.dev>; Mon, 09 Nov 2026 09:51:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794246673; x=1794851473; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FShHtA5huvecuLISmJ2FgG/a5CACMUaXA0BmdO97r3U=;
        b=DcAimGOv+DVqDW44D4KcTPnghgsbRyq+SRO0ODo4qAjcCmy5vXgs7wMh2Mgwhuqlbm
         tlq01njs0+rlAw1Ft4Xg6b5nt3g52Vw/S3ywH7X/xAGwkFuVMxfhJWtiud1PnnNrU1eO
         nx5J8JAxsoCUqQX7CLrmWh1emVvP6XeKfzGtmNIircpaa6cj2p/+W7Z/eXtD2lfXnkNr
         tfLPVg3Sy9CEMmsl3HqqFD6YeziZmM2ZRkthUK0eDR7BZcAMD7uT8wTq1jeP3V2MAbE6
         J9QXsE0Y0ppUnfTlL/IsXZkDGQxYCrhskzdMqQrkJeTU5cqjR7pYyP5xogE26BFh6BoW
         1utg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794246673; x=1794851473;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FShHtA5huvecuLISmJ2FgG/a5CACMUaXA0BmdO97r3U=;
        b=PfiHGqvSg91ujcx4KV29p0FyI6RO+LaYyfWqlhLXcTaQp3oAvpjhOIfd6JVaiSv8H8
         o8ZmdIttnS/MUvZdDUOI+HZC8O6AkXIuUgcpNw7w7yI+3QstAqaSFgEJrnLlh8eACD5j
         ck0w/pwj0E+9sqZTLwf0IuPTr51/4DEMCADuh8tQhz74opl5Itgh5RQrRTgMwwb644wa
         tyHQeGASqA2sPJKsYhtvsyMIVGqOpb5vddF+igz7BDYMjz0NaI/Nyil+L8wwIX5wi5+f
         KouvqOfoFJmc99TAGEM4mwomCMZg8dvHAcazzeu3NqSw/RKx5bBYmMeAaOLAnRjYEMjp
         rRdw==
X-Forwarded-Encrypted: i=1; AL+hErGyn3JsmzVUsd7bSlSitUgj1RsPnRRqw7cAJaGUgFj78ac5R8qC0WWGmitL2bgvK31TaLU/dYEE7lAUow==@lists.linux.dev
X-Gm-Message-State: APuU4Z/+ZxPI3o+kh/Br0rUbd4wluqxmz21iDf9RvLgp7EmBMUCGLpcv
	sTNiFCeAGTgszfT4loqaahcXQgdPAR5FGM9WdC/5Rmlr1UjyE5/xs9vN
X-Gm-Gg: AYBFou27oCRyKACkgwBl+QEiei/rMWPHV339/QVepvsjG00m7WJ1gY4nWvJypZt594X
	1kElLmWlDaOMUA3lqJGb5ncXcxaTd0Ab+4qsXrLS1ekE+YdOEFtUgFPK9a4VQPgfFUvVJxa9avS
	937ifHIuLNIux4Yn9xHtSYs7CkYVUXNJl7yZzu9DeORDQQpQ3Bic1/T1dcgJCj8BxAZ62KbIrkw
	2KApVF1TrVhMc6XBe4RzHhbfT4zaZXAEcTe/njC5gy5tCREuplDWdOlUQf5lgW715QF13comJBw
	ZC8X/5+NdDkKXwnilQ/8a6V/J5O1a56JtFggVDyjWWqc9HV18dZyFjKcGa3hRRBG1TYzbizNOKH
	IAnEVf2SJgsUoCRL0nph1M4YZAgiRx1AMUzuTBbuxJKrXmbU+f4yr/KYlthHK3MRTgfcMI5jc3q
	BzApYPYxujgfET78uJlQ6WGnNN0daHofJOINcR60bGwTS7a9yYb7FcB/DpyNG8UVIgtVKPmuqUO
	LeN2p0xnjRBI1CocjMJp0dFXt7F2jjL6NCXaxY0DiWEbMEhu6HDwqhE64d18vv+AMxXSwzO+X/+
	oqL3T0Q4DCINwHsvatVk4C/S3zI37v0w2WDo396mDx/OOJ7mcMBkUaMedid6dC+0icuVIp5d/F0
	u2G/KPBUFGKUNM+MVUKM6R0ml/JlV4UnptNJPIZRLOaTlETQe3p+zI4KvXxvjeda6Bu3qQZgAH8
	ez8W49roKYiCLH6j5t27PyxmmBOV/lT2bC0klo67sm7lDILeVPePSpHdKmbbK+ocRbUj67jqUrC
	HglUaIlWVaFOhHM2vIYfne0LGL251rfbq5Z/x74sstWhntcfPBfvhHgPaBl/0z5PpzUV54O
X-Received: by 2002:a05:6000:230b:b0:48d:fdd0:6ce8 with SMTP id ffacd0b85a97d-4982b28a797mr485950f8f.3.1794246673337;
        Mon, 09 Nov 2026 09:51:13 -0800 (PST)
Received: from jernej-laptop (86-58-12-36.dynamic.telemach.net. [86.58.12.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498369a4238sm200717f8f.54.2026.11.09.09.51.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 09:51:12 -0800 (PST)
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
Subject: [PATCH v2 06/11] staging: media: cedrus: mpeg2: fix the references of field pictures
Date: Mon,  9 Nov 2026 18:50:11 +0100
Message-ID: <20261109175016.42061-7-jernej.skrabec@gmail.com>
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
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 .../staging/media/sunxi/cedrus/cedrus_mpeg2.c | 29 ++++++++++++++-----
 1 file changed, 22 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c b/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c
index 315b0e5b3c88..9bd7f3ded83a 100644
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
@@ -149,15 +150,29 @@ static int cedrus_mpeg2_setup(struct cedrus_ctx *ctx, struct cedrus_run *run)
 
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

