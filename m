Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE1C57A
	for <linux-sunxi@lists.linux.dev>; Fri, 22 Apr 2022 21:10:55 +0000 (UTC)
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-e604f712ecso9885144fac.9
        for <linux-sunxi@lists.linux.dev>; Fri, 22 Apr 2022 14:10:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=TRqLMDnSfOMMJvwbNg5ERReNlJdUDaY3MArVueheMwI=;
        b=1F0g1Jyoq0rfslwu8st9A4RUm0+kE6qcv52jo0iv80/0ZrfNq8uEELuMasYX8s5v6k
         hV72arKKh6hmmPFI1qJAkuoMyrICqKp9xNKKtgpd+7tSxeUXiAPRz6NIChRql3SZjxkS
         b3S3fMJcbP7hSTf25t8kERikNwa8/BpjhqMsiBdAOQHhiDhtzr8QUfJ4NtCLTxz9ML5z
         ZkRjeVM5ljsoEbFwn7XAQL/J9BBWGGKkdv+nUJ60HNmZrrnlBUwQwikfJf3DOQek1RYy
         18j/H4/xU70Xf/Yywuw4CMpy9jontPHKXMtmr6LwZP0IcNc8jhKr6qzH/vsoOQrTraP7
         WEQA==
X-Gm-Message-State: AOAM5326U+Xt//beDkgHnnl1HVoAy/Wuy4gERteQUhWS0NYGDTy8Kj9i
	0DH4M4+eMQeA2kCGZSLOvw==
X-Google-Smtp-Source: ABdhPJwCauAsquMdMwIxtueLYrwWVUnabgWI6OXGiVbx2Y27f+yF57TQi+4z5TpOQRa/HCe7vuQsXw==
X-Received: by 2002:a05:6870:79a:b0:e9:109a:1391 with SMTP id en26-20020a056870079a00b000e9109a1391mr800216oab.105.1650661855024;
        Fri, 22 Apr 2022 14:10:55 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id bf26-20020a056808191a00b00324f4d15aa1sm667603oib.12.2022.04.22.14.10.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Apr 2022 14:10:54 -0700 (PDT)
Received: (nullmailer pid 2784286 invoked by uid 1000);
	Fri, 22 Apr 2022 21:10:47 -0000
From: Rob Herring <robh@kernel.org>
To: icenowy@outlook.com
Cc: Maxime Ripard <mripard@kernel.org>, Hans de Goede <hdegoede@redhat.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-input@vger.kernel.org, Icenowy Zheng <icenowy@sipeed.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh+dt@kernel.org>, Samuel Holland <samuel@sholland.org>, linux-kernel@vger.kernel.org
In-Reply-To:  <BYAPR20MB2472D625C876D97E95CB6078BCF79@BYAPR20MB2472.namprd20.prod.outlook.com>
References:  <BYAPR20MB2472D625C876D97E95CB6078BCF79@BYAPR20MB2472.namprd20.prod.outlook.com>
Subject: Re: [PATCH 1/2] dt-bindings: input: sun4i-lradc-keys: add R329 LRADC binding
Date: Fri, 22 Apr 2022 16:10:47 -0500
Message-Id: <1650661847.262817.2784285.nullmailer@robh.at.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

On Sat, 23 Apr 2022 00:07:43 +0800, icenowy@outlook.com wrote:
> From: Icenowy Zheng <icenowy@sipeed.com>
> 
> R329 has similar LRADC with previous Allwinner SoCs, but with bus clock
> and reset.
> 
> Add binding for it.
> 
> Signed-off-by: Icenowy Zheng <icenowy@sipeed.com>
> ---
>  .../input/allwinner,sun4i-a10-lradc-keys.yaml | 21 +++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/input/allwinner,sun4i-a10-lradc-keys.yaml: then:properties:required: ['clocks', 'resets'] is not of type 'object', 'boolean'
	from schema $id: http://json-schema.org/draft-07/schema#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/input/allwinner,sun4i-a10-lradc-keys.yaml: ignoring, error in schema: then: properties: required
Documentation/devicetree/bindings/input/allwinner,sun4i-a10-lradc-keys.example.dtb:0:0: /example-0/lradc@1c22800: failed to match any schema with compatible: ['allwinner,sun4i-a10-lradc-keys']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

