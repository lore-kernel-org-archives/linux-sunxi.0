Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B8BA21CDD
	for <linux-sunxi@lists.linux.dev>; Wed, 10 May 2023 20:54:36 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-50b8d2eed3dso11837798a12.0
        for <linux-sunxi@lists.linux.dev>; Wed, 10 May 2023 13:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683752074; x=1686344074;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Schew7/1f6L1gKiDAa1E4oOxjUrtaVYHdw6xtsV4v+0=;
        b=rQ3v3bvNEW/TP+71y9yt+8ogek9+za16jzuA+0/1P91JuEJ4Uop02XoElQdJXpWvPv
         JVJ4tTGsi1CVb1nbaOOCfIYDSKpzZJ8AP5b1geWol42wwfc+DY910ja+7+Ly7PVelY3r
         fLyiu+VChaYZ16zJtsMbYzsAtS06tkRsvwTtJXsCO7hY2UPDqcCVRJaxmOmQ/vaH1KFw
         f0pzYkubO9WKVKfBTO7SeOfGJHoOJr2CsE8TMkmq1kXDaGqxz0PP3fuaCgtud/Eyr6VC
         wRwl/agFRerBpel/Hc6TzPoU6vzOHmce93eOcBZNsSCleENVdSPnEu3jJ2TeqfY4gZjx
         zJZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683752074; x=1686344074;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Schew7/1f6L1gKiDAa1E4oOxjUrtaVYHdw6xtsV4v+0=;
        b=YkeKdWX5n537CD8LppXt+2zxA9X4YSsmj0w+CqZ2EZtxdtyBD5EyFIwjxWb6/KR5ko
         WWH43CSjETRU/PncSXi7fpdxZANp+8SLYVM1qBt9wr39LQN3RAX6ady8azKZcbfd8uhn
         lJtQMbhJ+nDn3DzizUsDdoZRhp03jKL15hEtNqRPfJyR4K1n9QXHLooGESPVNAs7wCkB
         XqELNnRTO55NDCGOWczEOsYDufyMmXTF95tF2EfyGY1pyjihQmN5LwL9lSEXXHAlZ85V
         nqO5J2hWWTxH4J2o7srGRxcBnC3FQ3ZnRdx4cWABvRot7e3RZVQfnkwuY+8Fg/S3NIRX
         wYXA==
X-Gm-Message-State: AC+VfDz4CX8CF8UIzBi0EvNTm6iSAG4+DqtBV6c/Zk56qzrY3CkgMCAK
	09Jch2BsbnU84QO0Pfgtiew=
X-Google-Smtp-Source: ACHHUZ7HN36RSXe1y/LhN2y7JSVz5OGcyYIMQaUDQczYtNLp41YDSovvtoyFOkx79Si5DjsLAjjNqg==
X-Received: by 2002:a17:907:98d:b0:94e:cf72:8147 with SMTP id bf13-20020a170907098d00b0094ecf728147mr17485950ejc.48.1683752074142;
        Wed, 10 May 2023 13:54:34 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id h9-20020a170906584900b0094e597f0e4dsm3059489ejs.121.2023.05.10.13.54.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 May 2023 13:54:33 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 linux-sunxi@lists.linux.dev, linux-clk@vger.kernel.org,
 kernel-janitors <kernel-janitors@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: Re: Situation of CONFIG_CLK_SUNXI_PRCM_SUN9I
Date: Wed, 10 May 2023 22:54:32 +0200
Message-ID: <10272596.nUPlyArG6x@jernej-laptop>
In-Reply-To:
 <CAKXUXMy3_krgwHMS6TaDZhBePkaHTHigntwBD0WFxMJ=DtgWYA@mail.gmail.com>
References:
 <CAKXUXMy3_krgwHMS6TaDZhBePkaHTHigntwBD0WFxMJ=DtgWYA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Lukas,

Dne sreda, 10. maj 2023 ob 07:38:04 CEST je Lukas Bulwahn napisal(a):
> Dear Maxime,
> 

I don't see Maxime in recipients...

> with commit 49c726d55c1b ("clk: sunxi: Add Kconfig options"), you
> introduce various build configurations for Legacy clock support for
> Allwinner SoCs. Among them, you introduce the config
> CLK_SUNXI_PRCM_SUN9I in drivers/clk/sunxi/Kconfig, but this config is
> not used anywhere in the kernel tree.
> 
> Can we just delete this config CLK_SUNXI_PRCM_SUN9I again, as it is
> not needed, or did you simply miss to adjust the Makefile for this
> option to be effective?

I think this is the best approach. If it wasn't used by now, it can only make 
further mess in distro configs if introduced.

Best regards,
Jernej

> 
> I will gladly send a patch, once you could give me a quick pointer.
> 
> 
> Best regards,
> 
> Lukas
> 
> Note: This is a resent email (see original email:
> https://lore.kernel.org/all/CAKXUXMzqCktKz7vGN4_QAp4n1SeP0-YHL19evmVSfseZOem
> d5g@mail.gmail.com/); now hopefully with an email address for Maxime that
> reaches Maxime.




