Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB75817D0
	for <linux-sunxi@lists.linux.dev>; Sat, 26 Nov 2022 14:15:32 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id q7so8127539ljp.9
        for <linux-sunxi@lists.linux.dev>; Sat, 26 Nov 2022 06:15:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c7lsnrFz2J4XCfERjKRpvtXDg4lRZmdlG/n7oHHCiX0=;
        b=uL6T+tjTFarMty+fOPuM9bBuM6CyZdwX1GD0aoo+VJMs0BKYtvvXXVag2uR/zCOA84
         EBQ1xKdylwBPJxw+TG//u/mnfKBMaHT69pedL4/Pbav5Wro3iMc0LFNaznqaKJ7HEi7q
         GYnVzDlks7f/xpGh8k0RDjorw3XR9d7sJs1kducgSNDos0LRAah/+D9yOAX+dXLtvylm
         V/9VhLKefv1cbRT2IRWGiErIjijEPOUe7VPX7X4RR4cryLxlItC0erXt6t5OvrRk6MVD
         gWIQjfFXfs3HxTIFpCJsxuMNyTG4XiHfB9u5sAS45mUSUgYrtR0CkYar4GKrX2yvR/rz
         4KZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c7lsnrFz2J4XCfERjKRpvtXDg4lRZmdlG/n7oHHCiX0=;
        b=qoGLwFCc0riYKUo1FxgND+zkOmPZ/W7k/AY1HVPoOrsu4MXRJ5y4sHPcvXEJt3FC+s
         pIuRuwsx19xDNcamee+DTPo7inUv2M3cQW73EOfaWlxbdm9ZvZnnc4aTN+/s/Gr3aGYM
         bjGcPo+CI/9+/TwT78ykZUfWw4rM9AD3qQ0d6ej+wbudL5FRBx/cSBfflcxlexhWHKSH
         MhyoptCU7jUPCMFCfwSdSW75PzpGOd+KlxqX35JtYivAzxXQP0WCrxNQgsuUnP6pWkLK
         fYZkymP5J3BHxm3OC8dfFqbWOP5rPO1UkHyAr95koKNJGyalsM5OKScP63D+/WXTS2pG
         g+YQ==
X-Gm-Message-State: ANoB5plB6jHs8MEqkK3ef69U+6aJLVxkMUZekfF43M3N8SfLVrn+boF7
	0XxT/It4T0CvXcdsQKG6+j/oiw==
X-Google-Smtp-Source: AA0mqf5kbp78CpD4O/sFH3Y2H/x7l7cEvjdfpKdgvpKHpas8x9/CLSHdVCjquQ/ZPRvURYLneLCFAw==
X-Received: by 2002:a2e:be8c:0:b0:26e:95bb:d7cc with SMTP id a12-20020a2ebe8c000000b0026e95bbd7ccmr11017551ljr.203.1669472130993;
        Sat, 26 Nov 2022 06:15:30 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id b4-20020a2eb904000000b0025e00e0116esm349417ljb.128.2022.11.26.06.15.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Nov 2022 06:15:30 -0800 (PST)
Message-ID: <d4a35381-1915-3a86-c211-4e49e696a66f@linaro.org>
Date: Sat, 26 Nov 2022 15:15:29 +0100
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 2/3] dt-bindings: net: sun8i-emac: Fix snps,dwmac.yaml
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
 <20221125202008.64595-3-samuel@sholland.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221125202008.64595-3-samuel@sholland.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25/11/2022 21:20, Samuel Holland wrote:
> The sun8i-emac binding extends snps,dwmac.yaml, and should accept all
> properties defined there, including "mdio", "resets", and "reset-names".
> However, validation currently fails for these properties because the
> local binding sets "unevaluatedProperties: false", and snps,dwmac.yaml
> is only included inside an allOf block. Fix this by referencing
> snps,dwmac.yaml at the top level.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
> 
>  .../devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml     | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

I must admit you're right that this hides the warning from dtbs_check,
but not because something in allOf should not be included. The problem
is how disabled nodes are being parsed here by referenced schema
(snps,dwmac.yaml) and probably is a bug in dtschema package.


Best regards,
Krzysztof

