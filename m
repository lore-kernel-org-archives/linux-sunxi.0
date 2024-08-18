Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F13CF148823
	for <linux-sunxi@lists.linux.dev>; Sun, 18 Aug 2024 17:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724002115; cv=none; b=EypX3oz3cu/IpKfMUjB0G6PAuAU32QiWYWkNgsFIkcLsSuTqkh8k1//dOA9mw8s1OV8a31GnNNkdpGNobVO8rg/flENDRtwH9oGsb8IbIoRWBrXYHbMAb17RJAQmJDzmpsL+aTWkinopN7CC77XlR/2PsIj3fCeuXDRklXyLIR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724002115; c=relaxed/simple;
	bh=DSttWqv0bdCkTXjJqadvLEmUQxn6lDGfY+pACtAw5SM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SymiHPcl2dkuPJTDHLMaHdqcDy0IkLIgh30z3oy9wAIPbsDK7Lw4UjZ5CBLzypRFYsRWTmkEsKy/+kFIQV2hFEA426VztkKZ5Wfwi3MTqYZ6hebuYvEU9cq8Z8WqmQBlfUbCV4GC2evBg8OOihA6kuPYTnzOPI4xllU2JRvwG74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sMz4//1S; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sMz4//1S"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-428e0d184b4so26246285e9.2
        for <linux-sunxi@lists.linux.dev>; Sun, 18 Aug 2024 10:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724002112; x=1724606912; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=S5pLu2Iv0yKyRrnfssfZZOgkRQEo8dv+goTKpDYttcY=;
        b=sMz4//1SW/u0KtO3qevOriN0vDnQUp44QFS4FVRAlUGCkxmxC9ECF2UWryT8mTLffY
         ji0fKb/ZxJN2iUoMruBtLqdAAcr2PY9GvebMfPHkzyhqNfqHtBvQxxSUu95wMnkiE0Os
         f8wfbsTuJoyKjiBSShKWZx00kFSKhxBawtGEWZS8Eb4rVfL2FbwSuIRmNPTtootS+bkC
         uU1AzJOJaT/9di7U48tYSqP2tok0ttphZjo2omEUk75C8IwSH5IT+4Tza6wN4148k5sw
         CXva86YkdVNBhKcc/Tg1bWwrJek5yoN1HXQWAUBMRhgZwMv1KePHDBenUTXWdNWpV1FY
         AsHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724002112; x=1724606912;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S5pLu2Iv0yKyRrnfssfZZOgkRQEo8dv+goTKpDYttcY=;
        b=RDjhBjE85bCas7cHScqAiM7az93f4IgWuWarOVg85gvuutknHLCj/+ePnUo94At3BV
         bRFCfEBvIUEl9VN9WFOE6n23sS+4sFEf6UdQJLTpzpSNQdsHeqNICMsJqtTkPOBDQ1Wz
         mrSJbaO7ZVSJXVLPv83E271JouapLhpOtB054iNm79Enf0Tn0qiR0On3uUv61kSV7MQe
         MaMeD7VXcN7k4fWfXc93b7/s7fwl9YKNOpIIvXhN+df+rpIfBkyjZ3US6lsUMag05daG
         kmtUuSRoXkBgbhAHl4SI4bZOrDLDpIe+o1e1s1bpIIQp3klimgXcuL/2sEyv7bn+Da6A
         k4TA==
X-Forwarded-Encrypted: i=1; AJvYcCXQbcFGe+OBmq143m2MyHpX+9XIKHBdZMbnB18b93eKDnLa62xhHfxQxthT5jpRBnNK8i12fJQ2pvRqSR9Cdk6GgvqfxneksaPwsq0=
X-Gm-Message-State: AOJu0YyCKIbOgaunEaIunXQSCgQ2viABLerfDykMIp9u7Gce3FjrcaO9
	y6IyR3zeYnw4ufvgaabLQluBzmLSlaZ0Ls8M7vzTXRhhECJDXlR+/ZOr5utVWgU=
X-Google-Smtp-Source: AGHT+IEVPKW8NFr4apEXYCDi/aSn78seRkFOK180J1AgxIymjMjMAiL42xXHAHwLI5c8YizLkhZW2A==
X-Received: by 2002:a05:600c:45ca:b0:426:62c6:4341 with SMTP id 5b1f17b1804b1-429ed7c150fmr69488315e9.20.1724002112105;
        Sun, 18 Aug 2024 10:28:32 -0700 (PDT)
Received: from krzk-bin.. ([178.197.215.209])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429ed658651sm82979875e9.26.2024.08.18.10.28.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Aug 2024 10:28:31 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] dt-bindings: pwm: allwinner,sun4i-a10-pwm: add top-level constraints
Date: Sun, 18 Aug 2024 19:28:28 +0200
Message-ID: <20240818172828.121728-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Properties with variable number of items per each device are expected to
have widest constraints in top-level "properties:" block and further
customized (narrowed) in "if:then:".  Add missing top-level constraints
for clock-names.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/pwm/allwinner,sun4i-a10-pwm.yaml | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/pwm/allwinner,sun4i-a10-pwm.yaml b/Documentation/devicetree/bindings/pwm/allwinner,sun4i-a10-pwm.yaml
index 66e400f2a3a4..1b192e197b11 100644
--- a/Documentation/devicetree/bindings/pwm/allwinner,sun4i-a10-pwm.yaml
+++ b/Documentation/devicetree/bindings/pwm/allwinner,sun4i-a10-pwm.yaml
@@ -46,10 +46,11 @@ properties:
       - description: Module Clock
       - description: Bus Clock
 
-  # Even though it only applies to subschemas under the conditionals,
-  # not listing them here will trigger a warning because of the
-  # additionalsProperties set to false.
-  clock-names: true
+  clock-names:
+    minItems: 1
+    items:
+      - const: mod
+      - const: bus
 
   resets:
     maxItems: 1
-- 
2.43.0

