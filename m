Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D95962CA0
	for <linux-sunxi@lists.linux.dev>; Mon, 29 Nov 2021 23:12:35 +0000 (UTC)
Received: by mail-ot1-f51.google.com with SMTP id n17-20020a9d64d1000000b00579cf677301so27685017otl.8
        for <linux-sunxi@lists.linux.dev>; Mon, 29 Nov 2021 15:12:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=xvaWNOHxIX5RQDegrPAkNqp+TbGhYaJoM7ojwcLXG0k=;
        b=7iKVIyKKjTQU/jnXfz3/0Xoit4ejOOAKyUKzlZ4oQdnC9QXTDzqkYleNWC1Wrp7200
         StrUkbqaiMtPRhjSzUv+pP9Cor+HRAz8ui9HuMMj25+HHzi2S/BDX0WltqujIzFZr+Qf
         zwarYd2oxeP8ioCehEiZf21NcK8heX0oBUgwrTGtk5iW8/5MdbOJBTt0e6e5Xf70HGkA
         ikMeeOQ0oNXByoX2THSy9PX0MiiwGSd161i3PJaQ7shTqNsF1fY5P011N8L6mTVVxlY1
         fYWq5fDH3Etf/g0ay/Fpx+X8rJxNuervCNMV24MwtjNYbRMJvNCoYavwZvNvkOrY/iy4
         wQLA==
X-Gm-Message-State: AOAM533bevSRyitOMzGvxEN4muOWMaCZCyZFKWvKkv8W8L0rvC9zi4VP
	6Wy0Sqgl+nRHtzb6/ICUlg==
X-Google-Smtp-Source: ABdhPJzrih+obICiu/TVSMEEZYpJytpel1DHE1SZn5KyWgNg2OIz1uW2EsNEa2nmDMz91dgwpPY1WA==
X-Received: by 2002:a05:6830:199:: with SMTP id q25mr47326858ota.150.1638227555071;
        Mon, 29 Nov 2021 15:12:35 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id e16sm2443380ook.38.2021.11.29.15.12.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Nov 2021 15:12:34 -0800 (PST)
Received: (nullmailer pid 788051 invoked by uid 1000);
	Mon, 29 Nov 2021 23:12:33 -0000
Date: Mon, 29 Nov 2021 17:12:33 -0600
From: Rob Herring <robh@kernel.org>
To: Samuel Holland <samuel@sholland.org>
Cc: Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Maxime Ripard <mripard@kernel.org>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>, linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] dt-bindings: media: Add compatible for D1
Message-ID: <YaVeYd939OMtSJTI@robh.at.kernel.org>
References: <20211119031519.23430-1-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211119031519.23430-1-samuel@sholland.org>

On Thu, 18 Nov 2021 21:15:17 -0600, Samuel Holland wrote:
> D1 contains a video engine similar to the one in other sunxi SoCs.
> Add a compatible for it.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
> 
>  .../bindings/media/allwinner,sun4i-a10-video-engine.yaml         | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
