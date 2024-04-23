Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCDAA224F2
	for <linux-sunxi@lists.linux.dev>; Tue, 23 Apr 2024 06:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713852779; cv=none; b=dL0OuxRUJFGU9rT7MyIC9Mrb1M3eAJzGuzjYubmlzg66MKdsZkUBvTJOUs9K8K114DZMEgZW/4GdpSNQ0RRBgn8YGJypwnQUZes+jDjfb1+97OcitVWwJTZTSPv5GDjLmylyOOZVX2P9BgiXalJFOlbrtWoGmswiGJ/vQZQvaLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713852779; c=relaxed/simple;
	bh=M2JXIn03F7/QSf+dBvEbYBl2M3pS0JqlWeKIyakpfqo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jz5l+OToUZX8VsPoEBelPytl1Wzg1jLKnofIYYGiOM1X+BiiO8Oel5LSmiIarPzYfM6eHD23Em00tR1PPa4bgiIxtAC3USoYCRa39byanGCclCpEI8r8RhbxFfE7ggReW6Re4ZYOp1foK0EvKEh3SIe3Y4YjozKUaaVam2r7Mic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JLnwQtoj; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JLnwQtoj"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-6edc61d0ff6so5220583b3a.2
        for <linux-sunxi@lists.linux.dev>; Mon, 22 Apr 2024 23:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713852777; x=1714457577; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PegfXTHjFM9RFqoVlG6Hw8mcJ5lOawWkximGpqrPUKo=;
        b=JLnwQtojj/zHCiccVhfQfixGTAlowcxao51ONdkYdRBcrLp+ESBMxbTlZRU9NT+Oba
         8D+DtYGA7RYPiVtp93PeOkcfZ4tjSmXsW419/PhBHBz8bzdeAl77JT+y6t+R/zSbjEKn
         kdKyjqWVho9Rk/4t1rCBqcpGWCR6xFxryRNzlgTxQqBokGe9RLKyU5X9SyUjXWGOVTpX
         1/ydSNBmbkSDtkmTvArcML9JrVfk8e+mkOhWlT0ITONiTujyuLCzyHYwFtK0HAWfNKfe
         VKgPBG+iquNhGudfqzW4cALUeFcQDpLGO1lKGkQJRGJD7mZi5ZPPAGE4vETc+xKQAXN7
         BdZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713852777; x=1714457577;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PegfXTHjFM9RFqoVlG6Hw8mcJ5lOawWkximGpqrPUKo=;
        b=kQ+xR3oj2+JVws/YHEeW5JEzCttfxO/M8y4zzfJNLT+Tnm7xtGyeB49vmzMVtr6pYH
         sUaWvJeMpUXtNOpSA0Ni+A/4W7pUERY4lzeBL9xohLBinYadEN83HH5MvT89vaWJNyfC
         VmTeYyhL4uhYcEsiJxC9QyFcIpjuXmWDgOHa/PgDl7bLeAlQ9cBZNvAGfeJE0rA/q13d
         7xpT3u42HdRVuLCDGWnzZVTLPzTSlP6P73YKa3OLmy9V4MVGi1hKSfDqqgMC1CzRp4AQ
         NQ1LMQsgsHUWHO0kexYzfpM1mxn5F8af1EMjzewchtptEPCMvUL7fuJGphiUMRXYYEmH
         6IvA==
X-Forwarded-Encrypted: i=1; AJvYcCUeMpydkpkDqNFHhCPFona/NYkj2KixXUVg+nj77Y2BD7EbU3r3kwSywqGHLo7sgb/PTV57H9d+QyzEqP5mMs6cexKFfn6932RvYNQ=
X-Gm-Message-State: AOJu0YzRmCOOGjJz5w87NYMyzEqW9O+SBoWrGDjqS9iEWIY1OH5CTfSN
	Z24bu4PNiNzazW4QfGXA+eICks86n2XDehIbj2Va7XLJxhsuOmbFtOx7pS3I8Oc=
X-Google-Smtp-Source: AGHT+IGUw/otBatPf+zILKW7L7JHzdCQoAVgJpbhjmlDG/lbtxa2H+ZKe1feDHWuNTXxbhpg0ZR54w==
X-Received: by 2002:a05:6a20:da8c:b0:1a7:ad53:d3a3 with SMTP id iy12-20020a056a20da8c00b001a7ad53d3a3mr17586950pzb.35.1713852776820;
        Mon, 22 Apr 2024 23:12:56 -0700 (PDT)
Received: from localhost ([122.172.87.52])
        by smtp.gmail.com with ESMTPSA id fn22-20020a056a002fd600b006edbcfe7005sm9139811pfb.144.2024.04.22.23.12.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Apr 2024 23:12:55 -0700 (PDT)
Date: Tue, 23 Apr 2024 11:42:53 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Julian Calaby <julian.calaby@gmail.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Yangtao Li <tiny.windzz@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	kernel test robot <lkp@intel.com>,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] cpufreq: sun50i: Fix build warning around snprint()
Message-ID: <20240423061253.blyfuqasyiatm5sa@vireshk-i7>
References: <285de20a187f3e4baeb28f639b5bf55e914a3821.1713756666.git.viresh.kumar@linaro.org>
 <CAGRGNgWHkVkOP13jh-w1KQYeR_yeq1JgOt9a+R40F8DGYKMtkg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGRGNgWHkVkOP13jh-w1KQYeR_yeq1JgOt9a+R40F8DGYKMtkg@mail.gmail.com>

On 23-04-24, 11:38, Julian Calaby wrote:
> On Mon, Apr 22, 2024 at 1:31 PM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> > diff --git a/drivers/cpufreq/sun50i-cpufreq-nvmem.c b/drivers/cpufreq/sun50i-cpufreq-nvmem.c
> > index 30e5c337611c..cd50cea16a87 100644
> > --- a/drivers/cpufreq/sun50i-cpufreq-nvmem.c
> > +++ b/drivers/cpufreq/sun50i-cpufreq-nvmem.c
> > @@ -208,7 +206,7 @@ static int sun50i_cpufreq_get_efuse(void)
> >  static int sun50i_cpufreq_nvmem_probe(struct platform_device *pdev)
> >  {
> >         int *opp_tokens;
> > -       char name[MAX_NAME_LEN];
> > +       char name[] = "speedXXXXXXXXXXX"; /* Integers can take 11 chars max */
> 
> Would it make sense to just set a static length for the string here,
> say 17-20 characters and add a comment explaining the number, say: /*
> "speed" + 11 chars for the int */
> 
> The string constant, while it'll probably be optimised away, seems
> weird and wasteful.

The counting goes wrong (I have done it in the past) sometimes and so
I like to explicitly reserve space like this, it also makes it look
cleaner, i.e. how the eventual string will be named.

-- 
viresh
