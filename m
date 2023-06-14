Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A43CEDDBF
	for <linux-sunxi@lists.linux.dev>; Wed, 14 Jun 2023 14:24:03 +0000 (UTC)
Received: by mail-il1-f170.google.com with SMTP id e9e14a558f8ab-340b7da7e3aso1215855ab.3
        for <linux-sunxi@lists.linux.dev>; Wed, 14 Jun 2023 07:24:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686752642; x=1689344642;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=//LQdmeIx8VDOjysyrkzNeX5nkq2mzKxfmFr/6gfOOo=;
        b=XCotORRikrzWQHAz+ubU/sHIZS3cSFHsUr//b8Xm1IeG3xZWGItEJxXAk3s+Hxwr0Y
         q7L4qDCjwmVEXhgzxz2WySCKhG/0aw9UGnJ4zzNXrxbo+umaZJWe4KrucE37GaIDkwz7
         myGZACkbnjSYrcdkwj3eARA9enXUnitWYVuD2RXCURLiawIMsNAOl054hSiSjzdpJf7e
         S4onHZX6oh1Rz1iu76MIiPkFHi/eSZtuXQskoVw7dLHBAOQxiHq4CQmtewwmtkfOHeos
         deYhJekK6fpzC1Bjp8bewZ/8SRc9Egvu7yfyjPw6hqq6XIoie0Eskx/VsfxUwtsRHVRv
         zqrQ==
X-Gm-Message-State: AC+VfDxV9rcrAVdw9tm3s+/0sweNslVEALiYOOUUgPgWwwRaAZ9XYMTT
	Im+4PeZ/FEFbAc7Hdj01TA==
X-Google-Smtp-Source: ACHHUZ7wXmcmWVBGnccJZukbwYP+C9yoCz/N62Wnj/yTIO7plH80L5GUh4kr2WXJ6/m3J00pZBVtGQ==
X-Received: by 2002:a92:db47:0:b0:33d:a34a:2d42 with SMTP id w7-20020a92db47000000b0033da34a2d42mr12955717ilq.20.1686752642282;
        Wed, 14 Jun 2023 07:24:02 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id c5-20020a02a405000000b0041848ea6594sm4885425jal.34.2023.06.14.07.23.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 07:24:01 -0700 (PDT)
Received: (nullmailer pid 1344045 invoked by uid 1000);
	Wed, 14 Jun 2023 14:23:58 -0000
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
Cc: Rob Herring <robh+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	devicetree@vger.kernel.org, Andre Przywara <andre.przywara@arm.com>, 
	Conor Dooley <conor.dooley@microchip.com>, linux-arm-kernel@lists.infradead.org, 
	Palmer Dabbelt <palmer@dabbelt.com>, Conor Dooley <conor+dt@kernel.org>, 
	Lars-Peter Clausen <lars@metafoo.de>, linux-riscv@lists.infradead.org, 
	Ramona Bolboaca <ramona.bolboaca@analog.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	William Breathitt Gray <william.gray@linaro.org>, Jonathan Cameron <jic23@kernel.org>, 
	Cosmin Tanislav <demonsingur@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Chen-Yu Tsai <wens@csie.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-iio@vger.kernel.org, 
	Ibrahim Tilki <Ibrahim.Tilki@analog.com>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Samuel Holland <samuel@sholland.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	ChiYuan Huang <cy_huang@richtek.com>, =?UTF-8?Q?Leonard_G=C3=B6hrs?= <l.goehrs@pengutronix.de>, 
	Hugo Villeneuve <hvilleneuve@dimonoff.com>, Caleb Connolly <caleb.connolly@linaro.org>, 
	linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, ChiaEn Wu <chiaen_wu@richtek.com>, 
	Haibo Chen <haibo.chen@nxp.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, 
	Mike Looijmans <mike.looijmans@topic.nl>
In-Reply-To: <20230614132644.699425-3-bigunclemax@gmail.com>
References: <20230614132644.699425-1-bigunclemax@gmail.com>
 <20230614132644.699425-3-bigunclemax@gmail.com>
Message-Id: <168675263824.1343935.18392695577959894991.robh@kernel.org>
Subject: Re: [PATCH v6 2/3] dt-bindings: iio: adc: Add Allwinner
 D1/T113s/R329/T507 SoCs GPADC
Date: Wed, 14 Jun 2023 08:23:58 -0600


On Wed, 14 Jun 2023 16:26:26 +0300, Maksim Kiselev wrote:
> Allwinner's D1/T113s/R329/T507 SoCs have a new general purpose ADC.
> This ADC is the same for all of this SoCs. The only difference is
> the number of available channels.
> 
> Signed-off-by: Maksim Kiselev <bigunclemax@gmail.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../iio/adc/allwinner,sun20i-d1-gpadc.yaml    | 91 +++++++++++++++++++
>  1 file changed, 91 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/adc/allwinner,sun20i-d1-gpadc.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/iio/adc/allwinner,sun20i-d1-gpadc.yaml: patternProperties:^channel@[0-9a-f]+$:properties:reg:items: 'oneOf' conditional failed, one must be fixed:
	/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/iio/adc/allwinner,sun20i-d1-gpadc.yaml: patternProperties:^channel@[0-9a-f]+$:properties:reg:items: 'anyOf' conditional failed, one must be fixed:
		'Maksimum' is not one of ['$ref', 'additionalItems', 'additionalProperties', 'allOf', 'anyOf', 'const', 'contains', 'default', 'dependencies', 'dependentRequired', 'dependentSchemas', 'deprecated', 'description', 'else', 'enum', 'exclusiveMaximum', 'exclusiveMinimum', 'items', 'if', 'minItems', 'minimum', 'maxItems', 'maximum', 'multipleOf', 'not', 'oneOf', 'pattern', 'patternProperties', 'properties', 'required', 'then', 'typeSize', 'unevaluatedProperties', 'uniqueItems']
		'type' was expected
		from schema $id: http://devicetree.org/meta-schemas/core.yaml#
	{'minimum': 0, 'Maksimum': 15} is not of type 'array'
	from schema $id: http://devicetree.org/meta-schemas/core.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/iio/adc/allwinner,sun20i-d1-gpadc.yaml: patternProperties:^channel@[0-9a-f]+$:properties:reg: 'anyOf' conditional failed, one must be fixed:
	'maxItems' is a required property
		hint: Only "maxItems" is required for a single entry if there are no constraints defined for the values.
	'items' is not one of ['maxItems', 'description', 'deprecated']
	'items' is not one of ['description', 'deprecated', 'const', 'enum', 'minimum', 'maximum', 'multipleOf', 'default', '$ref', 'oneOf']
	/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/iio/adc/allwinner,sun20i-d1-gpadc.yaml: patternProperties:^channel@[0-9a-f]+$:properties:reg:items: 'oneOf' conditional failed, one must be fixed:
		/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/iio/adc/allwinner,sun20i-d1-gpadc.yaml: patternProperties:^channel@[0-9a-f]+$:properties:reg:items: 'anyOf' conditional failed, one must be fixed:
			'maxItems' is a required property
				hint: Only "maxItems" is required for a single entry if there are no constraints defined for the values.
			'minimum' is not one of ['maxItems', 'description', 'deprecated']
			'Maksimum' is not one of ['maxItems', 'description', 'deprecated']
			Additional properties are not allowed ('Maksimum', 'minimum' were unexpected)
				hint: Arrays must be described with a combination of minItems/maxItems/items
			'Maksimum' is not one of ['description', 'deprecated', 'const', 'enum', 'minimum', 'maximum', 'multipleOf', 'default', '$ref', 'oneOf']
			hint: cell array properties must define how many entries and what the entries are when there is more than one entry.
			from schema $id: http://devicetree.org/meta-schemas/core.yaml#
		{'minimum': 0, 'Maksimum': 15} is not of type 'array'
		hint: "items" can be a list defining each entry or a schema applying to all items. A list has an implicit size. A schema requires minItems/maxItems to define the size.
		from schema $id: http://devicetree.org/meta-schemas/core.yaml#
	hint: cell array properties must define how many entries and what the entries are when there is more than one entry.
	from schema $id: http://devicetree.org/meta-schemas/core.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230614132644.699425-3-bigunclemax@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

