Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E14451C69C
	for <linux-sunxi@lists.linux.dev>; Mon, 20 May 2024 07:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716190424; cv=none; b=gxq7agdDido8an9Y/L3X9yTiUs+tIuuRhRm0O4DS97TZOAwx979eNAaaqyJliDMuGLMo9FlDQC0ojnC8p9iRsMkHbX5oO4dQs1Va4KNkZcg7qTbsEFuoUZLXRSaonUL35l1LaNiaO+Hq0hI4gxmp3nkbiZ4ySMws+qHf81gXPho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716190424; c=relaxed/simple;
	bh=WeixK4Kgn0MvKplzBTKjFtE2DZaxPq1ICJ/opiDshY4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uraShK7I2bSW7QoDH8DaGyGR38Atgzr0BLKUPhzNw1+oxHyEtuUvjB51LH6mKiH9vYGjbWhMJsr5k23COJ3gShHOI7d3NJ+wWw5Y4NNpncOfKd4GOiYnZFoNELH6j8xt0TSQrhTvblvk+ahcsiWoYpeuWj9LRcMxPRKi0ImEYQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=L6N/o0BC; arc=none smtp.client-ip=209.85.167.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="L6N/o0BC"
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-3c9cc681ee0so1141112b6e.0
        for <linux-sunxi@lists.linux.dev>; Mon, 20 May 2024 00:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716190422; x=1716795222; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jTHkzAvMu+l8UyjO4kbcmDDhuFxHapp+W1C8XEMNXN4=;
        b=L6N/o0BCTXVKqjsxYalWg5waH99HrzbM5FiwqmVY8rbHLiamyVa1LN44Zr+KCfMfaO
         MHGMhGM7sciD6HwV7A/0I75UaeiJJ6gatUzjFDcHLibrFHBTRmF+BhOxDSoqkcoy9997
         xkXvio/53LBUZ+OkRF6C2h6zmAQKp5kCRc04tenEYdE29WjLrCqFg70FPbdUq7fz4EKh
         y/JCKCCYGbDgSuTMB1YNA/hP7cIHSOWcKg3KgnVNozDZ4SZDYRALmyB48YqZyf+lbWkY
         8XtmSyKtprTELRatuILO2HVXG5lDrcsZFcl8qrmrHH1NUAM8hgTH/wE9XOpqUxEsxmkA
         Yq5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716190422; x=1716795222;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jTHkzAvMu+l8UyjO4kbcmDDhuFxHapp+W1C8XEMNXN4=;
        b=prkDHXR8WoOTLIl7v4/tpndhzCkRaPk4lpnnIIgnV9TgKzJdruHSXxX6xto5KUklOV
         H8A8rIQ7I3IyYChxFxIfKqb02TcVuFlhZWwVbI7NTq4H9fPYegBbE/jMwTiUAnJm+8Wk
         zEpL6V1tPKGeFFuSfiSwA+nUZaCLwgOndWgipZWKn+uzbkGosSlXczeCY+Rj9UAIgsFm
         6mRNkLeYVsI6bVI5ASKm8+c/f1DJL7Ogb4QPKh0Et6DhSEfR5O92L/ML8tiXqVc9VL48
         t89CvfU3HK96RBpxCPeDxTFaqMWLdqwImXGsDk8+D2eKQ0XJSbrLtQVswb3xD2wmn60w
         3rlQ==
X-Forwarded-Encrypted: i=1; AJvYcCVb6wHk5nPa9rO3jKsE5EmrbpjwRm+flhLXQGngmG9/SULXND2g/+wnn2dm+Q0dGk9FPpa5kOIfFVceIbgP6H5TmXawz7ZN0AsGeXI=
X-Gm-Message-State: AOJu0Yzpdk/BpPJQJiy1jCvlIMvnxiltr2r4cGDqhMFqBoNYHE8BtGiq
	7uVtzMRichyvX3E+sZRxLcRZxy6ZqKMrOND4xPCcHDm9FF0rITk2BBn+pGOlZn8=
X-Google-Smtp-Source: AGHT+IG7YMk/8WZfU70jkrguYTPefZ2BNfU/qrbtxJO+K7HFLFtKIi73g49AXVItMr7hLaQS5M2OgA==
X-Received: by 2002:a05:6870:40c8:b0:23d:49b4:6718 with SMTP id 586e51a60fabf-24172bc060emr33527554fac.32.1716190421955;
        Mon, 20 May 2024 00:33:41 -0700 (PDT)
Received: from localhost ([122.172.82.13])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4d2af52b4sm19106876b3a.174.2024.05.20.00.33.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 May 2024 00:33:41 -0700 (PDT)
Date: Mon, 20 May 2024 13:03:39 +0530
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
Message-ID: <20240520073339.rf6laivnglmww3bf@vireshk-i7>
References: <20240503-sun50i-cpufreq-nvmem-cleanup-v1-0-0a2352cac46b@gmail.com>
 <20240503-sun50i-cpufreq-nvmem-cleanup-v1-1-0a2352cac46b@gmail.com>
 <20240510174937.0a710104@donnerap.manchester.arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240510174937.0a710104@donnerap.manchester.arm.com>

On 10-05-24, 17:49, Andre Przywara wrote:
> On Fri, 03 May 2024 19:52:32 +0200
> Javier Carrasco <javier.carrasco.cruz@gmail.com> wrote:
> > diff --git a/drivers/cpufreq/sun50i-cpufreq-nvmem.c b/drivers/cpufreq/sun50i-cpufreq-nvmem.c
> > index 0b882765cd66..ef83e4bf2639 100644
> > --- a/drivers/cpufreq/sun50i-cpufreq-nvmem.c
> > +++ b/drivers/cpufreq/sun50i-cpufreq-nvmem.c
> > @@ -131,7 +131,7 @@ static const struct of_device_id cpu_opp_match_list[] = {
> >  static bool dt_has_supported_hw(void)
> >  {
> >  	bool has_opp_supported_hw = false;
> > -	struct device_node *np, *opp;
> > +	struct device_node *np;

Why is the opp pointer removed ?

> >  	struct device *cpu_dev;
> >  
> >  	cpu_dev = get_cpu_device(0);
> > @@ -142,7 +142,7 @@ static bool dt_has_supported_hw(void)
> >  	if (!np)
> >  		return false;
> >  
> > -	for_each_child_of_node(np, opp) {
> > +	for_each_child_of_node_scoped(np, opp) {
> >  		if (of_find_property(opp, "opp-supported-hw", NULL)) {
> >  			has_opp_supported_hw = true;
> >  			break;
> > 

-- 
viresh
