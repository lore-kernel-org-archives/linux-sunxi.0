Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D13E11FB2E
	for <linux-sunxi@lists.linux.dev>; Wed, 19 Jul 2023 17:28:28 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-307d20548adso6781750f8f.0
        for <linux-sunxi@lists.linux.dev>; Wed, 19 Jul 2023 10:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689787707; x=1692379707;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8/5+Fuy5VkiTYMoOECLM7hAipJr0qI60CxfgtI6AAuc=;
        b=yp1os99ShMB+le9v5DtBkGmxSFRbBfkllJ7vQUZlPwIh4QZfTVQEGu524krM1tcwfJ
         bY88m6u5xNUhXNEFBKX6Hj8tC2JiVGi0GUaKOkkFcVyHi/6he7roUifo1Oskha5LUnLp
         ZB3ZGF8sHENGYv5lHyjyLrSeligmStZ2Cv0pcuZ+XoI/KJBtEQ40K2Gx4Km2Flmy2cSB
         faNX4uC7wzfJG7+YdJQz9CoazFMdKIhQJH1GkAtFWL9wtzhaPu4fZ6dzztTz/XZVtFmf
         zDXnGc1JOyPm1xNHlphnewyWS5hYT8RluUtlWVkHbQT70e4K2KbkpUtUSw2wn+hRXUV2
         Iw4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689787707; x=1692379707;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8/5+Fuy5VkiTYMoOECLM7hAipJr0qI60CxfgtI6AAuc=;
        b=JKucyQFz33/wZZ2wkd0hZBBoSrS3Xltwc7fa3rZ23a6O8vW2n46Vvm1nmc+x/r6Ow+
         Y4mBff0cAea0KpQKDVW0b4IHzWz7YO1vpZByttzoj8Rn1b6UJ1YiHHynn2AkMnJ/9QPw
         B2eeND14HjXHCMwpURr0gEUnV+xwEJBoHaycupWe4Ta1CfLaMT75r10WCRoG4uloOF1l
         p2uWKMPqdEPFugj2AhGmZgQ4LaaBhXXUbdNs90FpM5HIUsgnQW+0hwtI8ngE/QQ8eXUq
         ap4NlOPNO1dfwgWuK0bDsbZuiUECohZ3OD7m0airJFkMckt/jEydhzLaXyJqR2Yo6YLH
         04xA==
X-Gm-Message-State: ABy/qLbTZJFPmkiwfazXbanlA+4vkjftQV8h+LwWTxpC5xhFvciwEuzM
	YTxH58EnpTnGuHSc17iiBuAwyA==
X-Google-Smtp-Source: APBJJlEO2bDu4shZhayU/BpDN5r5YMeRzn0LLyi87Q4mcBpczeBLmsrJOo2xzh+hh8qu8pnsEzBZdg==
X-Received: by 2002:a5d:4f90:0:b0:311:3fdc:109d with SMTP id d16-20020a5d4f90000000b003113fdc109dmr392088wru.1.1689787706840;
        Wed, 19 Jul 2023 10:28:26 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id r15-20020a5d4e4f000000b003143c6e09ccsm5866159wrt.16.2023.07.19.10.28.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Jul 2023 10:28:26 -0700 (PDT)
Message-ID: <da024b3e-017c-097e-c9c8-55560a7f76c3@linaro.org>
Date: Wed, 19 Jul 2023 19:28:24 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 2/2] dt-bindings: arm: sunxi: add Mango Pi MQ-Quad
 binding
Content-Language: en-US
To: Matthew Croughan <matthew.croughan@nix.how>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20230719172551.3248166-1-matthew.croughan@nix.how>
 <20230719172551.3248166-3-matthew.croughan@nix.how>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230719172551.3248166-3-matthew.croughan@nix.how>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19/07/2023 19:25, Matthew Croughan wrote:
> Document board compatible names for Mango Pi MQ-Quad
> 
> Signed-off-by: Matthew Croughan <matthew.croughan@nix.how>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


---

This is an automated instruction, just in case, because many review tags
are being ignored. If you do not know the process, here is a short
explanation:

Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions, under or above your Signed-off-by tag. Tag is "received", when
provided in a message replied to you on the mailing list. Tools like b4
can help here. However, there's no need to repost patches *only* to add
the tags. The upstream maintainer will do that for acks received on the
version they apply.

https://elixir.bootlin.com/linux/v5.17/source/Documentation/process/submitting-patches.rst#L540

Best regards,
Krzysztof

