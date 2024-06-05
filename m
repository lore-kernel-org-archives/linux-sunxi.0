Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DA141514C3
	for <linux-sunxi@lists.linux.dev>; Wed,  5 Jun 2024 18:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717610584; cv=none; b=sNCZSEUMA7B5mUTL+UwFHTb4PdzTiAT7J9WOgxSa85zRS+FYLpif+n2m6qtqOUEgSh6RM6MMlR/M2ijldwjMzlTklNz3CutmlSmBtCVd+gQ9Z2qsznaUY/LeqzBrAj9vRlZRbkbnLwv6o+gTqKlxrNc/D5MqptU6NpdkcpP+9YY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717610584; c=relaxed/simple;
	bh=5F0WRZAIFyT/53498dR8Vin7Zzzm6LhYVaUBgnMWhtU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=BN93nv/rRIyhyceoz/nuFV5at2MXOSr/SktdA6+9lbJqGUmsykxNINbRZnJu5cNdwABTVKgfAxCo8QR9mNRZWVX2ukkzSAVWRswW/EoLmtK29bSWcuPadWU0adhPxK72aZRZv3xPWECxM1SuVturzYkjvIzrMPspWwOwcxidygY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--joychakr.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SIoz25Rg; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--joychakr.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SIoz25Rg"
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-df7721f2e70so1666662276.0
        for <linux-sunxi@lists.linux.dev>; Wed, 05 Jun 2024 11:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717610581; x=1718215381; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=xwrLVVIieFUQPopwc+1tOr/or/db/Iy6oXeR6vbSkEA=;
        b=SIoz25RgZlMTNNtIxhswilv137CDaJ9vDi5/MHeSUOezEUDnsoGiS50mGX+QdUv1i/
         JQS5s8MxZyNgsrovZVdkRgjozcc2fVAhpXQgW/PpDZve8GxPRCWjQI0gU7y0yNgt/a+4
         Yji97nCukX/vUfXCPekDPCTVxyC3uExWTsKaN8pmMGRtp5NbKT8DMbTvLOdfzuAyOTiB
         7uM4oVvW3X8y3/ejneOTEuQmFX65aGyN8N4cn5fKg+iOYJDiJJ3UOencJRn+iTsVYfpJ
         hwHoA0VqpUnLcdQjqtrqBbKB6Na/GrR8jZ8Q1Fvjv1ha8B/GJRZ02RW0VwGEewrAiFWh
         uMDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717610581; x=1718215381;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xwrLVVIieFUQPopwc+1tOr/or/db/Iy6oXeR6vbSkEA=;
        b=WvfU19NLHoZYCyVeDYXCxMXNrZc4q6V2cyQVdC06YDf2cdTFyKGThVE5VUrjtx4SLI
         KLmXtB+Br6MbgVWEqdKwqJ0Qr8mqnaPENPs89URxGDwmOD6FOt3QgM7fDm0yhmjSyj3E
         2dP4XbQqCoklGqgnFm6w7J2EiRAjH3G4SMcuGtuR8rYenGl+x1/DN4ZjCIsk08s1Hlf5
         54VXdcoT4mqWVv4G/U6tSHEMzlbnjkJqRlTU/9TAw1D5fN966hlpGhQ4lzNQktxGZmuq
         9Kh9jy6tu9ijNUQKpCl/J1gJeX+QfzcJcw2erjD1NeIVYmqj6PifvnHebnEdH5vxM7Xt
         Jt0g==
X-Forwarded-Encrypted: i=1; AJvYcCX/IHweD/YlIfpMxXV3JFLnXcukum7dwQUg78tp/aUDMzligOfg1LLQb4SkYkChPdrXk0GHoSicWBZ36ou0TAzX9IggSrY/vi65w6o=
X-Gm-Message-State: AOJu0YxJp9ItIVo/36a2YxquTHzEjx2752bCr4XbJTZKfme8B975TVXq
	Uu3Fe5+QT044oF4BmVZ5MHXX7in45VKBA/wztwr46kwdNe6oWI3KVcRVenSI1P5RfsdplEPH3uy
	nWbGMhZg8dw==
X-Google-Smtp-Source: AGHT+IE9F8AaFWy+zkoE1AAtvE0JQ7XHHDVuIM2gnYtU9d2txGGQvOGhBI3kC4/nhW85Sx5cKDFxLERd+BeUJQ==
X-Received: from joychakr.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:6ea])
 (user=joychakr job=sendgmr) by 2002:a05:6902:110c:b0:df7:9274:34e1 with SMTP
 id 3f1490d57ef6-dfadeb57766mr87616276.4.1717610581556; Wed, 05 Jun 2024
 11:03:01 -0700 (PDT)
Date: Wed,  5 Jun 2024 18:02:35 +0000
In-Reply-To: <20240605180238.2617808-1-joychakr@google.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240605180238.2617808-1-joychakr@google.com>
X-Mailer: git-send-email 2.45.1.467.gbab1589fc0-goog
Message-ID: <20240605180238.2617808-5-joychakr@google.com>
Subject: [PATCH v1 14/17] thunderbolt: switch: Change nvmem reg_read/write
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
 drivers/thunderbolt/switch.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index 326433df5880..35424a65cd3a 100644
--- a/drivers/thunderbolt/switch.c
+++ b/drivers/thunderbolt/switch.c
@@ -301,7 +301,7 @@ int tb_switch_nvm_read(struct tb_switch *sw, unsigned int address, void *buf,
 	return dma_port_flash_read(sw->dma_port, address, buf, size);
 }
 
-static int nvm_read(void *priv, unsigned int offset, void *val, size_t bytes)
+static ssize_t nvm_read(void *priv, unsigned int offset, void *val, size_t bytes)
 {
 	struct tb_nvm *nvm = priv;
 	struct tb_switch *sw = tb_to_switch(nvm->dev);
@@ -321,10 +321,10 @@ static int nvm_read(void *priv, unsigned int offset, void *val, size_t bytes)
 	pm_runtime_mark_last_busy(&sw->dev);
 	pm_runtime_put_autosuspend(&sw->dev);
 
-	return ret;
+	return ret < 0 ? ret : bytes;
 }
 
-static int nvm_write(void *priv, unsigned int offset, void *val, size_t bytes)
+static ssize_t nvm_write(void *priv, unsigned int offset, void *val, size_t bytes)
 {
 	struct tb_nvm *nvm = priv;
 	struct tb_switch *sw = tb_to_switch(nvm->dev);
@@ -342,7 +342,7 @@ static int nvm_write(void *priv, unsigned int offset, void *val, size_t bytes)
 	ret = tb_nvm_write_buf(nvm, offset, val, bytes);
 	mutex_unlock(&sw->tb->lock);
 
-	return ret;
+	return ret < 0 ? ret : bytes;
 }
 
 static int tb_switch_nvm_add(struct tb_switch *sw)
-- 
2.45.1.467.gbab1589fc0-goog

