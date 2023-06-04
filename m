Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6852FC17
	for <linux-sunxi@lists.linux.dev>; Sun,  4 Jun 2023 19:29:09 +0000 (UTC)
Received: by mail-io1-f43.google.com with SMTP id ca18e2360f4ac-77493b3d18cso162793739f.0
        for <linux-sunxi@lists.linux.dev>; Sun, 04 Jun 2023 12:29:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685906948; x=1688498948;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ij5XhT5jB8Nf96u95NnR46WqBGb6FiYB0L867QNIR/M=;
        b=ZI/ceXnwu8bVV8mkBRZwTxTxJ+gIjGY5vcB6Xi77GXmQI1nzKFSqxvottNSIS+HFis
         Nbsqyy40isFE18Yh68VHeLFh5PJ41XcIubBOZHU4YMqLLoax0hjZyRq7JiKw4V/CAxfC
         ImlgBnv90DWUwU9j99eBHVES29tZQJ5lh2YTiJPPtoNNf2/mBHQ/AACh/liVSEiVKemu
         n4b4V56yCGS/n5lq3BWKEJbDhTW21HH18Jsih8RJiDOQdEzAwGere5cFl/4WpF+AlnO+
         nAczDrk82SthxwZUujIbETLU6iipanvZGPF0kudQNjTjFohGl3FQghMaC3ohRtF3yq29
         7RWQ==
X-Gm-Message-State: AC+VfDwCetTxborGqp7dKtbor1VkIpV6NoZamDAjI8zlnWBihxrts9Ve
	ueBEuCQDR8zEEsiOxixq+w==
X-Google-Smtp-Source: ACHHUZ4JJS8XBgdt1+SzDtD2MEpxUV98/xM2bSyFtyQkPzj8iOewpvgcay8t2+isMQNpFA3ff4OK9g==
X-Received: by 2002:a05:6602:2584:b0:76c:785f:8f82 with SMTP id p4-20020a056602258400b0076c785f8f82mr11914911ioo.6.1685906948618;
        Sun, 04 Jun 2023 12:29:08 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id a22-20020a056638019600b0041abd81975bsm1697542jaq.153.2023.06.04.12.29.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jun 2023 12:29:07 -0700 (PDT)
Received: (nullmailer pid 3700333 invoked by uid 1000);
	Sun, 04 Jun 2023 19:29:04 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Maksim Kiselev <bigunclemax@gmail.com>
Cc: ChiYuan Huang <cy_huang@richtek.com>, ChiaEn Wu <chiaen_wu@richtek.com>, 
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, 
	Conor Dooley <conor+dt@kernel.org>, Samuel Holland <samuel@sholland.org>, 
	Jonathan Cameron <jic23@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, linux-sunxi@lists.linux.dev, 
	William Breathitt Gray <william.gray@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-riscv@lists.infradead.org, 
	Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Haibo Chen <haibo.chen@nxp.com>, 
	devicetree@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Andre Przywara <andre.przywara@arm.com>, Mike Looijmans <mike.looijmans@topic.nl>, 
	Chen-Yu Tsai <wens@csie.org>, Ramona Bolboaca <ramona.bolboaca@analog.com>, 
	Lars-Peter Clausen <lars@metafoo.de>, Cosmin Tanislav <demonsingur@gmail.com>, linux-iio@vger.kernel.org, 
	Philipp Zabel <p.zabel@pengutronix.de>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Ibrahim Tilki <Ibrahim.Tilki@analog.com>, Caleb Connolly <caleb.connolly@linaro.org>, 
	=?UTF-8?Q?Leonard_G=C3=B6hrs?= <l.goehrs@pengutronix.de>
In-Reply-To: <20230604185336.1943889-3-bigunclemax@gmail.com>
References: <20230604185336.1943889-1-bigunclemax@gmail.com>
 <20230604185336.1943889-3-bigunclemax@gmail.com>
Message-Id: <168590694462.3700314.2525765521559343425.robh@kernel.org>
Subject: Re: [PATCH v3 2/3] dt-bindings: iio: adc: Add Allwinner
 D1/T113s/R329/T507 SoCs GPADC
Date: Sun, 04 Jun 2023 13:29:04 -0600


On Sun, 04 Jun 2023 21:53:15 +0300, Maksim Kiselev wrote:
> From: Maxim Kiselev <bigunclemax@gmail.com>
> 
> Allwinner's D1/T113s/R329/T507 SoCs have a new general purpose ADC.
> This ADC is the same for all of this SoCs. The only difference is
> the number of available channels.
> 
> Signed-off-by: Maxim Kiselev <bigunclemax@gmail.com>
> ---
>  .../iio/adc/allwinner,sun20i-d1-gpadc.yaml    | 90 +++++++++++++++++++
>  1 file changed, 90 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/adc/allwinner,sun20i-d1-gpadc.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/iio/adc/allwinner,sun20i-d1-gpadc.yaml: 'maintainers' is a required property
	hint: Metaschema for devicetree binding documentation
	from schema $id: http://devicetree.org/meta-schemas/base.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/iio/adc/allwinner,sun20i-d1-gpadc.example.dtb: adc@2009000: interrupts: [[73], [4]] is too long
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/iio/adc/allwinner,sun20i-d1-gpadc.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230604185336.1943889-3-bigunclemax@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

