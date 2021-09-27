Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 158503FCC
	for <linux-sunxi@lists.linux.dev>; Mon, 27 Sep 2021 16:00:27 +0000 (UTC)
Received: by mail-oo1-f47.google.com with SMTP id v17-20020a4ae051000000b002b5a56e3da3so1710197oos.2
        for <linux-sunxi@lists.linux.dev>; Mon, 27 Sep 2021 09:00:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=cSYXdsZMtCkjltzpzvc0iqOZm2IuxImc8AJFVYElbF8=;
        b=tpnEvZZYK6Qt9ObzdenHTPAmtB7nxpBn5GyNhyTzE+VcAfXUQFLIrbyndAWakzMbff
         Ed0mMUfJJafg4Ik+04KtWWA4m0OLfu0z3tENO2M5EdPbX2d8dmAndnIau1/MK2yNwV0d
         kv+5KVxcys0lrbqd2GTN0J6wPnC3AyRpAubtqBQ9C5fw2N4jJPCP7lB1SWEPxunpHfvI
         PPW506d/c/fMCJuKjjjluqoA/bErfBTdFzt3KEvu3BwVbeBl7HieI3bX5CpCmp7QG8cJ
         tF8UDYdbeJycsIPsuhJ7gSznaLTJ+9O/J0MQlUx3dBtQ6Khj5XL5wUuokYmcxtP+0Elp
         lSlw==
X-Gm-Message-State: AOAM533kOpHcj+gMFs8hei/+qnVDwr7RCnSvJFmoGy8zJr6JthEFVla3
	i/vGcE3s2ifNdg7TNN1pXA==
X-Google-Smtp-Source: ABdhPJx+kWVKQPNSL7zRT2PF+nkAeUDBsLYsPQVsB+TvUtvQr5OPkVQu0ePFmjv0luIlZGTwojbZgg==
X-Received: by 2002:a4a:e499:: with SMTP id s25mr589507oov.46.1632758426210;
        Mon, 27 Sep 2021 09:00:26 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id r19sm4187743otg.37.2021.09.27.09.00.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Sep 2021 09:00:25 -0700 (PDT)
Received: (nullmailer pid 3382896 invoked by uid 1000);
	Mon, 27 Sep 2021 16:00:24 -0000
Date: Mon, 27 Sep 2021 11:00:24 -0500
From: Rob Herring <robh@kernel.org>
To: Maxime Ripard <maxime@cerno.tech>
Cc: devicetree@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>, linux-sunxi@lists.linux.dev, Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>, linux-arm-kernel@lists.infradead.org, Lee Jones <lee.jones@linaro.org>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>
Subject: Re: [RESEND v2 2/3] dt-bindings: mfd: Convert X-Powers AXP binding
 to a schema
Message-ID: <YVHqmPROu2p9baDh@robh.at.kernel.org>
References: <20210924071614.868307-1-maxime@cerno.tech>
 <20210924071614.868307-2-maxime@cerno.tech>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210924071614.868307-2-maxime@cerno.tech>

On Fri, 24 Sep 2021 09:16:13 +0200, Maxime Ripard wrote:
> The X-Powers AXP PMICs are supported by Linux thanks to its device tree
> binding.
> 
> Now that we have the DT validation in place, let's convert the device
> tree bindings for that driver over to a YAML schema.
> 
> Cc: Chen-Yu Tsai <wens@csie.org>
> Cc: Lee Jones <lee.jones@linaro.org>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> 
> ---
> 
> Changes from v1:
>   - Add GPIO example
>   - Remove the limitation on regulator-ramp-delay
> ---
>  .../i2c/allwinner,sun6i-a31-p2wi.yaml         |   2 +-
>  .../devicetree/bindings/mfd/axp20x.txt        | 273 ------------
>  .../bindings/mfd/x-powers,axp152.yaml         | 400 ++++++++++++++++++
>  3 files changed, 401 insertions(+), 274 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/mfd/axp20x.txt
>  create mode 100644 Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
