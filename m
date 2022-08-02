Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 620167F
	for <linux-sunxi@lists.linux.dev>; Tue,  2 Aug 2022 14:01:44 +0000 (UTC)
Received: by mail-io1-f42.google.com with SMTP id e69so10688489iof.5
        for <linux-sunxi@lists.linux.dev>; Tue, 02 Aug 2022 07:01:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:subject:references:in-reply-to:cc:to:from
         :x-gm-message-state:from:to:cc;
        bh=vlxxqffRGLJz6At1luZovyKJ8Z0Fn0mEQjFHuFpnTaA=;
        b=jwndlG4ThNekpgva2SF95pmOFNmP7lbfHxbRNeJSxys6BV3S8ZPicG9DB1XwTm1+hG
         qcOtKxuiUDCgqXjw39sL3ftafU4crHAtYPvpeYjcRWj7tys8Q0xeSNRiR/oYzgPGbPv6
         k3gbDjjVNBxm30UNsnoRYeMotd9r9mV5qCFqUSH+VI+Qhh6Ll6NnjlzlIrCRJ3tfCUif
         Q4Ed6r9L1CVNWedN90lzjA81WN2s7oXwRMw3OVszd1rdVb1YHDp9mtS6gw9/1C+igMna
         LQPWsNtrNB99SxuUvX38xAjR1BZNYJ4vVr2ulJPsk6ULLC5kpdWAMWSUGbZrhP3MWcm1
         8XgQ==
X-Gm-Message-State: ACgBeo0gcGrb4Va3Tmss0LfgwPKsoJWpSQx1VL4XjOIwV5J5HGwrvbQh
	UJUXIBp1DqZNpJAhB2DRFt3mvUK97w==
X-Google-Smtp-Source: AA6agR7jv2r8Ke28anbCI27c32r7DRSvqdJjz4YIzELL5re2hxIzpmdz8hZ1RHOwJ/H1pPmN+lMp7Q==
X-Received: by 2002:a05:6638:446:b0:342:77f4:7858 with SMTP id r6-20020a056638044600b0034277f47858mr3568258jap.135.1659448903448;
        Tue, 02 Aug 2022 07:01:43 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id e1-20020a056602044100b0067bcf7bf3c1sm7103445iov.14.2022.08.02.07.01.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Aug 2022 07:01:43 -0700 (PDT)
Received: (nullmailer pid 8417 invoked by uid 1000);
	Tue, 02 Aug 2022 14:01:41 -0000
From: Rob Herring <robh@kernel.org>
To: Samuel Holland <samuel@sholland.org>
Cc: linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <mripard@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>
In-Reply-To: <20220802053213.3645-4-samuel@sholland.org>
References: <20220802053213.3645-1-samuel@sholland.org> <20220802053213.3645-4-samuel@sholland.org>
Subject: Re: [PATCH v2 3/4] regulator: dt-bindings: Add Allwinner D1 LDOs
Date: Tue, 02 Aug 2022 08:01:41 -0600
Message-Id: <1659448901.659907.8416.nullmailer@robh.at.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

On Tue, 02 Aug 2022 00:32:12 -0500, Samuel Holland wrote:
> The Allwinner D1 SoC contains two pairs of in-package LDOs. One pair is
> for general purpose use. LDOA generally powers the board's 1.8 V rail.
> LDOB generally powers the in-package DRAM, where applicable.
> 
> The other pair of LDOs powers the analog power domains inside the SoC,
> including the audio codec, thermal sensor, and ADCs. These LDOs require
> a 0.9 V bandgap voltage reference. The calibration value for the voltage
> reference is stored in an eFuse, accessed via an NVMEM cell.
> 
> Neither LDO control register is in its own MMIO range; instead, each
> regulator device relies on a regmap/syscon exported by its parent.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
> 
> Changes in v2:
>  - Remove syscon property from bindings
>  - Update binding examples to fix warnings and provide context
> 
>  .../allwinner,sun20i-d1-analog-ldos.yaml      | 65 +++++++++++++++++++
>  .../allwinner,sun20i-d1-system-ldos.yaml      | 57 ++++++++++++++++
>  2 files changed, 122 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/regulator/allwinner,sun20i-d1-analog-ldos.yaml
>  create mode 100644 Documentation/devicetree/bindings/regulator/allwinner,sun20i-d1-system-ldos.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/regulator/allwinner,sun20i-d1-system-ldos.example.dtb:0:0: /example-0/syscon@3000000: failed to match any schema with compatible: ['allwinner,sun20i-d1-system-control']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

