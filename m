Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A7C672
	for <linux-sunxi@lists.linux.dev>; Fri,  6 Aug 2021 21:40:47 +0000 (UTC)
Received: by mail-io1-f41.google.com with SMTP id 188so12492541ioa.8
        for <linux-sunxi@lists.linux.dev>; Fri, 06 Aug 2021 14:40:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=SVZ3CU03g0qrDAF07gnpcK72ygfjL9r246Tcln5qp/s=;
        b=JTbOPMKu4zKEaAJNr4XAL1lWVXI/NARBFNbS4i+cMMTGD9iweJsH0rWkwGfYsPVR2Y
         DDDzWL7ypSuEuu27WwHy1D200d4h2DbhDaMPqIkVCtE8gWtP1JDEz78eSVkZqcL18TCn
         gqKd8TjOzIGPag5QjO/jfzXzYLd1mxVgx1atiX0wegGO/jsjG28xmm2sfz8WkrV6UVn/
         3odgREgVxAj4BDGt3MV/buMa+mwSqtq+J+3M5YwA57EnIHI5jl1qwHRCNp4uZ8lKcDXk
         fHULNDovTe9J9Zl0Q4UuLt6Mgn3s2YLXaPnnUUWvbU4o8BZcHslj1lWo3zG8j1d7yDfF
         sIHQ==
X-Gm-Message-State: AOAM531Jr+2yiRjAwzoHDCaFu/Yb4Jzkw91LT2JJLDP+IRIq3SxyiuZq
	QXndBzUHYbLx9A2QEUfCDw==
X-Google-Smtp-Source: ABdhPJwEkxhHXJR5C/AUQDaT9F/idc9EmQCYPRxRDiKhGD8JlwYmclQ8f9Fgf1xeR22wuqWLCePiRg==
X-Received: by 2002:a02:b058:: with SMTP id q24mr11459307jah.88.1628286046526;
        Fri, 06 Aug 2021 14:40:46 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id j2sm5438284ilr.80.2021.08.06.14.40.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Aug 2021 14:40:46 -0700 (PDT)
Received: (nullmailer pid 1851157 invoked by uid 1000);
	Fri, 06 Aug 2021 21:40:43 -0000
Date: Fri, 6 Aug 2021 15:40:43 -0600
From: Rob Herring <robh@kernel.org>
To: Icenowy Zheng <icenowy@sipeed.com>
Cc: Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <mripard@kernel.org>, Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, Alexandre Belloni <alexandre.belloni@bootlin.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, linux-sunxi@lists.linux.dev, Ulf Hansson <ulf.hansson@linaro.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Andre Przywara <andre.przywara@arm.com>, Rob Herring <robh+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 06/17] dt-bindings: pinctrl: document Allwinner R329 PIO
 and R-PIO
Message-ID: <YQ2sW6ulsvlPluMC@robh.at.kernel.org>
References: <20210802062212.73220-1-icenowy@sipeed.com>
 <20210802062212.73220-7-icenowy@sipeed.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210802062212.73220-7-icenowy@sipeed.com>

On Mon, 02 Aug 2021 14:22:01 +0800, Icenowy Zheng wrote:
> Allwinner R329 have two pin controllers similar to previous Allwinner
> SoCs, PIO and R-PIO.
> 
> Add compatible strings for them.
> 
> Signed-off-by: Icenowy Zheng <icenowy@sipeed.com>
> ---
>  .../bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml         | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
