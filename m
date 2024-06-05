Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2763C195FC5
	for <linux-sunxi@lists.linux.dev>; Wed,  5 Jun 2024 18:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717610437; cv=none; b=LfKTsw/vT86kgjeFkNeP4gRtdRfWQuOqbP2PpLOENWdkYtOz5fhdLtEW8C6rQry0sLJieNErBlWdpjZfTm7zpucQYC4owgtZyGhrDTXwwNlAQatf8dkxUCK/Fq5MHUfG7WdTy/VMFCB9SoP1otr1hUc7tbQq9hTRiPHmKULDCUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717610437; c=relaxed/simple;
	bh=1Nr1idmwpwCu952z8yg01gYhGFCoooIcYkAZZCQGY7A=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=tR42IhF4LIGnKhW71oQFiM1Lh1IJV2dj6+45iFMem65/PLnxxx1fmqaRUNVf7uLPtfGOMwsNIxLvqq0UiVyqVSsBin+aVcvwYNMiXhZx5erK9v0cAEM+uO39OXsz78rQNjfLyAayx/WV3DAWJezPQzcpBJZN1I2W35x7EUGPDCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--joychakr.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3zb+3z0Q; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--joychakr.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3zb+3z0Q"
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-62a2aec8521so607557b3.0
        for <linux-sunxi@lists.linux.dev>; Wed, 05 Jun 2024 11:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717610434; x=1718215234; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=MVw14u+NFBf2FJ7HWAHlLpDDoc6dqDnKHHZFCo9Dzmo=;
        b=3zb+3z0Q5FPuML4aOo8VNsz1CC3uy0Cs82Gk6d5NtOZK2Ea83yznLMADqc2K2ukZ/6
         Hxk9ce/dImI8Z2anJgROPHGWrso2UhoTduMvJ6lb99dasHYHVJT/fPkAI/ZUisdNaEJP
         rIZcUM7ZYiipdtC6hGEjStZK6dUeeGWyN4v2kfzfrahK1JkOZJMth2uduv5xYbKOYcDd
         VHDADipMluRWCV8Va6CkTvyKvmBwdYF6AyKeqUzuquSJHY5cmQ2f9xZPlYQBH15ZmEUc
         XxNWF9SLeJvUnBGawTolBnR1EPLYg/m/BR+4ZXdf5BoolY1l2PMX2pbtsbrXEqaEOKvK
         Th7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717610434; x=1718215234;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MVw14u+NFBf2FJ7HWAHlLpDDoc6dqDnKHHZFCo9Dzmo=;
        b=Rci2z+YRsSkRp4m1TzfWu0pW20tFW/bPdVfdJpYeOrZaZhmvHRDU5RM+iTZT5ESzOl
         T69cgNovh/3jLh6+OvNLfXJblWNzbAo2EXwexQS+CnOaviKC4t/JMZF0ezTLMCnfbXXw
         mahO7Pl+PXDn/4+vYfoTcON9n9SOmuttfmBMGzkH17eFjgr8onKHeoxeHeHaiTRKlhxf
         yiqnm1EcCdGQM1e/BtR61riNiWLOnJpI46T9zjXbCDYm4w/+vAqKFGNxvpRco1e6j9JP
         3fiEosZZKCPbk1v65o3zh/B9irBKgHkIhN7SVpkWrzA435gF4vZT0XL60c8+6WTSRknQ
         U0RA==
X-Forwarded-Encrypted: i=1; AJvYcCXdXvSjGEjYEsV9jFlS3Lee+4vWpV0/e2cYU1a9uKQAvhEQpFwDpvx7Oen7MognFrrci0Fbt4vlPCeEkha6BHdvYGi+ZJCXzGH/GyU=
X-Gm-Message-State: AOJu0YyhPTXLqL5KlhKGXOf2kIoU9Gyuga3FoYMSr9hinVnfu4txj6Em
	GL616wZ7kp/ucU+aSIbgHZwojLMCbss6tqHWFFbmxeUSI82aYoANt9UVZEvSFSG7D63Gv72wEwr
	mx59IS51Acw==
X-Google-Smtp-Source: AGHT+IFNKfAUW4OMaL9qXpdep3tJtwg2SPr15+NfVtMPZB9WLEiwmeB7gCF1Z3uW4GFYC8/zL1lL4yiz6W2izA==
X-Received: from joychakr.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:6ea])
 (user=joychakr job=sendgmr) by 2002:a05:690c:39c:b0:627:96bd:b2b with SMTP id
 00721157ae682-62cbb596fc6mr8752147b3.6.1717610434368; Wed, 05 Jun 2024
 11:00:34 -0700 (PDT)
Date: Wed,  5 Jun 2024 17:59:52 +0000
In-Reply-To: <20240605175953.2613260-1-joychakr@google.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240605175953.2613260-1-joychakr@google.com>
X-Mailer: git-send-email 2.45.1.467.gbab1589fc0-goog
Message-ID: <20240605175953.2613260-9-joychakr@google.com>
Subject: [PATCH v1 08/17] misc: eeprom: 93xx46: Change nvmem reg_read/write
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
 drivers/misc/eeprom/eeprom_93xx46.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/misc/eeprom/eeprom_93xx46.c b/drivers/misc/eeprom/eeprom_93xx46.c
index 45c8ae0db8f9..5d618a13fe5a 100644
--- a/drivers/misc/eeprom/eeprom_93xx46.c
+++ b/drivers/misc/eeprom/eeprom_93xx46.c
@@ -79,10 +79,11 @@ static inline bool has_quirk_extra_read_cycle(struct eeprom_93xx46_dev *edev)
 	return edev->pdata->quirks & EEPROM_93XX46_QUIRK_EXTRA_READ_CYCLE;
 }
 
-static int eeprom_93xx46_read(void *priv, unsigned int off,
-			      void *val, size_t count)
+static ssize_t eeprom_93xx46_read(void *priv, unsigned int off,
+				  void *val, size_t count)
 {
 	struct eeprom_93xx46_dev *edev = priv;
+	size_t bytes_read = count;
 	char *buf = val;
 	int err = 0;
 	int bits;
@@ -158,7 +159,7 @@ static int eeprom_93xx46_read(void *priv, unsigned int off,
 
 	mutex_unlock(&edev->lock);
 
-	return err;
+	return err < 0 ? err : bytes_read;
 }
 
 static int eeprom_93xx46_ew(struct eeprom_93xx46_dev *edev, int is_on)
@@ -258,12 +259,13 @@ eeprom_93xx46_write_word(struct eeprom_93xx46_dev *edev,
 	return ret;
 }
 
-static int eeprom_93xx46_write(void *priv, unsigned int off,
+static ssize_t eeprom_93xx46_write(void *priv, unsigned int off,
 				   void *val, size_t count)
 {
 	struct eeprom_93xx46_dev *edev = priv;
 	char *buf = val;
 	int i, ret, step = 1;
+	size_t bytes_written = count;
 
 	if (unlikely(off >= edev->size))
 		return -EFBIG;
@@ -304,7 +306,7 @@ static int eeprom_93xx46_write(void *priv, unsigned int off,
 
 	/* erase/write disable */
 	eeprom_93xx46_ew(edev, 0);
-	return ret;
+	return ret < 0 ? ret : bytes_written;
 }
 
 static int eeprom_93xx46_eral(struct eeprom_93xx46_dev *edev)
-- 
2.45.1.467.gbab1589fc0-goog

