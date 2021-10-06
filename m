Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F0FA2C83
	for <linux-sunxi@lists.linux.dev>; Wed,  6 Oct 2021 08:15:31 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id r7so6127265wrc.10
        for <linux-sunxi@lists.linux.dev>; Wed, 06 Oct 2021 01:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=jfm9ShDiB9N4r3cuaL8GBzZd3yED8UVYHEEjo4UlHS0=;
        b=G3QMJusuuqaDFK5vNWiA4owhMnSRwlHgEnPDSeAEvoThWGcSPuCQLMTPVTl4y/gdgi
         aNnMJmUS5OTwXM9xwJDrm87IC66sXMTG5P8xjMp5B9bFFDWnGRGV0Y10LlXG/eNZ/GCt
         a89H516gVXpB/Q15lLk0SIdAClOrlG6aFLBD4Lco161YomCIIRMmeTcrCeDCc6w1Ckns
         mEnMFlVazMzsAWqYgcmKmEoDny2uUHLfPl83EV563fWg/lqsGBl02vQimBlLIay15sF2
         pziHjaM8E9X3hrrtnZ0Z0oLnq7+DXsWtj57c00W3O0mtjOTJkfbO/l6exTYeycc/WA3s
         fnJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=jfm9ShDiB9N4r3cuaL8GBzZd3yED8UVYHEEjo4UlHS0=;
        b=uQGTpJ5O1VRHzNni2Ft4yrNH3OIfAhjWlh9pmc6R5x2wt40oBwsvmfBCe7k8zdKCea
         HO9Ab3QpKy7xCxbT9/i48p8X9vF3XtNyigXK4BWAHrfilBiZTjeFbJjGvk/1LQAc51OR
         MTknE6nU3nXmOub7iVG70dMSkmRIwOLfgzQF2bwZQUPnoSMR3NC+1K3EeudIsoD4HDch
         cKuze2JgA3JeLfgpRK0WlPDMooI8cC2d4vvJl6VTTR5/lgW5z51X5OsTkPci8/RK5wTO
         2uscdALmnCRRgW+npl4Pj++EESjSR8QS4u0zv3xpHSVknCSYY1+Rf51EtC7Ak0B/Ncf1
         8WEA==
X-Gm-Message-State: AOAM533v9LeQ60wC22nLy4CEu04iGyhCnCsj1yroZJUAYPqf4C/MoCob
	DrmhbRCEMp+vRlvu3TyXhsGDIQ==
X-Google-Smtp-Source: ABdhPJxRcLmkuVSwL83yuZMqDYSTl84Y1o5zs683tbpKMp4JZnkZ4LBVk0P0K8AD2ir1Ljr24TwLMA==
X-Received: by 2002:adf:a550:: with SMTP id j16mr19630863wrb.384.1633508129701;
        Wed, 06 Oct 2021 01:15:29 -0700 (PDT)
Received: from google.com ([95.148.6.175])
        by smtp.gmail.com with ESMTPSA id q10sm4251973wmq.12.2021.10.06.01.15.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Oct 2021 01:15:29 -0700 (PDT)
Date: Wed, 6 Oct 2021 09:15:27 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Maxime Ripard <maxime@cerno.tech>
Cc: Chen-Yu Tsai <wens@csie.org>,
	Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Frank Rowand <frowand.list@gmail.com>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev, Rob Herring <robh@kernel.org>
Subject: Re: [RESEND v2 3/3] dt-bindings: mfd: Convert X-Powers AC100 binding
 to a schema
Message-ID: <YV1bH7XIRi0Wp+b+@google.com>
References: <20210924071614.868307-1-maxime@cerno.tech>
 <20210924071614.868307-3-maxime@cerno.tech>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210924071614.868307-3-maxime@cerno.tech>

On Fri, 24 Sep 2021, Maxime Ripard wrote:

> The X-Powers AC100 hybrid devices are supported by Linux thanks to its
> device tree binding.
> 
> Now that we have the DT validation in place, let's convert the device
> tree bindings for that driver over to a YAML schema.
> 
> Cc: Lee Jones <lee.jones@linaro.org>
> Acked-by: Chen-Yu Tsai <wens@csie.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> 
> ---
> 
> Changes from v1:
>   - Added maximum number of clocks properties
> ---
>  .../devicetree/bindings/mfd/ac100.txt         |  50 --------
>  .../bindings/mfd/x-powers,ac100.yaml          | 116 ++++++++++++++++++
>  2 files changed, 116 insertions(+), 50 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/mfd/ac100.txt
>  create mode 100644 Documentation/devicetree/bindings/mfd/x-powers,ac100.yaml

Applied, thanks.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
