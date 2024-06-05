Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 638E01527BC
	for <linux-sunxi@lists.linux.dev>; Wed,  5 Jun 2024 18:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717610593; cv=none; b=NLNsUJvurQc47RRQRQH502BBxGzIK5FJ734VUejdKPjnrSlL0tNucHPCoPP+XVsynQuzNmt3q82/lHQZOlS7bTofTYkor/icVy5fGwqYeCeo5zTAgw0G253eoQiTHDt9SuVTE/5bETARFyArM7CJg69m+idPNhf/bFcxRVmzYOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717610593; c=relaxed/simple;
	bh=e26lRTuAGuJgmNX9Kn+IMmOklmBtw9bMfbnFAWkr9AI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=nel2HyZryX2pW7XoUAmJEtGeQjaH4qLzlcrPBs+6N1OY/64IAP04vV14/JMHv6Tz+esjDFHjAWZ5khRXsD0COSzW6OS7QQh9pYjAB3mqHo3DnHh5c4oSberHjC8qGDQtc1YrCekHQ2ku/fepa1m6lUJE9qeGBZ6fggLdSi4b/K4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--joychakr.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=N2QvE7z2; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--joychakr.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="N2QvE7z2"
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-dfab38b7f6bso197000276.0
        for <linux-sunxi@lists.linux.dev>; Wed, 05 Jun 2024 11:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717610590; x=1718215390; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=LqJdwI0kfu08l8zta4NZb2Dhq8rse0Xjye+A2f9mH7A=;
        b=N2QvE7z2UyPrlSnpasID9XRItOXYr+tn94bw3NryJGY4VPSXLKlZ7Clucm1FhVAgOz
         Ps7GYvmppJ/IGJGL69LnFLcXkfMAytRv6opQELZEapWjbIElFnyRqxpIkNodXhX/olyz
         UG9ncT5wLLmrhzWdZ0WLTnXGTzl1LqBoXGEM6WCvkupNTOfiaVpWfkhyzLcUR9BY4TK7
         qfwz9XoRVhl7Mq6ynTDxANvMyIL+LXNiFzYN3wZrNctxT8WZ62P3F0POkvtVVwJ/icta
         ADDlVtKRSI+ncPiIsrVdnDL+Knrpav70Ib6pEt4geZgnIL86viCZdGhaxxSNZcMILLJl
         WypQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717610590; x=1718215390;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LqJdwI0kfu08l8zta4NZb2Dhq8rse0Xjye+A2f9mH7A=;
        b=ggbnVPcBDMaFsewplBe2P1GvB8URTtzCIHrDAVhZUyCOcJDYmsSAQsl5usjdDqR4kW
         8zEpDqmYRNDf0MNB0HViVOoss/Z9HMG3sIvuYfelmVOux/dztMXFsUxVCok+7EMO8jQ/
         kLz/lBVXGPzEIXa9XuaG6g8r0g1vZw6woJM11WEANxYeTF5oZGXqwOFFg1IdhbcHmmM8
         jP5cvXuDDRZN+DZHNmVgIHg5U8FBJakXreSx8fKkhz6YiBVOGVQ/ZINioovCfh7tJXBQ
         ObAow8MzttTqpWBffhGRDENHkGx7PoJuE8O7z8k+ECMu9ZcSG65YZF24SCz8HK2NB5bE
         ZUrQ==
X-Forwarded-Encrypted: i=1; AJvYcCVihx5EerS36uVmJ6ZJymaV10mAD0/fX/FH6Z875Ni0+GEfrdmI5aQmrMaUM5WTGj57bj+76FrAO5BDEbqN+jZV4HHLbhI9u6C18Sk=
X-Gm-Message-State: AOJu0YxLuztcdxXePycDFgmVA5dH8jphq57eewrpxbkhH9471cnupMFi
	OT1vZSWqxYMPVnBdjuB7HB8dMkFDyei5QB0lyxukBjB50oiksi+pnV4hbm0ZNmNoXb6YU+ybaE+
	5fiDcLmSy5w==
X-Google-Smtp-Source: AGHT+IFarMTHRQyaGAXOhvjvZC3Ev9S2zTS3Kvs5hpqZrMnxro2/BzrazXCSnRirdCi4qPaGa/c0QONTMKwCWA==
X-Received: from joychakr.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:6ea])
 (user=joychakr job=sendgmr) by 2002:a25:d608:0:b0:df7:d31b:7a29 with SMTP id
 3f1490d57ef6-dfacad1dc1amr763889276.12.1717610590398; Wed, 05 Jun 2024
 11:03:10 -0700 (PDT)
Date: Wed,  5 Jun 2024 18:02:37 +0000
In-Reply-To: <20240605180238.2617808-1-joychakr@google.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240605180238.2617808-1-joychakr@google.com>
X-Mailer: git-send-email 2.45.1.467.gbab1589fc0-goog
Message-ID: <20240605180238.2617808-7-joychakr@google.com>
Subject: [PATCH v1 16/17] soc: tegra: fuse: Change nvmem reg_read/write return type
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
 drivers/soc/tegra/fuse/fuse-tegra.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/tegra/fuse/fuse-tegra.c b/drivers/soc/tegra/fuse/fuse-tegra.c
index b6bfd6729df3..1b067dd8a585 100644
--- a/drivers/soc/tegra/fuse/fuse-tegra.c
+++ b/drivers/soc/tegra/fuse/fuse-tegra.c
@@ -96,8 +96,8 @@ static const struct of_device_id tegra_fuse_match[] = {
 	{ /* sentinel */ }
 };
 
-static int tegra_fuse_read(void *priv, unsigned int offset, void *value,
-			   size_t bytes)
+static ssize_t tegra_fuse_read(void *priv, unsigned int offset, void *value,
+			       size_t bytes)
 {
 	unsigned int count = bytes / 4, i;
 	struct tegra_fuse *fuse = priv;
@@ -106,7 +106,7 @@ static int tegra_fuse_read(void *priv, unsigned int offset, void *value,
 	for (i = 0; i < count; i++)
 		buffer[i] = fuse->read(fuse, offset + i * 4);
 
-	return 0;
+	return bytes;
 }
 
 static void tegra_fuse_restore(void *base)
-- 
2.45.1.467.gbab1589fc0-goog

