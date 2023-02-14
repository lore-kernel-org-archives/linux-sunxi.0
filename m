Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8941FC0BB
	for <linux-sunxi@lists.linux.dev>; Tue, 14 Feb 2023 16:12:46 +0000 (UTC)
Received: by mail-il1-f181.google.com with SMTP id i26so51111ila.11
        for <linux-sunxi@lists.linux.dev>; Tue, 14 Feb 2023 08:12:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TOvrwglmfiziR7GpHogrkS3U+q64rSn22USfXubW88k=;
        b=XrKC2zH+uUaPC97AOqS0/bdPT49/JVZZjK3xT6qcEj2IzdJ9Xxp8loksup0qyESRFS
         CLRxPlTPquxrClaH/kOdxlakKSD3MlUcqQWDNYJOIuVz35tPLnXYMbEknxjNTP9OCUP2
         gmA5u84VkkHeIH1NJ0eOB5zW9G5J4UBzav3Y71bs7T8j4cvsV0zxswRdgD3ktogxgyAc
         OYT9Ws0tQs8neJj7kHHO/SUfu1mMvamZytV6kepoAETPUrQBHRmV11sXss2mW/E9gTI4
         aKFQPahgB5MCZ7IhJMxe93U7m3fLZi01l9yhZdHz2f0mOpAPQCQjLrf0BKb4yxBi1Ew+
         LZAA==
X-Gm-Message-State: AO0yUKVT86RaDLI4LDONLy0RB7+Byz/RGaqkpuFw0jgzI79IOZnwoDd8
	KoMzjqFSPwwUCYJ2ru3xgw==
X-Google-Smtp-Source: AK7set/1RjGkMZEjYQt+pgvNdOtTX6Ck9XeM1kK01k0MLbfojEYgbSZ8+acxpFVCLsWy9ptdlxsOYQ==
X-Received: by 2002:a05:6e02:1ba4:b0:313:904d:abda with SMTP id n4-20020a056e021ba400b00313904dabdamr2858079ili.28.1676391165536;
        Tue, 14 Feb 2023 08:12:45 -0800 (PST)
Received: from robh_at_kernel.org (c-73-14-99-67.hsd1.co.comcast.net. [73.14.99.67])
        by smtp.gmail.com with ESMTPSA id r15-20020a02c6cf000000b0039e68e9988csm4797305jan.56.2023.02.14.08.12.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Feb 2023 08:12:45 -0800 (PST)
Received: (nullmailer pid 76710 invoked by uid 1000);
	Tue, 14 Feb 2023 16:12:34 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Bastian Germann <bage@debian.org>
Cc: linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Baolin Wang <baolin.wang@linux.alibaba.com>, Bjorn Andersson <andersson@kernel.org>, Ohad Ben-Cohen <ohad@wizery.com>, linux-sunxi@lists.linux.dev, Chen-Yu Tsai <wens@csie.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Samuel Holland <samuel@sholland.org>, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, Wilken Gottwalt <wilken.gottwalt@posteo.net>, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20230213231931.6546-2-bage@debian.org>
References: <20230213231931.6546-1-bage@debian.org>
 <20230213231931.6546-2-bage@debian.org>
Message-Id: <167638944701.3666.5425414440419322569.robh@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: hwlock: sun6i: Add missing
 #hwlock-cells
Date: Tue, 14 Feb 2023 10:12:34 -0600


On Tue, 14 Feb 2023 00:19:28 +0100, Bastian Germann wrote:
> The allwinner,sun6i-a31-hwspinlock.yaml binding needs #hwlock-cells
> which is required by the hwlock type.
> 
> Fixes: f9e784dcb63f ("dt-bindings: hwlock: add sun6i_hwspinlock")
> Signed-off-by: Bastian Germann <bage@debian.org>
> ---
>  .../bindings/hwlock/allwinner,sun6i-a31-hwspinlock.yaml       | 4 ++++
>  1 file changed, 4 insertions(+)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/hwlock/allwinner,sun6i-a31-hwspinlock.example.dtb: hwlock@1c18000: '#hwlock-cells' is a required property
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/hwlock/allwinner,sun6i-a31-hwspinlock.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230213231931.6546-2-bage@debian.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

