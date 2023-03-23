Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E62C93C04
	for <linux-sunxi@lists.linux.dev>; Thu, 23 Mar 2023 19:17:09 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id r29so21689295wra.13
        for <linux-sunxi@lists.linux.dev>; Thu, 23 Mar 2023 12:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679599028;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wD2pfR6a+QFkJUD1LZwOcKI2Fua3cr9bcJ10Kcm3zLA=;
        b=qnXXXzNCoIXEQ6wOEeCqW/WZqBHnKQLvRQfR9H2JOK9xUFyYzxjrnD6R9IuVZ6HtjL
         xiNyLpz3xXZUbWhjuaxyupx+2ZS33wpZ6LWFrVihxrXuYTl6S382fY4t053jIsGXaqXt
         daQnXnG6cVPzkWg+2mjtapDfgpj8w7NhSIC/LI6KwMCmdBNg94fw43wNEBOkPQgr50+W
         SMGgGeH0a4JbPB9UDMfknMj7qqBLgYA+kzs/dYb0pgQ1HmQf/3XcgzdmRKW5Q/pQXRpj
         geVjnc2EHwBkFUo6o1/ldaGNiGMD3/Bu5XYhl/Pxptm78TkO+8nUvSEsLoeHFn86uNml
         inPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679599028;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wD2pfR6a+QFkJUD1LZwOcKI2Fua3cr9bcJ10Kcm3zLA=;
        b=hZROrOYfbB19det4Sp/xWd7bFEcw6ZVn/tJgyHqQJaRp4rXbrWtdW4Zz+dGcARcArI
         iRsxHiJSgHcOhwpqTAcvRqeX2nvfETcO8oeaodCGBvOjVLTVdKZmLOEhsT2UmCn6srsy
         HF1Nq5WDTFRwOkbOk43/aacvqwe3Th0Zt+jQJLxDEl18M8rLEp999GIl5wJPZuRGjfb2
         A6o/JhO3AjQAejYK5Mxe610eil4Pa8IldDXHNwpS9D7RwNhNNE3j5+3IOSpbRt6weTQS
         kJ4nV4aSGbUmofPkS6aPVPARNdocaXIEen0ZXByNGt0SIORrhcVudf04lN1Y45GE9Yuj
         h2KA==
X-Gm-Message-State: AAQBX9cWuylbZBGa895csixnaTcatOR9zZGmtmUDelh5oT9YkMUKgGRs
	Cwni5k1Ta8V9nVST25hABYQ=
X-Google-Smtp-Source: AKy350YRHwccofReqO7KMNu53kmkrUhXKNUEyMNpqFY9KG1erFeS8JTEci/WaxonV6iJnQofws3suQ==
X-Received: by 2002:adf:f491:0:b0:2ce:da65:12d9 with SMTP id l17-20020adff491000000b002ceda6512d9mr237685wro.15.1679599027928;
        Thu, 23 Mar 2023 12:17:07 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id e7-20020a5d5307000000b002c5a1bd5280sm16725043wrv.95.2023.03.23.12.17.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 12:17:07 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@csie.org>,
 Andre Przywara <andre.przywara@arm.com>
Cc: linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, Icenowy Zheng <uwu@icenowy.me>
Subject: Re: [PATCH v6 5/6] ARM: dts: suniv: add device tree for PopStick v1.1
Date: Thu, 23 Mar 2023 20:17:06 +0100
Message-ID: <2274644.ElGaqSPkdT@jernej-laptop>
In-Reply-To: <20230319212936.26649-6-andre.przywara@arm.com>
References:
 <20230319212936.26649-1-andre.przywara@arm.com>
 <20230319212936.26649-6-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne nedelja, 19. marec 2023 ob 22:29:35 CET je Andre Przywara napisal(a):
> From: Icenowy Zheng <uwu@icenowy.me>
> 
> PopStick is a minimal Allwinner F1C200s dongle, with its USB controller
> wired to a USB Type-A plug, a SD slot and a SPI NAND flash on board, and
> an on-board CH340 USB-UART converted connected to F1C200s's UART0.
> 
> Add a device tree for it. As F1C200s is just F1C100s with a different
> DRAM chip co-packaged, directly use F1C100s DTSI here.
> 
> This commit covers the v1.1 version of this board, which is now shipped.
> v1.0 is some internal sample that have not been shipped at all.
> 
> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


