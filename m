Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4DCD1FA4
	for <linux-sunxi@lists.linux.dev>; Fri, 12 Aug 2022 15:13:59 +0000 (UTC)
Received: by mail-il1-f174.google.com with SMTP id g18so618097ilk.4
        for <linux-sunxi@lists.linux.dev>; Fri, 12 Aug 2022 08:13:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:subject:references:in-reply-to:cc:to:from
         :x-gm-message-state:from:to:cc;
        bh=iLtu9hJNizm2ENvwqp87YzdTn+996PrzRE54oAzKcMM=;
        b=XE5IUbD86LD0YVjxv/uzqvW34Egr3u5EfI9DmXOl6yqeexGQlB1NOxTzmz8erqmaAF
         dw7QUybhUTxAmi+vPs6rRaqMdj5VjLWahEqHQTSRUS7qrB3R4VhYbS3Y4oGkQVzR837a
         1eZqZx+fiiZr7r56z+ZLPd7DZw+IKfk7KKal9sS9k6aybXGWRUZHUkzNjZqwEd84qELA
         xyJEkz9i8f5QrjT6GJS08XRBHh8O5f1b0SfPQR69yG5DMWnkCD31ICukOM8r40ZIvf6y
         UixXnj7Wbces1o6SXw7cwfFRfKO4hhQnGEATARS/N3iEhynTelR8IeyqSyujS+hmWYZZ
         VlPw==
X-Gm-Message-State: ACgBeo3/lLcAPn//ABIxyKvt6367h18e5IcyrVJmZjfdK4ydHheTzLcs
	aC3wvIMUD3hoeERlRuUg7w==
X-Google-Smtp-Source: AA6agR7KRpnUyFMI150wo+Sdnq1BIvRsT6BExj1A3Xi3z6PcCcJJtet+x4xVVJ+NmoSp4yKkpTJ+hQ==
X-Received: by 2002:a92:cda6:0:b0:2df:a33b:202b with SMTP id g6-20020a92cda6000000b002dfa33b202bmr2085796ild.161.1660317238913;
        Fri, 12 Aug 2022 08:13:58 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id o4-20020a927304000000b002e4c8200225sm70611ilc.39.2022.08.12.08.13.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Aug 2022 08:13:58 -0700 (PDT)
Received: (nullmailer pid 168982 invoked by uid 1000);
	Fri, 12 Aug 2022 15:13:53 -0000
From: Rob Herring <robh@kernel.org>
To: Samuel Holland <samuel@sholland.org>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>, Rob Herring <robh+dt@kernel.org>, linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, Maxime Ripard <maxime@cerno.tech>, linux-phy@lists.infradead.org, Kishon Vijay Abraham I <kishon@ti.com>, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Vinod Koul <vkoul@kernel.org>, Jagan Teki <jagan@amarulasolutions.com>, Maxime Ripard <mripard@kernel.org>, linux-arm-kernel@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>, linux-kernel@vger.kernel.org
In-Reply-To: <20220812075603.59375-2-samuel@sholland.org>
References: <20220812075603.59375-1-samuel@sholland.org> <20220812075603.59375-2-samuel@sholland.org>
Subject: Re: [PATCH 1/8] dt-bindings: sun6i-a31-mipi-dphy: Add the interrupts property
Date: Fri, 12 Aug 2022 09:13:53 -0600
Message-Id: <1660317233.444952.168981.nullmailer@robh.at.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

On Fri, 12 Aug 2022 02:55:56 -0500, Samuel Holland wrote:
> The sun6i DPHY can generate several interrupts, mostly for reporting
> error conditions, but also for detecting BTA and UPLS sequences.
> Document this capability in order to accurately describe the hardware.
> 
> The DPHY has no interrupt number provided in the vendor documentation
> because its interrupt line is shared with the DSI controller.
> 
> Fixes: c25b84c00826 ("dt-bindings: display: Convert Allwinner DSI to a schema")
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
> 
>  .../bindings/phy/allwinner,sun6i-a31-mipi-dphy.yaml           | 4 ++++
>  1 file changed, 4 insertions(+)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/phy/allwinner,sun6i-a31-mipi-dphy.example.dtb: d-phy@1ca1000: 'oneOf' conditional failed, one must be fixed:
	'interrupts' is a required property
	'interrupts-extended' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/phy/allwinner,sun6i-a31-mipi-dphy.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

