Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B58A2FB8
	for <linux-sunxi@lists.linux.dev>; Tue, 15 Jun 2021 23:33:51 +0000 (UTC)
Received: by mail-il1-f175.google.com with SMTP id b14so680556ilq.7
        for <linux-sunxi@lists.linux.dev>; Tue, 15 Jun 2021 16:33:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=LyqHDdfMm/fHepQcQ8Q+GkviGnfZ8KOz9oxgfTRPU7I=;
        b=FraO/X0QzEY3WfvEzrhEPgFZ/ImGdtiEI0TIhw+GHBvSyYppFKxQx2XOVxdt2F0+S+
         8YnjBqmYauvJSWtsCgXWWbc50cy1n+qFhun1q0GsixMFvsWbix5IDXkIb2FmmXcSdPbg
         CXW9tKGPXLSkgsuRnayENUsRAxeoFsBHyAYf1gyVi7sus29dNiVQSl1BKO/rOXBz5f3Z
         kiGPTQp4cRPUNPDmZEozrBuwqok/g5g1EuTGiadNuguyPy+mc2fw0NCp9Gs1tE1tFdEk
         ANiszS14yKuf05iUwRtMjf1b2iCyOr3u82wpgJr6o4xrHHCWnFuPii75FvW+xwa4YDfI
         f+Mg==
X-Gm-Message-State: AOAM533fiCeVVSy8A3q+ETTIWB6B1h+LE+NKsd5VDudYBzJxEFMTavqJ
	OIpr3IwecBZtLooyK2pNXQ==
X-Google-Smtp-Source: ABdhPJzbC5HKz5gHoX68oLX+Wabn/CX5CPYzUpZTV+qRkH3zirfL4w2wpZiZHDRNfvv71F9L/+x0lw==
X-Received: by 2002:a92:bd06:: with SMTP id c6mr1398682ile.110.1623800030775;
        Tue, 15 Jun 2021 16:33:50 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id r11sm282870ilm.23.2021.06.15.16.33.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jun 2021 16:33:49 -0700 (PDT)
Received: (nullmailer pid 1628454 invoked by uid 1000);
	Tue, 15 Jun 2021 23:33:45 -0000
Date: Tue, 15 Jun 2021 17:33:45 -0600
From: Rob Herring <robh@kernel.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: linux-sunxi@googlegroups.com, Samuel Holland <samuel@sholland.org>, linux-kernel@vger.kernel.org, Icenowy Zheng <icenowy@aosc.io>, Chen-Yu Tsai <wens@csie.org>, Ondrej Jirman <megous@megous.com>, Maxime Ripard <mripard@kernel.org>, Lee Jones <lee.jones@linaro.org>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v7 01/19] dt-bindings: mfd: axp20x: Add AXP305 compatible
 (plus optional IRQ)
Message-ID: <20210615233345.GA1627887@robh.at.kernel.org>
References: <20210615110636.23403-1-andre.przywara@arm.com>
 <20210615110636.23403-2-andre.przywara@arm.com>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210615110636.23403-2-andre.przywara@arm.com>

On Tue, 15 Jun 2021 12:06:18 +0100, Andre Przywara wrote:
> The AXP305 PMIC used on many boards with the H616 SoC seems to be fully
> compatible to the AXP805 PMIC, so add the proper chain of compatible
> strings.
> 
> Also at least on one board (Orangepi Zero2) there is no interrupt line
> connected to the CPU, so make the "interrupts" property optional.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  Documentation/devicetree/bindings/mfd/axp20x.txt | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 


Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.

