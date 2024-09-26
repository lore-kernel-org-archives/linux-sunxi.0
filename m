Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A55315AD90
	for <linux-sunxi@lists.linux.dev>; Thu, 26 Sep 2024 16:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727366928; cv=none; b=Ea5LLG3NXmDwvqlSaPVlZCYn4ToA0eCC1MYN41wSpgnuQzQE8BnU2C0Mp7AkntV+yJkbf3FhL1O6934bZPH44e3/S/dr4CMRyP1gWSMhMgDyHLxKtBiImzIWnOInh+f9KZeBm5Er1P3DLBc6zFAdVLe45JI7LhWO/qk0EY5irpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727366928; c=relaxed/simple;
	bh=EJRXbPr61KxXV+wd3zzOVNML9/DOwfwUtS+ORGYy5xE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rfAWZ+9gqlw3S7VFJCD6jqQw4qngvzZLF0wJ+PckaGszzOotwTmxU7sczDDe4LNZkCWnk82sLtmWQjdc01WjpvkGLdeT7uY80dKGdS7hiVaw5OSsqSVM4Vej3cIVsvyWObCXKbtXbtgKeIFMR+omVX9v6yWyRfEMQmYgj1runbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kn5UHPhL; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kn5UHPhL"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a8d2daa2262so129478666b.1
        for <linux-sunxi@lists.linux.dev>; Thu, 26 Sep 2024 09:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727366925; x=1727971725; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EJWKgDcwHDzRJDVWC4NU1waaLgU2pU4Iy2cHBRbpC9w=;
        b=Kn5UHPhLDf7Q/h76WA8uXp+yJU455TycEnyJIlxTtaelYIJtnmNDByVg5+lGl3Zv7H
         0PY4u34IBwon4YaaCWOB5+e+DdTh+iYm9BLqk3f1AvmnSjukO+nJFU7U7wBSU8neRY31
         g4PZhGs5ALFzKUxuzsP82QoHWNxKBDPeGRSxSPR83uoq3YJ2pNq1kUii/JfFYgrGxmvT
         jqRJttNYU/NuvzUwSL9MWO4giJqL+3zZXdBrl+QNhTufTBAAh16Gr5PNtXHInSAVnnue
         gA048RWcE/l+aBkB0ClqYJ0zcuGgY9O9tdQX/AsBdGQN486jbKgB5BwvStV8CaB72LE/
         DtNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727366925; x=1727971725;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EJWKgDcwHDzRJDVWC4NU1waaLgU2pU4Iy2cHBRbpC9w=;
        b=rTuLCbIBJTVKwiosGJTaIclvveI3EcPD8Ul1e7XO98UrAkTFXBd44k932X4rRYApG9
         wjs0D7BZ0KA2bBRnzXQWAhWkZuSS+rgKUVLg5Zsv2IW0CtpZ4J/TfoVIk3silImegXk9
         n+c3jNuZEHgC8p3nczUb4hwwiQTKoDkRJ+jmsd1SEbmJQ8D1aHuLNeq3U02B0LqY6nAt
         XhuaYheq/qEJqNC2RfyoZ8eqINim8Pb9lJKq9wuUQ6c/mKeMdYa3wN7zpuAaofHCwwUX
         dLbzEy0at380QfnD+ctkZTlxj0jS2BBYCuwrorOWo29EySW32Vlfhzq0CAp9QBNh4s9P
         L53Q==
X-Forwarded-Encrypted: i=1; AJvYcCXH2WER0cyhKm+FIlwhAyH9aeSlbfw1w2URrXgn7i6d+i96E765zY9/2Jo5HAE8yK/E8xWgaiCOP6lshw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwIuy8ur4ZJJErvT4+oyuk60zxOE2vAAVbR6LWHC0E1ry0ot8oT
	6bj34vW4qs1fHDxj+FTlvn7ypyUyXGSdpH9o8FkjasGEF0A5E+1X
X-Google-Smtp-Source: AGHT+IHZdg2jhk2e+Cn4R32SMBMGp+lA/vyCWsLnw2owXMmyeWM65kMhdSp1Pkri3UzB+6nV3OV+IQ==
X-Received: by 2002:a17:907:8692:b0:a8d:44a5:1c2f with SMTP id a640c23a62f3a-a93c48f089bmr2181666b.6.1727366925244;
        Thu, 26 Sep 2024 09:08:45 -0700 (PDT)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-6d88-4cd9-a9d4-f267.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:6d88:4cd9:a9d4:f267])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c27c70d3sm13947966b.78.2024.09.26.09.08.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 09:08:43 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Thu, 26 Sep 2024 18:08:38 +0200
Subject: [PATCH 2/4] iio: adc: qcom-spmi-vadc: use scoped
 device_for_each_child_node()
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240926-iio_device_for_each_child_node_scoped-v1-2-64ca8a424578@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727366918; l=1374;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=EJRXbPr61KxXV+wd3zzOVNML9/DOwfwUtS+ORGYy5xE=;
 b=/f3X+kN5zg9IByr0xsPHywl8fBIPhkGkWyTcEpKXic1JID9p1QUtQZw+Rxv8rHnGNjltXPBXJ
 CEaXlT1j7D2CSGsPT/HYk1mzjnkj0PWoA3Ziq1lLMmt1Wlmh7WukNL8
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

Switch to device_for_each_child_node_scoped() to simplify the code by
removing the need for calls to fwnode_handle_put() in the error path.

This prevents possible memory leaks if new error paths are added without
the required call to fwnode_handle_put().

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/iio/adc/qcom-spmi-vadc.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/iio/adc/qcom-spmi-vadc.c b/drivers/iio/adc/qcom-spmi-vadc.c
index f5c6f1f27b2c..00a7f0982025 100644
--- a/drivers/iio/adc/qcom-spmi-vadc.c
+++ b/drivers/iio/adc/qcom-spmi-vadc.c
@@ -754,7 +754,6 @@ static int vadc_get_fw_data(struct vadc_priv *vadc)
 	const struct vadc_channels *vadc_chan;
 	struct iio_chan_spec *iio_chan;
 	struct vadc_channel_prop prop;
-	struct fwnode_handle *child;
 	unsigned int index = 0;
 	int ret;
 
@@ -774,12 +773,10 @@ static int vadc_get_fw_data(struct vadc_priv *vadc)
 
 	iio_chan = vadc->iio_chans;
 
-	device_for_each_child_node(vadc->dev, child) {
+	device_for_each_child_node_scoped(vadc->dev, child) {
 		ret = vadc_get_fw_channel_data(vadc->dev, &prop, child);
-		if (ret) {
-			fwnode_handle_put(child);
+		if (ret)
 			return ret;
-		}
 
 		prop.scale_fn_type = vadc_chans[prop.channel].scale_fn_type;
 		vadc->chan_props[index] = prop;

-- 
2.43.0

