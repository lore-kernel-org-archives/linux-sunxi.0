Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41AF153B8
	for <linux-sunxi@lists.linux.dev>; Tue, 16 Aug 2022 17:34:03 +0000 (UTC)
Received: by mail-il1-f174.google.com with SMTP id m9so949223ili.1
        for <linux-sunxi@lists.linux.dev>; Tue, 16 Aug 2022 10:34:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=ocfp5I9qK0ctx9cDxA5y/IUHuXfnD9Ka2G82jMVWFSc=;
        b=iyLU2Xo3uWg9WyfB5uJCpy69Qw7DlYvqQRXZSgfICBYxbNudD7tlGRYsHmu1mCeN/W
         uuf+7C/9u2xgGGdnv4FLjim057t0ynVq8MOd0gGOIP+cxLgCsS5tnL+g+k/E5F3GnxQf
         7FhK1lCgAC4fFK5vuQk1ZaqD3JGGdGG21rJK2vJgOZlKPQ0Nfiiuf6Gijsks1c2UQEfl
         JDhn9VhG7swf2U1IOyJkVLBrgZHrL/x/SC8LV+NwrIjCk6XENwcnmy8VStQrEHc/vd3F
         iz0X2bsmnIng47mWu4bN3R8DHs+kkHCYCZc26PWo+E2ncZ8ZC7Pp36PIG+lWk85EoQi2
         OPyg==
X-Gm-Message-State: ACgBeo0JZLd5ZOCziLw29sCLo0PfUc3GEuuVaKaMiVF0f3TWJU6EmYGB
	JSS0ijGsMy309n2ftxxMpA==
X-Google-Smtp-Source: AA6agR4j3pIZz7KH8vmLyJaoyp/zdHchsnP+VUwuYzNv9GLi6f5Yj8ZmNmusErup5y9k+atidjnVGQ==
X-Received: by 2002:a05:6e02:20e9:b0:2e5:e584:d616 with SMTP id q9-20020a056e0220e900b002e5e584d616mr3358602ilv.236.1660671242323;
        Tue, 16 Aug 2022 10:34:02 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id b16-20020a05663801b000b0034602e741f0sm2976099jaq.67.2022.08.16.10.34.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Aug 2022 10:34:01 -0700 (PDT)
Received: (nullmailer pid 2424370 invoked by uid 1000);
	Tue, 16 Aug 2022 17:34:00 -0000
Date: Tue, 16 Aug 2022 11:34:00 -0600
From: Rob Herring <robh@kernel.org>
To: Samuel Holland <samuel@sholland.org>
Cc: linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Paul Walmsley <paul.walmsley@sifive.com>, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, linux-sunxi@lists.linux.dev, Chen-Yu Tsai <wens@csie.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: Re: [PATCH 02/12] dt-bindings: riscv: Add T-HEAD C906 and C910
 compatibles
Message-ID: <20220816173400.GA2424313-robh@kernel.org>
References: <20220815050815.22340-1-samuel@sholland.org>
 <20220815050815.22340-3-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220815050815.22340-3-samuel@sholland.org>

On Mon, 15 Aug 2022 00:08:05 -0500, Samuel Holland wrote:
> The C906 and C910 are RISC-V CPU cores from T-HEAD Semiconductor.
> Notably, the C906 core is used in the Allwinner D1 SoC.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
> 
>  Documentation/devicetree/bindings/riscv/cpus.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
