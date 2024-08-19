Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A09AC178383
	for <linux-sunxi@lists.linux.dev>; Mon, 19 Aug 2024 16:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724086132; cv=none; b=p1KzKtvPY4FgdIGTe9r8VCbaiYUwq8f6bViKdB4OhhqgfKZHhsWjdF8RPczRUkjg9FV+KNVWRuLGNQJ5Va7PDrz7K/+YOHEn2gYQCs8AghbxzIC8CxpTIS2QBFnNihQImPpyf2iDa9aIjC5xUUlRsgICpopJNMmy+cjrOxu+rwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724086132; c=relaxed/simple;
	bh=HEzJDDA7iAbH6s2K1+1fGk+8dut+cJutnjgJj/HWYcU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ny6JrI05YTzRRCtQbztFZsw3A2zGUucBW6HLmNGejS5no1z6wajKi8l5+l7U754Y1HiyAdhLpaaFJtm87hkhqiDxryy1+tTNbAoaJpGYR8S/OtzAmegD4DfN1qpR+Q8F98rzgpodDW0doeJuF9oGztPzjTJh47ycn9cUO4iC/F0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TUMxNbZY; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TUMxNbZY"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-709346604a7so2211462a34.1
        for <linux-sunxi@lists.linux.dev>; Mon, 19 Aug 2024 09:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724086129; x=1724690929; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eGT2rYhH6YuMr14pdSYvfteEm0BRhaU6zPY4wR7HVp4=;
        b=TUMxNbZYaFA9ct2RG/VZw4vVB/5wlIH5Ajbsm9Jj+HH0sc8uK7Oz44J6/LUycNqMRo
         lzFxYryct3dheRG1OmbixLxVTmdf7cCwCUFC56DR/ljifKHfMSUN5bXobSBes1JC/apG
         P2hMY6famrjZbNIfnKZRzqOVPqXzMio6DpE2uUWwnppIODPi2VCpXVlgzwHpKXm3LM1K
         FJjujclbaF4aia5mX+6vVJxMgeV65MqN1qajRLj5Kqs7wR7OtQOMlrSwasLsetuqwyJb
         k4l6SGIyQO3cPSoVEY1rZth4PKs2F4+z3VNjzgbrEmW9FDlPuksjWHRx+HhSEIhEDoLZ
         ebkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724086129; x=1724690929;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eGT2rYhH6YuMr14pdSYvfteEm0BRhaU6zPY4wR7HVp4=;
        b=YPJwRwG1Yx3FGh/kNdJ7E8xLuStLBoBFa0DJm3/GG/J7XKRxqunSbtuTFHb77BQWJg
         DxmCIF8D6F3tNzASrOVYgBKQw1VoSDf7Ua3QlrjHIFwyPL+1/Es5SJOSRvd0c1VwUASN
         kXlLJW/BpK8joYrNLnzudYJNW9emRu7BN+9LZl+gcJSaRX4lgY5Lqm6RhDCMijoWRk3l
         e0wKBQzd19C32RQ+UpjtE3lcXxHWcRaYz/YeR/ZfM+vhDI3ZiO121YhOh5ccZmpLKS0V
         WlWHTlsiusQBUxSF0RyMCMqIWn+nSAMocyq/Q6cGVik0itSVo9ypQLAJEYZ++0eBEuex
         c4gw==
X-Gm-Message-State: AOJu0Yy9fjdKE7seuxgTXtrHkGAuu4uId3BiBtsADenoR4MUNCwx8GHf
	zkXvhI4P1fMgEEHVUvkdajb4J2QcJO5EjHpwP9UYjOnzI4/qtwvwjdzpTw==
X-Google-Smtp-Source: AGHT+IHwC1bOkEu3UpOsz6uuWZJRs5JKYc9Qep4yjBeJPfyuZ2QbVvJZLOVGJiYVt7QAbcg5B43E8g==
X-Received: by 2002:a05:6830:6088:b0:709:33b1:fc38 with SMTP id 46e09a7af769-70cac8d59b7mr16910408a34.29.1724086129542;
        Mon, 19 Aug 2024 09:48:49 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bcf::54])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-70ca649c61csm2332428a34.26.2024.08.19.09.48.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2024 09:48:49 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-iio@vger.kernel.org,
	quentin.schulz@free-electrons.com,
	mripard@kernel.org,
	tgamblin@baylibre.com,
	aidanmacdonald.0x0@gmail.com,
	u.kleine-koenig@pengutronix.de,
	lee@kernel.org,
	samuel@sholland.org,
	jernej.skrabec@gmail.com,
	sre@kernel.org,
	wens@csie.org,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	lars@metafoo.de,
	jic23@kernel.org,
	jonathan.cameron@huawei.com,
	Chris Morgan <macromorgan@hotmail.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH V3 08/15] dt-bindings: iio: adc: Add AXP717 compatible
Date: Mon, 19 Aug 2024 11:46:12 -0500
Message-Id: <20240819164619.556309-9-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240819164619.556309-1-macroalpha82@gmail.com>
References: <20240819164619.556309-1-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

Add compatible binding for the axp717.

Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 .../bindings/iio/adc/x-powers,axp209-adc.yaml        | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/adc/x-powers,axp209-adc.yaml b/Documentation/devicetree/bindings/iio/adc/x-powers,axp209-adc.yaml
index d40689f233f2..1caa896fce82 100644
--- a/Documentation/devicetree/bindings/iio/adc/x-powers,axp209-adc.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/x-powers,axp209-adc.yaml
@@ -37,6 +37,17 @@ description: |
    3 | batt_dischrg_i
    4 | ts_v
 
+  AXP717
+  ------
+   0 | batt_v
+   1 | ts_v
+   2 | vbus_v
+   3 | vsys_v
+   4 | pmic_temp
+   5 | batt_chrg_i
+   6 | vmid_v
+   7 | bkup_batt_v
+
   AXP813
   ------
    0 | pmic_temp
@@ -52,6 +63,7 @@ properties:
     oneOf:
       - const: x-powers,axp209-adc
       - const: x-powers,axp221-adc
+      - const: x-powers,axp717-adc
       - const: x-powers,axp813-adc
 
       - items:
-- 
2.34.1

