Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793639005;
	b=GfMtz9J9vSEYIuRyUW//ZAM9zpFfQYQ8ZguyqFLJkLrbUMgu3cyfbxjLMKgG1cMKBsxD
	 OEDfSIfW/yDyFUuvYZym/sjHMz3jc+ef57flnxDJbjEP6hKsdBQysASR6HeSHc1cC2SU/
	 3abTK5TJmyLCpXOhp76nhLwJnWtfz5Ww7k7RmMiIIdC8SVzwz7SVOZgq4LDLlfk8eZlcV
	 37XNaGltETQwysNuTjpky+R4gBWB/J3N4T+StBfUwYIZkjkiRRPszPVxT7+20bfwww7Kf
	 sRDr1mi4Z9gOwH4qAqW4dqmS5UlPwDE8QHtJUO3g29dlG2HnY8bQqs4+6M3kemIbjNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793639005;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=oPt8R0+cuix+okhoURqDdR+wxsOn/VMcHvI3baeHJW8=;
	b=dEhnu/n7TRImRKiZJVAOnjB0AnVhiHvku6wso+bMUoogjIXEiJR8nz+3sMblpoVWk7Lh
	 vYLrnG4W26y5oagoTj6UfWMft/1Nh3FaFLpDDanRmUg9TgJZJ1hIxV51IB4zKswb2+TGv
	 kM9XlHoquIPqi/mgA6FX68QOta268vpjJC87bn8ED78Or+W2MIpKUx79OxW04BaDHlYx4
	 PvTM5G1ukDfp+Dl9Z6w//zdKnQ49jsru+EhefNRSKCJaTojX7be3ft/mbn/8veRIaKqch
	 WooxLYqUL2SQ8qGorxmJBFV03++4iHAFEinzmQSrHw2cuFZsEzAGa1II8T07ZnyAQsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q10I0hXw;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04774606F207
	for <linux-sunxi@lists.linux.dev>; Mon,  2 Nov 2026 17:03:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04774606F207
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q10I0hXw
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso22865815e9.2
        for <linux-sunxi@lists.linux.dev>; Mon, 02 Nov 2026 09:03:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793639003; x=1794243803; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oPt8R0+cuix+okhoURqDdR+wxsOn/VMcHvI3baeHJW8=;
        b=Q10I0hXwNDUTlpX+lCpdZi8emmGpy7cPHx3i8Xm0rNB+xO/Kw0CIY/iKBVblFKzzS5
         DjIYBc1N41hzL0sO9jZyxxC/zVvvG+h2jnWSODIuJOs7bM0b+mNB9v/mJcWq/WfiJMXp
         P448Ae5R4n2C9vGh+cim2xmSACM3cxNXcCyRI5CuEXhDG5lmY9WF9FP3RHe3/eZHLrhe
         NtoN/PYL4Eyu+09s4rUFpwX1YxcZjlDDjTknc6Oj4s/nYw/hc/Ti2AtriLJdlEr8POE9
         g7pxOiitLhQqfqGTj0iyX3r2St6yAuRkZ8lOPI/giiUr0GiB5fZD/WQ+f0Pbpfk58HMm
         +V0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793639003; x=1794243803;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oPt8R0+cuix+okhoURqDdR+wxsOn/VMcHvI3baeHJW8=;
        b=qPIOAlxy7khN0maLCc1kHxtALpaKWArJvvDeDgAJzzCvdyxgygrD7TDZvevf7XhrKd
         BZEmj8LFyOprHstlY++Y1iYcpQ4PXxzLoF3TF+Kkh6G8cWi63OrzsFf4FFlkdkdDx/+0
         cJW0706K2BvfJ3X2a1QR820CxJNoWOXBa+iur2sLcODCwBAHTztiFQAZI5m036xsrpeW
         +dabnUOQdkyft/m8OPglCmhf/55fzxNvOp1u2nrSISP4mBMJ9SCSecOt7IIaQU6xn47L
         jbcWdwLbr/PiHgowJZ247WMel+i55oWLELJpqSOnKm5DsM09PGNZILoTxQ6edLW8a7Ph
         hT3g==
X-Forwarded-Encrypted: i=1; AKwUvBy2txCldZGCo1h/n/QN5dSHCSSaeowooCA7smUK3xsFLjW+O3RGURikpqqSjwhaOLwjeScrN+YsvY4eGA==@lists.linux.dev
X-Gm-Message-State: AFq9FYL0O2XiZV4/YitmDE4bhiFtT8KI56iFYmD7X1AGTgGHtHJUgfGP
	YvI3qWZ49iufppO8Ax7wtpug/X6vYlL9PHfRvET4rs5UngRR3Xpr0T4H
X-Gm-Gg: AYBFou2GXRr3Vm1Z/QEyXwwEO+Y+HAOtp8gOr79UVHi81AGCfUctudii3rohTJ0hFe8
	0ucMLbSy0uBW5sx+eJW1CxUwKKsCQABbBQz5R4OEmXM0Inp2QNtQEtaWVf8OvUTd9GDtjp06wPS
	i9AA6qyOEmQbgJgeMcYwFm5mmeoEjYo8WI4wiBW7THdQz6wRzzVV4QyMMqvQpfrVU2qs6gC3Rvf
	QNRUS+jo2gMxPOU4zN5ZFWKL69zQldKeldEM3PF71aTy9vJUa7vyrS8LZEAsfuKK6O+1uAtAfVr
	U0Tl8MKBYIM/VZ6sQAcxljeg/G4fzcNPmwKR0BT4IVk2dKOs8kjcpEmkzY6xuiUthCntcn4eFOj
	1a97rFhDc2d5qdgQsOiDSrMDIch/VB9N51wBsyP/dAdTMV6UDZj5vpbu9EjIbhA653S1PrFfwGM
	+FF62D2FJmcq0Ad/tADPHGuOWeKth+Wg+i8SxIGuSo9F6qab8t6LbqfwPeh+ekxt9LIE4el1vAV
	/3/1OuO5tYcvmfzCEqUlU6FqV1Kruhgf+NUGtgZxHq+Hb3du49F6Y+QIdOf7WMl5VysibnZdYPU
	haBsoBaSjd5P/JZWK93SaPZ50hocJezfFOBQFAIN6GmVilGDMtMb4dc8HAl7eZRleHdW+afuEcq
	FRap6Ek4NVSMP2a3jo4M/sPUfpqQRSDEuZM9ElUh3Hz2vuHze/Hc8ic+upGa/3lcGGSQxKVffNB
	33nB/KtHKV3dw4/XMXGy+QXx+1wej54qD70Csx3hL30iHOEhDQ2x8747BHkwl6mdbvIPBaGBpfc
	wqzJPeXw/t0iH2udqo9kl0HoHxy0FKLjiVvYJCRADmFJXMvCA==
X-Received: by 2002:a05:600c:a012:b0:49f:fd2d:23c7 with SMTP id 5b1f17b1804b1-4ac17b2ce18mr241875865e9.27.1793639003332;
        Mon, 02 Nov 2026 09:03:23 -0800 (PST)
Received: from jernej-laptop (194-152-27-116.dynamic.telemach.net. [194.152.27.116])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d3cesm23362309f8f.7.2026.11.02.09.03.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 09:03:22 -0800 (PST)
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
Subject: [PATCH 04/10] staging: media: cedrus: mpeg2: use the field height for field pictures
Date: Mon,  2 Nov 2026 18:02:57 +0100
Message-ID: <20261102170303.1973892-5-jernej.skrabec@gmail.com>
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

A field picture covers only half of the macroblock rows of a frame, but
the driver programs the coded and the boundary size of the whole frame
for it, as for a frame picture.

Program the height of a field for field pictures, like the vendor
library does.

Fixes: 50e761516f2b ("media: platform: Add Cedrus VPU decoder driver")
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c b/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c
index 10e98f08aafc..ca66a3c6b830 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c
@@ -58,6 +58,7 @@ static int cedrus_mpeg2_setup(struct cedrus_ctx *ctx, struct cedrus_run *run)
 	struct vb2_queue *vq;
 	const u8 *matrix;
 	unsigned int i;
+	bool field;
 	u32 reg;
 
 	seq = run->mpeg2.sequence;
@@ -108,13 +109,21 @@ static int cedrus_mpeg2_setup(struct cedrus_ctx *ctx, struct cedrus_run *run)
 
 	/* Set frame dimensions. */
 
+	/*
+	 * Field pictures cover half of the frame's macroblock rows; the
+	 * vendor library halves both the coded and the boundary height.
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
+	reg |= VE_DEC_MPEG_PICBOUNDSIZE_HEIGHT(field ? ctx->src_fmt.height / 2 :
+						   ctx->src_fmt.height);
 
 	cedrus_write(dev, VE_DEC_MPEG_PICBOUNDSIZE, reg);
 
-- 
2.43.0

