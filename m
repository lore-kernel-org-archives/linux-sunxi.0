Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89A1E39FD6
	for <linux-sunxi@lists.linux.dev>; Thu, 25 Apr 2024 05:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714021712; cv=none; b=uXjPn4HIhaiOR+molgHxMW/b95PtPMdbqUedRP73UZ5uGRLrpJnvfiqiRzfM2Odm2kxL1zno9f2KDXItNKEhjbcRepnLbSzJOFF415SU0VpdA664t8QaxI5j+qsmp6iczdbwSVixswbSyexbefn87RLwDbzbnmzHbNgygu1R9nY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714021712; c=relaxed/simple;
	bh=N4Ty+El9tAcjw3QBXTN044KOd3tT2Ym9s58oTkqWx9s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Uv4dh9mNitzVkxSKC/6fwyzlIKijglsd/mZ6iiM/x2KkYl/4PVmdLHd11wCNPR6vw7Cw0yZ+iU4zIy1e7VNuSxlSt+ar0hvWFvkSF4ZVeKj46SBJnKdnrt4l480Gwz/+Rc/KyTSkjn+6vN2trwwPJuXJBr221hW/MNgnkN1LV/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vRBbbXmt; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vRBbbXmt"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1e4266673bbso4794615ad.2
        for <linux-sunxi@lists.linux.dev>; Wed, 24 Apr 2024 22:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714021711; x=1714626511; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qrmw5y3+0dGAzUFADTeqpuhqYtgOQVDO3UIxdvuDfY8=;
        b=vRBbbXmtgk6wEtC6e9OmRqiLyLekuethH5PaqXF1WgpSOaPYLKj0yc+SQrZX82MAlY
         qXWApZiCqVjgEPNYaGxUcubg4IV068m8/hkBeNSVBwArzK0tSMRh11mlu1GK5UGDI2Du
         tVkURgpWyzj+/Lrya7yjOOnQIZdbWQdZnxr3Taarv3ynCTZnoc8eV2As3p0yCF9AvXcO
         nN4BYNPcKxWZUF9baXcU3+1ydJ8yilXgQVD83HwaKJESBp9oV/WXI33Z8Nw6aSLiJ2Nq
         +G5rDNTfA7QrafCs3nri1tODFqMNPLanWzrr/Gk9DQgfUziTr+ec23TJYGk87EBUiSA+
         nWDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714021711; x=1714626511;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qrmw5y3+0dGAzUFADTeqpuhqYtgOQVDO3UIxdvuDfY8=;
        b=BI8nEeIfO0EvKFbKx/TS0szqlLmVXZnti0gZpBwDxxMRzDb6AeoSi/C2M8HTgJfDQu
         yVxR6pE0nBLYZw/A1GcvhlsLQlgQ3jMikiq36dcb1FTHL1F5anR5mEcOrsoN95RZ40ql
         FJSSmLUtdzoA3eLLv1osSRMaLOmpLIJtAj8d76QY1seB6WOh62ciw8L9OWKMKtCcFjmI
         QMSD3AI4mRa/BKEn62OE4h//7dyjcpMRitHKWNrVdxijQ8BOP2X8g8kvg2UZE/XXxE36
         pyx2nSrIpnsVbOpQ2xTnahcREZJ5bLzmGkB4CR0dPLR8sbxLYiBr9uDF6SVsPxIhgmNs
         ArUQ==
X-Forwarded-Encrypted: i=1; AJvYcCUzq6cV+rcgFGXmEU3q05zeSnIsJwEtFcVMurXv4reCJ19ROHjrXpjJK7IQ3jBTPza/qZYL6vFY7b+3OjhYKMtLUuYVzd9BcHxqutU=
X-Gm-Message-State: AOJu0YxsRCOVK2sc5K5H9db+KD+kRbE02Le1RnqRj9cz3Ld/CcI6GFFS
	eZAH/QvpcTkYLyFFjh36jAk1LdDkoloUu6oaD9ePiQp0mNVpQF5RlQirpikWov8=
X-Google-Smtp-Source: AGHT+IH96vmh25j6BBEQazt7ICu3yODBTiA7HitL6kUOUPKSDrXvwY+WRBVCOtppGPgOl5/xC362JA==
X-Received: by 2002:a17:903:41cf:b0:1e3:e1e8:bb5 with SMTP id u15-20020a17090341cf00b001e3e1e80bb5mr6077593ple.28.1714021710657;
        Wed, 24 Apr 2024 22:08:30 -0700 (PDT)
Received: from localhost ([122.172.87.52])
        by smtp.gmail.com with ESMTPSA id y17-20020a17090322d100b001e5572a99c3sm12756023plg.207.2024.04.24.22.08.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Apr 2024 22:08:30 -0700 (PDT)
Date: Thu, 25 Apr 2024 10:38:28 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Andre Przywara <andre.przywara@arm.com>,
	Yangtao Li <tiny.windzz@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] cpufreq: sun50i: fix error returns in
 dt_has_supported_hw()
Message-ID: <20240425050828.iqs7cjslxvb2fzn5@vireshk-i7>
References: <9bfe5703-b39b-4d98-9995-f6a7d0ea558d@moroto.mountain>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9bfe5703-b39b-4d98-9995-f6a7d0ea558d@moroto.mountain>

On 24-04-24, 14:40, Dan Carpenter wrote:
> The dt_has_supported_hw() function returns type bool.  That means these
> negative error codes are cast to true but the function should return
> false instead.
> 
> Fixes: fa5aec9561cf ("cpufreq: sun50i: Add support for opp_supported_hw")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/cpufreq/sun50i-cpufreq-nvmem.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied. Thanks.

-- 
viresh
