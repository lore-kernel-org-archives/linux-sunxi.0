Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4693C195990
	for <linux-sunxi@lists.linux.dev>; Wed,  5 Jun 2024 18:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717610432; cv=none; b=Pc+NeRPXkAXX33CYxOSGDpQ1PM8Y73qTuwPlL5UULy4X2MhqAVuAqK4xw9QiNbXy+hK8MLZ30f4RLcqIzn//nQtQcOeTrpmG4WY/hy2cdI9fXnHrxgEhofhMjjeCj0KIWgZOLVf/r6ifc2KOkqDFaVcq0Jnwzp1yGOtkY01zt4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717610432; c=relaxed/simple;
	bh=7YntdTNu7aMZ5zLGGRpR3JsfAB0rBOtanC3KQe4XBYY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=jzXejwfW8VVuVoYA8Fk2sWeiTbomc9TnFk6URYvUdm66OOnMbw6apV4Zo2SBsZJ5R1pLkO/Kfa/3x7+VJbkDDFVo3VETFgd64E/j4G96rNUiMR8u4CAweSZocG4y2/cFKUIyWwM9nOEe9m6H8J4VXdoWWf2bdDnmOpT9rL3Equ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--joychakr.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bSaUHbX+; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--joychakr.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bSaUHbX+"
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-62a3dec382eso603257b3.1
        for <linux-sunxi@lists.linux.dev>; Wed, 05 Jun 2024 11:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717610430; x=1718215230; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=GabZAVwK9FSl0VODpa0rRnhc7Hb5WIAFsUpyNY/Jkgw=;
        b=bSaUHbX+2jS3ds1PNWUsIffRoUjEakKqriAA1PPlBm34GS20GjErjDs/XlgLBRbkQM
         XZqUWKssBo9r9uotizqx/tGRldD7926TyHCg30KMWwcRjdfzmgvRKZ/mljerJH+qhk/x
         m2o9ef4O0kvyswWM2fL4xjbV2yOlTI+5dDopy0oQc2l9dSFlidzlfIFLAMn11AbVcXNs
         vz9RGVwTG4P4+AWcGyaNByPOr94QC31YKg57k0+fdvu33D9/F6OyMltEtPitieu/tNyb
         756KR2CzOQUQLGFo4fjxi6zuRkXhVkV0ltHx7xU5lCXp0QTXIw4f86H3d3Zy945nJGt7
         1aMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717610430; x=1718215230;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GabZAVwK9FSl0VODpa0rRnhc7Hb5WIAFsUpyNY/Jkgw=;
        b=GS2MhiCHrJ4E+fDCz5goBvOzIU79AYlFBegA2gKFRF+L+cg6wvOxjZlEAMcHPhpoQC
         qKIIC30LhSJr4VlwDyIIEsQy4dzX3iC7lZTKD/rNHqAphVlBrA+ZQkqGgt1IeUnMv+E6
         exgEuJ0Mv+STSX9zz6H/Ii6bVXBmjm0a6BFEll0dvl+80LrWD2tG7+BTfBmh8fot1Jq/
         5oZqIBL/xMkdi0P8NsZ5m/Vec0UObgGu3QwhQDIFRM2G+u5y1CWnvf5YZKg6bTVGZwey
         32OyafyEy/BsrKmQHAPwp3Tj6mdTekr4y9TzqgZ8OfZOFkDmHddV863i3Bjy0HR1rd6x
         YQcg==
X-Forwarded-Encrypted: i=1; AJvYcCUa4UCpNSUMnyhkj3pmyhkewk237vM4TSXhJ3oiJDENMYz07mAZvZbY6J+IrXVO6w0Re2RmbkygRS7GRzS4nnYWGYZwqVN/gttioo0=
X-Gm-Message-State: AOJu0YwIaTM4kuEk8L07EbqDuvh8Y4tlVRICtwcH/qEXQ8DP0UV2LJ1b
	6ujZcos5RH4iGr7hDnPdGYe3xU+d2+6WaeT20SFhZdj96p8xZcK/jNA7P4Xvjj6+jnN+YZCPWMd
	cDk3SJOAogw==
X-Google-Smtp-Source: AGHT+IEja+GLVOpS7V2U0r8IR9Z9ZB6nAf9rPU6225JSB7wTRYk1qUU4QFIkeBtYF/8VHx1IHDowrDp0WPzcZg==
X-Received: from joychakr.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:6ea])
 (user=joychakr job=sendgmr) by 2002:a0d:d952:0:b0:627:de82:8077 with SMTP id
 00721157ae682-62cc709af05mr798057b3.2.1717610430440; Wed, 05 Jun 2024
 11:00:30 -0700 (PDT)
Date: Wed,  5 Jun 2024 17:59:51 +0000
In-Reply-To: <20240605175953.2613260-1-joychakr@google.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240605175953.2613260-1-joychakr@google.com>
X-Mailer: git-send-email 2.45.1.467.gbab1589fc0-goog
Message-ID: <20240605175953.2613260-8-joychakr@google.com>
Subject: [PATCH v1 07/17] misc: eeprom: at25: Change nvmem reg_read/write
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
 drivers/misc/eeprom/at25.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/misc/eeprom/at25.c b/drivers/misc/eeprom/at25.c
index 595ceb9a7126..73d60f80aea8 100644
--- a/drivers/misc/eeprom/at25.c
+++ b/drivers/misc/eeprom/at25.c
@@ -74,8 +74,8 @@ struct at25_data {
 
 #define	io_limit	PAGE_SIZE	/* bytes */
 
-static int at25_ee_read(void *priv, unsigned int offset,
-			void *val, size_t count)
+static ssize_t at25_ee_read(void *priv, unsigned int offset,
+			    void *val, size_t count)
 {
 	struct at25_data *at25 = priv;
 	char *buf = val;
@@ -147,7 +147,7 @@ static int at25_ee_read(void *priv, unsigned int offset,
 
 	dev_dbg(&at25->spi->dev, "read %zu bytes at %d\n",
 		count, offset);
-	return 0;
+	return count;
 }
 
 /* Read extra registers as ID or serial number */
@@ -195,10 +195,11 @@ static struct attribute *sernum_attrs[] = {
 };
 ATTRIBUTE_GROUPS(sernum);
 
-static int at25_ee_write(void *priv, unsigned int off, void *val, size_t count)
+static ssize_t at25_ee_write(void *priv, unsigned int off, void *val, size_t count)
 {
 	struct at25_data *at25 = priv;
 	size_t maxsz = spi_max_transfer_size(at25->spi);
+	size_t bytes_written = count;
 	const char *buf = val;
 	int			status = 0;
 	unsigned		buf_size;
@@ -313,7 +314,7 @@ static int at25_ee_write(void *priv, unsigned int off, void *val, size_t count)
 	mutex_unlock(&at25->lock);
 
 	kfree(bounce);
-	return status;
+	return status < 0 ? status : bytes_written;
 }
 
 /*-------------------------------------------------------------------------*/
-- 
2.45.1.467.gbab1589fc0-goog

