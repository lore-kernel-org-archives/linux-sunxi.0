Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD04C70
	for <linux-sunxi@lists.linux.dev>; Fri, 21 May 2021 01:40:21 +0000 (UTC)
Received: by mail-oi1-f182.google.com with SMTP id c196so10052128oib.9
        for <linux-sunxi@lists.linux.dev>; Thu, 20 May 2021 18:40:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=QUghhfxEpPBhTg2FPZWIXXnyK2qF8xWGXvlE71nYEfk=;
        b=Rwz6wB7BqKpYsKXegE6hopVx3QBDD7eHPlC/bPW2+9F6084iChUD4NV0ZuiEtVhzDT
         evgl2FcfAig1DOKV2glQiJ1u5aFrXK8uOp0z7PZX9T2DU6CtFyZCK8s/V8u3S89T8/bU
         iTpsGCCEKlxKL+ldTm5PZrmuyjbVdiqxrInUWPSvIHQHKrVfcxboIPXamMaJGEZhyCBv
         nfiZsqFvraRtTkLxpvaAfO4BqZoU4wb1NJrkCQGR7X0oIqBxOdXgBMCoMwkGnyW2lCao
         sEe3/+sYURwua6irJjUxq1UsYtQDESMvntg1Og54QfDmfEMIdOThXp4TMsOUuLipPUu9
         jiaA==
X-Gm-Message-State: AOAM532sdUHIu9hZ/Rj43XIWCXjkLP6YI7t3F0Q3QMFMHmBjGUiwFuqp
	a2+L4yRzyYEQv9C3MPWXJw==
X-Google-Smtp-Source: ABdhPJwH+KkKDT3WwGvqY7ufqlGVOEsWl2fB3WmHRzUPq3j7OEk7UKbhMDylMLO+rlhWOE6K2/QKOw==
X-Received: by 2002:aca:1819:: with SMTP id h25mr271032oih.168.1621561221154;
        Thu, 20 May 2021 18:40:21 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id 7sm973941oti.30.2021.05.20.18.40.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 18:40:20 -0700 (PDT)
Received: (nullmailer pid 2461725 invoked by uid 1000);
	Fri, 21 May 2021 01:40:19 -0000
Date: Thu, 20 May 2021 20:40:19 -0500
From: Rob Herring <robh@kernel.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, Icenowy Zheng <icenowy@aosc.io>, Vinod Koul <vkoul@kernel.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Maxime Ripard <mripard@kernel.org>, linux-phy@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>, Ondrej Jirman <megous@megous.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, linux-sunxi@googlegroups.com, Kishon Vijay Abraham I <kishon@ti.com>, linux-usb@vger.kernel.org, linux-sunxi@lists.linux.dev, Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH v6 08/17] dt-bindings: usb: Add H616 compatible string
Message-ID: <20210521014019.GA2461696@robh.at.kernel.org>
References: <20210519104152.21119-1-andre.przywara@arm.com>
 <20210519104152.21119-9-andre.przywara@arm.com>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210519104152.21119-9-andre.przywara@arm.com>

On Wed, 19 May 2021 11:41:43 +0100, Andre Przywara wrote:
> The H616 has four PHYs as the H3, along with their respective clock
> gates and resets, so the property description is identical.
> 
> However the PHYs itself need some special bits, so we need a new
> compatible string for it.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  .../devicetree/bindings/phy/allwinner,sun8i-h3-usb-phy.yaml   | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
