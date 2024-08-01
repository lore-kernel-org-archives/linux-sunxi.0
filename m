Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6534A1EB490
	for <linux-sunxi@lists.linux.dev>; Thu,  1 Aug 2024 05:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722491515; cv=none; b=OKGT+kL17NWuzghnPUQNpZ5ULer1SX39qOkPwsb945NmtL0Ol6BWz43pdhqcq6z0oFiKgogyR1FnCiFEU9oBKBvsrYEb8dY6eJF3j2du30R875pkjXw9llIayAESBuUG7mx7PB8p3kWTfDauajhp7lvoN832gU5y8Jx+1KNVIJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722491515; c=relaxed/simple;
	bh=mHdBEdoA646mRvFAlQiOSeu1k6r5IpBY8UYszqgYIDA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ku0nmF/fMPqMueqRQA08O2ifDUvmYlhTgearRswcTQ4dQ9tPophVUuL8jHBRM4ekFNfnqUq5fsRWbpJfqCa+7MIZucjSHzqHvym8MJyN4Fbjc8o2Dwd2kdC8/HKr/igBmhsh+9ylu38g1AVM5BRmilb+eOrUqMCLPwDJ/mozZqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bhDlqFFj; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bhDlqFFj"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-70d2b921cd1so5791831b3a.1
        for <linux-sunxi@lists.linux.dev>; Wed, 31 Jul 2024 22:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722491514; x=1723096314; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7gBLGL+mmGX6AVb3elsBnCFrc79BJCRR+zjbmuB2kqk=;
        b=bhDlqFFjok5yyIYqq58FXFr3y86SyqzRW5+EXfdqSZYuJTntbq84O6/rS4oWXmiAIJ
         Yv2+uYa5TbxvXpXcmxmliv1xrcTBgJCQ66JTiwQqbUqQuitpv307SAg5sj4R8p3xCI0t
         DKQNWS13VYN7CdAo14EJTF4yIyqF4VsocL6r/hGF/wIXf7HNvhDxQ59HF909lvMc32yO
         PvpI0bRVgTnMfq/Z4NXUppz4lAER9o8PdIYEviw3OebHupLgvcPp/vr0prDcn8RxbX+t
         00Sv/y4CEP+vvy1sMLhj+9qC0NGyJn8Gr+9hF5Zu7CMy6N7hRP/yZvs7ws5Gk+WLO4Mx
         zfzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722491514; x=1723096314;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7gBLGL+mmGX6AVb3elsBnCFrc79BJCRR+zjbmuB2kqk=;
        b=e2VD25T3wV19LGlewsCkdXAkfiHdo7F2ZvLRcqC3aioOx1eQ8mg0KKa8k+iqV9CI5U
         akOq+fJHHyMM+JQoGjDSIOYrBS/wcp3Kbu+EOskgBQEwgwSEpSp5N2zAW3iT7KWIrqes
         5bJImXTM9/qRm7CnzQrmBJ9OYRLKEn6sCWp9ioQBi+bBDXgxGi+pVeAzNlPfHbCpV9TC
         jCshaKA+WCFEnMVpAVGTFMrpM24sGDdVKf1QMznA24ex1HBnCTMl0k5BeEWdl/6SdmKD
         yHdQ5fTwhSqFg89/yiAGQIRhO1jLRm38maAV61ObjJY6R8R89fSU9c16x066mwZxeYxa
         cpGQ==
X-Forwarded-Encrypted: i=1; AJvYcCVBBX3ZJhhrWc2NC9OfM37tQ1pfhOiVB1s6UmVHM7JconniZkqFw2Jr0NxTYoYcKiKsP/VJTp8XUb09sl4zLe2hBRVKiKsLt9qZHTk=
X-Gm-Message-State: AOJu0Yx/xf0QEYu8RozL79i4Gbbarw/XAwJ/9EN+y697WvppC2ec1T7l
	ai5DdrQBnexYfu6oDUd35iswAKFaHbm+L+moLKjZSBh8bgG124Po+pgtoBoxE0I=
X-Google-Smtp-Source: AGHT+IHi3LdaOVqsILRzUG5RajCZhFYqsgwTEJCbU7Q/0owEgSj/B+R4O+r/bPYrYZw7jZacX4sQzQ==
X-Received: by 2002:a05:6a20:ac44:b0:1bd:feed:c031 with SMTP id adf61e73a8af0-1c68cf30d2dmr1821935637.28.1722491513712;
        Wed, 31 Jul 2024 22:51:53 -0700 (PDT)
Received: from localhost ([122.172.84.129])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cfdc4add69sm2325862a91.47.2024.07.31.22.51.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 22:51:52 -0700 (PDT)
Date: Thu, 1 Aug 2024 11:21:50 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Yangtao Li <tiny.windzz@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH] cpufreq: Use of_property_present()
Message-ID: <20240801055150.ojas7q5w5jzhmeut@vireshk-i7>
References: <20240731191312.1710417-2-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240731191312.1710417-2-robh@kernel.org>

On 31-07-24, 13:12, Rob Herring (Arm) wrote:
> Use of_property_present() to test for property presence rather than
> of_(find|get)_property(). This is part of a larger effort to remove
> callers of of_find_property() and similar functions. of_find_property()
> leaks the DT struct property and data pointers which is a problem for
> dynamically allocated nodes which may be freed.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  drivers/cpufreq/cpufreq-dt.c           | 11 +++--------
>  drivers/cpufreq/pmac64-cpufreq.c       |  2 +-
>  drivers/cpufreq/sti-cpufreq.c          |  2 +-
>  drivers/cpufreq/sun50i-cpufreq-nvmem.c |  2 +-
>  4 files changed, 6 insertions(+), 11 deletions(-)

Applied. Thanks.

-- 
viresh
