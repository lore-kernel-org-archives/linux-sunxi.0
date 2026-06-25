Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1CD12FB969
	for <linux-sunxi@lists.linux.dev>; Thu, 25 Jun 2026 20:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782417688; cv=none; b=a+/HLkX41o1WXpvYyE77iJac2LQbjrm1PXqDxKLHKS+Z0zCPykOICurFHPGzpBkMyXjxxy/+pMuUWfUWbD/6UYONVf62Qz8Rkw+5n1BclqSpXc9zFak0Ikmt+6I+qty0FhFcJMups/ZlhIKBJTsTbuHVm7OGzZw0IQu17p5YCl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782417688; c=relaxed/simple;
	bh=mWxYAZnNip39N7Pj7swAw9HVXL3RZX01cdyIL1etZbE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MjtQM4H9yrUrDB8CFsgRbfpGrQ9bvNwfefxHwAafZnWBkZ8bROMRNF9D6T3ZujoZqEeuNAUYYZVXYOmOQ/IYrbFFRNDOqAcxltTsdeVGC7URXwgPGUFFK1UxFDY0wXIx5i9/sH8w/4UmUjGXDYsytW4WJnR/hJaEGgzs64Ono/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LtCxUo6u; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LtCxUo6u"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5ad53c8d4dfso129117e87.1
        for <linux-sunxi@lists.linux.dev>; Thu, 25 Jun 2026 13:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782417685; x=1783022485; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Oc0QJv7T+PDjjn884M5deHXdXQm6jHjFwABbEHE38VA=;
        b=LtCxUo6uF7m+0hSe6/dAGR5f5XBZXR7IiEhFI8mjKPitovuAIiK8zO8FghdrxHR72V
         SJOho8STqXoZCwPEoC0toQJHZWsJZVM0SHe+WK8uS4Oc86come/DdWa2gZZgWipyUpXb
         XmhR46C26N0/rS6ta2GqEq0uH16A0eRQqBa7CjPgM/w5IWwLXpjlCmhsVcNR7u6ucOPY
         014HRNmtYNfGlPTQfe63MSRDotBSLkFFRHB42FA2B2D/Kvzyn4YkYtsZUpnkHDlrGhlD
         5nrT63D9XuuePFOAk18sbUOwE7DVJfduvXpaCtEauxL4JcTF2YH7xIKIQ7UN8faHVLgY
         PAJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782417685; x=1783022485;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Oc0QJv7T+PDjjn884M5deHXdXQm6jHjFwABbEHE38VA=;
        b=XvvQLWLIWqdz7QaxkmyjLAWe2VeTdJNuzeUKeT606g6AobyiqW5LutVfoPdCAczADB
         ghOsCVsc5+nrv8F9XNJvRF7PZ5SmSDFS1vBbxsoc3t4o1fAn6/jbvRhr8d8cTW4BWQxB
         b3jrMoalNBkwrrFJKet+7pdr1LPtTXSjWnVZra9KOaEFiBCFYiR0Kln+XRObmMAGbzhs
         acHSwFN4FjKHFD9I3DbY8DTHqPPRj0n3yAetwkBMNcDf0mXk86C21lBUZu0l8BOpG2Bc
         k7qw7KifZqqmQJeKP1xyum3sfiNCcQRedruwvisoq1KWfwKymEp44nV7bU7TjEL4aJ21
         GC9w==
X-Forwarded-Encrypted: i=1; AHgh+RpNxJVd2Cqib6jucCgjZo9R0A3RnK3ua5vJFuOpz0TRGAy/co1bW/NX/KuD5m0iO4PFBiBuPJ8n4Ch2aQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwNdBs4UeyHzvG5HRPxNvlHM9uKeSj6Pog9zsnw5S7XmZnYqzl2
	G9wLuKnPO8bRNlTy1J9LZgwO4ySG8Pf8LmolqYJnMt/FNloqwzq3p4ay
X-Gm-Gg: AfdE7cmj3hjM+5I3VkAL/bTFBoN/A5k3diRSdiP+4kNqEnMBhwhdpSxIFWf86fXN+rF
	zT4K0/gfTRXd8cv3cnCuX/zIeKDkQKfM305ob9k3ZUzXf8vQh3mtSklvmNCgF07ITreMSG51Gql
	GHX+n8D47hrzAtqmtrRO3zsdyoCQ0fHRNmjKwYeE3bDTCa98yQX7FB6VXUC1hOwtcjARYg4sZl1
	2g/ny7hc78KGy9BD//VTBSuLDLF1nwZBUjcK6tSSHfEm2PN1Qlu0AJGXUkTqmT8ueH0ZYGkpYZt
	W1KGrFhxGx5IfQenfCh8FAVhcUDLjqH/ui4cL7OmSdiHl0O05fPxujN7IBuEPsJmx68LclQ2rBJ
	IrRjKxpcesGQiIj9Xy06e3/0GuFx3PtNn4E/B+aF/QNwuK+wk5Lrjo80ZInWj6Z7DDI/H0Ws8k+
	RyDGF6a+PRn5VBm7Frql8J+4GfthZdckIV77M3Uqez8JbeVFZJRA==
X-Received: by 2002:a05:6512:2251:b0:5aa:65a3:468c with SMTP id 2adb3069b0e04-5aea1e246f6mr1149630e87.7.1782417684632;
        Thu, 25 Jun 2026 13:01:24 -0700 (PDT)
Received: from ik5070.localdomain (85-253-35-150.ip.elisa.ee. [85.253.35.150])
        by smtp.googlemail.com with ESMTPSA id 2adb3069b0e04-5ae9d8fb537sm1793554e87.21.2026.06.25.13.01.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 13:01:22 -0700 (PDT)
From: Indrek Kruusa <indrek.kruusa@gmail.com>
To: felixonmars@archlinux.org
Cc: daniel.lezcano@kernel.org,
	tglx@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	stable@vger.kernel.org,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Indrek Kruusa <indrek.kruusa@gmail.com>
Subject: Re: [PATCH] clocksource/drivers/timer-sun4i: Advertise a real minimum delta
Date: Thu, 25 Jun 2026 22:58:37 +0300
Message-ID: <20260625195837.882048-1-indrek.kruusa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260624220434.4183732-1-felixonmars@archlinux.org>
References: 
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Felix,

On Thu, 25 Jun 2026 06:04:34 +0800, Felix Yan wrote:
> sun4i_clkevt_next_event() compensates for the timer stop/start
> synchronization delay by programming evt - TIMER_SYNC_TICKS into the
> hardware interval register. The clockevent device currently advertises
> TIMER_SYNC_TICKS as min_delta_ticks, so the clockevents core is allowed
> to call set_next_event() with evt == TIMER_SYNC_TICKS.
>
> That programs a zero-tick interval. With oneshot/highres/nohz timer
> operation this can leave the next event stuck, which was observed as a
> boot hang on Allwinner D1 after the clockevents core started reusing
> forced minimum-delta events.
>
> Advertise one extra tick instead, so the smallest event accepted by the
> core still programs at least one hardware tick after the synchronization
> compensation.
>
> Fixes: 12e1480bcb49 ("clocksource: sun4i: Report the minimum tick that we can program")
> Cc: stable@vger.kernel.org
> Reported-by: Indrek Kruusa <indrek.kruusa@gmail.com>
> Closes: https://lore.kernel.org/linux-riscv/CA+fTLhgLmTY+exGujKf8OYYQvcEW5X5NJ_5sLq2AYL6zER2c0A@mail.gmail.com/
> Assisted-by: Codex:gpt-5.5
> Signed-off-by: Felix Yan <felixonmars@archlinux.org>
> ---
>  drivers/clocksource/timer-sun4i.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/clocksource/timer-sun4i.c b/drivers/clocksource/timer-sun4i.c
> index 7bdcc60ad43c..c2d04ab7cf2d 100644
> --- a/drivers/clocksource/timer-sun4i.c
> +++ b/drivers/clocksource/timer-sun4i.c
> @@ -208,7 +208,7 @@ static int __init sun4i_timer_init(struct device_node *node)
>  	sun4i_timer_clear_interrupt(timer_of_base(&to));
>  
>  	clockevents_config_and_register(&to.clkevt, timer_of_rate(&to),
> -					TIMER_SYNC_TICKS, 0xffffffff);
> +					TIMER_SYNC_TICKS + 1, 0xffffffff);
>  
>  	/* Enable timer0 interrupt */
>  	val = readl(timer_of_base(&to) + TIMER_IRQ_EN_REG);
> -- 
> 2.54.0

I can confirm that this patch makes my Allwinner D1 board boot
again with v7.1-rc1 and newer kernels.

Tested-by: Indrek Kruusa <indrek.kruusa@gmail.com>
Closes also: https://lore.kernel.org/regressions/20260531165138.2696250-1-indrek.kruusa@gmail.com/

Thank you,
Indrek
