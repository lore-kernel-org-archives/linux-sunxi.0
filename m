Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A17B07C
	for <linux-sunxi@lists.linux.dev>; Sat,  2 Apr 2022 19:27:34 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id k23so8869563ejd.3
        for <linux-sunxi@lists.linux.dev>; Sat, 02 Apr 2022 12:27:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=B/ThbT3SvZKv7VBFEIOx/aCT3sIWnDNaa+6uy/zfsM4=;
        b=O+DYIcytzcGH8LsniuGvzc2VJVr6cymGR5ki+yc8dKSyiQa4ST2C04SjHaClrr/Dyd
         rPwx4rn/13xt6+XkEfBruUXf5yS5uchOzmxnzQrGFUOYeu0E2s6TrY6SfCCGq/hNNUxh
         OhW2kTsmvPedmVI5zSAuOSzL2jDrWYBQAWB+A7UVkHopWu11T8frRst1Z5gl5pFWhvXY
         FuD0hflgf/PZy17AgOobHb5lHfF+bAzZOUAqVVSanEgl3sIdfPM3i2kGw6Jad5DefrI0
         Dj3aMKYGslQqlRhZLALva5pqXuLeV29r4qobp7ruxuKfLTm6FB4CfR/GUhSuiqk/edBu
         +hYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=B/ThbT3SvZKv7VBFEIOx/aCT3sIWnDNaa+6uy/zfsM4=;
        b=owpzsbXnAt9vfKlP15ckOhrRv5TDi4/QH77EMvZlCrJ9LIvGxwD5KW5PtAFB1RbeHP
         /ewoMujyVIWUG7ZBHjkq8M0CaVmXCYPH+clZa66C9RGXzizGcx+o7blcOCDBEyOtcwk4
         nOrq9Zer5nOaW45g/KtbZ5e4lkgywrUhYWSrv0DA6ChpzkNcJgfHRBKxjtM/WenRcPgs
         xjJQtNEzvTJP16O+qxpRtm9JDo2yhiX8QRSU0kPG7dFADLLznNygVu4pnwiWNzinWbqV
         khHTo4YJkV5D5yhxLKtT2kLaGTq/tkUnCThrzWLAJ1242Ye4+tqiN3JYccrNJHk6KEcD
         pBxQ==
X-Gm-Message-State: AOAM532UzApIk8/DVVoSZIupmE5M7Mb/38pp2jUq48pdlmKK8YRORXXa
	MIv1h8qLzPw+iG/JORwm0GpNYw==
X-Google-Smtp-Source: ABdhPJzd9yaY1T32nO+3zxYbCF1eHA+h4DL4En/lqWXtB9SjL9rtunjp4WJcpVorDE8q85caXJ35Ng==
X-Received: by 2002:a17:906:c107:b0:6df:c114:e286 with SMTP id do7-20020a170906c10700b006dfc114e286mr4846182ejc.216.1648927652962;
        Sat, 02 Apr 2022 12:27:32 -0700 (PDT)
Received: from [192.168.0.171] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id qp27-20020a170907207b00b006e66a4e924bsm972077ejb.201.2022.04.02.12.27.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 Apr 2022 12:27:32 -0700 (PDT)
Message-ID: <bdd2e853-d056-2646-f9c7-f58321134d5d@linaro.org>
Date: Sat, 2 Apr 2022 21:27:31 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] dt-bindings: crypto: sun8i-ce: remove extra line
Content-Language: en-US
To: Corentin Labbe <clabbe@baylibre.com>, davem@davemloft.net,
 herbert@gondor.apana.org.au, jernej.skrabec@gmail.com, krzk+dt@kernel.org,
 robh+dt@kernel.org, samuel@sholland.org, wens@csie.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-sunxi@lists.linux.dev
References: <20220324144233.1119495-1-clabbe@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220324144233.1119495-1-clabbe@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24/03/2022 15:42, Corentin Labbe wrote:
> yamllint complains about this extra line.
> 
> Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
> ---
>  Documentation/devicetree/bindings/crypto/allwinner,sun8i-ce.yaml | 1 -
>  1 file changed, 1 deletion(-)
> 

Thanks for the patch. It's ok, but this should be rather done for all
files. Otherwise it's a churn.

I sent a global cleanup.

Best regards,
Krzysztof
