Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2F621527BF
	for <linux-sunxi@lists.linux.dev>; Wed,  5 Jun 2024 18:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717610589; cv=none; b=q5nZ/pOhHBDX8rJXTxac0m3X14v32T3TdRZmIafLD0CAVpXnlKRJz++9jgrexi+1lmFFIM49Ecbnma6BOoSp+qmRTwSYh12VspoR5FWdDEY+cX5ZXcoqsQlIBDbt43iZfGSfMblDFoAArbN+Zth/Y8BRofBrPZPnpXXnjrPrfV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717610589; c=relaxed/simple;
	bh=fQnAA6GcMGARJcapq8jrHjYduUARBDKjz1Q8WK0DSoQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=uvkVaEKwqIMCHJ567tmv69Smqom9amqEPcULM8nd6sPfzd6hs4Yn/XxBYo//jnH/i0mle5+WyM8iP7uSb2sj2q+ZIJSc9/ZGPCkAskImfop1YlLPY22UqprXM8Z+Ia8eFuG6XCWJzQZBDngnhKV6DB8uTApZzLBTk/C6XlTmNro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--joychakr.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iiIAdyAC; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--joychakr.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iiIAdyAC"
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-629638f1cb0so241287b3.3
        for <linux-sunxi@lists.linux.dev>; Wed, 05 Jun 2024 11:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717610586; x=1718215386; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=7kj3F75/M4iGlFf64jdDqM9oitcQAChmy+MmDZHUpac=;
        b=iiIAdyACVRDS59pe6o1uH717ehAP8vHtdWewPXmh1otYkxyLlfQE+VxVDbMPrvhdCb
         ahPqtP22jd33+EuRmU6GabSY/PYMjm6cnYmIEQmqxUukwvzYzRdZaQRO0BNH7shtp65E
         wKJ3huyjE13275PrrqoMd1uUtH2E74U8i6KHgePugwAeNo5aojZJ+4ewAS4n0wzw6PW5
         E23glZ1HwSTnrNfh/x5xh9fSyWuVNlkZJdf6xwZAu1Im2I+qBExTR9WVL8vEQlh6oeuC
         tA56oXYy1cH92z9Fu8lBAxbIUKPPLt62oax5N7AGKuxuaNl2gMno/sxlXB4va/SoMxrC
         GC3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717610586; x=1718215386;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7kj3F75/M4iGlFf64jdDqM9oitcQAChmy+MmDZHUpac=;
        b=J0W5yWQS9o4do0/i/lQ4Yeb7K6jnKk//0IHgD8QadV78j52UFYoL+FNnUPGVuBtfsa
         yCH3PxeckkfYv+rX9j3hWtgkMfKWQZW9d3flHuxZ6wTg2bFtm33s9rCYni41v2Dp1YED
         mI4Nfih4lhSXGj1VOHrxGscV6QHRuvTVZtcvYcHWZBTCfgG9Kvu+hYOI1TJ5g9L2Gy3J
         9a/sq8Jn3hQugtNigbML8Z+Xd7/vq1l3bgmvpsN9yJ40YW6U8ptaE2TME7gjTJT+xStt
         aRMwByDjrU2SIwxu/BM8IEx3zsgsPM0Hp1u9d1jaqw3uzRuKSSjSU2h+q6z5idV/bxIg
         teMg==
X-Forwarded-Encrypted: i=1; AJvYcCX5P+KWSb42Wh0N4aUodCIN491jKAIPT1zsH334Comz4THSdPjc0D/vPa1cb6e/8OX0SYCrh2NNXJi4C/SftDt8m0w8eFNIrI8wESc=
X-Gm-Message-State: AOJu0YwCkCj5GST0EUNifrWhTFabjh8BWk6Ps34LOxj80adi3CnepWLp
	jbUC9z6DDQPK+gpUphfXeSCsG6wbhwymfOI/xtQvxntWQw0UJnHRAq3h2IUmLoSntvQ2yEgILq5
	pTMmqod2Nlg==
X-Google-Smtp-Source: AGHT+IG6CBdANF91FP38CmQTKr/LfgQsOsOD0b5R4Rhez9xhC1dP1JVIrpq0leEJ+8nApvlRDSurrJhIyku1Vw==
X-Received: from joychakr.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:6ea])
 (user=joychakr job=sendgmr) by 2002:a05:690c:c93:b0:61b:ec24:a014 with SMTP
 id 00721157ae682-62cbb309e5bmr5896267b3.0.1717610585878; Wed, 05 Jun 2024
 11:03:05 -0700 (PDT)
Date: Wed,  5 Jun 2024 18:02:36 +0000
In-Reply-To: <20240605180238.2617808-1-joychakr@google.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240605180238.2617808-1-joychakr@google.com>
X-Mailer: git-send-email 2.45.1.467.gbab1589fc0-goog
Message-ID: <20240605180238.2617808-6-joychakr@google.com>
Subject: [PATCH v1 15/17] thunderbolt: retimer: Change nvmem reg_read/write
 return type
From: Joy Chakraborty <joychakr@google.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Lars-Peter Clausen <lars@metafoo.de>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Bingbu Cao <bingbu.cao@intel.com>, Zhihao Cheng <chengzhihao1@huawei.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-mtd@lists.infradead.org, linux-rtc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
	linux-usb@vger.kernel.org, manugautam@google.com, 
	Joy Chakraborty <joychakr@google.com>
Content-Type: text/plain; charset="UTF-8"

Change nvmem read/write function definition return type to ssize_t.

Signed-off-by: Joy Chakraborty <joychakr@google.com>
---
 drivers/thunderbolt/retimer.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/thunderbolt/retimer.c b/drivers/thunderbolt/retimer.c
index 6eaaa5074ce8..fa52ea11ec28 100644
--- a/drivers/thunderbolt/retimer.c
+++ b/drivers/thunderbolt/retimer.c
@@ -32,7 +32,7 @@ int tb_retimer_nvm_read(struct tb_retimer *rt, unsigned int address, void *buf,
 	return usb4_port_retimer_nvm_read(rt->port, rt->index, address, buf, size);
 }
 
-static int nvm_read(void *priv, unsigned int offset, void *val, size_t bytes)
+static ssize_t nvm_read(void *priv, unsigned int offset, void *val, size_t bytes)
 {
 	struct tb_nvm *nvm = priv;
 	struct tb_retimer *rt = tb_to_retimer(nvm->dev);
@@ -52,10 +52,10 @@ static int nvm_read(void *priv, unsigned int offset, void *val, size_t bytes)
 	pm_runtime_mark_last_busy(&rt->dev);
 	pm_runtime_put_autosuspend(&rt->dev);
 
-	return ret;
+	return ret < 0 ? ret : bytes;
 }
 
-static int nvm_write(void *priv, unsigned int offset, void *val, size_t bytes)
+static ssize_t nvm_write(void *priv, unsigned int offset, void *val, size_t bytes)
 {
 	struct tb_nvm *nvm = priv;
 	struct tb_retimer *rt = tb_to_retimer(nvm->dev);
@@ -67,7 +67,7 @@ static int nvm_write(void *priv, unsigned int offset, void *val, size_t bytes)
 	ret = tb_nvm_write_buf(nvm, offset, val, bytes);
 	mutex_unlock(&rt->tb->lock);
 
-	return ret;
+	return ret < 0 ? ret : bytes;
 }
 
 static int tb_retimer_nvm_add(struct tb_retimer *rt)
-- 
2.45.1.467.gbab1589fc0-goog

