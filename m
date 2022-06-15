Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C86927A
	for <linux-sunxi@lists.linux.dev>; Wed, 15 Jun 2022 13:18:07 +0000 (UTC)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-3137c877092so60272247b3.13
        for <linux-sunxi@lists.linux.dev>; Wed, 15 Jun 2022 06:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=E6V4Ue+dndzuDT7j3moByTJo3sQjDjIr/li3Bn3qA9k=;
        b=zGD1COlS5dQINR9FxGh1mSbulwGX0JEeM6g5U1JVj2GjCOFw0RWsLtrNqnmUBYbhn9
         Ds97zfYou14tPKByWr5FiR2h4qFTmzhkch9+rj1SAo92vLZJuac2oJW86i16EHu3lvpu
         0XqZCFYyjB9O5ZMFHFyLP2O8K/BWIUgDozW80GCCZusHzl5vzCYM5P4N5F/uI4tIrNqH
         rqXXaSmS1IqcMSDGR2nB6hVLOtmOzlbz8tZhT595nDXr1MSIegKbd2ssDdkregLeW5oR
         5XvlaGL4XHzYriIG+YQ4uib0qDzAnsKu7r1uaJii9rmBI9eJcpKvNVrFc1MIKDUsVc5h
         T85g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=E6V4Ue+dndzuDT7j3moByTJo3sQjDjIr/li3Bn3qA9k=;
        b=MCD6QP6gLnESP3hsK20o9COIy7U727vrIkNx/XpaGTaZ/jP6+no4zyJ34rLfrtQTBp
         +PfYw55L7/ccNyn7xVHcNvWqHvMtRztnUIaa51J6g+dxbi6KtJMYTHUCRicQVOw6dbVq
         F2eiwGWD/SeDG7xL9KDbmTdl4iIB5RSzf4dPA7rwswQ3HL/Y/HIWBXMtcJ+mvVdCxwYm
         eNo9kB0Sh/cepPYRJr3dgIJ0tZrbiy7yaRdPFK3Wb7ixVhVQTLWuhhKBXtW1GG/hYjAk
         Pgi+uXo7MpUo2o9DoxFZqKjfv8O37qXNqerNZkQFyTciQKoaDuEY2eQp5BGAR3JHpX1n
         9a4g==
X-Gm-Message-State: AJIora8pQ9XPsRY+EwKBDvx6hRx5+ZN1zhVmG8RJj80Pf3x12u9NpmQv
	1K2X1RnE1gXC3K+Fqn5CM7ec70A07w9/7U7MSTxPKA==
X-Google-Smtp-Source: AGRyM1v5bjntVwpzPV9DDMEuPHXjhLnFsrSsCYkao4d93p3BkffDo3oHs8NbOrG7qCLG7pjh26QW8ztV0Ytmnytapcg=
X-Received: by 2002:a81:a00b:0:b0:30c:5c1a:19f with SMTP id
 x11-20020a81a00b000000b0030c5c1a019fmr11550606ywg.437.1655299086690; Wed, 15
 Jun 2022 06:18:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220525190423.410609-1-andrey.lalaev@gmail.com>
In-Reply-To: <20220525190423.410609-1-andrey.lalaev@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 15 Jun 2022 15:17:55 +0200
Message-ID: <CACRpkdbfJhwee-dnkhE3=ijiLcSx8seVxoKPzyZ_n7bz=TkU7w@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sunxi: sunxi_pconf_set: use correct offset
To: Andrei Lalaev <andrey.lalaev@gmail.com>, Andre Przywara <andre.przywara@arm.com>, 
	Yangtao Li <frank@allwinnertech.com>, Maxime Ripard <mripard@kernel.org>
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

It fixes a patch by Maxime so want Maxime to ACK this if it should be
applied. Paging Andre and Yangtao too, would be sad if we don't apply it
if it is a necessary fix.

Yours,
Linus Walleij
