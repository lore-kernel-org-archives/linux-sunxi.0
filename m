Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 443AF14F119
	for <linux-sunxi@lists.linux.dev>; Wed,  5 Jun 2024 18:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717610579; cv=none; b=g/NuZvNjWIX/I8vcIgJAnJkj6G2Q8bXctZTSIg+p5tUVbjdSmF05uDX/zUR8zPBQz5yOVEcjpx/BC16HIIKYIlNpzJh76s0sx6VJqWmoa7kSNJokwEkZ1OVHcHhCSexYRyik1PKKNUg15vrVMfglckurlGokju3nN/g5gvm0iTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717610579; c=relaxed/simple;
	bh=F7v/jReeX3F7roR5IktBU242vDNjjn7EqsY7CVC37N0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=emfXyFEZp9+fqtVFk2HX3BVvHDztw72sS5uDHGW3ZOlZJbjJwU91thr0bsM44WkY4EQoovBTXWLlEmoC9n7kkJUNqMXiuenXmm8AgDzynDh1bqbxzkPkixBSbJpQDsizgKc0UPuSc+/P6mkTip2Kkwc5zYv3j4YDfHd2+SSMqO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--joychakr.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oH0sBBpN; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--joychakr.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oH0sBBpN"
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-62a50486746so240737b3.3
        for <linux-sunxi@lists.linux.dev>; Wed, 05 Jun 2024 11:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717610577; x=1718215377; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=gIyLXo+tPpGJoYrLFVnPX7LJcwSjEvXHtDXEdVowSIA=;
        b=oH0sBBpNIln0tmm/giN9XA+/tCwR68A+/S4ZSITbz4wStwz50y44qETc1PE8epvXkn
         b8R2RUlQhM835DQl5eFXn2gN+bnmB5VmoCLQZY2wD5UQ7+YEwDmn8Oy+iHXz44uEfi9v
         r1oAiw4ShD+NrXkQEu3/g111XEOhp7JC5xZW28Rvs7d3tZpvgVe/hv5Y8lIAp0Nw5AIP
         k8NAFPhtql4x6pB3316NZbFdPUI6xSeXcVr5oHQrtsuoME6UYJsnYbru+PG5Yz5TCSos
         eeMxppm7ZSMLUHrhkJt6bPnhNtzd9zWIhlMIJf68ULUgiA3KucysN+sUI0tQ8ajptgk8
         hRvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717610577; x=1718215377;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gIyLXo+tPpGJoYrLFVnPX7LJcwSjEvXHtDXEdVowSIA=;
        b=I9utxnB5HemOcXrAJi0vGrktJGG+fLCPyG6TTcjL1HM8c1P4ivT8aSUI9HMh3/GVD1
         6WxI+7VItKwAHqD1iaFpm1HG4oOw8P9uTfMD159HTIUuA5K5hBTe27SRW1Rw4AsWXHP2
         HHM9EzIFSUGt7qhKhkaJbgeXZt48UwNy4oLlp/fbrvYUWuRQwo5lDJb2s+CTV9IAzI4S
         KhgasMYqfzHrI10jfzryA9AC9w1Tn9Nb+P4OhycfZVuB5sReeX3Cg54ZXFsn/xCSWXgL
         FUPV7JABZmnvTm6RR9JncYXMv0rYi0gvPtIas8/cGCxDzr8D39cZ4VEV7/liNdn/whEt
         znVg==
X-Forwarded-Encrypted: i=1; AJvYcCWDmfCgpkTu8E8tPNg3XuXxBmNZU9CDcjDZtOy7oTjkpmtsnu1zR9aLIdorSg9+vTnKLKCrx0sEtI7B+rSFwv9B2FReFPxPgLByEfc=
X-Gm-Message-State: AOJu0Yy29w+GtsipLDutR0xKIMpTbxzLJ92k2zK1DbFSQrVfHfAl+8jj
	Q3iRqOv9f0t+1X/boc2EkVyhVrv12UBjCEBoc59+6/8UUVnhvKq9PYED/iXYkfsAgZ70cGbw1e6
	LSRa0st/1kg==
X-Google-Smtp-Source: AGHT+IHG2azfatKIs/LKs8bXyfwjNeJAhdZhoJHXxOf8ZfbWIWN9yiXy7wSmGDJ/xHP8XZ6qdqs5ZKpzypDE7g==
X-Received: from joychakr.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:6ea])
 (user=joychakr job=sendgmr) by 2002:a05:690c:887:b0:62c:35fd:678b with SMTP
 id 00721157ae682-62cbb5ab5a2mr4622397b3.8.1717610577229; Wed, 05 Jun 2024
 11:02:57 -0700 (PDT)
Date: Wed,  5 Jun 2024 18:02:34 +0000
In-Reply-To: <20240605180238.2617808-1-joychakr@google.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240605180238.2617808-1-joychakr@google.com>
X-Mailer: git-send-email 2.45.1.467.gbab1589fc0-goog
Message-ID: <20240605180238.2617808-4-joychakr@google.com>
Subject: [PATCH v1 13/17] w1: slaves: w1_ds250x: Change nvmem reg_read/write
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
 drivers/w1/slaves/w1_ds250x.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/w1/slaves/w1_ds250x.c b/drivers/w1/slaves/w1_ds250x.c
index cb426f7dd23d..369de01cd84b 100644
--- a/drivers/w1/slaves/w1_ds250x.c
+++ b/drivers/w1/slaves/w1_ds250x.c
@@ -137,7 +137,7 @@ static int w1_ds2505_read_page(struct w1_slave *sl, int pageno)
 	return ret;
 }
 
-static int w1_nvmem_read(void *priv, unsigned int off, void *buf, size_t count)
+static ssize_t w1_nvmem_read(void *priv, unsigned int off, void *buf, size_t count)
 {
 	struct w1_slave *sl = priv;
 	struct w1_eprom_data *data = sl->family_data;
@@ -159,7 +159,7 @@ static int w1_nvmem_read(void *priv, unsigned int off, void *buf, size_t count)
 	} while (i < OFF2PG(off + count));
 
 	memcpy(buf, &data->eprom[off], count);
-	return 0;
+	return count;
 }
 
 static int w1_eprom_add_slave(struct w1_slave *sl)
-- 
2.45.1.467.gbab1589fc0-goog

