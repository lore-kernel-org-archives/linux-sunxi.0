Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30E672033E
	for <linux-sunxi@lists.linux.dev>; Thu, 19 Oct 2023 13:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E3o0JENR"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-533d31a8523so13405576a12.1
        for <linux-sunxi@lists.linux.dev>; Thu, 19 Oct 2023 06:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697721687; x=1698326487; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FgxKa8AO9ndn9A10MY0AzoFh3nJur0uCTmMfy39Eot8=;
        b=E3o0JENRC2/Nu+sXwh8j8QrTW3+tnUJWntwKBMGhNGpvHwxU1ibkxtIDfmGY5pF2z/
         oQs4Gtz4acjekJIbsne/p84Gbbp7IVLlM6WKivIKd6qnSOxyg7PCJ3pb0Tp9IcZ60exz
         xbkPFzZTDsO9gjpHuG48MHpuhSoeSEa3s4eZPwpvL7ZsH2hOFpo2O7c35DlIn1FMoYnz
         Bg0yXJYWC8DZ5bjuelrO0xtGa5CVSV3SYvZnPlCvn5EHNRb4IhA5jgtgqNShfvl+ylp6
         b5MNkx3yCXpo4OwxuczzaBNCo/IaYMGMCJWPhlekNkmvTEGqohBp00K9D0xbAJ8xcDEa
         k0gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697721687; x=1698326487;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FgxKa8AO9ndn9A10MY0AzoFh3nJur0uCTmMfy39Eot8=;
        b=WrLLsQRS5My0uazkcDP72TopX8Hu0HpXJ89p4AXaJb1qyhRMKSisXi/edvMgI3bANw
         NmqlkhzmtnLbxR2q51GKDowL9vK1cGFt+0u1OkS4aWU6N2CAo+VbPAbFwVTrLdoLLlfc
         rMQdUHnwJRQgKs2vCvyrDITFJUZcnXnU9gQpBelX4mk7LQcIeG+BQsUYtKU9e9EPAfHK
         3qS7VcXpW2X86ouyvTiaBvh9qlEMRu848yWo5a8njTvxEFAGbzbY8/MmfEDmXreuOCnT
         Q7dfJz2HD9H5yw+cZ6dLs1TCbeC6TTaLf3g7T80DcX5qukAim6725MwHVUioH/DS2Ocz
         +Zug==
X-Gm-Message-State: AOJu0YxC1j6YJGeyC92UiQ49/I7+ZOSVRzqxDonvUTn7eSoRXdnUg2DK
	6VXtB3UenW56ahhN4P2AxYU=
X-Google-Smtp-Source: AGHT+IGPYVxFFY4V5wJ9ZKXaFEG0/Ul9BCX45nfhQeyJcBnICEDGph1b8CwndVzz+OMYm+48TScO8w==
X-Received: by 2002:a05:6402:2813:b0:53d:f358:202c with SMTP id h19-20020a056402281300b0053df358202cmr1823338ede.5.1697721687185;
        Thu, 19 Oct 2023 06:21:27 -0700 (PDT)
Received: from skbuf ([188.26.57.160])
        by smtp.gmail.com with ESMTPSA id s10-20020a508dca000000b005340d9d042bsm4358136edh.40.2023.10.19.06.21.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Oct 2023 06:21:26 -0700 (PDT)
Date: Thu, 19 Oct 2023 16:21:23 +0300
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
Subject: Re: [PATCH net-next 3/8] dt-bindings: net: dsa/switch: Make
 'ethernet-port' node addresses hex
Message-ID: <20231019132123.3jcyky3ruxfgstoi@skbuf>
References: <20231016-dt-net-cleanups-v1-0-a525a090b444@kernel.org>
 <20231016-dt-net-cleanups-v1-3-a525a090b444@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231016-dt-net-cleanups-v1-3-a525a090b444@kernel.org>

On Mon, Oct 16, 2023 at 04:44:22PM -0500, Rob Herring wrote:
> 'ethernet-port' node unit-addresses should be in hexadecimal. Some
> instances have it correct, but fix the ones that don't.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---

Reviewed-by: Vladimir Oltean <vladimir.oltean@nxp.com>
