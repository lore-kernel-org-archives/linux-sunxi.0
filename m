Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E2D1381BB
	for <linux-sunxi@lists.linux.dev>; Mon, 16 Oct 2023 21:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3ae2f8bf865so3136390b6e.2
        for <linux-sunxi@lists.linux.dev>; Mon, 16 Oct 2023 14:44:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697492684; x=1698097484;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gmfkMrLhqQX7VpvIedVUrmMesFIoJFx2r4z/RkhPLxM=;
        b=AQqCegU1LmUn/Dw9Ccd4oniDOFZNZGrWHoFbwSHS8QkmOifwP4RRETlApGAuR18iw5
         nvEPOR/SOA6hQDdTQgIK9zNTPmd+wa61GZqq7U9itcIZQjPneQ/mjPLA+09dHvKqcf5i
         GDASQqVHbxNAmTUodrTGvvRT3Bgndy/g8esazN2jeKP75/uZe3IVmNCW8dwoqdvHUEbT
         T1caACXFKSYGbwhNrBmZiPrh9DH6E3Wn5hu9ewjl57fgbwg6l8i3OB4EUWTRqgSJwBkz
         MlKoLB+hm80X20NiYoEl8XXHHzV65uUyzUqBlQ/LotQRwo4NR3CimW4Pgc7+7YZF8fBQ
         mDIg==
X-Gm-Message-State: AOJu0YyVOun9hlX6Lh+oc1pZdPlTtqLFURkAAkJZW1qwzo7LKnhKy92G
	EOjrBDRdVmocl9ssyntsxA==
X-Google-Smtp-Source: AGHT+IEfQAxm2ySnC9Gqk/TcrPYQDumHS+zWd/KV4/wqiJrieKXvQch4seXQxakefCL/Mkb1Co/iqw==
X-Received: by 2002:a05:6808:18a2:b0:3a7:4b9a:43c2 with SMTP id bi34-20020a05680818a200b003a74b9a43c2mr700359oib.13.1697492684081;
        Mon, 16 Oct 2023 14:44:44 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id bi5-20020a056808188500b003ac9e775706sm32192oib.1.2023.10.16.14.44.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Oct 2023 14:44:43 -0700 (PDT)
Received: (nullmailer pid 3823216 invoked by uid 1000);
	Mon, 16 Oct 2023 21:44:35 -0000
From: Rob Herring <robh@kernel.org>
Date: Mon, 16 Oct 2023 16:44:23 -0500
Subject: [PATCH net-next 4/8] dt-bindings: net: ethernet-switch: Add
 missing 'ethernet-ports' level
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231016-dt-net-cleanups-v1-4-a525a090b444@kernel.org>
References: <20231016-dt-net-cleanups-v1-0-a525a090b444@kernel.org>
In-Reply-To: <20231016-dt-net-cleanups-v1-0-a525a090b444@kernel.org>
To: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Andrew Lunn <andrew@lunn.ch>, 
	Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean <olteanv@gmail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Woojung Huh <woojung.huh@microchip.com>, UNGLinuxDriver@microchip.com, 
	Linus Walleij <linus.walleij@linaro.org>, =?UTF-8?Q?Alvin_=C5=A0ipraga?= <alsi@bang-olufsen.dk>, 
	=?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Maxime Ripard <mripard@kernel.org>, =?UTF-8?B?bsOnIMOcTkFM?= <arinc.unal@arinc9.com>, 
	Landen Chao <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, 
	Sean Wang <sean.wang@mediatek.com>, Daniel Golle <daniel@makrotopia.org>, 
	John Crispin <john@phrozen.org>, Gerhard Engleder <gerhard@engleder-embedded.com>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Sergey Shtylyov <s.shtylyov@omp.ru>, 
	Sergei Shtylyov <sergei.shtylyov@gmail.com>, Justin Chen <justin.chen@broadcom.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Grygorii Strashko <grygorii.strashko@ti.com>, Sekhar Nori <nsekhar@ti.com>, 
	Claudiu Manoil <claudiu.manoil@nxp.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Vladimir Oltean <vladimir.oltean@nxp.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com
X-Mailer: b4 0.13-dev

The '$defs/ethernet-ports' schema is referenced by schemas defining a
child node 'ethernet-ports', but this schema misses the
'ethernet-ports' node. It would work if referring schemas made a
reference like this:

properties:
  ethernet-ports:
    $ref: ethernet-switch.yaml#/$defs/ethernet-ports

However, that would be different from how dsa.yaml works. For
consistency, align the schema definition with dsa.yaml and add the
missing level.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/net/ethernet-switch.yaml | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/ethernet-switch.yaml b/Documentation/devicetree/bindings/net/ethernet-switch.yaml
index dcbffe19d71a..688938c2e261 100644
--- a/Documentation/devicetree/bindings/net/ethernet-switch.yaml
+++ b/Documentation/devicetree/bindings/net/ethernet-switch.yaml
@@ -58,9 +58,11 @@ $defs:
     $ref: '#'
 
     patternProperties:
-      "^(ethernet-)?port@[0-9a-f]+$":
-        description: Ethernet switch ports
-        $ref: ethernet-switch-port.yaml#
-        unevaluatedProperties: false
+      "^(ethernet-)?ports$":
+        patternProperties:
+          "^(ethernet-)?port@[0-9a-f]+$":
+            description: Ethernet switch ports
+            $ref: ethernet-switch-port.yaml#
+            unevaluatedProperties: false
 
 ...

-- 
2.42.0

