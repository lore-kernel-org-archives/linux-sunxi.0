Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48C853FC3
	for <linux-sunxi@lists.linux.dev>; Wed,  1 Sep 2021 12:06:23 +0000 (UTC)
Received: by mail-oi1-f179.google.com with SMTP id p2so3472587oif.1
        for <linux-sunxi@lists.linux.dev>; Wed, 01 Sep 2021 05:06:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=M3T4yrG7zQ/orfLEy+dtJ3O+/bOtwc3PAJxag5037YY=;
        b=UdsWUxA7D87ZzP65PaTgOM2gM9yA2tG2rju8xeVs8pFQAmjGFhAT6WlbaTqbzZ+g0P
         6X/l0K9hqLvQErEPjhDH5RCKO9cpBO0nqcRtCkX5poUe642OkN/0QtQE74MwhEqqoTem
         g3PiGvOR+IwoF8f3qG3ndSDDJnjv1t6Y+qHd6mRAgaYpLaNEQjkT1mLSxh512sJ1k/HF
         /weduXfFaJ934Uff1Tuox6t5HjUP0O+Lhu0ddCxMfQ9t2kdXGKfLjkTB/2NIhvD/xRuL
         vddLxQ6IMwr0FLvcbPxBp6LtiKFCBurdGhcYXH11jtO+31ZTKyIXgD3VP4RLOlxHZpkY
         BXvw==
X-Gm-Message-State: AOAM532My6xM/DMhqdO6AxkOH5LuPh+82FHib+P32hfmO2rg3xNj7flk
	fRkU8O006AhfAl8XqiowvA==
X-Google-Smtp-Source: ABdhPJwunR5Oi9U858lSr+FGBBEaPHCwSaIHZ8qexSKC4A6YcEqQPvtO7EN46LQRqXcwBNS1fp/c0Q==
X-Received: by 2002:aca:b80b:: with SMTP id i11mr6967474oif.26.1630497982327;
        Wed, 01 Sep 2021 05:06:22 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id v29sm4314843ooe.31.2021.09.01.05.06.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Sep 2021 05:06:21 -0700 (PDT)
Received: (nullmailer pid 1876487 invoked by uid 1000);
	Wed, 01 Sep 2021 12:06:19 -0000
From: Rob Herring <robh@kernel.org>
To: Samuel Holland <samuel@sholland.org>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>, linux-clk@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, devicetree@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, Maxime Ripard <mripard@kernel.org>
In-Reply-To: <20210901053951.60952-2-samuel@sholland.org>
References: <20210901053951.60952-1-samuel@sholland.org> <20210901053951.60952-2-samuel@sholland.org>
Subject: Re: [RFC PATCH 1/7] dt-bindings: rtc: sun6i: Add H616 and R329 compatibles
Date: Wed, 01 Sep 2021 07:06:19 -0500
Message-Id: <1630497979.405519.1876486.nullmailer@robh.at.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

On Wed, 01 Sep 2021 00:39:45 -0500, Samuel Holland wrote:
> For these new SoCs, start requiring a complete list of input clocks.
> 
> For H616, this means bus, hosc, and pll-32k. For R329, this means ahb,
> bus, and hosc; and optionally ext-osc32k.
> 
> I'm not sure how to best represent this in the binding...
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
>  .../bindings/rtc/allwinner,sun6i-a31-rtc.yaml | 55 +++++++++++++++++--
>  include/dt-bindings/clock/sun50i-rtc.h        | 12 ++++
>  2 files changed, 61 insertions(+), 6 deletions(-)
>  create mode 100644 include/dt-bindings/clock/sun50i-rtc.h
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Traceback (most recent call last):
  File "/usr/local/bin/dt-doc-validate", line 67, in <module>
    ret = check_doc(f)
  File "/usr/local/bin/dt-doc-validate", line 33, in check_doc
    for error in sorted(dtschema.DTValidator.iter_schema_errors(testtree), key=lambda e: e.linecol):
  File "/usr/local/lib/python3.8/dist-packages/dtschema/lib.py", line 723, in iter_schema_errors
    cls(meta_schema).annotate_error(error, meta_schema, error.schema_path)
  File "/usr/local/lib/python3.8/dist-packages/dtschema/lib.py", line 706, in annotate_error
    schema = schema[p]
KeyError: 'properties'
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml: ignoring, error in schema: allOf: 5: if: properties
warning: no schema found in file: ./Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.example.dt.yaml:0:0: /example-0/rtc@1f00000: failed to match any schema with compatible: ['allwinner,sun6i-a31-rtc']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1522863

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

