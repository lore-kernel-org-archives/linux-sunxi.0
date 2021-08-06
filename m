Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33F8972
	for <linux-sunxi@lists.linux.dev>; Fri,  6 Aug 2021 21:43:15 +0000 (UTC)
Received: by mail-io1-f47.google.com with SMTP id l20so12016917iom.4
        for <linux-sunxi@lists.linux.dev>; Fri, 06 Aug 2021 14:43:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/zWfW8RsAFbtp93s/xAdzSAqFLqIYUcrzczKfwh3Lh0=;
        b=bGHoCOxrW8w6s7tt3CIOAFZsQUNsDRVIQP41m4I5HMHlLe2LsHF4PupWE//AEkvifY
         m84Rq2XWjDl/9QppIQ10/vRdo4DItlgHMulY90dcEYnVBn2deUJYOw0agtKpA6txb3uF
         66lySXdsRadS7H5VUjb5pwIaCfhcdcw+4sNrMAxPH1YA82A3DVsa3p7msXWXZVMWFSHu
         3qHx7lV6vrF+mJ/vpl4iIb0WhmWeyYGYN4JAICXasrHAmx2YT+Qofecgkqa1Wi9ADF73
         YbkXsjveQuS8L+ziZIOhM9AICJs0oez6XnFOMFRBhvmTzOlLFscu8+aDmgDxe4TlXXWn
         hszw==
X-Gm-Message-State: AOAM533H7J0nN1AHoxivFDUfqamadH6c91PNT78Bywva/7F61qHs8ojH
	5kxbw5hwC+tzdn04UbaZpw==
X-Google-Smtp-Source: ABdhPJxdjcRaDyo4+/BjQuPLS4tWO4TCwPJiNts1M12fu5TnSKD3P19/6gfPvDWqOM/NZc6Xjt9+pA==
X-Received: by 2002:a6b:6b08:: with SMTP id g8mr2374131ioc.141.1628286194460;
        Fri, 06 Aug 2021 14:43:14 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id 12sm3514613ily.7.2021.08.06.14.43.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Aug 2021 14:43:13 -0700 (PDT)
Received: (nullmailer pid 1855489 invoked by uid 1000);
	Fri, 06 Aug 2021 21:43:11 -0000
Date: Fri, 6 Aug 2021 15:43:11 -0600
From: Rob Herring <robh@kernel.org>
To: Icenowy Zheng <icenowy@sipeed.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>, Linus Walleij <linus.walleij@linaro.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Ulf Hansson <ulf.hansson@linaro.org>, Maxime Ripard <mripard@kernel.org>, Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH 14/17] dt-bindings: arm: sunxi: add compatible strings
 for Sipeed MaixSense
Message-ID: <YQ2s762cl83X7go1@robh.at.kernel.org>
References: <20210802062212.73220-1-icenowy@sipeed.com>
 <20210802062212.73220-15-icenowy@sipeed.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210802062212.73220-15-icenowy@sipeed.com>

On Mon, 02 Aug 2021 14:22:09 +0800, Icenowy Zheng wrote:
> Sipeed MaixSense is an Allwinner R329 development kit based on Maix IIA
> SoM.
> 
> Add compatible strings for it.
> 
> Signed-off-by: Icenowy Zheng <icenowy@sipeed.com>
> ---
>  Documentation/devicetree/bindings/arm/sunxi.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
