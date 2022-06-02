Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D72F5814
	for <linux-sunxi@lists.linux.dev>; Thu,  2 Jun 2022 13:50:53 +0000 (UTC)
Received: by mail-oi1-f182.google.com with SMTP id i66so6557532oia.11
        for <linux-sunxi@lists.linux.dev>; Thu, 02 Jun 2022 06:50:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=jdOjrDyA7N80Kr2XJDTR1sTUxUj7yflrK/c+RDOiH7Q=;
        b=rjYUDsBAIsdgtsnPWqJalHRvgBHJ9s8HdeDz4GzeT+cSyNTkCOmWhJ4CHQKjcTfawH
         nKJAz/+l8akpf54FcNFZDgPdbHb/WYrDG/gzzS+ox9l33fv7J5DgO1fYPIHBqLh5f1ow
         +L9SMkmYfT3Loki+pP7Oz0rW3VoV0ZkQ5E29Y57bVN+5TbvCj4/37ZmeQQGKjdOSzUZU
         p814obu/kGEb/T3e3NRlc80hEyJ1frIBC2bv8AJsXhO4s4yaHQWScIbH5jE+oSw/M3kf
         QJE1QRw1WhlnQuIPT0k/SMtKac/0JAipQqTAAUlU2qu+TREfm3YLDyUyNlONBKR7DoMY
         Evpg==
X-Gm-Message-State: AOAM531IE3fPid7XNnQohqyD8whnYJGCOMg4YPPMC/I/v/qcJw7jd286
	6dSvQHO0w25UeAPCvlOIcQ==
X-Google-Smtp-Source: ABdhPJzzid12tQ8/0sk2mtJnB6ChA7jIEzHwVF8O3v1rFbLifzEkZET93h3PoIs/zk6pfvnr4NUigg==
X-Received: by 2002:a05:6808:1828:b0:32a:dc9e:bc62 with SMTP id bh40-20020a056808182800b0032adc9ebc62mr17279222oib.239.1654177852958;
        Thu, 02 Jun 2022 06:50:52 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id mv26-20020a0568706a9a00b000f5701f240csm1920694oab.19.2022.06.02.06.50.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jun 2022 06:50:52 -0700 (PDT)
Received: (nullmailer pid 2187942 invoked by uid 1000);
	Thu, 02 Jun 2022 13:50:51 -0000
Date: Thu, 2 Jun 2022 08:50:51 -0500
From: Rob Herring <robh@kernel.org>
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc: linux-arm-kernel@lists.infradead.org, Samuel Holland <samuel@sholland.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v4 1/7] dt-bindings: interconnect: sunxi: Add V3s mbus
 compatible
Message-ID: <20220602135051.GA2187908-robh@kernel.org>
References: <20220525185853.695931-1-paul.kocialkowski@bootlin.com>
 <20220525185853.695931-2-paul.kocialkowski@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220525185853.695931-2-paul.kocialkowski@bootlin.com>

On Wed, 25 May 2022 20:58:47 +0200, Paul Kocialkowski wrote:
> Since the V3s uses the internal mbus for DMA with multimedia devices,
> document its compatible in accordance with the extended mbus binding.
> 
> This will enable adding support for the V3s in the full-fledged
> devfreq driver eventually.
> 
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> Reviewed-by: Samuel Holland <samuel@sholland.org>
> ---
>  .../devicetree/bindings/arm/sunxi/allwinner,sun4i-a10-mbus.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
