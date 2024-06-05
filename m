Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AC16144307
	for <linux-sunxi@lists.linux.dev>; Wed,  5 Jun 2024 18:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717610567; cv=none; b=G09+Liwy2BF2BT4z2CiQlN8M6gSUhZMcgS943c+kGg4vGKoZEl2+y6swWRXZPFGUSwGU/+ECT7ATThOv/88l1aWnG+9t4aBiRH6MbFw+3cgqz//qptpdqD39RXNwiEs8fZl2GWJ1sJmyCBmIg+xrcdetpFzWR9Z70ni/0aeuje8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717610567; c=relaxed/simple;
	bh=eF30gjQEDuHJ/IYGm6d82rKPYlogi0y1Le1+CTBv8es=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=cU0BT3PLpQFZmVqkSuxMCBZLIUvoty1nizTaeXaWI7avo93RLyzgEzw6CEfY3Z27C/Je3TM5f4s75mVM6xIFkGft8qI6JIZkqcUbr/ii76Q026LQWaR1VPx5XTxlIqF7aqbn76Jx+hgT/T0bYYu6F57mqWHi2+xl4b0VJy8iAno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--joychakr.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YIvhAGdx; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--joychakr.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YIvhAGdx"
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-62a083e617aso315557b3.2
        for <linux-sunxi@lists.linux.dev>; Wed, 05 Jun 2024 11:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717610564; x=1718215364; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=y5YxZkBMx7xM0lBc97o2/iv7RwAsHr+ZFIuj4hushzk=;
        b=YIvhAGdxixOmlzorAH8y5JcWCCwauL7O1xzxsmhvq55zGEciwsM1cUPaZq/ldwy9j+
         7GUQKliLpR+FgDZHBliUFnfXMPcgrjjw1OH4NVs3H9BVKy4vAYUyNSFgXIcR4394z/Wh
         wy59mfcLmH1uPqoVUOM0EtAMHdzfAzFgx6WfIrQWXEdC6rINQIWHkiPspYsIy5KuODr7
         8On399Ighg3fH9Du79M5FfMHlOb2M9+0hgFUFFNFwxdL/PnIsfK2pf7ph+1llHoo9Vjp
         ruwP/14dlZmqfRB0kshvaRJxS3xd7Obr7wh+dPiellgZI8ouG/Xv2iXJzDZmlx+FOo2N
         dh/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717610564; x=1718215364;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y5YxZkBMx7xM0lBc97o2/iv7RwAsHr+ZFIuj4hushzk=;
        b=mqCIjv4PsVNnezV0iwiqW9x9fBGLJ5I+9/UeoSvvkzaAN0w2ZYu4pqf2st7AiKklV4
         qR2v4aSYJgT977ofdWfoe3aPuPzYq8JB+gFAuQXyjCwS43LTErkYZDI5p7y93JLVU35C
         MqiDOAXJsL453EcaAAoyMygaZ9JYRDKYRh9N5/f/YUhwkxvYWl92jksd99qqOexFUWx0
         TIVmAIesiAAOUAISoziUJpxW10FR9oAp44YKzJqAcWslyZe+Pug6xVAw55uWyyKS0dsn
         dKIWfevNxBaAMyOWtF7w7sjxHX0ek91TjvAQHYktQ0WVxkUDU6Psoy/0aKS9Ur9ctvhP
         rLog==
X-Forwarded-Encrypted: i=1; AJvYcCUA++dodasrRo3K+MYFp/BdJKb9ukfj93+2JN+96o7+MPj36uOVR+M/koAGXuGnULW/Tf+NAirmNcml1E/TQjehByr6xYkLDGVMPwA=
X-Gm-Message-State: AOJu0YxFNUopYxVFOq+YUKVgceIat61etzJ563CE9oPaWIGvJlUdJ5Q3
	AOX2zueZlKPVrq8jbnkvj9nstq74/7oj/5WYDmXxP8/5Rl/j4xNWCXGe4JORT8E1UxcX8Sht2M6
	ZNXEYw8MR2A==
X-Google-Smtp-Source: AGHT+IGCU+GmK3Rf3XT5eiVn8GBJTqffr6kRhdYR5C7W1ubGEWJe6ysf+n1fV0SHLE+oXrcbvgWtj6KwbrbfFQ==
X-Received: from joychakr.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:6ea])
 (user=joychakr job=sendgmr) by 2002:a05:690c:884:b0:61d:3304:c25e with SMTP
 id 00721157ae682-62cbb5b3bc3mr8573737b3.7.1717610564108; Wed, 05 Jun 2024
 11:02:44 -0700 (PDT)
Date: Wed,  5 Jun 2024 18:02:31 +0000
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.45.1.467.gbab1589fc0-goog
Message-ID: <20240605180238.2617808-1-joychakr@google.com>
Subject: [PATCH v1 10/17] mtd: core: Change nvmem reg_read/write return type
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
	Joy Chakraborty <joychakr@google.com>, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"

Change nvmem read/write function definition return type to ssize_t.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202406050200.8BOdZUla-lkp@intel.com/
Signed-off-by: Joy Chakraborty <joychakr@google.com>
---
 drivers/mtd/mtdcore.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 724f917f91ba..b13752ec2f1c 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -530,8 +530,8 @@ int mtd_pairing_groups(struct mtd_info *mtd)
 }
 EXPORT_SYMBOL_GPL(mtd_pairing_groups);
 
-static int mtd_nvmem_reg_read(void *priv, unsigned int offset,
-			      void *val, size_t bytes)
+static ssize_t mtd_nvmem_reg_read(void *priv, unsigned int offset,
+				  void *val, size_t bytes)
 {
 	struct mtd_info *mtd = priv;
 	size_t retlen;
@@ -541,7 +541,7 @@ static int mtd_nvmem_reg_read(void *priv, unsigned int offset,
 	if (err && err != -EUCLEAN)
 		return err;
 
-	return retlen == bytes ? 0 : -EIO;
+	return retlen;
 }
 
 static int mtd_nvmem_add(struct mtd_info *mtd)
@@ -919,8 +919,8 @@ static struct nvmem_device *mtd_otp_nvmem_register(struct mtd_info *mtd,
 	return nvmem;
 }
 
-static int mtd_nvmem_user_otp_reg_read(void *priv, unsigned int offset,
-				       void *val, size_t bytes)
+static ssize_t mtd_nvmem_user_otp_reg_read(void *priv, unsigned int offset,
+					   void *val, size_t bytes)
 {
 	struct mtd_info *mtd = priv;
 	size_t retlen;
@@ -930,11 +930,11 @@ static int mtd_nvmem_user_otp_reg_read(void *priv, unsigned int offset,
 	if (ret)
 		return ret;
 
-	return retlen == bytes ? 0 : -EIO;
+	return retlen;
 }
 
-static int mtd_nvmem_fact_otp_reg_read(void *priv, unsigned int offset,
-				       void *val, size_t bytes)
+static ssize_t mtd_nvmem_fact_otp_reg_read(void *priv, unsigned int offset,
+					   void *val, size_t bytes)
 {
 	struct mtd_info *mtd = priv;
 	size_t retlen;
@@ -944,7 +944,7 @@ static int mtd_nvmem_fact_otp_reg_read(void *priv, unsigned int offset,
 	if (ret)
 		return ret;
 
-	return retlen == bytes ? 0 : -EIO;
+	return retlen;
 }
 
 static int mtd_otp_nvmem_add(struct mtd_info *mtd)
-- 
2.45.1.467.gbab1589fc0-goog

