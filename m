Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 362A12F38
	for <linux-sunxi@lists.linux.dev>; Sun, 30 Oct 2022 13:50:23 +0000 (UTC)
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-13bd19c3b68so11142678fac.7
        for <linux-sunxi@lists.linux.dev>; Sun, 30 Oct 2022 06:50:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hw01HOuryg79no8aMleCKIAZAkXFo9PVrSnrQ3NItHg=;
        b=o4yGoSiAxSNYq9apOhVN6gJO81DeJf0LlzFd3kDp0j85cPaUmGfTvxbb9dhDSxwj4e
         oT1LHrKyA7rUtgmjPfi2ux3igNBGoUvK9CPnsKvsvDErvRa4VwHpuk1VfYlmH2Mdun+h
         j6wQzr38ugc5kIo62/NVXj3yNxvFOVAJ1X4KNI8neyKaLWT2UCE1w9rMugK5g7TF13RX
         xYaWGx23v8iCpGNiy+1+hZVeZxTHGttSATOqOsBBjmT+ViNx1UuaaRU3X47sYW/OFq07
         gkoht8wmf7zv5DX1CButY9JnbgsDT2iMrMHx7TlgnXB+Kv2Qw87FvE7NuhHoqTPCjrq8
         4BPQ==
X-Gm-Message-State: ACrzQf2WJRoe8nvtPOnSOrflCY8F41wDQAf5bj48c055rqd7x10ZMAih
	vYSgWGTuVrSorWuqOwmu7w==
X-Google-Smtp-Source: AMsMyM6HN4/vLJC1yWt+A8WWnZkp+11IcygTJEWrLtMHxk3x/m5N+dKkTENhuNR66OXIOrZIW/02AA==
X-Received: by 2002:a05:6870:d285:b0:12b:cdce:63d8 with SMTP id d5-20020a056870d28500b0012bcdce63d8mr14117853oae.140.1667137822201;
        Sun, 30 Oct 2022 06:50:22 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id a11-20020a9d5c8b000000b0066c3b6eff00sm1728680oti.2.2022.10.30.06.50.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Oct 2022 06:50:21 -0700 (PDT)
Received: (nullmailer pid 992217 invoked by uid 1000);
	Sun, 30 Oct 2022 13:50:23 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Naga Sureshkumar Relli <nagasure@xilinx.com>, Rob Herring <robh+dt@kernel.org>, Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Michael Walle <michael@walle.cc>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, devicetree@vger.kernel.org, Tudor Ambarus <Tudor.Ambarus@microchip.com>, Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, linux-sunxi@lists.linux.dev, Linus Walleij <linus.walleij@linaro.org>, linux-arm-kernel@lists.infradead.org, Pratyush Yadav <p.yadav@ti.com>, linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>
In-Reply-To: <20221028235933.934850-5-miquel.raynal@bootlin.com>
References: <20221028235933.934850-1-miquel.raynal@bootlin.com>
 <20221028235933.934850-5-miquel.raynal@bootlin.com>
Message-Id: <166713668385.965763.9400218413404488593.robh@kernel.org>
Subject: Re: [PATCH 04/12] dt-bindings: mtd: ingenic: Mark partitions in the
 controller node as deprecated
Date: Sun, 30 Oct 2022 08:50:23 -0500


On Sat, 29 Oct 2022 01:59:25 +0200, Miquel Raynal wrote:
> Defining partitions as subnodes of the controller has been deprecated
> long time ago, but unlike having partitions within the controller node,
> having an enveloppe named "partitions" (which is not itself within a
> chip subnode) is not that common, so keep this deprecated definition in
> this file.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  Documentation/devicetree/bindings/mtd/ingenic,nand.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 



My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):
Warning: Documentation/devicetree/bindings/mtd/atmel-nand.txt references a file that doesn't exist: Documentation/devicetree/bindings/mtd/partition.txt
Warning: Documentation/devicetree/bindings/mtd/ingenic,nand.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mtd/partition.txt
Warning: Documentation/devicetree/bindings/mtd/lpc32xx-mlc.txt references a file that doesn't exist: Documentation/devicetree/bindings/mtd/partition.txt
Warning: Documentation/devicetree/bindings/mtd/lpc32xx-slc.txt references a file that doesn't exist: Documentation/devicetree/bindings/mtd/partition.txt
Warning: Documentation/devicetree/bindings/mtd/mtk-nand.txt references a file that doesn't exist: Documentation/devicetree/bindings/mtd/partition.txt
Warning: drivers/mtd/parsers/Kconfig references a file that doesn't exist: Documentation/devicetree/bindings/mtd/partition.txt
Documentation/devicetree/bindings/mtd/atmel-nand.txt: Documentation/devicetree/bindings/mtd/partition.txt
Documentation/devicetree/bindings/mtd/ingenic,nand.yaml: Documentation/devicetree/bindings/mtd/partition.txt
Documentation/devicetree/bindings/mtd/lpc32xx-mlc.txt: Documentation/devicetree/bindings/mtd/partition.txt
Documentation/devicetree/bindings/mtd/lpc32xx-slc.txt: Documentation/devicetree/bindings/mtd/partition.txt
Documentation/devicetree/bindings/mtd/mtk-nand.txt: Documentation/devicetree/bindings/mtd/partition.txt
drivers/mtd/parsers/Kconfig: Documentation/devicetree/bindings/mtd/partition.txt

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

