Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12C4414F9FF
	for <linux-sunxi@lists.linux.dev>; Mon, 11 Nov 2024 05:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731304509; cv=none; b=BLRGxYuSM0vTE/swgSjVyMfCle+2K1bk34BAliayteGkL8c/UWyogd3L9cb2rU+55o86ZLxQUmnFjqpqF0+2YmebI6Wb3K0ODI0qULbOS6mkLsJG8uNA1ONGnTSVxU9/Ob3Wnf51uzYyKsi/zCBLVpH2SsgBpFpMbsj88yVmACI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731304509; c=relaxed/simple;
	bh=1wbt4id5qTsT4HTO1+224rcxhAAHXiof/62rdh090/c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vC2PBNoAqrSSwjgXGAQ6p3cL8jUELbRrVYkqKVpuG0R6K/BVmXLXPo8NRmimv+YFvv/ggGfTJro1ap4PrWIKH9r4on27Mfd0zUEEjhifxdyM+n8mldftMWJJTfUzjOy78vC/kepNTB6QvF9d4slOMCtZfztXuEoM/4XuilwlfoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ItVbu2E9; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ItVbu2E9"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-72097a5ca74so3506242b3a.3
        for <linux-sunxi@lists.linux.dev>; Sun, 10 Nov 2024 21:55:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731304507; x=1731909307; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nAWcQ5veHhNVgjM+Swr4gUazUOqqofF4VZks+AvSvMY=;
        b=ItVbu2E9Ybtfr1imVpu6fdQvUD9boU4FD9mTcXKp6DTLHca0Xhhlg1AzMxJfIXoHVA
         yVjHT9j4IKrFPn54/8AEaT33p12CIxcgwLYcHou4uyR/loDivpK3fCDCcFPGIaxAv1Qs
         Avs4AoMs3t7rciIQldvxJh61635jNiuhN89k7rWllTlrC4Q8fmtJub1rsFW7ed6gq6bm
         2cE8NAKUDWjeLQkuy3n1C7WQHjLVKUUkOgMdpb+BJ7EoabOkOxRPDsWPg4+pkB/Mi2nx
         oGCFfd2+F3g+Qpjy0B9zs8wmrr+7oOfwLTMbw4+GoHfmRm+3cUPTN/35DE4DJrMtpJXB
         DqnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731304507; x=1731909307;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nAWcQ5veHhNVgjM+Swr4gUazUOqqofF4VZks+AvSvMY=;
        b=ahibiKfXdlk5/y7tynMu5VGKmlmP9NDdMn/B+JCzd4KuCTjroTjr98dkE080rHKPJR
         iLldV/bQL1bAJLHMf46fgrEeBLMXveYqtsAn9TbdbSwLEPZWvOktTkGy4yvCPX+qQIeW
         ZytJy8PuivsfoQNW8xtZl5N3SX6MMwXAegyfvTvLU7dTRP65u5mn2JWf4dVE0bfX2lsf
         sj19Us48DSuwEfYEzI64YDp0CC8RhR1ctYXmHQCWVs9JEsVMStUO9qAgiANa4P/tFOmn
         jjR6bsMcEs9S2ReDN0g7ndxkYNu2AHBm+Q44HFQwHhrqDIAygQ5wEhVRSIg2/ADE45mh
         cTHw==
X-Forwarded-Encrypted: i=1; AJvYcCUIFh6c1lzTfef75PynhhDqct12oX/mQQLwSxJf/9jHDkrpYMBArp+NHajBKSPYttRqvdWY3SjLd0HPhw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzQqAb3zZXXCddUv936ZduKpzS1savfAsjdFVO65UUbWXo5hvMe
	fyFY/NZIzBVfufuptsQK5dkEu+Cq+wGB4pySDOazWaacZGXXOLTEBEsZH7D/rpE=
X-Google-Smtp-Source: AGHT+IHtqVtA35vMC4e1EnNTvwTwqSJFlJzhlZOFgx3RSPLljVG5nE5Fqy9JY0g2bqUZOQmsSp1QUQ==
X-Received: by 2002:a05:6a00:198a:b0:71e:415:c4c6 with SMTP id d2e1a72fcca58-724133d215amr13597006b3a.26.1731304507363;
        Sun, 10 Nov 2024 21:55:07 -0800 (PST)
Received: from localhost ([122.172.86.146])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724079a3d5bsm8443325b3a.106.2024.11.10.21.55.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Nov 2024 21:55:06 -0800 (PST)
Date: Mon, 11 Nov 2024 11:25:04 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Cody Eksal <masterr3c0rd@epochal.quest>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Yangtao Li <tiny.windzz@gmail.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Nishanth Menon <nm@ti.com>, Rob Herring <robh@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Viresh Kumar <vireshk@kernel.org>,
	Parthiban <parthiban@linumiz.com>,
	Andre Przywara <andre.przywara@arm.com>, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 12/13] cpufreq: sun50i: add a100 cpufreq support
Message-ID: <20241111055504.2f3szrd5ahudvtqm@vireshk-i7>
References: <20241031070232.1793078-1-masterr3c0rd@epochal.quest>
 <20241031070232.1793078-13-masterr3c0rd@epochal.quest>
 <20241111041311.hleaz5fgipsyxigm@vireshk-i7>
 <CAGb2v646NHFAni=P+iC8OZsWMpg0PJc=kYbuWaY=C0-W-q6qAw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGb2v646NHFAni=P+iC8OZsWMpg0PJc=kYbuWaY=C0-W-q6qAw@mail.gmail.com>

On 11-11-24, 13:30, Chen-Yu Tsai wrote:
> On Mon, Nov 11, 2024 at 12:13 PM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> >
> > On 31-10-24, 04:02, Cody Eksal wrote:
> > > From: Shuosheng Huang <huangshuosheng@allwinnertech.com>
> > >
> > > Let's add cpufreq nvmem based for allwinner a100 soc. It's similar to h6,
> > > let us use efuse_xlate to extract the differentiated part.
> > >
> > > Signed-off-by: Shuosheng Huang <huangshuosheng@allwinnertech.com>
> > > [masterr3c0rd@epochal.quest: add A100 to opp_match_list]
> > > Signed-off-by: Cody Eksal <masterr3c0rd@epochal.quest>
> > > ---
> > > Changes in V2:
> > >  - Add the A100 to the cpufreq-dt-platdev blacklist.
> >
> > Can this be applied to the cpufreq tree separately ?
> 
> Yes.
> 
> Acked-by: Chen-Yu Tsai <wens@csie.org>

Applied. Thanks.

-- 
viresh
