Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B023B13CF82
	for <linux-sunxi@lists.linux.dev>; Wed,  5 Jun 2024 18:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717610407; cv=none; b=a+clFgJ+5pONmqqOeIS5+fil1feuxlytllLvycFgrN3WKy0zgR7DpSznmadXzlq6+6z2647GTBZcRFYejgFvRpaZQVux3B7k3cDS1QjbAZNc2R/hTJ2/ubKPIIdkC/x/o0pqG+f00HzSiwgRcDIZPGo7F0UVRYFa+SPq5PyGMhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717610407; c=relaxed/simple;
	bh=ipr39Oe7qflzshs+uqKeD5dsLOI2DywzVbGtmwc3XF4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=JUQPpxuQry8lRgbAkyZixMS8fgvYyLblUROg8WF7W1ezKR05sw12CQEKslUgthtKTQ2GW/qRIl/kF6ndpBPPAVdyH9txNcsZ0T5Tr4xTb2DDDEo8VfJx+cSxW/PdC7FuN7UQhMb6zApQnTEkZclcq8ovIY6+7lMfQBA3WHpvPFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--joychakr.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hCxw2R6F; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--joychakr.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hCxw2R6F"
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-df7a6530373so127536276.0
        for <linux-sunxi@lists.linux.dev>; Wed, 05 Jun 2024 11:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717610405; x=1718215205; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=nEr10taYCu3WGRiwn+CGqfggqJNbp7A+We0V3ygommI=;
        b=hCxw2R6FxizcfkItxB44DQddshKQTRpEACLXB78H7DqdH61MBh/xB+tsNSPm7HqZ8P
         3UjQlUmjW1lF1sDVZx4IqRZ8lalSxm3JFtA6yqFf9AqCRJZHLzhuqnGmypa4sr+MiR7l
         Ebo2nYM3hsPIBZCi7RTUi4pe7lAKj8CJnDMOmyKJTbV84HtPDH37vPESI874OpuLk8Ch
         ihg7sIsY/zRcTUKh3v/AyvJD5iELUs7bpAC41P7IiJIXZL4oOUt2gREyxbZLQ8EIGFq1
         oc8nfTBoEjH1clLevCDYSYAPpfN/ViHI3Kgb8Cqjcwjf3YO0Bxn97jRPhaQw7jvxT1bW
         3ZHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717610405; x=1718215205;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nEr10taYCu3WGRiwn+CGqfggqJNbp7A+We0V3ygommI=;
        b=K8zjyvNfwcx84C8ePNkDmzJp1813ePNXxIo38JwaqGhqnqlccTojpLzPPTkCS4pOCQ
         fUdaIjmu67tZuR+9Ls80ZrmExislMBL+FIB9lrIVbeRz2aUovodyosixjByMy0kiANnZ
         vEAGtzfN3gyDaznIq0XDzLyN1FgYEuENa+W+H9j25hojrO0UrseyOMH96wzNR+arG0S7
         q5sCG1q7u8mM0ZXyLe5NzfoOvYVivPBF+wPlEJYHM2cOmMzJtgmPw7qcJi1Ge87JFEMK
         kwHuEJnd937i4/Sw8blf8sGPGRgPbgZ1eXQkWXnxjKw3aMytj0EuWG6ZJB8lj2zC+DAd
         4qHA==
X-Forwarded-Encrypted: i=1; AJvYcCXmT8BFwROvb8hyUyMSrcBEwazuD82IhPLXTqxqOZ6zoHawkb1aPiAyKKxiRCGIdX4JlyZ+4ZezSmXz0rozrlNlJ9jXkhTvbeYHGkI=
X-Gm-Message-State: AOJu0Ywkpu4HjNIPdx71FZ6MJhmv436/mM71cQ8UUNemU8/Is3LhlKy6
	I9gXbi9bqfXD+SRv9QTRyS+5bsGA4RaiCkDP9WDdIdsuYhIMJLfcrA9LnxueKwu0+gM4BSuRX6h
	yNU5vRTWvDg==
X-Google-Smtp-Source: AGHT+IEFfd1XOUpmBlCQ8OC96XaGHvsQJFoGDWo7KSg31aa/FmwG5qSwwUZMqSajPkXkOc1t6VuaS9UByNrZ0g==
X-Received: from joychakr.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:6ea])
 (user=joychakr job=sendgmr) by 2002:a25:dfd5:0:b0:df4:eb0b:8fd with SMTP id
 3f1490d57ef6-dfade9e0f4dmr76066276.2.1717610404805; Wed, 05 Jun 2024 11:00:04
 -0700 (PDT)
Date: Wed,  5 Jun 2024 17:59:45 +0000
In-Reply-To: <20240605175953.2613260-1-joychakr@google.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240605175953.2613260-1-joychakr@google.com>
X-Mailer: git-send-email 2.45.1.467.gbab1589fc0-goog
Message-ID: <20240605175953.2613260-2-joychakr@google.com>
Subject: [PATCH v1 01/17] hwmon: pmbus: adm1266: Change nvmem reg_read/write
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
 drivers/hwmon/pmbus/adm1266.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/pmbus/adm1266.c b/drivers/hwmon/pmbus/adm1266.c
index 2c4d94cc8729..7eaab5a7b04c 100644
--- a/drivers/hwmon/pmbus/adm1266.c
+++ b/drivers/hwmon/pmbus/adm1266.c
@@ -375,7 +375,7 @@ static int adm1266_nvmem_read_blackbox(struct adm1266_data *data, u8 *read_buff)
 	return 0;
 }
 
-static int adm1266_nvmem_read(void *priv, unsigned int offset, void *val, size_t bytes)
+static ssize_t adm1266_nvmem_read(void *priv, unsigned int offset, void *val, size_t bytes)
 {
 	struct adm1266_data *data = priv;
 	int ret;
@@ -395,7 +395,7 @@ static int adm1266_nvmem_read(void *priv, unsigned int offset, void *val, size_t
 
 	memcpy(val, data->dev_mem + offset, bytes);
 
-	return 0;
+	return bytes;
 }
 
 static int adm1266_config_nvmem(struct adm1266_data *data)
-- 
2.45.1.467.gbab1589fc0-goog

