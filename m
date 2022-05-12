Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68EA217D2
	for <linux-sunxi@lists.linux.dev>; Thu, 12 May 2022 04:58:42 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id 137so3587678pgb.5
        for <linux-sunxi@lists.linux.dev>; Wed, 11 May 2022 21:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ErqlXMxsgK7yCFG6lNBZLZgbpPk48RSq5t5z+i3RrBY=;
        b=I4HSGvVZpiJju4H5OMsPtbA9DtO2CjqO3h2k5csWGcyqeF8BYuFBqauOvVXGzfpyQR
         wUEwkFzQuJ4hJ8AucFlc8BXxlDLZ9PI08MzJ90z/qYWVRp37p1PgMElypW5Ja8uE6eD2
         G2DA5GKpAntnvoUiwb1jDKaOPVwjKGIiSinGZ1RBUF8sNRPLen4KhhAa9tL7KE+rub0t
         rtlVg8f5+3AKxWZudYt8xKNMg9GTIwMqWFnD8EkCuWg2O2nSfQeRxECNDSHbKRGf6yHw
         vRjQePoqwsncI/OKKErD4V8LyxpUHNQPuVL56493v0nqdhuatkKr1QIrlx92/ctFMXy5
         kxEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ErqlXMxsgK7yCFG6lNBZLZgbpPk48RSq5t5z+i3RrBY=;
        b=zQy5olNNnJlWsGiZgcba+vK3TdxiQr7nTs7dleGP/kSOKmy8+PZl8A9gWYyemG+5NL
         jjyx8omw9/Zm4LDYooEFoDzU2Sfbxos4//uZ3fxS649aqNXLs7wbQN03LMrZsvqI80JH
         SCKDiZJNcQQyrFchbe08hIXwsphL9f4/lp86AYLrbgP9AqFz+rqF2LyMbCB5UMR+f7Pv
         rFinKkQLwKdla4U2OUhSFwpGRKOumcxrDoAaJUWkJVc1AenV/ZXQwlBH3MQ5jQpFRMN8
         zVeWtlUedRfYeBaE1iQZsLqluMMYOVRUs6UBj3PhEiOz7I4ZNkgFFOg9r49vOCa+bENs
         FysQ==
X-Gm-Message-State: AOAM532Dc981ifN0M1TudgeG1X1UAiCaQSOjPig9Biq7+luXcGYYowFE
	B4C/g1HJf4nlY7tCHlYoB2S+Fg==
X-Google-Smtp-Source: ABdhPJxSWG6Ni3heLb0dW/eT5ONTwV8LPdGJoxslPRH7AXjlht+Ss33xUfIjA6l/N0Sz/GmoxMk5Kg==
X-Received: by 2002:a63:91c2:0:b0:3c6:24ac:9246 with SMTP id l185-20020a6391c2000000b003c624ac9246mr23842185pge.298.1652331521807;
        Wed, 11 May 2022 21:58:41 -0700 (PDT)
Received: from localhost ([122.162.234.2])
        by smtp.gmail.com with ESMTPSA id o23-20020a17090a5b1700b001d94c194a67sm830528pji.18.2022.05.11.21.58.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 May 2022 21:58:40 -0700 (PDT)
Date: Thu, 12 May 2022 10:28:38 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: qianfan <qianfanguijin@163.com>
Cc: Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>,
	linux-sunxi@lists.linux.dev, Rob Herring <robh+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH v2] drivers: cpufreq: sun8i-r40: Add cpufreq support
Message-ID: <20220512045838.tvixosxbey5ksp6j@vireshk-i7>
References: <20220510003611.1812-1-qianfanguijin@163.com>
 <1902551.yKVeVyVuyW@kista>
 <01c2c11f-71fd-b735-b935-109865d62de5@163.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <01c2c11f-71fd-b735-b935-109865d62de5@163.com>
User-Agent: NeoMutt/20180716-391-311a52

On 12-05-22, 12:34, qianfan wrote:
> Actually I'm not make sure the difference, seems both of them can work.
> Most of allwinner device_id is added in allowlist, so I did this.

For OPP V1 the cpufreq device isn't created by default and hence the allowlist
allows us to know the devices for which the device shall be created.

For OPP V2, we have the compatible string available and with help of that we
create a device without need of any entry to any list. The blocklist however
allows us to skip creating the device for some platforms, which don't want it.

As your case is opp-v2 and you want the device, you aren't required to add entry
anywhere.

-- 
viresh
