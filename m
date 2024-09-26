Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CE033D97A
	for <linux-sunxi@lists.linux.dev>; Thu, 26 Sep 2024 16:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727366926; cv=none; b=J5mWPGsyiO6AzPtk6uQAMWx14CQsrkmbBKWnEJi5KZQKMwiN17Qg3UBlAK4ipopd82LuUzxnqoeECJeI7vVEzfHFxBS3mTVO/BxhrfVyhPbO0YYf2yoIRPVm06ouyuvphVSoUjtASUiILD3xbjzy9Jw1U2o1CyJt3xiJUW+Ls+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727366926; c=relaxed/simple;
	bh=+7rr+FCJ6AKEfSNXljsUP6cpWRBmO490u2jfv3txKV4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GDHjl8wGePIJkEFfAHbk7p44nQYUKFGpfopjUe/2/4zSlJM3yuIW82fQrANdy1nBuRfQprQsSqwqW1VXweQ8u+xbIiCrYlklJ5V6D6H2p/yZT7f0Hh+Q7Kzf2PuTtumhhqMvCiTlHRytDbMjEo6y3a8lzDsEUs9zybIFuQ6W/ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IklY9rGM; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IklY9rGM"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5365cf5de24so1613023e87.1
        for <linux-sunxi@lists.linux.dev>; Thu, 26 Sep 2024 09:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727366923; x=1727971723; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i5gKs28PIZ9OJchaPijaHDwFlIvvXwx3mdFdZLIkcJU=;
        b=IklY9rGMtRIASbjaxVRdKBb7QIVDTKNds7cY+HmvSKjDbqVYBSE3/0v7l1XWTTry3f
         T2+/mFtUZJBK5MR7YSuCaRX7++CxAlM2oPNaHuZoy296O9tRT5rIZHBz0kqorRYPyMg8
         62G4KFFS8aPaKg4NURBGo72elcZBHF14PRotncby2KuWgxmrVlCHuxe/emqshtQUoQTf
         rtxGxQv8tApnYavQ3hK8xgH0AwPfl2lIGbGLOrNs9H/GB+8FyuZhUywHwg8h0vBtqKfc
         6zw9vP1fU7zmUHTXeM6pz/FGJCcNJ6x4r2apAJStQ7dBqRihJgxEP8S79q75VLKYADu7
         Xk4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727366923; x=1727971723;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i5gKs28PIZ9OJchaPijaHDwFlIvvXwx3mdFdZLIkcJU=;
        b=G7wC6lC4pGPTogb3YNeaoD7fHZM0ArSTkoUSK3kvYYkGUy3RceASNougJL6Ek689+H
         iJL+yipD1HfHL+DCUgUc8Znd4vnxFK+U6MVo4nvDiCVRINIyTdXDdvPvsNiBKQKJFTfr
         AoYQ5nvzm4+RE8ZD9uBwUp7rr1y9MZ2RZC4quhfagZyK/1U827go7LvYPLQMGsJASuOA
         4Ajy+clJ3g5E7I7ULll0PW0f0sBReDS72AMKkN52gfQMxU6Q3zKTKFkVcjCKjduOJI6X
         oNKfCqPnsngZoLdc3SxgKvwaplbpZW9jk5YX9qj/C/NmDbX6m2Xto/ctDBir80Z+EmN3
         nu3Q==
X-Forwarded-Encrypted: i=1; AJvYcCUnMjw+DFAg5m8rZeq5tNmcbnl7I6hMyKMMU91xi7JKzcVWCFiZu0uJoe8wdt522auJWp7ag/55BZwm9g==@lists.linux.dev
X-Gm-Message-State: AOJu0YxFNj6Y7gn9HuFXR5/yQ4Y8w8hIprsGetRszRma6xWPMLgI/iqs
	KOt6KW2npwiNnnVBjoSpoUZ9En6pf3h5MbAJDLEoQ2AUZrYiS7l2
X-Google-Smtp-Source: AGHT+IGLWzwtVsVoERLcNZJXmgDmyiGB9Y0BA8D4DZOrd3E+mXlHlQRe8hXYareII+TVH+5IvvXpAA==
X-Received: by 2002:a05:6512:118e:b0:536:a4d8:916d with SMTP id 2adb3069b0e04-5389fc4d0d6mr73847e87.34.1727366922442;
        Thu, 26 Sep 2024 09:08:42 -0700 (PDT)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-6d88-4cd9-a9d4-f267.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:6d88:4cd9:a9d4:f267])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c27c70d3sm13947966b.78.2024.09.26.09.08.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 09:08:40 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Thu, 26 Sep 2024 18:08:37 +0200
Subject: [PATCH 1/4] iio: adc: qcom-pm8xxx-xoadc: use scoped
 device_for_each_child_node()
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240926-iio_device_for_each_child_node_scoped-v1-1-64ca8a424578@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727366918; l=1388;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=+7rr+FCJ6AKEfSNXljsUP6cpWRBmO490u2jfv3txKV4=;
 b=sqgXoB41yns5o3RxNgTQxLX7a9d1ns38jgO9CICIOPLIHhpk3IrwcW0xk/EqE/0KHISg3Zupw
 NRY4WuSZt3QB53sR21L3VYD5YsVriYRanA8iMQlfuAM4Q7yT0YwUlxi
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

Switch to device_for_each_child_node_scoped() to simplify the code by
removing the need for calls to fwnode_handle_put() in the error path.

This prevents possible memory leaks if new error paths are added without
the required call to fwnode_handle_put().

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/iio/adc/qcom-pm8xxx-xoadc.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/iio/adc/qcom-pm8xxx-xoadc.c b/drivers/iio/adc/qcom-pm8xxx-xoadc.c
index 9e1112f5acc6..311e9a804ded 100644
--- a/drivers/iio/adc/qcom-pm8xxx-xoadc.c
+++ b/drivers/iio/adc/qcom-pm8xxx-xoadc.c
@@ -821,7 +821,6 @@ static int pm8xxx_xoadc_parse_channel(struct device *dev,
 
 static int pm8xxx_xoadc_parse_channels(struct pm8xxx_xoadc *adc)
 {
-	struct fwnode_handle *child;
 	struct pm8xxx_chan_info *ch;
 	int ret;
 	int i;
@@ -844,16 +843,15 @@ static int pm8xxx_xoadc_parse_channels(struct pm8xxx_xoadc *adc)
 		return -ENOMEM;
 
 	i = 0;
-	device_for_each_child_node(adc->dev, child) {
+	device_for_each_child_node_scoped(adc->dev, child) {
 		ch = &adc->chans[i];
 		ret = pm8xxx_xoadc_parse_channel(adc->dev, child,
 						 adc->variant->channels,
 						 &adc->iio_chans[i],
 						 ch);
-		if (ret) {
-			fwnode_handle_put(child);
+		if (ret)
 			return ret;
-		}
+
 		i++;
 	}
 

-- 
2.43.0

