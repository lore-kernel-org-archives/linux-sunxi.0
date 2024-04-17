Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBD29172BBA
	for <linux-sunxi@lists.linux.dev>; Wed, 17 Apr 2024 17:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713373473; cv=none; b=WtqyPc9AfpqMFwztOxlAfyWG93pjONFlu/+NH0hvZG6AMSepyeteNTlC4UtX12MqXvAo/R+/C2pdqsz46luOYjwocONrgPVpiWohakim32q4+HC6G82myTcqQWVU7YOJbEb5R5CE9nzlHpjzF9NzbQEeeW4E1dTFxs+g3E1o+g8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713373473; c=relaxed/simple;
	bh=nLBeWAQeiKbZf3mF1ykIdirIbJIAA4nnhmQ1kThLG0Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ork2K0D5wa73JV0fm6oEVL/9P9rhCfF8GRsBlIEcHuZwx6oCJ2kkwIQab6lN6U0XW4CEq6XcsfkDhqWzr5qyNUsQYgKSuykcASU/tDYIPdI7oMQwRdZLzyvclI/9GWjLYZV/8VPuPxP7UPNmm5GakN9NjFHh8TBMi/152+ES6iM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k1FezlZa; arc=none smtp.client-ip=209.85.160.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k1FezlZa"
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-222b6a05bb1so3557644fac.3
        for <linux-sunxi@lists.linux.dev>; Wed, 17 Apr 2024 10:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713373471; x=1713978271; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WvlGloqVqYqrVdULrntdx9ykOfT/I/tNVxJeqY/xDsQ=;
        b=k1FezlZaYuGbZ1LB7mg3OM52ybPcFWzvTR8yoqJDEtSfeSeWMh/tKjZG5dZxpV81uk
         oq6t0IeDx0pSFyO1Tshj0uT9//hPvzKj1VLTvP/VV3/V+49dRn8OKagVu1Qwhyy/KgBW
         hKRuox72rZkqsJz8pWVNQAU5Okf2mBq/6TcQYw72/xJvp/h13PVezO6uBvcVoQ0IrShA
         zgF1QIHJfXyvAnAJz7Na5UlsHFgUO0kVDzzV9BCuBK1zP9CMWdFXOPrWVtCXirV/QPbP
         RHL0BX4/EzbjAsFdcDU9iasWHzAqpgfC1NIkh1uU5iJXqkcDXQVSLdnToWHTJ7U1LxvL
         xgcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713373471; x=1713978271;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WvlGloqVqYqrVdULrntdx9ykOfT/I/tNVxJeqY/xDsQ=;
        b=ABOBk/+QoptiNzkkBALiqcyiwFi6LYb3B5ImMK4xoOsvMLVbPzdxvT6mz7bs/QPXiR
         dXqy3UH5Q3BmaPV1fQBjPydtsDnQhNdK/aEF6gQueYQlzcdN38rCwo+ROPCw5k0qM95Z
         R++rVmtFl9J1KvbFpn7/SLcJvsW7wPCpdS5Kw+UU1ix1BVIemgrpH8wH9Jln2zwHa3ls
         Sjc1cAWppZ4M5PYhwf5CieRDPdr2IyK3EqD6XFQdPF29iyMrRaW9cVPX5V1Jr60lIFnV
         pV0bUPp1sIDb4u3wPbS8Oqa9d4KALFTC8A7S2S0HYJq0oCKtWVPYIhVtiWIuzFj/VCgu
         TcsA==
X-Gm-Message-State: AOJu0YzN6+Py8Pwjhe1UPND6CDR0lMTPCBXRo0421FZJi3dkpLEFlmAN
	UTWB0I1mCez08GVK51/T6PZS2oN0iEE2ZE4dNDi7wsC/ZmWRKzX2vDfJkg==
X-Google-Smtp-Source: AGHT+IHtCr9ppMf52l67g0OPTfj+8NuBOPYiNMq3frVYOEx23sXZoPzKUhtTawQ6kjwZcrqYwStuPw==
X-Received: by 2002:a05:6870:e311:b0:229:7fe1:5674 with SMTP id z17-20020a056870e31100b002297fe15674mr171917oad.29.1713373470452;
        Wed, 17 Apr 2024 10:04:30 -0700 (PDT)
Received: from localhost.localdomain ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id k20-20020a056830151400b006eb77e42ff5sm1721615otp.26.2024.04.17.10.04.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Apr 2024 10:04:30 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-iio@vger.kernel.org,
	p.zabel@pengutronix.de,
	sboyd@kernel.org,
	mturquette@baylibre.com,
	samuel@sholland.org,
	jernej.skrabec@gmail.com,
	wens@csie.org,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH 2/3] dt-bindings: iio: adc: Add GPADC for Allwinner H616
Date: Wed, 17 Apr 2024 12:04:22 -0500
Message-Id: <20240417170423.20640-3-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240417170423.20640-1-macroalpha82@gmail.com>
References: <20240417170423.20640-1-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

Add support for the GPADC for the Allwinner H616. It is identical to
the existing ADC for the D1/T113s/R329/T507 SoCs.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 .../bindings/iio/adc/allwinner,sun20i-d1-gpadc.yaml      | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/iio/adc/allwinner,sun20i-d1-gpadc.yaml b/Documentation/devicetree/bindings/iio/adc/allwinner,sun20i-d1-gpadc.yaml
index 7ef46c90ebc8..da605a051b94 100644
--- a/Documentation/devicetree/bindings/iio/adc/allwinner,sun20i-d1-gpadc.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/allwinner,sun20i-d1-gpadc.yaml
@@ -11,8 +11,13 @@ maintainers:
 
 properties:
   compatible:
-    enum:
-      - allwinner,sun20i-d1-gpadc
+    oneOf:
+      - enum:
+          - allwinner,sun20i-d1-gpadc
+      - items:
+          - enum:
+              - allwinner,sun50i-h616-gpadc
+          - const: allwinner,sun20i-d1-gpadc
 
   "#io-channel-cells":
     const: 1
-- 
2.34.1

