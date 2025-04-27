Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE91B33CA
	for <linux-sunxi@lists.linux.dev>; Sun, 27 Apr 2025 11:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745752483; cv=none; b=R0fiK8ucF+ldA/5hO0jJwTuucRkYPIqR0a2Vrj+F2P424BO6cmGcn9sj0O8AGbkXwK8pQt4FGlMLKy18KTPh/LGU3BiUJNg13aMqXOw+mJy6AbjqG1qK6T8jOUo2O7UDngq8Ic+qCwzcsN8ppVYlEbHwIQqgMEHt9JqnQh9IyEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745752483; c=relaxed/simple;
	bh=OHPq3cQvYAfeMfKNid5wSfhkKzwBaStHV8HzBeC3uzs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WlslH6VhZzH0N5cQQ4RN3WtVb9ACgys126rN9pckTe89iLO6MmoJ8wF59mmPaVRHWKhL61JT4JKCi9KJt4LEPZzurhVGYuCzhQ+aGNCX+NBd8LSVCPv4ikxb6PDR7v71Avudtp6cLRNrdbVHmyJz89Kc2oyEEl5vSYKiYIXeJSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O64VwyG0; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O64VwyG0"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43cfa7e7f54so25011915e9.1
        for <linux-sunxi@lists.linux.dev>; Sun, 27 Apr 2025 04:14:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745752480; x=1746357280; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=W3KBITx9RJaJB+v1y23nabF6VYlDwF1hnHk+X2NkE0k=;
        b=O64VwyG0kgYUJjMZw/Nyg3l3i+q7dBI92f2elz+SXoAbjdZhV7ta5TA/ZcM23M6c9D
         udrJ/bJp5GwUwKaTEZ47acLxIUCiSYL549N4XiwF7b6XJnpX9r0FMBJOtnxFgbGCe+V1
         i8jtm+BuXWjN/GzgMaas4Rgiuzh00AwkC3j+WjJMtoZXJSywB/cnov7tgUR0L946VRJj
         CBJoNtKPq0MNt782K8Pt6i2BoNno14qFI8mUVhH1QaWcxq2/2ZQ26zswViylLHQ2IoJx
         Je/Vas9k+fMA/bkvJTVc6viINtJv0vCD+oNbrQnk6YtAhOPv2+4dZQl1sDmTefh2Sgs1
         zLcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745752480; x=1746357280;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W3KBITx9RJaJB+v1y23nabF6VYlDwF1hnHk+X2NkE0k=;
        b=UTTQ7tTdfwXayxV9Jidrs3uswAqaWvGaAhaGgd8SpsOW/yD3brnflqi9cLPGoufAbZ
         PTseBqoC1F03acSwcdKCloKWP82ToZ2HBxCQpDx76PTaUIcVewE2i0kthHnJhzquHP1C
         4EMdMmyv6l6JeyIyMxF7NcSA52od0dW9/yfrS0sUULWNVUWWRMcLuVdaDzjj0OOX100I
         HBH+4Mev5VAhhou7uWAh8AojJ3l15nBPmCDrsmcMg64TpHvkKvBLqO9b5ocprChFgfkR
         XaVG4GFI1cBryY3xe4tjNINJgOXeM/USKKSnuh6MeFYpiwQcqSt5MWgjxRefQYKTvziF
         DhTA==
X-Forwarded-Encrypted: i=1; AJvYcCXIeFVMtXLh2En2QG8zjhMJ4Pfe/JdPtUEUQr5j1TJCaMGvLKrPA272Ih5kiQaQAQKI3zoTI+FPi4s/PA==@lists.linux.dev
X-Gm-Message-State: AOJu0YypVJfENdopPxvj+gWun1JAFj5vy9Nd7W0hRnmbzBOetUE445oV
	Lp5v5nYQnlNaX53srdwowdtZ6wDP1p6UAWunSNoAlg6IFGmniYNI
X-Gm-Gg: ASbGncsuCAIPeRuZ0KU3kHvAfhQY/VCdzAclCFeJUBOAlpV27W5Uc6o1y4cogerSEpj
	OAq0plfXodhXAfXxP/Q8qcxCn6s22BdKR+PmxMDECjyKkzhXW6MMisQPsD+ko0yV2+pVHRKsB8D
	z2Bidd6bqmjNeylQvnejexjgmfZhHgaXchwiW6hZ6Wq4JMI2Dk3j42khGRbYzH11uf23D/eiFJ4
	ZGR7qLVMA2RMKeY8Luy8eF8qVCM6W2S++HQx0qzPc7xNhy83VQnaNAanSLXn2a90j2HSLEWpikJ
	0xH2eyyHk/GwxIEJVaBC27A/P6PwtVKj+GaGPjv2b2SXuWa1UMtcUzRj7NzQ4Vls
X-Google-Smtp-Source: AGHT+IEjc9o8H8oECCb05JlQieQM2HuT1pOumzI29bfNceULPIWLWaiAlh6hn8YYL7mavp+K+CgJLg==
X-Received: by 2002:a05:600c:8109:b0:439:873a:1114 with SMTP id 5b1f17b1804b1-440a65d27edmr65047645e9.6.1745752479653;
        Sun, 27 Apr 2025 04:14:39 -0700 (PDT)
Received: from localhost.localdomain ([2a01:cb1d:898:ab00:4a02:2aff:fe07:1efc])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4409d2e0241sm122350515e9.37.2025.04.27.04.14.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 04:14:39 -0700 (PDT)
From: Corentin Labbe <clabbe.montjoie@gmail.com>
To: herbert@gondor.apana.org.au,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	wens@csie.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	Corentin Labbe <clabbe.montjoie@gmail.com>
Subject: [PATCH RESEND] crypto: sun8i-ss: do not use sg_dma_len before calling DMA functions
Date: Sun, 27 Apr 2025 13:12:36 +0200
Message-ID: <20250427111236.25668-1-clabbe.montjoie@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When testing sun8i-ss with multi_v7_defconfig, all CBC algorithm fail crypto
selftests.
This is strange since on sunxi_defconfig, everything was ok.
The problem was in the IV setup loop which never run because sg_dma_len
was 0.

Fixes: 359e893e8af4 ("crypto: sun8i-ss - rework handling of IV")
Signed-off-by: Corentin Labbe <clabbe.montjoie@gmail.com>
---

If someone know why sunxi_defconfig have sg_dma_len() which always works
even with any DMA call not done.

 drivers/crypto/allwinner/sun8i-ss/sun8i-ss-cipher.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-cipher.c b/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-cipher.c
index 4caf17310e90..ddec1b08d4f6 100644
--- a/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-cipher.c
+++ b/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-cipher.c
@@ -141,7 +141,7 @@ static int sun8i_ss_setup_ivs(struct skcipher_request *areq)
 
 	/* we need to copy all IVs from source in case DMA is bi-directionnal */
 	while (sg && len) {
-		if (sg_dma_len(sg) == 0) {
+		if (sg->length == 0) {
 			sg = sg_next(sg);
 			continue;
 		}
-- 
2.49.0

