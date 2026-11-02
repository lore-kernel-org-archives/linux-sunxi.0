Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793636530;
	b=bH7A0tGHbaRdFVb/NoBswpS8hzcKYkGjXd/7RdSMpeY0IQaTcMVnsHHHhcWTcLiHMFjC
	 SzEHTpFcK0FOVGbGTGA//HusogfsbgO+CGKCjvgd26Lgf7lb3m1KnHt3Gt4WS5V+G8ba4
	 wrDWTnXl1dXGkh4HJIHRXM7dFtw7BUyB0xDV695/ClvBf2bYNhIbSj3IcFTorufbxFl7w
	 Ngqt3hFH7arvQzXK/AQZpinnERw7Y2bRo28/f8Kmv2qYR0maLR4JVF1QPdx5EXds++6Z9
	 3Txi6343H8Ai/3rlviyS3KlzxSDqn8TQu6WnaBHsEm/qEL/UyPPljK/jlFunJgzgLqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793636530;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=kJYXVhftcmasDjHip+alBpMtgX0z2T3SCDe+1ZPF0BI=;
	b=Jpm+6VKSQ8/ZR2nGIVWZzmgrpmcR60FDGIjbz8ZeAJFIqXuRv7iXzKooMn1ckBJasTNT
	 r7WW0/YUeEpbjDr5q+KjxQqV7WQe59Nh6CpJC0qH6N1PgDKubYFdmNSqBZb1EvLOYxXYQ
	 AZ2+P154RjuBpQsIg0O+7u8TRpmHlx+LhsRG2efDNupuDycXFKP7qCiiq+6bJItxpW+9D
	 81jUkA75EImux58HfCR1P2GEXTOBu1K89rx9WHnEqkZZBwioNYpyyLz1oBVnaonh1lA7u
	 nFHfZgYeyIpepkbRCdt6Vd92aBsoMFUfQbZNOoO3KGuXN9Fm8t1z1k9wdLdtguoxY6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=konsulko.com;
	spf=pass smtp.mailfrom=konsulko.com;
	dkim=pass header.d=konsulko.com header.i=@konsulko.com header.a=rsa-sha256 header.s=google header.b=iHuWHTfi;
	arc=none smtp.remote-ip=209.85.167.169
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FC84606AB9F
	for <linux-sunxi@lists.linux.dev>; Mon,  2 Nov 2026 16:22:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8FC84606AB9F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=konsulko.com header.i=@konsulko.com header.a=rsa-sha256 header.s=google header.b=iHuWHTfi
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-53aa0802881so1621673b6e.0
        for <linux-sunxi@lists.linux.dev>; Mon, 02 Nov 2026 08:22:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793636528; x=1794241328; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kJYXVhftcmasDjHip+alBpMtgX0z2T3SCDe+1ZPF0BI=;
        b=iHuWHTfilZB6GPKHI9yi7PkNqov5IVssbgLrI0tyhlywRZ/zunIq80thCNsSfhIAmZ
         AhJVYKbmay7ugVZA/+Eaeu6U+RomUPMdjYBLtRIVgJBnJFGHJtepCuHC1UhX5ED07buy
         p/ggirMSZn/5Yn4Dve8lX8UTVvbz2NAM83iJ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793636528; x=1794241328;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kJYXVhftcmasDjHip+alBpMtgX0z2T3SCDe+1ZPF0BI=;
        b=o4uhZHtQ4SgmEYM9N4nycvuKP5dTij2UolB2KhLUjDcPis3mOEjorrTSbgk3vux6MN
         jRlUK60A/AWvvdFE5O13HhCUOrEMAboZAAhbNeBDWxFIp2WX89Uzd1Ql1teadzWZJb6E
         ECheVGUs3SVVKfUS6dLtwrNtWydbzfE/mR6gkZxYgqlXzqw6pvLhPOMPDBYUUZxM/9rj
         0uAB+UcmfOkVprWBw2kK8t9z1uM85JSIPN7ZhmIyYFRQqaUGIOuRn8szgn7ggFnNvIsL
         DFbblXEZ/g7T9fnxBWz5kLjwIK+euJ/WcLc8x5742gmhlKcvS0kXFcHrv7cqDmy0q3YT
         Sh/Q==
X-Forwarded-Encrypted: i=1; AKwUvBwta54ufkKmAtSkRvTNPQZa4JRZZqwy6E/WmZId+1kVjcZHGd7M2ckEx+qbj7lUMWOhAvngqagKQhFt1g==@lists.linux.dev
X-Gm-Message-State: AFq9FYLb0R03Lrsx8gLbv9NNa1kZJZt1LOEJA0zeZHdhVnFNEcJxIiaE
	fOKbi22cTnHlzRWxHH7tz6FZyvxBQ+Q3n2bne0z2K7nWFvE2PN8MGFLgSx6mlkb/5TM=
X-Gm-Gg: AYBFou37C+z7J97jAyzwy6s4VW8fFbDqirlWfRvQcM9UIy8aBwVu7GFmLyrrsIYYqCk
	fKWaffc4CSGHLkMmSIFyEWTY7nA31Awne0dJ1qZqBvAiw/tPu5FouTNKdUm6Sbm5LV9G+6eKmJg
	lTGdljEuXCZVHThIiE+wA+o2XDSN4oy8dCY9Vf6SEc20eS2MbcgFjb+GZz8n4nSzoDEN67B9AZB
	ZeStWJF+VO58XQNL6foaK85JL8pLZ5qXw3MI1IeYHJU4oELCIsUQEZzfIxXTpjxxUq6Ih8HgUf6
	1fudI4LrVu5fMzOO45To4m7b35ID61Rg47faZ/ueXq73FRcq0e4x1z3F019GivQckKaIEiIZgWc
	n5VLl38ZF/jrFZ8xiSXuPYTy+0XqSzo+ef0x0cqmTHKRU9y/OBtZfDSU5hhoZJnxlTbpaftt5bH
	/c7zulV2625fcb5gP8q58TPgFDEXgSBv2zNBxBdrKS0fzk6rhMwhjt7x0yDRUj+iUi5A1LUu5yb
	MRNy4y4wv28Q869+SAhjXnZRNLOzmpGRjlGGxNwzAmUMejxhU6ly2qQVJorNof6Rn1llx4ec2+l
	MV3wNM28eR05NU7F1KGxFREHO6BnklyUNJN/lgoQxM/9Loid549/ns2BKGtjPdWvthJ7Z+DNx/3
	BjXy6MA3wsv1D7SHR8tjsNpTyNfLsiNy/au0VVcxvpbasz37QQjZL2HKSl17kpZBQ5F6ZET3iDm
	yNu6MUapFqjfg4uFBS/HlHhaJOsdoBoA==
X-Received: by 2002:a05:6808:508a:b0:53b:87e5:8c9a with SMTP id 5614622812f47-5640dc1a3ddmr6926398b6e.17.1793636528337;
        Mon, 02 Nov 2026 08:22:08 -0800 (PST)
Received: from [127.0.1.1] (fixed-189-203-100-56.totalplay.net. [189.203.100.56])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5640fdce8f5sm8653353b6e.7.2026.11.02.08.22.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 08:22:08 -0800 (PST)
From: Tom Rini <trini@konsulko.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: u-boot@lists.u-boot-project.org, linux-sunxi@lists.linux.dev, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Paul Kocialkowski <paulk@sys-base.io>, 
 Christian Ratzenhofer <christian.ratzenhofer@cdnm.at>
In-Reply-To: <20261102114733.3468703-1-andre.przywara@arm.com>
References: <20261102114733.3468703-1-andre.przywara@arm.com>
Subject: Re: Pull request: u-boot-sunxi/master for 2027.01
Message-Id: <179363652736.461671.11865031137018647495.b4-ty@konsulko.com>
Date: Mon, 02 Nov 2026 10:22:07 -0600
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3

On Mon, 2 Nov 2026 12:47:33 +0100, Andre Przywara wrote:

> please pull these sunxi changes into main. Please note that's the master
> branch on the remote side, the main branch is immutable, so I couldn't
> push a fix there again.
> 
> Not much to report here, some cleanup for some older V3 SoCs, also a PMIC
> fix for some Olimex A20 board.
> H6 boards with 3GB of DRAM now work again, and the A133 build process gets
> adjusted to the now mainlined TF-A support.
> 
> [...]

Merged into u-boot/main, thanks!

-- 
Tom


