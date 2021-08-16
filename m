Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 051222FAE
	for <linux-sunxi@lists.linux.dev>; Mon, 16 Aug 2021 12:39:14 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id r6so23430119wrt.4
        for <linux-sunxi@lists.linux.dev>; Mon, 16 Aug 2021 05:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=rzZaQ6s2L8HTP/N+G7lyZXAfcU7PndFNzvU/KdGwi9Y=;
        b=QlNlgUbNjG0m1HA8MWuitLFzXBkPqVYzU+AdZ45Rd3gQXpgaysrPo86WK3Ch/6sbjA
         0Jup9IUiYxa7n3h3p5kWtOlZc50ulFWd4uMRk/T4adIIgemWs1nFyU0k0XvL9NBhs5dp
         8lRqkR7wt65s6amS0/hvZtr2N6joSDuPXh1Zo8gPXdJ79VwEweICP3zbLQ9MuFSD0ERY
         VQl89N0JdOugZbtKNiXniryTiHttwZr5XPWCIiQ/9wuVrZn48LHDIvl2XaCTBM7HkZZ6
         E4gzvEbRQQlv6lnFL/3nx1X9SUCzHbLd7hFLz4N6uKVvZE3RJlQE7gHjsEgpv2NYBv+v
         dQgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=rzZaQ6s2L8HTP/N+G7lyZXAfcU7PndFNzvU/KdGwi9Y=;
        b=onFok8uo1DVqDX3/+eah3lZG8nOgiiFhlGP/vI4XPbqFq14NGiHtLJgiwK+vhHn+UT
         87S4rFl4Gukc9yzTQf5nqi4/OdxB89h/TnHEkaZ/DCaTHtT5Udc1V6zyQNB2tfs+tlE+
         SnUpfuzAljfpxjYeNWSeIjPc5mBB6ZCoK7shTkgNSR/EEHK/xrXbkA8Z8zYNZkmKrRdA
         HskNlNctJ5Yz3zdZuLNCJr1Zdjmvu022Tv9KaDdzilTX3K0uhc0awtINvRLMmTR+tG0w
         Sug42oHncknqmoGazanLUbYNGaFzb9EJwiKXxn1tzUWZDcvL0arfp0s4gUSK+gpmg4bH
         CwXw==
X-Gm-Message-State: AOAM5310cZX3klamKdNbgA2fhjEyFO0wmTYSEYtugYJRPLc7CHWlvr7O
	yNs7cvmyCQd647AfaMIzGBNN5w==
X-Google-Smtp-Source: ABdhPJweINsp2xPplWcV/+0/jpRqDBMONwmRcfnXbq5OUUxaouSweFzLLHnl0sy+OcrlhnZhe5uGpA==
X-Received: by 2002:a5d:4143:: with SMTP id c3mr6512603wrq.29.1629117553329;
        Mon, 16 Aug 2021 05:39:13 -0700 (PDT)
Received: from google.com ([2.31.167.59])
        by smtp.gmail.com with ESMTPSA id r129sm10460277wmr.7.2021.08.16.05.39.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Aug 2021 05:39:12 -0700 (PDT)
Date: Mon, 16 Aug 2021 13:39:10 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Rob Herring <robh@kernel.org>, Icenowy Zheng <icenowy@aosc.io>,
	Samuel Holland <samuel@sholland.org>,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@googlegroups.com,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	Ondrej Jirman <megous@megous.com>, devicetree@vger.kernel.org
Subject: Re: [PATCH v8 01/11] dt-bindings: mfd: axp20x: Add AXP305 compatible
 (plus optional IRQ)
Message-ID: <YRpcboGSk+WyLLy8@google.com>
References: <20210723153838.6785-1-andre.przywara@arm.com>
 <20210723153838.6785-2-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210723153838.6785-2-andre.przywara@arm.com>

On Fri, 23 Jul 2021, Andre Przywara wrote:

> The AXP305 PMIC used on many boards with the H616 SoC seems to be fully
> compatible to the AXP805 PMIC, so add the proper chain of compatible
> strings.
> 
> Also at least on one board (Orangepi Zero2) there is no interrupt line
> connected to the CPU, so make the "interrupts" property optional.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> Acked-by: Rob Herring <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/mfd/axp20x.txt | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
