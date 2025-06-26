Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B646F2C08CF
	for <linux-sunxi@lists.linux.dev>; Thu, 26 Jun 2025 09:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750931972; cv=none; b=RR2aob4NgHdatBu6rPx+hnZLkotZayKF985njXAlekeotjwubFDzqxd2v91mQgY5pLtoylxPzgB2ksa1q+rfz5BWNKLiOENUXOIVFXJEAWNDskn1zPI7nWbR+LfNQYyzevSy45BCDZH15LzZpl2bm1wiwaWm9P8Bo9+B1akA6fU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750931972; c=relaxed/simple;
	bh=dsS+p6UvQk8Xwg+WgyOGAas3d5MTBbJN2FAK8gI6CFU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RRpgfo9AVBQZuhldoDKNbHA7ugCMdA/Fm/N6cO3AhCCQe40/MREUH0UbjpatBPg8L5l3chx6xgj/6xQbYIzY91YANDr7N5wpP/fdDDK58KkwazQDyFHwFUY/QI0GJifR9P41UcCHv1don6M51POeZH3NwhL3ottn6npINlK1ybQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d+R0VjOF; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d+R0VjOF"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ae0a0cd709bso379053766b.0
        for <linux-sunxi@lists.linux.dev>; Thu, 26 Jun 2025 02:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750931969; x=1751536769; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=579Q1QhHC2sKl8ad1uJdu4XVU+r2uSj185NnGxhlUu0=;
        b=d+R0VjOFSCwp2tiJCK/TuMHlAcW6qaW5OD0x6ImlObN+Vpj8JEsfeiD5VPjePSjctX
         Vhy0wlG0gKqkONahGEgDG2vNi1rjWvG8HMnM9iqYce+8RBuUT1BGyJFuRgezQJoPc9FX
         x3lHC3fNx8CLJ72K3PmD0iDuYMIeBLPTubXGx6eKBtBaX4gGiTF3xk4OyO4wNNDRwBvZ
         RAxr497PekE7p405osCS6kNA03EIyFVt8r3vzNKVz2NwniuxGw4/hrXReYz9fQvhRx2E
         mdQzgbYiPifM3DXO7X0yPHpGQsKitMencmOz9xvGmf9JSS5E5Ep24Uc6yo7spDZnMOVZ
         nBCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750931969; x=1751536769;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=579Q1QhHC2sKl8ad1uJdu4XVU+r2uSj185NnGxhlUu0=;
        b=iI1rmQ5bkiHso+9/XUluVc7k2dNA1q/ES33UlTSu5v2cPU+GKRLbPnmsdl+FOYXvWx
         iHHSQFAhOw//VFfi8thOu8QWI4MUSyRa5rIZKiR1YB5D3VAXfsgYbeRmlNGMeLjg4ur4
         35w4zQJ4NuQSzTGLjfY3vFLwoAmjRue6FEfrVOHYALTIOuGiRZHQQWKH0VhR9HvZGqho
         qfYILn8u42AsFVfc+DkV3vETfLNY3dpef3b5/89PSWD7XIcYeQ7Bc7/hWmgWzyaJgiIh
         YkudqD/IV3x+x6k4OTCKcy3NgGOFL2dF6umN9WkZB0glwHx6RhpmKDf5zfQLZiHqcU+d
         3tpQ==
X-Forwarded-Encrypted: i=1; AJvYcCWBtaQI8UBC4mGH6cwbeyk+71KDIWnszkhtATzbxBYUMzcAaQSmTe20Zvw+dnpUKU5dZCuZoFLvPe1RHQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyUqJX29zSMmaP5ZfoMOGKO/1Pdks1SatVyao5SRUmSUiplFi8z
	bPQju4xpWEiwR4ry4Vi2NVB113Y9w5XvwBXQjYiUMmtHSa8CmDJtA69N
X-Gm-Gg: ASbGncuT1yInAIH15+EadG3Qw3S5Ugh00tM/NDHipipTMuNghDYjzVOZqEZMglQNm5y
	s6IViA7bh4SHV1JBSDTbftTmVuaAYeTRONe0m2q6l/9vv9vce3PzxkObIU0mcvSPW8PmqBvlWp2
	deY1QJpAEOMNpctR0/3O7fTyCN4NJ15mvoPMGt1U3HAAuVqTSyLyfmJsB5j7Sgp0gzf+29eEJeY
	EjFN/l9bdHvk+K0mjD0516zXKKWvtpN7rymUiw9MXjYP6orfoDKAVLWLV1/IzouFsfAc6Zv2JYP
	2m+bNTNNYhAZdfgJG79vzGKKNJPwvFPZdzMudYKftGcBcuZiZ/+ym7YZ7AFmURxvfNxbl9C6o2P
	XQoWZLG48h8t6Jw==
X-Google-Smtp-Source: AGHT+IGVv+Hw7jSjoixa1/E7zQmSwh1p6WVQXmOD2Loe5VSlhlnuizOR3ugGTm+11YiJ3z+bTMozvg==
X-Received: by 2002:a17:906:d553:b0:ae0:c4e3:e2e8 with SMTP id a640c23a62f3a-ae0d26f80f4mr322465866b.28.1750931968753;
        Thu, 26 Jun 2025 02:59:28 -0700 (PDT)
Received: from localhost.localdomain ([2a02:2f0e:c51b:8900:a03f:12cb:72f7:9069])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae06aa5ff34sm1014106166b.40.2025.06.26.02.59.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 02:59:28 -0700 (PDT)
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
Subject: [PATCH v2 09/10] crypto: sun8i-ce - add a new function for dumping task descriptors
Date: Thu, 26 Jun 2025 12:58:12 +0300
Message-ID: <20250626095813.83963-10-ovidiu.panait.oss@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250626095813.83963-1-ovidiu.panait.oss@gmail.com>
References: <20250626095813.83963-1-ovidiu.panait.oss@gmail.com>
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
index 930a6579d853..b6cfc6758a5a 100644
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
2.49.0

