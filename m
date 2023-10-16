Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87726381BF
	for <linux-sunxi@lists.linux.dev>; Mon, 16 Oct 2023 21:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-57b9193b1aeso3139775eaf.0
        for <linux-sunxi@lists.linux.dev>; Mon, 16 Oct 2023 14:45:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697492699; x=1698097499;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YU8u+sBPim2K3r5DGxEa61RapakHy3YnHZgIMLk+JTo=;
        b=HIuD3PVnRV0fF20UjOEzYvs9KDA9if4BFpyMBFtjh4j/dfLs6D3zTufelrDpoieaYm
         CgvwM2RpofH//b8KeaX9fWmHLwxt3bJ7EoaVnLV+jCG4Iu0xhLY1yAwSmvN59NBueUIX
         8LLrVKBLMdtVlIXQzdIpp8ebFLKeQ15aRSlQuNQHMQsAmiPSQsh1bSb9lFXjtz4Zb7ME
         6Ye2rApe/NMZVtvKChqFFC5tQ2rs5FCcbDAWi31ibWwYMmp/GY8ZWoF7PGHmzEgJKFd+
         I65EEt0upUYxWZfOy4w/hmR9yigZp0L5cnOAHFmS9tEFXljzwQzI1aW6Qgfum/YMmYKX
         jvsA==
X-Gm-Message-State: AOJu0YyRwKD25eMSSdeXyRL0zsqtRVb4pM7pEtaLWfwOhBBcQzoIVJ/T
	YSBzx9OOkkaBz9JtOi9d8Q==
X-Google-Smtp-Source: AGHT+IHVJZSvo9G+71y8WVX1VKgCtT5MDvO9YigKl0mCdN/122ZVPZKl1yBarH7bSgYTtsYqwjxrTA==
X-Received: by 2002:a05:6870:310f:b0:1e9:a85a:9ec0 with SMTP id v15-20020a056870310f00b001e9a85a9ec0mr40962oaa.0.1697492699637;
        Mon, 16 Oct 2023 14:44:59 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id g9-20020a9d5f89000000b006bdcef91e61sm29973oti.17.2023.10.16.14.44.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Oct 2023 14:44:58 -0700 (PDT)
Received: (nullmailer pid 3823218 invoked by uid 1000);
	Mon, 16 Oct 2023 21:44:35 -0000
From: Rob Herring <robh@kernel.org>
Date: Mon, 16 Oct 2023 16:44:24 -0500
Subject: [PATCH net-next 5/8] dt-bindings: net: ethernet-switch: Rename
 $defs "base" to 'ethernet-ports'
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231016-dt-net-cleanups-v1-5-a525a090b444@kernel.org>
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

The name "base" is misleading as the definition is for a complete schema
definition without additional properties allowed, not a "base class".
Align the same to be the same as dsa.yaml. This schema file without any
json pointer path is the base schema which can be extended.

There are not yet any references to $defs/base to update.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/net/ethernet-switch.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/ethernet-switch.yaml b/Documentation/devicetree/bindings/net/ethernet-switch.yaml
index 688938c2e261..72ac67ca3415 100644
--- a/Documentation/devicetree/bindings/net/ethernet-switch.yaml
+++ b/Documentation/devicetree/bindings/net/ethernet-switch.yaml
@@ -53,7 +53,7 @@ oneOf:
 additionalProperties: true
 
 $defs:
-  base:
+  ethernet-ports:
     description: An ethernet switch without any extra port properties
     $ref: '#'
 

-- 
2.42.0

