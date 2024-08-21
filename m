Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00F3317C21E
	for <linux-sunxi@lists.linux.dev>; Wed, 21 Aug 2024 21:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724277458; cv=none; b=YbPG5fv1+XWgOgk0W+/HavXGnUp4pE5iS6ndXB2oAuR5jdi6bABzJDeVEBHClh4YfhZxECVqBj7DDqK2p57eNCyHnokBcMlQ89kDT2bE7EJr6OTZ4sGl+IZ9O7yxN6lYHS+YisXb0qtwuZx9bgF0ajtnsip4mjBRPTrju7XqkC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724277458; c=relaxed/simple;
	bh=QoQjXg4zrkckps6OZl4xkgiuPOdfwY4t1fFBBZP8Uz0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NN+0sMeiLfiSF9dJ2eESq8xjqTpyoheQbOQUc0wplXjqjec6f9RWxy92QoNkEmJEQ9dIh45Toq6N2yFmpt9OKbFCMKcBfBd5/PkC6IPz9z3FDzH090J5n5x+Er3PhX93VS2qZijG6J6v18K8ByM+bPOsQd2JWaWSa7Sx5WUYaf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i8dvE2Q/; arc=none smtp.client-ip=209.85.167.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i8dvE2Q/"
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-3db145c8010so85819b6e.3
        for <linux-sunxi@lists.linux.dev>; Wed, 21 Aug 2024 14:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724277456; x=1724882256; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ys+sG5b9a6uhbl5zndW9/e6kK/Fuw6SOZtG6PQfHk44=;
        b=i8dvE2Q/Bl9mBbhLXzc1ch9D/f2fdK12/N71ffES0hhTKrIPZG7plvDYvwcmON/Nia
         nvkVS09zL6bnzbquSUqU9dbQTFjal6q6K6e36bcXuvLZSMnmrgC0/XnnicIGzhf5lObY
         zsjJtHZlMf08aUs+xoNkHgYn/NSZmlX680yRSvtIG9UN134UgstWZfsu+sJF2Uk8Fxr8
         TZcb1OWUFdM/dU7f9Wc3EVGh+qz9c0alEKB4MRXHahq92bC2jHrHwvBJYVextjoXyKsE
         3EBaj0zy7Fv8SYwLUBbUqMNOOt8M1SWitdFuJoJu6cs+AkJ2Fu0CPV/yEWdH1Ada6cW1
         occw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724277456; x=1724882256;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ys+sG5b9a6uhbl5zndW9/e6kK/Fuw6SOZtG6PQfHk44=;
        b=F0CgcunGmNAtFs9GRKYD1MYYS0ZL59jHsVxnMxBbO8BJRzrtlIiEzV5Vbdd0nsjFY7
         IXLKtSJm5miCIJ7+bE+q78iQsUJTyzZDHhtRZI+v/vRFhjXlJonv5F9zilgnYVmyOmSz
         SF5zRUbnkIF61vs9FtoFktpGMmYTp23cmqvF6+lIqyiLtWFcoSebwfY9iKzHSi7eCizF
         X5zSvgPScr98QCrVtgsFiOtxiuSl546MQ8sf0QhBvYnuFL0MPv4/ZcAGUwxkfHUxgb4M
         43FPpfI/6p3qtZqrRkUHHIX/c41/ffkROT2a8FGEml8rBwnfNGzP6rYXHhDNU8J7LEy+
         4Qog==
X-Gm-Message-State: AOJu0YzcHHTbHc4jNMP/yKSLNhcfwXReKAhvTC6yHNNS2vg1TsNUYv7C
	4YEUyUuvz5AdlbNubOI1qZu+JcT6suDNhsqtUzf5weaQ7cJYDhX/nJUt+Q==
X-Google-Smtp-Source: AGHT+IGSNGiLpSDGYbeQsr9hfzMxprNvYc1rfBeR6FKiK1Zn8vEKIFHLbFvwtoPro63cqF4NO+LkPA==
X-Received: by 2002:a05:6808:1211:b0:3d9:de82:f07b with SMTP id 5614622812f47-3de1951b88emr5131812b6e.28.1724277456012;
        Wed, 21 Aug 2024 14:57:36 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bcf:81a9:2325:e0f7:7376])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3de225555b6sm47070b6e.17.2024.08.21.14.57.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 14:57:35 -0700 (PDT)
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
Subject: [PATCH V4 09/15] dt-bindings: power: supply: axp20x: Add AXP717 compatible
Date: Wed, 21 Aug 2024 16:54:50 -0500
Message-Id: <20240821215456.962564-10-macroalpha82@gmail.com>
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

Add support for the AXP717. It has BC 1.2 detection like the AXP813
and uses ADC channels like all other AXP devices, but otherwise is
very different requiring new registers for most functions.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Chen-Yu Tsai <wens@csie.org>
Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 .../supply/x-powers,axp20x-usb-power-supply.yaml   | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/supply/x-powers,axp20x-usb-power-supply.yaml b/Documentation/devicetree/bindings/power/supply/x-powers,axp20x-usb-power-supply.yaml
index ab24ebf2852f..2ec036405ae4 100644
--- a/Documentation/devicetree/bindings/power/supply/x-powers,axp20x-usb-power-supply.yaml
+++ b/Documentation/devicetree/bindings/power/supply/x-powers,axp20x-usb-power-supply.yaml
@@ -23,6 +23,7 @@ properties:
           - x-powers,axp202-usb-power-supply
           - x-powers,axp221-usb-power-supply
           - x-powers,axp223-usb-power-supply
+          - x-powers,axp717-usb-power-supply
           - x-powers,axp813-usb-power-supply
       - items:
           - const: x-powers,axp803-usb-power-supply
@@ -75,6 +76,19 @@ allOf:
         input-current-limit-microamp:
           enum: [500000, 900000]
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - x-powers,axp717-usb-power-supply
+    then:
+      properties:
+        input-current-limit-microamp:
+          description: Maximum input current in increments of 50000 uA.
+          minimum: 100000
+          maximum: 3250000
+
   - if:
       properties:
         compatible:
-- 
2.34.1

