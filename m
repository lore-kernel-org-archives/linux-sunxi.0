Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B094D86E9
	for <linux-sunxi@lists.linux.dev>; Tue,  6 Sep 2022 19:54:18 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id z21so6526770edi.1
        for <linux-sunxi@lists.linux.dev>; Tue, 06 Sep 2022 12:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=o3FJxGbvo/djmf1/vSZvVYYgwgJJ+geM2X/sdQK6HR0=;
        b=AvqcZcCnPk5VAPbLzem17L6T87zN2kazPPScK9Y9l1+t8COyNRphx0SVnhuE3Lz0pA
         vnV2hNbLPc0OAMgbZQXglLnhmiDxG+gjKcEcEZmnME3Cuub10N0L07UIvsZrToRrTqVt
         4EptUWVyAWuDEKXYZnFZ/ypnjqPuZ9WRJIvh42R8jC+pXis03VCH0xFPP5sz8jpvxgXd
         nAeMaiwqB2aZHBR85LIrsuH60VPqX5z3FS8uCdVWBGXrvn6CFpUUB3+ruOyellRD4Lvo
         w5qlFJMLPkAujnmi4/GLTmgc+1JJLn+hwwNSNuhh3+RXn4RQIVshe0qdj1kqGbooZvAX
         BqGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=o3FJxGbvo/djmf1/vSZvVYYgwgJJ+geM2X/sdQK6HR0=;
        b=KysIu4fNCuGnkDPjIpurngpNG4pQIMHkIXPPaMIEyvYNjFoBIWz03YVQIg9eFN7dWH
         4xi9w/A+bv3vvGoxp88Az2FugoAkJ+9X7TJsYsx2D+IgK2ZtL//7pbiKND2X5bZt9r5s
         /TH1K87zMyGgYmQfPXY4oWNPXXiAjSJKhQYt1jPjlbBQZE/dpRV5eaKe7u5Y1+R2Gp6x
         x/Z/C7bQWhlFcxS1VqqXHB7ELhkWa77nu8fWOInh7GlNNFseJjtK5oi3sfvRXAXq6wkD
         M5PV9KE48+C4ft5Xa5G+akodbkbDUjmWTLlj9yQfMXwwGcup63cisLRaLFvuXEEP7LDd
         u/HA==
X-Gm-Message-State: ACgBeo0BHtYAQsx79zEKryfkRJKjOTDk92lbaue/opF1w86e8dhSZQJ+
	1Ld15R5XOciE4cp4W41C28A=
X-Google-Smtp-Source: AA6agR5hdGoggyr7fRQYHp8N7yV1d5NR3lZZ6rZ6eA78jVDZ/BEMIc5kqWx5sFYkBgBmhAhjqOW0YA==
X-Received: by 2002:a05:6402:2b88:b0:43a:6c58:6c64 with SMTP id fj8-20020a0564022b8800b0043a6c586c64mr204259edb.348.1662494057026;
        Tue, 06 Sep 2022 12:54:17 -0700 (PDT)
Received: from kista.localnet (82-149-1-172.dynamic.telemach.net. [82.149.1.172])
        by smtp.gmail.com with ESMTPSA id i10-20020a170906264a00b0073cf8e0355fsm6941414ejc.208.2022.09.06.12.54.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Sep 2022 12:54:16 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: maxime@cerno.tech, daniel.lezcano@linaro.org, tglx@linutronix.de, wens@csie.org, samuel@sholland.org, Victor Hassan <victor@allwinnertech.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [RESEND] clocksource: sun4i: add definition of clear interrupt
Date: Tue, 06 Sep 2022 21:54:15 +0200
Message-ID: <2113704.irdbgypaU6@kista>
In-Reply-To: <20220906052056.43404-1-victor@allwinnertech.com>
References: <20220906052056.43404-1-victor@allwinnertech.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne torek, 06. september 2022 ob 07:20:56 CEST je Victor Hassan napisal(a):
> To prevent misunderstanding, use TIMER_IRQ_CLEAR instead of TIMER_IRQ_EN
> in function sun4i_timer_clear_interrupt.
> 
> Signed-off-by: Victor Hassan <victor@allwinnertech.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  drivers/clocksource/timer-sun4i.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clocksource/timer-sun4i.c
> b/drivers/clocksource/timer-sun4i.c index 94dc6e42e983..e5a70aa1deb4 100644
> --- a/drivers/clocksource/timer-sun4i.c
> +++ b/drivers/clocksource/timer-sun4i.c
> @@ -26,6 +26,7 @@
>  #define TIMER_IRQ_EN_REG	0x00
>  #define TIMER_IRQ_EN(val)		BIT(val)
>  #define TIMER_IRQ_ST_REG	0x04
> +#define TIMER_IRQ_CLEAR(val)		BIT(val)
>  #define TIMER_CTL_REG(val)	(0x10 * val + 0x10)
>  #define TIMER_CTL_ENABLE		BIT(0)
>  #define TIMER_CTL_RELOAD		BIT(1)
> @@ -123,7 +124,7 @@ static int sun4i_clkevt_next_event(unsigned long evt,
> 
>  static void sun4i_timer_clear_interrupt(void __iomem *base)
>  {
> -	writel(TIMER_IRQ_EN(0), base + TIMER_IRQ_ST_REG);
> +	writel(TIMER_IRQ_CLEAR(0), base + TIMER_IRQ_ST_REG);
>  }
> 
>  static irqreturn_t sun4i_timer_interrupt(int irq, void *dev_id)
> --
> 2.29.0


