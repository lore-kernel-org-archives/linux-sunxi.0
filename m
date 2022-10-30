Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A01EE6AA8
	for <linux-sunxi@lists.linux.dev>; Sun, 30 Oct 2022 13:50:26 +0000 (UTC)
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-13b6c1c89bdso11123214fac.13
        for <linux-sunxi@lists.linux.dev>; Sun, 30 Oct 2022 06:50:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QM+uLtn35cNBB8WShoztahWkyNeyqqGV8AL7ZS4noIw=;
        b=58r9PDUIobl2LbKExSQCBMBm+/PBbH2aGMrPsc1eW8Mxyu8j28JtXd3Wwh9l/yfD2w
         EqXnoz6O0ZDFtdA47CWy1hV18JepJhjqBn4HY+Lozhuq5sk/f1iP18z0kuGDKyb5g+Yq
         Sv/2zlvyv86cZUH6c/w5qCkBn+XnRg7TnLg6u4rd07zjwL1TQcOMRggxxxtioD6Z9m/O
         bYmCur4w9SYXXXqshVFTJppPFmq8BtlUiA8b9CZqbDh9oT22NRsQBx82xJbwEurWGoJ9
         uJ57lZNVzT8H0dRopENAVa4uZFqTI/DnLfXLL7CqxzGruEivDtGz62Lq/huxr53FMEv5
         xLyA==
X-Gm-Message-State: ACrzQf32uLwbjcUJXdLwBj45wy2LWHpxUG0JW9cRx7VgbMFacuthNIRE
	zCDFghKMpk+bS6wDnc6Btg==
X-Google-Smtp-Source: AMsMyM4ekD+KyJWMr4GSGQ0Ji2kUPt3lAnlfD1u4S/wAA6L9dkzw4WsHzE7oFxxtxteJsfH9/11fzg==
X-Received: by 2002:a05:6870:5b9d:b0:12b:5871:22f4 with SMTP id em29-20020a0568705b9d00b0012b587122f4mr4949428oab.211.1667137825562;
        Sun, 30 Oct 2022 06:50:25 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id 11-20020aca280b000000b00353fe4fb4casm1394805oix.48.2022.10.30.06.50.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Oct 2022 06:50:25 -0700 (PDT)
Received: (nullmailer pid 992220 invoked by uid 1000);
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
Cc: Maxime Ripard <mripard@kernel.org>, Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>, linux-sunxi@lists.linux.dev, linux-mtd@lists.infradead.org, Linus Walleij <linus.walleij@linaro.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-arm-kernel@lists.infradead.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Walle <michael@walle.cc>, Manivannan Sadhasivam <mani@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>, Chen-Yu Tsai <wens@csie.org>, Naga Sureshkumar Relli <nagasure@xilinx.com>, linux-arm-msm@vger.kernel.org, Tudor Ambarus <Tudor.Ambarus@microchip.com>, Pratyush Yadav <p.yadav@ti.com>, Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
In-Reply-To: <20221028235933.934850-10-miquel.raynal@bootlin.com>
References: <20221028235933.934850-1-miquel.raynal@bootlin.com>
 <20221028235933.934850-10-miquel.raynal@bootlin.com>
Message-Id: <166713668466.965796.13624922237162086174.robh@kernel.org>
Subject:
 Re: [PATCH 09/12] dt-bindings: mtd: phymap: Reuse the generic definitions
Date: Sun, 30 Oct 2022 08:50:23 -0500


On Sat, 29 Oct 2022 01:59:30 +0200, Miquel Raynal wrote:
> The memory mapped MTD devices also share a lot with all the other MTD
> devices, so let's share the properties by referencing mtd.yaml. We can
> then drop mentioning the properties, to the cost of mentioning the
> possible "sram" node name prefix.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  Documentation/devicetree/bindings/mtd/mtd-physmap.yaml | 7 +++----
>  Documentation/devicetree/bindings/mtd/mtd.yaml         | 2 +-
>  2 files changed, 4 insertions(+), 5 deletions(-)
> 



My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/memory-controllers/st,stm32-fmc2-ebi.example.dtb: psram@0,0: $nodename:0: 'psram@0,0' does not match '^(flash|sram)(@.*)?$'
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mtd/mtd-physmap.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

