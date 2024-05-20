Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1159D1CD02
	for <linux-sunxi@lists.linux.dev>; Mon, 20 May 2024 08:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716194074; cv=none; b=FIWYS1j7hdjNj6Oe1HKCgqeK7Lz3+fwMsDL3ivvMhl393rYHF1QzB92fXDdXQXrlaOrUVIM0EOOnUfwxpAA6j7EbkGbqSzGA9W3SqHC5r44d6VLdPdf0Nxr33ZD1RtlrtmNvu1h3xdyJXtgERC8fEyXpPnqa+WBGpbHu/ikaKvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716194074; c=relaxed/simple;
	bh=EB3qMQKJYEnU+3Ng6Tr6wYGW1yUtDcOSoM4RZFjdAR4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DsR5ieuCU+SvBkgP829lmaMOrF0ReyFjxug4JIA4eVSuy5soMR5ivX+fOhF5HAOmnHhxnfWWVi78ajq/Rh3B9kl0uMVyK5AgOmWLrg4MKu0WIwg1+g03FjPQlU+ADtba+mrUy2OArtju3ZzQKMDINCYVM0R+6OANX/ts5nJnADY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=N+/9FxGm; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="N+/9FxGm"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1ed0abbf706so64476335ad.2
        for <linux-sunxi@lists.linux.dev>; Mon, 20 May 2024 01:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716194072; x=1716798872; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/0VbbHPXh3+HPq9Lwv1t2nzWPtTvHI52qOE5s8NY3Gw=;
        b=N+/9FxGmt3iQTU+m5VBikWvIqxBRbSD+BbA9AUhS0BiBUTvwWZnQZNFjZNQ69LL1rE
         DKwqqoa2hLOJjdCM/YecHu/e/B7pYbul86SN8NLUJi/saUDbd73SWR/OHsJRJHJgUefF
         G36lLioXaGHAmFj7sQ61DZVIf4rotDcnS0DodrvgKxonxuJb/7PDD8C80gzhno2GElkg
         vRLTpT2LntiC9Nm8f6N8MiP1QOIq7LTCX8ciwBNagdL7d9I2oVj112vzwticrJMi4DBi
         SLJGU+1BXYIR+u/ZODNQar4hrXS7RuEHdh8CdSNaR9rjHKMWvsiRYjYiiQ5EmO63QPy5
         g+JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716194072; x=1716798872;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/0VbbHPXh3+HPq9Lwv1t2nzWPtTvHI52qOE5s8NY3Gw=;
        b=QQfagavi/roMd7vh2W3F77M3hS8YwWxzlElE6buN3E3wdMglNF2IlXq8KBgmqwQ3Ji
         /ytoySyfI3KwHi8Paej4rw0HTCFTTlZVPYz1fCbj5U1qOFvr6tWkhHMSJi8bDooI9s1l
         DNyN7yjXLDezuBxYG7DUZFQB81hAjyI1yLOBClEe8fOOzHr29b/w/I1iKv4PMlGcUlkQ
         gts8podNUgfKYg/rdbBw70LsONGGZWbSjKv/eApgy3Laks4xMQQA+9Fx7SGHLsuCAwqL
         Y/oCcl/ClPtvOr35GYG7446bTneMMQ1PGGBEoFeXMZtAuIz3gSeoMn3gfVUVivw8Db6G
         w+aQ==
X-Forwarded-Encrypted: i=1; AJvYcCVx6X3T5Xv9owDujgnOzQis9F8rFl8I2ajsFVplX5FbACEWqQUk7TeYqKzQ1XrdNO76AXTuFnp1vSq89cRWlCusrRb2ZpTTAkDuiOY=
X-Gm-Message-State: AOJu0YwZWFEgAZeYEM1FSb134CocWZ1uPOImfGC/glSBnSEDy/5qMzfa
	gPIeAa/CbwZeHiQY0ezE84m3wC8rLDJf9h5T+FKNwihf3RF7wI7j499XC9p0QcI=
X-Google-Smtp-Source: AGHT+IF2Fay5nzBDJS+qndk5PhD+BqkgoWj70xfZaviqp0+ytl1HWTEY4sMDUZUV8COfR4PlGWkfZA==
X-Received: by 2002:a05:6a00:468b:b0:6f6:7c6a:2c14 with SMTP id d2e1a72fcca58-6f67c6a3007mr9545512b3a.4.1716194072386;
        Mon, 20 May 2024 01:34:32 -0700 (PDT)
Received: from localhost ([122.172.82.13])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f68c7d3651sm5600251b3a.183.2024.05.20.01.34.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 May 2024 01:34:31 -0700 (PDT)
Date: Mon, 20 May 2024 14:04:29 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	Yangtao Li <tiny.windzz@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] cpufreq: sun50i: fix memory leak in
 dt_has_supported_hw()
Message-ID: <20240520083429.e3f5vtyzc536x4wz@vireshk-i7>
References: <20240503-sun50i-cpufreq-nvmem-cleanup-v1-0-0a2352cac46b@gmail.com>
 <20240503-sun50i-cpufreq-nvmem-cleanup-v1-1-0a2352cac46b@gmail.com>
 <20240510174937.0a710104@donnerap.manchester.arm.com>
 <20240520073339.rf6laivnglmww3bf@vireshk-i7>
 <20240520092623.6ce850e1@donnerap.manchester.arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240520092623.6ce850e1@donnerap.manchester.arm.com>

On 20-05-24, 09:26, Andre Przywara wrote:
> On Mon, 20 May 2024 13:03:39 +0530
> Viresh Kumar <viresh.kumar@linaro.org> wrote:
> 
> Hi,
> 
> > On 10-05-24, 17:49, Andre Przywara wrote:
> > > On Fri, 03 May 2024 19:52:32 +0200
> > > Javier Carrasco <javier.carrasco.cruz@gmail.com> wrote:  
> > > > diff --git a/drivers/cpufreq/sun50i-cpufreq-nvmem.c b/drivers/cpufreq/sun50i-cpufreq-nvmem.c
> > > > index 0b882765cd66..ef83e4bf2639 100644
> > > > --- a/drivers/cpufreq/sun50i-cpufreq-nvmem.c
> > > > +++ b/drivers/cpufreq/sun50i-cpufreq-nvmem.c
> > > > @@ -131,7 +131,7 @@ static const struct of_device_id cpu_opp_match_list[] = {
> > > >  static bool dt_has_supported_hw(void)
> > > >  {
> > > >  	bool has_opp_supported_hw = false;
> > > > -	struct device_node *np, *opp;
> > > > +	struct device_node *np;  
> > 
> > Why is the opp pointer removed ?
> 
> Because it's now declared *inside* the for_each_child_of_node_scoped loop
> below, courtesy of this new macro. The idea is that by doing so, any
> "break;" will exit the scope, triggering the cleanup routine. The loop
> running till "the end" will also make "opp" exit its scope, triggering the
> same routine.

Applied. Thanks.

-- 
viresh
