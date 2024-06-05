Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9704A195979
	for <linux-sunxi@lists.linux.dev>; Wed,  5 Jun 2024 18:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717610429; cv=none; b=AlTu8XCMZJH7K/m/Y1c75Ne73NZPl5gxitcv3K9mxlFD1HxhRnzoYgLhjfHR/hdaJUZo9m/I2cmn5qo70WKLrDQukzprropv7CyF9P9tXE+NcRA0sIWAFsjg/GU55Zbh6dAUqQM3K0ri01WqsvGd7L8zF+WlokDrct722mIlQ4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717610429; c=relaxed/simple;
	bh=7s5ualCvDc0GEz4419Gj42eDU6iSkCy4DM1JO8Cp5kE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=jWCmCwUDkhczltxNvHBb2DeKZ/YdtWamGJitVPZyhWw0WTvOuQTsn1yuUKNzQmEJr1by9i6Op9sdXbu2pmkYe33D9gKUvlTqzkcK7GY53qMkummcp7qdIo5/YOkwl12wPFucPM5Pm9POI9O+8/X0HjShYoIzDXYNYiL8MXL8mhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--joychakr.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BMfUc5BS; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--joychakr.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BMfUc5BS"
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-62a089511f9so15304337b3.1
        for <linux-sunxi@lists.linux.dev>; Wed, 05 Jun 2024 11:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717610426; x=1718215226; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Kq8gN9PC4V0/WUeYJD+ngNL2/82oznUqnDRsVCEUyhc=;
        b=BMfUc5BS/7TmfBLcg7bH9IfYdiwv5evFcWZ7mRPAPwZGb60dEB/AYKyC2OZQXpgycV
         bD0+TIdXFTACVRLNwj9Iia5V6QjkzdZmpXbzrJRYTbColgHP9I7PZzqQ+vcmxK6q5j+a
         ztKCmTIZIqYVZuFLZZFa64agKQcpq/ZzWDkku16L9VIXyCDXWMmHuJm7pTqHc4Elt0Ze
         GRDstBFOwqvlm7FJpmsL+q2rBO7Sbaf4V6JMSs3sQXgJ3Cpuk6ud8jmdGRiJ8bIF7KGf
         +aQSpZf/0oB3FIens+U6khZ3c100pCpJmKfkJgOdxEgMZx81HmK8h4NbXLh+UZtoFgRp
         TriQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717610426; x=1718215226;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Kq8gN9PC4V0/WUeYJD+ngNL2/82oznUqnDRsVCEUyhc=;
        b=OZNnM4J0uk0ug1mEuk1ENnJu8Gl1UXVLE26qh2YaNOq0og9fAeJ696XRf8y2jzRhlN
         DS5WBAFb/XTSn21KLYacRzHKlKeCS9EV9QSMWFZwIuCJW9aBtEsf2n3MP3wZB5WHpYgd
         cGiSW7TGxQ2UFCds0IsVZYzX8GJHuifgtxV2Ogt2cIGYLMEJ9JL1IWtUWnrMwjNZ+V3f
         3e949jOkOwWV011kgkNHTbzD1MVy6X+fqDJTUdjcVMLzl6TQY+ClHSbhbL2IBMC5eWKq
         Vlsu8r2e+zDVqlAkizO/nG7ovH+76xY+tDRtTUZduPXegnV7K+LS1j3i8Z/7AcJZbTOz
         7Bsg==
X-Forwarded-Encrypted: i=1; AJvYcCWoiA9QMdUtwCWfrYY+s8pP+Qab9U0veL0mSNhMIjDCwkv6Rx0f5B5BD3pKt62K2UPEipkKAVfPVG7CnLU7sFFN9h0IRK7/TKrMSj4=
X-Gm-Message-State: AOJu0Yw62V3Vs7RStHrn/O+eiByLYCuEML9weq/Bgyn6LQRICELF0sjN
	hnC1rwCAAJOdMYbBHv8hX1r2whm7Fx+KeovhmJEpwOu2EUg5KL/u71rf3CmcA9DioA+vo5AMPhC
	YIw7f8ZAJLg==
X-Google-Smtp-Source: AGHT+IGpQQ4ibO82CB++j7EQg4rT4P/RHw0r35tzLXXxO3B/dL6yEQW14Z2L0s1fkq9sPWcVhlzFxs8YqockaA==
X-Received: from joychakr.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:6ea])
 (user=joychakr job=sendgmr) by 2002:a0d:d4ca:0:b0:623:be6:d5e4 with SMTP id
 00721157ae682-62cc71784bdmr605497b3.4.1717610426639; Wed, 05 Jun 2024
 11:00:26 -0700 (PDT)
Date: Wed,  5 Jun 2024 17:59:50 +0000
In-Reply-To: <20240605175953.2613260-1-joychakr@google.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240605175953.2613260-1-joychakr@google.com>
X-Mailer: git-send-email 2.45.1.467.gbab1589fc0-goog
Message-ID: <20240605175953.2613260-7-joychakr@google.com>
Subject: [PATCH v1 06/17] misc: eeprom: at24: Change nvmem reg_read/write
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
 drivers/misc/eeprom/at24.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/misc/eeprom/at24.c b/drivers/misc/eeprom/at24.c
index 4bd4f32bcdab..0e8d92d6ab1e 100644
--- a/drivers/misc/eeprom/at24.c
+++ b/drivers/misc/eeprom/at24.c
@@ -424,8 +424,9 @@ static ssize_t at24_regmap_write(struct at24_data *at24, const char *buf,
 	return -ETIMEDOUT;
 }
 
-static int at24_read(void *priv, unsigned int off, void *val, size_t count)
+static ssize_t at24_read(void *priv, unsigned int off, void *val, size_t count)
 {
+	size_t bytes_read = count;
 	struct at24_data *at24;
 	struct device *dev;
 	char *buf = val;
@@ -465,11 +466,12 @@ static int at24_read(void *priv, unsigned int off, void *val, size_t count)
 	if (unlikely(at24->read_post))
 		at24->read_post(off, buf, i);
 
-	return 0;
+	return bytes_read;
 }
 
-static int at24_write(void *priv, unsigned int off, void *val, size_t count)
+static ssize_t at24_write(void *priv, unsigned int off, void *val, size_t count)
 {
+	size_t bytes_written = count;
 	struct at24_data *at24;
 	struct device *dev;
 	char *buf = val;
@@ -509,7 +511,7 @@ static int at24_write(void *priv, unsigned int off, void *val, size_t count)
 
 	pm_runtime_put(dev);
 
-	return 0;
+	return bytes_written;
 }
 
 static int at24_make_dummy_client(struct at24_data *at24, unsigned int index,
-- 
2.45.1.467.gbab1589fc0-goog

