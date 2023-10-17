Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB02A41234
	for <linux-sunxi@lists.linux.dev>; Tue, 17 Oct 2023 15:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hsV+wO8q"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2c515527310so41570561fa.2
        for <linux-sunxi@lists.linux.dev>; Tue, 17 Oct 2023 08:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697555665; x=1698160465; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LAQIUSSFEkh8UCmi8THqE2sWEJcCZDabuYYz4V23TW8=;
        b=hsV+wO8qPU6MI0cU1bAYXrlWaHo/0wkfD2/duRulQABp34+sHC2w7uNZn1bfQF3UR8
         OC5oDZ0ra+3LiXEBwlcTAizpCuVKre0FA1PDbBPv0OIO8usiGpnqBTg+wR/1xaXzAcau
         0jn3iZY2IY1PYtM+BDDDzrIDqUJ4o0bPofJxs0lBPkufaaOY2vVzPP2Ey8ecn2DwLKUN
         C5LlJKUbiHUxqyZIQfl6JI+ZyZ2aXh4XzZLnUsD4w/tyUu22o+raA8P3mEAnHE9yNBf0
         iek/qSbH3w/uJnz1UCOsAqHzmHviReRwDmGw2TdjvqF6PtFvBMWOPsQWHYykwSzT/2Fz
         PkWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697555665; x=1698160465;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LAQIUSSFEkh8UCmi8THqE2sWEJcCZDabuYYz4V23TW8=;
        b=rnlxgssplHOqYEMogQHGwxOxfgsgXU+wR5YrMI/F2zJY0lm0Z8mHcb1icVuaQi/FgF
         G9SeDnvIW45/wzTQ0G5JJvcwyf2i5xcKN1ze0CEp6Bd2SBhgsgFBo3TYbHzIxcNRDj/g
         JAj+UoWdxVzQbEhnf62axMvmysim7KBQPRXkEgUk5sVhTfXDYcIt/3BLlgJiFpqvj4Li
         bn6/e7uag2ttoMxxzNL9B7YrRYLNTWBPFe2ReCssXFfNEUFvwuHKx13TwKvdECfW28At
         jAlw0FwHbfbbUO9qZ6VYRZpQJ6MSXz4vt3rp3byEYnPF9SdwENPeEiJw68kF9q+7v24q
         5MTw==
X-Gm-Message-State: AOJu0Yzx37UnJQSeI7H8DAZkVU7dmAxtu29z3Eyv05Mkjl0dwz9Ovxju
	WhCQbXJ6qGR4lnhtEy84JcI=
X-Google-Smtp-Source: AGHT+IGGk9+XOX5f1XNqFWNen/mWjFSeo+yOGyG3yMMSOnh8F9Yx0HDcS+QgLDHdukQU3wtBx5MZag==
X-Received: by 2002:a2e:aa22:0:b0:2c5:31e6:e8e2 with SMTP id bf34-20020a2eaa22000000b002c531e6e8e2mr1904703ljb.25.1697555664440;
        Tue, 17 Oct 2023 08:14:24 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-12-148.dynamic.telemach.net. [82.149.12.148])
        by smtp.gmail.com with ESMTPSA id v18-20020a05600c15d200b00406447b798bsm1907790wmf.37.2023.10.17.08.14.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 08:14:23 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, Andrew Lunn <andrew@lunn.ch>,
 Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean <olteanv@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Woojung Huh <woojung.huh@microchip.com>, UNGLinuxDriver@microchip.com,
 Linus Walleij <linus.walleij@linaro.org>,
 Alvin =?utf-8?B?xaBpcHJhZ2E=?= <alsi@bang-olufsen.dk>,
 =?ISO-8859-1?Q?Cl=E9ment_L=E9ger?= <clement.leger@bootlin.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 =?ISO-8859-1?Q?n=E7_=DCNAL?= <arinc.unal@arinc9.com>,
 Landen Chao <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>, Daniel Golle <daniel@makrotopia.org>,
 John Crispin <john@phrozen.org>,
 Gerhard Engleder <gerhard@engleder-embedded.com>,
 Heiner Kallweit <hkallweit1@gmail.com>, Sergey Shtylyov <s.shtylyov@omp.ru>,
 Sergei Shtylyov <sergei.shtylyov@gmail.com>,
 Justin Chen <justin.chen@broadcom.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Grygorii Strashko <grygorii.strashko@ti.com>, Sekhar Nori <nsekhar@ti.com>,
 Claudiu Manoil <claudiu.manoil@nxp.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Rob Herring <robh@kernel.org>
Cc: Vladimir Oltean <vladimir.oltean@nxp.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
 bcm-kernel-feedback-list@broadcom.com
Subject:
 Re: [PATCH net-next 1/8] dt-bindings: net: Add missing
 (unevaluated|additional)Properties on child node schemas
Date: Tue, 17 Oct 2023 17:14:21 +0200
Message-ID: <2720928.mvXUDI8C0e@jernej-laptop>
In-Reply-To: <20231016-dt-net-cleanups-v1-1-a525a090b444@kernel.org>
References:
 <20231016-dt-net-cleanups-v1-0-a525a090b444@kernel.org>
 <20231016-dt-net-cleanups-v1-1-a525a090b444@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne ponedeljek, 16. oktober 2023 ob 23:44:20 CEST je Rob Herring napisal(a):
> Just as unevaluatedProperties or additionalProperties are required at
> the top level of schemas, they should (and will) also be required for
> child node schemas. That ensures only documented properties are
> present for any node.
> 
> Add unevaluatedProperties or additionalProperties as appropriate.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml     |  2 ++

For Allwinner:
Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

>  Documentation/devicetree/bindings/net/dsa/brcm,sf2.yaml        |  1 +
>  Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml |  2 ++
>  .../devicetree/bindings/net/dsa/microchip,lan937x.yaml         |  1 +
>  Documentation/devicetree/bindings/net/dsa/nxp,sja1105.yaml     |  2 ++
>  Documentation/devicetree/bindings/net/dsa/qca8k.yaml           |  1 +
>  Documentation/devicetree/bindings/net/dsa/realtek.yaml         |  2 ++
>  .../devicetree/bindings/net/dsa/renesas,rzn1-a5psw.yaml        | 10 ++--------
>  Documentation/devicetree/bindings/net/engleder,tsnep.yaml      |  1 +
>  Documentation/devicetree/bindings/net/nxp,tja11xx.yaml         |  1 +
>  10 files changed, 15 insertions(+), 8 deletions(-)



