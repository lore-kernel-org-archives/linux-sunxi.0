Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A7D8481DE
	for <linux-sunxi@lists.linux.dev>; Sun, 17 Dec 2023 21:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MhAaOh+j"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a233828ab91so81465566b.1
        for <linux-sunxi@lists.linux.dev>; Sun, 17 Dec 2023 13:09:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702847354; x=1703452154; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XxR6hF/d37at9Svy1FV0ihBmt4KDeen/lqmXip53gJA=;
        b=MhAaOh+jcR3MTyXx5XMpAEG1Uf2n+kMKjp05VPfry81ZeZX/4U88kBG9V3V0HKXFBJ
         p61zQewnstnWnYwM4jtYNqIrRbHFmR7550gTt0IIoKaB1A7h+/flfXBJr0mPsBzVj2nL
         xrKLx2pmSNAem19N5Pc2Lo9zrnREjj6TUa9e5XvjSBKiLpSD2iT8+9oyJV2I0MNstJm6
         0vAu0iu2fmgab3e3CpRSSlJEy11LPThMOTRjS7EVgj5reb64qd8mq8bdpLb+CFnbquw+
         vbOWAy+ARo2UvpoTorrNZ4GrdxxL6XQL/0z9l+WAd4gpN6InSMd2aRExey+aoqkevcQG
         ujWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702847354; x=1703452154;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XxR6hF/d37at9Svy1FV0ihBmt4KDeen/lqmXip53gJA=;
        b=bJFXQKZHmwmBLCUcnDxLBByciwxHTE0wcB55/wcEslfFsO2KzsLeiq021eEZbemqWm
         J+2ugk8yETBswllL2qeLB1bzn7hXAsPkhNgOecsNII7WRDcXRV5SqOVby0cDnQTqQ/cw
         1K8GUa+c7golhxmLn2j7Uw3ns4U3PLlSK+1sfyd+nxKCsPG6EEssy8FhvAgfzYvz88c2
         a0cmDAjv95T9gpJ4EILVSKD9Wp0/qq4BhMFKf49rikD4x1SPhhoZ0Mee4ygg03U2ynyu
         ppDu4i8aQo9X/u4zqPH9BTCRkKDvkmMOawf+LMDHKbCbs4G+Cc6BBdvylMCLR9Ze98xs
         W8VQ==
X-Gm-Message-State: AOJu0Yx7Rdg+udRxzJoBsLapFJJZL+FLwUAqLz/k8ATx0XAIqeh1WtsB
	icBV4wlnM0zsfPOZ7oumWvo=
X-Google-Smtp-Source: AGHT+IH8rZUBNlfMGfHajr+JWoOQrRyXykFKDWSFBD2jwvMitlgbukM748ZcSk7h6iptqsxEjLQnuQ==
X-Received: by 2002:a17:907:6d07:b0:a23:5369:9890 with SMTP id sa7-20020a1709076d0700b00a2353699890mr583642ejc.79.1702847354192;
        Sun, 17 Dec 2023 13:09:14 -0800 (PST)
Received: from wpc.yadro.com (188-169-139-214.dsl.utg.ge. [188.169.139.214])
        by smtp.gmail.com with ESMTPSA id vc11-20020a170907d08b00b00a1ce58e9fc7sm13316096ejc.64.2023.12.17.13.09.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Dec 2023 13:09:14 -0800 (PST)
From: Maksim Kiselev <bigunclemax@gmail.com>
To: 
Cc: Andre Przywara <andre.przywara@arm.com>,
	Maxim Kiselev <bigunclemax@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Vasily Khoruzhick <anarsoul@gmail.com>,
	Yangtao Li <tiny.windzz@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	John Watts <contact@jookia.org>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v6 1/3] dt-bindings: thermal: sun8i: Add binding for D1/T113s THS controller
Date: Mon, 18 Dec 2023 00:06:22 +0300
Message-Id: <20231217210629.131486-2-bigunclemax@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231217210629.131486-1-bigunclemax@gmail.com>
References: <20231217210629.131486-1-bigunclemax@gmail.com>
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
2.40.1

