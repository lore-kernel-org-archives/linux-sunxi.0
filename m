Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E29791CFBB
	for <linux-sunxi@lists.linux.dev>; Sun, 17 Mar 2024 18:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710700897; cv=none; b=SV1H/QIh6bMKsg4mLBJjPycbwlRnOrxtkkFs91IkXaSraR22e/kG0N8dMO47D9f5yqurcGjhWSmlNULpydFEbfg2iaTfPus3Gw7AhpsLlJFuLmIR0JCRtsSePzFhSAyge8IsfhB0zasY/0NMqZzK0pFCjgrZmTuib4W+yfWjdQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710700897; c=relaxed/simple;
	bh=ievPVq366/k7C9FS5///YHG6SSY0yYH53dQltC6lQvk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=XUNYZ8d470v4O0O32Zey5EKuZUnj4pRRLHQ0XLsy6bBdmF/26gGG2oWc64bDvsRe2xcOiYS6edGXqMHuScUowGGDg7wAX6ZcQMPPuEgQcHxM99q+wbuwQZSO2zwa7M3SB9IY3IA3B+rROCpMKKANRrfiR5CO6fHW9z7eiXOKH1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Lp/aA7yW; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Lp/aA7yW"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5649c25369aso4863839a12.2
        for <linux-sunxi@lists.linux.dev>; Sun, 17 Mar 2024 11:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710700894; x=1711305694; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PYFYcfKkxxQvfBESrdXEJ+GtUGfwEGsE7qAGQnRbNLI=;
        b=Lp/aA7yWlUl7u8RjW96q6SN2bTepENJgbTmo5oDKAFQbFQnqEVY/r3Qgae9ywLnHVh
         eQfC7d03/VK2Rcv2AquOC/3SerlwwaoABVe/TWeb5tdo2xZC/WSemdrexJUQUAVRtT04
         ClyuPQlQDJwxO1btF+xTmGi9k8j3+RWDxYxEmQnlXm0tXSqf4vorXTvntnsEzA2qB18N
         kRGM311dkQc6XGiHo3eb+EdQMBxVFd092Q8HRY2B899QIpNrHBFDorPcY7dDOK1VSufz
         9c7AxbJ7DhEvhxvmEhdEJTIeUBjyKS51Crn0WGjqnwtsSDZ2/Y/Fr+/Q+y9zL3rUTWUe
         Nhsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710700894; x=1711305694;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PYFYcfKkxxQvfBESrdXEJ+GtUGfwEGsE7qAGQnRbNLI=;
        b=ccdltlROIZz2JfXc7edgmezXs1MSfqMhelylgkJqXyavjSK/D9G00zujJ+e5G0u017
         3LyUx1/ZKdjudpeC+zMuxVVoLZNQdoOMQLwRv5NIfx6+TGPbo8vQRnAVT6dhTYg+FMnP
         7gm/E+bh+7sM75jfprW/nctbbOffaH9NIItJXgNF4JAtTSP4eoBnPsvgAdRGZejJ/iRg
         5LT9EbTaxMup5yOFxr7x18Imhbod8y3MDHm3bBdySYYiprOC2oPpHWM8JGYaFcUpdIZ6
         7Y+qNoOXOn1/9npYXt31QFeCznWSh+4JkJAwA8JhfVs84cHutSpdWPFfK7/Zy04thb5/
         Aeuw==
X-Forwarded-Encrypted: i=1; AJvYcCWZFJvbZ1b2FzQaVg6hwh2/rWpMMtJr7iDJ339LzBnLC6OjemV9Gb17730nKziZ/JvJESHhas9SV88RX1JEW1V+8eMi2yUTipZBUik=
X-Gm-Message-State: AOJu0YyMItq6t6Doz1kyHiohsWZLgligD9m0e/xHRqBKDuiHHS6fByoF
	qM3ROmAbiCbBr1tNJluLdnZ+6rQupQndXTSSMUaFYKO+LxS0RQkh+RzaDzC6wU413IRk6sHAD3K
	q
X-Google-Smtp-Source: AGHT+IH9orftNoklMxX704C5khR5L8iNpkDOsZkslIk2tejfSQZCUvBfci0Klpf2vOV2tYXErLI+hA==
X-Received: by 2002:a05:6402:c4e:b0:567:9306:5d0b with SMTP id cs14-20020a0564020c4e00b0056793065d0bmr8548673edb.28.1710700894186;
        Sun, 17 Mar 2024 11:41:34 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.97])
        by smtp.gmail.com with ESMTPSA id p5-20020aa7d305000000b0056a2b87787dsm242877edq.37.2024.03.17.11.41.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Mar 2024 11:41:33 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Corentin Labbe <clabbe@baylibre.com>,
	Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/4] arm64: dts: allwinner: Pine H64: correctly remove reg_gmac_3v3
Date: Sun, 17 Mar 2024 19:41:27 +0100
Message-Id: <20240317184130.157695-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is no "reg_gmac_3v3" device node in sun50i-h6-pine-h64.dts,
although there is "gmac-3v3" with "reg_gmac_3v3" label, so let's assume
author wanted to remove that node.  Delete node via phandle, not via
full node path, to fix this.

Fixes: f33a91175029 ("arm64: dts: allwinner: add pineh64 model B")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64-model-b.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64-model-b.dts b/arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64-model-b.dts
index b710f1a0f53a..1b6e5595ac6e 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64-model-b.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64-model-b.dts
@@ -5,12 +5,12 @@
 
 #include "sun50i-h6-pine-h64.dts"
 
+/delete-node/ &reg_gmac_3v3;
+
 / {
 	model = "Pine H64 model B";
 	compatible = "pine64,pine-h64-model-b", "allwinner,sun50i-h6";
 
-	/delete-node/ reg_gmac_3v3;
-
 	wifi_pwrseq: wifi_pwrseq {
 		compatible = "mmc-pwrseq-simple";
 		reset-gpios = <&r_pio 1 3 GPIO_ACTIVE_LOW>; /* PM3 */
-- 
2.34.1

