Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FEFF57F2
	for <linux-sunxi@lists.linux.dev>; Fri,  1 Jul 2022 20:56:32 +0000 (UTC)
Received: by mail-io1-f45.google.com with SMTP id l24so3344221ion.13
        for <linux-sunxi@lists.linux.dev>; Fri, 01 Jul 2022 13:56:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=2W4otq92zFfalH+gxfmLA9wF6s9cXLd7pPhg0IWZ1yQ=;
        b=gQ33kE/5q1+Byzie9QJ0QEnDGG21WixjLGbkdEEK5ndaof58Wvl7NkF2H2yyTB1M0t
         owyYH8jTotPcShgSvQIxPD8EYnRcP5isKwi9p8UUyw5yINUJ3suWgCOQuYXZMC3FECps
         bmU2X53Vth9fdkV4zo3K2i7bSlNA939R8RnLsPRsqnFI7lQipM70dOzq0UO55THQIq4T
         xVGB/dW3fUoBmwHkYe5roc4sFlZMkt6JIAmowNS0emFrqEjullkohPH31qCGdaC4Nkdz
         55FS41J6CGvNglUFlyiGw22MSOKggwvdiX0QUcDtH1x5H4WwkTdXS8BWPLR93U/7LtyX
         WKDw==
X-Gm-Message-State: AJIora+nDxfOZ7QwqbGIEyNXThn/x1adzRr1g+TnFCtNVkUVj483nru4
	vFcZl54pAsKryRSJ/d8lKQ==
X-Google-Smtp-Source: AGRyM1vhDtJesvNuuONXYiZ73XevaIFapti+fRC1a89IqwmrRBoeM2BSI/jdY7PvT2MbMKmjxRT+Og==
X-Received: by 2002:a02:9f09:0:b0:339:e88d:f9bd with SMTP id z9-20020a029f09000000b00339e88df9bdmr10352168jal.298.1656708991347;
        Fri, 01 Jul 2022 13:56:31 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id i20-20020a5d88d4000000b00674ef48b124sm10600409iol.51.2022.07.01.13.56.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Jul 2022 13:56:31 -0700 (PDT)
Received: (nullmailer pid 1514827 invoked by uid 1000);
	Fri, 01 Jul 2022 20:56:29 -0000
Date: Fri, 1 Jul 2022 14:56:29 -0600
From: Rob Herring <robh@kernel.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev, "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>, netdev@vger.kernel.org, Eric Dumazet <edumazet@google.com>, Linus Walleij <linus.walleij@linaro.org>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH v12 1/7] dt-bindings: arm: sunxi: Add H616 EMAC compatible
Message-ID: <20220701205629.GA1514772-robh@kernel.org>
References: <20220701112453.2310722-1-andre.przywara@arm.com>
 <20220701112453.2310722-2-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220701112453.2310722-2-andre.przywara@arm.com>

On Fri, 01 Jul 2022 12:24:47 +0100, Andre Przywara wrote:
> The Allwinner H616 contains an "EMAC" Ethernet MAC compatible to the A64
> version.
> 
> Add it to the list of compatible strings.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  .../devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml       | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
