Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 690F915B137
	for <linux-sunxi@lists.linux.dev>; Thu, 26 Sep 2024 16:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727366931; cv=none; b=uKq+yf6+IL3AWGMqztmrvOQzvNpMSsw2bTIyn3SU9yp5vMk3Wge1OZi1XevoUmS2L7WXCvOhUOfshQ0nnb/g9E7OzMAFG9Tnvn94Ieqnj5siJx4Ob1BlZRcSGDmpfOHPJrHraXZb19ZLlmw4bQLIfoj94kdLy9zcOZTNMooSHmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727366931; c=relaxed/simple;
	bh=TlZo/sfYlYA7rfrWUOIFpqQSC+0+ci/zValTOgfTA5M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JA3/0DN7kusrGy7GSoMp0eyf9XS7awPmfOIAzbM+XBJDLIma7Po+r/hxtTUJrppFQw9cuNe+5ccnjrMb1oS9n+d+yuhFJx7pvcoD3tJsaAVuxKh/20GC1izJCvxoqQtbzFIkkXkdkB+SaJ4YXr1WDlNTws6lGmh+C/qqEoT5HE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rx+vx26F; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rx+vx26F"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5c5b954c359so1226971a12.1
        for <linux-sunxi@lists.linux.dev>; Thu, 26 Sep 2024 09:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727366928; x=1727971728; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w5foGMs+KnPV1j1E6JrJyJnRmk35vw0P+oTGPUMwklc=;
        b=Rx+vx26FrTKslI1YDTSNB8dBHIcFpV2Qiu4fS2VrrO3iEIMFyW4P6hjMTlcXoLptR2
         2M6ncYc7PqnrImUP4PcOUUpMXGfG3Q1tgk3sd+m1JPKEYYjJUMT2Cuf2un03jpih9WXl
         X4V0LA2GXggV+twEIxtW0ypilFILICy0jwU8cY3EuvM9QYGQ4m+jlH20nI/S67tS5HUs
         A/Oo6z4K3gtH43aX8ggUgbLHx6LHwVSTJuWxvG4EnJxJAJV4OcuPw1gLjuxh/E4fspAs
         a6Kk5htIGNdAh3B0ArUF4fbZRO17KSTtS4D+zo/zYpZM3qf3yPa2NnmrDIq16WhMIbio
         2LUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727366928; x=1727971728;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w5foGMs+KnPV1j1E6JrJyJnRmk35vw0P+oTGPUMwklc=;
        b=DYHDRCS1kpf13/8xqqS1z+KXz3JocsTsjPHzE8PsfBjlTtakuh1vyDI5Pn6QBTJYCc
         07ax0bOoQ1tohoTIDjcAGNITqRfaHPiX07so9uIox6FGbRBex86VHdUXDiFaFRN4jPf9
         GgP1f5Q5e41P0PAsW+NrWYC2l8/FBmFI4n/x5L0iEvUL1/auuFqFpTgO31vVXC9R7Ild
         JVfC134as59BnQ3nRfoPX2u0M2GWEI5eBGPKMRAdTNELm9myRzCpD+xHeeoN1D1v4oLg
         YUbTCZfuvJnjQ4qkUCTgeOz6W5dPzjLn3ghzfI4P8PYyiiyeEo3p5droYWRE0UVPw06/
         VUaw==
X-Forwarded-Encrypted: i=1; AJvYcCXu68BPdWnT3JBQDLexwoSZS94S1WFG0YY2Z3V8+SNPlu9sRXFUklXPXPIgOm8t9ngyDjzplYlONvJVVA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzf4vbznVev2jS9rZAPUJ/efV/n9qniKDRTbMktF2/ugjuTECwl
	vqQAy0518y2Be10eUcEIKJdNuGyexYFLrkOrnNG+rEhzprVLCbIg
X-Google-Smtp-Source: AGHT+IG8rSfCQ1OjrEgIGoq/mqJNnCJSIS953PFQJ/ktEiwAsnotpjZqlq72ENG7UQlOBtBc3cSxAQ==
X-Received: by 2002:a17:907:3fa6:b0:a8d:3085:a7b1 with SMTP id a640c23a62f3a-a93c492abdfmr1068966b.38.1727366927568;
        Thu, 26 Sep 2024 09:08:47 -0700 (PDT)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-6d88-4cd9-a9d4-f267.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:6d88:4cd9:a9d4:f267])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c27c70d3sm13947966b.78.2024.09.26.09.08.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 09:08:46 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Thu, 26 Sep 2024 18:08:39 +0200
Subject: [PATCH 3/4] iio: adc: sun20i-gpadc: use scoped
 device_for_each_child_node()
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240926-iio_device_for_each_child_node_scoped-v1-3-64ca8a424578@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727366918; l=1419;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=TlZo/sfYlYA7rfrWUOIFpqQSC+0+ci/zValTOgfTA5M=;
 b=osh0N4BGJ8X6iPBsv2lwnI+w/XSuQcRZonFjjaGdfwgJtIr0AXEz6v13uyuHef+dxe3n5rN+z
 f8Z7K/XNIOHCJeKtha/xtrGWD/+0tKPLs29XzedI9TTKVHHjK9RDI5r
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

Switch to device_for_each_child_node_scoped() to simplify the code by
removing the need for calls to fwnode_handle_put() in the error path.

This prevents possible memory leaks if new error paths are added without
the required call to fwnode_handle_put().

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/iio/adc/sun20i-gpadc-iio.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/iio/adc/sun20i-gpadc-iio.c b/drivers/iio/adc/sun20i-gpadc-iio.c
index 6a893d484cf7..136b8d9c294f 100644
--- a/drivers/iio/adc/sun20i-gpadc-iio.c
+++ b/drivers/iio/adc/sun20i-gpadc-iio.c
@@ -155,7 +155,6 @@ static int sun20i_gpadc_alloc_channels(struct iio_dev *indio_dev,
 	unsigned int channel;
 	int num_channels, i, ret;
 	struct iio_chan_spec *channels;
-	struct fwnode_handle *node;
 
 	num_channels = device_get_child_node_count(dev);
 	if (num_channels == 0)
@@ -167,12 +166,10 @@ static int sun20i_gpadc_alloc_channels(struct iio_dev *indio_dev,
 		return -ENOMEM;
 
 	i = 0;
-	device_for_each_child_node(dev, node) {
+	device_for_each_child_node_scoped(dev, node) {
 		ret = fwnode_property_read_u32(node, "reg", &channel);
-		if (ret) {
-			fwnode_handle_put(node);
+		if (ret)
 			return dev_err_probe(dev, ret, "invalid channel number\n");
-		}
 
 		channels[i].type = IIO_VOLTAGE;
 		channels[i].indexed = 1;

-- 
2.43.0

