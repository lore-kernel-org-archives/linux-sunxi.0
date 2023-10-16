Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1061381BB
	for <linux-sunxi@lists.linux.dev>; Mon, 16 Oct 2023 21:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-6c6368a1a97so3017699a34.1
        for <linux-sunxi@lists.linux.dev>; Mon, 16 Oct 2023 14:44:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697492687; x=1698097487;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3u8MwZO/uTMniT8O9fzxMnkQinvsfIqPjmwsPljhL/U=;
        b=xUT1mXxYiekUu/1SVshApdLy393xu6q8B7Ip+dWH0gDwDEKrrq6XSIKhZetgYBml2t
         UJAWOVGE+eNSb2RFEU92DPyi9V7CrkNjjWfjBt7FR3B9VkaK2+n8iAjhDaIHDzpVXC14
         sjTjki/JtrzcJEFFUbuSouYOiFg6wNi9WFLq4rTOrldVHvzMtA+NJuFHyMmWc22PpPDo
         5lorjJhZFa0P4WUXmME9fdNPmHohIK+duRK6ptuAjidZ0YbgtpIUHPoTFrGHRGdC8KI+
         8Vj0r24czYOtIlrNDlY48YbVUadvhkw6BN6acWC46nCjWu66mzD03ZYdV/6Ii1rC//EK
         hTQQ==
X-Gm-Message-State: AOJu0Yzbv3sNtbFsUlpO53+Xu/xjv/b8b0UxNAjgAlGjGEi4UP1zmh6Y
	PBXUj0gyx7scAzqludEgKMPvwd9NBg==
X-Google-Smtp-Source: AGHT+IE4SwXq4h7uY4ziiMKnfiIle2I3ym0yy+YjuXM+z1MdMac0LpulZcsCfiCM5Uqisbpc/DAs1g==
X-Received: by 2002:a05:6808:238f:b0:3af:6b0c:fedf with SMTP id bp15-20020a056808238f00b003af6b0cfedfmr23647oib.24.1697492686807;
        Mon, 16 Oct 2023 14:44:46 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id h13-20020a4adccd000000b0057df0bcab46sm13975oou.45.2023.10.16.14.44.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Oct 2023 14:44:46 -0700 (PDT)
Received: (nullmailer pid 3823222 invoked by uid 1000);
	Mon, 16 Oct 2023 21:44:35 -0000
From: Rob Herring <robh@kernel.org>
Date: Mon, 16 Oct 2023 16:44:26 -0500
Subject: [PATCH net-next 7/8] dt-bindings: net: mscc,vsc7514-switch:
 Simplify DSA and switch references
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231016-dt-net-cleanups-v1-7-a525a090b444@kernel.org>
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

The mscc,vsc7514-switch schema doesn't add any custom port properties,
so it can just reference ethernet-switch.yaml#/$defs/base and
dsa.yaml#/$defs/ethernet-ports instead of the base file and can skip
defining port nodes.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/net/mscc,vsc7514-switch.yaml       | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/mscc,vsc7514-switch.yaml b/Documentation/devicetree/bindings/net/mscc,vsc7514-switch.yaml
index 07de52a3a295..86a9c3fc76c8 100644
--- a/Documentation/devicetree/bindings/net/mscc,vsc7514-switch.yaml
+++ b/Documentation/devicetree/bindings/net/mscc,vsc7514-switch.yaml
@@ -24,7 +24,7 @@ allOf:
         compatible:
           const: mscc,vsc7514-switch
     then:
-      $ref: ethernet-switch.yaml#
+      $ref: ethernet-switch.yaml#/$defs/ethernet-ports
       required:
         - interrupts
         - interrupt-names
@@ -33,28 +33,18 @@ allOf:
           minItems: 21
         reg-names:
           minItems: 21
-        ethernet-ports:
-          patternProperties:
-            "^port@[0-9a-f]+$":
-              $ref: ethernet-switch-port.yaml#
-              unevaluatedProperties: false
 
   - if:
       properties:
         compatible:
           const: mscc,vsc7512-switch
     then:
-      $ref: /schemas/net/dsa/dsa.yaml#
+      $ref: /schemas/net/dsa/dsa.yaml#/$defs/ethernet-ports
       properties:
         reg:
           maxItems: 20
         reg-names:
           maxItems: 20
-        ethernet-ports:
-          patternProperties:
-            "^port@[0-9a-f]+$":
-              $ref: /schemas/net/dsa/dsa-port.yaml#
-              unevaluatedProperties: false
 
 properties:
   compatible:

-- 
2.42.0

