Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68FFBEB3D
	for <linux-sunxi@lists.linux.dev>; Sat, 26 Nov 2022 13:25:15 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id l8so8009574ljh.13
        for <linux-sunxi@lists.linux.dev>; Sat, 26 Nov 2022 05:25:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Na6FyrdsS1wwt6jy4jKZXGg53Il9zjDGwsbPs6Y7vs8=;
        b=ojwqnhX4HWIRw/01nosPbAo+kI1IeXq4oX6pTqV7VqEAjHwiSgIMn8vz/cI9OG/fvZ
         lwRlXt2Ob7aRq1D+/MBJQlUvc4cdmFsC+8i8jq2hfEqaFNwyITvTyja+ZySaXx9WiPbL
         AhxTVSiyyTcurXiBz5+0uBt7dQP2fvzP+amc9BH1XQhwhtDeXAwKn7v4GVWaKeRG5FTr
         oQoSF9ZqxnDo9qt2+F1geCe7WYPySfPEui0AKJe39HxvhG82a6QOUpxX1koK/CYvMMrt
         Dx6zVKKQ94b/YCeYD/fQxWKOP128ad71EABMwSJxRnV/iRgWeHcxDGDX9EKfRqgK7Ofn
         UnEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Na6FyrdsS1wwt6jy4jKZXGg53Il9zjDGwsbPs6Y7vs8=;
        b=hHEsbE695kyv++AIYJXbWMvSyCYCwQQMf2mLdKxbHkQRU0OYRmN95qfvBxxDxR/WAV
         Deb9fJoc0MWXjaozATf0kOTjSQ5L5TV7VuiSlFOOea5cdVJPbfBivQtCSPoniHhv5NpZ
         rR4n/vlizS8CHTONGc/wju/6BxOuhUBn+k3GZwhODhn6andNRy552KBRkZJv+PJ3oNpJ
         m96FNCgk5BJLumPoXxjbc7oc0tZIDbVZUV6uldl1MDcK6dnjuB22pQ1Puj9tW8JdhnsG
         lrkoOowMCttdyo2QgeAA8kVLEramHLLTsHFv3BOwzM+9lCxXXVHMb2OElm16M/A7F+AI
         vhVQ==
X-Gm-Message-State: ANoB5pm2YBqxMtt/3dM8JTyjgvwMww8w4AzLimhqKdnPsEt+8w1g1L7O
	mNDElGUxOf6Rn4KGV65FtIR1tg==
X-Google-Smtp-Source: AA0mqf4Hn5l8emZqaUsEMB85V+2yCjIoYVk6ezOS+6dfnBzhS/2LGcz8sUEWDiUDm0/4MtMTl8wmbA==
X-Received: by 2002:a2e:aa14:0:b0:277:63f7:492c with SMTP id bf20-20020a2eaa14000000b0027763f7492cmr8428769ljb.259.1669469113410;
        Sat, 26 Nov 2022 05:25:13 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id t6-20020a199106000000b004b4b5d59cbcsm922230lfd.265.2022.11.26.05.25.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Nov 2022 05:25:12 -0800 (PST)
Message-ID: <d84ff258-d3e1-45e0-4473-7cd0707ae17f@linaro.org>
Date: Sat, 26 Nov 2022 14:25:11 +0100
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 1/3] dt-bindings: net: sun7i-gmac: Fix snps,dwmac.yaml
 inheritance
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
 <20221125202008.64595-2-samuel@sholland.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221125202008.64595-2-samuel@sholland.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25/11/2022 21:20, Samuel Holland wrote:
> The sun7i-gmac binding extends snps,dwmac.yaml, and should accept all
> properties defined there, including "mdio", "resets", and "reset-names".
> However, validation currently fails for these properties because the
> local binding sets "unevaluatedProperties: false", and snps,dwmac.yaml
> is only included inside an allOf block. Fix this by referencing
> snps,dwmac.yaml at the top level.
> 

I don't understand where is the problem and how does your patch solve
it. The old syntax is correct and your change does nothing, no fixing,
no impact. It actually looks like noop with big explanation :(

> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---


Best regards,
Krzysztof

