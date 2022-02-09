Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98F392F43
	for <linux-sunxi@lists.linux.dev>; Wed,  9 Feb 2022 21:15:35 +0000 (UTC)
Received: by mail-oi1-f173.google.com with SMTP id x193so3951513oix.0
        for <linux-sunxi@lists.linux.dev>; Wed, 09 Feb 2022 13:15:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=BpjegsvG0ViGS/YJQpJJgxUJraZoIKwgkiFg7EhU/PM=;
        b=PVsLLrIsFRYCS50aFeJR/eqI6gURbDLn+6rVGzj4JAuoDMhQKnxg0KwhzBkVm+PW4j
         nLNaf294Yx2FlChKgFpdspRwvJu3noRJ7i513n757gn9dnAAyWtfBUByGib9xd6Z6QtO
         mQ5yFqSgvGl/3+Ly+bFYDQvA3WDuBo/IXV0LALO/b+qog4mmgb43jGRWbA/c6oHMVYfF
         8FHUVcAR3Kv/X5VJsdPdkyF8GXTSRAbY2HIwgWy8KYaokvqrHOS5VK60BWMFQMXr/Uqb
         RF4MkNcOlZTk5Y1agTWK2nPesc1WPuzSqV/DuISD/Uq21CRtPWfljBbkCfZzJCaqt44+
         dwUw==
X-Gm-Message-State: AOAM5305tlsshmMMZrC/zaCmGdK38LcVysg5jTq21jtRE7nYBpM0EMe1
	eK7BfUa6vPc+FU7NkeN9qA==
X-Google-Smtp-Source: ABdhPJwB2UUfATjDERHGwsndDCHW4vNmmG1kS7Rg5f1Ci9hL0yVtNga4Tq2cqxsi6DmDCFi8DGjlMw==
X-Received: by 2002:a05:6808:1152:: with SMTP id u18mr1896564oiu.316.1644441334806;
        Wed, 09 Feb 2022 13:15:34 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id a10sm6919713otb.58.2022.02.09.13.15.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Feb 2022 13:15:33 -0800 (PST)
Received: (nullmailer pid 927455 invoked by uid 1000);
	Wed, 09 Feb 2022 21:15:32 -0000
Date: Wed, 9 Feb 2022 15:15:32 -0600
From: Rob Herring <robh@kernel.org>
To: Jesse Taube <mr.bossman075@gmail.com>
Cc: Mr.Bossman075@gmail.com, andre.przywara@arm.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, robh+dt@kernel.org, mripard@kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 2/4] dt-bindings: mmc: sunxi: Add Allwinner F1c100s
 compatibles
Message-ID: <YgQu9H0UgCyUPvI+@robh.at.kernel.org>
References: <20220130220325.1983918-1-Mr.Bossman075@gmail.com>
 <20220130220325.1983918-2-Mr.Bossman075@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220130220325.1983918-2-Mr.Bossman075@gmail.com>

On Sun, 30 Jan 2022 17:03:23 -0500, Jesse Taube wrote:
> Add binding for F1c100s's mmc controller.
> 
> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
> ---
> V1 -> V2:
> * New commit
> ---
>  .../devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml       | 3 +++
>  1 file changed, 3 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
