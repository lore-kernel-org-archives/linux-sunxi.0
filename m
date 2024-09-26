Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 037B916087B
	for <linux-sunxi@lists.linux.dev>; Thu, 26 Sep 2024 16:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727366933; cv=none; b=a4fWeSzU2PA52k4QObgWgO+kNzL1KoOsytPYi22Zp3tm8EITbqKnDEYpb+xbwUjIz3SEmXhwDoyLHRUsEjkofR1JuK7C2fkDMhrquUnxeeiq0lMCs8qFlJoDcXhQVZNxYJytpdArFRFYyv+IlWC2uUmAQIbjcreAS3XZ05ebx2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727366933; c=relaxed/simple;
	bh=xTmIMKWrAEJ2sxUaBzK8+gdHqeGN97Vi3rD2yxlm2m8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tZFB6pJdOYf6hHtR5R6rRdrYEvpZ0tjobCKKD7TnocwIpumti/CulWDauKs6toVB2hP+bkW+ELzccFDRkPRokKijEK36v96Kxh7dgRSZ/+fSk9GbqA9xzpQgMMqb6SuEtVrMj90YL1Wnby0S+iMUyzsXkaKnUJIz6KG65/PXtSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LHD8Vq56; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LHD8Vq56"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a8d2b24b7a8so431331266b.1
        for <linux-sunxi@lists.linux.dev>; Thu, 26 Sep 2024 09:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727366930; x=1727971730; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GfSfRbf6HpAPUG9dd1ayagyvrPMaeTlKhJpm5dY0lEg=;
        b=LHD8Vq56KBjbXQl14raiiBU6T5a8kpSjYOoCWYS8+anNAqhwYeY7dMMNwRweD0UWh4
         RVTaMXGWoGclcIZ0s1+xwm/bS1cGIT00uJ0hDXF9XrOTQvat3B+dLtfowZox//4OWzxU
         u2vtthjmTophtmk3GH8tZyXCsNY3o5ibrDRKwtIEGJBrkCOdpHMmTLzJwu6WdJOfJfpu
         gIX3t2wewdcPj0KJ1z+pbjrxHs2TGG2W5M9xKdaDTWyusA6h+By8MBwsNHmLM22M97fx
         hz6t/TdpDxNuqz7nA4imOPktyPs0r2qrkUsxzdQ/Hoglq4O7PFCW6aJKcS1m+d5fMdcC
         GQ+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727366930; x=1727971730;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GfSfRbf6HpAPUG9dd1ayagyvrPMaeTlKhJpm5dY0lEg=;
        b=na/PLWVEcXOQ6e0DeigmTior+P05GtRwUpPpCETeC+OEBd5P1kNx/PQHOus2jhg/kO
         GtORem5ZCW1A7w0sXO7uw0XemMmDzHn7w8TO+VgOj602gpIkwsljks9b9mNlgLkD5I5x
         rWQ/dzihL1VT/m410ErEqdembz/u6uJpHwRPeXt2kYC4l9PwZgVV2/cxl/YjdoOjAYil
         zL8hIpQyXWwnFwAl+XFH+vK5UKz5RjUn6dsQafHLZY8scHvH/vf1TYtLa3sCaEwdheJ+
         gTuR6tqzdYv/NdzQIaa4oenUQdutyHnFV5lJfiLrXm0qmlZyNNu6eaWOOcffpXZozfp6
         AseQ==
X-Forwarded-Encrypted: i=1; AJvYcCWSclalTd0bYRzNfsLSrB7luhiWqySV2b0kO1wQAGpKCLK60ak1VAQseTps4GpceabSgvtw0Z+WxcHg3g==@lists.linux.dev
X-Gm-Message-State: AOJu0YyHnQU/ASW0UIbtqhALxLPGa7s15XBybOu1D9U7owi948zRAXQp
	DkDxg/tkbiFXAuFghf9llqYtuR1ZVP8FcqDChhnWM+8OZ/zSZc00xHSLxYfD
X-Google-Smtp-Source: AGHT+IEa8ZK99gytPYhlMMIfBCh2WLdWCb9VYkK2bIOBiKcxBkDWAAatz/BvNKwWyUydN132lAq7Sw==
X-Received: by 2002:a17:907:d2e5:b0:a8d:5f69:c839 with SMTP id a640c23a62f3a-a93b15f92aamr392676866b.15.1727366930195;
        Thu, 26 Sep 2024 09:08:50 -0700 (PDT)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-6d88-4cd9-a9d4-f267.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:6d88:4cd9:a9d4:f267])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c27c70d3sm13947966b.78.2024.09.26.09.08.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 09:08:48 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Thu, 26 Sep 2024 18:08:40 +0200
Subject: [PATCH 4/4] iio: adc: ad5755: use scoped
 device_for_each_child_node()
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240926-iio_device_for_each_child_node_scoped-v1-4-64ca8a424578@gmail.com>
References: <20240926-iio_device_for_each_child_node_scoped-v1-0-64ca8a424578@gmail.com>
In-Reply-To: <20240926-iio_device_for_each_child_node_scoped-v1-0-64ca8a424578@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 Lars-Peter Clausen <lars@metafoo.de>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Michael Hennerich <Michael.Hennerich@analog.com>
Cc: linux-arm-msm@vger.kernel.org, linux-iio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727366918; l=1682;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=xTmIMKWrAEJ2sxUaBzK8+gdHqeGN97Vi3rD2yxlm2m8=;
 b=PgLKXJGq2MweGHIGTLRvljlOM7oxtbS7Y8PJM25aEBf0vmjeCKYh8ES4/Km4e2w0Irtx2nvj1
 ddQdkAH4KPBDo3JfVnrEyLrV2hVMi0/5mNJUuT+Hf4ES1FMXY9K209/
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

Switch to device_for_each_child_node_scoped() to simplify the code by
removing the need for calls to fwnode_handle_put() in the error path, in
this particular case dropping the jump to error_out as well.

This prevents possible memory leaks if new error paths are added without
the required call to fwnode_handle_put().

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/iio/dac/ad5755.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/iio/dac/ad5755.c b/drivers/iio/dac/ad5755.c
index 0b24cb19ac9d..05e80b6ae2cc 100644
--- a/drivers/iio/dac/ad5755.c
+++ b/drivers/iio/dac/ad5755.c
@@ -699,7 +699,6 @@ static const struct ad5755_platform_data ad5755_default_pdata = {
 
 static struct ad5755_platform_data *ad5755_parse_fw(struct device *dev)
 {
-	struct fwnode_handle *pp;
 	struct ad5755_platform_data *pdata;
 	unsigned int tmp;
 	unsigned int tmparray[3];
@@ -746,11 +745,12 @@ static struct ad5755_platform_data *ad5755_parse_fw(struct device *dev)
 	}
 
 	devnr = 0;
-	device_for_each_child_node(dev, pp) {
+	device_for_each_child_node_scoped(dev, pp) {
 		if (devnr >= AD5755_NUM_CHANNELS) {
 			dev_err(dev,
 				"There are too many channels defined in DT\n");
-			goto error_out;
+			devm_kfree(dev, pdata);
+			return NULL;
 		}
 
 		pdata->dac[devnr].mode = AD5755_MODE_CURRENT_4mA_20mA;
@@ -800,11 +800,6 @@ static struct ad5755_platform_data *ad5755_parse_fw(struct device *dev)
 	}
 
 	return pdata;
-
- error_out:
-	fwnode_handle_put(pp);
-	devm_kfree(dev, pdata);
-	return NULL;
 }
 
 static int ad5755_probe(struct spi_device *spi)

-- 
2.43.0

