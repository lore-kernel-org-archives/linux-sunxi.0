Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40FF06010
	for <linux-sunxi@lists.linux.dev>; Tue,  5 Jul 2022 20:30:28 +0000 (UTC)
Received: by mail-io1-f48.google.com with SMTP id h85so12259143iof.4
        for <linux-sunxi@lists.linux.dev>; Tue, 05 Jul 2022 13:30:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=zWSAd7tRcv1q855NvXcXI64psDNg7skOpykCH1OmutE=;
        b=IehGY18kTOlV+kwD6YRcJ/eu3unvKGA0i9Cail6hQFBA1MCqX8kPIAXdNokuD4Fjyu
         71xcWmTR4UYb1OwVnKV6m2GjnXff/k3QgxBOixjF0byH32qYkYWMFIkq+8c+LsVXiobN
         d+bPC526Cups/sQcyYZIHMILxwpoYpZ/QTmtJ1XMPqnhkm6MgC8HB65x7v1gvAmjA1Rk
         r6qk1FH4R2HIgivPhtWbVnXJLowNuPr3k6Cw75g1sgrAitPuE6gh6i0vfwWAofu83Hkv
         1EssoJzZ04de2SgJWWLpIyX5h9IrqfGJSGz1vI3IoAINaWdzyLZSXxv/5p6Fv54EjkQ8
         mD7w==
X-Gm-Message-State: AJIora9g2glDmG5ZexHV1anppPJ83b8tEGd9rKLg6+y304nBV/k+GeMa
	8N9wo7KgEUDGwkDawW/1hw==
X-Google-Smtp-Source: AGRyM1svAuFAs6kMqiFi4DVAQ7UeGo4jlZ7/zUYgepb7MgPG+1/C+U9DNErJhhImMe3FgpJV+Rs2CA==
X-Received: by 2002:a05:6602:27c6:b0:657:7e7a:11f3 with SMTP id l6-20020a05660227c600b006577e7a11f3mr19807333ios.40.1657053027141;
        Tue, 05 Jul 2022 13:30:27 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id c14-20020a056e020cce00b002dc2b20e9cfsm621858ilj.1.2022.07.05.13.30.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 13:30:26 -0700 (PDT)
Received: (nullmailer pid 2572821 invoked by uid 1000);
	Tue, 05 Jul 2022 20:30:25 -0000
Date: Tue, 5 Jul 2022 14:30:25 -0600
From: Rob Herring <robh@kernel.org>
To: Samuel Holland <samuel@sholland.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-usb@vger.kernel.org, linux-sunxi@lists.linux.dev, Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel@lists.infradead.org, Maxime Ripard <mripard@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: usb: generic-ehci: Add Allwinner D1
 compatible
Message-ID: <20220705203025.GA2572770-robh@kernel.org>
References: <20220702195249.54160-1-samuel@sholland.org>
 <20220702195249.54160-3-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220702195249.54160-3-samuel@sholland.org>

On Sat, 02 Jul 2022 14:52:48 -0500, Samuel Holland wrote:
> The Allwinner D1 contains USB controllers which claim to be compatible
> with the EHCI specification version 1.0.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
> 
>  Documentation/devicetree/bindings/usb/generic-ehci.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
