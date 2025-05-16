Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B800239E83
	for <linux-sunxi@lists.linux.dev>; Fri, 16 May 2025 12:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747397308; cv=none; b=GaskkrpSqmnhEvZ4VVOK08bMP9Tc56bAbYmDFxGa4Pt0FJRpQjS9PNOFny5hRa0F15MK8sKmU5qlAdAjypy+elUNbUAw7Qtsd8ato7GdG8yadHLtkLG0NlQ4da9hDClej4KMtmRf44KJjgiOyMAq7xmvQ1+CZ4nsuAjseW6CHeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747397308; c=relaxed/simple;
	bh=LLFTaXnhleq34jL/n5gBjVlQjNQtKROkYDnqUvpqa5U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FPtK4UGFLx06E2jj8iJ8lgKMgBiPAInYPBvUC/Ex73QbD+gnYhNt8bJHPI/VXE6a6S++LXzUygugZzamXRWZ+9VhZbZ8lLJxdmOEouiAUuNSIvEDCl6J46n00pex3DwPeA1aok+25sT7jyh+/NkG08dpsavQaPi3lJccuqVMao4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OnAmWdoK; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OnAmWdoK"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-442f4a3a4d6so13017445e9.0
        for <linux-sunxi@lists.linux.dev>; Fri, 16 May 2025 05:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747397305; x=1748002105; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=l7S/vG1lp5geqRglunYVLNLd5lLTAffxPlQ/qp918/4=;
        b=OnAmWdoKpykj4KJx4YSmAG7k68A4FuA+L6zZpEbfNMlot9hzj+2CyzDjYYTtNudoHn
         NbBle1CkucOqz554M+KRgB3yWo8sGgNKDuPxKiSRmXd9CrKYJv/btFKrvz1NW6U9h0YE
         I0rxHA0W2JjUKaomaTey8mkD/im2B6sYZoSzB2q/Aa/z4YS9u8N+Aful1ZAzQ6NRT+NA
         AN2+OkCnC2wPqT8acLZyB/UvxFbN8zhKbNMdF9yotMTM5B1N8GdL4YnuQsCmvj/GaT+n
         iH4nobkkFffvl+I9ht1IkLBfwVQgm2q98V4cciHVElj2znhpFrzw90pzj02G7yK8Nu2u
         bCqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747397305; x=1748002105;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l7S/vG1lp5geqRglunYVLNLd5lLTAffxPlQ/qp918/4=;
        b=jf5KrQKy1qNVYRJ1YrVP9Jgx8eLYquip7hsuK7KSLHx+QtYj7HbHBNEGN5hqeGYLk9
         Zk5/QJe0r9DSVXKjcepB1YAQhsXoAlk0qOVrpAF+5m5qYt8GP2n9O+eD4NLVzvIH/ozE
         KCw7leZ+3kfBtQoYK1tZvIOU7moJRYqmqDM39V/6gP++9fHtXPQZxTmJU0l3UuWNkzH1
         vAQFKZjWQSYwSQGt7KhEdFKu847/rnDBh1JhBCf1PtgAHdjaAxnQMfBU0YVrVoLj7k7e
         0B2IoaQ9VnQmVtnJjZayNzGStBchtkova6njCW2Ekmk2mZZXx3LEdjHvvIxYv2w/kXuM
         /tIg==
X-Forwarded-Encrypted: i=1; AJvYcCUEqOgmHkMYmwi51C20LTPOtEWY7sXqfiGcODlNuD6OALr14mrg8gtJ6fWXh/yJEhMJ7QQgeJVhCBt7Kw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxLoaGQSg8M+RXvyA0i8YChHrLO+hQg42DQs3bPJVz1UN7WR1ze
	rw8ORyNaOOcHcOCtx1vIZueF2h68RrvWip4siaxaMSmOehrNxOfE4SsZyUtz2A==
X-Gm-Gg: ASbGncuy6Fkmel85OK+URg5eO33C6fFpcEdJvBtcdhLSyC3fqpniyN6w6NAP6RjewCh
	gBJgLBAmo9iz0LMsj67PJQ1J4YrnhVOhK9CUPXGCj+u1x0a6qFhGWfo7L/yowMb6hV331yYMWFJ
	BpzIpvbEB8BVbO77tFtclIrxvqoX/kaEKmnFVltAozJnYbV1m1MlOETaI4Dc87gsTEd1GGgUX2n
	0+bd0p4yD/VqPCgpT30iWitWh2w4dUQR9bzf1LVUWBTkRHF2Z55bM3lCeTmwqbsX8RqeJSfUVEl
	XGNykah62Kb6T7LewJMxJ0T1hDkp9PA4OAeGPtwlYibZELKlNYGbDktdG6Gz+IcerDY5IxpJ2HL
	7sQY=
X-Google-Smtp-Source: AGHT+IETHNO4PZaxAV5fQzFYG7nB1lHUisZaUbqvlKR7l0R0thhXbB9LDnls9f0950ZGMS0nNFwq9w==
X-Received: by 2002:a05:600c:821b:b0:43b:bfa7:c7d with SMTP id 5b1f17b1804b1-442f84c2008mr72290655e9.2.1747397304833;
        Fri, 16 May 2025 05:08:24 -0700 (PDT)
Received: from localhost.localdomain ([2a02:2f07:610b:a400:6472:d2f9:d536:4c30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f338050csm102275725e9.10.2025.05.16.05.08.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 05:08:24 -0700 (PDT)
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
Subject: [PATCH] crypto: sun8i-ce - move fallback ahash_request to the end of the struct
Date: Fri, 16 May 2025 15:06:56 +0300
Message-ID: <20250516120656.3610623-1-ovidiu.panait.oss@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

'struct ahash_request' has a flexible array at the end, so it must be the
last member in a struct, to avoid overwriting other struct members.

Therefore, move 'fallback_req' to the end of the 'sun8i_ce_hash_reqctx'
struct.

Fixes: 56f6d5aee88d ("crypto: sun8i-ce - support hash algorithms")
Signed-off-by: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
---
 drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h
index 3b5c2af013d0..83df4d719053 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h
@@ -308,8 +308,8 @@ struct sun8i_ce_hash_tfm_ctx {
  * @flow:	the flow to use for this request
  */
 struct sun8i_ce_hash_reqctx {
-	struct ahash_request fallback_req;
 	int flow;
+	struct ahash_request fallback_req; // keep at the end
 };
 
 /*
-- 
2.48.1

