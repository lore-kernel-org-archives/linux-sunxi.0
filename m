Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 053AB381BB
	for <linux-sunxi@lists.linux.dev>; Mon, 16 Oct 2023 21:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-3af65455e7fso3725302b6e.3
        for <linux-sunxi@lists.linux.dev>; Mon, 16 Oct 2023 14:44:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697492692; x=1698097492;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ht8N98xxNnhr4mxygYrnIRrNI1WvXoWdTJ8XF/XP/F8=;
        b=bgvDKQYZwVB/pTYEjZS9pZVbN8G6SHgWQ7W897cgwmeY5MAgaOHlLm8nPNljJPoAH8
         aFvtPCGo9kFRDaQ7y0f+lwMqYhXQGtXBETTEzle027j4Tdl4RVU8F5lM2QoQ7bcGuAQc
         ZhRPs/b1JeTjlPMjcabQb5GvQiNxX56mqiOOKvig4tN0lehAFC8jpA8il+XvKJQEl4wC
         t2PRnGvqniNQgD/L+9imSReqNx1lDDVX4D755/+aYAcrW8FoeegYFdf8+wiSqLGxnTKi
         binwKDIbrSOMoLOyKy7djUgzwIODku5LjFT9GByBI20hlD5zo1FF3XNZOsYHuj4/gbMP
         bAow==
X-Gm-Message-State: AOJu0YzKexxKFcDlagSUChgXTmM0CZXv8G+xDs5hJeqSB9HC86jUswli
	rrUaF/vEikwNWwfgFzC9fsEjHBSsWw==
X-Google-Smtp-Source: AGHT+IGRRlSS/F1kWukUHeHHHZmSLPVKA0n8LTYOyHwpWpjScHo01PEc7nh9ywAQ/bdErdN4oiSVXg==
X-Received: by 2002:a05:6808:3a82:b0:3ae:1446:d48b with SMTP id fb2-20020a0568083a8200b003ae1446d48bmr592595oib.3.1697492691930;
        Mon, 16 Oct 2023 14:44:51 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id v11-20020a54448b000000b003af732a2054sm28836oiv.57.2023.10.16.14.44.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Oct 2023 14:44:51 -0700 (PDT)
Received: (nullmailer pid 3823220 invoked by uid 1000);
	Mon, 16 Oct 2023 21:44:35 -0000
From: Rob Herring <robh@kernel.org>
Date: Mon, 16 Oct 2023 16:44:25 -0500
Subject: [PATCH net-next 6/8] dt-bindings: net: mscc,vsc7514-switch:
 Clean-up example indentation
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231016-dt-net-cleanups-v1-6-a525a090b444@kernel.org>
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

The indentation for the example is completely messed up for
'ethernet-ports'. Fix it.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../bindings/net/mscc,vsc7514-switch.yaml          | 32 +++++++++++-----------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/mscc,vsc7514-switch.yaml b/Documentation/devicetree/bindings/net/mscc,vsc7514-switch.yaml
index 8ee2c7d7ff42..07de52a3a295 100644
--- a/Documentation/devicetree/bindings/net/mscc,vsc7514-switch.yaml
+++ b/Documentation/devicetree/bindings/net/mscc,vsc7514-switch.yaml
@@ -185,7 +185,7 @@ examples:
     };
   # VSC7512 (DSA)
   - |
-    ethernet-switch@1{
+    ethernet-switch@1 {
       compatible = "mscc,vsc7512-switch";
       reg = <0x71010000 0x10000>,
             <0x71030000 0x10000>,
@@ -212,22 +212,22 @@ examples:
             "port7", "port8", "port9", "port10", "qsys",
             "ana", "s0", "s1", "s2";
 
-            ethernet-ports {
-            #address-cells = <1>;
-            #size-cells = <0>;
-
-           port@0 {
-            reg = <0>;
-            ethernet = <&mac_sw>;
-            phy-handle = <&phy0>;
-            phy-mode = "internal";
-          };
-          port@1 {
-            reg = <1>;
-            phy-handle = <&phy1>;
-            phy-mode = "internal";
-          };
+      ethernet-ports {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        port@0 {
+          reg = <0>;
+          ethernet = <&mac_sw>;
+          phy-handle = <&phy0>;
+          phy-mode = "internal";
+        };
+        port@1 {
+          reg = <1>;
+          phy-handle = <&phy1>;
+          phy-mode = "internal";
         };
       };
+    };
 
 ...

-- 
2.42.0

