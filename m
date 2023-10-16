Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 841CF381CD
	for <linux-sunxi@lists.linux.dev>; Mon, 16 Oct 2023 21:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-1e562706d29so2799874fac.2
        for <linux-sunxi@lists.linux.dev>; Mon, 16 Oct 2023 14:44:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697492681; x=1698097481;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4BhNqPjC35KssOVWym22Xm+PXqXG2BALMex6wzlPMLg=;
        b=cWtXOfkmgDwhi3cETZI8Gtbgl88YbhPbju6bzAirf78YvJccIp9/An6FZfVEnP5uOr
         jFWoNKb7Y2aDpU/3i0elHDiSKcl3DF6r5sqp69cZCeINU9zAUrqEg2CHyAKcbBfR6Rut
         5S/lgQmP6jGECEzPVd7HwY/AZ9Eod+x52KrQJ1xdt+/3pJm/qJ0mjtffpQm/COfRB8te
         YDW6esg1zK36Czelb7xLVPYjFvKc6WHq7XOBbgzVmb1RvmIUXkvB+ufVEhDYwogd1CbI
         hRSkTZgYdw+Nn8f9kgyQiy0ugqA3O4511J68GjFjaBfHu7IAVORf2jQKUAcJsphBhAha
         5vOg==
X-Gm-Message-State: AOJu0Yw0BvBSBkqgVNoMaQJ+VRT7ipq6SqhlSoQyTOJwK/55GhmOPwZ2
	uEpRGdnQZRjQx4ceC9Eiuw==
X-Google-Smtp-Source: AGHT+IHELa3QHrlqv0npdH8PwKmFcvXksdJa9jP/xfBiEmi6ssht9Ijd5bifDAScNBAJ1b9VgjfDuQ==
X-Received: by 2002:a05:6870:110f:b0:1e9:a248:b1b3 with SMTP id 15-20020a056870110f00b001e9a248b1b3mr277337oaf.49.1697492681546;
        Mon, 16 Oct 2023 14:44:41 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id cb20-20020a056871e11400b001ea17894928sm8906oac.21.2023.10.16.14.44.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Oct 2023 14:44:40 -0700 (PDT)
Received: (nullmailer pid 3823214 invoked by uid 1000);
	Mon, 16 Oct 2023 21:44:35 -0000
From: Rob Herring <robh@kernel.org>
Date: Mon, 16 Oct 2023 16:44:22 -0500
Subject: [PATCH net-next 3/8] dt-bindings: net: dsa/switch: Make
 'ethernet-port' node addresses hex
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231016-dt-net-cleanups-v1-3-a525a090b444@kernel.org>
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

'ethernet-port' node unit-addresses should be in hexadecimal. Some
instances have it correct, but fix the ones that don't.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/net/brcm,asp-v2.0.yaml         | 2 +-
 Documentation/devicetree/bindings/net/dsa/dsa.yaml               | 2 +-
 Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml   | 6 +++---
 Documentation/devicetree/bindings/net/dsa/microchip,lan937x.yaml | 2 +-
 Documentation/devicetree/bindings/net/dsa/nxp,sja1105.yaml       | 2 +-
 Documentation/devicetree/bindings/net/ethernet-switch.yaml       | 4 ++--
 Documentation/devicetree/bindings/net/ti,cpsw-switch.yaml        | 2 +-
 7 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/brcm,asp-v2.0.yaml b/Documentation/devicetree/bindings/net/brcm,asp-v2.0.yaml
index aa3162c74833..75d8138298fb 100644
--- a/Documentation/devicetree/bindings/net/brcm,asp-v2.0.yaml
+++ b/Documentation/devicetree/bindings/net/brcm,asp-v2.0.yaml
@@ -53,7 +53,7 @@ properties:
         const: 0
 
     patternProperties:
-      "^port@[0-9]+$":
+      "^port@[0-9a-f]+$":
         type: object
 
         $ref: ethernet-controller.yaml#
diff --git a/Documentation/devicetree/bindings/net/dsa/dsa.yaml b/Documentation/devicetree/bindings/net/dsa/dsa.yaml
index ec74a660beda..e6010821f86f 100644
--- a/Documentation/devicetree/bindings/net/dsa/dsa.yaml
+++ b/Documentation/devicetree/bindings/net/dsa/dsa.yaml
@@ -50,7 +50,7 @@ $defs:
             const: 0
 
         patternProperties:
-          "^(ethernet-)?port@[0-9]+$":
+          "^(ethernet-)?port@[0-9a-f]+$":
             description: Ethernet switch ports
             $ref: dsa-port.yaml#
             unevaluatedProperties: false
diff --git a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
index 20f7ba4e2203..5038818e9f2e 100644
--- a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
+++ b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
@@ -157,7 +157,7 @@ patternProperties:
     additionalProperties: true
 
     patternProperties:
-      "^(ethernet-)?port@[0-9]+$":
+      "^(ethernet-)?port@[0-6]$":
         type: object
         additionalProperties: true
 
@@ -186,7 +186,7 @@ $defs:
     patternProperties:
       "^(ethernet-)?ports$":
         patternProperties:
-          "^(ethernet-)?port@[0-9]+$":
+          "^(ethernet-)?port@[0-6]$":
             if:
               required: [ ethernet ]
             then:
@@ -212,7 +212,7 @@ $defs:
     patternProperties:
       "^(ethernet-)?ports$":
         patternProperties:
-          "^(ethernet-)?port@[0-9]+$":
+          "^(ethernet-)?port@[0-6]$":
             if:
               required: [ ethernet ]
             then:
diff --git a/Documentation/devicetree/bindings/net/dsa/microchip,lan937x.yaml b/Documentation/devicetree/bindings/net/dsa/microchip,lan937x.yaml
index 6a4d90d550b6..9973d64f15a7 100644
--- a/Documentation/devicetree/bindings/net/dsa/microchip,lan937x.yaml
+++ b/Documentation/devicetree/bindings/net/dsa/microchip,lan937x.yaml
@@ -39,7 +39,7 @@ patternProperties:
   "^(ethernet-)?ports$":
     additionalProperties: true
     patternProperties:
-      "^(ethernet-)?port@[0-9]+$":
+      "^(ethernet-)?port@[0-7]$":
         allOf:
           - if:
               properties:
diff --git a/Documentation/devicetree/bindings/net/dsa/nxp,sja1105.yaml b/Documentation/devicetree/bindings/net/dsa/nxp,sja1105.yaml
index d179c6971193..9432565f4f5d 100644
--- a/Documentation/devicetree/bindings/net/dsa/nxp,sja1105.yaml
+++ b/Documentation/devicetree/bindings/net/dsa/nxp,sja1105.yaml
@@ -77,7 +77,7 @@ patternProperties:
   "^(ethernet-)?ports$":
     additionalProperties: true
     patternProperties:
-      "^(ethernet-)?port@[0-9]+$":
+      "^(ethernet-)?port@[0-9]$":
         allOf:
           - if:
               properties:
diff --git a/Documentation/devicetree/bindings/net/ethernet-switch.yaml b/Documentation/devicetree/bindings/net/ethernet-switch.yaml
index f1b9075dc7fb..dcbffe19d71a 100644
--- a/Documentation/devicetree/bindings/net/ethernet-switch.yaml
+++ b/Documentation/devicetree/bindings/net/ethernet-switch.yaml
@@ -36,7 +36,7 @@ patternProperties:
         const: 0
 
     patternProperties:
-      "^(ethernet-)?port@[0-9]+$":
+      "^(ethernet-)?port@[0-9a-f]+$":
         type: object
         description: Ethernet switch ports
 
@@ -58,7 +58,7 @@ $defs:
     $ref: '#'
 
     patternProperties:
-      "^(ethernet-)?port@[0-9]+$":
+      "^(ethernet-)?port@[0-9a-f]+$":
         description: Ethernet switch ports
         $ref: ethernet-switch-port.yaml#
         unevaluatedProperties: false
diff --git a/Documentation/devicetree/bindings/net/ti,cpsw-switch.yaml b/Documentation/devicetree/bindings/net/ti,cpsw-switch.yaml
index b04ac4966608..f07ae3173b03 100644
--- a/Documentation/devicetree/bindings/net/ti,cpsw-switch.yaml
+++ b/Documentation/devicetree/bindings/net/ti,cpsw-switch.yaml
@@ -86,7 +86,7 @@ properties:
         const: 0
 
     patternProperties:
-      "^port@[0-9]+$":
+      "^port@[12]$":
         type: object
         description: CPSW external ports
 

-- 
2.42.0

