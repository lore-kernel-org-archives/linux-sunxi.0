Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BA261F8BD6
	for <linux-sunxi@lists.linux.dev>; Sun,  3 Aug 2025 19:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754248270; cv=none; b=bhP2MIuSE/T5zL57hbXhSfz0rtDuk2aw2ZRBSAfbghHwyJLlY/7KTR1vvZcnPToFw828+myxErIwyVNeE2xvBBKxdirkm7WoLCOl3pjqk9n71UWcMY2wbayb2BYHDrtEV1prCle3AP7qsfYJv9PSpVvimQgm0Fn6wIGloVNeAJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754248270; c=relaxed/simple;
	bh=NuYFEKMaNu1hQjN2Md5xNm1r7h0CNUWlhKkPh3zc5MU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZG3k9PCxwy+AzPXqipsP8plMlvDUEmCTvaZZeG3IO8edgfbE7fhdL34olymH2zc7VdekULKS8dIwfu3VK2azG0doY7tO3vOvuOf3TDC9ystB8cPVBqHIHXwOrZwXSKd68gidUt0nv3dBifjcoiRyiR0wGN6V6Tw5ryBQ+wlxFu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kku4zEaK; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kku4zEaK"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4561607166aso26378945e9.2
        for <linux-sunxi@lists.linux.dev>; Sun, 03 Aug 2025 12:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754248267; x=1754853067; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qolo47kLruRZDje5v7puvJiYv8DgcRb8St2Hs5XCLlg=;
        b=Kku4zEaKlYiOVenVuF+X6O1g1dLibpboV1Jb6qQOjKP9r/f8L3wTPn2Nos/lOu8TCu
         jmzULcTdJ+jN5BknQmVStx+aX/zCh+tv4ztdmRD2hmRQyFhuZ5SiOfteKHuL+UiFGOlN
         n3opDK6TLxsigTNXdhKkNt5RXOljKoGI783WI5xIY7Rr2K4jhha+SqAy68sqP6IhCBxu
         3jsNuWb/bNjwIqSnQae5uL/bs8Tez0vEaqDIIZTwRjzKjpfVf3qataQy7nVjdvJCLIS2
         jPJEzxqGGO/KU0p//0/IXsSd8FUGXMRICW0aEcaIzRcAxAMdaAbwS31nbGSKzQrxBLq3
         ifJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754248267; x=1754853067;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qolo47kLruRZDje5v7puvJiYv8DgcRb8St2Hs5XCLlg=;
        b=wQDIEB24/vlMl08kUmhJvfqkLxxouoaWntu/LquKp9oCbZv4sJbrwnh6O8G5Pakq3g
         dgoDe4P1prA/gkCxHtCuP49mzu4tJr6XVG04Vkb6mEw9O8JZYipWa8vm01DLY6ZOO7XT
         O5qT6xY2sJyzGlJ+GTWuTzlDVaKKI32OPv2uHwY0oRjK8GPRs90RZU27RIfuh6/03QPp
         qN4Jn0xo31KTONfueF3MSso/O7OawDdAVP6ibQSuknSC+H/FqNlnHaEa10v7PSLU8/Cq
         3lUp1wvpNqU3dgqPYxaBZsRKzOAi9ljACAoIGRFuIsbHD12URpC+sEkM+Sso7PGxWWrc
         Hbdw==
X-Forwarded-Encrypted: i=1; AJvYcCWFst3VHq8jBqaHGMBWfubb3CHpuTfIHK84vnTmtPJ3p/e3j8ueilkES6rzSLjRJuC3pDJDw0VPYsea2w==@lists.linux.dev
X-Gm-Message-State: AOJu0YxZ8U2ZP3ZBpMaeDJ/Cg/e1xDrAUI9JBGj2VM37B4MIRrDk8O5X
	7CF2heeU+e3vUL1Ald8qEVTCsDiwuu5kEO4uEK3YkUnMEvzuBCWPe5JD
X-Gm-Gg: ASbGncvQLiJwQgfD/Z3eR3hL4m8caWXT01DKR17Qkw1DBFRPNYW65cUGgaZz8V7hVuF
	PmSePEBK2nDflyOgz1RDoZWCedO5kvERJHKaiXsV8BuEe5zf01qbMpkJM+bg8c+7+WfShCXrYm4
	7izP9muk/ZuwScJM6K/9Y3DxSuR3ac1iPEuFvg/R18gyTJx80tjvAX0GmIbv5stZRpIcRpZmWYV
	6gVH3PmD914YSBtxEUkMvNzQOZbc4DOKYmgCex1vMgJvvPc5HzBk0lAkW+CtSdDiZCKNFUbT26D
	QoZzVzErAmiEeNIaVZX3JQzycC98IjLhlv2i4NOoDg//8UR2Oi17pLZL/CVUYyKhdXpqe9kde5D
	9/605gU+FS/CbHBFfMK22wlsXbBPNZgTwLQ==
X-Google-Smtp-Source: AGHT+IHJPGckbzUmSSL2cgE0cCZx9wW/o8POt8Pcz8H/fgdDIEL5DMDINIkmWcO6ymEP+suWYNdLTw==
X-Received: by 2002:a05:600c:4692:b0:456:1a69:94fa with SMTP id 5b1f17b1804b1-458b69dd831mr46823935e9.13.1754248266873;
        Sun, 03 Aug 2025 12:11:06 -0700 (PDT)
Received: from ws-linux01 ([2a02:2f0e:ca0d:f700:1210:b727:adc8:716])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c45346asm13099210f8f.39.2025.08.03.12.11.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Aug 2025 12:11:06 -0700 (PDT)
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
Subject: [PATCH v2 4/9] crypto: sun8i-ce - add a new function for dumping task descriptors
Date: Sun,  3 Aug 2025 22:10:24 +0300
Message-ID: <20250803191029.3592987-5-ovidiu.panait.oss@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250803191029.3592987-1-ovidiu.panait.oss@gmail.com>
References: <20250803191029.3592987-1-ovidiu.panait.oss@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In order to remove code duplication, factor out task descriptor dumping to
a new function sun8i_ce_dump_task_descriptors().

Signed-off-by: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
---
 .../crypto/allwinner/sun8i-ce/sun8i-ce-core.c    | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c
index ba30859e749c..b7093fbb8e9d 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c
@@ -169,6 +169,12 @@ static const struct ce_variant ce_r40_variant = {
 	.trng = CE_ID_NOTSUPP,
 };
 
+static void sun8i_ce_dump_task_descriptors(struct sun8i_ce_flow *chan)
+{
+	print_hex_dump(KERN_INFO, "TASK: ", DUMP_PREFIX_NONE, 16, 4,
+		       chan->tl, sizeof(struct ce_task), false);
+}
+
 /*
  * sun8i_ce_get_engine_number() get the next channel slot
  * This is a simple round-robin way of getting the next channel
@@ -183,7 +189,6 @@ int sun8i_ce_run_task(struct sun8i_ce_dev *ce, int flow, const char *name)
 {
 	u32 v;
 	int err = 0;
-	struct ce_task *cet = ce->chanlist[flow].tl;
 
 #ifdef CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG
 	ce->chanlist[flow].stat_req++;
@@ -225,9 +230,8 @@ int sun8i_ce_run_task(struct sun8i_ce_dev *ce, int flow, const char *name)
 		/* Sadly, the error bit is not per flow */
 		if (v) {
 			dev_err(ce->dev, "CE ERROR: %x for flow %x\n", v, flow);
+			sun8i_ce_dump_task_descriptors(&ce->chanlist[flow]);
 			err = -EFAULT;
-			print_hex_dump(KERN_INFO, "TASK: ", DUMP_PREFIX_NONE, 16, 4,
-				       cet, sizeof(struct ce_task), false);
 		}
 		if (v & CE_ERR_ALGO_NOTSUP)
 			dev_err(ce->dev, "CE ERROR: algorithm not supported\n");
@@ -244,9 +248,8 @@ int sun8i_ce_run_task(struct sun8i_ce_dev *ce, int flow, const char *name)
 		v &= 0xF;
 		if (v) {
 			dev_err(ce->dev, "CE ERROR: %x for flow %x\n", v, flow);
+			sun8i_ce_dump_task_descriptors(&ce->chanlist[flow]);
 			err = -EFAULT;
-			print_hex_dump(KERN_INFO, "TASK: ", DUMP_PREFIX_NONE, 16, 4,
-				       cet, sizeof(struct ce_task), false);
 		}
 		if (v & CE_ERR_ALGO_NOTSUP)
 			dev_err(ce->dev, "CE ERROR: algorithm not supported\n");
@@ -260,9 +263,8 @@ int sun8i_ce_run_task(struct sun8i_ce_dev *ce, int flow, const char *name)
 		v &= 0xFF;
 		if (v) {
 			dev_err(ce->dev, "CE ERROR: %x for flow %x\n", v, flow);
+			sun8i_ce_dump_task_descriptors(&ce->chanlist[flow]);
 			err = -EFAULT;
-			print_hex_dump(KERN_INFO, "TASK: ", DUMP_PREFIX_NONE, 16, 4,
-				       cet, sizeof(struct ce_task), false);
 		}
 		if (v & CE_ERR_ALGO_NOTSUP)
 			dev_err(ce->dev, "CE ERROR: algorithm not supported\n");
-- 
2.50.0

