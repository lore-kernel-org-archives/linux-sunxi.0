Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AF7270
	for <linux-sunxi@lists.linux.dev>; Tue, 18 May 2021 01:15:59 +0000 (UTC)
Received: by mail-oi1-f169.google.com with SMTP id v22so8254366oic.2
        for <linux-sunxi@lists.linux.dev>; Mon, 17 May 2021 18:15:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=vWrYxkhiNpE6IERfqfAJPWaNhb4OcjWZKmlcXbqdkTk=;
        b=IP2C28KFKHNwWSiMsXR5ySCJpBOwL0lNd+BkUzwDBslmZUxyG4ryuyrPfwK/4hfIJD
         /FYy9bd1sewycTOYLaFcEDbdn0hjzLDKIGUhZDMv9OxWFbjnoRVHs/t0T9RWCbcuta+7
         /zbM4h/Lg6gAwMtg1wSEu9HmyPOXS4SwX/lRGvs7QfFGktnnwCdn3mtyMXoAT6mi+M2q
         g2WjfKXJJ5/UBFhnHCvmTCf9uYEtcLNzqoksd1kqOqJ283bBcl0ra1QV51bewC0rvJRL
         f68IM6csYx22sGy+h4c7LvrBbBQEzsXwbNEtqIANgUmFWFdlPIJFeoGPghMdBGtgIzQ8
         qmmg==
X-Gm-Message-State: AOAM530WqXcRrfq554UlbBYOq6y9bKo++1LlMy9NjuOo5HVwdyUcFtfQ
	y9tw5hrsih/wEq+iCefUDw==
X-Google-Smtp-Source: ABdhPJx3WYsEtW/o8RvtlR1yLcZyjHt0PWDM9RLbaNceJyBgykElYBVJ0Oo/kRn6Wyb2iiTqnLi6Wg==
X-Received: by 2002:a05:6808:8cb:: with SMTP id k11mr1449159oij.103.1621300558895;
        Mon, 17 May 2021 18:15:58 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id a12sm3466132oti.12.2021.05.17.18.15.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 18:15:58 -0700 (PDT)
Received: (nullmailer pid 3581134 invoked by uid 1000);
	Tue, 18 May 2021 01:15:57 -0000
Date: Mon, 17 May 2021 20:15:57 -0500
From: Rob Herring <robh@kernel.org>
To: Tobias Schramm <t.schramm@manjaro.org>
Cc: linux-arm-kernel@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>, Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: pwm: allwinner: add v3s pwm
 compatible
Message-ID: <20210518011557.GA3581104@robh.at.kernel.org>
References: <20210513203527.2072090-1-t.schramm@manjaro.org>
 <20210513203527.2072090-2-t.schramm@manjaro.org>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210513203527.2072090-2-t.schramm@manjaro.org>

On Thu, 13 May 2021 22:35:26 +0200, Tobias Schramm wrote:
> The Allwinner V3s pwm peripheral is compatible with the pwm peripheral
> inside the Allwinner A20.
> This patch adds a compatible string for it.
> 
> Signed-off-by: Tobias Schramm <t.schramm@manjaro.org>
> ---
>  .../devicetree/bindings/pwm/allwinner,sun4i-a10-pwm.yaml       | 3 +++
>  1 file changed, 3 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
