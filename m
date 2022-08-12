Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8DD6399
	for <linux-sunxi@lists.linux.dev>; Fri, 12 Aug 2022 07:43:08 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id j3so202922ljo.0
        for <linux-sunxi@lists.linux.dev>; Fri, 12 Aug 2022 00:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=3VS7TWQot+IlEnwML927JkmV58E4LYSjP3ZVnbKvo9o=;
        b=H6veR4g/W1qzmoejhWrzNTQwPauG85mbgpysc5AndaHpPwUL46BFgVxeeGb2A66u5P
         IXdCseqv9FE799SRriDfUyuz/1BJcdY522DlofonUQtYQCPqxHzkpWLZKQ+W2CSV7QUo
         09hxtgv2kBaeVaLTKw0A76lTFs2Ua3TSFv3Bq7sWzfIr+HcUZ0p7UUL2ZjmMglDKcyRb
         tsLPdOsyfNd9lUvZMsQlAuimpvqm/V0mVwj8e8azBjnadFAn6+6pa4z1CXX2ZspADiVR
         ExqWeCB6yJKm8solaw/dXy2p2CqnYDt3T18qOd6Z2BPCCjiq42cOMbEFYY+AxQ6Y6uxX
         T8gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=3VS7TWQot+IlEnwML927JkmV58E4LYSjP3ZVnbKvo9o=;
        b=e+GlNbRJRYLkACqxT2PyZWM0DTNEgBmrSgiIbwmwrGV1axbKM/2Y4+GYhyw8MSahsB
         XMjJWIqrR1SACrqF0bB2Z+qmj8m3D5dJSjTNg4zabf4Kqevb+qA4xmZkpF0PrAPtNm1W
         GABozk7yXYhJVh3bdcelH6Oi3EcZo0BI//LakSGempbyH0MfKfYnKGyqC9XswxdvLcsW
         d4Woh1v3OgUazVXxcwLNfRXtyRWAqqMOmSv/DHOiTQNPdAlKjgQoZh4b63WTN6REs0Aj
         3se2p7WfWjqFDN8x6BfOkzhsZmMvPKFeEKzBHs4QTirQ+ocgzlPoKwUBVlBUHCZCYB+O
         CMPg==
X-Gm-Message-State: ACgBeo2+mJWZrq7YkuRYU9wxMIF7+tS8THC4ru8poOiqLkubyvOXtsJU
	f58kp22loUBavdXafXLdxs7CSg==
X-Google-Smtp-Source: AA6agR7ZfeMJcaErbEl0GD4He0/9ETlWF7jSLhneR8xK84QqhWg3QQHewdW5lNe/WC0N5Wv2ZlPPOg==
X-Received: by 2002:a05:651c:c98:b0:25e:6894:650 with SMTP id bz24-20020a05651c0c9800b0025e68940650mr840132ljb.487.1660290186671;
        Fri, 12 Aug 2022 00:43:06 -0700 (PDT)
Received: from [192.168.1.39] ([83.146.140.105])
        by smtp.gmail.com with ESMTPSA id m4-20020a056512114400b0048b12c4c7e6sm126911lfg.12.2022.08.12.00.43.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Aug 2022 00:43:06 -0700 (PDT)
Message-ID: <ba1b272c-0d3a-b1c7-0ca3-5279496e1a6a@linaro.org>
Date: Fri, 12 Aug 2022 10:43:02 +0300
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] dt-bindings: display: sun4i: Add D1 TCONs to conditionals
Content-Language: en-US
To: Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Maxime Ripard <mripard@kernel.org>
Cc: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev
References: <20220812073702.57618-1-samuel@sholland.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220812073702.57618-1-samuel@sholland.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/08/2022 10:37, Samuel Holland wrote:
> When adding the D1 TCON bindings, I missed the conditional blocks that
> restrict the binding for TCON LCD vs TCON TV hardware. Add the D1 TCON
> variants to the appropriate blocks for DE2 TCON LCDs and TCON TVs.
> 
> Fixes: ae5a5d26c15c ("dt-bindings: display: Add D1 display engine compatibles")
> Signed-off-by: Samuel Holland <samuel@sholland.org>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
