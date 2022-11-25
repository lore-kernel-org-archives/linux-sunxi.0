Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 543D023C2
	for <linux-sunxi@lists.linux.dev>; Fri, 25 Nov 2022 08:10:55 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id j4so5775418lfk.0
        for <linux-sunxi@lists.linux.dev>; Fri, 25 Nov 2022 00:10:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sL1NUAu6lSv+jlMLYFhjd/8Pjp4yH4Gi/+vBxDoZ+ks=;
        b=g3+PUwY4xc1OsQmrGhCpvVD+xktnoc9Q+9u9ZqE5ygYSKXtbkKc7gSdri4jQDsAhE3
         TDBzrmi0Lr38VfXcPtrPK77gCo/Bt6uzdnQftL5A6rgpSiP/C8+zMyhCHB9nVHg8iKZK
         +F6ItGNB20GLolup29DA+M+kgJojEQ8Pv09lUdMwbzfe9Czs9tjflxTouy9zKvnf5k14
         XQUIZutT+Snv52pnteTN7AqffK7zKfk4W2gdY473UEJ9QSKf4BXjsrlH8qSfHi1dEthw
         vL6E+F9OWHpv0STEwfrsokr51+gGm5iHmpMvpdF6FroJYOdLlmCEH8r/hCTcQsPa609J
         TUKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sL1NUAu6lSv+jlMLYFhjd/8Pjp4yH4Gi/+vBxDoZ+ks=;
        b=iGALlBNWW6jNofR6XuAhH+6kxnVzK1bKy9pakrxIxuyuzfYeJhX8KRSAFD4ptOSwsh
         qc0igJlonyO+J8sm3p/CMXonvyzS+8E/tKKo2hPEIuyQggrrdBnpudr8zqzG93uruqpO
         +rhUgwtOojRtZDIw1/76RELsoua7940M6NOzFzTdnzEnwqA517AY1zdCGYNUR7Pb+bjg
         iHP/MM/wc/Z4sftqIMTZV+U0HX+WqaYyddykJy6iN3/eBqisnn/N5n+Dv/qxQKifxuKI
         P7bDNx99O/gcKZeWZVMxiw5ar19QJYu/sJE3OJwfRm6uSiBUESBePTp169sz76xqnCpM
         ALTg==
X-Gm-Message-State: ANoB5pmbD74JRruuK15Cchd6YQpNnuY8do5uzSM1OAMV/c6yJtDe45nV
	WAOsxyaCb58M4Iw75hROfMKQug==
X-Google-Smtp-Source: AA0mqf6hra2shSkxsPNtb/2b1IHlfQhtErf0xh49kwt893xjrDT83WbRMB9jez0ppNQJlVyiYecu5Q==
X-Received: by 2002:a05:6512:c29:b0:4b1:b061:4815 with SMTP id z41-20020a0565120c2900b004b1b0614815mr11672276lfu.18.1669363853422;
        Fri, 25 Nov 2022 00:10:53 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id s6-20020a056512214600b004afac783b5esm425357lfr.238.2022.11.25.00.10.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Nov 2022 00:10:52 -0800 (PST)
Message-ID: <8fe3c2a6-845a-06ab-1164-9ddd4f5e5ac9@linaro.org>
Date: Fri, 25 Nov 2022 09:10:51 +0100
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v4 3/4] dt-bindings: sram: sunxi-sram: Add regulators
 child
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
 <20221125040112.18160-4-samuel@sholland.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221125040112.18160-4-samuel@sholland.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25/11/2022 05:01, Samuel Holland wrote:
> Some sunxi SoCs have in-package regulators controlled by a register in
> the system control MMIO block. Allow a child node for this regulator
> device in addition to SRAM child nodes.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
> 
> Changes in v4:
>  - Remove unevaluatedProperties from regulators schema reference
> 
> Changes in v3:
>  - Require the regulators node to have a unit address
>  - Reference the regulator schema from the SRAM controller schema
>  - Move the system LDOs example to the SRAM controller schema
>  - Reorder the patches so the example passes validation
> 
> Changes in v2:
>  - New patch for v2
> 
>  .../allwinner,sun4i-a10-system-control.yaml   | 28 +++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sram/allwinner,sun4i-a10-system-control.yaml b/Documentation/devicetree/bindings/sram/allwinner,sun4i-a10-system-control.yaml
> index 98a7dc7f467d..c487ac9521e9 100644
> --- a/Documentation/devicetree/bindings/sram/allwinner,sun4i-a10-system-control.yaml
> +++ b/Documentation/devicetree/bindings/sram/allwinner,sun4i-a10-system-control.yaml
> @@ -56,6 +56,9 @@ properties:
>    ranges: true
>  
>  patternProperties:
> +  "^regulators@[0-9a-f]+$":
> +    $ref: /schemas/regulator/allwinner,sun20i-d1-system-ldos.yaml#
> +
>    "^sram@[a-z0-9]+":
>      type: object

You could add allOf:if:not:...then: clause making regulators as false
for all variants which do not support it. This would make it more specific.

Anyway:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

