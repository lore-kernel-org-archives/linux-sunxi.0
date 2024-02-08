Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D494077628
	for <linux-sunxi@lists.linux.dev>; Thu,  8 Feb 2024 10:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707389588; cv=none; b=I9wrIsBEcCxjKp5btxX5DTFHLECFHYd1GEXTTjRmBkgb5bCagaS9s43ACeBVB3ly2xVOB4cQRZAV4TKzL2Yj+cW9mIjYkczxD06abM7ddvFM+mWrUg0TAf5mMr6UvP1969T8QWOWdSpnyFoC9VHwEj4ca4uDAftfs4UihFtJUX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707389588; c=relaxed/simple;
	bh=r7neQIZqlD7kZSvzFfitQ/605+hU2dKz4dgTmnCCuhI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=f0ZkwGmh677uPiKTP+gKdKmpcNEPpBXZL5QVq6atb6ER0H6/BZLuoYXAxdWB55GN7brWQaLc9V0jdCGb+0wG0aJNI89dZ0w+LVFlZePqy/YF0qSlSxjs1lXtihb1V4I1ylOU6Mfpw+F7SGkV640eBVEI++kmW5VF74YZQtxicso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qKcMztGE; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qKcMztGE"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-511490772f6so1947392e87.2
        for <linux-sunxi@lists.linux.dev>; Thu, 08 Feb 2024 02:53:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707389585; x=1707994385; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SsvFX7J4wC4rV1ETkXmUe+0x+lfVuedy1wld88CqNbA=;
        b=qKcMztGE6lls8q3tlyzHhaFIswzRtvFXgDilhIOEm0YO3yoUYJfiYagsV2maeyNc98
         crf8Ad8SSKCvlN69HDlFWHjaHzLDSSxV7EUr1tinqrosB1htGb6bxsGtNFrETAuYlHcG
         ZGSqzoDlxVgAUVJ1J0KorFsUiOo+qtSBt9DH9YUFHFrb/YrBBCvsZMum/mZysl30zk1w
         GK3OuvegExD1PrHqtCf80Dk6P7h8HvhSiD2RwKNcZS29xFioQHmyPXAudAIZnedDJ+g+
         lOZtlb+IllQUsffjuO5cDuPZlJYr4hEM7mNtwpzMPS37/aOwHkFPo9B/a4W7Y3f5uIFo
         m7sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707389585; x=1707994385;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SsvFX7J4wC4rV1ETkXmUe+0x+lfVuedy1wld88CqNbA=;
        b=R37J2Ojm//9uNXMUYhwsXX5y32nzBmjuExl/uz/cgMgE0MT+fUlDcRnzk+sogah37Y
         2EYHEqMqfo8bcEx9tvTfLe2gTpclObBHhjim7Aphdi5IOASUZuFU33Lav8WG9nDtX78L
         YHvm3g2dTnUu9rnYUFHhOE30zvLMa2pe5PCfvScXO/BFZf4Cup8+f21llzR57Fgq+ff1
         wbPIyfkk0+UUWnJWeAu0U15I3Y4yVk/N/LE72XSb2gMA8CPyVy1slto3NRJOq5JuP9C/
         t2E3pNqcFT3JwfpX0z8K0m155M+S3FM30/uc4az7HdgdL9KDOY1lUxlIPYMCb0h76KQs
         EMoQ==
X-Gm-Message-State: AOJu0Yyr8FUtwUjlFrc6d6PdUFdk6J+Y87hUhArxCPRI1kLv0N/dTrw7
	JsmfHPsokbPxCto5FAevpO7ZtPLJWdhWqtihAS+OdHCohxMK6opRf3MC6bhhHSk=
X-Google-Smtp-Source: AGHT+IFb04yQV9E6QtRgImmRiODLQcP1FPjgehHeg0frAo6CFt4eUX5ECX91r3IH+PwfKgKacayJeQ==
X-Received: by 2002:a05:6512:b84:b0:511:4889:e27d with SMTP id b4-20020a0565120b8400b005114889e27dmr6538440lfv.42.1707389584948;
        Thu, 08 Feb 2024 02:53:04 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXXkCHAjeFyN0Fsa+RcAqpxHyvfgJcwgR3h6Oip0IPelywc74iufW2oz19V9yOP4c7WICHUtvAyg+UTEn9rxI7ZMXJ4U3uubUhblVEg4wVHNGqnAeq6cMjqCG2sCHAHvViXCNDsAv4vUAGT09JNaIDDhN8W3t96/RZVubx/Jo/tUERWEmkamXTHts/xZhdASDOdavb6YMtFAXkTN7fa1yR7MsFxoz1CTh39F/UeJicSkPrpsogXS7e7enIDYLgKsDBLwB9pPQen4X7YOXX2D/uM41364VTkFVuml7SeOjYlS/gEDDSlv2l2gwfNvrVgXoFrlRvDRh70XNz5Wv0p/g==
Received: from krzk-bin.. ([178.197.222.62])
        by smtp.gmail.com with ESMTPSA id u10-20020a5d468a000000b0033b44b4da56sm3331975wrq.111.2024.02.08.02.53.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Feb 2024 02:53:04 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/2] arm64: dts: allwinner: use capital "OR" for multiple licenses in SPDX
Date: Thu,  8 Feb 2024 11:53:00 +0100
Message-Id: <20240208105301.129005-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Documentation/process/license-rules.rst and checkpatch expect the SPDX
identifier syntax for multiple licenses to use capital "OR".  Correct it
to keep consistent format and avoid copy-paste issues.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../boot/dts/allwinner/sun50i-h616-bigtreetech-cb1-manta.dts    | 2 +-
 arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-cb1.dtsi  | 2 +-
 arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-pi.dts    | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-cb1-manta.dts b/arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-cb1-manta.dts
index dbce61b355d6..4bfb52609c94 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-cb1-manta.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-cb1-manta.dts
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: (GPL-2.0+ or MIT)
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
 /*
  * Copyright (C) 2023 Martin Botka <martin.botka@somainline.org>.
  */
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-cb1.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-cb1.dtsi
index 1fed2b46cfe8..b2988f500231 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-cb1.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-cb1.dtsi
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: (GPL-2.0+ or MIT)
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
 /*
  * Copyright (C) 2023 Martin Botka <martin.botka@somainline.org>.
  */
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-pi.dts b/arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-pi.dts
index 832f08b2b260..ff84a3794470 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-pi.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-pi.dts
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: (GPL-2.0+ or MIT)
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
 /*
  * Copyright (C) 2023 Martin Botka <martin@biqu3d.com>.
  */
-- 
2.34.1

