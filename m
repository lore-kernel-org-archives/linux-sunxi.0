Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D81C71842
	for <linux-sunxi@lists.linux.dev>; Mon, 14 Aug 2023 08:08:43 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-99c1d03e124so495250666b.2
        for <linux-sunxi@lists.linux.dev>; Mon, 14 Aug 2023 01:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692000522; x=1692605322;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tApBKYNIV0fg/mn8WIMBLmG45QZJDj/ZB0MaRe6NkIM=;
        b=gjvQAg8RXhIqO/8zdU98meKnSUF+/6BodRTaCJQSIddTV5mwhT9N7OA+i7/ThuFjXk
         pXu5ORfFW9UhwmiGOYXLzo6T9vo1to7fScRIQ3M/dFp991hJHy+56imCpLzGIEzUtV1q
         7a/I0V6oR5eZxbp76sPtGJiHkTNQWErHv96dbQ0+ACXBKYnx/EwkeHYzte0GF8eXeDOH
         5JEuMGvVgdocNNAgHfcPv3YXZ1J4jkxPPa0KAfWwHwK0Vj9Cw7C5/WW8Y75ifQ6BgwBV
         QEeChOekv3LYxr5adUIzJmCNRmDSOrA9XJRKGMRayCNX62A2lywF6xtnrd9houp/kl+o
         LadA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692000522; x=1692605322;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tApBKYNIV0fg/mn8WIMBLmG45QZJDj/ZB0MaRe6NkIM=;
        b=fb/mW98eyQaM67bE6gS0GHYkNQATwVAo16G/PZkA1mcJ/Rg26T5aH6jc4hNHtdyk+f
         i60GeaJArE25AAh7LyHTSd7Icb9BSOn4yx6NOCMuCjnppbomCxrm3psd+0OOMirbgAyE
         rvb4qJUhIKUxmvB0oITh7fz7vGYCxv2dEMJc1kz7LqoOkqlAxLlB+682cXmx09yX8cvO
         jgzwj6i2TMPam+1IoO9c1eQQMwDCUhfGStH+f2L++ppWo55l+CzH/TX5lvAXbM6rrcp1
         rvzr0TSLuAzISGw5/tSUfYDE4hSQc14cMyXnoYmHb8Ooeh0NoC1gJEz5+lUV508ebtvU
         HuLw==
X-Gm-Message-State: AOJu0YxXF61MnnwthN8aCWWBORCs+O7/3ImRQoohmlKXRdZTbag2vqM/
	nwwUZ7H5IzsyKejRaIN7GT3OnQ==
X-Google-Smtp-Source: AGHT+IG7abe0VR/Fl64pl0adW3u1FQVJZKHucol42RaqssIirp7GaRGeRx5j+sV6Xm1sU5KgSRgrGw==
X-Received: by 2002:a17:906:8a59:b0:99b:ddac:d9d9 with SMTP id gx25-20020a1709068a5900b0099bddacd9d9mr7238687ejc.53.1692000521538;
        Mon, 14 Aug 2023 01:08:41 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id ha21-20020a170906a89500b009920e9a3a73sm5403737ejb.115.2023.08.14.01.08.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Aug 2023 01:08:41 -0700 (PDT)
Message-ID: <830e5e34-f6de-3233-4a12-06c8390169d1@linaro.org>
Date: Mon, 14 Aug 2023 10:08:38 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v2 1/2] dt-bindings: nvmem: SID: Add binding for H616 SID
 controller
Content-Language: en-US
To: Martin Botka <martin.botka@somainline.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 Andre Przywara <andre.przywara@arm.com>, Alan Ma <tech@biqu3d.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>
References: <20230814-sid-h616-v2-0-0267749b4471@somainline.org>
 <20230814-sid-h616-v2-1-0267749b4471@somainline.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230814-sid-h616-v2-1-0267749b4471@somainline.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14/08/2023 08:38, Martin Botka wrote:
> Add binding for the SID controller found in H616 SoC
> 
> Signed-off-by: Martin Botka <martin.botka@somainline.org>
> ---
>  Documentation/devicetree/bindings/nvmem/allwinner,sun4i-a10-sid.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/nvmem/allwinner,sun4i-a10-sid.yaml b/Documentation/devicetree/bindings/nvmem/allwinner,sun4i-a10-sid.yaml
> index 296001e7f498..2ec0a1b8f803 100644
> --- a/Documentation/devicetree/bindings/nvmem/allwinner,sun4i-a10-sid.yaml
> +++ b/Documentation/devicetree/bindings/nvmem/allwinner,sun4i-a10-sid.yaml
> @@ -27,6 +27,7 @@ properties:
>            - const: allwinner,sun50i-a64-sid
>        - const: allwinner,sun50i-h5-sid
>        - const: allwinner,sun50i-h6-sid
> +      - const: allwinner,sun50i-h616-sid

It does not look like you tested the DTS against bindings. Please run
`make dtbs_check` (see
Documentation/devicetree/bindings/writing-schema.rst or
https://www.linaro.org/blog/tips-and-tricks-for-validating-devicetree-sources-with-the-devicetree-schema/
for instructions).

Best regards,
Krzysztof

