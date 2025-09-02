Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA9243090C6
	for <linux-sunxi@lists.linux.dev>; Tue,  2 Sep 2025 13:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756819384; cv=none; b=kMT5vi4o1/2tlCyFxiMGq4QB4B8UplHZ/g1eYMp/dffOVVCHqdtDFD+HB3mzILMzhiCyWEdK+rABd1mopWFOhJFq8/AyIhHmyfxcYgFoU9tQbno+21NmKoRhwGArgnEcaxH5VTcg0K6V3jSN9wq17pB/Sfp7HK25a61/gHmlN20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756819384; c=relaxed/simple;
	bh=NuYFEKMaNu1hQjN2Md5xNm1r7h0CNUWlhKkPh3zc5MU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GSxKG7FXTnlNRDcoSggs5W/52ug1vJpvSpJXidDu6w2NvD2bnzimidROeyAAG46e90lLGA784kGWdUJRn4EXkgSYOUZN63BSWhT06JvMM9WaBxdwwGerICLRTBdLtIy2yj0ICGXRSTjwYWJZ6npaCS9JuXbpEXFMVJkQply3lYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XGdTUGwj; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XGdTUGwj"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-45b86157e18so16878475e9.0
        for <linux-sunxi@lists.linux.dev>; Tue, 02 Sep 2025 06:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756819380; x=1757424180; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qolo47kLruRZDje5v7puvJiYv8DgcRb8St2Hs5XCLlg=;
        b=XGdTUGwjcJZN6vXaehhT98XZmZFP8mFN9OzMvme2KxU1gkarf5e5y0dJbi+xBlmgL/
         u/Re+MiXGu+5RT0VLzmP+cBxeyLBO2BCF+ZsgY4nHG069JJd/hs/I5bJj6eCafkl0YN+
         K0XFTavJX99/b/XmU2QLYQzR7W4vHtLirqiGJhgWlLAmAZZWSqADISHH5ngUkS5jwYxz
         ytdQ7MHHepTiYP9c6M5IXttNisx2Hz0K8cYpbgySRFxfKg0OnSesZ2JORC3DGmtE90dv
         bW9BnTmEnrN0ao1thDOS3ArqGJFSEY15aX+ChRNNU2qihBILB1q9p3pAIpfakJMe6iAJ
         opZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756819380; x=1757424180;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qolo47kLruRZDje5v7puvJiYv8DgcRb8St2Hs5XCLlg=;
        b=Y4MjEbJQuMf+O6lJL+pIusb8K6BkWAA7lIzg431xdOQbsukVcDnn+boed03zstzrsR
         KAFRPoqC4IDbNI3d3DulFUoU/yAJxT6Xb5UgCT2W8MzBEPez5INjk1XPJLnL7XKVGX7v
         aGYp4cteAuJgG3GNGYW+Ph5LhseN2oQDolzWfjDhRGP1EtJqR1FIylOUJUTP/VFenoFn
         XNbFtgSRjI7Ynu3qsGxHlOAT56aPQT7h70y6yScf1G5ylr5JwyRCEiNNinemx9jOA/R1
         YXkq5pQ9u+Fl/28+MYJOl67ibKjNeUobVp4ltlZtrRmiEHc0R87UAOwdWP6Xo3vqpemG
         sOXg==
X-Forwarded-Encrypted: i=1; AJvYcCXLhSFK59myzzossdnwkpqf1FGe6FpGu+sA/6qDPLOEpn9Q/17iCcrwsCTSdTftXXYVWR8VAgCNZq5GkQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxkaWmbriU+oBGVq5p2PtIqqwAHa5DA1VkMVGLqiHasinNjJwsI
	kVGlMDBOFre+OYJdP9V9E01H7rrQG5OEIFVSyQm2UvGZKqtojr/z6e51
X-Gm-Gg: ASbGncsxfMfE/n23p/OZFhaZu7zzfwCUJ+lDwugYZE/PBC1qOD3fuzZd38ElGFLAYfN
	LduYOmpgz8kYkGe8QfT5KZPVpoDUiURW/O9Vzzca/CiCX+aGK9EIyg6mwby4Ox2gxapSurqtedF
	+hQUZcy7uaLmg/AsU8Z1FvBdZZRquX5SzOS585sePdAyEgoBoopiS+f7RqZiNuj1WSZxRIvVykz
	6l39AfXUVaYaK40ZTIQdt+KGm7S5wkz3uTIskfdJcx9vnM2b8F5zVrbzJLza2awfDn3CumR8WiA
	uxvoKJSYxvB6NuSKEwxZypxXH60Km0YMNLOGl9icFE8SoI9iC6vaNh+3c1xJsnjQkFUYRzc4PAq
	/Ad2Z+ZNM9OIsyH9uRfjMUQAPInikhHFxXWqS+2U5u0Dx
X-Google-Smtp-Source: AGHT+IFVMpRzBsmi4JxaTIrSD5qdn6LF3a/HZb80zXbTgRnBpIOBBAGYwh5jd/sYemoWSplteKfu3A==
X-Received: by 2002:a05:600c:3b28:b0:456:201a:99f with SMTP id 5b1f17b1804b1-45b8730d443mr85114285e9.18.1756819380078;
        Tue, 02 Sep 2025 06:23:00 -0700 (PDT)
Received: from ws-linux01 ([2a02:2f0e:c207:b600:978:f6fa:583e:b091])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b945332adsm44452155e9.4.2025.09.02.06.22.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 06:22:59 -0700 (PDT)
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
Subject: [PATCH v3 4/9] crypto: sun8i-ce - add a new function for dumping task descriptors
Date: Tue,  2 Sep 2025 16:21:29 +0300
Message-ID: <20250902132134.3287515-5-ovidiu.panait.oss@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250902132134.3287515-1-ovidiu.panait.oss@gmail.com>
References: <20250902132134.3287515-1-ovidiu.panait.oss@gmail.com>
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

