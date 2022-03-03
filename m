Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2C7066A3
	for <linux-sunxi@lists.linux.dev>; Thu,  3 Mar 2022 13:44:43 +0000 (UTC)
Received: by mail-oi1-f176.google.com with SMTP id 12so4796445oix.12
        for <linux-sunxi@lists.linux.dev>; Thu, 03 Mar 2022 05:44:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=v44qDax9KEdYLRCIw5soHVCzl51dh0SIKoJV0wM0I0I=;
        b=p8z+//sZXcx08mBpvY2Pf+e4lb2kaAw20qxaJxAqFf/WRBJmjWwaCipMQH+06BJ8KQ
         RpEPBbyZtfza5/ScF3N3w3tkrGf45i5kuvhJ3wY4w9IFlQsO5ijyTY3+Q8vGU/ApHZfF
         tplX/rgaX74ni5lyjEB15+rxpwAgri8oNlpt/eb7/l2qslob1pOBg3puM5q/oG7FtlJa
         ZDfxnnrYrtia1vAoC3iFT2b1JGKGREGqS+kxtbl+3ODzb+WFSAV89zqkcoNrwoMkc18R
         3sNQ88qlcF+1IuP09LL1yQn9/KyFcal8fV1FIsgDqV2LprNdcGaqyVvNappyMs91AS8o
         TmIA==
X-Gm-Message-State: AOAM533QKd2uwrzfv5nMNejEmXXE5nqpjMS1TGopZN4AW6NhHpoRmWWF
	HQjLkn3qtqO6CFzHFdEUZg==
X-Google-Smtp-Source: ABdhPJzn31TBcNmGDsK1JV7b+U+3AzzWAVgACRgHF4lqaMW3Q7MxwOp88OaXLDAQFSwz+6Z4Nw7nKA==
X-Received: by 2002:aca:502:0:b0:2cd:c24:278f with SMTP id 2-20020aca0502000000b002cd0c24278fmr4457068oif.150.1646315081264;
        Thu, 03 Mar 2022 05:44:41 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id z25-20020a056808065900b002d97bda386esm980555oih.51.2022.03.03.05.44.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Mar 2022 05:44:40 -0800 (PST)
Received: (nullmailer pid 1495431 invoked by uid 1000);
	Thu, 03 Mar 2022 13:44:38 -0000
From: Rob Herring <robh@kernel.org>
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, Yong Deng <yong.deng@magewell.com>, Maxime Ripard <mripard@kernel.org>, Samuel Holland <samuel@sholland.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Hans Verkuil <hans.verkuil@cisco.com>, Kishon Vijay Abraham I <kishon@ti.com>, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
In-Reply-To: <20220302220739.144303-4-paul.kocialkowski@bootlin.com>
References: <20220302220739.144303-1-paul.kocialkowski@bootlin.com> <20220302220739.144303-4-paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH v3 3/9] dt-bindings: media: sun6i-a31-csi: Add MIPI CSI-2 input port
Date: Thu, 03 Mar 2022 07:44:38 -0600
Message-Id: <1646315078.961128.1495430.nullmailer@robh.at.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

On Wed, 02 Mar 2022 23:07:33 +0100, Paul Kocialkowski wrote:
> The A31 CSI controller supports two distinct input interfaces:
> parallel and an external MIPI CSI-2 bridge. The parallel interface
> is often connected to a set of hardware pins while the MIPI CSI-2
> bridge is an internal FIFO-ish link. As a result, these two inputs
> are distinguished as two different ports.
> 
> Note that only one of the two may be present on a controller instance.
> For example, the V3s has one controller dedicated to MIPI-CSI2 and one
> dedicated to parallel.
> 
> Update the binding with an explicit ports node that holds two distinct
> port nodes: one for parallel input and one for MIPI CSI-2.
> 
> This is backward-compatible with the single-port approach that was
> previously taken for representing the parallel interface port, which
> stays enumerated as fwnode port 0.
> 
> Note that additional ports may be added in the future, especially to
> support feeding the CSI controller's output to the ISP.
> 
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Acked-by: Maxime Ripard <mripard@kernel.org>
> ---
>  .../media/allwinner,sun6i-a31-csi.yaml        | 66 +++++++++++++++----
>  1 file changed, 53 insertions(+), 13 deletions(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/media/allwinner,sun6i-a31-csi.yaml:88:9: [warning] wrong indentation: expected 10 but found 8 (indentation)
./Documentation/devicetree/bindings/media/allwinner,sun6i-a31-csi.yaml:90:9: [warning] wrong indentation: expected 10 but found 8 (indentation)
./Documentation/devicetree/bindings/media/allwinner,sun6i-a31-csi.yaml:102:5: [warning] wrong indentation: expected 6 but found 4 (indentation)
./Documentation/devicetree/bindings/media/allwinner,sun6i-a31-csi.yaml:104:5: [warning] wrong indentation: expected 6 but found 4 (indentation)

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/media/allwinner,sun6i-a31-csi.example.dt.yaml: csi@1cb4000: ports:port@0: 'reg' does not match any of the regexes: 'pinctrl-[0-9]+'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/media/allwinner,sun6i-a31-csi.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1600105

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

