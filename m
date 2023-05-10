Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F2FD80C
	for <linux-sunxi@lists.linux.dev>; Wed, 10 May 2023 05:38:17 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-965e4be7541so1060367966b.1
        for <linux-sunxi@lists.linux.dev>; Tue, 09 May 2023 22:38:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683697095; x=1686289095;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=IRV+sBk5PSnkH2cvQJEurZPQMXkcZOja4gthBlnfdvw=;
        b=A1h54Fif7vGJHhX9m1f3Kshr1flFcjj5AzZ/ocnSu3BiLmXjzWi8eQZxj/rncY8miQ
         0v27z+lMPwGBmHopVHW2+2J14kjpyubV1MgJlX+pboaAr0MZToQgz/2v2g3expkwDpKe
         WZ3tAFfb7li10tp/88owAqkA0zPC+8hxwtaA6ff26GFvXDgrFw78JG7QQUH2LYdwFv5u
         vN1FyOhDc6JeOVeA1f6OWLEPfCBTQVmdWhzybqZa7gw0D+OsML6oniiMpxYs4T4nzHQ6
         JOlHgzkLxan/XMa7ezvhi7uRB3nazYJl74itRiBJ+qcoWns94wmL1BbIUw6l/93Qu5jR
         rODA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683697095; x=1686289095;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IRV+sBk5PSnkH2cvQJEurZPQMXkcZOja4gthBlnfdvw=;
        b=jU80aVb6mX4BTl5SpaK7PMKEmVGTbEj+iNL6XXEHbOZCKRMWEW/eiiQ4R1vRJBDghO
         JjUFgzaWG1jiQnozhEiZAskzFtz7D9KBOiloXQ0Mp8ezuqvZm6flwqgftm8qUXl9A/rS
         SFMs/sALpxwpaCCk8hQwivL+MFHKBHJBKSbbM+yJqqQNvwBlOTLabrsdC4dZPyhPCLO+
         PedSx5dVjBSRNsynDUUC0MY3KjB46NLyH4SmVWQ0tveiGWxFdXvzAxQ8tRW/+yu8el5i
         kpSnS/dQeYXSvBY2WRUiwiFHS/m3ZolV49ofz4OJt6ngyiBKxIS6khf9rUYIncAd988j
         hIng==
X-Gm-Message-State: AC+VfDyM5Krmb7oTAW5inKQxbLFXWN940MlgTG6TXKu9gCtXeVNnFt3G
	fzKVeYbU16kZnZ/cpVJeQgim49lOuD0OE2eoLWZZzoY2xGI=
X-Google-Smtp-Source: ACHHUZ4ogjZtGrQXMJMKwEGu0G0AbD0KpYVERcNwR4arcIxdi5S+ollKjEgImzB7I/MuJA0JZh7eBw+2jTW/8V51pB4=
X-Received: by 2002:a17:907:9808:b0:94f:4801:6d08 with SMTP id
 ji8-20020a170907980800b0094f48016d08mr15277609ejc.71.1683697095024; Tue, 09
 May 2023 22:38:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Wed, 10 May 2023 07:38:04 +0200
Message-ID: <CAKXUXMy3_krgwHMS6TaDZhBePkaHTHigntwBD0WFxMJ=DtgWYA@mail.gmail.com>
Subject: Situation of CONFIG_CLK_SUNXI_PRCM_SUN9I
To: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev, 
	linux-clk@vger.kernel.org, kernel-janitors <kernel-janitors@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Dear Maxime,

with commit 49c726d55c1b ("clk: sunxi: Add Kconfig options"), you
introduce various build configurations for Legacy clock support for
Allwinner SoCs. Among them, you introduce the config
CLK_SUNXI_PRCM_SUN9I in drivers/clk/sunxi/Kconfig, but this config is
not used anywhere in the kernel tree.

Can we just delete this config CLK_SUNXI_PRCM_SUN9I again, as it is
not needed, or did you simply miss to adjust the Makefile for this
option to be effective?

I will gladly send a patch, once you could give me a quick pointer.


Best regards,

Lukas

Note: This is a resent email (see original email:
https://lore.kernel.org/all/CAKXUXMzqCktKz7vGN4_QAp4n1SeP0-YHL19evmVSfseZOemd5g@mail.gmail.com/);
now hopefully with an email address for Maxime that reaches Maxime.
