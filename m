Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAFF070
	for <linux-sunxi@lists.linux.dev>; Sat, 27 Mar 2021 16:46:27 +0000 (UTC)
Received: by mail-ot1-f44.google.com with SMTP id w21-20020a9d63950000b02901ce7b8c45b4so8213868otk.5
        for <linux-sunxi@lists.linux.dev>; Sat, 27 Mar 2021 09:46:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=y/BVIqm9Jq7ZW/Oco7OKjjg+344uTpacMlZauU6/8hk=;
        b=tLUIR1syH2Uh71SVoKgsQm4gv3p9ynfJtV32Lo403SAHoaUrEjdcIsrpFb6dYWRd/x
         LTEXOHgwznvOBBchpjEe0fWp02tkObqeUvTX73RqOiTX4wtSgBQ0fjO2ugTpkUcDMhsm
         pbwTMwkndfi3+g+Di8VxbP9CtfZiiES4K1PFi8q4yADnJExb/GbT5j2/liydOuUrabxD
         XcLhkmmY19fbEDnWbCAFVangKTbPAOPOnyRoJoQdEK6dasV0WLZLeA40pJQV/zAWHG9M
         g3yTpQo6uhjHZsi0tcPoTHjmrGJiit+1WY+Y6fni12fpEZwsuKrmnn53jVwfj7Nqg1YW
         adQg==
X-Gm-Message-State: AOAM5334PShBkWh/PWLT4Izp+eamHzLLPnSNIjODy1nH4OyYLoNZau9V
	7hp0jaPjqolxVyJ9lkrAcw==
X-Google-Smtp-Source: ABdhPJyiLlMULt5oNPhCIY5FnTQM5utBQb7deddBIqLmXy1AE+0nSH5lAm87+7eTA9wy1ATfu+orfw==
X-Received: by 2002:a9d:d89:: with SMTP id 9mr16655449ots.23.1616863586920;
        Sat, 27 Mar 2021 09:46:26 -0700 (PDT)
Received: from robh.at.kernel.org ([172.58.99.140])
        by smtp.gmail.com with ESMTPSA id u2sm2467871oic.28.2021.03.27.09.46.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Mar 2021 09:46:26 -0700 (PDT)
Received: (nullmailer pid 225171 invoked by uid 1000);
	Sat, 27 Mar 2021 16:46:22 -0000
Date: Sat, 27 Mar 2021 10:46:22 -0600
From: Rob Herring <robh@kernel.org>
To: Samuel Holland <samuel@sholland.org>
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Daniel Lezcano <daniel.lezcano@linaro.org>, devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev, Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Maxime Ripard <maxime@cerno.tech>, Maxime Ripard <mripard@kernel.org>, Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/5] dt-bindings: timer: Add compatibles for sun50i
 timers
Message-ID: <20210327164622.GA225116@robh.at.kernel.org>
References: <20210322044707.19479-1-samuel@sholland.org>
 <20210322044707.19479-3-samuel@sholland.org>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210322044707.19479-3-samuel@sholland.org>

On Sun, 21 Mar 2021 23:47:04 -0500, Samuel Holland wrote:
> The sun50i SoCs contain timer blocks which are useful as broadcast
> clockevent sources. They each have 2 interrupts, matching the A23
> variant, so add the new compatible strings with the A23 compatible
> as a fallback.
> 
> Acked-by: Maxime Ripard <maxime@cerno.tech>
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
>  .../timer/allwinner,sun4i-a10-timer.yaml        | 17 ++++++++++++-----
>  1 file changed, 12 insertions(+), 5 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
