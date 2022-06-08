Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 306217C
	for <linux-sunxi@lists.linux.dev>; Wed,  8 Jun 2022 13:45:13 +0000 (UTC)
Received: by mail-io1-f44.google.com with SMTP id a10so18837164ioe.9
        for <linux-sunxi@lists.linux.dev>; Wed, 08 Jun 2022 06:45:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=wTTvlPBhL0R4VGrImadF6/peV4pBTwvdmzGU+XrZruE=;
        b=Vi75KPX2AskpLU7r0AjnlrsJuZEoHldnsBsvt1ARWP/vJuth4ItI5O3jg7ZP1ab14b
         zbSrxCf29VoolRriRIkAenvw1zlfuebtXbkMjAO9lR7yBDIiyt9ZVkAyc66i0zrSkpyk
         mD9lB2u92z1mRzkHRUv78OEbNXzJ2c9oyL/oebY/GOay0n2waXF8Sq4z+gf0/NST/KSD
         VDiQ/pUnZmbvWkHllAmc/HTCxFpgtJl3HhpnDUGqekh8W5N2ObF/OnJb+hFBl0CKG7nK
         wHA/6bKFbFDg1IxnpUUD4t1jasnil9YoBBcM79Ntag0qoYJfxtv4wWWp2rR2pVtlnbg0
         UkUA==
X-Gm-Message-State: AOAM530LNxTbTxbi2I4eKweTX/LLH8/IAwbGSvTR5gi/761mFTTnDAlm
	467lrlw7Qec+I/aL5C8/uQ==
X-Google-Smtp-Source: ABdhPJzXC7b2axuL8VqcV+jcp6rJGpBavEB0PfCW3q7lAr4J3Dzn0kGXXRomqn4DlodahC0axmuGvw==
X-Received: by 2002:a6b:cf13:0:b0:668:bda0:f300 with SMTP id o19-20020a6bcf13000000b00668bda0f300mr16208468ioa.89.1654695912193;
        Wed, 08 Jun 2022 06:45:12 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id p4-20020a056638216400b003315a20c6e1sm7862407jak.9.2022.06.08.06.45.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jun 2022 06:45:11 -0700 (PDT)
Received: (nullmailer pid 1272088 invoked by uid 1000);
	Wed, 08 Jun 2022 13:45:07 -0000
From: Rob Herring <robh@kernel.org>
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Samuel Holland <samuel@sholland.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>, linux-phy@lists.infradead.org, Bin Liu <b-liu@ti.com>, linux-usb@vger.kernel.org, Vinod Koul <vkoul@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, Kishon Vijay Abraham I <kishon@ti.com>, devicetree@vger.kernel.org
In-Reply-To: <20220608070452.338006-3-uwu@icenowy.me>
References: <20220608070452.338006-1-uwu@icenowy.me> <20220608070452.338006-3-uwu@icenowy.me>
Subject: Re: [PATCH 2/7] dt-bindings: phy: add binding document for Allwinner F1C100s USB PHY
Date: Wed, 08 Jun 2022 07:45:07 -0600
Message-Id: <1654695907.384174.1272087.nullmailer@robh.at.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

On Wed, 08 Jun 2022 15:04:47 +0800, Icenowy Zheng wrote:
> Allwinner F1C100s has the most simple USB PHY among all Allwinner SoCs,
> because it has only one OTG USB controller, no host-only OHCI/EHCI
> controllers.
> 
> Add a binding document for it.
> 
> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> ---
>  .../phy/allwinner,suniv-f1c100s-usb-phy.yaml  | 83 +++++++++++++++++++
>  1 file changed, 83 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/allwinner,suniv-f1c100s-usb-phy.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/phy/allwinner,suniv-f1c100s-usb-phy.example.dts:19:18: fatal error: dt-bindings/clock/suniv-f1c100s-ccu.h: No such file or directory
   19 |         #include <dt-bindings/clock/suniv-f1c100s-ccu.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[1]: *** [scripts/Makefile.lib:383: Documentation/devicetree/bindings/phy/allwinner,suniv-f1c100s-usb-phy.example.dtb] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1404: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

