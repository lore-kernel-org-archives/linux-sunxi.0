Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57EB814EC67
	for <linux-sunxi@lists.linux.dev>; Wed,  5 Jun 2024 18:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717610411; cv=none; b=flofmv/BH/H5tqcsupRohZj/eBc/T2gHo5plEKRyXNgxeI2K9oS5MsUJUpJ1RjHcGQhdYnSxCoyVFfj3UiTPJkTKAWbGklfYYR/pGcvf3GkFydSqkMTgVDc6pPfzbKf2dyhYBAqCccU/IiNALrXhe6+p2N1pFMVR50WaTA6d9Tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717610411; c=relaxed/simple;
	bh=8DJQonJqq5Z4yQRN/sDPNHSxx9pC4pBa8VVN/l35RYU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=axqhS4v4SNvZ9u2LLVXnUV1GLaye97XQH/7diDADVIQxoC0Ifin2/yfuB2uFqJ81qLSxFRYEw2cwn5jfEVwecyKfCTtGUMo+itA+E3prpCUDxNhHfLw3/g4fulQ4qrAmqz2obdU6SnvgSekOOQMVQmO7g2uAFyEy75IKtHpBwyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--joychakr.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UgF/Se1C; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--joychakr.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UgF/Se1C"
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-62a080977a5so581037b3.0
        for <linux-sunxi@lists.linux.dev>; Wed, 05 Jun 2024 11:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717610409; x=1718215209; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=fOg+UnJ80V7MsfirTppZcqaQfW4UzyZaf6xSdj4zJek=;
        b=UgF/Se1CePznzOcFiRF1AN3SNKULIe1NPq+Jpji+duFAiUSdYwSI5qj4NTARCDv6ct
         XoKInV/v5qQp42oMppjyqmqmlKj4fbD0DVVGXvSUttNDbAQr21SXhehCBkLmrQbYDBIY
         E82up3atptZr4qaHX6jSlPYY45ICYpUZ+N543ZJGBBAxtmn9XM7EDPQaipdfcuBl5ien
         JeMdg7ZTmDGmX29MNhD51AhLmmxgtlsOeyNXTwyjofaVCZP8FEHcfB+wSmk9CFV2Htz8
         GU6ndQ/y7Y0XPywBBOJxIOS/LHdzeS3CIbF196I4CBtZ/n2pAEStZVHaicln6M5fRwk+
         7J0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717610409; x=1718215209;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fOg+UnJ80V7MsfirTppZcqaQfW4UzyZaf6xSdj4zJek=;
        b=XjK6TmyaKf5uCIIaVMVCWxuq78vbUhY7AOXJEufzM88kkc/51yWTejQN7CnZM24l9f
         CISiqJJ/A2Zjs2rdInYetRKY0t5Eq+Nef2QRYXDqlw+4mLbc7HYy2Ece0k5BhSUnSx+7
         GHWrr6ltTtf8rJJ7FBDNLj0IeehGyeNfshBMkWxkzyz+W0j4xOgDXdbx2LxJfuNuTRb4
         R5JnlWSAmQE6VycdSKcR4Ib/ERv3S8hASYEqK1pz1zaCzKt645R5CdNdYrGrlF5u/Ntq
         k0Gwk3PTImpiTbyc+GG4BJxLmn4yDx+CzibNv4RaUR5sQHPPZsIjSFVPBF5+Z6XXJsel
         LCqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPj0KmGElrUc2o2IlV96eqW5Z//ydgFn6oAlgdlGOLtLMpDWW39GhjTqLVZWC7WHZGm6MrfNB5IyaCHBWXZU2IrHF7A7cF+00qUj4=
X-Gm-Message-State: AOJu0Yxg25TQGJH0XMtpXIkg07dHiSatlr3ubm3Md/h5nY5LSV/s1TzH
	t3R+hFDgrhlV0MYL3lLdMngM8tChZIwejuWThjkcQ9IwmY//MrTucSbVFKVzkHGpZJ1X65FB7RU
	uP3HYrfLluA==
X-Google-Smtp-Source: AGHT+IGVqeHwMyqXKI282yIc4vrmNhlrddNc8SUJnwKBYMg45bAMjkiEv9ztSUrQcKvlvHzhm96dBXxGRdgPkg==
X-Received: from joychakr.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:6ea])
 (user=joychakr job=sendgmr) by 2002:a05:6902:b12:b0:dfa:7282:d6d4 with SMTP
 id 3f1490d57ef6-dfacac47b9amr605485276.6.1717610409394; Wed, 05 Jun 2024
 11:00:09 -0700 (PDT)
Date: Wed,  5 Jun 2024 17:59:46 +0000
In-Reply-To: <20240605175953.2613260-1-joychakr@google.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240605175953.2613260-1-joychakr@google.com>
X-Mailer: git-send-email 2.45.1.467.gbab1589fc0-goog
Message-ID: <20240605175953.2613260-3-joychakr@google.com>
Subject: [PATCH v1 02/17] media: i2c: ov2740: Change nvmem reg_read/write
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
 drivers/media/i2c/ov2740.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index c48dbcde9877..0101ab55a5ef 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -1212,8 +1212,8 @@ static void ov2740_remove(struct i2c_client *client)
 	pm_runtime_disable(&client->dev);
 }
 
-static int ov2740_nvmem_read(void *priv, unsigned int off, void *val,
-			     size_t count)
+static ssize_t ov2740_nvmem_read(void *priv, unsigned int off, void *val,
+				 size_t count)
 {
 	struct nvm_data *nvm = priv;
 	struct device *dev = regmap_get_device(nvm->regmap);
@@ -1241,7 +1241,7 @@ static int ov2740_nvmem_read(void *priv, unsigned int off, void *val,
 	pm_runtime_put(dev);
 exit:
 	v4l2_subdev_unlock_state(sd_state);
-	return ret;
+	return ret < 0 ? ret : count;
 }
 
 static int ov2740_register_nvmem(struct i2c_client *client,
-- 
2.45.1.467.gbab1589fc0-goog

