Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7753B2F81
	for <linux-sunxi@lists.linux.dev>; Wed, 21 Apr 2021 12:51:54 +0000 (UTC)
Received: by mail-oi1-f182.google.com with SMTP id r186so14495161oif.8
        for <linux-sunxi@lists.linux.dev>; Wed, 21 Apr 2021 05:51:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=VQLhFO5JI2Nq15ywY7H92sO8oP4b0Dz1pppaueHAcNU=;
        b=kVKDZtPhD1F57LeatDRvnZVH1KMZhvdFSgxAfQHRJxIccCqQY6ttrEEi83M4erjqfa
         TKbnFtyJb0sbTXsp27m1wcmFjsY5nLYGNR2G0F3h6fJ/DSXIEvmFdmDyybpiw6VtzxWn
         8i06tsjtXw4qmmpz3OixPkPFqgM1H+6XFtEccU2Mu46cH1NFhbzb7EHdqct8KUjlMPkT
         6ZytczCsAVdbH8F8cLRafqQZGJzSYzjdPZUI0/UUIaQyxcbeLO7HEcJLw4e2MPUc3QLr
         LU/9wvTn6j2yO02hGaZf0HUd6vb6n2wW6mBpmxpDylhcrJJdYciIK0/w/kYcqLwbZ/Na
         +9QA==
X-Gm-Message-State: AOAM530v7bO0WRxLoevKcqK5JBrhUrs/a9HTJtT+Ynl+SdTF/hmdvpDo
	mMpLGY9GYeFKAOPZRjzLEw==
X-Google-Smtp-Source: ABdhPJxG41MeL3PxhD71HzvRtfENDs4R5CQOxLlgb/LRxz2WM4nMPgFKXQYTsviQQ3g8PDxRCJXIvw==
X-Received: by 2002:aca:cf8a:: with SMTP id f132mr350321oig.178.1619009513762;
        Wed, 21 Apr 2021 05:51:53 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id l1sm436992oot.40.2021.04.21.05.51.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Apr 2021 05:51:51 -0700 (PDT)
Received: (nullmailer pid 967210 invoked by uid 1000);
	Wed, 21 Apr 2021 12:51:48 -0000
From: Rob Herring <robh@kernel.org>
To: Samuel Holland <samuel@sholland.org>
Cc: Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <mripard@kernel.org>, Rob Herring <robh+dt@kernel.org>, linux-sunxi@lists.linux.dev, Jernej Skrabec <jernej.skrabec@siol.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20210421042834.27309-2-samuel@sholland.org>
References: <20210421042834.27309-1-samuel@sholland.org> <20210421042834.27309-2-samuel@sholland.org>
Subject: Re: [PATCH 1/2] dt-bindings: usb: Document the Allwinner H6 DWC3 glue
Date: Wed, 21 Apr 2021 07:51:48 -0500
Message-Id: <1619009508.513542.967209.nullmailer@robh.at.kernel.org>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

On Tue, 20 Apr 2021 23:28:33 -0500, Samuel Holland wrote:
> The RST_BUS_XHCI reset line in the H6 affects both the DWC3 core and the
> USB3 PHY. This suggests the reset line controls the USB3 IP as a whole.
> Represent this by attaching the reset line to a glue layer device.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
>  .../usb/allwinner,sun50i-h6-dwc3.yaml         | 75 +++++++++++++++++++
>  1 file changed, 75 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/allwinner,sun50i-h6-dwc3.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/allwinner,sun50i-h6-dwc3.yaml: $id: 'http://devicetree.org/schemas/usb/allwinner,sun50i-h6-dwc3#' does not match 'http://devicetree.org/schemas/.*\\.yaml#'
Unknown file referenced: [Errno 2] No such file or directory: '/usr/local/lib/python3.8/dist-packages/dtschema/schemas/usb/allwinner,sun50i-h6-usb3-phy.yaml'
xargs: dt-doc-validate: exited with status 255; aborting
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/allwinner,sun50i-h6-dwc3.yaml: ignoring, error in schema: $id
warning: no schema found in file: ./Documentation/devicetree/bindings/usb/allwinner,sun50i-h6-dwc3.yaml
Documentation/devicetree/bindings/usb/allwinner,sun50i-h6-dwc3.example.dts:23.27-50.11: Warning (unit_address_vs_reg): /example-0/usb@5200000: node has a unit name, but no reg or ranges property
Documentation/devicetree/bindings/usb/allwinner,sun50i-h6-dwc3.example.dt.yaml:0:0: /example-0/usb@5200000: failed to match any schema with compatible: ['allwinner,sun50i-h6-dwc3']
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/allwinner,sun50i-h6-dwc3.example.dt.yaml: usb@5200000: phy-names:0: 'usb2-phy' was expected
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/snps,dwc3.yaml

See https://patchwork.ozlabs.org/patch/1468558

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

