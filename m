Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27919305E38
	for <linux-sunxi@lists.linux.dev>; Tue,  2 Sep 2025 13:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756819378; cv=none; b=P8Z8aeCPPUkrdU7SS2oyUnKIW+GsIdmCvGZqH78FVeGxJu98K+elk+pUOd4Uen1k8cbTkRtdNWx0bQaQMDaLc6fsGn1MacNPCEVVC9EG5O00YBuOFbDVLeH/H/6mJrnPGV0ngQjWXpBaj0BKTU/OrCFPFLWfs9jryE3knTXqkA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756819378; c=relaxed/simple;
	bh=l898iI1BQTDI8cMdaHUOF7Zr2+U+5iB/kVmacVwl2cs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gvWrHl6dU53+F/8fqnIdULYLs8GDmns0uKwaxQxFnz9UR3H0w7PBEHZ/xksv3zgvQQUn4VJeESpD8sBWqaCp0ZQe2Ez4NgpfxmSJf5a8DPeZBUp/Tj6Ye93V1sLH3Heb5YgWKrdT66RSsKamlYVCAZoRyKhfMkL6loSHFuTjJ5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ivXJxqzh; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ivXJxqzh"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-45b83ae1734so23118785e9.0
        for <linux-sunxi@lists.linux.dev>; Tue, 02 Sep 2025 06:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756819375; x=1757424175; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=edZLfiZt8B4p4uO3hUsASn2XOCnLkF3RAYMn9M9Bwpk=;
        b=ivXJxqzhNdlnKg3SgPzu7mLfWdrr/8A3hDlBIPhFuJH1MW2KrIU381sz0Ic/wzuw8x
         V5NBNifqGQzbN3z3fZlhmHOhQp1Z3kYe6iHXGXIs9OKq9D79AmLUtzbiBvbjFoddmcdl
         Kce6E845p+GiV2QC18xJq2sElrSo2hozMPxsUirDzTUF1gEKi9TpAAqkpS9k0h9QL5wo
         jZTOWdcsy4UrCeCPutBLj8TpuyGNrEIU2YYO2w9yo3q+HpKw9rVcKXDgDbSSKxj1QBkz
         gGuUSg83pD/FZPDWOTOEVuxttN9seANyqFyT1z1zhjZfUiyXk62HhjXZ5GP/u63qTFuz
         3Sow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756819375; x=1757424175;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=edZLfiZt8B4p4uO3hUsASn2XOCnLkF3RAYMn9M9Bwpk=;
        b=MM6el/n0utiOezTbmAUCsdv/XOm9kLGlLtsXNHp8WgBzVEfojcWPVPMrUc35msnQfg
         vQNkj+JNji5jmtX6XfdYM/zP9V30CXqeTOIuTbPgMqBF0dtjW/vVyEDJKq+olVe0jvll
         2qRk/nte83XBuIzwt+s+37HTneVbrGzwy8ccyR+ZN2Z0tSWxD9zLCn0Uw/fsLt9TdXQs
         9rgCo7SQYiaSLxZHGcE/pCNewtyCWdl7izWdXnkQE2Emg2jmxCjGprC8jYnNcAFI7+0l
         SokhAId2nNGYIfQ+FaeSnAhP2zWn/B1RoDobjpjG8H55FP0ZjFcF96lsFlIhwwWhYWP3
         qYOg==
X-Forwarded-Encrypted: i=1; AJvYcCXmdgjxSGz00IIFhgYIbkHcToJwqnU6wU03ZTa9Jhbx1GrJcVxD+usEbravrblQnbw1Rqv7OTFsJMxyGg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyYRdyy5zZCdmBcQ6wCW9VGAiiiYnY9ednJOqP4EVrVhbvs6Dyn
	zLdnBKV0v/15SXwsU+OMdfr7x0Wk2bbGYoclL4py2RZLLVfGGDsket1m
X-Gm-Gg: ASbGncu+IW1Xqji+bb2uDP7ap32G06M0sGrOEe1tT2i0jpmgHGXtDe498Z+mBDl7tg2
	je5PX1qpDVWofvPLzHNTHwqW6Z3O+HvPNcpZAGqI50cgTq9yISX41obu+CujiH96OOx7rt4csCd
	19P0usiXeP0yauYIIKA0txu7Q//NreiACx3Aznu0R/0/+FgWl6VMpddw0ibvF3C0pB5UzSfqiKD
	XgAJIGZb8RwlAHCbO52vboAVwue/xRxdH/YZuv2EJdiklaMO0bF96CF6sseX8NLD7zKjcHgQLuM
	c8DjgmC+sV+eZT1HNoPDYcDTL8kZjTsCCXbSTBiZanuPOVE+C05rDVA5asHHvgAyYo/OnUqpWL8
	YLwDBC7jxR2vt1yHp/oR4/oHFzyI7yXDDCe9ndBo87RQ9
X-Google-Smtp-Source: AGHT+IH7LkldeuIVl0roiAT8alXAPPPGwsjQFZhyThmF6wIdY2fazyGKGh4QM5al/Tpt7/lQ+R0tnw==
X-Received: by 2002:a05:600c:4ecd:b0:45b:876b:bccd with SMTP id 5b1f17b1804b1-45b876bc00dmr86469705e9.6.1756819375070;
        Tue, 02 Sep 2025 06:22:55 -0700 (PDT)
Received: from ws-linux01 ([2a02:2f0e:c207:b600:978:f6fa:583e:b091])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b945332adsm44452155e9.4.2025.09.02.06.22.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 06:22:54 -0700 (PDT)
From: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
To: clabbe.montjoie@gmail.com,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	linux-crypto@vger.kernel.org
Cc: wens@csie.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ovidiu Panait <ovidiu.panait.oss@gmail.com>
Subject: [PATCH v3 0/9] sun8i-ce: small cleanups/refactoring
Date: Tue,  2 Sep 2025 16:21:25 +0300
Message-ID: <20250902132134.3287515-1-ovidiu.panait.oss@gmail.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series includes only the refactoring commits from [1]. The batching
related changes were dropped since they are no longer relevant (batching
support in crypto_engine was retired in [2]).

This series includes various small cleanups and refactoring:
- move request-specific skcipher and hash data to request context,
  eliminating the need to allocate extra memory in the digest path
- make the hashing code more clear and modular
- reduce a bit of boilerplate/duplicated code

Changes in v3:
   - dropped ____cacheline_aligned attributes from buffers used for
     to-device DMA only
   - set up proper alignment for ahash reqctx, in order to allow from-device DMA
     into reqctx buffer:
      * increased ahash reqsize by CRYPTO_DMA_PADDING
      * added __aligned(CRYPTO_DMA_ALIGN) attribute for the 'result' buffer
      * converted all ahash_request_ctx_dma() calls to ahash_request_ctx_dma()

Changes in v2:
   - fixed [-Wunused-but-set-variable] warning reported by kernel test robot

[1] https://lore.kernel.org/linux-crypto/20250626095813.83963-1-ovidiu.panait.oss@gmail.com/
[2] c470ffa6f486 ("crypto: engine - remove request batching support")

Ovidiu Panait (9):
  crypto: sun8i-ce - remove channel timeout field
  crypto: sun8i-ce - remove boilerplate in sun8i_ce_hash_digest()
  crypto: sun8i-ce - remove unnecessary __maybe_unused annotations
  crypto: sun8i-ce - add a new function for dumping task descriptors
  crypto: sun8i-ce - move bounce_iv and backup_iv to request context
  crypto: sun8i-ce - fold sun8i_ce_cipher_run() into
    sun8i_ce_cipher_do_one()
  crypto: sun8i-ce - pass task descriptor to cipher prepare/unprepare
  crypto: sun8i-ce - save hash buffers and dma info to request context
  crytpo: sun8i-ce - factor out prepare/unprepare from
    sun8i_ce_hash_run()

 .../allwinner/sun8i-ce/sun8i-ce-cipher.c      |  85 +++++-----
 .../crypto/allwinner/sun8i-ce/sun8i-ce-core.c |  35 ++---
 .../crypto/allwinner/sun8i-ce/sun8i-ce-hash.c | 145 ++++++++++--------
 .../crypto/allwinner/sun8i-ce/sun8i-ce-prng.c |   1 -
 .../crypto/allwinner/sun8i-ce/sun8i-ce-trng.c |   1 -
 drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h  |  27 +++-
 6 files changed, 147 insertions(+), 147 deletions(-)

-- 
2.50.0

