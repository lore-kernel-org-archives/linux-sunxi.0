Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFFB13B3C0A
	for <linux-sunxi@lists.linux.dev>; Mon, 29 Jun 2026 14:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782743103; cv=none; b=amYx4OuHE0v8c3VCJ1fIPoGabpkEW89SRz8Zl6fiMWs9nEHJ0tN6rKvkQsMUG3xza3FdLO2FysM9AZvtRQJxfV5X0lrPr++1/kbyV6bDuO7iZXN9wlm4HGSai17iBWD4yN8nPzNIJsXAlHN0dFnsq8ggeVz1OC3kUC5VWPWflSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782743103; c=relaxed/simple;
	bh=Y6X5nprCbNTnjWSbHEhsXgYBJF1NoS2TUH6gHAd8Zbk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=gA0jXSbFSK9ZYRsXwSW4jiDEjg/xmvnsgAzXZoTttrNdbIHk8Wk4igFJMPXJF6eD2ym7QMcSKKYg6+slWyxB9IbPAIURdlrpWbtkq1TSlDMvHiKuQ0wK5I4NQ/skHublr/iWicjL32FC2ACfAv925nkYPNhMdnelpq5yjuHwo+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=VnagAkwg; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="VnagAkwg"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-493ad116e05so7129935e9.3
        for <linux-sunxi@lists.linux.dev>; Mon, 29 Jun 2026 07:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782743100; x=1783347900; darn=lists.linux.dev;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ui1fxLb1Ubcmz8N9yHAf4o5O41FLSttz4QjPD5o+8+4=;
        b=VnagAkwglAjgRZuzkSbwfr0wqhP+EOa70dtvOO5juSdynVr4gGnPw+/+XKysIoIQOu
         cXg3sbYugOYEFvBUrTfBLt+aBfFwujEnMS7z2/Gp0ykOZ+oulu+GAFUcwjqWkys1mRKu
         M+Bu83zOXRr11Y9KAbZQoOMO8ZGScWNJn3++/9ROzMwl1M/Lf4aE6zjB/UebFUAp8bsF
         QvfC3agOp9hLIXmTeAjuLh0+asciTUfW066wuoXmLxmhYCjnAeA7S2WZ3oWD9UoBJWoR
         NAiyYZfxsB32SBdixvMnF7YVJ0ezGcOehH1wEDVGTJZ4bg+yhKOJ6NHyc6543Lsy6cSU
         JaWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782743100; x=1783347900;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ui1fxLb1Ubcmz8N9yHAf4o5O41FLSttz4QjPD5o+8+4=;
        b=Hq0si+8QGZIJrGTkG4vuDrFtEgCo0m21kUzFIQb0/3ctubnAC1+Uq5gQGyiMEoT3wH
         WI7RCoSxgL/yYBekQInjsbKjJBLwjpES+VIk/HyA0QoC2wyTTZgjlnKXspJqMJu5ahnH
         GFC5krrGr0nxq7VXuALXNL3Jbw6BpnwQvnF+cIfk5+2OIgJ28nXa/PkyOafCEQHfURVG
         JLcpuHgOsmOPHfcOCPAPupcLxKhOn1tP4QDyXxhC2TsGetjQDlqmQcTLKHZgQIrxhFsk
         pzz7MzttVKZVdTaMYpN9UxjuvAMC4ccOUrR8jPUsBOscvP+1skDXkKTNLjewwUI3zwhj
         YLsw==
X-Forwarded-Encrypted: i=1; AFNElJ/iQKT+aVEAfq0BYvZmIpn+rvrNxKWeKUqob8CU5pNZUKdPZ9tTN6HFyfe8EJTUo6LGcT7hJT8HZvpQcg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz62fuIVCyKXqFdSMJt9B5yrl13io8xtmoIHYuTl8h3C5xT/fQI
	yZ1j6/mcQNkLnQJKHOeayMqr7R+chqWTwf/EIHkbQiVEpiG9VE7yIrehrliqD83YesQ=
X-Gm-Gg: AfdE7ckrxZjLbzQzoEq6DGYMGLFFzj8HVks+ohhtLtv1UUzVZ5mlvaoLrZOILSgMzVj
	3fM73k+aGmoJkTjImPbXZkKSozn15F/+2vddO1qoBbtd+VGnGHCr6XPFrbFFuo+XyMmV1HvJdi0
	K4xjTQGRRefF+/lq3zropJACOekc5+gEB++YRl6o1HA7yXH9ueG3qBZsx8Ljmx0Ls1RaPjKWyb0
	JlK17CIIvousza35KM82LZOt0ZznWJchudy3lfX/vlCCg8MJIjxvdnqAKyG/FepGa9GnbbnO8RC
	lya4a5F/L8xHxkMRhGXjyJ+atW9w8LSlQLk+n19+StktHf7n5j1G5huNpTw/2GaiG6WSqJAOwUe
	WsACij9YQpo9IUTnhyeuEbatAUGPkEXpa81N1u1cjnA5NcasK33mRMKL8Nbc8R9JgoBCBgz+ZE1
	e+1gp37+jDXtE=
X-Received: by 2002:a05:600c:8b33:b0:493:a5d0:d1a1 with SMTP id 5b1f17b1804b1-493a5d0d2e5mr98503625e9.31.1782743100204;
        Mon, 29 Jun 2026 07:25:00 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:1d21:f5d5:2d3c:23a7])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-49268ff9f40sm294230185e9.6.2026.06.29.07.24.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 07:24:59 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: sashiko-bot@kernel.org
Cc: sashiko-reviews@lists.linux.dev,  robh@kernel.org,
  linux-sunxi@lists.linux.dev,  devicetree@vger.kernel.org,
  conor+dt@kernel.org
Subject: Re: [PATCH v2 6/6] clk: sunxi-ng: sun6i-rtc: add a733 support
In-Reply-To: <20260629131546.8D0261F000E9@smtp.kernel.org>
	(sashiko-bot@kernel.org's message of "Mon, 29 Jun 2026 13:15:46
	+0000")
References: <20260629-a733-rtc-v2-0-7b72112784f8@baylibre.com>
	<20260629-a733-rtc-v2-6-7b72112784f8@baylibre.com>
	<20260629131546.8D0261F000E9@smtp.kernel.org>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Mon, 29 Jun 2026 16:24:58 +0200
Message-ID: <1jy0fx8lvp.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On lun. 29 juin 2026 at 13:15, sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Critical] The master DCXO enable bit is incorrectly mapped as the
> exclusive enable bit for the 32kHz divider. This will cause the clock
> framework to inadvertently turn off the master oscillator, freezing the
> system.
> --
>
> commit 83ebb861eeea7934e5df335b0d1620cad0b733bf
> Author: Jerome Brunet <jbrunet@baylibre.com>
>
> clk: sunxi-ng: sun6i-rtc: add a733 support
>
> This commit adds support for the sun60i a733 CCU RTC. It introduces a
> new auto-detecting oscillator divider and several phy reference clocks
> with dedicated clock gates.
>
>> diff --git a/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c b/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
>> index 25dd87e78eb7a..2ec09e3464724 100644
>> --- a/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
>> +++ b/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
>
> [ ... ]
>
>> @@ -227,8 +237,28 @@ static struct clk_fixed_factor osc24M_32k_div_clk = {
>>  					    0),
>>  };
>>  
>> -static SUNXI_CCU_GATE_HW(osc24M_32k_clk, "osc24M-32k", &osc24M_32k_div_clk.hw,
>> -			 LOSC_OUT_GATING_REG, BIT(16), 0);
>> +static struct clk_div_table osc24M_32k_div_a733_table[] = {
>> +	{ .val = 0, .div = 732 },
>> +	{ .val = 1, .div = 586 },
>> +	{ .val = 2, .div = 793 },
>> +	{ .val = 3, .div = 732 },
>> +	{ /* Sentinel */ },
>> +};
>> +
>> +static struct ccu_div osc24M_32k_div_a733_clk = {
>> +	.enable = BIT(1),
>
> [Severity: Critical]
> This maps the master DCXO enable bit, BIT(1) defined earlier as
> DCXO_CTRL_DCXO_EN, directly to the 32kHz divider's lifecycle.

Forgot to remove that unused define

>
> If a board uses an external 32kHz crystal, the rtc-32k clock mux is
> reparented to osc32k_clk, leaving this internal osc24M-32k-div clock with
> zero active consumers.
>
> During late boot, the clock framework's clk_disable_unused() routine walks
> the clock tree and will disable this clock, clearing BIT(1) in DCXO_CTRL_REG.
>
> Could this cause a hard system freeze? Since this bit physically turns off
> the shared master 24MHz crystal (DCXO), does it immediately stop the CPU,
> PLLs, and all peripherals?

I don't quite get what the AI is trying to report here. If there are no
user, the clock will be gated ... so ? Am I missing something ?

>
>> +	.div	= _SUNXI_CCU_DIV_TABLE(14, 2, osc24M_32k_div_a733_table),
>> +	.common	= {
>> +		.reg		= DCXO_CTRL_REG,
>> +		.hw.init	= CLK_HW_INIT_PARENTS_DATA("osc24M-32k-div",
>> +							   osc24M,
>> +							   &ccu_rodiv_ops,
>> +							   0),
>> +	},
>> +};

-- 
Jerome
