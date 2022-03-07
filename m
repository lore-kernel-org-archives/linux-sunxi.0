Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 627AB7482
	for <linux-sunxi@lists.linux.dev>; Mon,  7 Mar 2022 23:21:58 +0000 (UTC)
Received: by mail-oi1-f172.google.com with SMTP id k2so17023291oia.2
        for <linux-sunxi@lists.linux.dev>; Mon, 07 Mar 2022 15:21:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=7qb95iWDy4CrMuix2n1CWTaNA8dbLvS/zT6J6EUQCm8=;
        b=Z4CSBSx0/kMPnUqptECQ8rmmf3WI59Q9sXsoY54d0DuDtFJsmlHV/MQkFH2iP/kn8B
         PX0/TVGXiNDlodrrFgzDWR13oGXajP8TRW2zwzbTvmLD/HR7/81V/fPLFNa0caRbKpxw
         2nxuybLFb48gCqMzFVZSclR8XUcJSGgD7K9eQhXs0Uw9MO+VlpnT8TlqOztwelxU/qHp
         y+qE7ZjMGtKQZJjnASbX84HMp19yojq0O1U1Atpbzrsu3LDY9jbaL6L9z1Dnn0y2+U8F
         sVxelrg2NDK5gRYHp28zxKJBnNcfqbk8Hp0aVQK1f0FKbGHEIGg962P8z8KbLeowQvsw
         Tnmg==
X-Gm-Message-State: AOAM530liRQ/nYhp7FYPBEQWjhQpZZFtJx/ezv9l6ZHLf5+lhDuh4iVv
	wWSJVrA5nqE6OPgMdA3DLA==
X-Google-Smtp-Source: ABdhPJxGLJw+PA8u5LjczII+zDnGfV83d44pnqceSKY4k47PR7tDdc9dcTlVcPdn5qROrtXm2/yckg==
X-Received: by 2002:a05:6808:2c4:b0:2d7:968c:dd37 with SMTP id a4-20020a05680802c400b002d7968cdd37mr939881oid.146.1646695317419;
        Mon, 07 Mar 2022 15:21:57 -0800 (PST)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id p67-20020acabf46000000b002d97bda3868sm7117107oif.45.2022.03.07.15.21.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Mar 2022 15:21:56 -0800 (PST)
Received: (nullmailer pid 3453919 invoked by uid 1000);
	Mon, 07 Mar 2022 23:21:55 -0000
Date: Mon, 7 Mar 2022 17:21:55 -0600
From: Rob Herring <robh@kernel.org>
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc: Samuel Holland <samuel@sholland.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Michael Turquette <mturquette@baylibre.com>, linux-sunxi@lists.linux.dev, Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-kernel@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH v3 2/8] dt-bindings: interconnect: sunxi: Add V3s mbus
 compatible
Message-ID: <YiaTk5h1n0ifNAj6@robh.at.kernel.org>
References: <20220302211100.65264-1-paul.kocialkowski@bootlin.com>
 <20220302211100.65264-3-paul.kocialkowski@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220302211100.65264-3-paul.kocialkowski@bootlin.com>

On Wed, 02 Mar 2022 22:10:54 +0100, Paul Kocialkowski wrote:
> Since the V3s uses the internal mbus for DMA with multimedia devices,
> document its compatible in accordance with the extended mbus binding.
> 
> This will enable adding support for the V3s in the full-fledged
> devfreq driver eventually.
> 
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> ---
>  .../devicetree/bindings/arm/sunxi/allwinner,sun4i-a10-mbus.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
