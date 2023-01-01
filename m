Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B04E2F2C
	for <linux-sunxi@lists.linux.dev>; Sun,  1 Jan 2023 15:57:58 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id j17so28942774lfr.3
        for <linux-sunxi@lists.linux.dev>; Sun, 01 Jan 2023 07:57:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nT/wNs755CbJKKo2LqAykZZrkcpLMwiTj6TNgle5VUo=;
        b=eo2daS8tNzHeAfX1ggtEjRelM1E2AF/hZuQKDrbXvG1nlNzr7BJmfDltGHTHO0zhhA
         pEwxywhyUViXLBBhaaJne7jZg4rbdon105hNzvzu1hDwdJ1FPuSnCUD99OjEwXnqu1xu
         qd4fLi8h7SEG+geon3hCdA1oARaMljmezubuIdioM/6Hxbfih/IGvbaRb4jLzsJeRBIo
         QJtULYJpdbgUz8q4AL2fOnfpO3f92H0Xb1W0bIKcmz4Kksztm0XFozAwUtafmUVViydn
         79Gza9o6Jxy3UzLBA1F65XWVPsK3VDfRXMFwwWGaPwxoYOrXuWFwoMya2wCXReopzVSy
         7+Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nT/wNs755CbJKKo2LqAykZZrkcpLMwiTj6TNgle5VUo=;
        b=QpsN/yQvCt716XmQOszlPdK6RlvwfoEFITaprwWwwx4BFeqR/PEF1+mRapEm+YA0Av
         i/xzfuDVP9hYKcux+x6Rp3vyehm88u4grUI3xZ7Nf6BKTnxRSPZqPyqquw/D8eVBWVc7
         2bscUT2TpAF0UVEsJI3cNbsTBMIlQYSLC049WbTjopXRs2/AJBOxDySBjifRlHojWT3J
         Xrydw3H59A5gO5uMbofBsJLCBN/NgfBZOmg7blsxh0q6P3zfjNiLvfKNInSpfvjyQj94
         RZoa9myA8O+srATcs5VWfrskp4riRfdy9Fe3FqbBCeFKg+eydWqvpbFpCAb1t3Umx3qa
         IKQQ==
X-Gm-Message-State: AFqh2kq7XBHi0uHZP4DnkITjAbfsVCC3f/stAmRKRTx3QEORNQhGgMKO
	IdHGcILgaIgJFsaPEK+yDQ9kuA==
X-Google-Smtp-Source: AMrXdXvmDgwvA1xnXZ9dJ32ybmiv38vs5VFBCn8qj8MqbxNP93P9wdvJlMzbkINyTln+UR426UlIWw==
X-Received: by 2002:ac2:58d4:0:b0:4b5:9e70:ca6e with SMTP id u20-20020ac258d4000000b004b59e70ca6emr10831226lfo.17.1672588676468;
        Sun, 01 Jan 2023 07:57:56 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id 7-20020ac25f47000000b0049482adb3basm4199109lfz.63.2023.01.01.07.57.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Jan 2023 07:57:55 -0800 (PST)
Message-ID: <ce838de7-4dfc-4631-8f87-1fb311dcc739@linaro.org>
Date: Sun, 1 Jan 2023 16:57:54 +0100
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 1/3] dt-bindings: crypto: sun8i-ce: Add compatible for
 D1
Content-Language: en-US
To: Samuel Holland <samuel@sholland.org>,
 Corentin Labbe <clabbe.montjoie@gmail.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 "David S . Miller" <davem@davemloft.net>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-sunxi@lists.linux.dev
References: <20221231220146.646-1-samuel@sholland.org>
 <20221231220146.646-2-samuel@sholland.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221231220146.646-2-samuel@sholland.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31/12/2022 23:01, Samuel Holland wrote:
> D1 has a crypto engine similar to the one in other Allwinner SoCs.
> Like H6, it has a separate MBUS clock gate.
> 
> It also requires the internal RC oscillator to be enabled for the TRNG
> to return data, presumably because noise from the oscillator is used as
> an entropy source. This is likely the case for earlier variants as well,
> but it really only matters for H616 and newer SoCs, as H6 provides no
> way to disable the internal oscillator.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

