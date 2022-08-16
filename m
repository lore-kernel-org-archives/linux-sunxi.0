Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50EBB53B8
	for <linux-sunxi@lists.linux.dev>; Tue, 16 Aug 2022 17:34:22 +0000 (UTC)
Received: by mail-io1-f51.google.com with SMTP id e192so3322023iof.5
        for <linux-sunxi@lists.linux.dev>; Tue, 16 Aug 2022 10:34:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=vNdSUDIuCoXELlH9XMziCohsKXYqhqiaV6prSiBstnQ=;
        b=u+8+ZmzReAPuKW0Lw2yjB8xh54tKLZkGMM18m0R7T82xpv7vUpX+krojsW7HjBhkQC
         DpDDVQNmeaQltUNKo3z/DRHAiu/y7/NdtQgGlJrtoD7BEd9miqM+8Z135eOB9SnUWL1j
         pQdzKPvjaIBgIyJ3VySGL1ulqhW18fqhLzDJh93HK0WMayinI9Z5vGqLYUJe4mjA5BrS
         Cm31XX66xGExRV6IH53jtuMuLmTLkFAN8vb5xrzLblliVzPGrsi2+jnTL7gSKkgqB2UR
         Z7XL8Nxt0UrrQmLzV/wr9QDcNhlqksivXCIo5C7Dpii/izLalWqKE/wFkB0oDrdQ2hk3
         CK+Q==
X-Gm-Message-State: ACgBeo22aO7lqRwcnjzA2+7W4nPyKl2M/7Y6KrOhRczkz1/5wtB9L5kE
	VwylIiPvyAfiEK6JZEQZBw==
X-Google-Smtp-Source: AA6agR5x+GlJ3IuesfolxVkxENyVw8nMHypHsYHjBlt7Y2d8nb8vjeQSOsB8rWSXq8mciC32FhkGrg==
X-Received: by 2002:a05:6638:16d3:b0:346:a4c6:fcc6 with SMTP id g19-20020a05663816d300b00346a4c6fcc6mr2674535jat.147.1660671261318;
        Tue, 16 Aug 2022 10:34:21 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id b22-20020a026f56000000b003436da41c78sm4600918jae.76.2022.08.16.10.34.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Aug 2022 10:34:20 -0700 (PDT)
Received: (nullmailer pid 2424921 invoked by uid 1000);
	Tue, 16 Aug 2022 17:34:19 -0000
Date: Tue, 16 Aug 2022 11:34:19 -0600
From: Rob Herring <robh@kernel.org>
To: Samuel Holland <samuel@sholland.org>
Cc: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, linux-sunxi@lists.linux.dev, Chen-Yu Tsai <wens@csie.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 03/12] dt-bindings: vendor-prefixes: Add Allwinner D1
 board vendors
Message-ID: <20220816173419.GA2424864-robh@kernel.org>
References: <20220815050815.22340-1-samuel@sholland.org>
 <20220815050815.22340-4-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220815050815.22340-4-samuel@sholland.org>

On Mon, 15 Aug 2022 00:08:06 -0500, Samuel Holland wrote:
> Some boards using the Allwinner D1 SoC are made by vendors not
> previously documented.
> 
> Clockwork Tech LLC (https://www.clockworkpi.com/) manufactures the
> ClockworkPi and DevTerm boards.
> 
> Beijing Widora Technology Co., Ltd. (https://mangopi.cc/) manufactures
> the MangoPi family of boards.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
> 
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
