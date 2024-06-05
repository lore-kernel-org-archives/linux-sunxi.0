Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 976F7E573
	for <linux-sunxi@lists.linux.dev>; Wed,  5 Jun 2024 18:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717610425; cv=none; b=OwECZqf3ECL7Kh0lkyiZHuNMh+8BKQ+rXyitxV+IK8tXRvCrbcI5o7ozwnokcAVpUOPtk+d0EYRGYT4jnTyLcbNR+qrOfUImK1RPD5lgB1aU2J6OJ841gVXIJJEegTB6+FjtLuE1x6bMesNYSmWMOSbxXlJEEZhAuO7sxUYIBM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717610425; c=relaxed/simple;
	bh=M/eENeT34qITqyMJGoLfrkcDLPx6c2gqtgSpfyqShjk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=aDDKGm5My0fYuyu5hAJ6EEIgqc4ueyZpe2JhZCLYHImWJMI3dCln5CdIOgVWdoESJ5ppO3B+9ULTEmfZjEBW8r/nkK95rNYYXCgfPeXgPo6+5S+A5aoyaBSMdGLONTbIjQ8pHBiBtT8lTTh2c3sqIrcSDGf1IPppqHLHVCM4tsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--joychakr.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1Mqj4+Ts; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--joychakr.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1Mqj4+Ts"
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-df7a6530373so128561276.0
        for <linux-sunxi@lists.linux.dev>; Wed, 05 Jun 2024 11:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717610423; x=1718215223; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=oWEvs7lXuHPW/wbGZW3HASpAVL3QgOZ/ef+Ervw8nvw=;
        b=1Mqj4+TsB0rtvIDsgXVqh1tu/6Hx8U8S3PRYb01Fd2Pv380lka0M3OHaiBDmXYqdq9
         rxFWbDmZq6r91G0Sn6iUcUawtVcjxZsyK8PSGlPeLtqNFrHNgJRTv8cnIhd6NROkYKMD
         hLXTOrit0F7RzFwl1GT+X1hcE/pywi74TSpTmPrWfI//AZTkYRFjwQ3KAR+My8/ooguc
         6rZiFANF9ZAK+qmvQ2k7x8k0+N4vJaDefpvP6csUbnZIKmLY6bhchVnGL5JfZdQDJFDS
         liWlQ8YSbFT29c0qQAEA70YqplQyWdPb7G/WbifDTVSzIzCHrsAInsKxHwFhXO8a/Y6S
         4Pcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717610423; x=1718215223;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oWEvs7lXuHPW/wbGZW3HASpAVL3QgOZ/ef+Ervw8nvw=;
        b=BnMNwQzw1g2UADmoEVXjoQKitVOKqYpN4XMiQlHOo8Oc5gVnVql/zS50VXQC0oB6df
         VxLGy+aPmtMTTiip1nJK9e/NHN2tDPQdudnF/C26+R+7rbnj3j5nLacw+HJxveH3hAd3
         lZfPJXMfeLWQuQ10B1ier8fRNULbJQdCvF7g5g8pdqB4pW2d1pgaFnj9VXC+ufllUBer
         cs2bkJkK02ByPTX5YPDUrUUr7IsdcWQAVDuRqJc5fEEi+GPJQ40yGAZTsfzaUF/+e1of
         KNxE/t0hwZ5kavUeA+NRQI64clvXiT01/od+G4HfZaAUSW2g9ApbhPagmi70DChFHVCl
         VdBw==
X-Forwarded-Encrypted: i=1; AJvYcCXDihzSZLcIpYLLz++mUXZ61DXkkYWbH/9a5nwBo6sAuBbaJqtrZ9zAn5IOlbE0ZPWRf0FcQz18mQg+/UYygQb2+KvpsdjsPHmBgd4=
X-Gm-Message-State: AOJu0Yyp8yJXD3yLujONO4z+DKBVtbWParnT2ZLCz68Kl/yQMtI7Znn9
	blvj5aiqri+EgoPgg1PIMixM0AX681EtMgn8v0CUBsHh1vxTAYkkyovn2PqQuL6hZh1aLMZ9sMN
	x2cxqOhUZIQ==
X-Google-Smtp-Source: AGHT+IHzBpKnrggHmMHMkvKX90wRDGnyxC/rya4wNnolxBy/S7eZxADMs2JOhL4gs65LRvS4Cl380vcS0L4//g==
X-Received: from joychakr.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:6ea])
 (user=joychakr job=sendgmr) by 2002:a25:9004:0:b0:de5:a44c:25af with SMTP id
 3f1490d57ef6-dfadec0b255mr68771276.5.1717610422643; Wed, 05 Jun 2024 11:00:22
 -0700 (PDT)
Date: Wed,  5 Jun 2024 17:59:49 +0000
In-Reply-To: <20240605175953.2613260-1-joychakr@google.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240605175953.2613260-1-joychakr@google.com>
X-Mailer: git-send-email 2.45.1.467.gbab1589fc0-goog
Message-ID: <20240605175953.2613260-6-joychakr@google.com>
Subject: [PATCH v1 05/17] misc: ds1682: Change nvmem reg_read/write return type
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
 drivers/misc/ds1682.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/misc/ds1682.c b/drivers/misc/ds1682.c
index 5f8dcd0e3848..953341666ddb 100644
--- a/drivers/misc/ds1682.c
+++ b/drivers/misc/ds1682.c
@@ -198,26 +198,22 @@ static const struct bin_attribute ds1682_eeprom_attr = {
 	.write = ds1682_eeprom_write,
 };
 
-static int ds1682_nvmem_read(void *priv, unsigned int offset, void *val,
-			     size_t bytes)
+static ssize_t ds1682_nvmem_read(void *priv, unsigned int offset, void *val,
+				 size_t bytes)
 {
 	struct i2c_client *client = priv;
-	int ret;
 
-	ret = i2c_smbus_read_i2c_block_data(client, DS1682_REG_EEPROM + offset,
+	return i2c_smbus_read_i2c_block_data(client, DS1682_REG_EEPROM + offset,
 					    bytes, val);
-	return ret < 0 ? ret : 0;
 }
 
-static int ds1682_nvmem_write(void *priv, unsigned int offset, void *val,
-			      size_t bytes)
+static ssize_t ds1682_nvmem_write(void *priv, unsigned int offset, void *val,
+				  size_t bytes)
 {
 	struct i2c_client *client = priv;
-	int ret;
 
-	ret = i2c_smbus_write_i2c_block_data(client, DS1682_REG_EEPROM + offset,
+	return i2c_smbus_write_i2c_block_data(client, DS1682_REG_EEPROM + offset,
 					     bytes, val);
-	return ret < 0 ? ret : 0;
 }
 
 /*
-- 
2.45.1.467.gbab1589fc0-goog

