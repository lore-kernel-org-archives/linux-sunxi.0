Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 955E3D2F5
	for <linux-sunxi@lists.linux.dev>; Wed, 15 Feb 2023 21:31:42 +0000 (UTC)
Received: by mail-ot1-f52.google.com with SMTP id 14-20020a9d010e000000b0068bdddfa263so60215otu.2
        for <linux-sunxi@lists.linux.dev>; Wed, 15 Feb 2023 13:31:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=O6xfNqM54ZLmIz2YbilJDBW+8SeWORFysxlKCUVbjQc=;
        b=pAg0x1To+yWOB6S/NCyL78PH2YP2UvXAU11a/oEJ4hZwt8ZW2PlL05n9+A97PF8e7C
         swwvuWh2Orpo2yxTT+ygtmwqNVqQDv+cj6yxnRWnPms0BIGwsPfoDkQhS5xblEt2o6o8
         3Jxwet19PDIPdq0Z1mtXxGxXdS0pI/F0MLL/ytK37Z5nGcW3qSvfk4ZPxZ8mQo7hUsLn
         I/NS/pF2hs/Fgy1AizPm+HxTJp6gkwhUKmeFjQ3tROe2c+lRpRE074xe1d3s3zvbTDXm
         OfCHlTIdkfgKHwyPPH6WNpEjNzN8s+AST8Knagvqv9R67ZsyTRsLPrqsKFifZkj2WBWV
         B2pg==
X-Gm-Message-State: AO0yUKWb1ecS8Houwj82eYpa8RJ5SV52eGOog7SVxC12KtAIJyaPdiUj
	4DC5aorDTskZRKThHS2OOw==
X-Google-Smtp-Source: AK7set/2aDFkLTc1Pcmo3QEZ3+YP/E2bn04VhpJQ7gg4ECFUH3P8CEKxATClYtwv3H8G3aZT4y+8ag==
X-Received: by 2002:a05:6830:144a:b0:68d:3ea5:1734 with SMTP id w10-20020a056830144a00b0068d3ea51734mr1748127otp.16.1676496701422;
        Wed, 15 Feb 2023 13:31:41 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id y10-20020a9d634a000000b0068bd20cf07dsm8096385otk.48.2023.02.15.13.31.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Feb 2023 13:31:40 -0800 (PST)
Received: (nullmailer pid 664383 invoked by uid 1000);
	Wed, 15 Feb 2023 21:31:39 -0000
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
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>, linux-kernel@vger.kernel.org, Samuel Holland <samuel@sholland.org>, linux-remoteproc@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, linux-sunxi@lists.linux.dev, Wilken Gottwalt <wilken.gottwalt@posteo.net>, devicetree@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, Ohad Ben-Cohen <ohad@wizery.com>, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20230215203711.6293-5-bage@debian.org>
References: <20230215203711.6293-1-bage@debian.org>
 <20230215203711.6293-5-bage@debian.org>
Message-Id: <167649580161.649957.15557847976208120638.robh@kernel.org>
Subject: Re: [PATCH v2 4/5] dt-bindings: hwlock: sun6i: Add a64 compatible
 string
Date: Wed, 15 Feb 2023 15:31:39 -0600


On Wed, 15 Feb 2023 21:37:09 +0100, Bastian Germann wrote:
> Add an allwinner,sun50i-a64-hwspinlock compatible string to the device
> tree binding. The A31 and A64 have compatible hwspinlocks.
> 
> Signed-off-by: Bastian Germann <bage@debian.org>
> ---
>  .../bindings/hwlock/allwinner,sun6i-a31-hwspinlock.yaml       | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/hwlock/allwinner,sun6i-a31-hwspinlock.example.dtb: hwlock@1c18000: compatible: ['allwinner,sun6i-a31-hwspinlock'] is too short
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/hwlock/allwinner,sun6i-a31-hwspinlock.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230215203711.6293-5-bage@debian.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

