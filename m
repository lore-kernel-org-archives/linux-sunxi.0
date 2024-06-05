Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAF65149C64
	for <linux-sunxi@lists.linux.dev>; Wed,  5 Jun 2024 18:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717610571; cv=none; b=fdxVXBt/6tuov3M+b8LkjDSaXNJ4NEMnDfQWbREGMVR3DagWiqf/IIajiEVbLQWcnr2vYAcLuK+pCmXY8EGseFe7vQiDs1MoOlc3PcHRJb/wSTX6DZvZkQ4OAO79q9aRsVUsHIs/01+zWTDmR6A7n1ereq3R3lBHC4gizK52nAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717610571; c=relaxed/simple;
	bh=L6k+G2m+3j3md7/zl4VB2q4oF1PIwiQxOqm6LYJmtKc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=gerZw+tV+pyDVUhP8FnahWSkndWs7h2ZL97XMSCoYTJ7w99MZ6ZPJXZRGneec6DsCSMchkJoDoy7mEGJMTx0sFnfsSqGusuBcWcoyjUzR3Fa3T9KmZbpOphKRhzHfC3S6cDPlE28lEGsfmt7WoM+7V8Gj1M6ShKjwcvokRp9OAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--joychakr.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Dh7qKnlO; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--joychakr.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Dh7qKnlO"
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-629f8a92145so631797b3.0
        for <linux-sunxi@lists.linux.dev>; Wed, 05 Jun 2024 11:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717610569; x=1718215369; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=IUTCTG4PiwJpsjy0QKETkEiNDEwH04EYXsIQhajeZMg=;
        b=Dh7qKnlO80Cq/bDEejBKbe6Xsd7a3qUvF858Xwci8ceijgNy7e2iAk0ZKtO5fCVrSv
         JajZIbo5mFbJoNIJ0n3SpdD7iOjJuM6qXsfK6jXfspxgbRcJa4LXj8eI+sy7pZxOfpav
         +kybY12NWlXPU1EdH8h4uIQrlKnUBC+mdzO06HasOO2qxTxMCdJa/Fmoeag+mxWQe4p6
         VG90KewoeF6W5iHH63/LroknMkDZtKzRRT7t+xRZIMJ5smOZ488W0Qcrsjv35PxG9IUa
         EaKJf9iZ2rTHPTagCov94Ezop1frwotQLjtBbQO0kx4wMNnesRAWfJg3Tno/H6yveNyE
         IXrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717610569; x=1718215369;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IUTCTG4PiwJpsjy0QKETkEiNDEwH04EYXsIQhajeZMg=;
        b=oq/przHvZej0u1e+on6IMIxlITeWSD9+L+7Seq64Zdd+eAjVJxsZB5cGyYshJC44Wz
         2eDIsUtVRmBy9b3ngY/WEaBpFC9foRWQE9eKbRnR3Y7L4ZzQtVMDwUWgGcIWh02/5uc0
         5PrUZqhM/liduIhL13ViCzRDGl4YIsQrnXRveb0yeWubDmRlbcG8dhZ9GKlFezGtBRCL
         ykMKTbA60uxhFV94gtHe2AuiJQfqSKEqE2v4Ql91f5e3JodxFBs537JDwCB9lDXuBQTR
         UlyP7NluSlvXYAII1S8CgJrcj99tWN2A9l2C3CN7iU3iydFEwTJfiF6Ltc7UIaMo7kFI
         jwhw==
X-Forwarded-Encrypted: i=1; AJvYcCViKo4WWRP50Vo8qJ6NaEk9nKkrMp8MdT/4sXXajMmGOtRqT4jF8hAnSgEutOscxcSuLPYlO/QrlxaYaWGjZ6mmAaUZakTTSnoyL50=
X-Gm-Message-State: AOJu0Yyn9cMQTsQcb0Sx7355e5sMPueRyPa3ZZx2Kf9cUAhLwi8NpIZz
	8ESvfeg9SIq+73UHg00Blf6aFb42UiYLngRfBcS3G7JKggvviBwLiumc4PH6FESNQ2I6lnnYCzp
	ZDrI5+WRmPQ==
X-Google-Smtp-Source: AGHT+IGRE1l9odt4GG6RaI8M/uHdLkQEjh5Taz0VKgQ269YOTeE9TiCNJPVhuqv1Ry405YEIQ6hIdx0yWPVe/Q==
X-Received: from joychakr.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:6ea])
 (user=joychakr job=sendgmr) by 2002:a81:4c07:0:b0:62a:415b:a137 with SMTP id
 00721157ae682-62cbb4a2295mr5047937b3.1.1717610568813; Wed, 05 Jun 2024
 11:02:48 -0700 (PDT)
Date: Wed,  5 Jun 2024 18:02:32 +0000
In-Reply-To: <20240605180238.2617808-1-joychakr@google.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240605180238.2617808-1-joychakr@google.com>
X-Mailer: git-send-email 2.45.1.467.gbab1589fc0-goog
Message-ID: <20240605180238.2617808-2-joychakr@google.com>
Subject: [PATCH v1 11/17] mtd: ubi: nvmem: Change nvmem reg_read/write return type
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
 drivers/mtd/ubi/nvmem.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/ubi/nvmem.c b/drivers/mtd/ubi/nvmem.c
index 8aeb9c428e51..eab14821343d 100644
--- a/drivers/mtd/ubi/nvmem.c
+++ b/drivers/mtd/ubi/nvmem.c
@@ -20,8 +20,8 @@ struct ubi_nvmem {
 	struct list_head list;
 };
 
-static int ubi_nvmem_reg_read(void *priv, unsigned int from,
-			      void *val, size_t bytes)
+static ssize_t ubi_nvmem_reg_read(void *priv, unsigned int from,
+				  void *val, size_t bytes)
 {
 	size_t to_read, bytes_left = bytes;
 	struct ubi_nvmem *unv = priv;
@@ -55,7 +55,7 @@ static int ubi_nvmem_reg_read(void *priv, unsigned int from,
 	if (err)
 		return err;
 
-	return bytes_left == 0 ? 0 : -EIO;
+	return bytes - bytes_left;
 }
 
 static int ubi_nvmem_add(struct ubi_volume_info *vi)
-- 
2.45.1.467.gbab1589fc0-goog

