Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B1C06010
	for <linux-sunxi@lists.linux.dev>; Tue,  5 Jul 2022 20:30:37 +0000 (UTC)
Received: by mail-io1-f49.google.com with SMTP id k15so12253898iok.5
        for <linux-sunxi@lists.linux.dev>; Tue, 05 Jul 2022 13:30:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=CxSIBZ2jt/pLFazAIwW59noEAO34Ns2wBgEVpI7Mfqw=;
        b=oNOxZs1uoZe6wLzoPzOAVetjxMHmpxeNOnSbXME3HmuR6OgZZpOHW/wDjokfU8plr/
         uKA5nLmqMxJDGieaWk/PZkL/8lFPu0kw0fA4a9IL+zlcaEBF7HGnTmp6RbZzNTHO36b4
         e7Fx+Dvv/4d1N1CyiDmAe0i6cia/DTvhXsYzsk8oKdryeKl+gwu/vc1i3FBj3VGeWiQm
         tSE8VO44vjirsepDowIb8tAlsyhTNTm2MCIJz+xlzk77EVeuHimFx1QNSmc+gXTAtk0H
         NTsultfDED7+KL+N0ZULeipOcmbdjZZ8BKM0SANpVPE3DA8Q3SwG+TH4swOKLc7CILAj
         VvvA==
X-Gm-Message-State: AJIora9B4eHM4yMEFqgYIeC2cgyazkyqhDgpZuCfhUGk0jbCxISVIWxS
	7uWZWdYPZiyFMW+T6QVjJA==
X-Google-Smtp-Source: AGRyM1sE+zZ5ACiYVTRNPKT1VCnFOrF8wpzg7YmCt1PaLASTZMzUxCyInyFvTe6hDgajT/k+H4YxSg==
X-Received: by 2002:a05:6638:22d3:b0:33c:a25e:e3ca with SMTP id j19-20020a05663822d300b0033ca25ee3camr22616206jat.191.1657053037104;
        Tue, 05 Jul 2022 13:30:37 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id m7-20020a0566022e8700b0067885c5fd94sm3051749iow.29.2022.07.05.13.30.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 13:30:36 -0700 (PDT)
Received: (nullmailer pid 2573162 invoked by uid 1000);
	Tue, 05 Jul 2022 20:30:34 -0000
Date: Tue, 5 Jul 2022 14:30:34 -0600
From: Rob Herring <robh@kernel.org>
To: Samuel Holland <samuel@sholland.org>
Cc: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-sunxi@lists.linux.dev, Jernej Skrabec <jernej.skrabec@gmail.com>, devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 3/3] dt-bindings: usb: generic-ohci: Add Allwinner D1
 compatible
Message-ID: <20220705203034.GA2573110-robh@kernel.org>
References: <20220702195249.54160-1-samuel@sholland.org>
 <20220702195249.54160-4-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220702195249.54160-4-samuel@sholland.org>

On Sat, 02 Jul 2022 14:52:49 -0500, Samuel Holland wrote:
> The Allwinner D1 contains USB controllers which claim to be compatible
> with the OHCI specification version 1.0a.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
> 
>  Documentation/devicetree/bindings/usb/generic-ohci.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
