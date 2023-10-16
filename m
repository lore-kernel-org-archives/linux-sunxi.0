Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ABBE381D7
	for <linux-sunxi@lists.linux.dev>; Mon, 16 Oct 2023 21:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-1e9c42fc0c9so1988655fac.1
        for <linux-sunxi@lists.linux.dev>; Mon, 16 Oct 2023 14:44:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697492694; x=1698097494;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tgkZY4yEAeEqDfcsSpYD9I+A+ikpbLIHeBQl2vVrEO0=;
        b=Mflat5ZXWRisKHP/tkeWXtMFqvPOyGhWlUmCb/didbuJHLXHanE5PKTcGTSdDGGZSK
         B+6fStLDlslyZhwt/owCXEHwB8cpRMYqVgJy2PfTnmGCP/oUOHu3Ck1lw8lZ99DZo2az
         bPAZZqy1AqJnLrApjFzKOsm+/ZoP8GcVjMqwcmVVLnbadU3/qau+NUA/nWPZiHRJXO97
         m/RwkC9rbavvJ3B/hUmzo9ev08sif+im4ccOgwKljCzHpIawUumtcwQNUN7EiDZ+QE+1
         QE9+HiGFalahhfHIw89S0sI/Mnvoj/Nk4FjKUdeX9uuVXK7ckg8m0bzeCmOPCXYEhheU
         JldA==
X-Gm-Message-State: AOJu0Yx+fSYoH8tX+7oDYsAUZ3j3J2B+sgqK9+0g2hlxoZ9Yc/4gGdmv
	MIFZa/QDSjldrzB9I7i0/g==
X-Google-Smtp-Source: AGHT+IER0+zM9rQTeSBTpDXhq27aL8B0l2V/HFAOMXgvaN9iR4T6Jv7HeoKsOLVk8pksacBkXQt5/g==
X-Received: by 2002:a05:6870:858c:b0:1d5:aed5:6579 with SMTP id f12-20020a056870858c00b001d5aed56579mr328754oal.4.1697492694494;
        Mon, 16 Oct 2023 14:44:54 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id r5-20020a05687032c500b001e5dd8a29c6sm8595oac.29.2023.10.16.14.44.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Oct 2023 14:44:53 -0700 (PDT)
Received: (nullmailer pid 3823224 invoked by uid 1000);
	Mon, 16 Oct 2023 21:44:35 -0000
From: Rob Herring <robh@kernel.org>
Date: Mon, 16 Oct 2023 16:44:27 -0500
Subject: [PATCH net-next 8/8] dt-bindings: net: dsa: Drop 'ethernet-ports'
 node properties
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231016-dt-net-cleanups-v1-8-a525a090b444@kernel.org>
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

Constraints on 'ethernet-ports' node properties are already defined by the
reference to ethernet-switch.yaml, so they can be dropped from the DSA
schema.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/net/dsa/dsa.yaml | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/dsa/dsa.yaml b/Documentation/devicetree/bindings/net/dsa/dsa.yaml
index e6010821f86f..6107189d276a 100644
--- a/Documentation/devicetree/bindings/net/dsa/dsa.yaml
+++ b/Documentation/devicetree/bindings/net/dsa/dsa.yaml
@@ -40,15 +40,6 @@ $defs:
 
     patternProperties:
       "^(ethernet-)?ports$":
-        type: object
-        additionalProperties: false
-
-        properties:
-          '#address-cells':
-            const: 1
-          '#size-cells':
-            const: 0
-
         patternProperties:
           "^(ethernet-)?port@[0-9a-f]+$":
             description: Ethernet switch ports

-- 
2.42.0

