Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E40B10782
	for <linux-sunxi@lists.linux.dev>; Thu,  1 Dec 2022 21:49:29 +0000 (UTC)
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-142306beb9aso3679591fac.11
        for <linux-sunxi@lists.linux.dev>; Thu, 01 Dec 2022 13:49:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=57yzKLWxqL5GldzJ3/QZmz79jz1YFJsrObt0S+latdo=;
        b=d0CWl5PFPkj7RQqG5B1fMCo30qSukIIzue7vCuH8MZzb39r2S9ZeZ1uWmsSQzqzQ6I
         Y9arwsQwbCI/tvCUo64Aq9JBcDCwP4RAL220nQ12lZXbVspc6QXeMZyCbnYHiFz6S8lV
         d2V4zC4r5QQ7MFxxzhSR7a1su6bEIKOoUbXHRQTaOQuVGFMzHflEixzW5jOhwDL3d02I
         mh1377fIVYWUOfaPUWniD//Ic1Cqm4XTepo2fhMiAE2oztiintb59pqfus6w+Frr6+EC
         doPfkReFHXrTnTFw+3hiSwLdHUNWZJfuF+bXIms68txi2pMGH+7v7rmKCp4AQBfuCpP1
         6sgA==
X-Gm-Message-State: ANoB5pmNFbeO3kGMs1kRcT2zpVX1G+vhTHv/yTonuq4GATWmlNrItk4o
	1pMIMoiGbpG1fdEZFhcVlw==
X-Google-Smtp-Source: AA0mqf7kfkqw12wKx8Bg+cNoCItLOK3uTdw4M2dwW24Q+GfB94xcnEKX6GXNa+fAH8H1rAETKDVKtg==
X-Received: by 2002:a05:6870:b19:b0:142:78d9:d216 with SMTP id lh25-20020a0568700b1900b0014278d9d216mr27901961oab.207.1669931369066;
        Thu, 01 Dec 2022 13:49:29 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id r81-20020aca5d54000000b0035b99bbe30bsm2248529oib.54.2022.12.01.13.49.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 13:49:28 -0800 (PST)
Received: (nullmailer pid 1506354 invoked by uid 1000);
	Thu, 01 Dec 2022 21:49:27 -0000
Date: Thu, 1 Dec 2022 15:49:27 -0600
From: Rob Herring <robh@kernel.org>
To: Samuel Holland <samuel@sholland.org>
Cc: LABBE Corentin <clabbe.montjoie@gmail.com>, linux-sunxi@lists.linux.dev, netdev@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <mripard@kernel.org>, Eric Dumazet <edumazet@google.com>, Rob Herring <robh+dt@kernel.org>, "David S . Miller" <davem@davemloft.net>
Subject: Re: [PATCH 3/3] dt-bindings: net: sun8i-emac: Add phy-supply property
Message-ID: <166993136639.1506264.15399520110804856771.robh@kernel.org>
References: <20221125202008.64595-1-samuel@sholland.org>
 <20221125202008.64595-4-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221125202008.64595-4-samuel@sholland.org>


On Fri, 25 Nov 2022 14:20:08 -0600, Samuel Holland wrote:
> This property has always been supported by the Linux driver; see
> commit 9f93ac8d4085 ("net-next: stmmac: Add dwmac-sun8i"). In fact, the
> original driver submission includes the phy-supply code but no mention
> of it in the binding, so the omission appears to be accidental. In
> addition, the property is documented in the binding for the previous
> hardware generation, allwinner,sun7i-a20-gmac.
> 
> Document phy-supply in the binding to fix devicetree validation for the
> 25+ boards that already use this property.
> 
> Fixes: 0441bde003be ("dt-bindings: net-next: Add DT bindings documentation for Allwinner dwmac-sun8i")
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
> 
>  .../devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml     | 3 +++
>  1 file changed, 3 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
