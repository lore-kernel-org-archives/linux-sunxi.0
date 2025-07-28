Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 048672248BF
	for <linux-sunxi@lists.linux.dev>; Mon, 28 Jul 2025 06:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753682884; cv=none; b=LLjLYX4TwwdDw4HUiE/emskmN6ORLYenJmpADhsoJKXAgsJSq0eeoLhWEAhxRRkcMg0PJq8Cfxuw3rPW+REikqI1yxe5hHD8nq6xBp8gKA4fwQdrHl1UKuCMIBF9jZNe3oMNjIgbWTz+ILwEuvjxAjAM5uLUi0sCTf+A11P+aoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753682884; c=relaxed/simple;
	bh=b3yfadSxlQTuuUjecZzGWQXT1ppEt7Mr1bmdx41N2Jk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=slzvNyfapd+XpZG5HiLIOeU1FZPWMRgknPYx6Wd2V3oQh7FkLcsjC2sCctIFZfptm8mX0vAZzPI9YDLJwmY+rQXWB9IKcmXFNA8OL9bo+f7xeLhkXOsgOZ3EgaNR7N7kt4gLVbwUKIJkjIVG78YTD+EVAnsso1MGNMMaSUGfgQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a+fsV4U9; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a+fsV4U9"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4561514c7f0so39360605e9.0
        for <linux-sunxi@lists.linux.dev>; Sun, 27 Jul 2025 23:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753682879; x=1754287679; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eJtO1nuKB/731gs+IWxyxQBo+tSaie/TO/30jHleAGw=;
        b=a+fsV4U94b0BF3FWYU6KBaBK9+wfXqAvQ8WrYyvuhI1mcQ3OVhoo/aMZt+1o9tcgxX
         iozHWNbLZQAhsnbKGwSRA5Yyn/t2Yo9SpKEAn5JZqUzC49Dr9C+qgTpwt+P9XEIy+3eo
         QirdCMI4IhzMeNkFXyHvLKshE1Xl0K8vSeqn3F3rIkMXCFSgI5btCV8ZDVE8iSE2NanA
         9/R40EloP/wO4EcsmqU3MmU9WC0/J/Cz25l6T9CwcmhYbLo0WGYGxzWQIaMxPTX9ppiD
         qsuog2KU3RslHDk+s60oBNYagF6Ze/Mig/HAn1m3+ChRHlCaYfMslIRhqAGo6h3mMDnM
         yW/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753682879; x=1754287679;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eJtO1nuKB/731gs+IWxyxQBo+tSaie/TO/30jHleAGw=;
        b=AnX+r2LMTo1DTkOWXeaD1rlxtT5g2V5B3BbNZ1t8vFmAMq2n7cQJmHq3WaA4lqxMQS
         //PlCgc1PsDv/xGuMZ3VxIv+T3WtmZe7OPAxDijdSr2vdL9B8PrfTX+UMlrEVZVQ+13K
         eLpQf/ciGIIoZWN87byny9b+eCXgYhIk1FeskjKsoXwaoaOEd9dlEMorNCip229ggBDk
         68hOhxigZfSd9lyeC/qZi9Ve6QxRKwWP8rRp9E+NgtwL7mWHnMxXZ+TASC2ut++Md4OC
         UtW5tnSgyPm7R10oytbCdVJjh0RwA1pPK8lk+EfQ1r/HVeBXLTvfEEzC6a2FK5BNSAZv
         RtcQ==
X-Forwarded-Encrypted: i=1; AJvYcCXNocIJYmbQPP3BKL+31GTEYROOX67XusfRV3hBlU45jqWwLacM42iTJvtGy+IPk2bUaChyB2+Qtj3xvA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxbB4d1XoNOaUQjoRhqKdxcgwNPp2aWS3SUH3xEwMnkfDt4C+cW
	Di9GX+4+CRVQFNWFj6nf6dm0VEbqZfwFmfQqOSz8J1cJTwHhgjxD4WCR
X-Gm-Gg: ASbGncsudBs/SDrh07q05y9FuydkvwHNrH5Pa/lSsT66PGVjpvkg1bcpYkD1ez4qT3m
	mr+4gIWfHFS2XxFPWI4o2EvNiF1t6FPyBMsPsXhZ472cnBoxTf2CAEZQzJWwOMTcfBXtxbW0xUn
	ATXqQhaa2NNGqzL83xxjgYDCYokwzWX2Pb6U3/6mMpYLIRefZ5Mucz8oIfWpqA8mJF5GYxQ4rdu
	OgHnOLe0s+wTqxGRdcGVm0M9E92VIymFoVjZExEGL/1KZBnPdYThviMU1Po8Qj7ijQNq5t1ocBx
	gbvabFlC55CKvCIaQbqgp+Cmo7fHm9keyNJOhF5H4PsmqYAR9/PrDw8BpsgBKdjI7ULapH6knf6
	GozIJo7ax/vi4lBRyUuV/NTQBI5KzYy27zU3tU+M19ynn
X-Google-Smtp-Source: AGHT+IHcuqZDSycBlmjS65wGUlNSERplHlPi6V2vucApJV8xzGnmPFaJnpc/De5ZHaB9MzmHrkvGag==
X-Received: by 2002:a05:600c:4590:b0:43c:f8fe:dd82 with SMTP id 5b1f17b1804b1-4587643ec92mr86897145e9.18.1753682879129;
        Sun, 27 Jul 2025 23:07:59 -0700 (PDT)
Received: from ws-linux01 ([2a02:2f0e:ca0d:f700:1210:b727:adc8:716])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4587abe6ba0sm86195215e9.9.2025.07.27.23.07.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jul 2025 23:07:58 -0700 (PDT)
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
Subject: [PATCH 4/9] crypto: sun8i-ce - add a new function for dumping task descriptors
Date: Mon, 28 Jul 2025 09:06:56 +0300
Message-ID: <20250728060701.1787607-5-ovidiu.panait.oss@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250728060701.1787607-1-ovidiu.panait.oss@gmail.com>
References: <20250728060701.1787607-1-ovidiu.panait.oss@gmail.com>
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
index 326d9c988bb1..d94304a439d3 100644
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

