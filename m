Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1512A7E
	for <linux-sunxi@lists.linux.dev>; Mon, 25 Jul 2022 23:29:08 +0000 (UTC)
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-10d845dcf92so16677062fac.12
        for <linux-sunxi@lists.linux.dev>; Mon, 25 Jul 2022 16:29:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=pDBC+SN3XUz1fTYobGbOcnhMg9/j1jmuI+TaTt4V2s4=;
        b=OzEEGJjBcvs5/XgeHfSpAYjdBNyzSJX273FuHUEfcUNMi3yH7Jz+NooRK1jOsMzyaE
         ltPVbfm3n89W795zeqV/1N6zNfsPpuMBRF8qUfpYnPD9aRcDT+7PfTOcEBQjSmZRcoM5
         5ed2dvX4XTcQgIhWtkImTqhtTR3VCn2C8ryNtGyujvRrbobieO/3afQUzfSPWPz1O4T3
         bP88qROSMosShCTW+guDf1VYAG0ZNTk4z1CV0XfjyM87pCDASJNESVl1M0BfHycrQj/y
         KtKTKdj3GkJmo7qVTHbjSGVHi6ZJVVCzDJH1sSiOyt03URE//CryeUgFD6tk0iHshvnw
         TnDQ==
X-Gm-Message-State: AJIora+svU6On5+9VWl3o9DZu2zNCxXHDZPKfzPJzJaHERp/EbmkbyA4
	29HDzpztUPU/3wJk5bWeCA==
X-Google-Smtp-Source: AGRyM1vhB7LzTu9o9WY8Ius1OoEy/Rlrf2xb4cPbrShtSbpFTMzuhLhU5dx5+8rVg+znEScMELoZkw==
X-Received: by 2002:a05:6871:b22:b0:10d:c30a:c096 with SMTP id fq34-20020a0568710b2200b0010dc30ac096mr8436424oab.75.1658791748050;
        Mon, 25 Jul 2022 16:29:08 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id i22-20020a056870221600b000f325409614sm6724959oaf.13.2022.07.25.16.29.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jul 2022 16:29:07 -0700 (PDT)
Received: (nullmailer pid 2957827 invoked by uid 1000);
	Mon, 25 Jul 2022 23:29:05 -0000
Date: Mon, 25 Jul 2022 17:29:05 -0600
From: Rob Herring <robh@kernel.org>
To: Samuel Holland <samuel@sholland.org>
Cc: linux-arm-kernel@lists.infradead.org, Daniel Lezcano <daniel.lezcano@linaro.org>, Maxime Ripard <mripard@kernel.org>, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Rob Herring <robh+dt@kernel.org>, linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH] dt-bindings: timer: allwinner,sun4i-a10-timer: Add D1
 compatible
Message-ID: <20220725232905.GA2957766-robh@kernel.org>
References: <20220725051715.56427-1-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220725051715.56427-1-samuel@sholland.org>

On Mon, 25 Jul 2022 00:17:14 -0500, Samuel Holland wrote:
> Allwinner D1 contains the usual sun4i MMIO timer device. It contains two
> timers like other recent SoCs, so it is compatible with the A23 variant.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
> 
>  .../devicetree/bindings/timer/allwinner,sun4i-a10-timer.yaml     | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
