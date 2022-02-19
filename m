Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E06124F38
	for <linux-sunxi@lists.linux.dev>; Sat, 19 Feb 2022 01:13:24 +0000 (UTC)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-2d68d519a33so82606987b3.7
        for <linux-sunxi@lists.linux.dev>; Fri, 18 Feb 2022 17:13:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KuPVvHcGH6XYHC2N1vXONOOOdChkI1tr3mh5lR/eBf4=;
        b=wgnQ1QfNOWXTz4uyN+xiZtl15SgO0HNRAwhITVZN3qh+opHwJxxylfyJ4agegmEm7q
         ypeXRgg8OIq+yFa6wcZMLvJz/DD3FGv/2VuhSsgy/05eAO0sWhyVgkYbqORqp7UlA6ah
         xaoOSiu3/0lf1CZ7jcGzchRlzJ+Qa13DqeQ8K7Tzb1aKoq6I/DE2W4vmyEn/1CzU2vda
         i4aRw+CcvOhdQt+5WbglFSba8rVwdWFfa8oY2ZRKQGY0PbOPNB1TPp6GvYIChnGNXtm0
         fzBXd3A/fv3aZFc6RFQI8jlqNU3HbKVbkU9YbHKpVgRCzf8ZTyi6fbwn4xAJaoAD8c3B
         iKQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KuPVvHcGH6XYHC2N1vXONOOOdChkI1tr3mh5lR/eBf4=;
        b=a4oGLLTYKxnTf44F4P9ras39cdqysLzxkRnCbBfnwjJFSp6CvlcOCsLvUIw+IoQ1sr
         1VaZWy+32jVfXdFo7mI+8Y6ZCk+lkMpRk2KQ/rF5ozDBdKSgv3pcbpTFyfOtncrAZ4YM
         UMwZwPXjzglYji2pYOHvlwseksqdUC6lYY6idxwqutMo0QZiYe50xQZeH9xsYEh3hgHe
         p6cUpR8DnhwrOSNWkGviKX1GFFmuTac/smas7mdb4IyC+C9ZmItDIIm7oQ3pXVEmqFxw
         A7OwuwnuLm2beyc/5fKrGc3EL6mNGeinpTTceYLHdZWp1m5FRqQG4PwN2DYTJ0yifnQI
         RGWw==
X-Gm-Message-State: AOAM531cqTyNQnshxObO3CgfFgAQBAMvnv875HXPpJTM13LE3xcQagg8
	mOuAC+Hs2vo5atV9uPAfO/kB+0wEtF95O3z1Yk0V1g==
X-Google-Smtp-Source: ABdhPJzjyhB275ObWFDUHntgtZfPqGSF0Q4EBsTUNbfD6yhytEp18TB8NqastVWOd/xKaerf5ut9BWf7BQISC3fMQyU=
X-Received: by 2002:a81:f92:0:b0:2d0:5383:7ca with SMTP id 140-20020a810f92000000b002d0538307camr10383384ywp.268.1645233203766;
 Fri, 18 Feb 2022 17:13:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220216040037.22730-1-samuel@sholland.org>
In-Reply-To: <20220216040037.22730-1-samuel@sholland.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 19 Feb 2022 02:13:12 +0100
Message-ID: <CACRpkdZ1nFAmzRvsvKvZ08fsP_MgsnsiNpD7LdRRXUDWtO_w=Q@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sunxi: Use unique lockdep classes for IRQs
To: Samuel Holland <samuel@sholland.org>
Cc: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, linux-sunxi@lists.linux.dev, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"

On Wed, Feb 16, 2022 at 5:00 AM Samuel Holland <samuel@sholland.org> wrote:

> This driver, like several others, uses a chained IRQ for each GPIO bank,
> and forwards .irq_set_wake to the GPIO bank's upstream IRQ. As a result,
> a call to irq_set_irq_wake() needs to lock both the upstream and
> downstream irq_desc's. Lockdep considers this to be a possible deadlock
> when the irq_desc's share lockdep classes, which they do by default:
>
>  ============================================
>  WARNING: possible recursive locking detected
>  5.17.0-rc3-00394-gc849047c2473 #1 Not tainted
>  --------------------------------------------
>  init/307 is trying to acquire lock:
>  c2dfe27c (&irq_desc_lock_class){-.-.}-{2:2}, at: __irq_get_desc_lock+0x58/0xa0
>
>  but task is already holding lock:
>  c3c0ac7c (&irq_desc_lock_class){-.-.}-{2:2}, at: __irq_get_desc_lock+0x58/0xa0
>
>  other info that might help us debug this:
>   Possible unsafe locking scenario:
>
>         CPU0
>         ----
>    lock(&irq_desc_lock_class);
>    lock(&irq_desc_lock_class);
>
>   *** DEADLOCK ***
>
>   May be due to missing lock nesting notation
>
>  4 locks held by init/307:
>   #0: c1f29f18 (system_transition_mutex){+.+.}-{3:3}, at: __do_sys_reboot+0x90/0x23c
>   #1: c20f7760 (&dev->mutex){....}-{3:3}, at: device_shutdown+0xf4/0x224
>   #2: c2e804d8 (&dev->mutex){....}-{3:3}, at: device_shutdown+0x104/0x224
>   #3: c3c0ac7c (&irq_desc_lock_class){-.-.}-{2:2}, at: __irq_get_desc_lock+0x58/0xa0
>
>  stack backtrace:
>  CPU: 0 PID: 307 Comm: init Not tainted 5.17.0-rc3-00394-gc849047c2473 #1
>  Hardware name: Allwinner sun8i Family
>   unwind_backtrace from show_stack+0x10/0x14
>   show_stack from dump_stack_lvl+0x68/0x90
>   dump_stack_lvl from __lock_acquire+0x1680/0x31a0
>   __lock_acquire from lock_acquire+0x148/0x3dc
>   lock_acquire from _raw_spin_lock_irqsave+0x50/0x6c
>   _raw_spin_lock_irqsave from __irq_get_desc_lock+0x58/0xa0
>   __irq_get_desc_lock from irq_set_irq_wake+0x2c/0x19c
>   irq_set_irq_wake from irq_set_irq_wake+0x13c/0x19c
>     [tail call from sunxi_pinctrl_irq_set_wake]
>   irq_set_irq_wake from gpio_keys_suspend+0x80/0x1a4
>   gpio_keys_suspend from gpio_keys_shutdown+0x10/0x2c
>   gpio_keys_shutdown from device_shutdown+0x180/0x224
>   device_shutdown from __do_sys_reboot+0x134/0x23c
>   __do_sys_reboot from ret_fast_syscall+0x0/0x1c
>
> However, this can never deadlock because the upstream and downstream
> IRQs are never the same (nor do they even involve the same irqchip).
>
> Silence this erroneous lockdep splat by applying what appears to be the
> usual fix of moving the GPIO IRQs to separate lockdep classes.
>
> Fixes: a59c99d9eaf9 ("pinctrl: sunxi: Forward calls to irq_set_irq_wake")
> Reported-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Patch applied.

Yours,
Linus Walleij
