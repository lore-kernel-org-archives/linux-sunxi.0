Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77E0D7B
	for <linux-sunxi@lists.linux.dev>; Thu, 19 May 2022 00:08:12 +0000 (UTC)
Received: by mail-oi1-f173.google.com with SMTP id q8so4600821oif.13
        for <linux-sunxi@lists.linux.dev>; Wed, 18 May 2022 17:08:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=vCQnkYgc1zVHenxwoyabefaogr520hch3r3ycwfJxBY=;
        b=xqEoa7JqonFtkUEIPW5bOQnEo3qCY1GRrArbOX/Ro7vJ6Cs4Xvt4ym1H4nZYr7TDBA
         YkEPnbRo1u75eDWox0+/F7foevFLCYbo5eiiipZrjtwdX6ErPVvATndk8cJjj2W/Mn+Y
         IRcP7G0J8hjyfy+FNA8sJzBatDR5rWOQKpz8ZyJSnY8trOozIOudkH3u380F8XeFKDij
         SsqlRF9BjbjWNdtW0sR7b0y4mfQpLsclgBxmXZvm1BYzddBxag2d0S3ctE5k1VahmgkT
         b83IoYtJ7HzwYYD1epo61VSv4EX2O5heuL85G7+To6ehcnqN1wbb2g28eLRBEhSGd19A
         ui+A==
X-Gm-Message-State: AOAM532avpign/7lm56JVfUtwjRLgyqy+HBcVrnguZ6UdpDnVX7Dhj7g
	3Q6xJpoh3qYeF+bCAfs/YA==
X-Google-Smtp-Source: ABdhPJxpp9m6M87ZFeTNPEQnDSUwEbSseDW7JPj0qpBLpkd8eWwd79O5OpLHulj0YFHL7xqDn/FaSQ==
X-Received: by 2002:a05:6808:10ca:b0:32a:dc6a:da6f with SMTP id s10-20020a05680810ca00b0032adc6ada6fmr1406701ois.41.1652918891363;
        Wed, 18 May 2022 17:08:11 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id m18-20020a9d7e92000000b0060603221268sm1222721otp.56.2022.05.18.17.08.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 May 2022 17:08:10 -0700 (PDT)
Received: (nullmailer pid 50697 invoked by uid 1000);
	Thu, 19 May 2022 00:08:09 -0000
From: Rob Herring <robh@kernel.org>
To: Corentin Labbe <clabbe@baylibre.com>
Cc: pabeni@redhat.com, linux-arm-kernel@lists.infradead.org, samuel@sholland.org, kuba@kernel.org, broonie@kernel.org, linux-kernel@vger.kernel.org, lgirdwood@gmail.com, edumazet@google.com, hkallweit1@gmail.com, wens@csie.org, andrew@lunn.ch, davem@davemloft.net, linux-sunxi@lists.linux.dev, krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org, jernej.skrabec@gmail.com, calvin.johnson@oss.nxp.com, netdev@vger.kernel.org, linux@armlinux.org.uk, robh+dt@kernel.org
In-Reply-To: <20220518200939.689308-5-clabbe@baylibre.com>
References: <20220518200939.689308-1-clabbe@baylibre.com> <20220518200939.689308-5-clabbe@baylibre.com>
Subject: Re: [PATCH v2 4/5] dt-bindings: net: Add documentation for optional regulators
Date: Wed, 18 May 2022 19:08:09 -0500
Message-Id: <1652918889.376228.50696.nullmailer@robh.at.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

On Wed, 18 May 2022 20:09:38 +0000, Corentin Labbe wrote:
> Add entries for the new optional regulators.
> 
> Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
> ---
>  Documentation/devicetree/bindings/net/ethernet-phy.yaml | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/net/ethernet-phy.yaml:149:8: [warning] wrong indentation: expected 6 but found 7 (indentation)

dtschema/dtc warnings/errors:

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

