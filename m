Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11E00347FEC
	for <linux-sunxi@lists.linux.dev>; Mon, 29 Jun 2026 13:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782741507; cv=none; b=uHgdiriWlyonx02ZBklY7KTFJ0bKC81JB9JLOUqRm5FLuJzJIb4QvEjztA+ByHoSBAgbtntAV66pl91MN9djyYkPkeNzmdl9jXN+jhXYPOlgFG/lzQHxqh1JJ/LPSMKjaVQgOWhXwI+l9IqWrMc0brqZVe52BUHekfIRCfmc7QI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782741507; c=relaxed/simple;
	bh=yOzbqmPiymX68IbIPL916O/Rd6K79n+KEjdHVuEkcE0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=qYSh2aLdHv7I19ugq2WCRNuK230ODtCX3TokMcFxhBJvH6jbBVf52wNItmiFn0SP3gdcuJscXhZPJ32uScMn90uGu0BsRu2ZRZpEOw0xpDSH3iql8vsdo0aqfO/TEDS+JSIaQ44o7JdUPpXufEL40q2ao2xmgzqC4tWUWog1i/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=QOK3Z+Js; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="QOK3Z+Js"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-49395888c7bso27288275e9.0
        for <linux-sunxi@lists.linux.dev>; Mon, 29 Jun 2026 06:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782741504; x=1783346304; darn=lists.linux.dev;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PATmqIJOT58g+w0bwm0EGEjm0V85SjTo4ZbuYUtUfhE=;
        b=QOK3Z+JsuDmd7OyWwshlrCFWY8mdm9vWWlAddqnRarhCwZFL7fKGg21XbLL6uVdx0M
         Nk7F/7rNYlzjoctrAcXqpv0Yhft3vIM0EqYm84ec0UAe47dK4ef3GU1O0jGxd6mNhZoZ
         E5vbQUZmrej8b73fMZeOZaYPCyMM5QEXGepVhYmn6mSXR5Gth1AlT9jffHZR6Pd2b+zJ
         5ACCggvVgqqqv4c8M5hkLXzoW9n06Fx4/Y3fV4UAp9fZV9AVjKi/gBuwKIvOLDLMvrb3
         OyzeKaIhHthaYwZuNon0DQP4MXRJvpSzDCKIvFnjCiNeA1c2GZh7Rm0XXUHE+s3nUDQ0
         ORFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782741504; x=1783346304;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PATmqIJOT58g+w0bwm0EGEjm0V85SjTo4ZbuYUtUfhE=;
        b=qT4vx0YH/VAN/AtG1qC1uskNKkELvXSp0CJdPTFr9YNbJI5K5vr28vDuvKRO3wpC6D
         2i1WsUZtdfEP/wi3dGW0cxl1h1+fGltnCkKcbRty23kXS0cFMNsj5OgkGb2OVq4TX5Ku
         baiGa8WsPOkvPCreDvN9+qtNPa/Qkzgag5Ed2toZjwgBLA0hN6dpC4RwUCQo74X/kno4
         CdsQkBv1jaux05GlYnZcyhPTya0uDLOFL0VIkaUdYxUKeBPLfHfc1LAavAgDmXBscTtz
         F8ctklqPmP/Zw/CWpaY3O2UfryMAOQBJVnkTJgT/yQOBS7nAc5NFaV83/f7FAu6YxcU8
         2x7A==
X-Forwarded-Encrypted: i=1; AFNElJ+VAM4Q9XUZJEyrkPvqqQlqHFqCv3YERFobs32sZPBzoZeGQm1EDxFgzfXIq9ePY1jrwKqPApWP5IuC7g==@lists.linux.dev
X-Gm-Message-State: AOJu0YyS4+cTIS0Hw3Wf9EbgeAj8UHnltf5fV7dlvRCSrArn22lgZfRq
	Iw4CG69h8bHW/qqmLZAdyf5M7CJ3IFCJXEOpM77qtj7eCmv1A9vOX+i+P4INARHo9Pw=
X-Gm-Gg: AfdE7cnEg2l1IG+DFpine7I0nuvbu+yg3lfsx6vXdwXs7mf4qvGA7escH61V72NRvcQ
	noeCq161/0xlNzxyL5Nam+vqIwzpcUP+kCYMG1WHtxy8Ox2fAjsArLycsvPNjesvlWaciZFkAIW
	OlmQUlyfcIFZhY31aeu5cJXZRBht1WiSrRjvxKvOHiuRfcPJLziKhQaGA1uScAE1YMV6Lo6kzVU
	P6EDuclG1mPpdmflgdhCpHq3DHss+DSdEALsYh4nFL+kcsX93VGBMmwJiIHiAnAYn1D4i1+POL9
	b6N1eT7ngsMT5QIUsffXSUU5TDQa5vAVAv7RE7RGbt+JFJ1Zq12Sa3JyMrmP2pQLEHO6hRvg0ol
	+PrXMpVcd/QmJEAFmXslW3vLjV3gbItzHMKQmkCWgBPt6XbJL1kkF56Ebj5NB08u5ChG7CWX4e6
	fweBVsUAj5R4s=
X-Received: by 2002:a05:600c:3b85:b0:490:50c5:8153 with SMTP id 5b1f17b1804b1-4926683231fmr259468755e9.2.1782741504468;
        Mon, 29 Jun 2026 06:58:24 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:1d21:f5d5:2d3c:23a7])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-492690100c7sm351172685e9.12.2026.06.29.06.58.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 06:58:24 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: sashiko-bot@kernel.org
Cc: sashiko-reviews@lists.linux.dev,  linux-sunxi@lists.linux.dev,
  robh@kernel.org,  devicetree@vger.kernel.org,  conor+dt@kernel.org
Subject: Re: [PATCH v2 4/6] clk: sunxi-ng: div: add read-only operation support
In-Reply-To: <20260629130342.73C851F000E9@smtp.kernel.org>
	(sashiko-bot@kernel.org's message of "Mon, 29 Jun 2026 13:03:41
	+0000")
References: <20260629-a733-rtc-v2-0-7b72112784f8@baylibre.com>
	<20260629-a733-rtc-v2-4-7b72112784f8@baylibre.com>
	<20260629130342.73C851F000E9@smtp.kernel.org>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Mon, 29 Jun 2026 15:58:22 +0200
Message-ID: <1jcxx9a1oh.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On lun. 29 juin 2026 at 13:03, sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] `ccu_rodiv_ops` omits the `.determine_rate` callback, which breaks rate rounding, reparenting, and proper rate propagation for clocks using `CLK_SET_RATE_PARENT`.
> --
>
> commit 97a1d0e7adc68eb81524d76b0c667da1b5f1be50
> Author: Jerome Brunet <jbrunet@baylibre.com>
>
> clk: sunxi-ng: div: add read-only operation support
>
> Add support for sunxi-ng read-only dividers to be used by the a733
> oscillator detection logic.
>
>> diff --git a/drivers/clk/sunxi-ng/ccu_div.c b/drivers/clk/sunxi-ng/ccu_div.c
>> index 62d680ccb524b..0e3d9e6e30fb0 100644
>> --- a/drivers/clk/sunxi-ng/ccu_div.c
>> +++ b/drivers/clk/sunxi-ng/ccu_div.c
>> @@ -143,3 +143,14 @@ const struct clk_ops ccu_div_ops = {
>>  	.set_rate	= ccu_div_set_rate,
>>  };
>>  EXPORT_SYMBOL_NS_GPL(ccu_div_ops, "SUNXI_CCU");
>> +
>> +const struct clk_ops ccu_rodiv_ops = {
>> +	.disable	= ccu_div_disable,
>> +	.enable		= ccu_div_enable,
>> +	.is_enabled	= ccu_div_is_enabled,
>> +
>> +	.get_parent	= ccu_div_get_parent,
>> +
>> +	.recalc_rate	= ccu_div_recalc_rate,
>
> [Severity: Medium]
> Does this struct need a .determine_rate callback to prevent breaking rate
> rounding and parent rate propagation?

I don't think is a problem in the specific context of this series since
not parent on the RO clock may adjust but it is indeed something to fix
in the next revision

>
> If a driver registers a clock using these exported operations and sets the
> CLK_SET_RATE_PARENT flag, the Common Clock Framework's
> clk_core_round_rate_nolock() falls back to a pass-through behavior when
> .determine_rate is missing. This causes it to forward the child's requested
> rate unmodified to the parent, ignoring the divider scaling, and also causes
> mux reparenting to fail.
>
>> +};
>> +EXPORT_SYMBOL_NS_GPL(ccu_rodiv_ops, "SUNXI_CCU");

-- 
Jerome
