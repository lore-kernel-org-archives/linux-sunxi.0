Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 403E26FBB
	for <linux-sunxi@lists.linux.dev>; Wed, 14 Jun 2023 12:55:53 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-3f8d17639feso7432605e9.2
        for <linux-sunxi@lists.linux.dev>; Wed, 14 Jun 2023 05:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686747352; x=1689339352;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Y8eii1r9u9BsE8Cxn/BFgcHPymaswarfpY9l4mkywE=;
        b=EBmpjVhBuG8USId5EMZUbNdW6u+JlW25TLBTVA9pMQyCea1mEZvHL1T4pkMx2eroiz
         O0K7NrbBzy1F5Ye+gd1WG6BETBOnQM9anZMNK8TOpHeY7qyk9drC8l5gCY0KyfFcFJSt
         QdyXal+eegewyCBm5hwUZNQ8Fa+NT4rIMZ5qdmm5xIw2tsJX3kA0U09TjWiNakdDVxfI
         gO6kIkAURmUIvWm7VLl9ezDGXyJwA34x/hAn2J90+Mlt8WAyM/E187pY7/CNjnoc94Di
         DT63aDOKKJaEP46HLELW/kyqmIUXqTE5htmlauLNrIKYAEkTIkf1X6U64mHSpQeyDQgd
         RjFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686747352; x=1689339352;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6Y8eii1r9u9BsE8Cxn/BFgcHPymaswarfpY9l4mkywE=;
        b=FYG9TIZ1tNVENloW0x9oMMbXMPWDUDVNcHvGNnsYWeOAhNXsHTsR51juJTv/I2COuG
         WqqaxFR4r/klUxz0rN+S+SQtrnjzkY6tQfmqdbmskU7ud3wH13Q5LzDSFply/+pT5+sk
         q+HbdKZ7OUs75Dm3JKCsSOPs0YA9PgxgbphvxpXx4VhS1MymU8AIdGcKm+lIrttGqLVB
         s/6bfS3B74hWZRCYX6DO7cOhIeXpyJUVjLve70N18NcRcQGn5C2kBYuACGqsdXcz7MI4
         SgyMj/0n+IYfEoogvr9eR++Z2PqjBPMTd8/OgXhVOggUqhaSU1ZuKUSjX/PCXiH0HKiD
         njDg==
X-Gm-Message-State: AC+VfDzA3jdnVvwdtAk8LItpWAWseGfXeDmvI8o+4wS7mhVmxO8HmfIN
	yhZaVDn8UPlRBB6HTG4/ExQ=
X-Google-Smtp-Source: ACHHUZ7SAHgLvBtL/br477qMLUb626VlO3QGqyv4Wm6I/D/QtIR5Wjs5U48AhWp5oiSwn5abyy6svQ==
X-Received: by 2002:a1c:7906:0:b0:3f7:e48b:974d with SMTP id l6-20020a1c7906000000b003f7e48b974dmr13047139wme.27.1686747352125;
        Wed, 14 Jun 2023 05:55:52 -0700 (PDT)
Received: from user-PC.. ([92.51.95.194])
        by smtp.gmail.com with ESMTPSA id c21-20020a05600c0ad500b003f7310a3ffasm17402522wmr.2.2023.06.14.05.55.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 05:55:51 -0700 (PDT)
From: Maksim Kiselev <bigunclemax@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Maxim Kiselev <bigunclemax@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Vasily Khoruzhick <anarsoul@gmail.com>,
	Yangtao Li <tiny.windzz@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Amit Kucheria <amitk@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Andre Przywara <andre.przywara@arm.com>,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: [PATCH v5 1/3] dt-bindings: thermal: sun8i: Add binding for D1/T113s THS controller
Date: Wed, 14 Jun 2023 15:55:19 +0300
Message-Id: <20230614125530.660597-2-bigunclemax@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230614125530.660597-1-bigunclemax@gmail.com>
References: <20230614125530.660597-1-bigunclemax@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Maxim Kiselev <bigunclemax@gmail.com>

Add a binding for D1/T113s thermal sensor controller.

Signed-off-by: Maxim Kiselev <bigunclemax@gmail.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/thermal/allwinner,sun8i-a83t-ths.yaml         | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.yaml b/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.yaml
index fbd4212285e2..9b2272a9ec15 100644
--- a/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.yaml
+++ b/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.yaml
@@ -16,6 +16,7 @@ properties:
       - allwinner,sun8i-a83t-ths
       - allwinner,sun8i-h3-ths
       - allwinner,sun8i-r40-ths
+      - allwinner,sun20i-d1-ths
       - allwinner,sun50i-a64-ths
       - allwinner,sun50i-a100-ths
       - allwinner,sun50i-h5-ths
@@ -61,6 +62,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - allwinner,sun20i-d1-ths
               - allwinner,sun50i-a100-ths
               - allwinner,sun50i-h6-ths
 
@@ -84,7 +86,9 @@ allOf:
       properties:
         compatible:
           contains:
-            const: allwinner,sun8i-h3-ths
+            enum:
+              - allwinner,sun8i-h3-ths
+              - allwinner,sun20i-d1-ths
 
     then:
       properties:
@@ -103,6 +107,7 @@ allOf:
             enum:
               - allwinner,sun8i-h3-ths
               - allwinner,sun8i-r40-ths
+              - allwinner,sun20i-d1-ths
               - allwinner,sun50i-a64-ths
               - allwinner,sun50i-a100-ths
               - allwinner,sun50i-h5-ths
-- 
2.39.2

