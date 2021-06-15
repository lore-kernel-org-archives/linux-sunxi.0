Received: from mail-io1-f53.google.com (mail-io1-f53.google.com [209.85.166.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE6C92FB8
	for <linux-sunxi@lists.linux.dev>; Tue, 15 Jun 2021 22:37:20 +0000 (UTC)
Received: by mail-io1-f53.google.com with SMTP id k16so883218ios.10
        for <linux-sunxi@lists.linux.dev>; Tue, 15 Jun 2021 15:37:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=AapX0dNT59T/SI8VAeevcD55A+AFG5MSeNuhN4FA4aE=;
        b=qAu6mJXM5VCyBhljwA4166q1Q0jp34pDdHrvrHii+cB1V61Q2W98PRRIOMwd+FSihv
         Rssggibkub0sunDFNoa6QD36dBCB3nYD6qjBuhN6Bdqun+T0sLtympTEysrfXwJAlTNP
         u4/nRHv7+GTBPtvex+kTTxI4oZ7WtH8gQTPCb/RLM6NP9OH9MUp/WIhfPXvGg0tBMkCe
         Xjo5hfUz4p3fADP3GZaIzEQJihE+275jhAgqf5kARQwzrJ9aNWPPAsEpskEkotoicsmA
         PtWdYefFOF/mW4pJJ+Dl86lQqR9J18DeZpUC/MfBbjxXwjPgmvDT/sfgfN1LAZIHaicy
         HeCA==
X-Gm-Message-State: AOAM533hHZeTnGHPWLssJmqZgHAfxqiWnJmjMsFrNZIZG58vmubztCkY
	UWCbRnLVUfcKvwqbwwYCtA==
X-Google-Smtp-Source: ABdhPJzuul7DIME4umceda7UcrTrdVy5BGMY2MljyjNdecdHBWYZbkGdJhgM9V3oTSLQxsk8AGq6aA==
X-Received: by 2002:a05:6638:2583:: with SMTP id s3mr1244891jat.92.1623796640213;
        Tue, 15 Jun 2021 15:37:20 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id h6sm215234ilj.53.2021.06.15.15.37.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jun 2021 15:37:19 -0700 (PDT)
Received: (nullmailer pid 1415996 invoked by uid 1000);
	Tue, 15 Jun 2021 22:37:15 -0000
From: Rob Herring <robh@kernel.org>
To: Ban Tao <fengzheng923@gmail.com>
Cc: wens@csie.org, robh+dt@kernel.org, mripard@kernel.org, broonie@kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, jernej.skrabec@gmail.com, linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org, lgirdwood@gmail.com
In-Reply-To: <20210615130737.2098-1-fengzheng923@gmail.com>
References: <20210615130737.2098-1-fengzheng923@gmail.com>
Subject: Re: [PATCH 2/2] ASoC: sun50i-dmic: dt-bindings: add DT bindings for DMIC controller
Date: Tue, 15 Jun 2021 16:37:15 -0600
Message-Id: <1623796635.726367.1415995.nullmailer@robh.at.kernel.org>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

On Tue, 15 Jun 2021 21:07:37 +0800, Ban Tao wrote:
> The Allwinner SoCs feature an I2S controller across multiple SoC
> generations.
> 
> Signed-off-by: Ban Tao <fengzheng923@gmail.com>
> ---
>  .../sound/allwinner,sun50i-h6-dmic.yaml       | 66 +++++++++++++++++++
>  1 file changed, 66 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/allwinner,sun50i-h6-dmic.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Error: Documentation/devicetree/bindings/sound/allwinner,sun50i-h6-dmic.example.dts:23.28-29 syntax error
FATAL ERROR: Unable to parse input tree
make[1]: *** [scripts/Makefile.lib:380: Documentation/devicetree/bindings/sound/allwinner,sun50i-h6-dmic.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1416: dt_binding_check] Error 2
\ndoc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1492163

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

