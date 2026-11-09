Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794246682;
	b=jynqYUC6tpkgmmi2LGGIT10tNwQdC5MsBzLawyni2Tkk2evFy06evX8eXnBxVLAjO0P6
	 TDRUFMy3DzFRiUxgNN+unU+sDSGYeFK1S4lvEJVbHWqQ0yxtPMbr3nCsdrSnzqDCOQ+gA
	 vqWtrSARYV9z87bJhfqqkaGBPq+IrXk00Oyt0SlRNusm9FQuXRwv9UNlMMViDVXLAko5t
	 xDlTlMPXIANIu7L/I41mQBzaAnNL26/iar/GvanuGqgq0JcABnD7KFUUEBID8MCnp7StZ
	 bJibKoXp6bQes41ZJY0bJR2aboLfg+QONnn6EkkMYJuqfHvwldNdOXrm9zaFmPtmYpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794246682;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=i+XCxxAzlvX4gdjOWVlK9Z6T5fYWDEYFJTp9nSjumow=;
	b=gjOhCHGH4QrZcbp2aqvJv+jnsbfL9W4GwkncFSLhNyQLAvspLRlkeh+1mRhD/NyzOLRR
	 RNSV6Vczrz+wUZzQXdLzVEKLcF3hHli4Xb9URxz8s29uYlBEXlr+zeRdKohBYtKJJiZER
	 qJfb2bQzsAFQlbNnd3tDCpCX2VF0o704461G94o1ZVaHyXhPtxn8O/1GXzZCmKeftIHQJ
	 9JXSqIVw0M1/oGki+PZx4u5MHXzh/fH+KMl+h5NfcU/3yyUFZEs+YYxWfa7krpwaH6kxt
	 HKCA80W8cHk0T+IZAp3NZ7vrb1konKZJCOTypdDl34ONfDnrHCfVDFTiezGiLY9SRVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KufMoKX9;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F149606A8DD
	for <linux-sunxi@lists.linux.dev>; Mon,  9 Nov 2026 17:51:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F149606A8DD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KufMoKX9
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48e4831c028so1266327f8f.0
        for <linux-sunxi@lists.linux.dev>; Mon, 09 Nov 2026 09:51:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794246680; x=1794851480; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i+XCxxAzlvX4gdjOWVlK9Z6T5fYWDEYFJTp9nSjumow=;
        b=KufMoKX99ft0G8RJJxauF4oCBhq2d+bVnpT6QfjVx/L6WDkelgIv/dFWNXKd8+pv++
         YF6AVSp3oW7szSvLn9GaC+Rp7GOP2j/XEjPwFMCI022WXsGMyd9vkJWwmYZ3LEfiaDOc
         Ex6+qZjKgOLXPOELrd71cZClOOHTTDtFXOqOkY2jhjKp/PYNNnaPYUfFeDy092HZHRQO
         wQSxMVhZy3Eeh9y3fzYGOjh2+PyAL3J6akiOkvlltn7HILBSbgF/qoFigoEVQLpEkMX0
         gYAkCxaCISw7ddan7VglW1oPeXBD5SxNejhCeOV8CiXf66MmpOUqnDWXIpg9zwnDEG8X
         ONIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794246680; x=1794851480;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=i+XCxxAzlvX4gdjOWVlK9Z6T5fYWDEYFJTp9nSjumow=;
        b=HfQe01br0CBJ3RzjdLanyKrbdueDB3pJ4ook/3ounUPMnNEYG+IFTBf9ART/bfbyHX
         QztAVvP3cFRWusoPJ391i7h1yTpxcJ5aB0u6HpT3tAWeDXQuOSvLnmZPNxMerjvWC0Yc
         coR0tpp/4wE8qyfTXhux/LKGW0qJM7PZrk3WPEf3sdtsrBmG+rpLD98uLAPgiNlBHNVu
         0KrSNUQ+jF8FJKL/hLhuo+zlb6Nw8mYtudQblX2uRO9VEc5yYFMUluxus+eUKI+REwpy
         O0u6eRIzN7i5ptWBsCZiK60NH8BYuK5Vllm1gfPNMGsnTC/hNqNVDVMqge4cc0276jqp
         Ddgw==
X-Forwarded-Encrypted: i=1; AL+hErFIrpd5nZbQr2fbS+H5mRjSd64eqzddwYlLigDVBHMpeOxd4Te3McT1ej4NMa+wRcWtyR5JB1t+dY/mDw==@lists.linux.dev
X-Gm-Message-State: APuU4Z8ZzRQSrLy4x2NBj92Gz1Jv1RWJsliHllfJ8Ehlb8GjEwOwrC7U
	PEzwWFwuzETbsjyfEPieHWFLCk1cEoy9UEJ51qyc6JuwGRH0etgYodaV
X-Gm-Gg: AYBFou3TNpSjAKB4tSiF+2UjFT+mAbha8VKVPHAd03pn6E13tJbU7fqgqDmXvR1RaON
	39jqrEQd+O5JDW7uQleFVETs1c9c60o+B3HSuimDmxk8KJxYsEHAPMVssabCbgOTTqzGKJ+06c1
	Jos7FfIVRaivA3vikhBETvUmiP4e4Nc6RVj5S9KZcmZ79bQPeMd7Zb2SwZzGBXQOAU4vphGAgVa
	36ZexfpnuZvEzs1F2GHv0nZK79ICl19OMVuirB+T+gw11NLG7aIAI1fReMb6zhCeRtaeCDXOH4S
	ZIiPfUVRfIXR2ErwjqUyvm3nAuQLsOLHiKYOgPPKNmGRbtXH3jhewG9VkFINDwNKTA0qrPR2GCz
	9v8cBhVrr+sWZacvpBHzvdL4EhlsNY+7a+/yzfLHoIN+fylw7c5AclPb+EJBO3Q9PrxqRh2bMRk
	8h7Glc63KbitBdEjfBJ0op4I97ES2ZJtnwTrDihx8pHk3pPSP8iModyVKOywckinJ9+K6rBivUS
	HhHDzqW0aiQJUZfi/qUqQrQl3yW5rrNIYQJHGAFTKw7ThECUYonnXHFH25M37tnqI6slHnE7fhK
	SVq+CMf4I2ci9UC2rM9OtpJHFKvsaOCHkOVuJafBAoTDGtXyMVUUeph5RBJz5i5zgP51Su4UusY
	OmZAvtYkEOmvtvaRGgFW642uvId03xWsmJdUs87Rp7zbCmtlxW1a9g1DkSZ0QeWnN5ytPEf4Wij
	70RYtkhJ+7Vzn09PGkyeuGWxVw352VCNuhXiSFW5wFhMBbTIDsJVtbLsBhWx7PkfV4Uo+8+0HvI
	gTGEhITU9Qz5H03SzeaRJ4zw713M5fGw1M1I37e1nq4bADAZ6I=
X-Received: by 2002:a05:6000:469a:b0:48e:fdd:41d9 with SMTP id ffacd0b85a97d-4982f968989mr173933f8f.31.1794246680224;
        Mon, 09 Nov 2026 09:51:20 -0800 (PST)
Received: from jernej-laptop (86-58-12-36.dynamic.telemach.net. [86.58.12.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498369a4238sm200717f8f.54.2026.11.09.09.51.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 09:51:19 -0800 (PST)
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
Subject: [PATCH v2 11/11] staging: media: cedrus: vp8: support frames wider than 2048 pixels
Date: Mon,  9 Nov 2026 18:50:16 +0100
Message-ID: <20261109175016.42061-12-jernej.skrabec@gmail.com>
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

Above 2048 pixels, the deblocking and intra prediction row buffers don't
fit into the internal SRAM anymore. Put them into DRAM like H.264 does.
The vendor library sizes the deblocking buffer as 24 bytes per column.

The buffer sizes also tell whether the buffers are in use. Set them only
once both buffers are allocated, and clear them first, as the codec data
is shared with the other codecs.

Tested on H616 with 2560x1440 and 3840x2160 libvpx streams, which are
bit-exact with the FFmpeg software decoder.

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus.h   |  7 ++
 .../staging/media/sunxi/cedrus/cedrus_vp8.c   | 67 +++++++++++++++++++
 2 files changed, 74 insertions(+)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.h b/drivers/staging/media/sunxi/cedrus/cedrus.h
index 78efd3938c77..e26bbbf2e55d 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.h
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.h
@@ -156,6 +156,13 @@ struct cedrus_ctx {
 
 			u8		*entropy_probs_buf;
 			dma_addr_t	entropy_probs_buf_dma;
+
+			void		*deblk_buf;
+			dma_addr_t	deblk_buf_dma;
+			ssize_t		deblk_buf_size;
+			void		*intra_pred_buf;
+			dma_addr_t	intra_pred_buf_dma;
+			ssize_t		intra_pred_buf_size;
 		} vp8;
 	} codec;
 };
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_vp8.c b/drivers/staging/media/sunxi/cedrus/cedrus_vp8.c
index 84bf18fd231d..bb32232d37ff 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_vp8.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_vp8.c
@@ -669,6 +669,20 @@ static int cedrus_vp8_setup(struct cedrus_ctx *ctx, struct cedrus_run *run)
 
 	cedrus_write(dev, VE_H264_CTRL, VE_H264_CTRL_VP8);
 
+	if (ctx->codec.vp8.deblk_buf_size) {
+		cedrus_write(dev, VE_BUF_CTRL,
+			     VE_BUF_CTRL_INTRAPRED_MIXED_RAM |
+			     VE_BUF_CTRL_DBLK_MIXED_RAM);
+		cedrus_write(dev, VE_DBLK_DRAM_BUF_ADDR,
+			     ctx->codec.vp8.deblk_buf_dma);
+		cedrus_write(dev, VE_INTRAPRED_DRAM_BUF_ADDR,
+			     ctx->codec.vp8.intra_pred_buf_dma);
+	} else {
+		cedrus_write(dev, VE_BUF_CTRL,
+			     VE_BUF_CTRL_INTRAPRED_INT_SRAM |
+			     VE_BUF_CTRL_DBLK_INT_SRAM);
+	}
+
 	cedrus_vp8_update_probs(slice, ctx->codec.vp8.entropy_probs_buf);
 
 	reg = slice->first_part_size * 8;
@@ -837,6 +851,11 @@ static int cedrus_vp8_setup(struct cedrus_ctx *ctx, struct cedrus_run *run)
 static int cedrus_vp8_start(struct cedrus_ctx *ctx)
 {
 	struct cedrus_dev *dev = ctx->dev;
+	unsigned int deblk_size, intra_pred_size;
+
+	/* The codec data is shared with the other codecs. */
+	ctx->codec.vp8.deblk_buf_size = 0;
+	ctx->codec.vp8.intra_pred_buf_size = 0;
 
 	ctx->codec.vp8.entropy_probs_buf =
 		dma_alloc_coherent(dev->dev, CEDRUS_ENTROPY_PROBS_SIZE,
@@ -852,7 +871,42 @@ static int cedrus_vp8_start(struct cedrus_ctx *ctx)
 	memcpy(&ctx->codec.vp8.entropy_probs_buf[2048],
 	       prob_table_init, sizeof(prob_table_init));
 
+	/*
+	 * Above 2048 pixels the deblocking and intra prediction row buffers
+	 * no longer fit into the internal SRAM. The vendor library sizes the
+	 * deblocking buffer as 24 bytes per (32 aligned) column.
+	 */
+	if (ctx->src_fmt.width > 2048) {
+		deblk_size = ALIGN(ctx->src_fmt.width, 32) * 24;
+		ctx->codec.vp8.deblk_buf =
+			dma_alloc_attrs(dev->dev, deblk_size,
+					&ctx->codec.vp8.deblk_buf_dma,
+					GFP_KERNEL, DMA_ATTR_NO_KERNEL_MAPPING);
+		if (!ctx->codec.vp8.deblk_buf)
+			goto err_probs;
+
+		intra_pred_size = ALIGN(ctx->src_fmt.width, 64) * 5 * 2;
+		ctx->codec.vp8.intra_pred_buf =
+			dma_alloc_attrs(dev->dev, intra_pred_size,
+					&ctx->codec.vp8.intra_pred_buf_dma,
+					GFP_KERNEL, DMA_ATTR_NO_KERNEL_MAPPING);
+		if (!ctx->codec.vp8.intra_pred_buf)
+			goto err_deblk;
+
+		ctx->codec.vp8.deblk_buf_size = deblk_size;
+		ctx->codec.vp8.intra_pred_buf_size = intra_pred_size;
+	}
+
 	return 0;
+
+err_deblk:
+	dma_free_attrs(dev->dev, deblk_size, ctx->codec.vp8.deblk_buf,
+		       ctx->codec.vp8.deblk_buf_dma, DMA_ATTR_NO_KERNEL_MAPPING);
+err_probs:
+	dma_free_coherent(dev->dev, CEDRUS_ENTROPY_PROBS_SIZE,
+			  ctx->codec.vp8.entropy_probs_buf,
+			  ctx->codec.vp8.entropy_probs_buf_dma);
+	return -ENOMEM;
 }
 
 static void cedrus_vp8_stop(struct cedrus_ctx *ctx)
@@ -864,6 +918,19 @@ static void cedrus_vp8_stop(struct cedrus_ctx *ctx)
 	dma_free_coherent(dev->dev, CEDRUS_ENTROPY_PROBS_SIZE,
 			  ctx->codec.vp8.entropy_probs_buf,
 			  ctx->codec.vp8.entropy_probs_buf_dma);
+
+	if (ctx->codec.vp8.deblk_buf_size) {
+		dma_free_attrs(dev->dev, ctx->codec.vp8.deblk_buf_size,
+			       ctx->codec.vp8.deblk_buf,
+			       ctx->codec.vp8.deblk_buf_dma,
+			       DMA_ATTR_NO_KERNEL_MAPPING);
+		dma_free_attrs(dev->dev, ctx->codec.vp8.intra_pred_buf_size,
+			       ctx->codec.vp8.intra_pred_buf,
+			       ctx->codec.vp8.intra_pred_buf_dma,
+			       DMA_ATTR_NO_KERNEL_MAPPING);
+		ctx->codec.vp8.deblk_buf_size = 0;
+		ctx->codec.vp8.intra_pred_buf_size = 0;
+	}
 }
 
 static void cedrus_vp8_trigger(struct cedrus_ctx *ctx)
-- 
2.43.0

