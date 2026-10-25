Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792938269;
	b=bhYJZ+vSh7yKFVnJXg4cga0fQVZk3suFHPn1O+sTNMv4btZE8ypopk0kFAo9IvU4SK7F
	 7Bn6GGgPCztWE+z9tcGxfgUbzEn+jMsZWV1EkGbuo1/pwlLrfCn+I08LRr66pcx03op2S
	 r5/twNe17bzmHZOFP0v7MBL1yzal/FDViHuJFbWuwJ63FICJ69tCydD8gNni0oQGdlj/x
	 UV8qbAcHPut3q4D9wKESB/HIh5+Af4AL/BXx1DO4hEi+H4IJhVVVjjur1eve9iRlwMufA
	 lXs3gChxbMI+hO04yU8a4/UOVj19WTYTCAWTKYlh+nRqWhePdB3Z6TsnflKWDArWTJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792938269;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=75/x5gew/kL/KutTpGg3fvui7cvgM1uvPLVY0+jqTgg=;
	b=F6ijAP48B6DaHNqagJ9VXVGw2/oMDk2FvgS7GlyaP3HjoZGMQt8Jx2XkyLs0ABz02A8D
	 GRIr3QhqmAfdj08TTZVhn3GGaKOHKbXnLbW4JRe4+iSW3+CC1aVIuHcHTw1ctONrzmoNm
	 o8JUQ9EEpeUjrgoWxFA1xJ82X4hgb6kd94dmdmZEcyQys4w39jJbPmKgfFEXYOYPnmuwU
	 oIJqdYJM5NGCYb0s/dqX7I5cGwmsuXakiWJ7t1Yjw0+WKYFDGOnxDvq/hKKjf5RF9DVMv
	 MgY7Uc24Hf0JpcH0paQTjiGRoYi4MoFPK0O71tAdz1Q+kxDgwpurO3DQGynTiVVEBtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=eDc0fCQ+;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9247C606A326
	for <linux-sunxi@lists.linux.dev>; Sun, 25 Oct 2026 14:24:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9247C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=eDc0fCQ+
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a214af2076so14911905e9.0
        for <linux-sunxi@lists.linux.dev>; Sun, 25 Oct 2026 07:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792938268; x=1793543068; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=75/x5gew/kL/KutTpGg3fvui7cvgM1uvPLVY0+jqTgg=;
        b=eDc0fCQ+3a5oPAs4SbOaZpAOmF84zOYvbTEt1rA3i4HnpjzA/XfwTd4lw4QdaAjYzm
         yyEIYZTwNvHZOOr9o3kyW/XrLMZQhXaxgfMf+RKZjDrKs5UHwlABqTq2Hyg97uDjxXoi
         uOqX1d9w3XAAs1zx0+tGyRBdZsqD0OhmBFDheKdHN0Fl9r4T3FV15Ow8eEkRx0mBkeyD
         ZDAqaeJO2O7/qXMxAPbgsQ69UGc4tjyA7YBBhzPr6sp3L/YXn5CJCz/e3A/S0e9mSKX7
         VGYvSJzIx0HtK++TaWQB9ZFHs8PBRrmucJ/5gWMaZRmbbKlDQRwRvFUVx9VlxXvYnQS6
         y7ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792938268; x=1793543068;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=75/x5gew/kL/KutTpGg3fvui7cvgM1uvPLVY0+jqTgg=;
        b=cs1EpE/MUAfkNBkoJhQueZW4HLrDgqWW5ux51iNK0OQNARoXB5Pa1E2s9oBjDp7StW
         BDqC008fIVnOEGdJWj6hskLL51ow9rfKLQqkSIC6tV4glx75UHI1x/y3LFuR1dNiFn/R
         YSV5bjfOM+7dh0Afnf0wehZlkY2CchCNy9XlZlqMiolR+ORNCQiiSF9/n/bSG8a4qd4+
         /5tZ8Y+OzaXPN6R40z1ZemagbKMzktvf5YlnupAbMawHQcEiNort4xbADVS2hmjUVSrC
         jn+9uChQBO5US/tvbXJtwBOipbkqQBhDDq2xyYtwBw8YaKWHJwT+NPzo655et+wtvOA+
         HQPQ==
X-Forwarded-Encrypted: i=1; AKwUvByPYjOthMtabaRf0sMo00o4+u0GQAbv9Y5+XCrWQKWe5g0iSbCW54RTlPlaY1ZFjKWxvrn3f8zctABL4A==@lists.linux.dev
X-Gm-Message-State: AFq9FYIiXdKGW8HUnHS8CqYl+yqkhygUlIFHNbU83qHqyiLjBqiK9rSz
	r5l1AGocIWa1kID9QsL45nlzaJBW7POAvdvMbAHCvnF2JTA0QZpBoDJl
X-Gm-Gg: AYBFou2eG0y3XZ9EoIveKEg6OdIBiNk+V2GE8m4joCcPerWjnwEJkudFLsJPYVvrP85
	JJmHreYzUHDqlonAx7a1YJHP2ABwpcSM6gvboMEd6xhOlXGwgjzkzOdiT6Dg4JOClqi/itxjLes
	Qcs+UCCRME255zEh2arwuOvy5jTajtUzEJA7fUqMHoWySmYfq/YqvhWHnYEIibQEMSVZGftpdYf
	DBc9j1aYsJ/eBAiStddcje1gwQSWSXe4jWCBEpppMZvYR34jhigQdk96Fo//no1gXxMG6fKdzTC
	iK2nKn1ANXKXMYKHlLiaX60zl7sJmfuUiqENNnrZCreEjJR3JJP+rVMRAEC7Z300gazYbRaF/UB
	B6CLKFauRT+z8PJC3hcwFNK/J0Jg9K2l9LJ2vEWnUDQD7CzOPBzjrB2byUQFdoUfjvJGMEt2nML
	T2qQRh/cYI7ZIOQTqPHyVfJ0pAoIgC0OaoYfIT0Rl93oSZe8Tpe9GjVKfIt1TWj9ebvSiW0xMxw
	pRAzGfi75KH/gmYbZn66pm1Gk2LApcFaFdQ8Ojq8bhFykbybU13tVyhsHtEaC4Io/cdUWVLzAYR
	XVYtpbEKk4Mu+w==
X-Received: by 2002:a05:600c:34d5:b0:4a0:2391:6540 with SMTP id 5b1f17b1804b1-4a35aca2b53mr66206695e9.25.1792938268065;
        Sun, 25 Oct 2026 07:24:28 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a0aa0bcsm157074265e9.4.2026.10.25.07.24.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 07:24:27 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v3 2/3] dt-bindings: pinctrl: sun55i-a523: one interrupt per implemented bank
Date: Sun, 25 Oct 2026 14:24:11 +0000
Message-ID: <20261025142412.112216-3-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261025142412.112216-1-pmazzini@gmail.com>
References: <20261025142412.112216-1-pmazzini@gmail.com>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The A523 and A733 have no PA pins, the A523's PA IRQ bank is not
implemented, and the driver no longer counts it. Go back to one
interrupt, and one debounce period, per implemented bank: 10 for both.

This reverts commit 11f25ac56372 ("dt-bindings: pinctrl: sun55i-a523:
increase IRQ banks number").

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 .../bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml   | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml
index d7d0ba32ced4..c04b04acf6e4 100644
--- a/Documentation/devicetree/bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml
@@ -36,7 +36,7 @@ properties:
 
   interrupts:
     minItems: 2
-    maxItems: 11
+    maxItems: 10
     description:
       One interrupt per external interrupt bank supported on the
       controller, sorted by bank number ascending order.
@@ -63,7 +63,7 @@ properties:
       bank found in the controller
     $ref: /schemas/types.yaml#/definitions/uint32-array
     minItems: 2
-    maxItems: 11
+    maxItems: 10
 
 patternProperties:
   # It's pretty scary, but the basic idea is that:
@@ -133,8 +133,8 @@ allOf:
     then:
       properties:
         interrupts:
-          minItems: 11
-          maxItems: 11
+          minItems: 10
+          maxItems: 10
 
   - if:
       properties:
-- 
2.52.0

