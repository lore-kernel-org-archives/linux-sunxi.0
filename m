Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BB321FD4
	for <linux-sunxi@lists.linux.dev>; Sun,  5 Jun 2022 21:24:09 +0000 (UTC)
Received: by mail-qk1-f175.google.com with SMTP id x65so9745602qke.2
        for <linux-sunxi@lists.linux.dev>; Sun, 05 Jun 2022 14:24:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Ba3lRMDd+3WFaPX0DEx2In5z5tlRJ5r1CBO5vDDJqPU=;
        b=iGRoN2S9gCmlqv4/bGgPMBt0fkIZukLLgwp/QwnIGUqiJGJ6EL4Hpjn3Ck+5rjLlWd
         XdfCGTreYtaxX9ks14NyUGuAXr9G6lneL4EulO/Q679uPm4xqMWrJNbifnRAZAwa7frQ
         xxK5v5WRrrBnbcGJ4X9H8RoZxlHdwHL3c/6AouldeZd5/+53khfWTF8KIWfjs/YT9RB/
         lLVfacLKhjhdm3bub4XM+f0Ouo5RVb3EU+U4qMqtxVLVvS5BevvoGeLxVZvsFJyBKrq9
         MvwD7Cj4vshBmVU28lPnWhaSKUIas50sLGcbDiP+LRCZnG5bTXPe2EB1dj9ljUjo0jA2
         IufQ==
X-Gm-Message-State: AOAM530Peqhp0QRGWjhBywMIphNSrJs/VK8KIDvDRYeWA+9CEfdIn5A7
	Mjd0bdwQnr8zJkVEtSr54Q==
X-Google-Smtp-Source: ABdhPJwHbigpNJ9BBh5xlV+1WffvJHwsucDLYpw50sQP6yiATxNp3EPoyBlRK/22F5prFaST/c/qmw==
X-Received: by 2002:ae9:e8c4:0:b0:6a6:ab86:47ac with SMTP id a187-20020ae9e8c4000000b006a6ab8647acmr6261971qkg.48.1654464248936;
        Sun, 05 Jun 2022 14:24:08 -0700 (PDT)
Received: from robh.at.kernel.org ([2607:fb90:ac97:ac63:b5fd:aa9:8d74:9989])
        by smtp.gmail.com with ESMTPSA id m16-20020a05620a291000b006a6bb044740sm1381308qkp.66.2022.06.05.14.24.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jun 2022 14:24:08 -0700 (PDT)
Received: (nullmailer pid 3542674 invoked by uid 1000);
	Sun, 05 Jun 2022 21:24:05 -0000
Date: Sun, 5 Jun 2022 16:24:05 -0500
From: Rob Herring <robh@kernel.org>
To: Samuel Holland <samuel@sholland.org>
Cc: Vinod Koul <vkoul@kernel.org>, Bartosz Dudziak <bartosz.dudziak@snejp.pl>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Luca Weiss <luca@z3ntu.xyz>, devicetree@vger.kernel.org, Stephan Gerhold <stephan@gerhold.net>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Russell King <linux@armlinux.org.uk>, Thierry Reding <treding@nvidia.com>, linux-sunxi@lists.linux.dev, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh+dt@kernel.org>, Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH 3/3] dt-bindings: arm: Remove obsolete CPU enable methods
Message-ID: <20220605212405.GA3542627-robh@kernel.org>
References: <20220531045038.42230-1-samuel@sholland.org>
 <20220531045038.42230-4-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220531045038.42230-4-samuel@sholland.org>

On Mon, 30 May 2022 23:50:38 -0500, Samuel Holland wrote:
> U-Boot has provided PSCI on Allwinner A31 and A23/A33 since May 2015,
> commit 014414f53695 ("ARM: sunxi: Enable PSCI for sun8i"). Since we can
> assume PSCI is available on these platforms, they no longer need custom
> CPU enable methods.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
> 
>  Documentation/devicetree/bindings/arm/cpus.yaml | 2 --
>  1 file changed, 2 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
