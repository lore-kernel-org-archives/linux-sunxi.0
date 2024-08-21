Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F52117BB33
	for <linux-sunxi@lists.linux.dev>; Wed, 21 Aug 2024 21:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724277457; cv=none; b=U7jc5vA9hvWS5e5jBMgeebOHpX3Xylmhg5kPmFCOl96UGXb1186x6TCZcv6yZgGjEvj7ho5MgNUpR0unyOrdydkDgoejxr1vByel6h4yZxEugWo8gJ1lwmxCt3XahFQI20AHIld3x87/CcesNTDBRk88g5UGawEAcGLePzNs5l8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724277457; c=relaxed/simple;
	bh=16TxacFQRSnmxQxajH2B5k39AW2lRgjLC38Elp8ySLw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DzcUFMRpA0Ew8rrCYnlgGQOwIDNOBxkR6p+pdl0b+pAP9la4nUNXWpisbsJQx+2iqfM9Yx+JuMjvGacm6pHMeiBjATUdq8IQxvd81LnyMV3PppQ4nnWgqo3Kl7UBSzWwhgJvkpIw+Y+D+3SX3g7XWsx5SYNKB8D2Oqw7mQxDHxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c4hLidHc; arc=none smtp.client-ip=209.85.167.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c4hLidHc"
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-3db16a98d16so88865b6e.0
        for <linux-sunxi@lists.linux.dev>; Wed, 21 Aug 2024 14:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724277454; x=1724882254; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RkkzIKfrsu8xLnQwZgjeVDvaKU/MUJN67PA3Rk4p0CM=;
        b=c4hLidHc/nqf6ctVEfCqSZQFUbYA9D4eC5vMmLyAfo9394ahsRNG0F7d5llG6lyKg4
         I6kaKVF4S4GKg0ukouo2166oTDbpoibkUAzw3nkM6lvRnSl+zEEGb9Wib/tni3UKet5g
         kvRKTnRLmVOF2Ugb6PKNN6Xy3AEKERVbniQ1Y10E5l76DiWefPK3zprS8Rwr3Sxt6n/T
         TqkvD0X1XnSDZpEUrm8jP/l/JdFQ5P8XiiA3u7YXR9FuFsKKd6P4Q7ACjWDVgFrPG23x
         rY6wHOMKX3Q8kg6ClCmmoaWWYV64RUmJj9Vc40mxL2vPUaso3chHuNLuOCNY4AsZPiow
         IGvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724277454; x=1724882254;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RkkzIKfrsu8xLnQwZgjeVDvaKU/MUJN67PA3Rk4p0CM=;
        b=lH5KJX+j9sV4YumZa+JH+wMmpAoehivjCGRUSLZGIyijYex+XGqlG9CuYbG1X8xITW
         vdDoT1NJqEllMuHh7Uyp9U9pc7w+5Y3y/tQMak5PdMTmYMqQH9qsW9bhwIbMC4Qfx4ie
         X1/PhZrxAcxZXE/bkEc1lRFBVXuwxGGLjclvcblyUf/wsfeB2Mx4YrzeFpxW3PHmOjEr
         VNRipba6eMgT/3gz4ZK+0/TnzJC6tPLqkmHEv4HNb7bpl/+wbkdqqvommU1KvglLMPaj
         KSF4JO6wS4/IOXs7MmgNhKDABKWPHRElULCyjX2787LGFFVtMbDkmbb/m9RM2jMDoG2K
         OSIg==
X-Gm-Message-State: AOJu0YwklXdromY6Iov4Dr+Xva2GOZbEBQZKP+RgX9nf01u0N5De9xjt
	DNEkptTj5c+pNw0C1zmMN989CnEaeYZTHK2RuYzUs0fEI+xdPmmHJogSSA==
X-Google-Smtp-Source: AGHT+IGG5pB023gZP8ZguddlFNlR28q2cmj9bTwLc1Bj1tHSp3mMg1g9qpl/sTQ1MotPq+SJ7pl1cw==
X-Received: by 2002:a05:6808:1796:b0:3da:aae9:7165 with SMTP id 5614622812f47-3de194f96e3mr4164334b6e.14.1724277454392;
        Wed, 21 Aug 2024 14:57:34 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bcf:81a9:2325:e0f7:7376])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3de225555b6sm47070b6e.17.2024.08.21.14.57.33
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
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH V4 07/15] dt-bindings: power: supply: axp20x-battery: Add monitored-battery
Date: Wed, 21 Aug 2024 16:54:48 -0500
Message-Id: <20240821215456.962564-8-macroalpha82@gmail.com>
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

