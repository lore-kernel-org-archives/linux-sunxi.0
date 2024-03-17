Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C74E51EEFC
	for <linux-sunxi@lists.linux.dev>; Sun, 17 Mar 2024 19:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710704878; cv=none; b=DGyRoh/0jYsGNxB8lbgMOcJxvg65RzP4UF1YiBFyqMKhP4WAnvTcmyuG9TqMKDxvTdl6aZyW3whFLIq9YL7ZDuulOXPNvN4jpUc2Mwgt7+J9oW6E6NGwxNV+0UrrU2tGzHv0z1uG+oAM3HjeMuY8HULNJUPhe3jWgsCNDOmv6W8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710704878; c=relaxed/simple;
	bh=tAVWYYe9dpkSRvGr9SnXb4EgP8xnjDbkrGFp/vqltQs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tBpGCn5RhURrcjAojT+OcGdLTXMF86By2l6UQduvBIZi4FMP2zhazrSOfa9U6yIu/lUItKFxNjQx39LW6/nIFgjA2eAegmr8xneYN0pNvEgKd8K8gAH1TNn6MWeVMqP1Yw067ioC3/w+5F6/UisV7teLUNZz6yANG0L5DOBwWww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L5h9FVAd; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L5h9FVAd"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-55a179f5fa1so4179241a12.0
        for <linux-sunxi@lists.linux.dev>; Sun, 17 Mar 2024 12:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710704875; x=1711309675; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U2WVTygkXOkhQKlJ16ez8Cadly8Dz43/RCcghJb/HIc=;
        b=L5h9FVAd+6LacjFlG4gBMmJUm18y9zFrG+XKVBOwMTLpbXomRV93j0WagmulGCgDhI
         W5RZv2PF0xq6FD+jxG71kbFjtaJjKDU7Qjkv6mYC3Wqcn/5hy+dHP2S3pwqCebl5ghZN
         We0I3DU7Ua5/irKt/YDyQUYNJ6B09c4f7wraq1e1dQq2BPlwG+FErD9hZz+kIinTu08R
         JYk3+Sayk5a02bzZOjNIQVICw3LSLS+7RK2hVQhJ6HYzxCH+0jV24PPPgiVvp336ZFnh
         FJ0naB3/upIq9HI2lFIC1cZ9Oer4F1ThITNq9cJwPMp7w98ms1ea1nzseZOH/cmNBGgh
         WeVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710704875; x=1711309675;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U2WVTygkXOkhQKlJ16ez8Cadly8Dz43/RCcghJb/HIc=;
        b=FpCFrDAkk9Ni74FgJe0pj0h7EW/UVAXKQv9XTHjUfpREeTrRdsCQftJJIxYRlSePwN
         d6SmDnNqKhWxYdqGBpWZkSECqavSEmeWlM+wJ9pv1EGDXmIFW46plKykNObatEVgMLyp
         nK9+HG/NVgnRN9plzsNsiYmXvQt10bDmW/m2d6mXYX3qOtOiTV1GupJsY5QeIoyV41kU
         0OlBZ8jKs1yxciWiS0NruP12DgwIjpIoWH/GS1qMME2uGUqpT1U2CinMzId1tzLwuRux
         4mYLklV9wVLZigQ5VNQ/2Ddhul054T+yybHcitpNhQlMAV/ApYBdiLu7Jj2YtfiWAW/+
         y3Xw==
X-Forwarded-Encrypted: i=1; AJvYcCUp6VbdGoMsGSNPHqrnBC0k2Udkd9WQ6GJDrmZaNam9IHKc93jQKijXzX+XzmUnY3LRKnkhZq2ozJf3562gyI9v07xOX1d3sG4FhVI=
X-Gm-Message-State: AOJu0Yydl7tbeZjGCAxDzjWWmDeD8jAuEV5KNmmlU73hyrYnK/LItVr5
	3ek/5w+AAnDNRUZgbkE0BeAHXu4vkKPdj3sT9wWpsuCK8UhViGj8
X-Google-Smtp-Source: AGHT+IHp7mCzbQyCsHrpKahX1dBIPRwRQebxkYul3YQfTo5zZuWGAfF6r/KqoxX5oyAjRqBRwUKPNw==
X-Received: by 2002:a05:6402:390b:b0:568:c3c5:4641 with SMTP id fe11-20020a056402390b00b00568c3c54641mr2012523edb.40.1710704875118;
        Sun, 17 Mar 2024 12:47:55 -0700 (PDT)
Received: from ALDERLEJK. (89-76-44-138.dynamic.chello.pl. [89.76.44.138])
        by smtp.gmail.com with ESMTPSA id i24-20020aa7dd18000000b0056ac092a7fasm8234edv.87.2024.03.17.12.47.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Mar 2024 12:47:54 -0700 (PDT)
From: Kamil Kasperski <ressetkk@gmail.com>
Date: Sun, 17 Mar 2024 20:44:50 +0100
Subject: [PATCH v3 2/3] dt-bindings: arm: sunxi: add T95 AXP313
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240317-add-t95-axp313-support-v3-2-0d63f7c23d37@gmail.com>
References: <20240317-add-t95-axp313-support-v3-0-0d63f7c23d37@gmail.com>
In-Reply-To: <20240317-add-t95-axp313-support-v3-0-0d63f7c23d37@gmail.com>
To: Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 Kamil Kasperski <ressetkk@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0

Add T95 AXP313 TV Box variant to dt-bindings.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Kamil Kasperski <ressetkk@gmail.com>
---
 Documentation/devicetree/bindings/arm/sunxi.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index 09d835db6db5..6fe137605ba5 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -860,6 +860,11 @@ properties:
           - const: allwinner,sl631
           - const: allwinner,sun8i-v3
 
+      - description: T95 5G (AXP313) TV Box
+        items:
+          - const: t95,t95max-axp313
+          - const: allwinner,sun50i-h616
+
       - description: Tanix TX6
         items:
           - const: oranth,tanix-tx6

-- 
2.34.1

