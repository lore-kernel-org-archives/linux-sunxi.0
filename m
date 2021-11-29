Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F23F929CA
	for <linux-sunxi@lists.linux.dev>; Mon, 29 Nov 2021 23:13:07 +0000 (UTC)
Received: by mail-oo1-f41.google.com with SMTP id p2-20020a4adfc2000000b002c2676904fdso6136583ood.13
        for <linux-sunxi@lists.linux.dev>; Mon, 29 Nov 2021 15:13:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=1TBDeg2T2HpF/0tP7YSfqKZCkBkx3aRwdW2nUjrKDvg=;
        b=4Go991vt6ADXZSTITlTSTgXCusWndYHU21V6LDzrXj/GJTpT6uZ2t9EEqdJ3LzAeQ1
         FEGOJG76vhvzB4ldPOnE31Oxy7awWcycm6szLjpPlAQHReJRLgOoEgohfXGLo2AOrcuC
         CFuLYEdjU78ss9wdtrNzq8H2PkoktHD854EM1DBT6F8R2xaam3o2OQbsbk9nzs4P6SaO
         ZKyMN6buxavhollLwPBzAgNkwKxCYPbK3tyIr2X1etK7OV+D4jDCDPUhi6/ZDMIcp5FI
         TJk1eDrYW6S+vwGVRcBCkOxR1eKEbUECG70YFmeyUaoqSckVawLeXyaaMoTVTMMKfOdt
         xNCA==
X-Gm-Message-State: AOAM531XL9t1+WNYHjJ3q1d5L3dC4B+G1mgRq8WF+Bwav4T+++g1ePND
	nh1l2BODYOvM7pm8/9aQAw==
X-Google-Smtp-Source: ABdhPJwyRuiVmmJZmpoOnClCvsvidYVMOdIq281b10vxbTOqfPqs0KeSY+luLvimvVIvdrBtL7D5ag==
X-Received: by 2002:a4a:6852:: with SMTP id a18mr33373429oof.92.1638227587108;
        Mon, 29 Nov 2021 15:13:07 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id j10sm2467950ooq.5.2021.11.29.15.13.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Nov 2021 15:13:06 -0800 (PST)
Received: (nullmailer pid 788867 invoked by uid 1000);
	Mon, 29 Nov 2021 23:13:05 -0000
Date: Mon, 29 Nov 2021 17:13:05 -0600
From: Rob Herring <robh@kernel.org>
To: Samuel Holland <samuel@sholland.org>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>, Herbert Xu <herbert@gondor.apana.org.au>, linux-crypto@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>, Corentin Labbe <clabbe.montjoie@gmail.com>, linux-sunxi@lists.linux.dev, Chen-Yu Tsai <wens@csie.org>, "David S . Miller" <davem@davemloft.net>, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: crypto: sun8i-ce: Add compatible for D1
Message-ID: <YaVegSGB+7W7Ulsc@robh.at.kernel.org>
References: <20211119051026.13049-1-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211119051026.13049-1-samuel@sholland.org>

On Thu, 18 Nov 2021 23:10:24 -0600, Samuel Holland wrote:
> D1 has a crypto engine similar to the one in other Allwinner SoCs.
> Like H6, it has a separate MBUS clock gate.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
> 
>  .../devicetree/bindings/crypto/allwinner,sun8i-ce.yaml      | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
