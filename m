Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D17514EC40
	for <linux-sunxi@lists.linux.dev>; Wed,  5 Jun 2024 18:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717610576; cv=none; b=YEoaIBsk2/sqhfzRGYwx1Pvj2d1wNAoj+TPS1mbsP3NLhqOxW5ELu1Zkf9EhETgw2kmuyglRb6HN1PDhT/UVACLrNo9ZdfSZbcvEILP+w2fmBEGs+MNTmKnLmNWMimEmQOTY+4OWTBjHH2aBI/a9n87U3sDbp4IJ4cIFz1IczYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717610576; c=relaxed/simple;
	bh=3NTGVyytdVyzcHP8txKlFB9YPPGxIJEVxCzu2cUQr1M=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Dag2uR8H+wdjd0vwMIkPD0rqYnhw+abwUeh1s+0/uFnnyIYN6cd/n36NLEJxI812JobDJodPJZETsdPCxd6AB7kfYAmKA2DZCSx0EytbvrZM1jocAO5uyWZ9yl9xN03CYrmNaOmkJKYMJfcDv8017y2h7RrklKPyW5W+hKLT1vM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--joychakr.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XPvNKDl0; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--joychakr.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XPvNKDl0"
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-627eb3fb46cso320847b3.2
        for <linux-sunxi@lists.linux.dev>; Wed, 05 Jun 2024 11:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717610573; x=1718215373; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=qDI8h7ZoQYy75CqD6I2McYIto2hpIA5emU6fq1I3LPI=;
        b=XPvNKDl0wpIZcbC3m1xCsH1bUQ4fdImvY3au6wOJ892aQEL1P3ZTjPAA9vLMtwl7To
         Ex0pt6+9vLeTYxqrkVTI7VIYTS5ZXUgRLQHSIyffR5ckQQtzNGzWYfPzQfdJckGuEy8I
         ZnLk4DfDltR9MaxxGpHFQxsK2opH7FX7Vzhf0UOykprsLgy8KE7BGVMq1LsPDOQ+JYlr
         B2kEXnvPIrCAAWAyUx19hQe7ymAyvTk+K62Vw531lIvCFdHFjPUknymwKild6qL2T25P
         b0OysD9DvnjQg1vccanQMHHPvSJUJVaGeNYkVeFAG0juKfAX9E5NAqqf9C6DKL5k62cf
         m7oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717610573; x=1718215373;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qDI8h7ZoQYy75CqD6I2McYIto2hpIA5emU6fq1I3LPI=;
        b=MPKb//Kmehi0UxybeXKpQlvZ3ea0fz2vRNEtSCmKbivFSGiqfPA43GGEK9xhkzmDL1
         GS+VAM8CZ3tG5tvardkS1YmKOcCKAPf/4rysPmVRw79TNfOCjrITIKp4pDvBDpG4gRU6
         R7NP+boIkue/2gOasTMwXMsg9Xadn1qGVnxS/b/RKufmHtx+XtuJW4C5NJe6NOQy+Z9u
         /tgqWlru1XyJbEdZv8KEm3yFpe3CcQYBl1VGYiTk+k+xEYHFeO+nzM/qKdA6eHnvS53g
         iQGXIssSd9fX22PAv05PVW0TgKmtubLUsfb88CZqN8yGVe6CBjsIUOR45QF/EYm906dH
         cW+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXdtX34mCWQaPss8Tmd/qNZTSCWQdwEtDuddwWz8CE7E/ryS+CQFlNY8GrMXGYKhDQRR4X66dMWSd5e5PuYi0cB56yST8mS4nkW/pE=
X-Gm-Message-State: AOJu0Yw3epOziKvbVqrlCmdpyacdP65nFDb6rG5JguDbeM+1hTNkl8qx
	/gY8jgX+leqt57sTK0PIZvhQNsVnONyQPCGP2jKvlHv6vEDrgHR4mUrDjsviAVkux2iy8UyDsiQ
	ldSeuGZMvwg==
X-Google-Smtp-Source: AGHT+IHsHtY+bAgPNOkcmVi64EeRKQimO371NMHALyHppPPqEXYX97pSerbED4x3JFp6tor3148MLJe9OAqS8w==
X-Received: from joychakr.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:6ea])
 (user=joychakr job=sendgmr) by 2002:a05:690c:39c:b0:627:96bd:b2b with SMTP id
 00721157ae682-62cbb596fc6mr8780427b3.6.1717610573043; Wed, 05 Jun 2024
 11:02:53 -0700 (PDT)
Date: Wed,  5 Jun 2024 18:02:33 +0000
In-Reply-To: <20240605180238.2617808-1-joychakr@google.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240605180238.2617808-1-joychakr@google.com>
X-Mailer: git-send-email 2.45.1.467.gbab1589fc0-goog
Message-ID: <20240605180238.2617808-3-joychakr@google.com>
Subject: [PATCH v1 12/17] soc: atmel: sfr: Change nvmem reg_read/write return type
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
 drivers/soc/atmel/sfr.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/atmel/sfr.c b/drivers/soc/atmel/sfr.c
index cc94ca1b494c..c1c8e59cf6fc 100644
--- a/drivers/soc/atmel/sfr.c
+++ b/drivers/soc/atmel/sfr.c
@@ -20,13 +20,16 @@ struct atmel_sfr_priv {
 	struct regmap			*regmap;
 };
 
-static int atmel_sfr_read(void *context, unsigned int offset,
-			  void *buf, size_t bytes)
+static ssize_t atmel_sfr_read(void *context, unsigned int offset,
+			      void *buf, size_t bytes)
 {
 	struct atmel_sfr_priv *priv = context;
+	int ret;
+
+	ret = regmap_bulk_read(priv->regmap, SFR_SN0 + offset,
+			       buf, bytes / 4);
 
-	return regmap_bulk_read(priv->regmap, SFR_SN0 + offset,
-				buf, bytes / 4);
+	return ret < 0 ? ret : bytes;
 }
 
 static struct nvmem_config atmel_sfr_nvmem_config = {
-- 
2.45.1.467.gbab1589fc0-goog

