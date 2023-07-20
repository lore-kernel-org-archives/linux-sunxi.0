Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C08617732
	for <linux-sunxi@lists.linux.dev>; Thu, 20 Jul 2023 10:32:38 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-668711086f4so453278b3a.1
        for <linux-sunxi@lists.linux.dev>; Thu, 20 Jul 2023 03:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689849158; x=1690453958;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xKYUhMR1McdxFbQ4Jo6vuraMtMWIn8Z/zfmypgVmrcY=;
        b=tsOv8B+/t6cC16KWe9C2LxhDAI52NK3+hCr2mhHy5psUUZT826eCwd0faElZmDomg0
         0/Y+6a0X0EEP9f65G9w8lUZ4z1aJnul16vxYroSnBn3wp0JL6VoO/O4+YaAIlTZh7ykD
         sKWBQlvf+BfY7AjSscbM+8n0s4UNALx9dAaJcpE+L7a3LJ6lgUCGJFAAITJ4SRbGpLui
         yG/8PMQ5m5cUfX8a74aBl7ael2RjuPY8gZc1IGHKmtdSoLfDPfjqL8Mv7huSICRu2CBF
         lQGvwGcwQXhtPUHuei6DelkyV1gyZGQQx+CBv3g/dLxOn8uWkiUMOhW4HCCrSLLejbOP
         NFiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689849158; x=1690453958;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xKYUhMR1McdxFbQ4Jo6vuraMtMWIn8Z/zfmypgVmrcY=;
        b=kinNLBFvJpUmo0s8okf3WE7KCzaVksJsuWdITinfgUCXc+tdrZbwIXq1p5tyvTIw3K
         lvtrMvaf2yelNR6BqUJVKw4k2Y2RfE99GRkQ8JQ3fR6FOrwh1od8c4NNUEm7UOgl4Brb
         sXuk6YVxvUrFdtSxJlOBxGU3XOVnPw4TbqmHoPWrVOYpq289kMAkOBd0ldjTGhpQc8Ew
         FfWuU8lv8HBFJpFqZBhDYvlAsUjRJ41fRl++co7TnBNknRre+zFG2e2UN7PqMKNsDhNG
         tb+Cr+7Muen3fZHGjdKbdtaFz7Chrz1/XEPPmOPCFkVMnr5tkZnJCkKgtvZQpSjscI1i
         ON1A==
X-Gm-Message-State: ABy/qLYyvc3gwD5leMkSOw8+qj11n9jhadzvdT1gpeh5jrbA2OLz9mmG
	nqn8ygd0xwiOFV7m6qL1BTXEhg==
X-Google-Smtp-Source: APBJJlFPGHydCjtzxTJZnytC6CyFKFv8hJWClYfqDJkKXIBvrrDMTEHas0e4QsNhT7++H33b2LhJ3g==
X-Received: by 2002:a05:6a21:3291:b0:132:7d91:aadb with SMTP id yt17-20020a056a21329100b001327d91aadbmr6219794pzb.6.1689849157754;
        Thu, 20 Jul 2023 03:32:37 -0700 (PDT)
Received: from localhost ([122.172.87.195])
        by smtp.gmail.com with ESMTPSA id m7-20020aa79007000000b006636c4f57a6sm861335pfo.27.2023.07.20.03.32.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jul 2023 03:32:37 -0700 (PDT)
Date: Thu, 20 Jul 2023 16:02:35 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Yangtao Li <frank.li@vivo.com>
Cc: Yangtao Li <tiny.windzz@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 01/19] cpufreq: sun50i: Convert to platform remove
 callback returning void
Message-ID: <20230720103235.ao3664ibqjksun5u@vireshk-i7>
References: <20230712093322.37322-1-frank.li@vivo.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230712093322.37322-1-frank.li@vivo.com>

On 12-07-23, 17:33, Yangtao Li wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
> 
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
> 
> Cc: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---
>  drivers/cpufreq/sun50i-cpufreq-nvmem.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)

Applied all the patches. Thanks.

-- 
viresh
