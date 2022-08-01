Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA5567F
	for <linux-sunxi@lists.linux.dev>; Mon,  1 Aug 2022 13:43:55 +0000 (UTC)
Received: by mail-io1-f50.google.com with SMTP id q14so8397776iod.3
        for <linux-sunxi@lists.linux.dev>; Mon, 01 Aug 2022 06:43:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:subject:references:in-reply-to:cc:to:from
         :x-gm-message-state:from:to:cc;
        bh=y4FlZrpOSW7bs3SSCv+hrJsY9DFSZ9IOQL9orespssM=;
        b=gmBAgbGiDkiCr3XHx0hu7Ofe9hwm+/9PZbFRmqjIrvkEqL5lcnalBtF+DYevDO6Ppd
         0SapM4x9q3vAwAjz40td4Z+Jrrslkducq/K/lBW0V3LWHnxAH5brMqZs75nD+Eer5q0w
         bYbYQByQ9NXHKbZStJyqB02lk9VXmun+GJ+X7d+C6n6tsgGTaTmQUWsA07doB1itmS0U
         VjxE2NYB3Lt1DEoa4hsdKx4vlfRyQPT+youfawyHCkLBdZc9vy9oOsyHlIoCuwfMx1fF
         OV7DMChPRtMUhC+Ap1Cj6aphr5bF2kVXuMlUlq1txSVk2dn7HFhzJ1eixb3mj7w7zgNV
         +uJA==
X-Gm-Message-State: ACgBeo3lpnXqLLeHBCmj/4jCMGEukP5z5RUFCWnwDzoZLcY2+LNbrUNc
	zsebFOzLsxMNUMz9ZSgwdQ==
X-Google-Smtp-Source: AA6agR6RXwK+cr0Hg80Gi5E4Kbz7VRmoTYTZl1KiiQk8aOjn7XSfaVSOFmc0ncyMLohxtFBWQRdjng==
X-Received: by 2002:a05:6638:ca:b0:342:7d2f:d882 with SMTP id w10-20020a05663800ca00b003427d2fd882mr528451jao.220.1659361434887;
        Mon, 01 Aug 2022 06:43:54 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id t129-20020a025487000000b003415b95c097sm5294568jaa.42.2022.08.01.06.43.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Aug 2022 06:43:54 -0700 (PDT)
Received: (nullmailer pid 914818 invoked by uid 1000);
	Mon, 01 Aug 2022 13:43:53 -0000
From: Rob Herring <robh@kernel.org>
To: Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org, Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, linux-sunxi@lists.linux.dev, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jernej Skrabec <jernej.skrabec@gmail.com>
In-Reply-To: <20220801044758.12679-1-samuel@sholland.org>
References: <20220801044758.12679-1-samuel@sholland.org>
Subject: Re: [PATCH 1/2] regulator: dt-bindings: Add Allwinner D1 LDOs
Date: Mon, 01 Aug 2022 07:43:53 -0600
Message-Id: <1659361433.069437.914817.nullmailer@robh.at.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

On Sun, 31 Jul 2022 23:47:57 -0500, Samuel Holland wrote:
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
> regulator device relies on a syscon exported by some "host" device node.
> Getting the register via a syscon avoids a dependency on the subsystem/
> driver for that host device (e.g. a functioning thermal sensor should
> not depend on having the audio codec driver loaded).
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
> 
>  .../allwinner,sun20i-d1-analog-ldos.yaml      | 77 +++++++++++++++++++
>  .../allwinner,sun20i-d1-system-ldos.yaml      | 55 +++++++++++++
>  2 files changed, 132 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/regulator/allwinner,sun20i-d1-analog-ldos.yaml
>  create mode 100644 Documentation/devicetree/bindings/regulator/allwinner,sun20i-d1-system-ldos.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Error: Documentation/devicetree/bindings/regulator/allwinner,sun20i-d1-analog-ldos.example.dts:24.27-28 syntax error
FATAL ERROR: Unable to parse input tree
make[1]: *** [scripts/Makefile.lib:383: Documentation/devicetree/bindings/regulator/allwinner,sun20i-d1-analog-ldos.example.dtb] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1404: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

