Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 911931BC4F
	for <linux-sunxi@lists.linux.dev>; Mon, 20 May 2024 08:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716194126; cv=none; b=Goapsqw6EtTGMQsupAjVjkB7ucWUpYBTKzqaZv+FBRqOXm5iiN++i6ayWGtgqhMrhkm7iGTB9AAHL6ISDJQANy1UR4t7T+U/O+UmOLyspGRrb14hOK+aMJc8jjFAOsrHLfJQJLSWD6BzmDxfikJLOrj2Wkkio7ep00luRxaX92w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716194126; c=relaxed/simple;
	bh=pGR1qWiXTUPecq4OqlA1IrsQxJzyWJZMvAO0kM1kkyw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YkASB0M6+Bnu3vn6Di0PMt42DknDjBFe3HSQZnHGxE5lQM2pXcSCzuRj/dLqTKqciAAwmJ0lXaXuJ5SiDjFlp7Dzr6jfHdmi8xQdjh9VhC+3PtaYwwUNGaYZCmvwrVAyyYyUAlFpo2Wh49Jj7SWOEGv5zoSHsJ++XSakSgI6Kgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=clRqY85V; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="clRqY85V"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1eb0e08bfd2so68662905ad.1
        for <linux-sunxi@lists.linux.dev>; Mon, 20 May 2024 01:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716194125; x=1716798925; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UIsBb+eRFu3c1CtI64mjHrwU2c/P6ra4rdQLN4GGHw4=;
        b=clRqY85VMTIjCHR73qcVkA4NvoFzQrgpOLKkN0Gak7G6HqSotK2XrbOaeH3zf8RXfa
         MI4dVosAQO4anIb0ytoZQrDROhY/zTOrDT3gSZBvVG6mcMTy8rlWBVFJSfZuoqWqGeyu
         s4TCI+pS1qCEsoYE/S2LrpuOZGGCQk0aP9fhACkjX+S45GcYZiDhBrV/h5PXTXWUVcii
         Y8/aBXLtsvrd91iEbQ04vdMVpl80hwd18BU5fd8JCHYehgJUOFhYj2zEUwV3KsbMmGSh
         ECoQ9ZvyPkHG6rtkP5ab7y3VyKFQ8WehVq3jyP33ZBSrfItryWd/S4ialXvuoI53A124
         iqrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716194125; x=1716798925;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UIsBb+eRFu3c1CtI64mjHrwU2c/P6ra4rdQLN4GGHw4=;
        b=kPavDLRU3YFzOekLXqwgonydx6wh30jlRaUf4N+CD/tZ/kssyORdo2ktpiYEXnCHB9
         Ernr7512k85BQUkVFfrQtMRE7GjnrZPaSQ83/CX42wvApfKGpX+qc3i+vnUzhHBpEw6M
         VCqAWglwNWj5W/bAW17l6rkZi5PVVnzFBf+DZPIeyB5jvdBslt126l8SDL7/2SLmabp/
         pC/yfv7af8F0hD9Q4IAjyBAtW0lh9S/SVhHyr/c6hkVvd8+vv4GO8Y+blLWNb0UarpUa
         Uvi2VtBLOZXbwOdtNxJKgby5B6k12rcpQ0j7jVx8ENiBV/2GC/Ugs3sHNs3UeT5/mgfL
         soHQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKT7shf3FIBNPfr128SpvAL8hjKNx3GaqhelAbvihoByGSndMrZozpkI73tnyFkMrnyPl/h04S3f3gtRmIYPTYe7JK9EWWevt+nDI=
X-Gm-Message-State: AOJu0YxsPGHTafH5c42h/uLy+Rg8Q1DsY4alYKaYhWbvq641optsWCjU
	2gBCCkEGs6c1x22DC1l9Jymp5IYR13zIIijm4nJQU+s+5dkPh8VAO/AJKkQu9FU=
X-Google-Smtp-Source: AGHT+IH7PSENgMsGNo62ZNvTY9oX8UT5YKyk73G2Rc3ZZ7+HceUfg79PFOiwl3cTGJZToyA+m90evw==
X-Received: by 2002:a05:6a20:c89c:b0:1af:fff4:6000 with SMTP id adf61e73a8af0-1affff460acmr23706598637.20.1716194124766;
        Mon, 20 May 2024 01:35:24 -0700 (PDT)
Received: from localhost ([122.172.82.13])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0c13692asm198417105ad.252.2024.05.20.01.35.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 May 2024 01:35:24 -0700 (PDT)
Date: Mon, 20 May 2024 14:05:22 +0530
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
Subject: Re: [PATCH 2/2] cpufreq: sun50i: replace of_node_put() with
 automatic cleanup handler
Message-ID: <20240520083522.vvga3aqjg4w3adkj@vireshk-i7>
References: <20240503-sun50i-cpufreq-nvmem-cleanup-v1-0-0a2352cac46b@gmail.com>
 <20240503-sun50i-cpufreq-nvmem-cleanup-v1-2-0a2352cac46b@gmail.com>
 <20240510184213.68f92cab@donnerap.manchester.arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240510184213.68f92cab@donnerap.manchester.arm.com>

On 10-05-24, 18:42, Andre Przywara wrote:
> On Fri, 03 May 2024 19:52:33 +0200
> Javier Carrasco <javier.carrasco.cruz@gmail.com> wrote:
> > Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
> 
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>
> 
> I haven't tested the error paths yet, but it certainly boots fine on an
> OrangePi Zero3.
> 
> > ---
> >  drivers/cpufreq/sun50i-cpufreq-nvmem.c | 25 ++++++++-----------------
> >  1 file changed, 8 insertions(+), 17 deletions(-)
> > 
> > diff --git a/drivers/cpufreq/sun50i-cpufreq-nvmem.c b/drivers/cpufreq/sun50i-cpufreq-nvmem.c
> > index ef83e4bf2639..eb47c193269c 100644
> > --- a/drivers/cpufreq/sun50i-cpufreq-nvmem.c
> > +++ b/drivers/cpufreq/sun50i-cpufreq-nvmem.c
> > @@ -131,14 +131,14 @@ static const struct of_device_id cpu_opp_match_list[] = {
> >  static bool dt_has_supported_hw(void)
> >  {
> >  	bool has_opp_supported_hw = false;
> > -	struct device_node *np;
> >  	struct device *cpu_dev;
> >  
> >  	cpu_dev = get_cpu_device(0);
> >  	if (!cpu_dev)
> >  		return false;
> >  
> > -	np = dev_pm_opp_of_get_opp_desc_node(cpu_dev);
> > +	struct device_node *np __free(device_node) =
> > +		dev_pm_opp_of_get_opp_desc_node(cpu_dev);

Won't that result in build warning, mixed code and definitions now ?


-- 
viresh
