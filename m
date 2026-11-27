Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795762534;
	b=PEfmGZEl5aMjgB4WA6fgnry26bIHWoxmaZxCzT5j0Y8jmmd5vg23uClxtse0Rnm2hEvv
	 duRH43QRUGRDNf1nlzHG+mVQzqpGTrJZeO3DSXAFP5R9FSUXKg8jnnABF+OFJ4F1Jf0+B
	 8tLAIW51IqtnABDOf2ncU9pko8lI2JSVHpImgu2ySkhGUE0kNY52raZwymJcKy43/+c58
	 /Jy2tSarCv0oGPfs/l4yMIgQZyMkbFM06SkiVf1dnAWrlOc7wg6/zNy76qXT1q1i07ea6
	 dKBFtRJFQlSXaHlAdji7wFadz5PIgIDtKgo1cWq6GCimNLhBD17WtGjN4GmnheMqI3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795762534;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6QJZTVYdROR6mS1avmG65kFgpH2ZO1NmsyxFw2KO3To=;
	b=41jCt0y07YAVFF/rxmVn+zzhWy9LAXXqjKpJ+Y+vQUPCy7C9JNwaTmXTbz7FMyMVTcyW
	 GPLb8nfY0xJgssm+SeeTU88bIQVM5v4+bgY+VaBPk8l3uNhyTFCCfi0g1Jo7ggn0+GRlb
	 PAD42WoIPRfewrsOfIeN/gWe9XcQBRALKC8tAvuYOx7aJJG4eEubi6Gy8ALhN7B3lhIrf
	 RGyitCUYc/0l48K4e7esSphzg3krafUlg6ntc5GV6l7H/FxR07IMuSIBvJhMmvIf5Eind
	 3G56iro6pA/Z3UvAA6fQBa9cZgKtYoW26ozWV3LbKfxflHiGcHpMbWIoLOYSogoTjuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E7bbK2Xo;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43D69606A324
	for <linux-sunxi@lists.linux.dev>; Fri, 27 Nov 2026 06:55:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43D69606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E7bbK2Xo
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-491846221ffso6791510f8f.3
        for <linux-sunxi@lists.linux.dev>; Thu, 26 Nov 2026 22:55:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795762533; x=1796367333; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6QJZTVYdROR6mS1avmG65kFgpH2ZO1NmsyxFw2KO3To=;
        b=E7bbK2Xo2GUI/0gRB1Vj4gHIFsyaWxpyy6xLSYYENHM4WoM7KtH+07KMMyV10qr7VD
         uCJh4Rav5GI7NZXjqhA4LS8974U3MQJO5Y6IGRrhoK8G5FqOhysViDsTbtnj8uhGGUU5
         MUeQYXNfr3gSj+fB+6SOvsdPt76FGU4NGbAO6aqN00y2q4ctaGUl5gejFjkBfoUQ7D9S
         g5S3JjlAqo0VvQd21Fxqnu/81yAAVlT+OwccvPrPKPiYezc/tzHDJ32kqULmyRjgnZK0
         f8C02+Wm8tNaNl1FaHPZ22B2tDPrpnZCnXe7vo+cXt1q1Re0jw4s5Zfb2hi61vcaB7+A
         YKeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795762533; x=1796367333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6QJZTVYdROR6mS1avmG65kFgpH2ZO1NmsyxFw2KO3To=;
        b=bAjpqpJeUO7aBBXGj4UZzmgFarXzlztcWuf55Cz/lmhtL+MM3ucKxTJI/UMc8RtDUp
         TogEwqOfngLNuReWhQyTWHme5Kw0rSC4g8QSMXun9cDBXqxPors3D2MqZNRSYGx+g6kZ
         n6hbLHx90EmyJrG91AucU/ZJti5srw9EMKaS64RAraIJUvThpf8LZHiS+FogO08q+76m
         nlOk/Te1a4/EKPTsKFPpaDT0R3evDkCECJ+j+0w035AYmlIBY4wQ2hpjivqDpjOJJe6g
         0Fux91SF+QtCunMDy6cpI3j5kQKbkdRB0UXN8uoCCS/HKO1XqGxfRF+POwnyIkxzrtMa
         x09w==
X-Forwarded-Encrypted: i=1; AL+hErGuSjnUDx/7d5WiyXPo54/ShRqMEEZ4QEk89Z5UC+qJErLJ2tpyc0hcc7PPcmK5xuezoY374AwXZbRNdA==@lists.linux.dev
X-Gm-Message-State: APuU4Z/6e8zgxo2Kasyi9ON7VbGnorWsMH97k/+Lw0A+iHAkeIrdVGz0
	FqYzfAZj7YOzLq4kFv2+oa1BLs1IAcbj18PPSp7VMRwSwAlQ4y1GfF17
X-Gm-Gg: AZFdTZdXdoJe8g0MV7WPvcBgXny0n9GbMlP/I5x7b8NIE0PQsNRmABjAJK0Mp6KuJCA
	rzxP/no+T7FhL6n/WdL+lwnzJp4SfAzLQNLp5/lhkjoEJiFBb82WpTHZZ/r2GkbBnKjkQQtyYjk
	FiOYAoxLHYHePdOW7fpS/5nUbcX3uBcs7ZtpPs6EIImqvDWXbZE/Zj69aU5z2oZoG1BRGq2QyIR
	HoSiVNvmax0rvhH1tOuOhgYh0rDx+JQ2DbTVbD6um2Cbby3iuuWCNcFgeF5lWQKey23PW3v5Vhc
	SZ8IAufjjuGmLX0X5mtOaMD6bWR6n3BxYVLZxFBuEfDzcW606KskchQ4MkR9CZBtCoz5pltvd3f
	5MEyX4/huw4RypgEJUlnDrI3t5WzX15ifTM6nrBgspYP1fiDZ9voiD1PaZW+AArSpdkt2rvNc0Y
	0XjcDZQ+PsdDcNVXhO6oz2Nvp4d0cTU9zzkcY84pp47uTJiqW2tTZdGC1Y3GDh9twn246+JUDm4
	vdLMqUbIfBTQaSeDr7HhWUp2a1ma3sSOYlfPU5WtiuuXor9zUVVJR+eP8N6iI4FggAdXRP7agA1
	sIJrC3VD42c+LGJJ5BV/FRo/KTMR6A7x7SX5seROYR3GcSUnFNyvwlR8rEmclyHlQvrSGkfDUK5
	sYz8yHxjE3fxxZq49zmhdRPCyI0YOymDKgGzniDkAZEmRGxOvmVekmMQ2pqVYd5I1fCl0YEbqqn
	Oyfk3/wSVe9Xk8mmZNRl2Honim51+y7tLb36eUz7mXsOeDtzBfZEa5EUd0DTF0szHeq23hsi3aY
	vti60qvBYHrBAOIA/+J/IY8OeOZY3jZgmi20/7Y0Go=
X-Received: by 2002:a5d:5f86:0:b0:4a5:ba8b:e00e with SMTP id ffacd0b85a97d-4abb4f5a324mr44654273f8f.45.1795762532450;
        Thu, 26 Nov 2026 22:55:32 -0800 (PST)
Received: from jernej-laptop (77-38-7-250.dynamic.telemach.net. [77.38.7.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b5f6sm42574611f8f.34.2026.11.26.22.55.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 22:55:31 -0800 (PST)
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
Subject: [PATCH 2/3] staging: media: cedrus: factor out the format check
Date: Fri, 27 Nov 2026 07:55:22 +0100
Message-ID: <20261127065523.3685726-3-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127065523.3685726-1-jernej.skrabec@gmail.com>
References: <20261127065523.3685726-1-jernej.skrabec@gmail.com>
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

cedrus_find_format() and cedrus_enum_fmt() check the capabilities and
the direction of a format in the same way. Move the check into a
helper, so that the VP9 decoder, added later, can exclude formats in
one place.

No functional change.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 .../staging/media/sunxi/cedrus/cedrus_video.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_video.c b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
index 2521315abdb7..a46820a90d87 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_video.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
@@ -78,6 +78,17 @@ static struct cedrus_format cedrus_formats[] = {
 
 #define CEDRUS_FORMATS_COUNT	ARRAY_SIZE(cedrus_formats)
 
+static bool cedrus_check_format(struct cedrus_ctx *ctx,
+				const struct cedrus_format *fmt,
+				u32 directions)
+{
+	if (!cedrus_is_capable(ctx, fmt->capabilities) ||
+	    !(fmt->directions & directions))
+		return false;
+
+	return true;
+}
+
 static struct cedrus_format *cedrus_find_format(struct cedrus_ctx *ctx,
 						u32 pixelformat, u32 directions)
 {
@@ -88,8 +99,7 @@ static struct cedrus_format *cedrus_find_format(struct cedrus_ctx *ctx,
 	for (i = 0; i < CEDRUS_FORMATS_COUNT; i++) {
 		fmt = &cedrus_formats[i];
 
-		if (!cedrus_is_capable(ctx, fmt->capabilities) ||
-		    !(fmt->directions & directions))
+		if (!cedrus_check_format(ctx, fmt, directions))
 			continue;
 
 		if (fmt->pixelformat == pixelformat)
@@ -191,10 +201,7 @@ static int cedrus_enum_fmt(struct file *file, struct v4l2_fmtdesc *f,
 	index = 0;
 
 	for (i = 0; i < CEDRUS_FORMATS_COUNT; i++) {
-		if (!cedrus_is_capable(ctx, cedrus_formats[i].capabilities))
-			continue;
-
-		if (!(cedrus_formats[i].directions & direction))
+		if (!cedrus_check_format(ctx, &cedrus_formats[i], direction))
 			continue;
 
 		if (index == f->index)
-- 
2.43.0

