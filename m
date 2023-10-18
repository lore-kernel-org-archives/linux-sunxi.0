Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B11D14F8F
	for <linux-sunxi@lists.linux.dev>; Wed, 18 Oct 2023 08:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Phi9WEI4"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-59e88a28b98so57513657b3.1
        for <linux-sunxi@lists.linux.dev>; Wed, 18 Oct 2023 01:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697619193; x=1698223993; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nIfc9x+57+MR4MQsFxr/3D1qUh4GWaKbi6uC5iQj2KM=;
        b=Phi9WEI45Y03nnzjBzuKbjuKiIBjINhRQRDD1XUhtWGU6e33IWeKx1jHP1XoL0RbgH
         lhnNn/KfE9qpTl8GYP9qL47C3GAG/5VHioyv2Phi1HZJkvufcB8zjEYHwRfR69W572Jv
         CZfWyJi+FjqF6e+9doHEYLD+MQIk/avCr8CFI1IC7G3pI282tdgyY5OGQyQILtnYJDER
         FffacYruMqryj7NuhI8ndpbw1QchMXtnZiG8ulDdGPDSSl5vqIN78su2mJPLP8kMULcl
         f4iny84i6YH72RwyfqDpWiXfTAIOcL3yaAXuJqCKwE6uWm6HRCnKY9VDyuwd50LfTJ8/
         uFPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697619193; x=1698223993;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nIfc9x+57+MR4MQsFxr/3D1qUh4GWaKbi6uC5iQj2KM=;
        b=xKZiwgXHNJFcWEahVE8ljIbIn6GyD+wGJys5GraXCE7Ikv+kz9v6qFxgm1xmO7ZbAJ
         REBrIOHfWE1jn3/cmKg8ea7j5I4jWxMcKKAeG7FLm3WqRq/IKzCdShZ8vo6Kuumvbr4A
         twcThW+IqmCwDBSmhF6xYIx13ATV/WQzDCNg/LnoXSX5+Mbvo7tUyJ6O2I1Hy4BU0MYq
         8pGGKLE/YMu3VodKA8MW+VMCjlojbG2Lg962zWfE2L+Et6nC/mN9ykmOJBcgsz5PsOpv
         R47ao/ku3cPOOiRTLpwjL92Vv+5z2+n/oKDWZCfGJoWgeVKcQE5ofxryYKXKKRgZUPfV
         nd5A==
X-Gm-Message-State: AOJu0YwgoWlNcF++JjqzPUUvZQD7zilQdCoIyuF2g2Y7oZNvKAqaWwMn
	xkDW+pMX9SVmQVPj8rJuO72vZ4yiqzrjw0GI++SgrQ==
X-Google-Smtp-Source: AGHT+IFeFSERqZ0ts/x8xJld6sINEyqZb9YdNFdgX/IXWU45eqvj1p1KrrBezJyPl0/qLY0DPRMIhme6p1Fr7jMtf+o=
X-Received: by 2002:a05:690c:ed1:b0:5a7:cb5f:ee0a with SMTP id
 cs17-20020a05690c0ed100b005a7cb5fee0amr4033573ywb.17.1697619193088; Wed, 18
 Oct 2023 01:53:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231016-dt-net-cleanups-v1-0-a525a090b444@kernel.org>
In-Reply-To: <20231016-dt-net-cleanups-v1-0-a525a090b444@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 18 Oct 2023 10:53:01 +0200
Message-ID: <CACRpkdaie8-0W+=9AD49KqyW+-Zrtkhs8BjHJCVDrkxF6hVAkQ@mail.gmail.com>
Subject: Re: [PATCH net-next 0/8] dt-bindings: net: Child node schema cleanups
To: Rob Herring <robh@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Andrew Lunn <andrew@lunn.ch>, 
	Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean <olteanv@gmail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Woojung Huh <woojung.huh@microchip.com>, UNGLinuxDriver@microchip.com, 
	=?UTF-8?Q?Alvin_=C5=A0ipraga?= <alsi@bang-olufsen.dk>, 
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
	Claudiu Manoil <claudiu.manoil@nxp.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Vladimir Oltean <vladimir.oltean@nxp.com>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	bcm-kernel-feedback-list@broadcom.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 16, 2023 at 11:44=E2=80=AFPM Rob Herring <robh@kernel.org> wrot=
e:

> This is a series of clean-ups related to ensuring that child node
> schemas are constrained to not allow undefined properties. Typically,
> that means just adding additionalProperties or unevaluatedProperties as
> appropriate. The DSA/switch schemas turned out to be a bit more
> involved, so there's some more fixes and a bit of restructuring in them.
>
> Signed-off-by: Rob Herring <robh@kernel.org>

Oh this drives a truck through my Marvell binding work. Luckily it
also solves my most annoying problems so I will just rebase on this
and continue, all good!
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
