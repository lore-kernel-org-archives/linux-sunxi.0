Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2B6B3484
	for <linux-sunxi@lists.linux.dev>; Mon,  2 Aug 2021 07:40:30 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id n12so20314853wrr.2
        for <linux-sunxi@lists.linux.dev>; Mon, 02 Aug 2021 00:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=Sx9QXrg4ZNFSGE92YcBO2jMOLGSWdnZV3pnibrZPh18=;
        b=tjPY7t2oR2UaAFYwIndaYLJrxtKaLgx0xJHGU690X/w0JyP0SJVTWiDBbUtaidytVs
         Ba7i1xxBjGDw/FYNL0WWyTKW7N/jYfcO5MhIiE9KgX8mpzZkotAX7dZHhm35ebvLaM+s
         FoNIkvTQc/nctsx1iucIKw9tk+C+SCjF4iEEjoQhwQt5EXRAz5BXWAathnoIRYbBmknp
         hd81KqsKFs3D6GQ4zPiMvs/PtYoYQ53Ug3qkukoCn1MQzjryBW6EMvl6o7O/uif8FhkD
         lR+8adTcSJq1Q+pb8tP8j8RaOjfbrnZ4NR3hesMGtXobwidLlf04R7UadvEdISDLoBVp
         acVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=Sx9QXrg4ZNFSGE92YcBO2jMOLGSWdnZV3pnibrZPh18=;
        b=mkmyrlgQmT3+DwYC0LmXLehlJ+DsWMc99c3a/WJd10AC4CccfWayP9Kv6lN+FUqHoN
         fiY1cDshpse2MBde93nNGr5N+yPSUVM2zxwn1v/mxOXPmpQ8AdeeQJkBpgOizyIqgs3A
         M8CCawB4jBGDpwu9PYrVJl+87/ciklwe26PYwLPYujOIv9FzAV1/ioeiuuJl5BtbE/C2
         l/7fJrkoaUBpkBKHJfBPopNSPTIBqW8VgwmGwZgfvpDLF3SNz091aIlobL7IEiQ7V9Bm
         hvQ0Zw6dZRUrvJ01hw7W+YefhHSZXsLsWrU9Nf/YJBevFKIt7RniAC9NePLVVtQqnmgN
         SDAA==
X-Gm-Message-State: AOAM530q3iSXK4SLO5bs+CMlt1NQCA0Kfl/1I1FtscarLDJFYHLBSd5j
	Y6gK83ezRl9XcYgBEowk//P+PQ==
X-Google-Smtp-Source: ABdhPJwzsCg4tOXIFL2wAorTekhNfCSV3oJxRI6RVF//Uj3BHQ5IEzgTt52YzmGvSSSOzWlDua+sxA==
X-Received: by 2002:a05:6000:1867:: with SMTP id d7mr8862526wri.393.1627890029108;
        Mon, 02 Aug 2021 00:40:29 -0700 (PDT)
Received: from google.com ([109.180.115.228])
        by smtp.gmail.com with ESMTPSA id o22sm2087782wmq.3.2021.08.02.00.40.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Aug 2021 00:40:28 -0700 (PDT)
Date: Mon, 2 Aug 2021 08:40:26 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Rob Herring <robh@kernel.org>, Icenowy Zheng <icenowy@aosc.io>,
	Samuel Holland <samuel@sholland.org>,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@googlegroups.com,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	Ondrej Jirman <megous@megous.com>, devicetree@vger.kernel.org
Subject: Re: [PATCH v9 01/11] dt-bindings: mfd: axp20x: Add AXP305 compatible
 (plus optional IRQ)
Message-ID: <YQehakgWk/sp92to@google.com>
References: <20210802003952.19942-1-andre.przywara@arm.com>
 <20210802003952.19942-2-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210802003952.19942-2-andre.przywara@arm.com>

On Mon, 02 Aug 2021, Andre Przywara wrote:

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
