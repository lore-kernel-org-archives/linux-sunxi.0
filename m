Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA10C14E2D7
	for <linux-sunxi@lists.linux.dev>; Wed,  5 Jun 2024 18:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717610416; cv=none; b=OEw+mgDn0uaRjirhIEETixtj0kqw/d4aj6o77NnwvlilAFKHNhNn6XKoaenzNfPXHdGO2H5HzZLiMp1KmSktJ4VEjWECkdbW2pz0i2e5IwDPr/qXyVhAHvctw9yZcC2VIBQnd91G4ubZgMXKKP4zeY1Lwif0p1NVtxd7IfFNriI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717610416; c=relaxed/simple;
	bh=fPdJt4Gydxsb6XLYSRdNJ8hD/W3THq9fKXubquLZs6s=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=i6pO2TMpfF9WSxmEgO2OgQMj+dJxB2O9ZPUNseanigLTQlD7BtCocaUnhG3NIxZlrSfBprkFCXYw4oXWpSwDxDW+dNjlwGkinP6gV7VE76oS46/YUkYaxsln0x6hrQ1WF8mMvYy39CpyJZZZ/x0v8Oz9aGL9L9BspHrFDVUYwuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--joychakr.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MG9lYiqG; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--joychakr.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MG9lYiqG"
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-62c7a4f8cd6so669637b3.0
        for <linux-sunxi@lists.linux.dev>; Wed, 05 Jun 2024 11:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717610414; x=1718215214; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=qvmsbFq1f0xb8qTUeLHIrwaOpt4YNpx3HYdX4+QrPhA=;
        b=MG9lYiqGCamf6f3m98Rnzdn7xSoFHFmwLlyhUKt1LvpoC+htESzConYFkjehjarLQO
         rpVib8xta6HObpQLdbQMMVowdoXTPbtztk+kUh6gg99vTbNkV36jhA4HbUV1PMF1U7FM
         FRIC1BHVgK1EaOLQWjCR6RMNHrsyLdbtpN1dx11ELsFz1xjUGuhl8SklCZS3Cfz6GJNg
         wIeXNOHu85Z4Xq9zfQ9dGbS1MW/vtWvrt8cKL7Fy3fxgxHoCBkSINYrb5tZwloENbWlk
         54Y49wLMzc6UEaVSt+drRE6Vy7JV5F2OmxF7gRtybSjlMziJkyaPyiEyl4RvNeEEvJRu
         sSsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717610414; x=1718215214;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qvmsbFq1f0xb8qTUeLHIrwaOpt4YNpx3HYdX4+QrPhA=;
        b=tNCpefGSS3E1KlnMsxcNOKP3ky8mvpI1lWetZkv1heJj+c54DGoe7tZOWjqovRle40
         Xj24XoHHRZCuPeu+F5CfyD4ksXgwYFUJ3kI8OovssjjWLV5b91NCYhpkqrP/K7I46FR/
         5v+FgHGCIaPC7wt1jDla5Bts1DXsQ2K8vXdM0vN4ba+1X5gGYNPNQC3EbhtPkp/Y/8qG
         qftujHvl/3r0MbmI/ZWAAZlmJAqMTBD1h/YzuFlAnQ3+6hxo2WX9xrhu21cU1N3T5feF
         ajU2r3kCOv0C1u9dk5Dg6p1tn36vkfX/vs1kauNK/jddkIAIXx/b9SToe74EllfpjfeK
         YrQA==
X-Forwarded-Encrypted: i=1; AJvYcCUK6IDo7rfKvks6pRgCReHlrgwvy+6k0dLeVa94GJlbM6HqoK/Tv3+/1MSdjbuvgkUiumJdcIIMNDNXm1ozvLF/w1Pq9RJwR8zqgoI=
X-Gm-Message-State: AOJu0Yy6ktTIKyJ/L1hb9T97dx6WdqM+ihkwDbtO9lAhQ/M27CzEoM73
	O8Ka7ESlT4Wmopc8xbHtKdJSbYp7tvKZc8wUQuKVL488EjvRbxXd/MGO8rzJ6ogV1GwXRsDN5+I
	rzTjK9nL+5A==
X-Google-Smtp-Source: AGHT+IHixjuOYQ1InGCAjmo87JHH7BxdpNaY95UBwdRBHB8eZTSP6/tJXCeai8kdlzm5GsjEUY/q6O3hk54taA==
X-Received: from joychakr.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:6ea])
 (user=joychakr job=sendgmr) by 2002:a05:690c:6688:b0:622:cd7d:fec4 with SMTP
 id 00721157ae682-62cbb5e6bc6mr8437267b3.9.1717610413829; Wed, 05 Jun 2024
 11:00:13 -0700 (PDT)
Date: Wed,  5 Jun 2024 17:59:47 +0000
In-Reply-To: <20240605175953.2613260-1-joychakr@google.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240605175953.2613260-1-joychakr@google.com>
X-Mailer: git-send-email 2.45.1.467.gbab1589fc0-goog
Message-ID: <20240605175953.2613260-4-joychakr@google.com>
Subject: [PATCH v1 03/17] media: i2c: video-i2c: Change nvmem reg_read/write
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
 drivers/media/i2c/video-i2c.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/video-i2c.c b/drivers/media/i2c/video-i2c.c
index 56dbe07a1c99..2bfc221b5104 100644
--- a/drivers/media/i2c/video-i2c.c
+++ b/drivers/media/i2c/video-i2c.c
@@ -151,12 +151,15 @@ struct video_i2c_chip {
 	int (*hwmon_init)(struct video_i2c_data *data);
 };
 
-static int mlx90640_nvram_read(void *priv, unsigned int offset, void *val,
-			     size_t bytes)
+static ssize_t mlx90640_nvram_read(void *priv, unsigned int offset, void *val,
+				   size_t bytes)
 {
 	struct video_i2c_data *data = priv;
+	int ret;
+
+	ret = regmap_bulk_read(data->regmap, MLX90640_EEPROM_START_ADDR + offset, val, bytes);
 
-	return regmap_bulk_read(data->regmap, MLX90640_EEPROM_START_ADDR + offset, val, bytes);
+	return ret < 0 ? ret : bytes;
 }
 
 static struct nvmem_config mlx90640_nvram_config = {
-- 
2.45.1.467.gbab1589fc0-goog

