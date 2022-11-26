Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7304EB3E
	for <linux-sunxi@lists.linux.dev>; Sat, 26 Nov 2022 13:38:45 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id j16so10724519lfe.12
        for <linux-sunxi@lists.linux.dev>; Sat, 26 Nov 2022 05:38:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JODCHnpvnBiR3n3fpZD67kgmrBczvvXLFyLOXUIrzLw=;
        b=R3kgfVWpjBBFfaYMxVPvDJJvCc8bXrmR/5iyKRzySX5/rt2UGFXYJQ1CbZ7V/QTNtj
         QVRr/i02Iy+GkqfMTBjzC05z09gJXZA4ibdqDPZ5fQBrOvhcMk6UIJ+YctxesjOSpoIB
         kQCG4DKHPIOrN/KdA00jHuACtf8jgXrLX6XKPD1bVQuk9GvGStFHlTntU7YcjaeoUqKw
         vFSAYNI9x+PPd4aNr68aaPW6AqVDvEPkaa0C5N1eKr9tc3ir4teP7RuOEpJoYjyRazN/
         oM8NxRY1aVpC7Ncrd9xs2MrwgP4B0hjE6kqmVRAiikfIR4vdOFyrDNYHINYe4NOvoT5+
         wd0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JODCHnpvnBiR3n3fpZD67kgmrBczvvXLFyLOXUIrzLw=;
        b=ZMIu3iI00SJ9RUqmJbAM2VyIchQFtuXhpTAUoxFyEyworj/PgfBjUXXhgumtsOJwy0
         +2kJ8ldiXAEJsiozRT3qBgIWP49C061XyuwrDcQuclCXVDNgBif2IajFIzhe6jmeND1T
         JxhUrfsV3ONpesgvemkGAvEI2kV8J4Iq1/mw1KCJAR4ONDePkChxENxIZb6j/BPa6E7g
         FCQGpYx1gb5p1XxxjYVD6Lvdpn4KVC4d1lSPHT30h14QR7cUXnnKuq7WTXr5ZEjNEaJd
         o/6PJbcQ3AV6Geu4IIFgnFUd/u3t/bjnIggJKrwy7aTqLMqxnLKBobrgUoykbncou5AC
         EXRg==
X-Gm-Message-State: ANoB5pl8eObZz1082f5xUZio74q2ghMLZuPnTeLB3HX8kn/3ckU36QIj
	0UtxRScX9d34b1a8mxiJW1Ol9A==
X-Google-Smtp-Source: AA0mqf6MtjdoVhvR7zpbOEi+YVSwYyAWyZtyojehbq8a4FMrZd2GJ1stmBS+SNY6qcKKgpKEhAISJw==
X-Received: by 2002:a19:5f11:0:b0:4a2:240a:443a with SMTP id t17-20020a195f11000000b004a2240a443amr13705255lfb.529.1669469923936;
        Sat, 26 Nov 2022 05:38:43 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id k20-20020a0565123d9400b0049487818dd9sm931511lfv.60.2022.11.26.05.38.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Nov 2022 05:38:43 -0800 (PST)
Message-ID: <ffa1e063-7e29-0bcb-035c-ff96f8eb037d@linaro.org>
Date: Sat, 26 Nov 2022 14:37:37 +0100
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 3/3] dt-bindings: net: sun8i-emac: Add phy-supply property
Content-Language: en-US
To: Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: LABBE Corentin <clabbe.montjoie@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-sunxi@lists.linux.dev, netdev@vger.kernel.org
References: <20221125202008.64595-1-samuel@sholland.org>
 <20221125202008.64595-4-samuel@sholland.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221125202008.64595-4-samuel@sholland.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25/11/2022 21:20, Samuel Holland wrote:
> This property has always been supported by the Linux driver; see
> commit 9f93ac8d4085 ("net-next: stmmac: Add dwmac-sun8i"). In fact, the
> original driver submission includes the phy-supply code but no mention
> of it in the binding, so the omission appears to be accidental. In
> addition, the property is documented in the binding for the previous
> hardware generation, allwinner,sun7i-a20-gmac.
> 
> Document phy-supply in the binding to fix devicetree validation for the
> 25+ boards that already use this property.
> 
> Fixes: 0441bde003be ("dt-bindings: net-next: Add DT bindings documentation for Allwinner dwmac-sun8i")
> Signed-off-by: Samuel Holland <samuel@sholland.org>

This looks ok.

Best regards,
Krzysztof

