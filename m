Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28DC53212
	for <linux-sunxi@lists.linux.dev>; Mon,  2 May 2022 21:35:34 +0000 (UTC)
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-e93ff05b23so15532936fac.9
        for <linux-sunxi@lists.linux.dev>; Mon, 02 May 2022 14:35:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=NT3TCOHAgj+vdyt2sEgp7l3FsjbmObj02EKHyM2g53k=;
        b=y6Bk5UHyEx1r98XI7wqpM6/LRWxWw1b+TxB9J0xp/7UlkBblDV6CMYTToI7UqVY280
         gDHL7LNfxKn0Zzfxn82CxrRVIehhVrn2yXGHK6TblhXi7CAsERZxEJcvt93wQLQXa2TV
         GQG6wjGTZ3t4zoPoLliowz3G0GYHvyPnQDIzt5AkQDvDMISg4zGEYifRxUdGqy8iZlKL
         UC1YOBBkb20431hiUbi6OjxtS2eq1WrWuNXMBsyL2QU7QtkM4s+2IeSK2GDMFNq5q0xm
         Wb+Pl3sttrLG7/q5HsSgPAHeQ0c6UWxOymI+exhUWSSwoHbHkEcvpQOcx+rmzk6XM38+
         DPsQ==
X-Gm-Message-State: AOAM532afVwmPo2IjDVjLNtP/WK2AcvlySPsISfONif88wioy9cYmrdu
	y70+rvzV1qo1x8rbhqmYyQ==
X-Google-Smtp-Source: ABdhPJylq3vUy3dAJvMPmpgnVj4BH7chXBbaFIQei9aSlly/yv1cZ/9zNHEEasLZ4ywd53cUfQWseQ==
X-Received: by 2002:a05:6870:648d:b0:ec:b32d:3e1b with SMTP id cz13-20020a056870648d00b000ecb32d3e1bmr509121oab.283.1651527333236;
        Mon, 02 May 2022 14:35:33 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id w5-20020a9d70c5000000b0060603221268sm3260916otj.56.2022.05.02.14.35.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 May 2022 14:35:32 -0700 (PDT)
Received: (nullmailer pid 1799513 invoked by uid 1000);
	Mon, 02 May 2022 21:35:31 -0000
Date: Mon, 2 May 2022 16:35:31 -0500
From: Rob Herring <robh@kernel.org>
To: icenowy@outlook.com
Cc: linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, Ulf Hansson <ulf.hansson@linaro.org>, Chen-Yu Tsai <wens@csie.org>, Andre Przywara <andre.przywara@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Samuel Holland <samuel@sholland.org>, Rob Herring <robh+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Icenowy Zheng <icenowy@aosc.io>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 09/12] dt-bindings: arm: sunxi: add compatible strings
 for Sipeed MaixSense
Message-ID: <YnBOoxkKdKLwErxY@robh.at.kernel.org>
References: <20220422140902.1058101-1-icenowy@aosc.io>
 <BYAPR20MB24723FAF3BE29BB7CD8341CCBCF79@BYAPR20MB2472.namprd20.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BYAPR20MB24723FAF3BE29BB7CD8341CCBCF79@BYAPR20MB2472.namprd20.prod.outlook.com>

On Fri, 22 Apr 2022 23:41:12 +0800, icenowy@outlook.com wrote:
> From: Icenowy Zheng <icenowy@aosc.io>
> 
> Sipeed MaixSense is an Allwinner R329 development kit based on Maix IIA
> SoM.
> 
> Add compatible strings for it.
> 
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> ---
>  Documentation/devicetree/bindings/arm/sunxi.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
