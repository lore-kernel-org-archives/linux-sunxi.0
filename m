Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794246672;
	b=QoERucW3+jh7McACf7etGQOSiP4r6Z88TlDBqCMCwrfnX/rVqlDU/utD0m8d/jzOkJYk
	 oL06EQ0l3VjNleWEE1uLf3D3gKIWMRo1DFQCiVWG9O7RRLmvYZ79TERoncIqf6xyMcvqk
	 dSwv+JhgUYOt8c2axIe5cXD+CCUftf7bjdSpmU3mW4WByMOcjpltfJ7QVK35D6+J3SaAM
	 fscWWJ58mUYlVAdTrEG08lhw7N5PzZqdf/8aMP9sUos9FLt5U1NJyIRe0F03xmixwC71t
	 NhcGKIh+UiCxv/pWsUd4hKj6fpD0aVclvoEk2om0OMGCB2N3y6sKXVLkx6/1MQMgvrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794246672;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=TTdDMu4OoBto+glTh8K9JHA8DfuLt2NsMaDTZfUGp6Q=;
	b=qm+vkdRl4TgQ+nTFn7qhAwNktF7GRtGogrYXsE9Z3lIOvpl8Pv5Fkc5JZs+s3i4aK3mS
	 ePRmu3IghNab5X4ljzLCVYBjaycmRZp6sfyYx+5Or5w3koz3/jKefx50E7cF+QtM6fkKY
	 gsbzqqotxjk1R1aunQEBbqDEfbetWhmZ69njWysXW8UvKJ2cU0urS7Rk3JaXzW/44MHo5
	 1+WvN0p+t2Fq01y4wFpQ7QNebqJgcYm/cpIc6F36l68hLxp6UcTg0OI5+5IU/qtUHwiLY
	 RmLc7Apu7yIrNDJ1h8ZZ/X99UufVZKKOAWIz6uIxX+FqIOwEnhbCZuS5RdKGISBwmtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KJKxaNNt;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 825A660A3813
	for <linux-sunxi@lists.linux.dev>; Mon,  9 Nov 2026 17:51:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 825A660A3813
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KJKxaNNt
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48fd2e38825so782536f8f.2
        for <linux-sunxi@lists.linux.dev>; Mon, 09 Nov 2026 09:51:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794246671; x=1794851471; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TTdDMu4OoBto+glTh8K9JHA8DfuLt2NsMaDTZfUGp6Q=;
        b=KJKxaNNt29XPywCMdNPHTFen3lwR+ZsX0+kw1j1tcNCPAFqiz8X8zLcq+rlK9auKAR
         BJQjQp7oVhqAWZIlbzGRF8w16zj5t/9TNndyvDuEDQXsNzTy+UjnwsxfMMcg7LEF+0c6
         8uxdcoj+q2sufw24rab6PItjxgQmmwoMbx2D+TGeJZnT5rq+fzM1VuWChEf35DpcFCAK
         lk/GK9t91V+KLiwiqBg4QlRqZaGjexKoJ2C7M6rAJujnsp37/936N7VIK412I3UgV5oe
         2gt8u2vkMBsFN5PY6p0q4W1xm4/4LDZ5FavL1+GzrEOC5TpX6WqaVhxBiu/mywXgXdgQ
         Ms9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794246671; x=1794851471;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TTdDMu4OoBto+glTh8K9JHA8DfuLt2NsMaDTZfUGp6Q=;
        b=GGrlA2/N36MgURCJMOViNCOEvwu5RekF4/uZ8yRPQfjL6MDIFdyHnj4dDNEjiZi38a
         8t/IdlKL1A88J8zF3O+ukZjcMAjMZR+fv9lY9Dsf9PVWe0em2+1PVlXP3sVvJ36wS3OO
         hAl1QVq4rLINVefvAaT55Yf7/y1OCcd/MDW7Rtv/Lr/7E2r3WWgZfYtjYxPHao/0ZPSa
         FI7xmGyjuZne+tcxau2P+47X9eSD5vK6ESN+GFNJT+kpvPPvMXZxhKMcreK+KQQhYQXW
         CikHiLQRnrKhBTq6kqAAeO3GAQ1sZTAkzyTzRCRc9f20DtcesQIpkKpnGgLdPptLrDN0
         PENg==
X-Forwarded-Encrypted: i=1; AL+hErH3OlkJY1zxEsFJ5tJXcNP180YHV0BFFFT3ljkqmKCvw6b2sdV2SGGfQWu38s+ms5YsPlC5DiccKTcANg==@lists.linux.dev
X-Gm-Message-State: APuU4Z++wYsm9IARasOepXNdBxAR3hd2p/pQUE8tPNnIlJ2tdS+UNCCO
	nG5IDNzZPLDJq44LNwGpskyqhO3LbeAg/2cPkQzmRdiNxqYDjUrItmRE
X-Gm-Gg: AYBFou0fxg5hB7N4JKck+YTNkqaRsNx2Rh+uy/H5dlWf1lkKnzCi1aNy90XxMnPQRmy
	Huu7z0CdNi1JOCV13qXxqSNLo+m+xhlGmb8F6jjynSEazewf07pLjmZWbDPWs5BkIcSS+p/eB/M
	TWlYnYJOiHxQNQMCnkiiLTnVaDE3yIU7frkuZLyOamgj5GilrdHAs3quZb0De7S02EAmQbhY3zR
	HqLKaYXnE3EpWLaKnUZ5gDk5QvxFqivmaZHLv8hRt3AKs0oUFugZvtnbyPDzkQEFQn2rcSs8iRr
	4YoyS0IzXBIsqB0xDj8YUnK01bhrg+7/SmkhcN9M4tRrb2rkbhpbQbZWIkpAdegrfYjRP9beTIL
	DNRNOpzS6fxhUTKDVB8UXOwJpsLFPYkdT/0lkWvO5BWXAmy0TiakZcxFMIL23RyMiRCg7Oh2dI4
	Rujl9hJWdKDhzg3iEoOmVG1E4XjT5vfp7UMau/sPyovGGgngCcuDlK10oobUBKKAw0AkqSqH9GE
	Oeof38SX63zF85YeYO0Gz/hJKLM/3x8W556mjECkOLcNjb2EcUfYOPCXe9TNKZ9qtqrQqUlNyX3
	zj4qZpd4M09/aJYcAAIt/pW/zXF69PVnjNUs7ni1nOnkqxDlOogga85VOdJjKLu0t+KdgzCLT9c
	7QF4MC5n3aP5rLJbLAjKPMTM1t+FUJlSim75YOdIRLAVwI25fobccRsY38iZzVP0Cz4BiI+e2zk
	kYgiv5ws9JEfX9kCK/J34EVpeipQ6fEP3AWQBsHk4wOYzVd1t/pYzA+l1uhq4f02b5TRQ5RnzO2
	ffq7Oj3E61TNQCZ6eO3BrFIrhBmKqMpZGvumgGeZ9vWosdb7LU=
X-Received: by 2002:a05:6000:29cd:b0:48d:ff71:dd87 with SMTP id ffacd0b85a97d-4982ecf64f9mr225642f8f.17.1794246670969;
        Mon, 09 Nov 2026 09:51:10 -0800 (PST)
Received: from jernej-laptop (86-58-12-36.dynamic.telemach.net. [86.58.12.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498369a4238sm200717f8f.54.2026.11.09.09.51.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 09:51:10 -0800 (PST)
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
Subject: [PATCH v2 04/11] staging: media: cedrus: mpeg2: use the field height for field pictures
Date: Mon,  9 Nov 2026 18:50:09 +0100
Message-ID: <20261109175016.42061-5-jernej.skrabec@gmail.com>
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

A field picture covers only half of the macroblock rows of a frame, but
the driver programs the coded and the boundary size of the whole frame
for it, as for a frame picture.

Program the height of a field for field pictures, like the vendor
library does. Like the vendor library, halve the boundary height after
aligning it to whole macroblocks, so that the boundary of a 1080 line
picture covers all 544 decoded lines of a field.

Fixes: 50e761516f2b ("media: platform: Add Cedrus VPU decoder driver")
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c b/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c
index 10e98f08aafc..8252a47994aa 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c
@@ -58,6 +58,7 @@ static int cedrus_mpeg2_setup(struct cedrus_ctx *ctx, struct cedrus_run *run)
 	struct vb2_queue *vq;
 	const u8 *matrix;
 	unsigned int i;
+	bool field;
 	u32 reg;
 
 	seq = run->mpeg2.sequence;
@@ -108,13 +109,23 @@ static int cedrus_mpeg2_setup(struct cedrus_ctx *ctx, struct cedrus_run *run)
 
 	/* Set frame dimensions. */
 
+	/*
+	 * Field pictures cover half of the frame's macroblock rows; the
+	 * vendor library halves both the coded and the boundary height, the
+	 * latter aligned to whole macroblocks.
+	 */
+	field = pic->picture_structure != V4L2_MPEG2_PIC_FRAME;
+
 	reg = VE_DEC_MPEG_PICCODEDSIZE_WIDTH(seq->horizontal_size);
-	reg |= VE_DEC_MPEG_PICCODEDSIZE_HEIGHT(seq->vertical_size);
+	reg |= VE_DEC_MPEG_PICCODEDSIZE_HEIGHT(field ?
+			ALIGN(seq->vertical_size, 32) / 2 : seq->vertical_size);
 
 	cedrus_write(dev, VE_DEC_MPEG_PICCODEDSIZE, reg);
 
 	reg = VE_DEC_MPEG_PICBOUNDSIZE_WIDTH(ctx->src_fmt.width);
-	reg |= VE_DEC_MPEG_PICBOUNDSIZE_HEIGHT(ctx->src_fmt.height);
+	reg |= VE_DEC_MPEG_PICBOUNDSIZE_HEIGHT(field ?
+			ALIGN(ctx->src_fmt.height, 16) / 2 :
+			ctx->src_fmt.height);
 
 	cedrus_write(dev, VE_DEC_MPEG_PICBOUNDSIZE, reg);
 
-- 
2.43.0

