Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86B7B2F9A
	for <linux-sunxi@lists.linux.dev>; Fri, 30 Apr 2021 15:25:00 +0000 (UTC)
Received: by mail-ot1-f52.google.com with SMTP id f75-20020a9d03d10000b0290280def9ab76so59606504otf.12
        for <linux-sunxi@lists.linux.dev>; Fri, 30 Apr 2021 08:25:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=/7eEsvMEZJ47hg8IvqdZUreNggO3ds++/YXgQWY8CIw=;
        b=q9toej8iB3x2SMEctBaWw2mj6iiIz/VBBEoTSmEObyMRsFTMnrLPFGNxvyxm5JbQxL
         /atnVsDJkgHGREMEgOSX6ArWUKo0o/YBCXdHY/N5dA+46JkFprk/OdkwtKCNkuzeXvF5
         BVxuqhOayzd9R2pid1/17ZmPGfCKiLYXBeEcqzX5Nl1JHXvKbXInJmA0852MI/D7qV+H
         TmVJpJ7HOBuflxIKAMyARGbEvmqDG9fUaSesJqrpxRwJqkazYmLkGAlk86Hfggemofb/
         p3QtxMzxARg6FRPY47oihXt9ScL/3L5sW36yG8pYMil6Qu65E4knPNytJtZ0Wt4b89xG
         OdeA==
X-Gm-Message-State: AOAM533JGLFyH8BaI6TCmjvb3E1dtf62dgpSEx9JhxZYZrsYJGMNkeqT
	vWBFxPNZpoqs36vYq0L3XQ==
X-Google-Smtp-Source: ABdhPJzgxL4fyp7PZwgduyI/n2iPxYyF0MKR4LhThPwz/lhf1+JZjnF5p7RzxxJWkyZbMwnq+hbgMg==
X-Received: by 2002:a9d:615a:: with SMTP id c26mr4037878otk.54.1619796299799;
        Fri, 30 Apr 2021 08:24:59 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id u185sm837557oie.12.2021.04.30.08.24.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 08:24:59 -0700 (PDT)
Received: (nullmailer pid 3353975 invoked by uid 1000);
	Fri, 30 Apr 2021 15:24:53 -0000
From: Rob Herring <robh@kernel.org>
To: Samuel Holland <samuel@sholland.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Maxime Ripard <mripard@kernel.org>, linux-usb@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-sunxi@lists.linux.dev, Felipe Balbi <balbi@kernel.org>, Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@siol.net>
In-Reply-To: <20210430031912.42252-2-samuel@sholland.org>
References: <20210430031912.42252-1-samuel@sholland.org> <20210430031912.42252-2-samuel@sholland.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: usb: Document the Allwinner H6 DWC3 glue
Date: Fri, 30 Apr 2021 10:24:53 -0500
Message-Id: <1619796293.743748.3353974.nullmailer@robh.at.kernel.org>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

On Thu, 29 Apr 2021 22:19:11 -0500, Samuel Holland wrote:
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
Documentation/devicetree/bindings/usb/allwinner,sun50i-h6-dwc3.example.dts:23.27-50.11: Warning (unit_address_vs_reg): /example-0/usb@5200000: node has a unit name, but no reg or ranges property
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/allwinner,sun50i-h6-dwc3.example.dt.yaml: usb@5200000: usb@5200000:phy-names:0: 'usb2-phy' was expected
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/allwinner,sun50i-h6-dwc3.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/allwinner,sun50i-h6-dwc3.example.dt.yaml: usb@5200000: phy-names:0: 'usb2-phy' was expected
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/snps,dwc3.yaml

See https://patchwork.ozlabs.org/patch/1471948

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

