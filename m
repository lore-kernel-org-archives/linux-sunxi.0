Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E38812567
	for <linux-sunxi@lists.linux.dev>; Mon, 12 Jun 2023 06:34:53 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-30aeee7c8a0so2808366f8f.1
        for <linux-sunxi@lists.linux.dev>; Sun, 11 Jun 2023 23:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686551692; x=1689143692;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Y8eii1r9u9BsE8Cxn/BFgcHPymaswarfpY9l4mkywE=;
        b=ZAaXZp4/9jJdFrlaJt//A975V5KFr18KKjaqZJL99m+R3rAUMRW75BihMX3aOuyj0X
         e8kRs9obAZYgf7I2Y3pg0oh+o1isSogPI2ujI+41SOnUu7WWfXxwBkjlL/qBYq/cYYSY
         CubUAtlXb0fhlfO+17LU0EPQ80i1crxpSRDGCN/40/pakBq7BZOQsrnR7Ra9R3nATPta
         s1WcArFjjyDA6lcWkiZpL8lQYJ7RGWlQAMafjEXMJUa6cqP9ssqDaRxaa6jUIObgLvFu
         uCnxQ5+CcGi6TNwKghMCnpv8PDgKBj5sPUbyp6/FB/z74DBnVukVF49Prxaqz9iVpc3H
         umQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686551692; x=1689143692;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6Y8eii1r9u9BsE8Cxn/BFgcHPymaswarfpY9l4mkywE=;
        b=Qy2Mm3mmdqBymuUEd1SOECVZVw+yzg8w/2ene481TVFj61pTKYS+rS5prQMpq03meU
         4pUVu0PN9Yy0agRx2gGR1KQL9h5ChtTxEy1ATQI36YuKV62dj+FlOOaa/kxtrRBnq/02
         lCvtEo1JMXoVR/1QgSMw8ofv4TNbcFhklbNrhEqdPSJBLSsaAfpd2RKS3kFOJvGci3kY
         Fv6eULvIb6cPykCpimPdf7v1oeK3opizLzxeklISfuO2WdWiR7Il+taxIG0R0h+m/NeW
         CvM+RnyflZpsvp/Oq8w0XMCpwxxQum+tsBzGZ9ZPtvjI6NUiL5jGUu40UxOQQfVx9+Ys
         eD2g==
X-Gm-Message-State: AC+VfDwyuk56VUXSdmlWzag/w2ha8+ufEQswFK0vtqevBW8A78KJf8TG
	kt6J4U5AmT+p4Pzgvr86Hw8=
X-Google-Smtp-Source: ACHHUZ5nt+lzj3Wg3zQ4rD9gaZz+/l3OHW18BrkJU41XeJWwzOn3KBnOCwWtefUgvHmFM6IN7K127w==
X-Received: by 2002:a5d:514b:0:b0:30f:b8b2:5aed with SMTP id u11-20020a5d514b000000b0030fb8b25aedmr3442010wrt.11.1686551691721;
        Sun, 11 Jun 2023 23:34:51 -0700 (PDT)
Received: from user-PC.. ([178.134.198.138])
        by smtp.gmail.com with ESMTPSA id o7-20020adfeac7000000b002fed865c55esm11484811wrn.56.2023.06.11.23.34.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jun 2023 23:34:51 -0700 (PDT)
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
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: [PATCH v4 1/3] dt-bindings: thermal: sun8i: Add binding for D1/T113s THS controller
Date: Mon, 12 Jun 2023 09:34:17 +0300
Message-Id: <20230612063429.3343061-2-bigunclemax@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230612063429.3343061-1-bigunclemax@gmail.com>
References: <20230612063429.3343061-1-bigunclemax@gmail.com>
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

