Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2E7717A597
	for <linux-sunxi@lists.linux.dev>; Mon, 19 Aug 2024 16:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724086131; cv=none; b=JJx7F0SfCA5qbV2y7dyMsODf85qa8wMUNvG+P9X9RFd/1tnfQynzdesrUiOv1KxFCcpipcAT9W6aI5dWaAu5sI0oyR3t/VFL+FImGfLE4UoVndw8vDd79BeVp0mCWV/5jtO0jtMP0k7B3hG1MugV73PElbHmJBIuWrNVZ1OEQUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724086131; c=relaxed/simple;
	bh=16TxacFQRSnmxQxajH2B5k39AW2lRgjLC38Elp8ySLw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Qf6qEuGvnZr/BH+n1J1fOehMter95R/+vUknC0CLwY28enX1u3fj9yUKfa88fAVOi/zDFVFB3F2c/zS3WdZ8mz2wDdANWaHHCuWKPvhaqIQNySlUamtbZLmlaWt+VV0MctzoG1Sut1lMtCra3mnKeHMTwT1JCPn+RC4X3WDRx94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L0QYFB3J; arc=none smtp.client-ip=209.85.167.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L0QYFB3J"
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-3db504ab5f3so2430754b6e.0
        for <linux-sunxi@lists.linux.dev>; Mon, 19 Aug 2024 09:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724086128; x=1724690928; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RkkzIKfrsu8xLnQwZgjeVDvaKU/MUJN67PA3Rk4p0CM=;
        b=L0QYFB3JXhWdVTEFkyFhr3SM2oD2g+QFm6+1A5c0qQcLvX6iICKY9xvQXINoAhh+L+
         X8fxX0wZDPnOZeURNDHOC9qAEAzGWrNuuAFdJVsogeexAX3J9RNTfY5px+r3wLLVJl1L
         gZkL68tEBfY8nARJm4fPaqWNX2NgpE4+YoTzm1Kp7V2ag/+UXBEjX8tG1MtrnrjeUF47
         r2dpVYLr6oP8DRH6qqF4nqmqjySU3oK2lMds7uuYWhXvZoAb4/OS2qVs2mh4ODd2aXJB
         E1JInDCnagWQnkhHji00O6gdYs/z9Kd20cV3QRve/9FqJynF8naao/3sZKOIe0gg4h6/
         PQzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724086128; x=1724690928;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RkkzIKfrsu8xLnQwZgjeVDvaKU/MUJN67PA3Rk4p0CM=;
        b=fETuePtoUvhzX+F2CxqsYUQsO5TDtR6Xq1djrNMJheyw0eNCyEKgSAVJa5PxHtqzW1
         lUQ5aa+JxP+unCwwPSVlMjazZGy7Ebm7uFnNA9NHz2MnwfaOxaW8Hxu4+6CzekEeSaiR
         QOgxuuAYz0GAYmvWRij4uwboIsXkexHjr0F6+AB6vYKxYZr7sFENzOkaDiuG+Cu2fgso
         W0q+CU4EAPJBdh4jlf1PEyknDv6F1aLAwSJN29F6En/dBRvp/XpTWZdE9+k4/qYXfbmV
         8Yn1vyq44xqB79ncO6a4XAFr3jT3ml5VAAUrRojlrBKiVqPEG85dDheXEQk5A7AfxIpg
         lscQ==
X-Gm-Message-State: AOJu0Ywu0jDEAAmpoGdNr6ZL96ygCbw4u3moCg+cO6w+jM+GhVnbwaF3
	Lg01CVAUhRkyRAmoWZDah5TVs9Z5vbDPmnENQ7K12iRtKt5eibeEX93B4w==
X-Google-Smtp-Source: AGHT+IHO+Ajg81O2h/SkAHLfyjith17Lryqw1V96phGP04oeUSBU32OaTyHFcHhsC+FfxE2gv09F6A==
X-Received: by 2002:a05:6830:631c:b0:700:d506:cfe9 with SMTP id 46e09a7af769-70cac8585aamr13557410a34.19.1724086128416;
        Mon, 19 Aug 2024 09:48:48 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bcf::54])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-70ca649c61csm2332428a34.26.2024.08.19.09.48.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2024 09:48:47 -0700 (PDT)
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
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH V3 07/15] dt-bindings: power: supply: axp20x-battery: Add monitored-battery
Date: Mon, 19 Aug 2024 11:46:11 -0500
Message-Id: <20240819164619.556309-8-macroalpha82@gmail.com>
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

Document the monitored-battery property, which the existing driver can
use to set certain properties.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 .../power/supply/x-powers,axp20x-battery-power-supply.yaml  | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/supply/x-powers,axp20x-battery-power-supply.yaml b/Documentation/devicetree/bindings/power/supply/x-powers,axp20x-battery-power-supply.yaml
index e0b95ecbbebd..f196bf70b248 100644
--- a/Documentation/devicetree/bindings/power/supply/x-powers,axp20x-battery-power-supply.yaml
+++ b/Documentation/devicetree/bindings/power/supply/x-powers,axp20x-battery-power-supply.yaml
@@ -28,6 +28,12 @@ properties:
           - const: x-powers,axp813-battery-power-supply
       - const: x-powers,axp813-battery-power-supply
 
+  monitored-battery:
+    description:
+      Specifies the phandle of an optional simple-battery connected to
+      this gauge.
+    $ref: /schemas/types.yaml#/definitions/phandle
+
 required:
   - compatible
 
-- 
2.34.1

