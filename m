Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2D6A381BA
	for <linux-sunxi@lists.linux.dev>; Mon, 16 Oct 2023 21:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-6c67060fdfbso3584084a34.2
        for <linux-sunxi@lists.linux.dev>; Mon, 16 Oct 2023 14:44:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697492679; x=1698097479;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gEGU67h2aLgP+jVHENE55AMROY3oIX9Sz/12+e/BNPI=;
        b=xSn3bR9f9sL0lfslIC9/SS/FRmMM7RHmjtn/ZcMmg3rl2ER+HtVn7Hi4BEx/YzVv95
         nPuKu0J2+2unWRcyVf0+o34H8jLOdoe7ok47JQenk70BKPfAe5tYC2psvQPYjmNlDwco
         yHeXKMahfO8UwKIHMfe9CTEJVG6VBX2ZWl6jVf+jIvXCOxKacFXKCbqvaasURVapguF7
         TKl5g+917IZrpXifIdRVPrW3ZrBt2Jk3AdIApyaoW3yT9Fd/HK7g9aJcJEbpj7fKySAZ
         R/NlfE18/D1kLC3ye7Q/l/SDL45PGySfPJaBrwPr/AZeCioYOL91/NB8yHa8szC6k42I
         x5vw==
X-Gm-Message-State: AOJu0YxB53fEyyDKcRPwZCZ/5uRGGxeJ5rdm7YXx0heUytPK1jjDTZ36
	aeuPZdke0G5+QcGxpmUVIQ==
X-Google-Smtp-Source: AGHT+IHuNmP8V6sstTsEu3VVHzkFP0xhM7V0ZTHQhU/5l3uo4mYCmbaKF/vdgAVoy0+B7a5WdoyAzQ==
X-Received: by 2002:a05:6830:3499:b0:6b9:a6ef:2709 with SMTP id c25-20020a056830349900b006b9a6ef2709mr740772otu.8.1697492678863;
        Mon, 16 Oct 2023 14:44:38 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id k7-20020a9d4b87000000b006c21f11dcecsm28451otf.49.2023.10.16.14.44.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Oct 2023 14:44:38 -0700 (PDT)
Received: (nullmailer pid 3823207 invoked by uid 1000);
	Mon, 16 Oct 2023 21:44:35 -0000
From: Rob Herring <robh@kernel.org>
Subject: [PATCH net-next 0/8] dt-bindings: net: Child node schema cleanups
Date: Mon, 16 Oct 2023 16:44:19 -0500
Message-Id: <20231016-dt-net-cleanups-v1-0-a525a090b444@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALOuLWUC/x2M0QpAQBAAf0X7bMvdSfgVeThnsaWluyMl/+54n
 JqZGwJ5pgBtdoOnkwNvkkDlGbjFykzIY2LQhTaqUBWOEYUiupWsHHvAwRpt6qF0tqkhVbunia/
 /2MFnCl0R+ud5AX4J6O5rAAAA
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

This is a series of clean-ups related to ensuring that child node 
schemas are constrained to not allow undefined properties. Typically, 
that means just adding additionalProperties or unevaluatedProperties as 
appropriate. The DSA/switch schemas turned out to be a bit more 
involved, so there's some more fixes and a bit of restructuring in them.

Signed-off-by: Rob Herring <robh@kernel.org>
---
Rob Herring (8):
      dt-bindings: net: Add missing (unevaluated|additional)Properties on child node schemas
      dt-bindings: net: renesas: Drop ethernet-phy node schema
      dt-bindings: net: dsa/switch: Make 'ethernet-port' node addresses hex
      dt-bindings: net: ethernet-switch: Add missing 'ethernet-ports' level
      dt-bindings: net: ethernet-switch: Rename $defs "base" to 'ethernet-ports'
      dt-bindings: net: mscc,vsc7514-switch: Clean-up example indentation
      dt-bindings: net: mscc,vsc7514-switch: Simplify DSA and switch references
      dt-bindings: net: dsa: Drop 'ethernet-ports' node properties

 .../bindings/net/allwinner,sun8i-a83t-emac.yaml    |  2 +
 .../devicetree/bindings/net/brcm,asp-v2.0.yaml     |  2 +-
 .../devicetree/bindings/net/dsa/brcm,sf2.yaml      |  1 +
 Documentation/devicetree/bindings/net/dsa/dsa.yaml | 11 +-----
 .../bindings/net/dsa/mediatek,mt7530.yaml          |  8 ++--
 .../bindings/net/dsa/microchip,lan937x.yaml        |  3 +-
 .../devicetree/bindings/net/dsa/nxp,sja1105.yaml   |  4 +-
 .../devicetree/bindings/net/dsa/qca8k.yaml         |  1 +
 .../devicetree/bindings/net/dsa/realtek.yaml       |  2 +
 .../bindings/net/dsa/renesas,rzn1-a5psw.yaml       | 10 +----
 .../devicetree/bindings/net/engleder,tsnep.yaml    |  1 +
 .../devicetree/bindings/net/ethernet-switch.yaml   | 14 ++++---
 .../bindings/net/mscc,vsc7514-switch.yaml          | 46 +++++++++-------------
 .../devicetree/bindings/net/nxp,tja11xx.yaml       |  1 +
 .../devicetree/bindings/net/renesas,ether.yaml     |  3 +-
 .../devicetree/bindings/net/renesas,etheravb.yaml  |  3 +-
 .../devicetree/bindings/net/ti,cpsw-switch.yaml    |  2 +-
 17 files changed, 51 insertions(+), 63 deletions(-)
---
base-commit: 4d0515b235dec789578d135a5db586b25c5870cb
change-id: 20231016-dt-net-cleanups-ba3238b4ca98

Best regards,
-- 
Rob Herring <robh@kernel.org>

