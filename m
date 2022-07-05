Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B62B12917
	for <linux-sunxi@lists.linux.dev>; Tue,  5 Jul 2022 20:29:58 +0000 (UTC)
Received: by mail-il1-f169.google.com with SMTP id k1so3444374ilu.1
        for <linux-sunxi@lists.linux.dev>; Tue, 05 Jul 2022 13:29:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=T0CjWyM1rwM+A1b/hf5ouFhLLL14ENQv5I7/Spj1vZo=;
        b=NuzabujeK6ih485QdK1DbIjYkqwneWKcWAm/X/N0JZWJ7Bas83V3kMW/HHkz4eO/bx
         2GfgNu/D/VCTKuZCNBZn2qo55iJmjHr/OS1T2ner/D+ys+fKORBvZxGc+iDSDo6cyW5O
         +tsy8g+nV6b591b5YPR2n7JubCBwCQy5CixqbBjjvIQ/n6YLwl+76zK0Gp0I9HFfH5jA
         lZA3ORSqbjEAxjQOj6WwYj3NmQxzzkJ/UddLO8gU6RKnZfki2ssk+5lmwKBehIu//Owb
         rPLOlpyEMhMw7SiiFTU84XMMu2uu5VXitdnn8kLMH7KbMi2GwdgnUAa9iyq33UCBO6to
         vl2Q==
X-Gm-Message-State: AJIora/CoZB1xRFP67+U/4aRQ7p16XCtw6GsQCEDDeL41QKqG2juG5Rk
	He7uY+xhqB62R9Bjb4QetA==
X-Google-Smtp-Source: AGRyM1scvMuoRpJG5Vf/QbT1i/AYhYbpwtlI5JbNfHPQsUutvxfRh5yH4tWJyGUWnAqq4OFmKMlf7g==
X-Received: by 2002:a05:6e02:16ce:b0:2da:da70:98c9 with SMTP id 14-20020a056e0216ce00b002dada7098c9mr17780774ilx.119.1657052997831;
        Tue, 05 Jul 2022 13:29:57 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id i16-20020a02cc50000000b0033d76a6196asm7350058jaq.171.2022.07.05.13.29.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 13:29:57 -0700 (PDT)
Received: (nullmailer pid 2571881 invoked by uid 1000);
	Tue, 05 Jul 2022 20:29:55 -0000
Date: Tue, 5 Jul 2022 14:29:55 -0600
From: Rob Herring <robh@kernel.org>
To: Samuel Holland <samuel@sholland.org>
Cc: linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, Maxime Ripard <maxime@cerno.tech>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: Re: [PATCH 2/2] dt-bindings: arm: sunxi: Add several MBUS compatibles
Message-ID: <20220705202955.GA2571829-robh@kernel.org>
References: <20220702042447.26734-1-samuel@sholland.org>
 <20220702042447.26734-2-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220702042447.26734-2-samuel@sholland.org>

On Fri, 01 Jul 2022 23:24:47 -0500, Samuel Holland wrote:
> All of the sunxi SoCs since at least the A33 have a similar structure
> for the MBUS and DRAM controller, but they all have minor differences in
> MBUS port assignments and DRAM controller behavior. Give each SoC its
> own compatible.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
> 
>  .../bindings/arm/sunxi/allwinner,sun4i-a10-mbus.yaml   | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
