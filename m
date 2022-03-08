Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98F164A8F
	for <linux-sunxi@lists.linux.dev>; Tue,  8 Mar 2022 16:10:40 +0000 (UTC)
Received: by mail-oi1-f176.google.com with SMTP id j83so8648543oih.6
        for <linux-sunxi@lists.linux.dev>; Tue, 08 Mar 2022 08:10:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=OH0isBduUH3WTRoeg8Y2W/90hAKfYzpVVQwy9vayo7Y=;
        b=j+pJseyinDeZpAKSLL00pHR77/Im0bfR72yc9eGedoZEtfo2mSTwTftV5MzYRJ5D41
         MNwk1vlJAhnpcOA/r8I1ueW2HBt+3GNXHDyljtUwdO4iA/yJ1gpIpHQntYCAmlOFoNBc
         b3CKtqeFk4g1v2xXLmXKpqpn5DU1+E3U2pYmiZKMLiuNw7AxhGTCqInncoK36IIG2WFX
         VGI0AZrRXwyYc4e9KboSCazgojseYvHFs8jppsI2PWInx7DyOF3cVCZEzC5h4CV9DeaL
         paL0XsJjfw6U3NphUouXuaNrTeL0My4NizAODMcPPR/P+EqKkstY0W4gsI4/Fj8OdueF
         +veA==
X-Gm-Message-State: AOAM532giBWWjH/tsJ1s83MAMurNd7/riZu5H77RBSQd2G0vdw0Aq1Bv
	46Tc+WU+1N6jYFGIwSrjmQ==
X-Google-Smtp-Source: ABdhPJzsHFznjPr/PNhN2YiTdX8wtONctQgQstVmvlEScy+khuCdoqBSidc9onO7JZ0i5C6cDYMF9Q==
X-Received: by 2002:aca:1c18:0:b0:2da:17d9:c02c with SMTP id c24-20020aca1c18000000b002da17d9c02cmr1664683oic.264.1646755839551;
        Tue, 08 Mar 2022 08:10:39 -0800 (PST)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id 45-20020a9d08b0000000b005b2387fefb2sm2502313otf.78.2022.03.08.08.10.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Mar 2022 08:10:38 -0800 (PST)
Received: (nullmailer pid 851144 invoked by uid 1000);
	Tue, 08 Mar 2022 16:10:37 -0000
Date: Tue, 8 Mar 2022 10:10:37 -0600
From: Rob Herring <robh@kernel.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mesih Kilinc <mesihkilinc@gmail.com>, devicetree@vger.kernel.org, Samuel Holland <samuel@sholland.org>, Mark Brown <broonie@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Giulio Benetti <giulio.benetti@benettiengineering.com>, linux-spi@vger.kernel.org, George Hilliard <thirtythreeforty@gmail.com>, Icenowy Zheng <icenowy@aosc.io>, linux-sunxi@lists.linux.dev, Maxime Ripard <mripard@kernel.org>, Jesse Taube <mr.bossman075@gmail.com>, linux-arm-kernel@lists.infradead.org, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: Re: [PATCH 10/14] dt-bindings: spi: sunxi: document F1C100
 controllers
Message-ID: <Yid//bRBwVSaOhA0@robh.at.kernel.org>
References: <20220307143421.1106209-1-andre.przywara@arm.com>
 <20220307143421.1106209-11-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220307143421.1106209-11-andre.przywara@arm.com>

On Mon, 07 Mar 2022 14:34:17 +0000, Andre Przywara wrote:
> The Allwinner F1C100 series contains two SPI controllers, which are
> compatible to the IP block used in the Allwinner H3 as well.
> The only difference in the integration is the missing mod clock in the
> F1C100, but that does not affect the SPI controller binding, as we can
> still supply the correct clock (AHB parent) easily.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  .../devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml         | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
