Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D1492917
	for <linux-sunxi@lists.linux.dev>; Tue,  5 Jul 2022 20:29:44 +0000 (UTC)
Received: by mail-io1-f54.google.com with SMTP id y2so12209793ior.12
        for <linux-sunxi@lists.linux.dev>; Tue, 05 Jul 2022 13:29:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+OUbKOKgcRiIQoZ8IC81Q0FUvPkjDzo8f60mYmsPN80=;
        b=bJ/juBHUTD/z9ZCBoSJFj3TPk5EJl+mQQ+u9wJeUZ86Fl+FD/ZmTLF65oGGfBXXWDB
         2r0cOESgf+p63qkNNOOmvq3DcFYp5o4ZCWfC0PovZSHH+YMxTWLYLabxzstBZ4uVB7so
         wZdhAR6dObFbLKeQhiQImXbYALL3I32YpAor/UkqMrkucpR7BvyeSA45D5Nl1swDzga0
         HPS5PD/zKxb3eTsOV5hP4IYKWSC/j5DEXScnOt52JABt5AeM1NgJx0izLBrnoShJL/n6
         NcMSWcXSsLcpAn83fG2wB7V6XKql7+XsRGlRcxjmAcOAoUPdUxPgi4kIG6iZ1rLZUYaq
         0+2g==
X-Gm-Message-State: AJIora95OoyIylmoPBU2jGav89oj6vrVzGEvVqUvAMgHiqIgxcJytf9l
	05KOYHUGGjMw7AD8aTNy0A==
X-Google-Smtp-Source: AGRyM1u9597zu/p+HiUCckJAq7fdPv0+gO/EYPUZM8rYPEGth3tu2MAgLvBw06NsgKzFmdKA4urzTw==
X-Received: by 2002:a05:6638:16cb:b0:33e:9db7:9359 with SMTP id g11-20020a05663816cb00b0033e9db79359mr15399804jat.112.1657052983590;
        Tue, 05 Jul 2022 13:29:43 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id w21-20020a029695000000b00339c4e447e2sm14886585jai.151.2022.07.05.13.29.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 13:29:43 -0700 (PDT)
Received: (nullmailer pid 2571463 invoked by uid 1000);
	Tue, 05 Jul 2022 20:29:41 -0000
Date: Tue, 5 Jul 2022 14:29:41 -0600
From: Rob Herring <robh@kernel.org>
To: Samuel Holland <samuel@sholland.org>
Cc: Rob Herring <robh+dt@kernel.org>, Maxime Ripard <maxime@cerno.tech>, Chanwoo Choi <cw00.choi@samsung.com>, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: arm: sunxi: Default to the full MBUS
 binding
Message-ID: <20220705202941.GA2571429-robh@kernel.org>
References: <20220702042447.26734-1-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220702042447.26734-1-samuel@sholland.org>

On Fri, 01 Jul 2022 23:24:46 -0500, Samuel Holland wrote:
> Some older SoCs use a deprecated MBUS binding with some clocks missing.
> Currently, new SoCs must opt in to the complete binding. This should be
> the default, so new SoCs do not accidentally use the deprecated version.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
> 
>  .../arm/sunxi/allwinner,sun4i-a10-mbus.yaml        | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
