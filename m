Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 237C970
	for <linux-sunxi@lists.linux.dev>; Sat, 27 Mar 2021 16:45:01 +0000 (UTC)
Received: by mail-oi1-f177.google.com with SMTP id k25so8976642oic.4
        for <linux-sunxi@lists.linux.dev>; Sat, 27 Mar 2021 09:45:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=2F8RzeTleB8udHCv5mRu3tw4FmnypGvkRtmFHpRztvE=;
        b=HPcdJXmcoaFpLnsDWxmhy48nuTDPwOHgQ8zFiz8NTgoGg5LAMqE5bukKMA4g4P+9Ak
         c/Ytm/CfnxRTrgoGrEfCCjIfuh38tORvtyb/hNRnIUuXrMHy0pWajuy+4tlHzxs0MhFP
         1xnktpHYZNvXytl1FJ8YWcP5PpWuurIBz+BRTP+245DgBiTOnx7W8BPYW3CfHPuzeEii
         VxDG3k3AbPR8Nr0ET2dT7wCmi6zfC1aI9X5Sir9CaiXnujZQ/8HuiIAAHc1pdNL9uMwd
         PPvfV/L5zm25J7oUT54L1njFzkEipeqWjGRlRO0bEgaeXqIyuqFoTbbJno6S8xzcu2h8
         b1Lw==
X-Gm-Message-State: AOAM533tCzORn6ANdYv1q7wKV4t6vrb0yxSTkWEh3nb9hmPiet183tQQ
	lq7wQsf6kvjjnmubEqxNXQ==
X-Google-Smtp-Source: ABdhPJxxFybdvkzTsqZO6qv3YqeMmmcg3+FTflQKCCnCH6rWeKtKOq6qu4yFD9S8pulpvjtPrO0gFw==
X-Received: by 2002:aca:1b01:: with SMTP id b1mr13387336oib.177.1616863500303;
        Sat, 27 Mar 2021 09:45:00 -0700 (PDT)
Received: from robh.at.kernel.org ([172.58.99.140])
        by smtp.gmail.com with ESMTPSA id z3sm125375oop.41.2021.03.27.09.44.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Mar 2021 09:44:59 -0700 (PDT)
Received: (nullmailer pid 223207 invoked by uid 1000);
	Sat, 27 Mar 2021 16:44:56 -0000
Date: Sat, 27 Mar 2021 10:44:56 -0600
From: Rob Herring <robh@kernel.org>
To: Samuel Holland <samuel@sholland.org>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Jernej Skrabec <jernej.skrabec@siol.net>, Maxime Ripard <mripard@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Maxime Ripard <maxime@cerno.tech>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/5] dt-bindings: timer: Simplify conditional
 expressions
Message-ID: <20210327164456.GA223158@robh.at.kernel.org>
References: <20210322044707.19479-1-samuel@sholland.org>
 <20210322044707.19479-2-samuel@sholland.org>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210322044707.19479-2-samuel@sholland.org>

On Sun, 21 Mar 2021 23:47:03 -0500, Samuel Holland wrote:
> The sun4i timer IP block has a variable number of interrupts based on
> the compatible. Use enums to combine the two sections for the existing
> 3-interrupt variants, and to simplify adding new compatible strings.
> 
> Acked-by: Maxime Ripard <maxime@cerno.tech>
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
>  .../timer/allwinner,sun4i-a10-timer.yaml      | 25 ++++++-------------
>  1 file changed, 7 insertions(+), 18 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
