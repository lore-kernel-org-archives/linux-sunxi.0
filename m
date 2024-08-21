Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AE9E17C7C9
	for <linux-sunxi@lists.linux.dev>; Wed, 21 Aug 2024 21:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724277457; cv=none; b=R5kE2bryl+epK2NQ94fM6KL/40tqRRPUMYT3OE2jdOLcYgFoFnHmgxRSfc/2y/8OI5249igDjWb7E7Y/PYQA8mGYAFjwFmm1PEafzy1Cve/I35HJHXA6Wz6brJE3v8NfXY00WaYCvJR/2P0bhcmm5uttwNxI9rfwsXqHMhHxmfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724277457; c=relaxed/simple;
	bh=HEzJDDA7iAbH6s2K1+1fGk+8dut+cJutnjgJj/HWYcU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=E7OdKlV9ZPgGvIjzQQPBKr87QM6SMh/S+WqDEVmyaKfZWXOtSpFCMQ/nPcHkxK59Bh6VX1P9R/hCpzC0OcPHzZcch6CpWnP6VYg+dxtaknVq4HGqa51tHTFuvtwBxU8Fzdjjx6ooqeNY+/AJJP/Pz4g/XDlbpucp++VJXHcPbo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=byzb+C2f; arc=none smtp.client-ip=209.85.167.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="byzb+C2f"
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-3db145c8010so85810b6e.3
        for <linux-sunxi@lists.linux.dev>; Wed, 21 Aug 2024 14:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724277455; x=1724882255; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eGT2rYhH6YuMr14pdSYvfteEm0BRhaU6zPY4wR7HVp4=;
        b=byzb+C2ftFO0oK5Z7IbPiIoT7MDkCvSkR2kufrc8qDrvvViXWcIG0BSsdRF/bRKTl4
         qWn/xYoyWWI+1Z0dfM9jHbWsaF7Ln6pfoBzX/E2c8uEIvNJCMaTBAHsR+Bss3F4T1Y20
         I4pO94Q3homb1E7emWcpn1OvIKnKJKb0lIRpdnohko11eLeI7AKqAkyqTYHXLytDdGoe
         LjQUgWkehYWPKnWc/EfRV3qhM4ydjf/SF0hY1lP4Ct3ewkg+PEAfnzRPIiObdjN4JUN/
         YFhtISMXynENM3CbIRb3V5CujEfv1o3EuU3jTAoZXfR+4AzD1jYCpz/LOHoRmi1f+TsC
         dcIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724277455; x=1724882255;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eGT2rYhH6YuMr14pdSYvfteEm0BRhaU6zPY4wR7HVp4=;
        b=QpapbkxDfX+P+qdv+NWeuj7l7C9WlWzE9D7XGKNFfnmnlHKMoDJAEU207zmVnvRYcz
         oAlT0BXFD2egXZfK/ahM8QnwUEIIrZ1Ayqjqbsc+iX0jhsutHSwCBmXj84Cl10dPnLAq
         shAocxyR0MTh0rT5wnUhRuE+OeWyO6WRWVrKmm+DAuza9YEb1EOiPVGIf0NAuPL+SXvi
         qsoNOqmR+1w2VQn2Le1HUPJBieHkBA18NFrpkhY/zubE11M9EalqSIkWNMx0AfIJDg9l
         N+lCHCirIxwquG2PFZJJVIFJW0lpJ9+4YrLkSozUl32wRzFig/6QlVnvJ9KZErL7iEEf
         jUsg==
X-Gm-Message-State: AOJu0Yzc96wDY9ecCui8xNFKzRu3t3dmifrX/LRFvA+mdW7hfbIwqpal
	aYhfvwh+0PrYByIw5wTGZM8RWqZsT/ku/JWP0AezjhJz+L6FWmYrGqgH7A==
X-Google-Smtp-Source: AGHT+IEmT0SJ8vvDWIKk0B/Tu72b9Who0S3hIvcO8+XPXOzOeiFwLu8KNdeN2Ow74HXfM0m1vgZkQQ==
X-Received: by 2002:a05:6808:1203:b0:3d9:27fc:158f with SMTP id 5614622812f47-3de1951eed3mr4146574b6e.29.1724277455261;
        Wed, 21 Aug 2024 14:57:35 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bcf:81a9:2325:e0f7:7376])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3de225555b6sm47070b6e.17.2024.08.21.14.57.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 14:57:34 -0700 (PDT)
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
Subject: [PATCH V4 08/15] dt-bindings: iio: adc: Add AXP717 compatible
Date: Wed, 21 Aug 2024 16:54:49 -0500
Message-Id: <20240821215456.962564-9-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240821215456.962564-1-macroalpha82@gmail.com>
References: <20240821215456.962564-1-macroalpha82@gmail.com>
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

