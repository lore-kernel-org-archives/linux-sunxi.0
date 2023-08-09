Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3D2A24535
	for <linux-sunxi@lists.linux.dev>; Wed,  9 Aug 2023 22:08:18 +0000 (UTC)
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-348ddac3a09so3763785ab.1
        for <linux-sunxi@lists.linux.dev>; Wed, 09 Aug 2023 15:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691618897; x=1692223697;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v+MXz1RLmfvZ+5SjeM9t7ATr5unIctlDmy/516rofTQ=;
        b=BkOPcvbNM1MyjqCV47zZcpvHP0L8xMcIfxHOCRNmRIssh6kQj6xtk17HaMgqjuC0Fw
         SjL6Ts1zRE6iu2Fuu7vv3kiIrQjZAJWrxJmh93FrhNjDdFctV7LIyG6DsycG4nwPYd7r
         UA7dL+2vCdsQAlhLh3Z7cD0C3jTeGz7aHRqN2Kn5IiVI/cPAp6TiNlhM8e6nrNfSVKF4
         nPZ8FvBXnIM+WVZJ/9pNyuBZrIjG4EiQ1t+trHUxxlChaKz/ADRS/0sb1N+Uyn2+6B+o
         Dx4JN4SXCbbhTX7c3Q/WDxlk4wGtkeAsL62kCRyzi8urKX0zVcVsju6WBKKvGN6Aav4A
         x+1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691618897; x=1692223697;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v+MXz1RLmfvZ+5SjeM9t7ATr5unIctlDmy/516rofTQ=;
        b=LyIkuEdnceK3ZuKP0V7lnYMDGSmHdrvnYMal5ENCbKIKan7oSzJ5w+LrhnqZc2YrGT
         8uzVMHaUw2ZkP1wdEYC0v+yQmHuqE/64dy/NLKFh+BL/eQddmaB5gO4KQaWsHhcwZIj1
         2MVMKQwpR/JpkxTaoxwPFUFVVRRc9+PNU0CEAhgMfJs7RiJKb4qV1+p9gSsK5E10AAmQ
         a6jDBLzWZxUbtFa2I5p7aB8hJFKwxEHHjA71FVxOARYdDlakyw6vevZ5QGij1WiZRkgs
         F+fnlHCywwCRTpXGpk6B/Jm0ZV5MCIe6MRkLArwvgUotBgamFNwEKwJsjbb1fMjc5Xr/
         9ANw==
X-Gm-Message-State: AOJu0Yxuclh1fQAvLI0/z/MIUp5vjvuECwIxGlysp1VArRiyzykNTPkA
	3ffYCAk0XjyzFvnAg8Cxa21p5znvcb1jPg==
X-Google-Smtp-Source: AGHT+IG3ZBgnvssZsNkX/sbeTAZueQP3Efqh2lktZNAO3erYz4T9/hS2yekVD7kuQ8gs3UH6OM/cRg==
X-Received: by 2002:a05:6e02:1308:b0:348:76eb:17d8 with SMTP id g8-20020a056e02130800b0034876eb17d8mr217058ilr.6.1691618897661;
        Wed, 09 Aug 2023 15:08:17 -0700 (PDT)
Received: from ?IPV6:2001:470:42c4:101:6e71:1f10:2120:d11d? ([2001:470:42c4:101:6e71:1f10:2120:d11d])
        by smtp.gmail.com with ESMTPSA id el18-20020a0566384d9200b00430a69ea278sm4164405jab.167.2023.08.09.15.08.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Aug 2023 15:08:17 -0700 (PDT)
Message-ID: <5ad275dd-9d60-0f96-bee9-678325eb0a16@gmail.com>
Date: Wed, 9 Aug 2023 16:08:16 -0600
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 08/20] sunxi: introduce NCAT2 generation model
Content-Language: en-US
To: Andre Przywara <andre.przywara@arm.com>,
 Jagan Teki <jagan@amarulasolutions.com>, u-boot@lists.denx.de
Cc: Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Icenowy Zheng <uwu@icenowy.me>,
 Maxim Kiselev <bigunclemax@gmail.com>, linux-sunxi@lists.linux.dev
References: <20230721134606.4505-1-andre.przywara@arm.com>
 <20230721134606.4505-9-andre.przywara@arm.com>
From: Sam Edwards <cfsworks@gmail.com>
In-Reply-To: <20230721134606.4505-9-andre.przywara@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/21/23 07:45, Andre Przywara wrote:
> Allwinner seems to typically stick to a common MMIO memory map for
> several SoCs, but from time to time does some breaking changes, which
> also introduce new generations of some peripherals. The last time this
> happened with the H6, which apart from re-organising the base addresses
> also changed the clock controller significantly. We added a
> CONFIG_SUN50I_GEN_H6 symbol back then to mark SoCs sharing those traits.
> 
> Now the Allwinner D1 changes the memory map again, and also extends the
> pincontroller, among other peripherals.
> To mark this generation of SoCs, add a CONFIG_SUNXI_GEN_NCAT2 symbol,
> this name is reportedly used in the Allwinner BSP code, and prevents us
> from inventing our own name.
> 
> Add this new symbol to some guards that were already checking for the H6
> generation, since many features are shared between the two (like the
> renovated clock controller).
> 
> This paves the way to introduce a first user of this generation.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
Reviewed-by: Sam Edwards <CFSworks@gmail.com>
Tested-by: Sam Edwards <CFSworks@gmail.com>

Thanks,
Sam
