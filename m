Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793639013;
	b=pG+nYlKg69x4DPDtV312g7+bc/2dPj+CbDn6DyiEDPJzdl9wqUGO5ufq6dagFGsFCopk
	 hSwf+aLMfpO2yH0/O6Qye+mLcq8b9Gs4DwgXmdd5QfZZ0/RCoqDSNALpxnqID6qhOAhAT
	 7YK3oB0xHUNd6FoMK72NhJ71ijBiroFxyiWsUmtS1J67ymZGJKc5Ki0Aosy31u04atjX2
	 DnNv6giEBiHdIUMSTl0L6EmxjLfczO7IMG+wx8TGlK8BFNRtpWJzqYU7a0BfWub9yR+qS
	 jlrCukRHaqNXXknPZ807SiX7mRRNte0ktq6UnDjrVQDDTu7xtPeq2Rr8104+5czr5og==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793639013;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=7l4WHkBsRffNtc4OtCTnEYHsuGJTmWCjGilEK4Yq4Nc=;
	b=KdzfAjRUJEzzWXoSGJ9zsI/+11/y5ny9+fFrFcDZtUWS0dHJhKDMj3EjWQDnkReOjeB9
	 dK2q0thJKOb8XY6pFjITdhYsXMXBOEvr7nJRzt/HxzBUg5p6PrWZjvhRvoNOJtwkZtNCu
	 dKEL68B0TE+xIPwAxJliPI1eMLZs9WML8qLmLqMjk9l8TNshu3PzDQTq+P6W/FX2MHvXQ
	 DjXJ6dcmeQF7sSmyCcMTrVd0JL9YhevB7bLmFxxlH4rff90vRDLMpgfGDWroKN6su6IKk
	 lKG/GzGStvGAHXcx6MFf93awmix1Adj386L8vVslk1F0n5PqNcmM5n9fzWJ786l62Rw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BmVSWg5a;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 545726070C81
	for <linux-sunxi@lists.linux.dev>; Mon,  2 Nov 2026 17:03:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 545726070C81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BmVSWg5a
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48e0d885929so2678931f8f.3
        for <linux-sunxi@lists.linux.dev>; Mon, 02 Nov 2026 09:03:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793639012; x=1794243812; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7l4WHkBsRffNtc4OtCTnEYHsuGJTmWCjGilEK4Yq4Nc=;
        b=BmVSWg5aG84hrOUZLbAaQeVr4SEC0O65MxV634sATJgS+l6tXhj6QezCMIZS+mN7Dr
         ag/xZmGjvMAEsjYIgyshUaOXXG3tQUZVnIpqZyiP0EY6p8ehPk+cu6ZI0I7gNm5WHw38
         S+/47AbkCquDjHLG8HSfpyaWITgtwBeMMlM7c/Wll5VR6LJhIA4s9GOWdqWJT6YW0A6P
         9GDgoxKVFXg04gjGvnCOaO15Hh8825eYKEEdhCbxpaZ4bzRuP88y4gRDkw02HpkXq8Cd
         WZvqHEn18QCxbs9Ru+CYk6iL90Kh/g7K/SqJCExk2mUHGM1awXHEOHWQvemSHnhDHXrv
         mBGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793639012; x=1794243812;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7l4WHkBsRffNtc4OtCTnEYHsuGJTmWCjGilEK4Yq4Nc=;
        b=vUQE2civXgLIVtKQ7ni3ktkN1M2t5gvdsvegPsYCtIgPQVCuYf2qgktf9aCz/Gxxqa
         foyuz7zL6mG8kZ60Pwn4zX0mncFdLBhbDxWCFv0zTAcBFP0U4POcuFxBiMnYbt+U/pZB
         zuVTS4NQ2SkYzU45ulwhUCd3Vz++XQzVdmY3wKhFbX2YNVvg7/R8q45I1ch2hdu66rm7
         LCx7PFxmrnTdDmcGUU6Nr9me3zJr9WPUBtZ/pBRIHAWqOv0oAauesO+H5JGltSSO0yl8
         X3Jqs+RyAxTUwnWKn7uJcqznyKfbVfowcEaXNZ96ReJqHg1ApYRW5D5Zy0uIKPXbB/XD
         isEg==
X-Forwarded-Encrypted: i=1; AKwUvBwbsROVoEE7ODIQdlUyLoop1HJSDwK4Crsui6+9f7H6HuByM4E6qy5Un7g/Xu4N2T3i/tSH0KP98b24Gw==@lists.linux.dev
X-Gm-Message-State: APuU4Z/TXoJTBIqI/XDX07ZXGJE6Uc4GYeznJMZ7Ve883oeZPuBG6VKw
	fhNdOXgH/eoNjy4wnaq4Ju4mZF6ZZ5kKuZT20jhiQ/vJFKEuJYqmQOGj
X-Gm-Gg: AYBFou2D1EhYXUDnbWaDo+9TkWeIDdKwg4YxQQ1kBGr3LhOWLkWrwsVkabbGoPuuUIr
	Det7fMzCXnmXmfAMJa24fRo/XSlKEJbJ0Rduh92+0FTsv52X4PW8Ka+DdUd5ADzZgVJSFDzMaEc
	4xqWQ25wYJaKw4PSnKgDqIDqVCWwbTCGzCfCDDFK9EjA2Wc2rwzw53u2bQE+sW5ugf8Vfrwyfmw
	TOv6jS/rqFC+zB5VeyYv/8vCVzDxHRPtnvjw/C+TlVI1u8zim2Kj+XiQLTGSifPnVK67yygi/7X
	tl/6Ja2v/5TVQ5Sx32Td7Tdum72c2RNgigmhjV73aSlMv+ufZAnC62O5IdG7Qrl7LPIMGbKXyzk
	8eWfcPOzgiRxXyIeNmf1j+dDdhx0nqzA0+350HvPtMfUKoYSASI/SkHSV4XsWSUoFjyN7RLhHLV
	ifPpwlBfGkaCeHDdw4d/xFscf/EngrThsXjz15V+EnHX1QAYFbVjLkT9Cl2iew17618Ecs1OuXf
	Gnukq8uaPku9D0nx6ntViOig5qg1HOx9As+leNp66EoLCefLi8fa7FWoBLYcLJckoWHqQZXyc0t
	xFqEsKOpSy5FJTFtPzcoBHfwabz3TCau+eu3jKF+gjKnbI9BlaOpudRcaVeR39xmXVq8c8AGNax
	5YqXp+5IoEYA5ZpCOyhLZsKKg85fvgl58Sg/9cBl/X2KYJZWq1mmz3MN0BBxIgV/H+WeESw6frp
	LEjycjx4LhIs5PFkntwRH8bfecC+BteKBF3S8BuCkK/EE7di3utB9agnjXW39Y1pKV80Bjf3alo
	ZJmUuVzxXAVihzkk+e6TCAqPA4AaXtODMGGHxCULHxQmALwf8E=
X-Received: by 2002:a5d:5388:0:b0:48e:666d:c96d with SMTP id ffacd0b85a97d-48e6e50c8d4mr17255148f8f.51.1793639011436;
        Mon, 02 Nov 2026 09:03:31 -0800 (PST)
Received: from jernej-laptop (194-152-27-116.dynamic.telemach.net. [194.152.27.116])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d3cesm23362309f8f.7.2026.11.02.09.03.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 09:03:30 -0800 (PST)
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
Subject: [PATCH 09/10] staging: media: cedrus: h616: use the 256-bit DDR mode
Date: Mon,  2 Nov 2026 18:03:02 +0100
Message-ID: <20261102170303.1973892-10-jernej.skrabec@gmail.com>
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

With the DDR mode in VE_MODE set to 128-bit, which the driver uses on
all SoCs, the H616 H.264 engine reads corrupted reference chroma, while
luma is fine. H.264 and VP8 P frames come out with bit-exact luma, but
with about 22 dB PSNR chroma. H.265 and MPEG-2 are unaffected.

The vendor library selects the DDR mode based on the VE IC version. It
uses the 256-bit mode without the 2 MiB reconstruction write mode on
the H616, and keeps the 128-bit mode with the 2 MiB reconstruction
write mode on older SoCs, like the H6. Doing the same on the H616 makes
all codecs bit-exact (tested with BA_MW_D, CABA2_Sony_E,
vp80-00-comprehensive-002, AMP_A_Samsung_7 and MEI.stream16).

Make the VE_MODE DDR settings a variant property and add an H616
variant, which uses the 256-bit mode. Replace the FIXME about the
DDR mode with a description of what the vendor library does.

Fixes: 1f24d4307515 ("staging: media: sunxi: cedrus: add H616 variant")
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus.c    | 14 +++++++++++++-
 drivers/staging/media/sunxi/cedrus/cedrus.h    |  2 ++
 drivers/staging/media/sunxi/cedrus/cedrus_hw.c | 14 ++++++++++----
 3 files changed, 25 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/staging/media/sunxi/cedrus/cedrus.c
index 756243795de8..2bbc79b44f99 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
@@ -27,6 +27,7 @@
 #include "cedrus_video.h"
 #include "cedrus_dec.h"
 #include "cedrus_hw.h"
+#include "cedrus_regs.h"
 
 /*
  * The hardware decodes whatever picture size the bitstream headers describe.
@@ -697,6 +698,17 @@ static const struct cedrus_variant sun50i_h6_cedrus_variant = {
 	.mod_rate	= 600000000,
 };
 
+static const struct cedrus_variant sun50i_h616_cedrus_variant = {
+	.capabilities	= CEDRUS_CAPABILITY_UNTILED |
+			  CEDRUS_CAPABILITY_MPEG2_DEC |
+			  CEDRUS_CAPABILITY_H264_DEC |
+			  CEDRUS_CAPABILITY_H265_DEC |
+			  CEDRUS_CAPABILITY_H265_10_DEC |
+			  CEDRUS_CAPABILITY_VP8_DEC,
+	.mod_rate	= 600000000,
+	.ve_mode_ddr	= VE_MODE_DDR_MODE_BW_256,
+};
+
 static const struct of_device_id cedrus_dt_match[] = {
 	{
 		.compatible = "allwinner,sun4i-a10-video-engine",
@@ -744,7 +756,7 @@ static const struct of_device_id cedrus_dt_match[] = {
 	},
 	{
 		.compatible = "allwinner,sun50i-h616-video-engine",
-		.data = &sun50i_h6_cedrus_variant,
+		.data = &sun50i_h616_cedrus_variant,
 	},
 	{ /* sentinel */ }
 };
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.h b/drivers/staging/media/sunxi/cedrus/cedrus.h
index a523b56a9b8c..d28fe91562d1 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.h
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.h
@@ -181,6 +181,7 @@ struct cedrus_dec_ops {
 struct cedrus_variant {
 	unsigned int	capabilities;
 	unsigned int	mod_rate;
+	u32		ve_mode_ddr;
 };
 
 struct cedrus_dev {
@@ -204,6 +205,7 @@ struct cedrus_dev {
 	struct reset_control	*rstc;
 
 	unsigned int		capabilities;
+	u32			ve_mode_ddr;
 
 	struct delayed_work	watchdog_work;
 };
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_hw.c b/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
index 444fb53878d1..b66d855daaf8 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
@@ -36,11 +36,16 @@ int cedrus_engine_enable(struct cedrus_ctx *ctx)
 	u32 reg = 0;
 
 	/*
-	 * FIXME: This is only valid on 32-bits DDR's, we should test
-	 * it on the A13/A33.
+	 * The DDR mode depends on the SoC. Like the vendor library, use the
+	 * 128-bit mode with the 2 MiB reconstruction write mode, unless the
+	 * variant says otherwise.
 	 */
-	reg |= VE_MODE_REC_WR_MODE_2MB;
-	reg |= VE_MODE_DDR_MODE_BW_128;
+	if (ctx->dev->ve_mode_ddr) {
+		reg |= ctx->dev->ve_mode_ddr;
+	} else {
+		reg |= VE_MODE_REC_WR_MODE_2MB;
+		reg |= VE_MODE_DDR_MODE_BW_128;
+	}
 
 	switch (ctx->src_fmt.pixelformat) {
 	case V4L2_PIX_FMT_MPEG2_SLICE:
@@ -254,6 +259,7 @@ int cedrus_hw_probe(struct cedrus_dev *dev)
 		return -EINVAL;
 
 	dev->capabilities = variant->capabilities;
+	dev->ve_mode_ddr = variant->ve_mode_ddr;
 
 	irq_dec = platform_get_irq(dev->pdev, 0);
 	if (irq_dec <= 0)
-- 
2.43.0

