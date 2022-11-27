Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C63D33C4
	for <linux-sunxi@lists.linux.dev>; Sun, 27 Nov 2022 16:25:31 +0000 (UTC)
Received: by mail-io1-f49.google.com with SMTP id h206so6084606iof.10
        for <linux-sunxi@lists.linux.dev>; Sun, 27 Nov 2022 08:25:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yuUo839ouCRSbkJNJ1fxU1PZrrK1dbyq76ZJVUGD9/k=;
        b=lOz4c+aPXzn970o8A//xVTCeu+0AkD5TmhbLgev4G+3+4gBMJnUiDwMWE7mmEncvvb
         8+kjYx4tX1aclGkc98uNtCbwmCI8nAnHzRTvGZUSNVmBZoNjGopxV951m37k8C9HrUXh
         vr3uZdYijNvcBISmtiyrSlCkaDw+EWoOcIQdzPhPoZQh5Pg9rjYfMMLfBM6j4/6LmtkV
         eSJTjOmfFR6tbWWwhPluxFsCyAa3rODQ3JodnQ4WDdp3JOF9pEeh1FNX0PuHa2peCphX
         ENcdI72rREnc7u6WBJPf96RSMVH2GiAF1JFjSyxw+zuptFDSlWtryLdxRu3LmB1gfF9m
         /Axg==
X-Gm-Message-State: ANoB5pn3x7IZqIeJN2imvQcFwAAJDESf0poOOppcn4AFtI9sAaNd9AM4
	D7tO69L3MbBY2Cx5KPfZ7w==
X-Google-Smtp-Source: AA0mqf44R/wDWOVoHTVFS+SDacaqzAGlB6QCBeYoD3ZCH3iZsjq0w4dtFkFKXNm7XdshFRBGxYTxIg==
X-Received: by 2002:a02:6d54:0:b0:376:24f6:d0f4 with SMTP id e20-20020a026d54000000b0037624f6d0f4mr14700069jaf.206.1669566330359;
        Sun, 27 Nov 2022 08:25:30 -0800 (PST)
Received: from robh_at_kernel.org ([2605:ef80:80c3:406b:3c03:158a:46b4:95c8])
        by smtp.gmail.com with ESMTPSA id j198-20020a0263cf000000b003753b6452f9sm3385698jac.35.2022.11.27.08.25.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Nov 2022 08:25:29 -0800 (PST)
Received: (nullmailer pid 7239 invoked by uid 1000);
	Sun, 27 Nov 2022 16:25:30 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Rob Herring <robh+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, linux-kernel@vger.kernel.org, Andre Przywara <andre.przywara@arm.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Kaehlcke <mka@chromium.org>, linux-sunxi@lists.linux.dev, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Chen-Yu Tsai <wens@csie.org>, linux-usb@vger.kernel.org
In-Reply-To: <20221127073140.2093897-3-uwu@icenowy.me>
References: <20221127073140.2093897-1-uwu@icenowy.me>
 <20221127073140.2093897-3-uwu@icenowy.me>
Message-Id: <166956617204.3782.6939462747953664680.robh@kernel.org>
Subject: Re: [PATCH 2/6] dt-bindings: usb: Add binding for Genesys Logic
 GL850G hub controller
Date: Sun, 27 Nov 2022 10:25:30 -0600


On Sun, 27 Nov 2022 15:31:36 +0800, Icenowy Zheng wrote:
> The Genesys Logic GL850G is a USB 2.0 Single TT hub controller that
> features 4 downstream ports, an internal 5V-to-3.3V LDO regulator (can
> be bypassed) and an external reset pin.
> 
> Add a device tree binding for its USB protocol part. The internal LDO is
> not covered by this and can just be modelled as a fixed regulator.
> 
> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> ---
>  .../bindings/usb/genesys,gl850g.yaml          | 48 +++++++++++++++++++
>  1 file changed, 48 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/genesys,gl850g.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
./Documentation/devicetree/bindings/usb/genesys,gl850g.yaml: $id: relative path/filename doesn't match actual path or filename
	expected: http://devicetree.org/schemas/usb/genesys,gl850g.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/usb/realtek,rts5411.yaml: duplicate '$id' value 'http://devicetree.org/schemas/usb/realtek,rts5411.yaml#'
Error: Documentation/devicetree/bindings/usb/genesys,gl850g.example.dts:26.41-42 syntax error
FATAL ERROR: Unable to parse input tree
make[1]: *** [scripts/Makefile.lib:406: Documentation/devicetree/bindings/usb/genesys,gl850g.example.dtb] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1492: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20221127073140.2093897-3-uwu@icenowy.me

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command.

