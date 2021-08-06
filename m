Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 728C172
	for <linux-sunxi@lists.linux.dev>; Fri,  6 Aug 2021 21:41:06 +0000 (UTC)
Received: by mail-io1-f46.google.com with SMTP id x10so3341257iop.13
        for <linux-sunxi@lists.linux.dev>; Fri, 06 Aug 2021 14:41:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=uhznWD02bvTnRNXTmc/rxQJVDeSbb/fFCBHNI2+YSq4=;
        b=V+NaNVv4dR0C20VnORJq9ih2R4jYu1aVBt1ICNSiN6JJZOwQqBsTV1gi+Q0fWk30Jc
         Eg1dFA5rxA3O/gOgnHWKi0xk0JubolOPu8hXgqDlqbVlKnucyEFYHZN1tUgqQBtKCsaq
         Z+D8cjgmZOwdPWEbWGxtLd3MZJUmYE21nRoxYb4wAEKTCuGv+Ia1WvnFIvVTiz2HRTk0
         Pb2u98RMg2/hyEPHjhnzSCMvwtjjv9GBpVXl8vIGQlxZnKXyJ2I3s0Z1f2LHObsUZOtE
         TuL+yOXZRJMGRggwZWz0DQMoHB6nIwEtmLMduelTcrqLNmwIfp2Uw2ehudfpzr8ER4w7
         tVew==
X-Gm-Message-State: AOAM5330AZGiYy5w84lMY7AbiXTmrMXqcSIGr5onWNhQDH2Q0uwJ5P0u
	H6QXuSXBZjP3wNvRt2uaYw==
X-Google-Smtp-Source: ABdhPJwEiRaN+S9+/SO3kTm/jShjgi5oxBuwfPl8aKdDK8CxuHvByUbUauU7TQ835dkJ2AeTehqXMw==
X-Received: by 2002:a05:6638:1b9:: with SMTP id b25mr7966322jaq.23.1628286065659;
        Fri, 06 Aug 2021 14:41:05 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id t16sm5129090ilg.56.2021.08.06.14.41.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Aug 2021 14:41:05 -0700 (PDT)
Received: (nullmailer pid 1851760 invoked by uid 1000);
	Fri, 06 Aug 2021 21:41:03 -0000
Date: Fri, 6 Aug 2021 15:41:03 -0600
From: Rob Herring <robh@kernel.org>
To: Icenowy Zheng <icenowy@sipeed.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Andre Przywara <andre.przywara@arm.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Samuel Holland <samuel@sholland.org>, linux-arm-kernel@lists.infradead.org, Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 09/17] dt-bindings: clock: sunxi-ng: add compatibles for
 R329 CCUs
Message-ID: <YQ2sbzC7ZzxUsktv@robh.at.kernel.org>
References: <20210802062212.73220-1-icenowy@sipeed.com>
 <20210802062212.73220-10-icenowy@sipeed.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210802062212.73220-10-icenowy@sipeed.com>

On Mon, 02 Aug 2021 14:22:04 +0800, Icenowy Zheng wrote:
> R329 has a CPUX CCU and a R-CCU.
> 
> Add compatible strings for them.
> 
> Signed-off-by: Icenowy Zheng <icenowy@sipeed.com>
> ---
>  .../devicetree/bindings/clock/allwinner,sun4i-a10-ccu.yaml    | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
