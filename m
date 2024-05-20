Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 386CE468E
	for <linux-sunxi@lists.linux.dev>; Mon, 20 May 2024 09:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716197562; cv=none; b=D1mxh1r6SFglKQjIhrIOLFG+/49iGBkkT1Fi3q8+ZKpFCvzxRuwN+RRbZhH9eAc+Cd0K/FU7eXl51kxZOt8WqROwV1vLTFF3M92fXrlDYu9YieKAvDjhP1dSmlyxrPu698KvBQ9tqrQSFRsOeLtMq7zgyoj+AiyCIU+t2ed8GS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716197562; c=relaxed/simple;
	bh=6qqAt+q020TEX/srbVeaNcplSl/KDDH8/TynN7XepB4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oKbH8p/UQJF1ApFoQE6U5b6Se1HTfHtEwIgUkyn3lwUcY6orbSYNirnt0imyqJRLuGXtcjoSSEl7LC6g6BDWM6VegKehSCdFp9m7e0yijJV9QmICUe5q2P/rfDr69SjlLK/DtFnu0lEcFGW5zlhc9h3Ud2NklyWBGBWfis4pMCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UhtPd8re; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UhtPd8re"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-6f6a045d476so29974b3a.1
        for <linux-sunxi@lists.linux.dev>; Mon, 20 May 2024 02:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716197560; x=1716802360; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VHjDhF8zKcuH4KaZDrxu/GGnpHyFrMbNt+nqVfo/Ty0=;
        b=UhtPd8re0tAi89zekYZxsND72GYmjrh1MWq/gng+Om1N1MByfSEgH3P4WHYzcZ/ksJ
         6mq96ceO2nniU7SOtHDSxh3DUsXKXBmf+jda0D+XbMKLnpM71boJovJ06TAdM7ytRf/A
         e1hByLbOMcI6Ck274r5PfiUm9sW+mSFLbhZe7Aduk5JTbm6+zHncRVtgcY4I0q7QZf3s
         JdRe7+kmEPiQZVXkxZsUhY/LRRRPvTehAKiHlxqt114o5qKzfv5lYAIXacHzpKFziZ4y
         rqRhi3F0WpINPXgMF1hcstQs05VeL+t+msbcSRci7WawH6qqWU6w4iWY2q3kXJYOXUuk
         lFLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716197560; x=1716802360;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VHjDhF8zKcuH4KaZDrxu/GGnpHyFrMbNt+nqVfo/Ty0=;
        b=YAiM17ljJjM5QcCkZRvkxOqEHsys+s5RoObAYSxud3oEmKo1n3c9D56V6RwHzkH7FH
         vSq4VOi8r3H24p+FXRkTBAXXSpNDePMHNAlzMyFSCR7LNk+ab6zDzr8Qw70Rif/VgaO0
         +qKp4hXNQ5AFph5UEx1Piy2nLG8c9yc5nWWom3IltfgCptyeneGut2dlxOA5T2rEDIXy
         slmiMZc15uDCyukhj4uWwZN/2pMsCCmxkEN1JGueFFXXxWHAtNGPBBOZy/p4xzbus72b
         sxMJHyW1b+og2YLtbrINp0w9h2zdTczGLp1vp2r8FVmqoWvkRtgpA8JSu9w9xZkXwTfd
         bo3A==
X-Forwarded-Encrypted: i=1; AJvYcCV1iYUB5neqKoYMMZJI/9z+89qACXqM2QkCF0XqF24KIZ7C+vRN2Hfbwl7dzeKp9qTe0NpCqFTMXDf1Ri3MQKCRr2pLu1TvJxpGfww=
X-Gm-Message-State: AOJu0YyVkVBvX7Otue99XWrDqq6DtjeMgtmi2Mj9qIDSgMyrYYaJ4Mm6
	RxJjXhV0Z4q8TgtfTN/jYg7k8k/aCOxZGXXb2WQaM/PeD8bD4s2Voq1aqkZnAXw=
X-Google-Smtp-Source: AGHT+IFa8g+pCvcfTr1oEO5S4AwyMh2Iyy71hR8SjL5gaoTIDdRqmSgGKDGc01l9L6eqB0yM0+XG+g==
X-Received: by 2002:a05:6a00:3a01:b0:6ed:5f64:2ff4 with SMTP id d2e1a72fcca58-6f4e02af0d1mr31874819b3a.14.1716197560387;
        Mon, 20 May 2024 02:32:40 -0700 (PDT)
Received: from localhost ([122.172.82.13])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-65e149dd925sm5500703a12.58.2024.05.20.02.32.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 May 2024 02:32:39 -0700 (PDT)
Date: Mon, 20 May 2024 15:02:37 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: Yangtao Li <tiny.windzz@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] cpufreq: sun50i: fix memory leak and remove
 of_node_put()
Message-ID: <20240520093237.fucml6sp2ziygyav@vireshk-i7>
References: <20240503-sun50i-cpufreq-nvmem-cleanup-v1-0-0a2352cac46b@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240503-sun50i-cpufreq-nvmem-cleanup-v1-0-0a2352cac46b@gmail.com>

On 03-05-24, 19:52, Javier Carrasco wrote:
> This series fixes a memory leak by means of the _scoped version of the
> for_each_child_of_node() loop, which was recently introduced with
> 34af4554fb0c ("of: Introduce for_each_*_child_of_node_scoped() to
> automate of_node_put() handling").
> 
> The new approach is still not widely used, but this might be a good
> occasion to use it in a driver because it actually fixes a bug, and
> the loop is rather simple.
> 
> The creator of the new macro was added to the discussion in case the
> new approach is still not mature enough, even for such simple case.
> 
> Additionally, the existing uses of of_node_put() have been removed to
> favour the _free() cleanup handler, which reduces the chances of having
> any other memory leak because some of_node_put() is missing as well as
> simplifies the current code.
> 
> I don't have the real hardware to test the series, so I "faked" the node
> in a device tree for an arm64 device (Rockchip) and hacked the driver
> to get to run dt_has_supported_hw(). The new implementation works as
> expected, but if someone wants to test it with the proper SoC,
> additional tests are always welcome. The same applies for the removals
> of of_node_put().
> 
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
> ---
> Javier Carrasco (2):
>       cpufreq: sun50i: fix memory leak in dt_has_supported_hw()
>       cpufreq: sun50i: replace of_node_put() with automatic cleanup handler

Applied. Thanks.

-- 
viresh
