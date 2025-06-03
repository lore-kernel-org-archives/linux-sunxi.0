Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5EA51E5B71
	for <linux-sunxi@lists.linux.dev>; Tue,  3 Jun 2025 17:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748972931; cv=none; b=l1+TWm0YpNznyrioFcG6X7WIcfqk4lrQfB2QGo/vmbRjvXDr7yKbv7qnlFriNlx4P6nAifLZOdJzp1dlHdMrTa03bXUK6Scx6egkxw4JLSLZJmKuPVMaBAu5genpMpcwpn8r7+0645wHBWa+DYjHlYK4Zif9M610H/xqYZ869Hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748972931; c=relaxed/simple;
	bh=eEBuMoSNI7au+HNe76KotnFGWKYETVSxnFoLxaa7t74=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QJR+T33+v0fXypW8wptVrlCilzZm7Yp2xVMb/yoiSlo1z2+jfUlFQc1u4sb3mWP68UfcSHKrpK4aQh6NnnOj17yETN8Q3MPTm+lTPNoECj9uSCFITTyZxckErmUOT8GLaNZYKKsIgQ4Hqf2Z+gbIiViIEhHOuiP1fDVZj8BJ5bY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tQmBroi6; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tQmBroi6"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-231e98e46c0so53965265ad.3
        for <linux-sunxi@lists.linux.dev>; Tue, 03 Jun 2025 10:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748972929; x=1749577729; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AZQvVO8nyC+ZKLyjCrtVBxSwB/yFvzMpPXbPJR/HF0A=;
        b=tQmBroi6V0Dm8V9MfjJJugiylr+ag8W4fMNEKp9CYXblSqsvkzeXOlFcFH/+MP9BKk
         IaCvbWmNUTF1APaanSJ3hqnxEE3DEZxSA8s0wWBKdDAAdfImjOv2hwAXXqlYGTUIUGHj
         MDzhgIsWVyVmjW9vl+UhSMrJ8Mwk0l+/47rcmnuJo8Xh0HcU0GUs364IeH5uI9Zz58tp
         e4FVmnNUlA+DR08aJnacxj5KpWklLg/vflibEwXRr6jO6l2mzdf2pALxd/RR2RzBnL/q
         tNXuE54dMzmyZO0M2bfNePeNaAHtUTWSbiY4296I3KiT+bvhgV3ayHSv8qn9FEuMDIEZ
         I72w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748972929; x=1749577729;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AZQvVO8nyC+ZKLyjCrtVBxSwB/yFvzMpPXbPJR/HF0A=;
        b=P3CR6Lx9g1lfPCQtSYeG30UCPz9niPnwExZJJKho8+wZCLkGrHFTiV66UrJUkb8sBw
         eVL1dO1ZMzPdfWAH8YvJKH2hJHCwIDaJ8Wzu5W/ElHfB6a0fqoJ14pQmDwrxLHLz7Qp6
         giiC0pdTeOy69ZZOvBWNo/RL7w8NX3BBfCQebaHbEabVlynDcIMB1oRMJlg+wSCiqAA/
         IF3Qx5JGfP072h7e3epZmZ/nKZlGN4z1zs6Ufgy9X7Z6sWFVrpPKFehM3i9wwgcmqhvS
         Nd45/aqAOAt61UAgLCfeQRzU9becE1THwtt3zyn4n0L0VssYDkzj6DU2AwA74bW6Bmys
         f4PQ==
X-Forwarded-Encrypted: i=1; AJvYcCXwcLhU40xsoU0u5IUTIUHb5zKJ0BxQ0gC3OAv6/ReC8kQfkpAlY0L3On5mtRSwpZmoLzuG1O2A8TOHAA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyc0aNaOMy37vK44jcpgJzZmixY7f6G7OBDVTvjvcV0sSxu/0GY
	54bcUCfGLsFb+EUIwd/wgRGWYBsckICqHZ5Fkh4mMjum/PmMVniF1lH16V5eXTLDiQ==
X-Gm-Gg: ASbGncu5PY7aNyFieTGkuknHSfz92rrgztbN5B48E6Acw1+Upk5UgzmUY8ajH4EYwiS
	QufpiohhodOD71jgjBFFQxaVORM/Gw/s0BeXtF09Gt05Qhs3zjZh4kMNhHncvON2j0dOLsjvDsu
	FdSCz+y0zmAvTP88GaQBWeuadBT2WRHha8BWFxJqtcIebdCJRZB8dcWVXMzQv+GO4oF6EwEf52R
	KZ/cBiwimz+AvUTrxxeQlR+jPWnjJs5XXQLGOhhx7KwmyG7YXBGJN54kGGGLmn6SQbS1/AfK8qz
	ln25A5JQiFYObQuI8UumnkBcE9fkJunRTdZQsuTPYItfWwf4q0glbkbAGVkstwt7DcsfoXR2J7A
	6oWJUThnsO5WGD+TfiFA5NAnxeWs=
X-Google-Smtp-Source: AGHT+IFw/hM9KjB2+YIvlfPv7TCR6YjgHHZTSPyy4qbS7jSH9/Uc2dPgZocX8nOAauHg/zfpx7Iegw==
X-Received: by 2002:a17:903:234f:b0:234:98eb:8eda with SMTP id d9443c01a7336-2355f762d1amr220323805ad.28.1748972928721;
        Tue, 03 Jun 2025 10:48:48 -0700 (PDT)
Received: from google.com (128.65.83.34.bc.googleusercontent.com. [34.83.65.128])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506bc95fcsm89801555ad.11.2025.06.03.10.48.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 10:48:48 -0700 (PDT)
Date: Tue, 3 Jun 2025 10:48:44 -0700
From: William McVicker <willmcvicker@google.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: tglx@linutronix.de, Jim Cromie <jim.cromie@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	Marco Elver <elver@google.com>, Nam Cao <namcao@linutronix.de>,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org, John Stulz <jstultz@google.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Saravan Kanna <saravanak@google.com>
Subject: Re: [PATCH v1 1/7] clocksource/drivers/scx200: Add module owner
Message-ID: <aD81fLvQQOBd7cot@google.com>
References: <20250602151853.1942521-1-daniel.lezcano@linaro.org>
 <20250602151853.1942521-2-daniel.lezcano@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250602151853.1942521-2-daniel.lezcano@linaro.org>

On 06/02/2025, Daniel Lezcano wrote:
> The conversion to modules requires a correct handling of the module
> refcount in order to prevent to unload it if it is in use. That is
> especially true with the clockevents where there is no function to
> unregister them.
> 
> The core time framework correctly handles the module refcount with the
> different clocksource and clockevents if the module owner is set.
> 
> Add the module owner to make sure the core framework will prevent
> stupid things happening when the driver will be converted into a
> module.
> 
> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>

Reviewed-by: Will McVicker <willmcvicker@google.com>

Thanks,
Will

> ---
>  drivers/clocksource/scx200_hrt.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/clocksource/scx200_hrt.c b/drivers/clocksource/scx200_hrt.c
> index c3536fffbe9a..5a99801a1657 100644
> --- a/drivers/clocksource/scx200_hrt.c
> +++ b/drivers/clocksource/scx200_hrt.c
> @@ -52,6 +52,7 @@ static struct clocksource cs_hrt = {
>  	.mask		= CLOCKSOURCE_MASK(32),
>  	.flags		= CLOCK_SOURCE_IS_CONTINUOUS,
>  	/* mult, shift are set based on mhz27 flag */
> +	.owner		= THIS_MODULE,
>  };
>  
>  static int __init init_hrt_clocksource(void)
> -- 
> 2.43.0
> 
