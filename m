Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 733C52586
	for <linux-sunxi@lists.linux.dev>; Mon, 27 Jun 2022 09:27:54 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id bn8so10280556ljb.2
        for <linux-sunxi@lists.linux.dev>; Mon, 27 Jun 2022 02:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gN3nF3XcouQL/cVCpyx7ZrlwyAQWaFQc+AC2iPUl3mk=;
        b=Gw1BickyXa7Ce+fFAWhaiKOGyn/Ah2/OoU0nK39dLFFciUiKFIdcRZ5jDssYLCuHPR
         FwpniWrQDHoEm9VGihHYvFe17m+e5YvDOgn8Fmjknqj+UXZMmHUXd1Onzl85iOP521FX
         u8lH/OGKBT+Asad5yTRQthKajwIwl6lg9OH8IPFdhvhB6tq5yPMDyF2iW+Of+KyWGPR7
         bY/Q2CjNrhe2371DdxVCx8/rV7wanL3+/XRC533IG3KtnRoZHaXqgDqMPsRiBouolAkI
         cnMi8sjW6+bMt5BOhzyqpCWAYy+x6b+SYqYqNFgm8fzMVTyHJK5RKTvxx258VqXOQY4Y
         kPng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gN3nF3XcouQL/cVCpyx7ZrlwyAQWaFQc+AC2iPUl3mk=;
        b=bm6O5PCcLRNv5UB5yAIFLJBO7FV1aui3uuiRf9qNvNMzGk0do8wbExOEhY6By3reaM
         Ve5c7Ms81WaMwT1uVc8iMbTgHYlvmVyc4D3LV8fmu3+tg/tUbcYt1Fd0bmo1sIQvdqY3
         sUxZy41O4vrSdwCl2t+bhu4adCDOHB6ceCtubFtDO0+Z43bEMh97ZTkkjfWNgI18GvI3
         vc3evMnd6m/0VflXB6JMAucif7O4skiSKnf0ut/cpzi7KpBuCW9vk5c8fPe+/uCKeSQS
         O9MY+Zakj2aJwidOSjHagnud7z1QBrSGidUcxTOhJbgFkH4VEe5LXdOctp3aYSgGUTbp
         6aOQ==
X-Gm-Message-State: AJIora8m5b6zY3ZaWR+iIKWouF4/XAdVrAhTpCyRKCfpSRHHG57pLmmd
	a3m1Axb6wO5XWiBxpRklb/NjzOkbcCdGNs0A37Qlfg==
X-Google-Smtp-Source: AGRyM1tVSsjXPe5++ARLNUhpuau2SGj30HOReNKHpIbE86XK/nqCBFBRZKRvYgV5dc1Syd6xxcDne5wD4klkN/GDrd0=
X-Received: by 2002:a2e:9f12:0:b0:25b:ad89:80e8 with SMTP id
 u18-20020a2e9f12000000b0025bad8980e8mr5880429ljk.145.1656322072538; Mon, 27
 Jun 2022 02:27:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220525190423.410609-1-andrey.lalaev@gmail.com>
In-Reply-To: <20220525190423.410609-1-andrey.lalaev@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 27 Jun 2022 11:27:41 +0200
Message-ID: <CACRpkdY107+sT60D3iuPNhXCx48cWKm953tq4Uso8+n4mwvO0A@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sunxi: sunxi_pconf_set: use correct offset
To: Andrei Lalaev <andrey.lalaev@gmail.com>
Cc: wens@csie.org, jernej.skrabec@gmail.com, samuel@sholland.org, 
	linux-gpio@vger.kernel.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, May 25, 2022 at 9:08 PM Andrei Lalaev <andrey.lalaev@gmail.com> wrote:

> Some Allwinner SoCs have 2 pinctrls (PIO and R_PIO).
> Previous implementation used absolute pin numbering and it was incorrect
> for R_PIO pinctrl.
> It's necessary to take into account the base pin number.
>
> Fixes: 90be64e27621 ("pinctrl: sunxi: implement pin_config_set")
> Signed-off-by: Andrei Lalaev <andrey.lalaev@gmail.com>

Patch queued for fixes, sorry for waiting so long :(

Yours,
Linus Walleij
