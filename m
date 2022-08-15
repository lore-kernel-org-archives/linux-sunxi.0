Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19A331C04
	for <linux-sunxi@lists.linux.dev>; Mon, 15 Aug 2022 14:01:50 +0000 (UTC)
Received: by mail-qv1-f41.google.com with SMTP id u10so5368404qvp.12
        for <linux-sunxi@lists.linux.dev>; Mon, 15 Aug 2022 07:01:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:subject:references:in-reply-to:cc:to:from
         :x-gm-message-state:from:to:cc;
        bh=dKfzpcSJcyLaUeyLXairrh0uvdiYsvVZa/B4hAX3xzE=;
        b=7K72I4RUFlQ8zImgifLK/0FZIIn0jbgu9NGxIXqKunsWjaCbJCSwKx5QnaQHxClHT9
         JPkEcH35Wi8veIgYfCKIloIRh0/i+Xq8xTh40+5xyH/aUsGbMvuuYOwuWc4HQRAT88aO
         uCK2/TzuZXqvNY3iwN/mTrBc7GkDwVxD4uz2g7SMpTOd+VCNcBUNbeECN97l4gf875iJ
         wcS4epUqVw7BB60OoQm6gsM+evBQiR1VXS7/L1OwxzC+WXBilHKycAFaWWXBS1E5Lg9f
         pQDP4LMGJHwy/nVtLDVMb1se645dnLJfZzboB26ykEIkeIUn5YaPe4jv3ux4kEk7LSQK
         EbRg==
X-Gm-Message-State: ACgBeo1GAavIJ6LSErqBSk6bHjOb0dX1SBQnNdE8qvHz0aPAZathdUNN
	u0wrioWMmt7R+O0BWKdJUw==
X-Google-Smtp-Source: AA6agR5+zNDBXvl94ryaYajiHWUcq2LRnBtS5fKnVsr31dTCfohTIhxzYK5K4DDtpF/JFQwd4bjNPA==
X-Received: by 2002:a05:6214:5099:b0:477:4ed2:633d with SMTP id kk25-20020a056214509900b004774ed2633dmr13604542qvb.16.1660572109711;
        Mon, 15 Aug 2022 07:01:49 -0700 (PDT)
Received: from robh.at.kernel.org ([50.206.145.23])
        by smtp.gmail.com with ESMTPSA id x2-20020ac87302000000b00342b7e4241fsm8057678qto.77.2022.08.15.07.01.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Aug 2022 07:01:49 -0700 (PDT)
Received: (nullmailer pid 1103614 invoked by uid 1000);
	Mon, 15 Aug 2022 14:01:47 -0000
From: Rob Herring <robh@kernel.org>
To: Samuel Holland <samuel@sholland.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, devicetree@vger.kernel.org, Maxime Ripard <mripard@kernel.org>
In-Reply-To: <20220815043436.20170-4-samuel@sholland.org>
References: <20220815043436.20170-1-samuel@sholland.org> <20220815043436.20170-4-samuel@sholland.org>
Subject: Re: [PATCH v3 3/4] dt-bindings: sram: sunxi-sram: Add optional regulators child
Date: Mon, 15 Aug 2022 08:01:47 -0600
Message-Id: <1660572107.469120.1103613.nullmailer@robh.at.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

On Sun, 14 Aug 2022 23:34:34 -0500, Samuel Holland wrote:
> Some sunxi SoCs have in-package regulators controlled by a register in
> the system control MMIO block. Allow a child node for these regulators
> in addition to SRAM child nodes.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
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
>  .../allwinner,sun4i-a10-system-control.yaml   | 29 +++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/sram/allwinner,sun4i-a10-system-control.example.dtb:0:0: /example-1/syscon@3000000: failed to match any schema with compatible: ['allwinner,sun20i-d1-system-control']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

