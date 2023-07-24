Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA6C71FB3
	for <linux-sunxi@lists.linux.dev>; Mon, 24 Jul 2023 10:54:55 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-99313a34b2dso620604666b.1
        for <linux-sunxi@lists.linux.dev>; Mon, 24 Jul 2023 03:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690196094; x=1690800894;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gI3K+gWjupnLtBZp2GGMbX/bKamBXSfBY9DgIsn9yNM=;
        b=SEssI9sN3jMzuye4o30YXXp7JWh8BngzD5VqDcOA5tl9h6HH2oXfUvHSNQmVSIng5e
         DFeqY4PXC1C5mzxyxsXNzCFz3uPdfC35M/mLxam5wm0kAfyXe/t+OD/9SjGe2RP6juwX
         GyP2TYzWos4GNcup5FhPJmGkSZ23DymTZ2ZDRccz3uUvaTLq6r02PdV5KsoVfaZ2bp7U
         av3aHRhGEi7VkjyTQPTbwigjGmU0bhZcMjp9/mE7UrDSCU+DDsWQfjCwQlTpLgp4q5os
         vzWl+MTG+WPmz7BSJxBpMZwtMu1SugqtJGqLo65RX2SYZFmYhSf/02jmi1IVStO7zYUI
         7hGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690196094; x=1690800894;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gI3K+gWjupnLtBZp2GGMbX/bKamBXSfBY9DgIsn9yNM=;
        b=KluMsSv39vjZHMbqY5ceMnojYMSn6q4hXX8LJUBQHm+8D7pi8fBtwouGV5StA0dF+A
         n8H1CGySDfSLiwyqEJemIxRlV54pGuI98pMcwBTdohdczsh4EUz3wnc0yuO8fugwEBVA
         fPTizoO6H6cql3VjjmbvNLdIMheysvyFJTtcRjvyBdBCgROnQxc28JzGI7OUpBfg4ETb
         QN7WRr5PPQpaj8m4pmFk67kNZ6vgbVo/aJWdKidEzpXC8Z/4lHcCKx7jMuxYEBCTe2/y
         LqTwcCy0diaWjHkh4ChrkPNkjXmk6H0zs7Sp2DaM1+koCNste2j7l88VL11zQ0mkq+0W
         exGw==
X-Gm-Message-State: ABy/qLbnbdbW2U6osVjRjaiXfIaHfvtaL9KgKkSPk72otod15ZpgZ8HC
	qy3Us4Lc2CUseP6fZMEwc4e55T5vZhBWqSJQrsQ=
X-Google-Smtp-Source: APBJJlH97Ip8JI48vKZhgJa8L+N+azck53Tc73Ok9HIXhEX0p+lnAaVBmUGMPlXcrQjZmLXqZ5YOqXOTVK6Xhppq0UA=
X-Received: by 2002:a17:907:760a:b0:988:57b4:2853 with SMTP id
 jx10-20020a170907760a00b0098857b42853mr8178842ejc.25.1690196093634; Mon, 24
 Jul 2023 03:54:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230721134606.4505-1-andre.przywara@arm.com> <20230721134606.4505-17-andre.przywara@arm.com>
In-Reply-To: <20230721134606.4505-17-andre.przywara@arm.com>
From: Maxim Kiselev <bigunclemax@gmail.com>
Date: Mon, 24 Jul 2023 13:54:41 +0300
Message-ID: <CALHCpMigSgwKmwrELba6z_0CueDM4UpS=0aJm9MDQ9X3KFnZTQ@mail.gmail.com>
Subject: Re: [PATCH 16/20] sunxi: add Allwinner R528/T113 SoC support
To: Andre Przywara <andre.przywara@arm.com>
Cc: Jagan Teki <jagan@amarulasolutions.com>, u-boot@lists.denx.de, 
	Samuel Holland <samuel@sholland.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Icenowy Zheng <uwu@icenowy.me>, Sam Edwards <cfsworks@gmail.com>, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D1=82, 21 =D0=B8=D1=8E=D0=BB. 2023=E2=80=AF=D0=B3. =D0=B2 16:47, And=
re Przywara <andre.przywara@arm.com>:
>
> This adds the remaining code bits to teach U-Boot about Allwinner's
> newest SoC generation. This was introduced with the RISC-V based
> Allwinner D1 SoC, which actually shares a die with the ARM cores versions
> called R528 (BGA, without DRAM) and T113s (QFP, with embedded DRAM).
>
> This adds the new Kconfig stanza, using the two newly introduced symbols
> for the new SoC generation and pincontroller. It also adds the new symbol=
s
> to the relavent code places, to set all the hardcoded bits directly.
>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---

Hi, Andre!

I just tested this series on my T113s board. Everything works good.
Thanks for your work!

Tested-by: Maksim Kiselev <bigunclemax@gmail.com>
