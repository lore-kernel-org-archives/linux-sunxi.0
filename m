Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D14B70
	for <linux-sunxi@lists.linux.dev>; Fri, 21 May 2021 01:39:09 +0000 (UTC)
Received: by mail-oi1-f169.google.com with SMTP id b25so18311657oic.0
        for <linux-sunxi@lists.linux.dev>; Thu, 20 May 2021 18:39:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=AHDUWcKLdEreHylbJ6qjwAOsVXEIpsN/MhjQoJ5Ovks=;
        b=OjVghFYLUtFGJ1r4PdeiFQpDxjMvWhcCtzg577Fwl5+7FSvarii/IiU67ysTlhk7yJ
         mE8l2rdih06IUY1cGKaVNUPk0thjucRpdAePjh3QkxO1HlHQYdKZZpREQd6o6KutR+iw
         oN0XXrAsUfvBAxPt0WffBQc4Xpc3vehRkrqvob6TdKZ4PTZO/URTjVI0nKxMMr6vLqrY
         ujWvaBfNiQPxzbMkw2g5HZQWmc+3S4Xbmg3ylbFpzI03Ta9dcbE1Hkb/E1kABRcKo/SG
         Ap2vDA2ffnUdotygEaGbq5loWmyuLlzt40865wgacH1e7wWjApAGnksB+qgOtWN/eSZr
         tf6g==
X-Gm-Message-State: AOAM5322A3KcyyE5dpz1QK2rvodAmcg8ohhAMFQDm3y/wg71VAla950d
	n7uXDF4DiM4+u3PVUuToDg==
X-Google-Smtp-Source: ABdhPJy1os/eXheMpifGdqYKraVHyYBNJMLWCtPZfxhLS1bqSNKMrSeUUG53n/h5x7/eyOWVPHzMaw==
X-Received: by 2002:a05:6808:a87:: with SMTP id q7mr281561oij.38.1621561148841;
        Thu, 20 May 2021 18:39:08 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id v19sm1008850otq.35.2021.05.20.18.39.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 18:39:08 -0700 (PDT)
Received: (nullmailer pid 2459176 invoked by uid 1000);
	Fri, 21 May 2021 01:39:07 -0000
Date: Thu, 20 May 2021 20:39:07 -0500
From: Rob Herring <robh@kernel.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Icenowy Zheng <icenowy@aosc.io>, Samuel Holland <samuel@sholland.org>, Ondrej Jirman <megous@megous.com>, linux-arm-kernel@lists.infradead.org, linux-sunxi@googlegroups.com, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v6 01/17] dt-bindings: mfd: axp20x: Add AXP305 compatible
 (plus optional IRQ)
Message-ID: <20210521013907.GA2456181@robh.at.kernel.org>
References: <20210519104152.21119-1-andre.przywara@arm.com>
 <20210519104152.21119-2-andre.przywara@arm.com>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210519104152.21119-2-andre.przywara@arm.com>

On Wed, May 19, 2021 at 11:41:36AM +0100, Andre Przywara wrote:
> The AXP305 PMIC used in AXP805 seems to be fully compatible to the
> AXP805 PMIC, so add the proper chain of compatible strings.
> 
> Also at least on one board (Orangepi Zero2) there is no interrupt line
> connected to the CPU, so make the "interrupts" property optional.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  Documentation/devicetree/bindings/mfd/axp20x.txt | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Don't you want to convert this to schema? It's one of the last warnings 
for sunxi IIRC.

Acked-by: Rob Herring <robh@kernel.org>

> 
> diff --git a/Documentation/devicetree/bindings/mfd/axp20x.txt b/Documentation/devicetree/bindings/mfd/axp20x.txt
> index 4991a6415796..4fd748101e3c 100644
> --- a/Documentation/devicetree/bindings/mfd/axp20x.txt
> +++ b/Documentation/devicetree/bindings/mfd/axp20x.txt
> @@ -26,10 +26,10 @@ Required properties:
>      * "x-powers,axp803"
>      * "x-powers,axp806"
>      * "x-powers,axp805", "x-powers,axp806"
> +    * "x-powers,axp803", "x-powers,axp805", "x-powers,axp806"
>      * "x-powers,axp809"
>      * "x-powers,axp813"
>  - reg: The I2C slave address or RSB hardware address for the AXP chip
> -- interrupts: SoC NMI / GPIO interrupt connected to the PMIC's IRQ pin
>  - interrupt-controller: The PMIC has its own internal IRQs
>  - #interrupt-cells: Should be set to 1
>  
> @@ -43,6 +43,7 @@ more information:
>  			AXP20x/LDO3: software-based implementation
>  
>  Optional properties:
> +- interrupts: SoC NMI / GPIO interrupt connected to the PMIC's IRQ pin
>  - x-powers,dcdc-freq: defines the work frequency of DC-DC in KHz
>  		      AXP152/20X: range:  750-1875, Default: 1.5 MHz
>  		      AXP22X/8XX: range: 1800-4050, Default: 3   MHz
> -- 
> 2.17.5
> 
