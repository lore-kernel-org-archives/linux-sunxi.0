Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B576173
	for <linux-sunxi@lists.linux.dev>; Thu, 17 Jun 2021 21:26:44 +0000 (UTC)
Received: by mail-io1-f47.google.com with SMTP id s26so1442482ioe.9
        for <linux-sunxi@lists.linux.dev>; Thu, 17 Jun 2021 14:26:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=WRkbRg9Bf/LCif0asWJibTLvFQ8qESLyCcw61Dt7ZUI=;
        b=Um6P6eK+az3wdgU8oveleMDp2v5JMbl/BEiIWzq8r6hFq75XboO4CUWKIyOb7QJZF8
         SedvPu5T9yynYTSb6qn5M7TUcVKi8Y3GBD20VcdoGQAg/oErqzUhKu9mQWxm3KyDS5rI
         pxsljCWaY6O/sw8vsABoeOScHisu6zcBTt08+sj7g7aQITbPyd7JCiP6jVjeD27XoLp6
         SnZt+nj9fV2xLzciCTuqf3FLcTvBnaMsJpvVOihYj4XkyayKbTVdoze9kagL6q8lqx0J
         EI3U1hFPiqeueOFb7xJ4wo2Pog7dVY4z8VW3+LvQgaKulAVrxYiTIJg2SXc4JZgxDU6V
         agqg==
X-Gm-Message-State: AOAM533EpG14iHAtdEFhwKkQqyCqetQldstNZ/e10UnSRHgRebmkgNeW
	k3aQMf0hRjjYiBSkKPHmvQ==
X-Google-Smtp-Source: ABdhPJz2qR9tCm9/RgsjEGUFcsdmjgfskMAzB3MZ0zAiG+SDMl2EubL2S4imr4UV7CvSdcCsKP3zNg==
X-Received: by 2002:a05:6638:168d:: with SMTP id f13mr242927jat.124.1623965203489;
        Thu, 17 Jun 2021 14:26:43 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id n2sm3559875iod.54.2021.06.17.14.26.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jun 2021 14:26:42 -0700 (PDT)
Received: (nullmailer pid 3336119 invoked by uid 1000);
	Thu, 17 Jun 2021 21:26:24 -0000
From: Rob Herring <robh@kernel.org>
To: Ban Tao <fengzheng923@gmail.com>
Cc: mripard@kernel.org, robh+dt@kernel.org, linux-sunxi@lists.linux.dev, lgirdwood@gmail.com, alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org, broonie@kernel.org, wens@csie.org, linux-kernel@vger.kernel.org, jernej.skrabec@gmail.com, devicetree@vger.kernel.org
In-Reply-To: <20210617131005.2416-1-fengzheng923@gmail.com>
References: <20210617131005.2416-1-fengzheng923@gmail.com>
Subject: Re: [PATCH v2 2/2] ASoC: sun50i-dmic: dt-bindings: add DT bindings for DMIC controller
Date: Thu, 17 Jun 2021 15:26:24 -0600
Message-Id: <1623965184.555815.3336118.nullmailer@robh.at.kernel.org>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

On Thu, 17 Jun 2021 21:10:05 +0800, Ban Tao wrote:
> DT binding documentation for this new ASoC driver.
> 
> Signed-off-by: Ban Tao <fengzheng923@gmail.com>
> ---
>  .../sound/allwinner,sun50i-h6-dmic.yaml       | 68 +++++++++++++++++++
>  1 file changed, 68 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/allwinner,sun50i-h6-dmic.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/allwinner,sun50i-h6-dmic.example.dt.yaml: dmic@5095000: #sound-dai-cells:0:0: 0 was expected
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/allwinner,sun50i-h6-dmic.yaml
\ndoc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1493498

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

