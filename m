Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B7B71B7F4
	for <linux-sunxi@lists.linux.dev>; Fri, 11 Apr 2025 00:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744332065; cv=none; b=p6CFUH2HAgqZgJl4OP9U9PstZti85vVRfvlQ1Kc76cQm1zd5CIgoT/LI1U/q+GuDbFdUnOj14KByyHdbrL3MvXWXiILkDoppuJttubEGlOFNuWvqp05vApE++HAl4IFH4i64NbFX8/rcbwDa9be7Mlj+Oxs7ppP5Q/Y1Mrp1668=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744332065; c=relaxed/simple;
	bh=3gj9u/hlulCyyg8E7Exqz6RlgLh9YXNSVMUR363LDeA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eMrCwy5S5Wtg6/rP93XlXNa/Fmn8m/D/CNGUUYkL5R2OnOO6jNI/s8jl5vukt3sdkriRs5u/PjuWKjOkJ1z7ki6k1MXJrfP5YKYqa2RD3BnmM508KXvdIUgoi66zpSvBwd/ypSwQuMni9na3w0+JDLQr+0mH8MdAUr6R0hMzn1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cGQxg1/E; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cGQxg1/E"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-30de488cf81so13533301fa.1
        for <linux-sunxi@lists.linux.dev>; Thu, 10 Apr 2025 17:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744332062; x=1744936862; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RVVDUXMgIvl3qGuqG7Y9JWon05wMZyYxnJ2zr2Ehlos=;
        b=cGQxg1/EyXzZeywcdVV6uSzPJTIuzus4ak7I/9uOal6v4WkgeANTfkES9E8Sf8HbYD
         JCaI0B6eQBeiPWuTtABytbrU9maQhO/tG4orhVnPUF6vhj1w/wQ708JDdYQkayVVM8+4
         TLAWCeJYWOBa71CIvvS+EPqcZxDb/Qsk0X9G+UUblJEAk8FnqEcII0QA7cmC3aWPJFRa
         /ha1rWibLfFhbp0kn52DjfA71OtCJacXzsyaYxwXERM/QrXvh15Eu0u9V84cTd2tUobn
         RasbM7nv6xsDVHhoE77rLJBUbJjVIl/6kdBnMswF8I1meQFV4dFNbTthTyGQtBdog8mV
         LXog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744332062; x=1744936862;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RVVDUXMgIvl3qGuqG7Y9JWon05wMZyYxnJ2zr2Ehlos=;
        b=qlla/OeX5Hh0Wj7hrAk/QTSmR9niskS+frkmc+9f4ERItBdqdVJ2iXKL2h8BIf4OSP
         l7N9jR84mJO770U2EMoyzmu4/nHorGksIssqw5BTC9B6/Jg4wiWhkPMHaxgjd0X9L/Wd
         O7BROkTEh0r2ALS3TIL4Y27yhHzfMaWPZ1Jd0roIoV7M/JF7EjnGUmN0gtRev7dKccq0
         AtYpUxPElr3Efc9EYe8xWm84QBKlmVB+3o+U5MQs6uBM+WC22YeErz1nVmnZ4neYXOUM
         0whSujCAvu1IreDQPjtP9eIUfY/rRMMQToU+c3cyvP6AKevhFfJroOVrG13lXL7+3K1Y
         d9dg==
X-Forwarded-Encrypted: i=1; AJvYcCVy+/hJXeu7jnWpOz0svrNoAQcxcX8zyK9Kb9M0OKHIa72ywh0AWU6Rf8sepZqL/zi3lkzztDwrqvqxBg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwoBcfQl5M77f/QEH1tToC9rd4juDwMowfU1LGasr0iL8YrbuUD
	363op6L7bm9Sg+gsLlko/HOzP71Ie54F4MO7MaLdHcj1gpTZo4l+
X-Gm-Gg: ASbGncvPwCbfhmF58TUHEOqqSDx61niwkMLCFp4nE2k+ZZ+Yj2vH46YS+wxpvuQgZ+X
	IM3SlvmiwA+1AMBlaWlBDSPFQhhmtS07uJR5u8EwVrtcMnr29Vl2fuzVTvHxi8a8nTrslja9ohP
	b0YWApay9SnzC2d283gjGcTW/PqWjeaXQqELEa7kZmHgH3kKEzqPHEACCtupEj7jLsahxaobfin
	FgzKigfvv8eQjt/imTQ/iU1zFdTcrEMAhNiLBZj3DfTPoQqUFpUnEAZgmoJ+DZl/uHnU5OFo8Pq
	SeMDY5Ithv0D0qOrOCZPS9pv9xZXR/vlaWc/MxVcXuTuR5UYlw==
X-Google-Smtp-Source: AGHT+IGiJdnH2bwA47CyELRWVzejAMbjmYQFTtee9XHHNai4Q7kPWpY1iiYd/YOYoOt9vN/NRllLgg==
X-Received: by 2002:a2e:b8cc:0:b0:30b:b987:b6a7 with SMTP id 38308e7fff4ca-31049518235mr2053581fa.0.1744332062006;
        Thu, 10 Apr 2025 17:41:02 -0700 (PDT)
Received: from localhost.localdomain ([176.106.241.81])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f464ea5c6sm6344251fa.62.2025.04.10.17.40.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 17:41:01 -0700 (PDT)
From: iuncuim <iuncuim@gmail.com>
To: Vasily Khoruzhick <anarsoul@gmail.com>,
	Yangtao Li <tiny.windzz@gmail.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
Subject: [PATCH 6/6] dt-bindings: thermal: sun8i: Add A523 THS0/1 controllers
Date: Fri, 11 Apr 2025 08:38:26 +0800
Message-ID: <20250411003827.782544-7-iuncuim@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250411003827.782544-1-iuncuim@gmail.com>
References: <20250411003827.782544-1-iuncuim@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mikhail Kalashnikov <iuncuim@gmail.com>

Add dt-bindings description of the thermal sensors in the A523 processor.

Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>
---
 .../bindings/thermal/allwinner,sun8i-a83t-ths.yaml           | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.yaml b/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.yaml
index 3e61689f6..70ac395ef 100644
--- a/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.yaml
+++ b/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.yaml
@@ -24,17 +24,21 @@ properties:
       - allwinner,sun50i-h5-ths
       - allwinner,sun50i-h6-ths
       - allwinner,sun50i-h616-ths
+      - allwinner,sun55i-a523-ths0
+      - allwinner,sun55i-a523-ths1
 
   clocks:
     minItems: 1
     items:
       - description: Bus Clock
+      - description: GPADC Clock
       - description: Module Clock
 
   clock-names:
     minItems: 1
     items:
       - const: bus
+      - const: gpadc
       - const: mod
 
   reg:
@@ -107,6 +111,7 @@ allOf:
             enum:
               - allwinner,sun8i-h3-ths
               - allwinner,sun20i-d1-ths
+              - allwinner,sun55i-a523-ths0
 
     then:
       properties:
-- 
2.49.0

