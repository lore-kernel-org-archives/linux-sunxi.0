Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 834D22CA6
	for <linux-sunxi@lists.linux.dev>; Tue, 14 Mar 2023 20:39:40 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id cy23so67100074edb.12
        for <linux-sunxi@lists.linux.dev>; Tue, 14 Mar 2023 13:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678826379;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eyGDngrrwWPIxM672XPjRQ30S2ESLoP5nSFza+5+EjM=;
        b=ira9xGzR5hc5JCLwYudB3eScpSTpIR1m3fFtid/a4uiUsh60E5TccV9mT9GqIRGvTA
         ZBC1Ve9rKaJugz4BN1xuyUIYbqCsu+fR4bZaGy4jCKHjTynqS8xBQJcmRtmfgu+vJhkW
         9Umxj5WlrcDEdj7qkWWgwSWB8WnSKU/jl0x60hhm53DRKG3WDCJuahcZ60B+SXC+UnJ9
         hg39wRIM+p9zIGrQr/rAsKckTzjddFwa31DvnGkKx5A1c+O3ow9Jf4OGFnpbuYrzhrRl
         QEvNLRub4WjHnlZAvWWR1Az7UUJZsr0EGN5eyiFNzg03S3JeoQaVprddoOZoY89Ijm51
         oucA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678826379;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eyGDngrrwWPIxM672XPjRQ30S2ESLoP5nSFza+5+EjM=;
        b=IV7ukSpLaCOgmQJlKz0qG3Iu10fvqecETgE9YMTsLTCcDzJd16WcGmmlsjyNqaW0vK
         2MBFYeKdWsmePA3jXnjUvN+RIZbm5aRvi41JFgg2kpFbZVoO+obMm5rIEE4sSmwZLzfD
         WO4zgE4N3lFYTadmHxrBPEgg+arWP+s7eIogBt8fDCVXPHyiznUeBFHw1ykjaIZRWRdE
         iSsKsEbfjTNgCb/9q83Q/cPr+xvOr+pNhBlhpUOLX+ZRp+3eJg4bfVNx4XK82Ze22272
         clCVM7yCX6toXvTRxh+U3cvyMusRCbUlCH0mTs8jOxA/m9RwX+9DR9slhBt7NfOmU7ab
         1upg==
X-Gm-Message-State: AO0yUKWjoKyP4k3k3eanayZHslMbmf5nJvxOFyWbOygYLabV5GWza/k0
	knV2gzlbfnShBvV1XYK4aTg=
X-Google-Smtp-Source: AK7set+jrinMC6MRWeB656rnwC53S5/VJ5Q9JOypzJTH2TzWrlXJpiKs0oeno7Fxr9N470ge1c/y+g==
X-Received: by 2002:a17:906:8506:b0:87b:1be:a8c2 with SMTP id i6-20020a170906850600b0087b01bea8c2mr3420089ejx.73.1678826378788;
        Tue, 14 Mar 2023 13:39:38 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id mh19-20020a170906eb9300b009200601ea12sm1552934ejb.208.2023.03.14.13.39.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 13:39:38 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: mcgrof@kernel.org, Nick Alcock <nick.alcock@oracle.com>
Cc: linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org,
 Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 12/24] kbuild,
 soc: sunxi: sram: remove MODULE_LICENSE in non-modules
Date: Tue, 14 Mar 2023 21:39:37 +0100
Message-ID: <45375953.fMDQidcC6G@jernej-laptop>
In-Reply-To: <20230217141059.392471-13-nick.alcock@oracle.com>
References:
 <20230217141059.392471-1-nick.alcock@oracle.com>
 <20230217141059.392471-13-nick.alcock@oracle.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne petek, 17. februar 2023 ob 15:10:47 CET je Nick Alcock napisal(a):
> Since commit 8b41fc4454e ("kbuild: create modules.builtin without
> Makefile.modbuiltin or tristate.conf"), MODULE_LICENSE declarations
> are used to identify modules. As a consequence, uses of the macro
> in non-modules will cause modprobe to misidentify their containing
> object file as a module when it is not (false positives), and modprobe
> might succeed rather than failing with a suitable error message.
> 
> So remove it in the files in this commit, none of which can be built as
> modules.
> 
> Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
> Suggested-by: Luis Chamberlain <mcgrof@kernel.org>
> Cc: Luis Chamberlain <mcgrof@kernel.org>
> Cc: linux-modules@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>
> Cc: Chen-Yu Tsai <wens@csie.org>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: Samuel Holland <samuel@sholland.org>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-sunxi@lists.linux.dev

Applied, thanks!

Best regards,
Jernej

> ---
>  drivers/soc/sunxi/sunxi_sram.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/soc/sunxi/sunxi_sram.c b/drivers/soc/sunxi/sunxi_sram.c
> index 92f9186c1c42..21116d47d26d 100644
> --- a/drivers/soc/sunxi/sunxi_sram.c
> +++ b/drivers/soc/sunxi/sunxi_sram.c
> @@ -421,4 +421,3 @@ builtin_platform_driver_probe(sunxi_sram_driver,
> sunxi_sram_probe);
> 
>  MODULE_AUTHOR("Maxime Ripard <maxime.ripard@free-electrons.com>");
>  MODULE_DESCRIPTION("Allwinner sunXi SRAM Controller Driver");
> -MODULE_LICENSE("GPL");




