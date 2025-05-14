Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A99628DD0;
	Wed, 14 May 2025 13:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747228598; cv=none; b=CYsfQwMceG3+W2HFxrruJp6k4sQ/qCULAl6hiyaLfUhUze2hbh1uutT2d06QL8YRld34rW+ZJJOUowbStvf49TWtkZw2ZnYFY2nJyunlvFpXb1vf3zAtc2kgCUvvFBHvf+2i9y49prxxFjEJaIOp5pedxc3POduzAAylhrmX0WM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747228598; c=relaxed/simple;
	bh=3mdJiBencSNxta3dyF8z2OWbBuH6yjWb2HaJ34mgkI8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NAAeXAYuFBZvx640pxv1AYwoUwAhyiY1LQLHKGV7t8i11IReMWombwAUF1IHX6yLncSfKYhAZtB7JJRkTwFjtBAOc4ur+AGQ33lPgVZmVepdEr8sVpyBPskFjRlOU4AjwYT53qsNNs5uNs2Y+zHbRVlTx+cBeZaGlyBK2LYbjVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d3HtkqZd; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d3HtkqZd"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-442e9c00bf4so20473285e9.3;
        Wed, 14 May 2025 06:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747228594; x=1747833394; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6Tc/4nqMXEbm8d6EyQQLonLFnqiRqlfA73rzExd6DXQ=;
        b=d3HtkqZdgqCKDREd0RvH8jHBUIq0rvZJ+MJyKSrRmvk2KYLRxr4qhNaIgP7/SvBqUD
         it7A95BG3rxPIFXaafXLBvQFpcThbEEFi5z4zD3eQFPH8BTWUJaEvd1/fG7yvj2rEOr2
         HYNIb8g3o7WymevQjvDLNbfWkSbSV6SuWc0ckR4zMnGT2N5u2vsY3E1z60XFYE0oIRRK
         3NRZuo1NjTFfV1kFerqsqyZkHX2aLL5Por7sf29sQKyRBviX4F/aCY2pPJrgZk0AKTTQ
         Az5tm1oLEwTLMnTrAg2NX4MGLj1B3fPCQlFNIO3hHcRPd5Mn3yhCcFYZ1APOfdf3V8LW
         Qb6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747228594; x=1747833394;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6Tc/4nqMXEbm8d6EyQQLonLFnqiRqlfA73rzExd6DXQ=;
        b=MfJzzYMpfuESYeiL422+WNDUQYurdcENc2cZYY9fjaZIFvRBnx6Ye2xfYEfImDmLe3
         opKDqmm5WgsinyFVbSIX1GTQ1JO2OqHrFc9G8O/thKPsIZndN7zb0WGvFNY2xS6myv/F
         X1Amhlg06WqwmvqrccYF5l6yHa9JJlaSplqvtjM5zfUvXBL1UAOvwe4BsRkxFqZHuL7g
         ATDWheX4IPpTo2rezLjXMYLiMYENG1TxatlmXSBFiXzgBOn4DV+i4icU4X+noftFzex3
         VSd8ablmt3EIaZZoAhmVKslIjcibrb4mwK1MYYo9UJwJ4wAa17FbfMlsxRgdS40iApA5
         HWLg==
X-Forwarded-Encrypted: i=1; AJvYcCVA+Nx3jHoXfmq+04vo3h5u9mMKZ0Giw9fHC9TqUoKkJDTufubZ/x9hrTJYyxHvh5FkYRyD5Ds1f4rSQn3LLg==@lists.linux.dev, AJvYcCX6WdN4Puc4c+w005v++wCl/RXWJjKanSMg3JUZdgSGiAx9zuTFINgE6zmAqvBLrgyo6C5sIb7oFR39Ug==@lists.linux.dev
X-Gm-Message-State: AOJu0YyPksJyoX1lYz42ZvWKEUhp1cJm+ucGVdgkEyoItkHYCqQfQ1XQ
	UFqvWem9S4wY5hIEpmw0aUFbDa2C1ndi7/MOozKfpGbWDwArYuvJ
X-Gm-Gg: ASbGncvZg9hqk5H/v7+S3VghTgtdYyFJV2kebVEGL6iAwt4aUkDPq4wstjQFPs2YMrW
	mdyNt4nxvZDSDgU0czz76qsSHCHkeGKjrD9zG9EjxQAOt1Gf0wNIt2qjSlhZDck56DkekHUN5oT
	Gvuu3T1fzN43tRf+nqjLIh5+Mnh6I7VId0GfKHAX7Vy5xrcYfqpB+Wu5ZNf5ugvAM0S/RMloOke
	WOzWQZ+bMN7ul2HRICDYN8pMruwvhS3SPvH+U81Qc5BnuQSHXf2S9TQNFnG2v0+gAaKZlM4NXlC
	DDTDnUtChzEjFTKjaTk73R6b44EHPNfpnVI74Jp9MBHuUgNEpd0=
X-Google-Smtp-Source: AGHT+IE8pnOYRJ/c4cfBs063yTkYwwC4PzsQ7cS9MN+l+gs9yIacFQxXiJfgdSPWX+aNftsTNP45Cw==
X-Received: by 2002:a05:600c:524c:b0:442:e9eb:1b48 with SMTP id 5b1f17b1804b1-442f215f1cbmr26898775e9.24.1747228594244;
        Wed, 14 May 2025 06:16:34 -0700 (PDT)
Received: from Red ([2a01:cb1d:898:ab00:4a02:2aff:fe07:1efc])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-442f3979275sm30575305e9.34.2025.05.14.06.16.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 06:16:33 -0700 (PDT)
Date: Wed, 14 May 2025 15:16:31 +0200
From: Corentin Labbe <clabbe.montjoie@gmail.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: Chanwoo Choi <chanwoo@kernel.org>,
	MyungJoo Ham <myungjoo.ham@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2] PM / devfreq: sun8i-a33-mbus: Simplify by using more
 devm functions
Message-ID: <aCSXr-Hdisg-7jEd@Red>
References: <20250513203908.205060-2-u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250513203908.205060-2-u.kleine-koenig@baylibre.com>

Le Tue, May 13, 2025 at 10:39:02PM +0200, Uwe Kleine-König a écrit :
> MIME-Version: 1.0
> Content-Type: text/plain; charset=UTF-8
> Content-Transfer-Encoding: 8bit
> 
> Use devm allocators for enabling the bus clock and
> clk_rate_exclusive_get(). This simplifies error handling and the remove
> callback.
> 
> Reviewed-by: Chen-Yu Tsai <wens@csie.org>
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
> ---

Tested-by: Corentin LABBE <clabbe.montjoie@gmail.com>
Tested-on: sun8i-a33-olinuxino

Thanks
Regards
