Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E573923A6
	for <linux-sunxi@lists.linux.dev>; Fri, 25 Nov 2022 08:08:41 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id z4so4313777ljq.6
        for <linux-sunxi@lists.linux.dev>; Fri, 25 Nov 2022 00:08:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wVlCLe2tXgcxDZw2iHBi8mQJtJf06p17wSgoJwP9yCI=;
        b=b0rqCCntnPYmzh4xiAK5+t7TvqatYDlK5GGfyrAhtm5MWWxo65kZljLnnCwsSoK2zE
         5rth6sky+e/nuyd74pNSPHoBDmMcAw+LDxcZeGdfyRRXI6Tez/Yr7ydIRYe3V4wu2SxX
         RrsITuetuI0PUktGT+b+kdfUYR7RBpEV9USLBoXDkG8s/Ce3tFLsK3LMooiVIwqZbhnr
         y2mcmc1KkPxi4uJ1KQ2B3eFc1hAIDqw5uk1/POC7ZLTN6P7ONIfjJvV6ehV12B1823hU
         y8rEgHBzLUuZPc7gFwDtwAKcFjkQBBp+G+0hV3bD1c0CSdTDo93KOK2uT3XGAy1+f2wl
         tTdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wVlCLe2tXgcxDZw2iHBi8mQJtJf06p17wSgoJwP9yCI=;
        b=XxzJ8v6o0bLkrqb1zOjFEqXSZTCPp/YOPK15QQ4IlET//nvLntmPQ9IKFc3m6t60N0
         anBJpHQ10gnBOdJZo4GF4bBIOgx5XZOtZjxLBc7BZz2ANvt9sIZkxF1I68DLehzD48W2
         bdqE3Uy15FuAwWsrhOKM0ek6ioAC24fD/Ftg+HQXBKE3UGgaMlreK3kNNKpae0zO46Ku
         /2z/yF568IoAI+ty0T8zJOHEYd6hdak7j2ZKevcTKVYGRdGgPGbJNrquhwy0wh9aM7Fu
         CHCB6KWORctyWrovr+WBrjxPf2U+ZJ6U8xR247PXXlgdO2g1Mg1OUzkODKd54M4e1/zo
         8wKQ==
X-Gm-Message-State: ANoB5pn0Og/yhTDhlI1TRjAzhMXfDmKqfpW9p2uOOpOkofrX7IW6RKKp
	UyDBg9ojVVQvMtyd+TAIajZ8ug==
X-Google-Smtp-Source: AA0mqf4y8TOeAe22Hly1N/5VF497j2qebbP5U6K9IzUV3wi6yhM4Y5Q/UDCICzJx1Gc2dtU+2Velwg==
X-Received: by 2002:a2e:824d:0:b0:276:9855:fe8d with SMTP id j13-20020a2e824d000000b002769855fe8dmr11305912ljh.506.1669363719936;
        Fri, 25 Nov 2022 00:08:39 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id o13-20020a056512052d00b004b48cc444ccsm430343lfc.100.2022.11.25.00.08.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Nov 2022 00:08:39 -0800 (PST)
Message-ID: <a8fe2f63-ca99-9aea-e4cc-325208b021e8@linaro.org>
Date: Fri, 25 Nov 2022 09:08:38 +0100
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v4 1/4] regulator: dt-bindings: Add Allwinner D1 system
 LDOs
Content-Language: en-US
To: Samuel Holland <samuel@sholland.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiko Stuebner <heiko@sntech.de>,
 Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-sunxi@lists.linux.dev
References: <20221125040112.18160-1-samuel@sholland.org>
 <20221125040112.18160-2-samuel@sholland.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221125040112.18160-2-samuel@sholland.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25/11/2022 05:01, Samuel Holland wrote:
> The Allwinner D1 SoC contains two pairs of in-package LDOs. The pair of
> "system" LDOs is for general purpose use. LDOA generally powers the
> board's 1.8 V rail. LDOB powers the in-package DRAM, where applicable.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

