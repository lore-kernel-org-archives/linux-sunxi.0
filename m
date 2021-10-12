Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6DB52C83
	for <linux-sunxi@lists.linux.dev>; Tue, 12 Oct 2021 14:08:49 +0000 (UTC)
Received: by mail-oo1-f53.google.com with SMTP id r1-20020a4a9641000000b002b6b55007bfso4266583ooi.3
        for <linux-sunxi@lists.linux.dev>; Tue, 12 Oct 2021 07:08:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=RMaXnYUhymrRYD9WfHd3vRjeCksk/ibqC+WFGIs70ao=;
        b=d/vAgD4kHvNNIcQLV1+t+4yPtSasJF31WPezgIyKPzwWTIeK5PfK8DufdlddC1am9G
         P7wREjtgDa1ed9ySKt0yH3o7bvpvh7KtxT6oGBJGaGGF7G/Die5ijlzPQhVN8FZ4+gqj
         IzBTxhpgKs5gSCfGA3W4GMhaojt5Du1qLJwDW+fojfcxIUtj1/XOkHU2H20SKHW77FBU
         vuoPgiApF7pWou9Oh2I2Z7WXQ30XhFuFudzTeA/crETpdQfeJEu6x0MkGFAheMhlnQpa
         IypUY8kQCSq0pGp3TydgZ6NmeqlqH1OXKKm92oGF+xL7O/3xGIn5PECtm04zCB4pQ2dc
         TnhA==
X-Gm-Message-State: AOAM533o8snOf6497deLqji/6BDEkzW/tATfY8zglK0kk+4qfv8lzIFU
	uRlsMY9mgpY0Gnv5URTPQg==
X-Google-Smtp-Source: ABdhPJzTJvvGTrmKrIm34n8gw9Ui7MkZ61v7NTftC8k97j3d2O33sg9Q7kkFkw07M9HEOZAz1PN20w==
X-Received: by 2002:a4a:2a51:: with SMTP id x17mr23507999oox.21.1634047723952;
        Tue, 12 Oct 2021 07:08:43 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id e11sm2330094oii.0.2021.10.12.07.08.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Oct 2021 07:08:43 -0700 (PDT)
Received: (nullmailer pid 2731186 invoked by uid 1000);
	Tue, 12 Oct 2021 14:08:42 -0000
Date: Tue, 12 Oct 2021 09:08:42 -0500
From: Rob Herring <robh@kernel.org>
To: Maxime Ripard <maxime@cerno.tech>
Cc: Chen-Yu Tsai <wens@csie.org>, Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>, Frank Rowand <frowand.list@gmail.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RESEND v2 1/4] dt-bindings: bluetooth: broadcom: Fix clocks
 check
Message-ID: <YWWW6inuh8OIM4Bl@robh.at.kernel.org>
References: <20210924072756.869731-1-maxime@cerno.tech>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210924072756.869731-1-maxime@cerno.tech>

On Fri, Sep 24, 2021 at 09:27:53AM +0200, Maxime Ripard wrote:
> The original binding was mentioning that valid values for the clocks and
> clock-names property were one or two clocks from extclk, txco and lpo,
> with extclk being deprecated in favor of txco.
> 
> However, the current binding lists a valid array as extclk, txco and
> lpo, with either one or two items.
> 
> While this looks similar, it actually enforces that all the device trees
> use either ["extclk"], or ["extclk", "txco"]. That doesn't make much
> sense, since the two clocks are said to be equivalent, with one
> superseeding the other.
> 
> lpo is also not a valid clock anymore, and would be as the third clock
> of the list, while we could have only this clock in the previous binding
> (and in DTs).
> 
> Let's rework the clock clause to allow to have either:
> 
>  - extclk, and mark it a deprecated
>  - txco alone
>  - lpo alone
>  - txco, lpo
> 
> While ["extclk", "lpo"] wouldn't be valid, it wasn't found in any device
> tree so it's not an issue in practice.
> 
> Similarly, ["lpo", "txco"] is still considered invalid, but it's
> generally considered as a best practice to fix the order of clocks.
> 
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Jakub Kicinski <kuba@kernel.org>
> Cc: netdev@vger.kernel.org
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  .../bindings/net/broadcom-bluetooth.yaml        | 17 +++++++++++++++--
>  1 file changed, 15 insertions(+), 2 deletions(-)

I've applied this and the rest of the series.

Rob
