Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 309DF7482
	for <linux-sunxi@lists.linux.dev>; Mon,  7 Mar 2022 23:28:51 +0000 (UTC)
Received: by mail-oi1-f182.google.com with SMTP id k2so17039681oia.2
        for <linux-sunxi@lists.linux.dev>; Mon, 07 Mar 2022 15:28:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=JVvzRwcrmqCD5sIuTw06DJoMahe3r0oq+Cma9RxAwg4=;
        b=ZsAsbljfAyXZ0kZWg2oB6Bm0aJuSGjnJnFwPkJxuniiz+ogTCPNs1zAbRbvPilFWrG
         URJF3/okFzVXTceUoGQHF6v6jYGdtTDzrH/2c2Jtvf9iiN/D+xftsZnqDHGOR08MkhTE
         930jGmIFFD9bzG21AwbvIf4FKOPshZNNlZgOMR6RsOi7WCFsdYVrHtQ2kaI8czyNeEkO
         2Z/dHW4dqan7OyB3QScLZb0kvYNG8RXYsEAWJ15nylIc713gjNEUy9RQZgE2h8D6VieS
         q0rjZwUuIHNFIdV80k9BYZKsUdgi6HD0NJTXr1+EbIzPKCQNQuGbFYKeefmHvkifmOIM
         v2YQ==
X-Gm-Message-State: AOAM532vY68l1nOePftHkaUOn1KG6Cm+hQpIw7addF1/Pfo3BahMDX37
	YerT5B2Yk7jTs6BSBNP9JA==
X-Google-Smtp-Source: ABdhPJwTbvNYHHuH1SkYiIHsikdCFEp4VIL5Jq3FfR2GME7j62q5oMLly4zIPkLL7toglfqJWD/X0Q==
X-Received: by 2002:a05:6808:2383:b0:2d9:a01a:48d6 with SMTP id bp3-20020a056808238300b002d9a01a48d6mr951959oib.289.1646695730264;
        Mon, 07 Mar 2022 15:28:50 -0800 (PST)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id o10-20020a0568080f8a00b002d726c76b77sm7093528oiw.15.2022.03.07.15.28.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Mar 2022 15:28:49 -0800 (PST)
Received: (nullmailer pid 3465035 invoked by uid 1000);
	Mon, 07 Mar 2022 23:28:47 -0000
Date: Mon, 7 Mar 2022 17:28:47 -0600
From: Rob Herring <robh@kernel.org>
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc: Hans Verkuil <hans.verkuil@cisco.com>, Samuel Holland <samuel@sholland.org>, Kishon Vijay Abraham I <kishon@ti.com>, linux-sunxi@lists.linux.dev, linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>, linux-arm-kernel@lists.infradead.org, Yong Deng <yong.deng@magewell.com>, devicetree@vger.kernel.org, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-media@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v3 1/9] dt-bindings: sun6i-a31-mipi-dphy: Add optional
 direction property
Message-ID: <YiaVL3Xk0XP7y7iL@robh.at.kernel.org>
References: <20220302220739.144303-1-paul.kocialkowski@bootlin.com>
 <20220302220739.144303-2-paul.kocialkowski@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220302220739.144303-2-paul.kocialkowski@bootlin.com>

On Wed, 02 Mar 2022 23:07:31 +0100, Paul Kocialkowski wrote:
> The Allwinner A31 MIPI D-PHY block supports both tx and rx directions,
> although each instance of the block is meant to be used in one
> direction only. There will typically be one instance for MIPI DSI and
> one for MIPI CSI-2 (it seems unlikely to ever see a shared instance).
> 
> Describe the direction with a new allwinner,direction property.
> For backwards compatibility, the property is optional and tx mode
> should be assumed by default.
> 
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> ---
>  .../bindings/phy/allwinner,sun6i-a31-mipi-dphy.yaml  | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
