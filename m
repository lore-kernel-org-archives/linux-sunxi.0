Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFB45254864
	for <linux-sunxi@lists.linux.dev>; Thu, 19 Jun 2025 12:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750335864; cv=none; b=pd6rHO7SRY5jTcD4nSDDMSnkfvpeCTBtyYDSelk/qqlWx7SmrSQjUSVixgWdsHNRHhdERPqLtoenjslEMHQwcy1TnNeBPTi0ArePyIUnc7hq6lCG65BsNkg25BoWUVKVqb/rsIb737tFqHfA/Cgkee4/gA7HQ9CNytuIMSOrHQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750335864; c=relaxed/simple;
	bh=dsS+p6UvQk8Xwg+WgyOGAas3d5MTBbJN2FAK8gI6CFU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZPG44GknfSAck2uKo2coyyN9b+ZN5DNHC9LKD0ARYuTX7YjGU95RLys0nSfSAKwaNop4/F6pkjl27QxFzVByPfU1RFRs8GIOcxlZMBCBZIG2G0alCSBW0oheGV2NfAu+BOzjqh+gU+f2PksvYGAvExnAguSXPlssWV6C3J/WDIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HNjgagv/; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HNjgagv/"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ad93ff9f714so135262066b.2
        for <linux-sunxi@lists.linux.dev>; Thu, 19 Jun 2025 05:24:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750335861; x=1750940661; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=579Q1QhHC2sKl8ad1uJdu4XVU+r2uSj185NnGxhlUu0=;
        b=HNjgagv/dr/iDH5FBCTbh/dP3nWqbx+gLC1SDTW8SadICGk411v5wiAoD+8e2ppkdK
         tEEoCFJR/F7XCKn8njTx4NjsWid7sKjOs7eQ5BAxsjrDMm2EHJewr8FkRnc0TQ3F0Eeg
         PebAldTxQpjSwrFyoZhP/8bveOdsnTwTExhMAEYayaZfBtjTnCtgARB/DcfrBkk+wZOK
         f3ZwTZwhk+a+/I1Z5jYy9rec5E6kC+pGkJ4QeJl09qL+3PtsFTc57kgLsSSuy8Y/akXg
         2pCLoKF+W2SKJ7e3XbrqFSbrjFY25iU21J/Y9n41Xv+Xe4yiYnqBlh7OP8hzO52EHCbx
         B+xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750335861; x=1750940661;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=579Q1QhHC2sKl8ad1uJdu4XVU+r2uSj185NnGxhlUu0=;
        b=w69sQdW7xiqCvDVgwzFFU4gZuvTe+u2OoO/zcmc1GSJgcp/Y3zFa+WnyTD7lJ1K+Hy
         QZk0Qhb1OE08m6hO65nZkh5dSS8hy8rKqF1sUk37ymjDYt8KM/D8nlcjIsizdOIfASaD
         ESwpVsfR9T+YVYT6u2y4DRX9zbPqrXyJXhZAPE00Ji7J6na2PxO/F4S1OAfNn5z0VaX3
         R8qYtnqIJlvSVGQ5J/TdfrxHYv6IoUhvkQbdLHKGMHhUaazCreoZBtaNz236nQ4GGIiH
         oqcqHlvMpnsZjR+tzhLPc8IN7UOlpSS1LLFyzTYaNvwrVT0kIhuJAq+ql/yodJyiCO+M
         SSgA==
X-Forwarded-Encrypted: i=1; AJvYcCU+ns1C38EEHvVryOvA9zbFkaRhphGW3gEHiMDFjWPEaLUIPQhmAd/V0GqKHmsJyQfMcjEom69J0abooA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzWxNWhWX3bOk+BAqFS08AC1B8dHmRvWQLSMwXSzZ4XCQmrptjj
	9zFCY5f0Omgjj9LZxAdGhnJZy34zhHSfq1IodXAjDz9H6oEnWqGggF9P
X-Gm-Gg: ASbGncsU8wc5xngy59+lEUyoRqFLAq1q8s24S5pEgHHCHVr22He8xK4hwBAA658Qcpd
	VhNUR2n3NtGb16KBhHjGvGH3QZJrjGmOBkeQuIqX6bAN3o3NUVHFsauO/vg3KPXBOB5EcAP6O67
	KK0tIXrZGh0/LumBIPQeKlWvzDQ8xVfNfwqFlavUnAvARtIYanw0fhgvCpQ1lAaVid1Q8vTg5+G
	zCti01QJAfvtPmm5aLe+M9b56WJbwNJxzXxJju3SQiknHKhjP0Vhryg2HKsjQQLzJ2fCxHtjaSc
	31YjyzVgFl5d5z2IxJr0NwH7WhdLfI5NpfzCvBmfhfgCQNbJEFPRXzxM9G4kv9yQ1uz5aR44oqI
	Cojz7qNQB+Nh13g==
X-Google-Smtp-Source: AGHT+IHH6DFXlW3XSv30gN9W1MaxFbV4Xi7gLnQBbzesKqNPz0MrTZ8hdE2KCDgVxH4xeRlqT8acsw==
X-Received: by 2002:a17:907:9694:b0:ad5:4a43:5ae8 with SMTP id a640c23a62f3a-adfad31cd15mr2245682266b.12.1750335860965;
        Thu, 19 Jun 2025 05:24:20 -0700 (PDT)
Received: from localhost.localdomain ([2a02:2f0e:c51b:8900:a03f:12cb:72f7:9069])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae000b02bd3sm504688066b.3.2025.06.19.05.24.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 05:24:20 -0700 (PDT)
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
Subject: [PATCH 09/10] crypto: sun8i-ce - add a new function for dumping task descriptors
Date: Thu, 19 Jun 2025 15:23:15 +0300
Message-ID: <20250619122316.2587236-10-ovidiu.panait.oss@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250619122316.2587236-1-ovidiu.panait.oss@gmail.com>
References: <20250619122316.2587236-1-ovidiu.panait.oss@gmail.com>
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

