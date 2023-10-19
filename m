Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67A2A28F7
	for <linux-sunxi@lists.linux.dev>; Thu, 19 Oct 2023 13:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PiKEOmZ9"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-9be3b66f254so905284866b.3
        for <linux-sunxi@lists.linux.dev>; Thu, 19 Oct 2023 06:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697721490; x=1698326290; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dOMFQ4KhhgNN9uiVFnKX2Q/Idi24XPkIW6kBXq+OOHE=;
        b=PiKEOmZ9vW4N9H2iczisf3OsTJxLEr3mGhNmVdLZE3ODROZiZjTw+SiskgMIq3hIDp
         LnNAYhjOA74snoG2GMqnaFc7LofMof9wjAO6VSdIvri7bptEeW56+P43U9QKwsaLQ7yE
         qg6wpn6gQAxOEAhhYJexODzHEhs9QsB/REiWEhNRVTusdqfV1QPJMsuj5BUoBh+ZldNY
         8RlDbwg23desQEQnkUKENWO71QLQ56wPg9eW/FiKATJsTrdu1HB9iq4yE7s/zvQKoQrj
         gX4nmLoK9V/0MUpHbn3XfMwOuzY/kvmI+dDZvmKxigfr/QU1jlQcl9ylkvxAysd/unoB
         0rpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697721490; x=1698326290;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dOMFQ4KhhgNN9uiVFnKX2Q/Idi24XPkIW6kBXq+OOHE=;
        b=Pp21vCw0f3PPflJiMkrdQnQY847RF4VERUfQGUJa4cY902+w6pkZvBzyVUDqwt7Ujm
         gjeX1tnGyfTh6vEC9BQ1JZxDUqE/aU+1G2sCvoUmij0p2FVmCV/txQLsCwanwHoVPmY+
         DfLLxfp4gcuwCAxgRgc0Z8a/H+EhLu0gBM9Os1M9PbJzNtaAaQde8WIxNZyYaj3Gjbbf
         26nZQ5sL/9qLYOTm3RlbrcAURRBWl4hOr6nyhWX9BjIGQItBDmnUcB2Fw0/cbwcVq9Lv
         mr8i957fjUROfJrP9uHfphJPGBItO+JshFR/uVIHOc4zS1EKsdW34tK+SEhcODSuqoJP
         /4rw==
X-Gm-Message-State: AOJu0YxjpwRjbm0cA2TM54BhK2dNTkr0sQ87isGVT68eYhKoporzZkAX
	G2IOzRmgB29c9hmZtaUBghY=
X-Google-Smtp-Source: AGHT+IGeV/PAyeS5ZcSZyKizUQ5u38iNo53UbAIyLr9nNzHgjNSBIjErmYPUXpk3hLMaNF1I+onEEQ==
X-Received: by 2002:a17:907:97d0:b0:9aa:63d:9ede with SMTP id js16-20020a17090797d000b009aa063d9edemr2084080ejc.9.1697721490291;
        Thu, 19 Oct 2023 06:18:10 -0700 (PDT)
Received: from skbuf ([188.26.57.160])
        by smtp.gmail.com with ESMTPSA id qt16-20020a170906ecf000b0099c53c44083sm3596979ejb.79.2023.10.19.06.18.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Oct 2023 06:18:09 -0700 (PDT)
Date: Thu, 19 Oct 2023 16:18:06 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Rob Herring <robh@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Woojung Huh <woojung.huh@microchip.com>,
	UNGLinuxDriver@microchip.com,
	Linus Walleij <linus.walleij@linaro.org>,
	Alvin =?utf-8?Q?=C5=A0ipraga?= <alsi@bang-olufsen.dk>,
	=?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	=?utf-8?B?bsOnIMOcTkFM?= <arinc.unal@arinc9.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>,
	John Crispin <john@phrozen.org>,
	Gerhard Engleder <gerhard@engleder-embedded.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Sergey Shtylyov <s.shtylyov@omp.ru>,
	Sergei Shtylyov <sergei.shtylyov@gmail.com>,
	Justin Chen <justin.chen@broadcom.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Grygorii Strashko <grygorii.strashko@ti.com>,
	Sekhar Nori <nsekhar@ti.com>,
	Claudiu Manoil <claudiu.manoil@nxp.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: Re: [PATCH net-next 1/8] dt-bindings: net: Add missing
 (unevaluated|additional)Properties on child node schemas
Message-ID: <20231019131806.lbzydoplodybvb62@skbuf>
References: <20231016-dt-net-cleanups-v1-0-a525a090b444@kernel.org>
 <20231016-dt-net-cleanups-v1-0-a525a090b444@kernel.org>
 <20231016-dt-net-cleanups-v1-1-a525a090b444@kernel.org>
 <20231016-dt-net-cleanups-v1-1-a525a090b444@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231016-dt-net-cleanups-v1-1-a525a090b444@kernel.org>
 <20231016-dt-net-cleanups-v1-1-a525a090b444@kernel.org>

Hi Rob,

On Mon, Oct 16, 2023 at 04:44:20PM -0500, Rob Herring wrote:
> Just as unevaluatedProperties or additionalProperties are required at
> the top level of schemas, they should (and will) also be required for
> child node schemas. That ensures only documented properties are
> present for any node.
> 
> Add unevaluatedProperties or additionalProperties as appropriate.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> diff --git a/Documentation/devicetree/bindings/net/dsa/renesas,rzn1-a5psw.yaml b/Documentation/devicetree/bindings/net/dsa/renesas,rzn1-a5psw.yaml
> index 833d2f68daa1..ea285ef3e64f 100644
> --- a/Documentation/devicetree/bindings/net/dsa/renesas,rzn1-a5psw.yaml
> +++ b/Documentation/devicetree/bindings/net/dsa/renesas,rzn1-a5psw.yaml
> @@ -61,17 +61,11 @@ properties:
>  
>    ethernet-ports:
>      type: object
> -    properties:
> -      '#address-cells':
> -        const: 1
> -      '#size-cells':
> -        const: 0
> -
> +    additionalProperties: true
>      patternProperties:
>        "^(ethernet-)?port@[0-4]$":
>          type: object
> -        description: Ethernet switch ports
> -
> +        additionalProperties: true
>          properties:
>            pcs-handle:
>              maxItems: 1

For my edification, this patch removes #address-cells and #size-cells
at the same time, because "additionalProperties: true" (which was also
implied before) doesn't care if they aren't defined in this sub-schema,
and they are defined through $ref: dsa.yaml#/$defs/ethernet-ports,
right?
