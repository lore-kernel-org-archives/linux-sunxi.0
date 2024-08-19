Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F875187878
	for <linux-sunxi@lists.linux.dev>; Mon, 19 Aug 2024 16:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724086132; cv=none; b=SFRCiRb62/kHpvD2Ao7T3A+kF7wHbNjlObjbk/adbtCw4aSQ3ShMHFTbbkRZbX5AIS4cIPrQBFdl9RT861mfTfLucQpwBjKsycB2NlaelYDC94Hpd+JAIBW4i9Za8sNz0W7y6rUNHeoPHPl4Ep8KBie5ocMNzK9P043e09h0vTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724086132; c=relaxed/simple;
	bh=GPNtceU9n0sus1iux3lVcrLHESPwqmwfNTmzMjysvTI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=f4VRTV+RGKqxy6uW4qIbMIkSGtx7T4gRmXFIIFevPGMqPc0ZpAR9CyCiyZsjZIP012WSsUAdX6hnegVmXEsQsuqGs/qf9+Af8rz8zLIYuKSYHQt7OnjBjUr11OdARR/m2LerUAjlVwFwe6Cu5bSXqT/KDSjoskCWgmDhHPA0pSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MXKSAtm6; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MXKSAtm6"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-70942ebcc29so3242656a34.0
        for <linux-sunxi@lists.linux.dev>; Mon, 19 Aug 2024 09:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724086130; x=1724690930; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2mLcghtORtpXHj8P4yh8LryhEIqNeq4orRne8D1uG+I=;
        b=MXKSAtm6U6Bj9q0PoR/qMZ7XvR7Kczzb0/ZH9uzEy8T4FkZsLIlmMr8YFVSmLiuOw8
         1rWXcY3uueZmtKSIbNlkm0GdS34ulZh9QDCt/eBPCf6UdRFJlrlFuSjYxPPo4In465Em
         p5KGAKvzUKFC0OaUQb8PYMKa0qemMqrWVlgaE/Q3DjXHbIQHA6iAKowrBaF8ZndDZvmB
         gZ6YPIYFoFcNo7CSK41bshH6594J4YMdMXhQR/c2KIJ2DVv3Nmk5zbbhWEMY7EV99lnI
         j1Tj6r7vsootBMcJp46kPMn0jDHZcNjfVDdZHuJhgJQGOevUfyynU+33q+0X5ezQZn5T
         2bLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724086130; x=1724690930;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2mLcghtORtpXHj8P4yh8LryhEIqNeq4orRne8D1uG+I=;
        b=FZS9/WeSDcOZGMQBD9LwubPuyctRf1s9mWvIf+mqkUTcbPW6om0FCk9/zhRJt/Odyu
         XWCEyPX/+xpz39kKomROES9XNyMw/yfuOgUtTV501cj/CdesN/fNxy4v/E79XROiXFVe
         qk1NZ9sT0LAaYy2Yo2iriZwu4rDV6TmLOW2iO9j10IR6t6EfyuJ4KctX9jRPgm+7QxdJ
         vSlc64/s1LKO4NuC9nRaMgeOIDXk+ZzXJ5P7QUs7eke8BPjwSDbpDvGu/D9AQv/Vl6af
         Tbsmiwhn1zuhx8T0K8fhOK+IZ7vSghzxXddcO9NLB7Ktq2cC9SmL4RMOyFeHcncmQfbg
         zWWQ==
X-Gm-Message-State: AOJu0YyZs1sXelw7xBx5Bo11ZPWooo50n1g5I1AXOm4TSCOCrBiaElCM
	B9eejE7unanEplH3M5xD+5L84MoVbcPpeZkPHVg81Vp/6tsIoy+7kIUtTw==
X-Google-Smtp-Source: AGHT+IGp0ZQPhwFlK9c0BFOFa4wuvrcDIPz31Bx64gvzmcJWhJHbsHHHQ++VNkm4g7m2Xj8Yo/IWaw==
X-Received: by 2002:a05:6830:440f:b0:703:64c6:305b with SMTP id 46e09a7af769-70cac8491demr14520708a34.2.1724086130315;
        Mon, 19 Aug 2024 09:48:50 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bcf::54])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-70ca649c61csm2332428a34.26.2024.08.19.09.48.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2024 09:48:50 -0700 (PDT)
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
Subject: [PATCH V3 09/15] dt-bindings: power: supply: axp20x: Add AXP717 compatible
Date: Mon, 19 Aug 2024 11:46:13 -0500
Message-Id: <20240819164619.556309-10-macroalpha82@gmail.com>
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

Add support for the AXP717. It has BC 1.2 detection like the AXP813
and uses ADC channels like all other AXP devices, but otherwise is
very different requiring new registers for most functions.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Chen-Yu Tsai <wens@csie.org>
Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 .../bindings/power/supply/x-powers,axp20x-usb-power-supply.yaml  | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/power/supply/x-powers,axp20x-usb-power-supply.yaml b/Documentation/devicetree/bindings/power/supply/x-powers,axp20x-usb-power-supply.yaml
index 9cc300e78f60..0a3b3d743d71 100644
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
-- 
2.34.1

