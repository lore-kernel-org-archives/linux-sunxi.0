Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58E81256A
	for <linux-sunxi@lists.linux.dev>; Tue, 17 Jan 2023 13:13:07 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id v30so44989524edb.9
        for <linux-sunxi@lists.linux.dev>; Tue, 17 Jan 2023 05:13:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xmuOuYRyFtetCHYAvPV6k6jidoM9dZnG/NnQbrCCtKk=;
        b=Hj3upUNpp8HBEUdHpu02G8rYh0bK9BWEKaBriEoU9wxpfm/Nou/Eubt8jqLlt6w4bS
         5KCTpb2uCxezXr5RNC2niBhyXvK8tHRZ0HKYpGsZH/VDelG7YUJqBoOFa9BNC6AxuIQr
         WSpfoLbIa41AEgc+Ecr7ZxfyrrQQtFqfLfelgomqouvr1me68smE7Gh/X1Obdp6xrFsf
         wZKZKWMEjTb/BcU8mu15Gsjbj1jVEOgPnoyil5T/fpSIuWvO4UEoU+sESbNCxLw7gRxp
         i1D32ih1pBi2yQ/tgvP3lVx3dpU+Jw6NltHYLfsQgec74SZzjiRqCXqPe9HQ1acrckpR
         G8Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xmuOuYRyFtetCHYAvPV6k6jidoM9dZnG/NnQbrCCtKk=;
        b=2VRwaKMUunuY7WFmNcbaGtldRpqCUEsKta/8tQeUDq3Vm12lF/rEQWewQPJ2Y6W6rj
         TaTG6PD8/BdzQ/DeZZN/ZN/HmarVwThrDZrmgkKo2ohgTr5V3anjFELO04NLbKFGk92G
         Ayp08hahpFLEdcCWu/ybyl4aTvDUmAu7HtibG/BKLjIzbQPOamxu37ONpaAScsWnU8Jq
         gVnOWW4rcGeOIjJDuDxu+nMT9P3As+plLhdt4oabJrmQyOyKwT8BYxvZ7FiYk2jrP3zu
         g4ksrTjQhJRO8MOf2RLHDNc+SM9YU7jT7C0c4msII9sv5mVoaRBl9w260gdQ0CyyaarP
         Rd2g==
X-Gm-Message-State: AFqh2kqwXZbg2AKrxdk5EJZVhqK9VjuOdYualUy1xWDi5ksM9XrsUbFo
	l8fUaN1pcI0xTZo3kMKSQ3Yfb3bDFStcDQElHM4=
X-Google-Smtp-Source: AMrXdXt5jlgS4UHsUWf7YK63dCKY/4p02hSYgSMCyg46yznqglnPNaHt+hlBF09UzJlHPCtKJHqTyEW0mXtaSPLQQdA=
X-Received: by 2002:a05:6402:248f:b0:49b:589b:ffbd with SMTP id
 q15-20020a056402248f00b0049b589bffbdmr351173eda.326.1673961185498; Tue, 17
 Jan 2023 05:13:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230117120938.818180-1-andre.przywara@arm.com>
In-Reply-To: <20230117120938.818180-1-andre.przywara@arm.com>
From: Sergei Antonov <saproj@gmail.com>
Date: Tue, 17 Jan 2023 16:12:54 +0300
Message-ID: <CABikg9w9U28WMY9rS8dQwKpz9qnNu5i2_270U=SOLmHf=ZXw=w@mail.gmail.com>
Subject: Re: [PATCH] ns16550: Fix DM serial operation with non-DM SPL
To: Andre Przywara <andre.przywara@arm.com>
Cc: Simon Glass <sjg@chromium.org>, Tom Rini <trini@konsulko.com>, u-boot@lists.denx.de, 
	linux-sunxi@lists.linux.dev, Samuel Holland <samuel@sholland.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 17 Jan 2023 at 15:10, Andre Przywara <andre.przywara@arm.com> wrote:

> -#if CONFIG_IS_ENABLED(DM_SERIAL) && !defined(CONFIG_SYS_NS16550_REG_SIZE)
> +#if CONFIG_IS_ENABLED(DM_SERIAL)
>  /*
>   * For driver model we always use one byte per register, and sort out the
>   * differences in the driver
>   */
> +#undef CONFIG_SYS_NS16550_REG_SIZE
>  #define CONFIG_SYS_NS16550_REG_SIZE (-1)
>  #endif

What if I have DM_SERIAL and a 16550 UART with 32-bit registers?
Before 9591b63531fa the register size of 8 was enforced for DM_SERIAL.
