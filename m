Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56BED7ED
	for <linux-sunxi@lists.linux.dev>; Sat, 15 Oct 2022 09:11:12 +0000 (UTC)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1665824688;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=O2r2z/z0hDoo2fh70QGYrUogL6TlcVgEKV7x78z66rk=;
	b=wZ3A/EFb4G6uurDA8QKXiizxdoxYR3Jam1s3WZDYV9AObyHEPUyugqKotgGPGlttpyyqbZ
	00CYpl+9rAbhzgpo5OEbXraxPEry/QZhxbNDaQXpaN9HXZ6qzRd0FVBn8P43g8E7BmSENn
	1jln89FlJtjTWT78Ie4yq6ppn+aa0g9pXTGAg+CggXj0qaq1QSor9+tCjlxixo2J/6RqT5
	XGHvewENPpjNtEzTJiWGAF+U9W6OXxpHldZoJ/3rcjIeeMMLuEWPWMj83FusJ0vVWoKPUM
	/XKixrvwt8PUouDljQLgmXXAkkTZesN2jyn40BPx2Gm36cCscOkcBIZvItMVag==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1665824688;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=O2r2z/z0hDoo2fh70QGYrUogL6TlcVgEKV7x78z66rk=;
	b=Aduh0A0cNaJ8nQRyYpvXMx8W9EFOUe8/aIlhdsZRrdSd91ovdKPL4JuxWEfVfJ6qnyXeSn
	IAeKSJxHo4/48yAg==
To: Victor Hassan <victor@allwinnertech.com>, daniel.lezcano@linaro.org,
 wens@csie.org, jernej.skrabec@gmail.com, samuel@sholland.org,
 maxime@cerno.tech
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev
Subject: Re: [RESEND] clocksource: sun4i: Fix the bug that tick_resume stucks
In-Reply-To: <20221009032507.39145-1-victor@allwinnertech.com>
References: <20221009032507.39145-1-victor@allwinnertech.com>
Date: Sat, 15 Oct 2022 11:04:47 +0200
Message-ID: <87zgdxa24w.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Sun, Oct 09 2022 at 11:25, Victor Hassan wrote:
> Currently syscore_resume() will stuck on tick_resume().

This lacks a clear explanation of the problem, i.e. WHY the current
implementation is not working.

> Fix this by changing  `.tick_resume` from
> sun4i_clkevt_shutdown() to a new function sun4i_tick_resume().
>  
> -static struct timer_of to = {
> -	.flags = TIMER_OF_IRQ | TIMER_OF_CLOCK | TIMER_OF_BASE,

How is switching from a statically allocated struct to a runtime
allocated struct related to the problem?

Thanks,

        tglx
