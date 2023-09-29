Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE02A516D1
	for <linux-sunxi@lists.linux.dev>; Fri, 29 Sep 2023 14:45:00 +0000 (UTC)
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-57b8a0f320dso6009401eaf.1
        for <linux-sunxi@lists.linux.dev>; Fri, 29 Sep 2023 07:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695998699; x=1696603499; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gGhQthT64pdSxzZ5aTBXuH64J4biaW8ztdfRr2G2cDM=;
        b=ggiQ0FrCyVeVtqgLm641hmMfhRcKQEi2iTcI7X8vV4u3CXcY3YqNtJLOjEB+sOGHBm
         BP+OMpMLDxJ8rf3SGO7MdGELlmcmumOg1jcO4jusxahHnrCfGeLmiulB4WQxsNDb5MTS
         FqxvRy6+dks4fX7qe6RecIT1phSwk52UZrBdIKwO5/lt6zJk43ew0gD2RV4/vDzoER2E
         aD8niR9O9PttGoMNR3P+I9BC21+/9FIkbf8yUo1v+1iKs4O5g2Vp7M/fwghEllNz0QRF
         ojnQzgGkn/W/TzkZX/uWFOy2uXvOFtA5O+uPnQoBqlyQTtL1Eh8o0Jyd3fey5qeSHBFx
         XvDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695998699; x=1696603499;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gGhQthT64pdSxzZ5aTBXuH64J4biaW8ztdfRr2G2cDM=;
        b=HnYqPHyfTr7OnZ1cpT+ad9AhFDUsbZU60BPiXCjLq+vtgDo81pLZn7mW7IAqR6xJYd
         OTgHKb1bE4OcJTGMQyyoAiCgJOQKOmb7AwKzhYsVV+l5KJqVJ6fI9ET3orD9yc8BQlhT
         bpaMZGfqpxcdDaSDoSpD8IzegWsgokw7INqXbYmV1rah/Ha8Akj0OrBznWb6qzspQsaY
         vXUd3y9ows5tCup7W0cqIpff4ujYaK+YH0YSXjDqI5CYzvNA4gvlqyWlVD9JUzrD/mu5
         vA8dhxAWqGj8GoFevHnlkJLOlgpDxJ5kBjEQNuS3oWkmPMF0aE4F1NlfU8gJa7jmQhls
         c/Qw==
X-Gm-Message-State: AOJu0YwEIW+a1bvK7dhBOi8UuAOXZf8Ei7y6C6QZX2idqNTaVCN3/9/T
	pC7zkc7RGGRYZLH8qXw67iDKKrl7fB0=
X-Google-Smtp-Source: AGHT+IELq6iwO1Fa157H4tcNZ5YXb3nXTi/tPLBGB2vyJx6Y8gwTC2FoYMVGNpnR7EeH15ZCLR3LPA==
X-Received: by 2002:a4a:2742:0:b0:57b:a346:167e with SMTP id w2-20020a4a2742000000b0057ba346167emr4474794oow.6.1695998699351;
        Fri, 29 Sep 2023 07:44:59 -0700 (PDT)
Received: from localhost.localdomain ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id q19-20020a9d6653000000b006b753685cc5sm3012619otm.79.2023.09.29.07.44.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 07:44:58 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: devicetree@vger.kernel.org,
	mripard@kernel.org,
	uwu@icenowy.me,
	samuel@sholland.org,
	jernej.skrabec@gmail.com,
	wens@csie.org,
	conor+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	robh+dt@kernel.org,
	andre.przywara@arm.com,
	Chris Morgan <macromorgan@hotmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH V6 3/4] dt-bindings: arm: sunxi: add Anbernic RG-Nano
Date: Fri, 29 Sep 2023 09:44:40 -0500
Message-Id: <20230929144441.3409-4-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230929144441.3409-1-macroalpha82@gmail.com>
References: <20230929144441.3409-1-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

The Anbernic RG-Nano is a portable handheld console from Anbernic which
uses the Allwinner V3s SoC.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Andre Przywara <andre.przywara@arm.com>
---
 Documentation/devicetree/bindings/arm/sunxi.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index e4dd678f4212..1929a0a475fd 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -51,6 +51,11 @@ properties:
           - const: allwinner,parrot
           - const: allwinner,sun8i-a33
 
+      - description: Anbernic RG-Nano
+        items:
+          - const: anbernic,rg-nano
+          - const: allwinner,sun8i-v3s
+
       - description: Amarula A64 Relic
         items:
           - const: amarula,a64-relic
-- 
2.34.1

