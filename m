Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F93317F
	for <linux-sunxi@lists.linux.dev>; Tue, 10 Aug 2021 12:56:11 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id h9so28920598ljq.8
        for <linux-sunxi@lists.linux.dev>; Tue, 10 Aug 2021 05:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Eg3c72WxfY/AkMY5/Ux5BoPto2wsC9nVFGQQrOCK6K4=;
        b=W2L6I00RxalHhv1J+KdbMdGE9rIp7UQg8NRBrfkh2uT7jJqhAZ5WTVaO+AbOd/px8Z
         kUnNn0fwDDHr7E/f8q1JTrp+FPksDUKra2uky7kWp3n/HbnYdLH1/bKU9j3tRAQpc3FH
         wLvWmV1Q6xDmeya1Zmdqa8b/NRL0rd2lzwAjf6s6Clcai4NsmnnrFVS60mxN/ckkWChH
         /J1swI38Llq16cEBV9JsVx5TtzfSbtWdE8GpFek1EAgmFK5OzfV4TV6Cawvvn0EjtNGB
         eU5Qj+a+/ipJDswS9yNqou3+vX0FdyV/51uXIqYpFZZmdwLmwecKSoLae7Od++q6pCdX
         6f+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Eg3c72WxfY/AkMY5/Ux5BoPto2wsC9nVFGQQrOCK6K4=;
        b=ivx4YPFihFhMf8bA3ojP21fOl7UqmD+0raTRrLGLM1lniundgZmgvbqh+Apr2KKEml
         1ZIT7ANMGex5SfNTg2IjtehGDdM1t7G1w2RvxwLM8949Sj4eAzvtVn2QVpD0btOXZi/S
         mKaZzWyPct80VH2L8RH/juS0gm4CCRvbwjWlCYUZ4yopIcS7mgqZeaA0wHoMXg0gwCqS
         g7+q6u7JicRzjTQ9scXT8oHy5qWz5rg4t2MMpjHp5y4cqbrKUfZi3cFQ9BQHDcDR9isy
         9aqyr/4eo1hXSZM6l6PWzTRByDppRiz0LS/UMdHG7V7qxxaRpNEl9I4Mz3uIujrAhDiA
         zK8A==
X-Gm-Message-State: AOAM5320m3jcco+gUAG8gYBFYD31hbhhvf4O5j+aGza5q0hTJJ4bZrSk
	5+uawcnQqpb/CJ5hKYeJ2i7EOGMdhLkklKj45JrzGQ==
X-Google-Smtp-Source: ABdhPJyirmUH7PBSPfBVVVbbuOdns3uDP6PM97CUkBd41cgMWWS6PeftvgpmfmQdr32ujlwVreU7BZeBFBIexyDvooI=
X-Received: by 2002:a2e:a231:: with SMTP id i17mr9057345ljm.467.1628600169499;
 Tue, 10 Aug 2021 05:56:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210722132548.22121-1-andre.przywara@arm.com>
In-Reply-To: <20210722132548.22121-1-andre.przywara@arm.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 10 Aug 2021 14:55:58 +0200
Message-ID: <CACRpkdYKk4An56a0rmoXgmcpAmGTLeyhM6qfTK+y1yopHB4NXA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sunxi: Don't underestimate number of functions
To: Andre Przywara <andre.przywara@arm.com>
Cc: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Icenowy Zheng <icenowy@aosc.io>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 22, 2021 at 3:26 PM Andre Przywara <andre.przywara@arm.com> wrote:

> When we are building all the various pinctrl structures for the
> Allwinner pinctrl devices, we do some estimation about the maximum
> number of distinct function (names) that we will need.
>
> So far we take the number of pins as an upper bound, even though we
> can actually have up to four special functions per pin. This wasn't a
> problem until now, since we indeed have typically far more pins than
> functions, and most pins share common functions.
>
> However the H616 "-r" pin controller has only two pins, but four
> functions, so we run over the end of the array when we are looking for
> a matching function name in sunxi_pinctrl_add_function - there is no
> NULL sentinel left that would terminate the loop:
>
> [    8.200648] Unable to handle kernel paging request at virtual address fffdff7efbefaff5
> [    8.209179] Mem abort info:
> ....
> [    8.368456] Call trace:
> [    8.370925]  __pi_strcmp+0x90/0xf0
> [    8.374559]  sun50i_h616_r_pinctrl_probe+0x1c/0x28
> [    8.379557]  platform_probe+0x68/0xd8
>
> Do an actual worst case allocation (4 functions per pin, three common
> functions and the sentinel) for the initial array allocation. This is
> now heavily overestimating the number of functions in the common case,
> but we will reallocate this array later with the actual number of
> functions, so it's only temporarily.
>
> Fixes: 561c1cf17c46 ("pinctrl: sunxi: Add support for the Allwinner H616-R pin controller")
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Patch applied for fixes!
Thanks for finding this.

Yours,
Linus Walleij
